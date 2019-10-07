Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F89CE1B3
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfJGM3q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 08:29:46 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47974 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbfJGM3p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 08:29:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CTd5A092228;
        Mon, 7 Oct 2019 07:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451379;
        bh=KWT9j+QacvjVEBtE+hjvy3qdfIygfB4NgnQaBBRf21w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IxuYlVjB1sRkwp3e9rNKfqASkNDHvJ0VbKo6k4PD55oB0XcESmqcddvSbzseiKXY/
         EI7Pn+eVGc06tR88RZ2xkvhWnFcGuAGigXi8hWYberH1ahf181/fjKA20ZV3cf7XYX
         FJpvBOwHVNoEAs5GnmauXmPrc5EGYLtX2mmh+87I=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CTdFd069561
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:29:39 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:29:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:29:36 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CTYe7066760;
        Mon, 7 Oct 2019 07:29:37 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/3] bus: ti-sysc: drop the extra hardreset during init
Date:   Mon, 7 Oct 2019 15:29:30 +0300
Message-ID: <20191007122931.18668-3-t-kristo@ti.com>
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

There seems to be unnecessary extra hardreset line toggling applied
during module init. This is unnecessary, as the reset lines are already
asserted during boot, and it can cause certain modules to hang (iommus,
remoteprocs.) Remove the extra hardreset toggle, and remove the now
redundant function to handle this also.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/bus/ti-sysc.c | 37 +------------------------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index c9d01e2d3a64..6f392469d5b0 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1518,37 +1518,6 @@ static int sysc_legacy_init(struct sysc *ddata)
 	return error;
 }
 
-/**
- * sysc_rstctrl_reset_deassert - deassert rstctrl reset
- * @ddata: device driver data
- * @reset: reset before deassert
- *
- * A module can have both OCP softreset control and external rstctrl.
- * If more complicated rstctrl resets are needed, please handle these
- * directly from the child device driver and map only the module reset
- * for the parent interconnect target module device.
- *
- * Automatic reset of the module on init can be skipped with the
- * "ti,no-reset-on-init" device tree property.
- */
-static int sysc_rstctrl_reset_deassert(struct sysc *ddata, bool reset)
-{
-	int error;
-
-	if (!ddata->rsts)
-		return 0;
-
-	if (reset) {
-		error = reset_control_assert(ddata->rsts);
-		if (error)
-			return error;
-	}
-
-	reset_control_deassert(ddata->rsts);
-
-	return 0;
-}
-
 /*
  * Note that the caller must ensure the interconnect target module is enabled
  * before calling reset. Otherwise reset will not complete.
@@ -1613,10 +1582,6 @@ static int sysc_init_module(struct sysc *ddata)
 	int error = 0;
 	bool manage_clocks = true;
 
-	error = sysc_rstctrl_reset_deassert(ddata, false);
-	if (error)
-		return error;
-
 	if (ddata->cfg.quirks &
 	    (SYSC_QUIRK_NO_IDLE | SYSC_QUIRK_NO_IDLE_ON_INIT))
 		manage_clocks = false;
@@ -1640,7 +1605,7 @@ static int sysc_init_module(struct sysc *ddata)
 		goto err_opt_clocks;
 
 	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
-		error = sysc_rstctrl_reset_deassert(ddata, true);
+		error = reset_control_deassert(ddata->rsts);
 		if (error)
 			goto err_main_clocks;
 	}
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
