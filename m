Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99362B486
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 14:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfE0MON (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 08:14:13 -0400
Received: from muru.com ([72.249.23.125]:51148 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbfE0MON (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 May 2019 08:14:13 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 675F980F3;
        Mon, 27 May 2019 12:14:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 02/12] bus: ti-sysc: Make OCP reset work for sysstatus and sysconfig reset bits
Date:   Mon, 27 May 2019 05:13:38 -0700
Message-Id: <20190527121348.45251-3-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527121348.45251-1-tony@atomide.com>
References: <20190527121348.45251-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We've had minimal OCP softreset support in ti-sysc interconnect target
module driver only used for MCAN driver so far. But it turns out that
MCAN has the sysstatus register resetdone bit inverted compared to most
other modules.

Let's make OCP softreset work for other typical cases with reset status
in sysstatus or sysconfig register so we can use the new functions for
sysc_enable_module() and sysc_disable_module() without "ti,hwmods"
property in the following patches.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 72 ++++++++++++++++++++-------
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -139,6 +139,26 @@ static u32 sysc_read_revision(struct sysc *ddata)
 	return sysc_read(ddata, offset);
 }
 
+static u32 sysc_read_sysconfig(struct sysc *ddata)
+{
+	int offset = ddata->offsets[SYSC_SYSCONFIG];
+
+	if (offset < 0)
+		return 0;
+
+	return sysc_read(ddata, offset);
+}
+
+static u32 sysc_read_sysstatus(struct sysc *ddata)
+{
+	int offset = ddata->offsets[SYSC_SYSSTATUS];
+
+	if (offset < 0)
+		return 0;
+
+	return sysc_read(ddata, offset);
+}
+
 static int sysc_add_named_clock_from_child(struct sysc *ddata,
 					   const char *name,
 					   const char *optfck_name)
@@ -1356,34 +1376,49 @@ static int sysc_rstctrl_reset_deassert(struct sysc *ddata, bool reset)
 	return reset_control_deassert(ddata->rsts);
 }
 
+/*
+ * Note that the caller must ensure the interconnect target module is enabled
+ * before calling reset. Otherwise reset will not complete.
+ */
 static int sysc_reset(struct sysc *ddata)
 {
-	int offset = ddata->offsets[SYSC_SYSCONFIG];
-	int val;
+	int sysc_offset, syss_offset, sysc_val, rstval, quirks, error = 0;
+	u32 sysc_mask, syss_done;
+
+	sysc_offset = ddata->offsets[SYSC_SYSCONFIG];
+	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
+	quirks = ddata->cfg.quirks;
 
-	if (ddata->legacy_mode || offset < 0 ||
+	if (ddata->legacy_mode || sysc_offset < 0 ||
+	    ddata->cap->regbits->srst_shift < 0 ||
 	    ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)
 		return 0;
 
-	/*
-	 * Currently only support reset status in sysstatus.
-	 * Warn and return error in all other cases
-	 */
-	if (!ddata->cfg.syss_mask) {
-		dev_err(ddata->dev, "No ti,syss-mask. Reset failed\n");
-		return -EINVAL;
-	}
+	sysc_mask = BIT(ddata->cap->regbits->srst_shift);
 
-	val = sysc_read(ddata, offset);
-	val |= (0x1 << ddata->cap->regbits->srst_shift);
-	sysc_write(ddata, offset, val);
+	if (ddata->cfg.quirks & SYSS_QUIRK_RESETDONE_INVERTED)
+		syss_done = 0;
+	else
+		syss_done = ddata->cfg.syss_mask;
+
+	sysc_val = sysc_read_sysconfig(ddata);
+	sysc_val |= sysc_mask;
+	sysc_write(ddata, sysc_offset, sysc_val);
 
 	/* Poll on reset status */
-	offset = ddata->offsets[SYSC_SYSSTATUS];
+	if (syss_offset >= 0) {
+		error = readx_poll_timeout(sysc_read_sysstatus, ddata, rstval,
+					   (rstval & ddata->cfg.syss_mask) ==
+					   syss_done,
+					   100, MAX_MODULE_SOFTRESET_WAIT);
+
+	} else if (ddata->cfg.quirks & SYSC_QUIRK_RESET_STATUS) {
+		error = readx_poll_timeout(sysc_read_sysconfig, ddata, rstval,
+					   !(rstval & sysc_mask),
+					   100, MAX_MODULE_SOFTRESET_WAIT);
+	}
 
-	return readl_poll_timeout(ddata->module_va + offset, val,
-				  (val & ddata->cfg.syss_mask) == 0x0,
-				  100, MAX_MODULE_SOFTRESET_WAIT);
+	return error;
 }
 
 /*
@@ -2086,6 +2121,7 @@ static const struct sysc_capabilities sysc_dra7_mcan = {
 	.type = TI_SYSC_DRA7_MCAN,
 	.sysc_mask = SYSC_DRA7_MCAN_ENAWAKEUP | SYSC_OMAP4_SOFTRESET,
 	.regbits = &sysc_regbits_dra7_mcan,
+	.mod_quirks = SYSS_QUIRK_RESETDONE_INVERTED,
 };
 
 static int sysc_init_pdata(struct sysc *ddata)
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -47,6 +47,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSS_QUIRK_RESETDONE_INVERTED	BIT(14)
 #define SYSC_QUIRK_SWSUP_MSTANDBY	BIT(13)
 #define SYSC_QUIRK_SWSUP_SIDLE_ACT	BIT(12)
 #define SYSC_QUIRK_SWSUP_SIDLE		BIT(11)
-- 
2.21.0
