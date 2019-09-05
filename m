Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237F1AA560
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 16:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfIEOD4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 10:03:56 -0400
Received: from muru.com ([72.249.23.125]:59720 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbfIEOD4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Sep 2019 10:03:56 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CA4C5810D;
        Thu,  5 Sep 2019 14:04:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] bus: ti-sysc: Fix clock handling for no-idle quirks
Date:   Thu,  5 Sep 2019 07:03:37 -0700
Message-Id: <20190905140337.19373-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

NFSroot can fail on dra7 when cpsw is probed using ti-sysc interconnect
target module driver as reported by Keerthy.

Device clocks and the interconnect target module may or may not be
enabled by the bootloader on init, but we currently assume the clocks
and module are on from the bootloader for "ti,no-idle" and
"ti,no-idle-on-init" quirks as reported by Grygorii Strashko.

Let's fix the issue by always enabling clocks init, and
never disable them for "ti,no-idle" quirk. For "ti,no-idle-on-init"
quirk, we must decrement the usage count later on to allow PM
runtime to idle the module if requested.

Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to read revision")
Cc: Keerthy <j-keerthy@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Reported-by: Keerthy <j-keerthy@ti.com>
Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 48 +++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1632,17 +1632,19 @@ static int sysc_init_module(struct sysc *ddata)
 	if (error)
 		return error;
 
-	if (manage_clocks) {
-		sysc_clkdm_deny_idle(ddata);
+	sysc_clkdm_deny_idle(ddata);
 
-		error = sysc_enable_opt_clocks(ddata);
-		if (error)
-			return error;
+	/*
+	 * Always enable clocks. The bootloader may or may not have enabled
+	 * the related clocks.
+	 */
+	error = sysc_enable_opt_clocks(ddata);
+	if (error)
+		return error;
 
-		error = sysc_enable_main_clocks(ddata);
-		if (error)
-			goto err_opt_clocks;
-	}
+	error = sysc_enable_main_clocks(ddata);
+	if (error)
+		goto err_opt_clocks;
 
 	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
 		error = sysc_rstctrl_reset_deassert(ddata, true);
@@ -1660,7 +1662,7 @@ static int sysc_init_module(struct sysc *ddata)
 			goto err_main_clocks;
 	}
 
-	if (!ddata->legacy_mode && manage_clocks) {
+	if (!ddata->legacy_mode) {
 		error = sysc_enable_module(ddata->dev);
 		if (error)
 			goto err_main_clocks;
@@ -1677,6 +1679,7 @@ static int sysc_init_module(struct sysc *ddata)
 	if (manage_clocks)
 		sysc_disable_main_clocks(ddata);
 err_opt_clocks:
+	/* No re-enable of clockdomain autoidle to prevent module autoidle */
 	if (manage_clocks) {
 		sysc_disable_opt_clocks(ddata);
 		sysc_clkdm_allow_idle(ddata);
@@ -2357,6 +2360,28 @@ static void ti_sysc_idle(struct work_struct *work)
 
 	ddata = container_of(work, struct sysc, idle_work.work);
 
+	/*
+	 * One time decrement of clock usage counts if left on from init.
+	 * Note that we disable opt clocks unconditionally in this case
+	 * as they are enabled unconditionally during init without
+	 * considering sysc_opt_clks_needed() at that point.
+	 */
+	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE |
+				 SYSC_QUIRK_NO_IDLE_ON_INIT)) {
+		sysc_clkdm_deny_idle(ddata);
+		sysc_disable_main_clocks(ddata);
+		sysc_disable_opt_clocks(ddata);
+		sysc_clkdm_allow_idle(ddata);
+	}
+
+	/* Keep permanent PM runtime usage count for SYSC_QUIRK_NO_IDLE */
+	if (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE)
+		return;
+
+	/*
+	 * Decrement PM runtime usage count for SYSC_QUIRK_NO_IDLE_ON_INIT
+	 * and SYSC_QUIRK_NO_RESET_ON_INIT
+	 */
 	if (pm_runtime_active(ddata->dev))
 		pm_runtime_put_sync(ddata->dev);
 }
@@ -2445,7 +2470,8 @@ static int sysc_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&ddata->idle_work, ti_sysc_idle);
 
 	/* At least earlycon won't survive without deferred idle */
-	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE_ON_INIT |
+	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE |
+				 SYSC_QUIRK_NO_IDLE_ON_INIT |
 				 SYSC_QUIRK_NO_RESET_ON_INIT)) {
 		schedule_delayed_work(&ddata->idle_work, 3000);
 	} else {
-- 
2.23.0
