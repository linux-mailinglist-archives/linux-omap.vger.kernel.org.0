Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C78538FA8E
	for <lists+linux-omap@lfdr.de>; Tue, 25 May 2021 08:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhEYGNR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 May 2021 02:13:17 -0400
Received: from muru.com ([72.249.23.125]:60040 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230406AbhEYGNQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 May 2021 02:13:16 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 09706807E;
        Tue, 25 May 2021 06:11:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCHv3] bus: ti-sysc: Fix am335x resume hang for usb otg module
Date:   Tue, 25 May 2021 09:11:42 +0300
Message-Id: <20210525061142.28794-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On am335x, suspend and resume only works once, and the system hangs if
suspend is attempted again. However, turns out suspend and resume works
fine multiple times if the USB OTG driver for musb controller is loaded.

The issue is caused my the interconnect target module losing context
during suspend, and it needs a restore on resume to be reconfigure again
as debugged earlier by Dave Gerlach <d-gerlach@ti.com>.

There are also other modules that need a restore on resume, like gpmc as
noted by Dave. So let's add a common way to restore an interconnect
target module based on a quirk flag. For now, let's enable the quirk for
am335x otg only to fix the suspend and resume issue.

As gpmc is not causing hangs based on tests with BeagleBone, let's patch
gpmc separately. For gpmc, we also need a hardware reset done before
restore according to Dave.

To reinit the modules, we decouple system suspend from PM runtime. We
replace calls to pm_runtime_force_suspend() and pm_runtime_force_resume()
with direct calls to internal functions and rely on the driver internal
state. There no point trying to handle complex system suspend and resume
quirks via PM runtime.

This is issue should have already been noticed with commit 1819ef2e2d12
("bus: ti-sysc: Use swsup quirks also for am335x musb") when quirk
handling was added for am335x otg for swsup. But the issue went unnoticed
as having musb driver loaded hides the issue, and suspend and resume works
once without the driver loaded.

Fixes: 1819ef2e2d12 ("bus: ti-sysc: Use swsup quirks also for am335x musb")
Suggested-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v2:
- Initialize error to 0 as noted by kernel test robot <lkp@intel.com>

Changes since v1:
- Add separate sysc_reinit_module() so also cpu_pm can eventually use it

---
 drivers/bus/ti-sysc.c                 | 53 +++++++++++++++++++++++++--
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1334,6 +1334,34 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 	return error;
 }
 
+static int sysc_reinit_module(struct sysc *ddata, bool leave_enabled)
+{
+	struct device *dev = ddata->dev;
+	int error;
+
+	/* Disable target module if it is enabled */
+	if (ddata->enabled) {
+		error = sysc_runtime_suspend(dev);
+		if (error)
+			dev_warn(dev, "reinit suspend failed: %i\n", error);
+	}
+
+	/* Enable target module */
+	error = sysc_runtime_resume(dev);
+	if (error)
+		dev_warn(dev, "reinit resume failed: %i\n", error);
+
+	if (leave_enabled)
+		return error;
+
+	/* Disable target module if no leave_enabled was set */
+	error = sysc_runtime_suspend(dev);
+	if (error)
+		dev_warn(dev, "reinit suspend failed: %i\n", error);
+
+	return error;
+}
+
 static int __maybe_unused sysc_noirq_suspend(struct device *dev)
 {
 	struct sysc *ddata;
@@ -1344,12 +1372,18 @@ static int __maybe_unused sysc_noirq_suspend(struct device *dev)
 	    (SYSC_QUIRK_LEGACY_IDLE | SYSC_QUIRK_NO_IDLE))
 		return 0;
 
-	return pm_runtime_force_suspend(dev);
+	if (!ddata->enabled)
+		return 0;
+
+	ddata->needs_resume = 1;
+
+	return sysc_runtime_suspend(dev);
 }
 
 static int __maybe_unused sysc_noirq_resume(struct device *dev)
 {
 	struct sysc *ddata;
+	int error = 0;
 
 	ddata = dev_get_drvdata(dev);
 
@@ -1357,7 +1391,19 @@ static int __maybe_unused sysc_noirq_resume(struct device *dev)
 	    (SYSC_QUIRK_LEGACY_IDLE | SYSC_QUIRK_NO_IDLE))
 		return 0;
 
-	return pm_runtime_force_resume(dev);
+	if (ddata->cfg.quirks & SYSC_QUIRK_REINIT_ON_RESUME) {
+		error = sysc_reinit_module(ddata, ddata->needs_resume);
+		if (error)
+			dev_warn(dev, "noirq_resume failed: %i\n", error);
+	} else if (ddata->needs_resume) {
+		error = sysc_runtime_resume(dev);
+		if (error)
+			dev_warn(dev, "noirq_resume failed: %i\n", error);
+	}
+
+	ddata->needs_resume = 0;
+
+	return error;
 }
 
 static const struct dev_pm_ops sysc_pm_ops = {
@@ -1468,7 +1514,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000050,
 		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("usb_otg_hs", 0, 0, 0x10, -ENODEV, 0x4ea2080d, 0xffffffff,
-		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
+		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY |
+		   SYSC_QUIRK_REINIT_ON_RESUME),
 	SYSC_QUIRK("wdt", 0, 0, 0x10, 0x14, 0x502a0500, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_WDT),
 	/* PRUSS on am3, am4 and am5 */
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -50,6 +50,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_QUIRK_REINIT_ON_RESUME	BIT(27)
 #define SYSC_QUIRK_GPMC_DEBUG		BIT(26)
 #define SYSC_MODULE_QUIRK_ENA_RESETDONE	BIT(25)
 #define SYSC_MODULE_QUIRK_PRUSS		BIT(24)
-- 
2.31.1
