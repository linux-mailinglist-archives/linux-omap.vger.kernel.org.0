Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B861BDD44
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 15:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgD2NN4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 09:13:56 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45766 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgD2NN4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 09:13:56 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TDDqaO079285;
        Wed, 29 Apr 2020 08:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588166032;
        bh=WAwJPUEsvRIGbauTlzB4xBlvt1ziGLojSfqmSIjh9wI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FgOMJVzeHlZW+CuzVvYZoaOQhizLe9JIB67W0ciczcDLSXvqS9pSYRC5pCpPrZuVv
         q/gpzuxn0AeFBIaGsLkMoG9as186s5mJrttyX01psUz0MMauxs9nubyZAc0sMbVQLl
         wkkU8ISEQ4+xZaBb7Tk+EUQrZM03n9Dbn1+/SP+U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TDDq2i071512
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 08:13:52 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 08:13:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 08:13:52 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TDDjrq113387;
        Wed, 29 Apr 2020 08:13:51 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 3/3] clk: ti: omap5: Add proper parent clocks for l4-secure clocks
Date:   Wed, 29 Apr 2020 16:13:41 +0300
Message-ID: <20200429131341.4697-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429131341.4697-1-t-kristo@ti.com>
References: <20200429131341.4697-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

L4 secure clocks do not have their parents set currently, which ends
them up to the orphan clock list. Fix this by adding either l3 or l4
clock as their parent.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-54xx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
index 92bf2dda95b9..8694bc9f5fc7 100644
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -303,13 +303,13 @@ static const struct omap_clkctrl_reg_data omap5_l4per_clkctrl_regs[] __initconst
 
 static const struct
 omap_clkctrl_reg_data omap5_l4_secure_clkctrl_regs[] __initconst = {
-	{ OMAP5_AES1_CLKCTRL, NULL, CLKF_HW_SUP, "" },
-	{ OMAP5_AES2_CLKCTRL, NULL, CLKF_HW_SUP, "" },
-	{ OMAP5_DES3DES_CLKCTRL, NULL, CLKF_HW_SUP, "" },
-	{ OMAP5_FPKA_CLKCTRL, NULL, CLKF_SW_SUP, "" },
-	{ OMAP5_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
-	{ OMAP5_SHA2MD5_CLKCTRL, NULL, CLKF_HW_SUP, "" },
-	{ OMAP5_DMA_CRYPTO_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ OMAP5_AES1_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
+	{ OMAP5_AES2_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
+	{ OMAP5_DES3DES_CLKCTRL, NULL, CLKF_HW_SUP, "l4_root_clk_div" },
+	{ OMAP5_FPKA_CLKCTRL, NULL, CLKF_SW_SUP, "l4_root_clk_div" },
+	{ OMAP5_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "l4_root_clk_div" },
+	{ OMAP5_SHA2MD5_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
+	{ OMAP5_DMA_CRYPTO_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "l3_iclk_div" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
