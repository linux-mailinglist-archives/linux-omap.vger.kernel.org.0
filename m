Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5459EB0FD4
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732101AbfILN0e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38376 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732098AbfILN0d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:33 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQTon021204;
        Thu, 12 Sep 2019 08:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294789;
        bh=Atr2gt17DIkZ/xfyFREBQcV4wJqdHAnuRyN2OSnVshc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gesj7+IM71PTBUrqbvzBK+1wWWWeQ/1AQHo8VfwFkMSAHH9yUc+aYyn4Sy8aVahyd
         nng9IC2Ew9vcTgS8bxXZ+lwyqD8L4nWJO3t8c6qavVaIO8Zv7ZcxoGYzVT/ZmpduZv
         liI9uI3cSHCdWBAZMU7hyvKGgMpJYxxNBnt3BJsA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CDQTmb011681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 08:26:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:29 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvV130575;
        Thu, 12 Sep 2019 08:26:27 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 06/10] clk: ti: dra7xx: Drop idlest polling from IPU & DSP clkctrl clocks
Date:   Thu, 12 Sep 2019 16:26:09 +0300
Message-ID: <20190912132613.28093-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The IPU and DSP remote processor cores and their corresponding MMUs on
DRA7 SoCs have hardreset lines associated with them and are controlled
by a PRCM reset line each. Any clkctrl enable/disable operations cannot
be checked for module enabled/disabled status independent of the reset
operation, and this causes some unwanted timeouts in the kernel and
unbalanced states for these clocks. These details should be handled by
the driver integration code itself.

Add the CLKF_NO_IDLEST flag to both the IPU and DSP clkctrl clocks so
that these module status checks are skipped.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index b57fe09b428b..94e69cdc2bd2 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -25,7 +25,7 @@ static const struct omap_clkctrl_reg_data dra7_mpu_clkctrl_regs[] __initconst =
 };
 
 static const struct omap_clkctrl_reg_data dra7_dsp1_clkctrl_regs[] __initconst = {
-	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
+	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLEST, "dpll_dsp_m2_ck" },
 	{ 0 },
 };
 
@@ -41,7 +41,7 @@ static const struct omap_clkctrl_bit_data dra7_mmu_ipu1_bit_data[] __initconst =
 };
 
 static const struct omap_clkctrl_reg_data dra7_ipu1_clkctrl_regs[] __initconst = {
-	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP, "ipu1-clkctrl:0000:24" },
+	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP | CLKF_NO_IDLEST, "ipu1-clkctrl:0000:24" },
 	{ 0 },
 };
 
@@ -137,7 +137,7 @@ static const struct omap_clkctrl_reg_data dra7_ipu_clkctrl_regs[] __initconst =
 };
 
 static const struct omap_clkctrl_reg_data dra7_dsp2_clkctrl_regs[] __initconst = {
-	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
+	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLEST, "dpll_dsp_m2_ck" },
 	{ 0 },
 };
 
@@ -164,7 +164,7 @@ static const struct omap_clkctrl_reg_data dra7_l3main1_clkctrl_regs[] __initcons
 };
 
 static const struct omap_clkctrl_reg_data dra7_ipu2_clkctrl_regs[] __initconst = {
-	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h22x2_ck" },
+	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLEST, "dpll_core_h22x2_ck" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
