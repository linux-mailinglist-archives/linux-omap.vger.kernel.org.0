Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70329CE1B1
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbfJGM3p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 08:29:45 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44694 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJGM3p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 08:29:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CTeXE023818;
        Mon, 7 Oct 2019 07:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451380;
        bh=Fw2h1o3Q27rAtV1ZBgNrh1rdPKvZXkA0SznxBk2nGYI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MixkhmX43tUUry6e993e/Yco947fJbi1rMC19OF9pm5/zSujPfcpwYBOoHGq2mrHX
         6dOraZqOcNC6kfF8l+Dlg8/rT9RB/puZgb+vd9qAp9uU6Pk5QLGXIYoJ9qYo75QZTE
         sGwGGDT5Vd1tth1czc4GIM36ceSFNRl67fBHkI30=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CTdwq069570
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:29:40 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:29:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:29:39 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CTYe8066760;
        Mon, 7 Oct 2019 07:29:38 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] bus: ti-sysc: avoid toggling power state of module during probe
Date:   Mon, 7 Oct 2019 15:29:31 +0300
Message-ID: <20191007122931.18668-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007122931.18668-1-t-kristo@ti.com>
References: <20191007122931.18668-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Current implementation for ti-sysc powers down the module once module
init is complete. However, right after power is disabled, it is enabled
via runtime PM. This is unnecessary so avoid it by re-ordering the
events a bit; move powering down of the module post runtime PM enable
which makes sure the use counts are maintained properly and there is
no extra power down/up sequence for the module.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/bus/ti-sysc.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 6f392469d5b0..5b69457fa857 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1580,11 +1580,6 @@ static int sysc_reset(struct sysc *ddata)
 static int sysc_init_module(struct sysc *ddata)
 {
 	int error = 0;
-	bool manage_clocks = true;
-
-	if (ddata->cfg.quirks &
-	    (SYSC_QUIRK_NO_IDLE | SYSC_QUIRK_NO_IDLE_ON_INIT))
-		manage_clocks = false;
 
 	error = sysc_clockdomain_init(ddata);
 	if (error)
@@ -1617,28 +1612,32 @@ static int sysc_init_module(struct sysc *ddata)
 	if (ddata->legacy_mode) {
 		error = sysc_legacy_init(ddata);
 		if (error)
-			goto err_main_clocks;
+			goto err_reset;
 	}
 
 	if (!ddata->legacy_mode) {
 		error = sysc_enable_module(ddata->dev);
 		if (error)
-			goto err_main_clocks;
+			goto err_reset;
 	}
 
 	error = sysc_reset(ddata);
 	if (error)
 		dev_err(ddata->dev, "Reset failed with %d\n", error);
 
-	if (!ddata->legacy_mode && manage_clocks)
+	if (error && !ddata->legacy_mode)
 		sysc_disable_module(ddata->dev);
 
+err_reset:
+	if (error && !(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT))
+		reset_control_assert(ddata->rsts);
+
 err_main_clocks:
-	if (manage_clocks)
+	if (error)
 		sysc_disable_main_clocks(ddata);
 err_opt_clocks:
 	/* No re-enable of clockdomain autoidle to prevent module autoidle */
-	if (manage_clocks) {
+	if (error) {
 		sysc_disable_opt_clocks(ddata);
 		sysc_clkdm_allow_idle(ddata);
 	}
@@ -2411,9 +2410,16 @@ static int sysc_probe(struct platform_device *pdev)
 		goto unprepare;
 	}
 
-	/* Balance reset counts */
-	if (ddata->rsts)
-		reset_control_assert(ddata->rsts);
+	/* Balance use counts as PM runtime should have enabled these all */
+	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT))
+		reset_control_assert(ddata->rsts);
+
+	if (!(ddata->cfg.quirks &
+	      (SYSC_QUIRK_NO_IDLE | SYSC_QUIRK_NO_IDLE_ON_INIT))) {
+		sysc_disable_main_clocks(ddata);
+		sysc_disable_opt_clocks(ddata);
+		sysc_clkdm_allow_idle(ddata);
+	}
 
 	sysc_show_registers(ddata);
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
