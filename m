Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 586BB84BF3
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 14:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387936AbfHGMqn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 08:46:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41258 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387845AbfHGMqn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 08:46:43 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77CkfSv013152;
        Wed, 7 Aug 2019 07:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565182001;
        bh=6j1tOWSB2UPgBl42npaD6Kf9DQxoOqSNF3OrDL024iw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=aSwBKfGp1HOoYHwfIjeet7kcE/DmNvsL3bMsOIHG1wmq8EIZji+mAfUjettcDGuPi
         cVyyx8wyM+eXxRftD2MpZorNJ1zjfgtMV96PH5aD8/s7G/KnfMhkZQ7G9pQeeisv0G
         lwHABsJlbHWeSojgtR/uRQ2H95s0PEkYUd9qqXv4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77CkfFO046199
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 07:46:41 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 07:46:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 07:46:41 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77CkVoK016945;
        Wed, 7 Aug 2019 07:46:39 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] bus: ti-sysc: allow reset sharing across devices
Date:   Wed, 7 Aug 2019 15:46:05 +0300
Message-ID: <1565181965-21039-4-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565181965-21039-1-git-send-email-t-kristo@ti.com>
References: <1565181965-21039-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some devices need to share their reset signals, like DSP MMUs, thus drop
the exclusive notation from reset request. Also, balance the init time
reset count, otherwise the resets will never be applied post boot.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/bus/ti-sysc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index e08125a..b30eb05 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -502,7 +502,7 @@ static void sysc_clkdm_allow_idle(struct sysc *ddata)
 static int sysc_init_resets(struct sysc *ddata)
 {
 	ddata->rsts =
-		devm_reset_control_get_optional(ddata->dev, "rstctrl");
+		devm_reset_control_get_optional_shared(ddata->dev, "rstctrl");
 	if (IS_ERR(ddata->rsts))
 		return PTR_ERR(ddata->rsts);
 
@@ -1527,7 +1527,7 @@ static int sysc_legacy_init(struct sysc *ddata)
  */
 static int sysc_rstctrl_reset_deassert(struct sysc *ddata, bool reset)
 {
-	int error, val;
+	int error;
 
 	if (!ddata->rsts)
 		return 0;
@@ -1538,7 +1538,9 @@ static int sysc_rstctrl_reset_deassert(struct sysc *ddata, bool reset)
 			return error;
 	}
 
-	return reset_control_deassert(ddata->rsts);
+	reset_control_deassert(ddata->rsts);
+
+	return 0;
 }
 
 /*
@@ -2418,6 +2420,10 @@ static int sysc_probe(struct platform_device *pdev)
 		goto unprepare;
 	}
 
+	/* Balance reset counts */
+	if (ddata->rsts)
+		reset_control_assert(ddata->rsts);
+
 	sysc_show_registers(ddata);
 
 	ddata->dev->type = &sysc_device_type;
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
