Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A31A2AD468
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 12:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJLGT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 06:06:19 -0500
Received: from muru.com ([72.249.23.125]:47634 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKJLGS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 06:06:18 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E5E2D80BA;
        Tue, 10 Nov 2020 11:06:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] bus: ti-sysc: Assert reset only after disabling clocks
Date:   Tue, 10 Nov 2020 13:06:11 +0200
Message-Id: <20201110110611.64983-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The rstctrl reset must be asserted after gating the module clock as
described in the TRM at least for IVA. Otherwise the rstctrl reset
done with module clock enabled can hang the system.

Note that this issue is has been only seen with related IVA changes
that we do not currently have merged. So probably no need to apply
this patch as a fix.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---

This can probably wait for merge window and be merged along with
the other genpd related changes I have been posting. At least I
have not seen this issue except with IVA resets so far.

---
 drivers/bus/ti-sysc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1222,10 +1222,10 @@ static int __maybe_unused sysc_runtime_suspend(struct device *dev)
 	ddata->enabled = false;
 
 err_allow_idle:
-	reset_control_assert(ddata->rsts);
-
 	sysc_clkdm_allow_idle(ddata);
 
+	reset_control_assert(ddata->rsts);
+
 	return error;
 }
 
@@ -1945,6 +1945,7 @@ static int sysc_reset(struct sysc *ddata)
  */
 static int sysc_init_module(struct sysc *ddata)
 {
+	bool rstctrl_deasserted = false;
 	int error = 0;
 
 	error = sysc_clockdomain_init(ddata);
@@ -1969,6 +1970,7 @@ static int sysc_init_module(struct sysc *ddata)
 		error = reset_control_deassert(ddata->rsts);
 		if (error)
 			goto err_main_clocks;
+		rstctrl_deasserted = true;
 	}
 
 	ddata->revision = sysc_read_revision(ddata);
@@ -1978,13 +1980,13 @@ static int sysc_init_module(struct sysc *ddata)
 	if (ddata->legacy_mode) {
 		error = sysc_legacy_init(ddata);
 		if (error)
-			goto err_reset;
+			goto err_main_clocks;
 	}
 
 	if (!ddata->legacy_mode) {
 		error = sysc_enable_module(ddata->dev);
 		if (error)
-			goto err_reset;
+			goto err_main_clocks;
 	}
 
 	error = sysc_reset(ddata);
@@ -1994,10 +1996,6 @@ static int sysc_init_module(struct sysc *ddata)
 	if (error && !ddata->legacy_mode)
 		sysc_disable_module(ddata->dev);
 
-err_reset:
-	if (error && !(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT))
-		reset_control_assert(ddata->rsts);
-
 err_main_clocks:
 	if (error)
 		sysc_disable_main_clocks(ddata);
@@ -2008,6 +2006,10 @@ static int sysc_init_module(struct sysc *ddata)
 		sysc_clkdm_allow_idle(ddata);
 	}
 
+	if (error && rstctrl_deasserted &&
+	    !(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT))
+		reset_control_assert(ddata->rsts);
+
 	return error;
 }
 
@@ -2975,9 +2977,6 @@ static int sysc_probe(struct platform_device *pdev)
 	}
 
 	/* Balance use counts as PM runtime should have enabled these all */
-	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT))
-		reset_control_assert(ddata->rsts);
-
 	if (!(ddata->cfg.quirks &
 	      (SYSC_QUIRK_NO_IDLE | SYSC_QUIRK_NO_IDLE_ON_INIT))) {
 		sysc_disable_main_clocks(ddata);
@@ -2985,6 +2984,9 @@ static int sysc_probe(struct platform_device *pdev)
 		sysc_clkdm_allow_idle(ddata);
 	}
 
+	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT))
+		reset_control_assert(ddata->rsts);
+
 	sysc_show_registers(ddata);
 
 	ddata->dev->type = &sysc_device_type;
-- 
2.29.2
