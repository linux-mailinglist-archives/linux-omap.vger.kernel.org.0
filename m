Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0F711CD85
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfLLMvr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:51:47 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49192 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729277AbfLLMvq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:51:46 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCCphKT109106;
        Thu, 12 Dec 2019 06:51:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155103;
        bh=tHnACjGUpLKjDtCnkDo4UB7UZhykwsles7vVS+FHhIs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fKpFC6z2kDLV4o0FItSvuWBMim9vGXCFrXSwW2anxh+ktV1xIKivy7nWE3ILWgNHk
         DNg4YhlEWW7vGpXr9dP4hcyd+r8VTamAD/VXx4g4ofQJ694ojO+94Fu7lr7C2Rfa7i
         dRcLuZdeXBno13CUcoaVlGPV58LiHi0rX7FMSQ00=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCCphFN054482
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 06:51:43 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:51:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:51:43 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpWNi045158;
        Thu, 12 Dec 2019 06:51:42 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <bcousson@baylibre.com>
Subject: [PATCH 6/6] ARM: OMAP5: hwmod-data: remove OMAP5 IOMMU hwmod data
Date:   Thu, 12 Dec 2019 14:51:23 +0200
Message-ID: <20191212125123.3465-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212125123.3465-1-t-kristo@ti.com>
References: <20191212125123.3465-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

IOMMUs are now supported via ti-sysc, so the legacy hwmod data can be
removed.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 83 ----------------------
 1 file changed, 83 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
index cc5ad6acab1d..e48b09c18144 100644
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -677,71 +677,6 @@ static struct omap_hwmod omap54xx_mcpdm_hwmod = {
 };
 
 
-/*
- * 'mmu' class
- * The memory management unit performs virtual to physical address translation
- * for its requestors.
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_mmu_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_CLOCKACTIVITY |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			   SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap54xx_mmu_hwmod_class = {
-	.name = "mmu",
-	.sysc = &omap54xx_mmu_sysc,
-};
-
-static struct omap_hwmod_rst_info omap54xx_mmu_dsp_resets[] = {
-	{ .name = "mmu_cache", .rst_shift = 1 },
-};
-
-static struct omap_hwmod omap54xx_mmu_dsp_hwmod = {
-	.name		= "mmu_dsp",
-	.class		= &omap54xx_mmu_hwmod_class,
-	.clkdm_name	= "dsp_clkdm",
-	.rst_lines	= omap54xx_mmu_dsp_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap54xx_mmu_dsp_resets),
-	.main_clk	= "dpll_iva_h11x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_DSP_DSP_CLKCTRL_OFFSET,
-			.rstctrl_offs = OMAP54XX_RM_DSP_RSTCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_DSP_DSP_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* mmu ipu */
-static struct omap_hwmod_rst_info omap54xx_mmu_ipu_resets[] = {
-	{ .name = "mmu_cache", .rst_shift = 2 },
-};
-
-static struct omap_hwmod omap54xx_mmu_ipu_hwmod = {
-	.name		= "mmu_ipu",
-	.class		= &omap54xx_mmu_hwmod_class,
-	.clkdm_name	= "ipu_clkdm",
-	.rst_lines	= omap54xx_mmu_ipu_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap54xx_mmu_ipu_resets),
-	.main_clk	= "dpll_core_h22x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_IPU_IPU_CLKCTRL_OFFSET,
-			.rstctrl_offs = OMAP54XX_RM_IPU_RSTCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_IPU_IPU_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'mpu' class
  * mpu sub-system
@@ -1303,14 +1238,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__l3_main_1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> mmu_dsp */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mmu_dsp = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_mmu_dsp_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* mpu -> l3_main_1 */
 static struct omap_hwmod_ocp_if omap54xx_mpu__l3_main_1 = {
 	.master		= &omap54xx_mpu_hwmod,
@@ -1335,14 +1262,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> mmu_ipu */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__mmu_ipu = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_mmu_ipu_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_3 */
 static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l3_main_3 = {
 	.master		= &omap54xx_l3_main_1_hwmod,
@@ -1675,7 +1594,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l4_wkup__counter_32k,
 	&omap54xx_l4_cfg__dma_system,
 	&omap54xx_l4_abe__dmic,
-	&omap54xx_l4_cfg__mmu_dsp,
 	&omap54xx_l3_main_2__dss,
 	&omap54xx_l3_main_2__dss_dispc,
 	&omap54xx_l3_main_2__dss_dsi1_a,
@@ -1684,7 +1602,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_2__dss_rfbi,
 	&omap54xx_mpu__emif1,
 	&omap54xx_mpu__emif2,
-	&omap54xx_l3_main_2__mmu_ipu,
 	&omap54xx_l4_wkup__kbd,
 	&omap54xx_l4_abe__mcpdm,
 	&omap54xx_l4_cfg__mpu,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
