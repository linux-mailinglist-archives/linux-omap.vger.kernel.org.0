Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5089511CD83
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbfLLMvq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:51:46 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33162 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729244AbfLLMvo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:51:44 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpgJ4042292;
        Thu, 12 Dec 2019 06:51:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155102;
        bh=7Pu2Rw8bMwPn39DS0Vo9UroAA0vBhw1LWwnqjEokdtg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RhsyYoUs25VsJPUKtrvAk/uEOpob4xn0Py4JnP+BwoRuVTGIrC0tJpG97Q5yqePVp
         1e+qct8vCGYalvu4pDuXjQfBkQgg+H4psDgq2fuDkp5nWuhJHbbUJaoTiKHdhvSxu2
         iV6gK6icHoqJKsBZ83LSsyHIi7zavKw001jSyxfE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpgxP017628;
        Thu, 12 Dec 2019 06:51:42 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:51:41 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:51:41 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpWNh045158;
        Thu, 12 Dec 2019 06:51:40 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <bcousson@baylibre.com>
Subject: [PATCH 5/6] ARM: OMAP4: hwmod-data: remove OMAP4 IOMMU hwmod data
Date:   Thu, 12 Dec 2019 14:51:22 +0200
Message-ID: <20191212125123.3465-6-t-kristo@ti.com>
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
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 87 ----------------------
 1 file changed, 87 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
index 292f544bd62d..8196c5b3e736 100644
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -1303,91 +1303,6 @@ static struct omap_hwmod omap44xx_mcpdm_hwmod = {
 	},
 };
 
-/*
- * 'mmu' class
- * The memory management unit performs virtual to physical address translation
- * for its requestors.
- */
-
-static struct omap_hwmod_class_sysconfig mmu_sysc = {
-	.rev_offs	= 0x000,
-	.sysc_offs	= 0x010,
-	.syss_offs	= 0x014,
-	.sysc_flags	= (SYSC_HAS_CLOCKACTIVITY | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSC_HAS_AUTOIDLE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_mmu_hwmod_class = {
-	.name = "mmu",
-	.sysc = &mmu_sysc,
-};
-
-/* mmu ipu */
-
-static struct omap_hwmod omap44xx_mmu_ipu_hwmod;
-static struct omap_hwmod_rst_info omap44xx_mmu_ipu_resets[] = {
-	{ .name = "mmu_cache", .rst_shift = 2 },
-};
-
-/* l3_main_2 -> mmu_ipu */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__mmu_ipu = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_mmu_ipu_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod omap44xx_mmu_ipu_hwmod = {
-	.name		= "mmu_ipu",
-	.class		= &omap44xx_mmu_hwmod_class,
-	.clkdm_name	= "ducati_clkdm",
-	.rst_lines	= omap44xx_mmu_ipu_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap44xx_mmu_ipu_resets),
-	.main_clk	= "ducati_clk_mux_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DUCATI_DUCATI_CLKCTRL_OFFSET,
-			.rstctrl_offs = OMAP4_RM_DUCATI_RSTCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DUCATI_DUCATI_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* mmu dsp */
-
-static struct omap_hwmod omap44xx_mmu_dsp_hwmod;
-static struct omap_hwmod_rst_info omap44xx_mmu_dsp_resets[] = {
-	{ .name = "mmu_cache", .rst_shift = 1 },
-};
-
-/* l4_cfg -> dsp */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__mmu_dsp = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_mmu_dsp_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod omap44xx_mmu_dsp_hwmod = {
-	.name		= "mmu_dsp",
-	.class		= &omap44xx_mmu_hwmod_class,
-	.clkdm_name	= "tesla_clkdm",
-	.rst_lines	= omap44xx_mmu_dsp_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap44xx_mmu_dsp_resets),
-	.main_clk	= "dpll_iva_m4x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_TESLA_TESLA_CLKCTRL_OFFSET,
-			.rstctrl_offs = OMAP4_RM_TESLA_RSTCTRL_OFFSET,
-			.context_offs = OMAP4_RM_TESLA_TESLA_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'mpu' class
  * mpu sub-system
@@ -3012,8 +2927,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_2__iva,
 	&omap44xx_l4_wkup__kbd,
 	&omap44xx_l4_abe__mcpdm,
-	&omap44xx_l3_main_2__mmu_ipu,
-	&omap44xx_l4_cfg__mmu_dsp,
 	&omap44xx_l3_main_2__ocmc_ram,
 	&omap44xx_l4_cfg__ocp2scp_usb_phy,
 	&omap44xx_mpu_private__prcm_mpu,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
