Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A98E1E9A22
	for <lists+linux-omap@lfdr.de>; Sun, 31 May 2020 21:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgEaTkP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 31 May 2020 15:40:15 -0400
Received: from muru.com ([72.249.23.125]:56398 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbgEaTkO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 31 May 2020 15:40:14 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0AAE2813D;
        Sun, 31 May 2020 19:41:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit
Date:   Sun, 31 May 2020 12:39:38 -0700
Message-Id: <20200531193941.13179-3-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531193941.13179-1-tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some modules reset automatically when idled, and when re-enabled, we must
wait for the automatic OCP softreset to complete. And if optional clocks
are configured, we need to keep the clocks on while waiting for the reset
to complete.

Let's fix the issue by moving the OCP softreset code to a separate
function sysc_wait_softreset(), and call it also from sysc_enable_module()
with the optional clocks enabled.

This is based on what we're already doing for legacy platform data booting
in _enable_sysc().

Fixes: 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset quirk")
Reported-by: Faiz Abbas <faiz_abbas@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 81 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -221,6 +221,36 @@ static u32 sysc_read_sysstatus(struct sysc *ddata)
 	return sysc_read(ddata, offset);
 }
 
+/* Poll on reset status */
+static int sysc_wait_softreset(struct sysc *ddata)
+{
+	u32 sysc_mask, syss_done, rstval;
+	int sysc_offset, syss_offset, error = 0;
+
+	sysc_offset = ddata->offsets[SYSC_SYSCONFIG];
+	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
+	sysc_mask = BIT(ddata->cap->regbits->srst_shift);
+
+	if (ddata->cfg.quirks & SYSS_QUIRK_RESETDONE_INVERTED)
+		syss_done = 0;
+	else
+		syss_done = ddata->cfg.syss_mask;
+
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
+
+	return error;
+}
+
 static int sysc_add_named_clock_from_child(struct sysc *ddata,
 					   const char *name,
 					   const char *optfck_name)
@@ -925,8 +955,34 @@ static int sysc_enable_module(struct device *dev)
 	struct sysc *ddata;
 	const struct sysc_regbits *regbits;
 	u32 reg, idlemodes, best_mode;
+	int error;
 
 	ddata = dev_get_drvdata(dev);
+
+	/*
+	 * Some modules like DSS reset automatically on idle. Enable optional
+	 * reset clocks and wait for OCP softreset to complete.
+	 */
+	if (ddata->cfg.quirks & SYSC_QUIRK_OPT_CLKS_IN_RESET) {
+		error = sysc_enable_opt_clocks(ddata);
+		if (error) {
+			dev_err(ddata->dev,
+				"Optional clocks failed for enable: %i\n",
+				error);
+			return error;
+		}
+	}
+	error = sysc_wait_softreset(ddata);
+	if (error)
+		dev_warn(ddata->dev, "OCP softreset timed out\n");
+	if (ddata->cfg.quirks & SYSC_QUIRK_OPT_CLKS_IN_RESET)
+		sysc_disable_opt_clocks(ddata);
+
+	/*
+	 * Some subsystem private interconnects, like DSS top level module,
+	 * need only the automatic OCP softreset handling with no sysconfig
+	 * register bits to configure.
+	 */
 	if (ddata->offsets[SYSC_SYSCONFIG] == -ENODEV)
 		return 0;
 
@@ -1828,11 +1884,10 @@ static int sysc_legacy_init(struct sysc *ddata)
  */
 static int sysc_reset(struct sysc *ddata)
 {
-	int sysc_offset, syss_offset, sysc_val, rstval, error = 0;
-	u32 sysc_mask, syss_done;
+	int sysc_offset, sysc_val, error;
+	u32 sysc_mask;
 
 	sysc_offset = ddata->offsets[SYSC_SYSCONFIG];
-	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
 
 	if (ddata->legacy_mode ||
 	    ddata->cap->regbits->srst_shift < 0 ||
@@ -1841,11 +1896,6 @@ static int sysc_reset(struct sysc *ddata)
 
 	sysc_mask = BIT(ddata->cap->regbits->srst_shift);
 
-	if (ddata->cfg.quirks & SYSS_QUIRK_RESETDONE_INVERTED)
-		syss_done = 0;
-	else
-		syss_done = ddata->cfg.syss_mask;
-
 	if (ddata->pre_reset_quirk)
 		ddata->pre_reset_quirk(ddata);
 
@@ -1862,18 +1912,9 @@ static int sysc_reset(struct sysc *ddata)
 	if (ddata->post_reset_quirk)
 		ddata->post_reset_quirk(ddata);
 
-	/* Poll on reset status */
-	if (syss_offset >= 0) {
-		error = readx_poll_timeout(sysc_read_sysstatus, ddata, rstval,
-					   (rstval & ddata->cfg.syss_mask) ==
-					   syss_done,
-					   100, MAX_MODULE_SOFTRESET_WAIT);
-
-	} else if (ddata->cfg.quirks & SYSC_QUIRK_RESET_STATUS) {
-		error = readx_poll_timeout(sysc_read_sysconfig, ddata, rstval,
-					   !(rstval & sysc_mask),
-					   100, MAX_MODULE_SOFTRESET_WAIT);
-	}
+	error = sysc_wait_softreset(ddata);
+	if (error)
+		dev_warn(ddata->dev, "OCP softreset timed out\n");
 
 	if (ddata->reset_done_quirk)
 		ddata->reset_done_quirk(ddata);
-- 
2.26.2
