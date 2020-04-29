Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09531BDD46
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 15:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgD2NN4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 09:13:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37842 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgD2NN4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 09:13:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TDDpGH011386;
        Wed, 29 Apr 2020 08:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588166031;
        bh=fZ/iP6cnEiTuHev/VJT7sUmLIKv6ebhl7+OZwef0YBs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=I6a7yLDmtjH3Usg6oLpmhE3EbHkuO/cGffeEuuZEzdvROvTxA5SOpwtSVyNQTHu9d
         UboKdKl2vxKGnzWCLMWXylEZ5OPVBE9GaPkY/8yvmlP9Mk9VuL9NDvzX+1sHpIpfJn
         Ty3IHgHhcmNpSiq+hTKiDYObCA7y5B3gpfxs5ydA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TDDpkY062992
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 08:13:51 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 08:13:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 08:13:50 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TDDjrp113387;
        Wed, 29 Apr 2020 08:13:49 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 2/3] clk: ti: omap4: Add proper parent clocks for l4-secure clocks
Date:   Wed, 29 Apr 2020 16:13:40 +0300
Message-ID: <20200429131341.4697-3-t-kristo@ti.com>
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
 drivers/clk/ti/clk-44xx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ti/clk-44xx.c b/drivers/clk/ti/clk-44xx.c
index 312a20f8ec0e..a38c92153979 100644
--- a/drivers/clk/ti/clk-44xx.c
+++ b/drivers/clk/ti/clk-44xx.c
@@ -606,13 +606,13 @@ static const struct omap_clkctrl_reg_data omap4_l4_per_clkctrl_regs[] __initcons
 
 static const struct
 omap_clkctrl_reg_data omap4_l4_secure_clkctrl_regs[] __initconst = {
-	{ OMAP4_AES1_CLKCTRL, NULL, CLKF_SW_SUP, "" },
-	{ OMAP4_AES2_CLKCTRL, NULL, CLKF_SW_SUP, "" },
-	{ OMAP4_DES3DES_CLKCTRL, NULL, CLKF_SW_SUP, "" },
-	{ OMAP4_PKA_CLKCTRL, NULL, CLKF_SW_SUP, "" },
-	{ OMAP4_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
-	{ OMAP4_SHA2MD5_CLKCTRL, NULL, CLKF_SW_SUP, "" },
-	{ OMAP4_CRYPTODMA_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ OMAP4_AES1_CLKCTRL, NULL, CLKF_SW_SUP, "l3_div_ck" },
+	{ OMAP4_AES2_CLKCTRL, NULL, CLKF_SW_SUP, "l3_div_ck" },
+	{ OMAP4_DES3DES_CLKCTRL, NULL, CLKF_SW_SUP, "l4_div_ck" },
+	{ OMAP4_PKA_CLKCTRL, NULL, CLKF_SW_SUP, "l4_div_ck" },
+	{ OMAP4_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "l4_div_ck" },
+	{ OMAP4_SHA2MD5_CLKCTRL, NULL, CLKF_SW_SUP, "l3_div_ck" },
+	{ OMAP4_CRYPTODMA_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "l3_div_ck" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
