Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C10A984BF4
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 14:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387912AbfHGMqm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 08:46:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41250 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387777AbfHGMql (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 08:46:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77CkdRw013138;
        Wed, 7 Aug 2019 07:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565181999;
        bh=KAbZUDeuexNu3//QnTKuqxzTDirNtxOrFRB+0NLR58M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=SpwAvxuujfFnZjCIwg2DXQfPoUvLDNcAxj8+0G9uPd9cqOrebjl7s/vmkNszoKWaJ
         vL5gDa4h2nbFXVU0uVqhHejPQIJQOUKwhUUnpV0OHr+I3VhuO9XG8XvSVu0hzFfY8c
         DSL1yJiPfn3hRxM7TpMNOF0F/UGiWZLf1BbMBtYQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77CkcVe046188
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 07:46:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 07:46:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 07:46:38 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77CkVoJ016945;
        Wed, 7 Aug 2019 07:46:35 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] bus: ti-sysc: rework the reset handling
Date:   Wed, 7 Aug 2019 15:46:04 +0300
Message-ID: <1565181965-21039-3-git-send-email-t-kristo@ti.com>
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

If reset controllers are assigned to the ti-sysc target-module, only
ti-sysc is going to be able to control these. Thus, remove all the
disable_on_idle flag usage, and assert/de-assert the reset always
in the idle path. Otherwise the reset signal will always just be
de-asserted.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/bus/ti-sysc.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index ad9c6d3..e08125a 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -95,7 +95,6 @@ struct sysc {
 	unsigned int enabled:1;
 	unsigned int needs_resume:1;
 	unsigned int child_needs_resume:1;
-	unsigned int disable_on_idle:1;
 	struct delayed_work idle_work;
 	void (*clk_enable_quirk)(struct sysc *sysc);
 	void (*clk_disable_quirk)(struct sysc *sysc);
@@ -1031,8 +1030,7 @@ static int __maybe_unused sysc_runtime_suspend_legacy(struct device *dev,
 		dev_err(dev, "%s: could not idle: %i\n",
 			__func__, error);
 
-	if (ddata->disable_on_idle)
-		reset_control_assert(ddata->rsts);
+	reset_control_assert(ddata->rsts);
 
 	return 0;
 }
@@ -1043,8 +1041,7 @@ static int __maybe_unused sysc_runtime_resume_legacy(struct device *dev,
 	struct ti_sysc_platform_data *pdata;
 	int error;
 
-	if (ddata->disable_on_idle)
-		reset_control_deassert(ddata->rsts);
+	reset_control_deassert(ddata->rsts);
 
 	pdata = dev_get_platdata(ddata->dev);
 	if (!pdata)
@@ -1091,8 +1088,7 @@ static int __maybe_unused sysc_runtime_suspend(struct device *dev)
 	ddata->enabled = false;
 
 err_allow_idle:
-	if (ddata->disable_on_idle)
-		reset_control_assert(ddata->rsts);
+	reset_control_assert(ddata->rsts);
 
 	sysc_clkdm_allow_idle(ddata);
 
@@ -1112,8 +1108,7 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 
 	sysc_clkdm_deny_idle(ddata);
 
-	if (ddata->disable_on_idle)
-		reset_control_deassert(ddata->rsts);
+	reset_control_deassert(ddata->rsts);
 
 	if (sysc_opt_clks_needed(ddata)) {
 		error = sysc_enable_opt_clocks(ddata);
@@ -1543,14 +1538,7 @@ static int sysc_rstctrl_reset_deassert(struct sysc *ddata, bool reset)
 			return error;
 	}
 
-	error = reset_control_deassert(ddata->rsts);
-	if (error == -EEXIST)
-		return 0;
-
-	error = readx_poll_timeout(reset_control_status, ddata->rsts, val,
-				   val == 0, 100, MAX_MODULE_SOFTRESET_WAIT);
-
-	return error;
+	return reset_control_deassert(ddata->rsts);
 }
 
 /*
@@ -2449,9 +2437,6 @@ static int sysc_probe(struct platform_device *pdev)
 		pm_runtime_put(&pdev->dev);
 	}
 
-	if (!of_get_available_child_count(ddata->dev->of_node))
-		ddata->disable_on_idle = true;
-
 	return 0;
 
 err:
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
