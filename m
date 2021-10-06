Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEC2423ADA
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 11:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237988AbhJFJvN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 05:51:13 -0400
Received: from muru.com ([72.249.23.125]:41428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230131AbhJFJvK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 05:51:10 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C026C8125;
        Wed,  6 Oct 2021 09:49:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/9] ARM: OMAP2+: Drop unused PRM defines for dra7
Date:   Wed,  6 Oct 2021 12:49:07 +0300
Message-Id: <20211006094915.15339-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006094915.15339-1-tony@atomide.com>
References: <20211006094915.15339-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These are unused and should be handled by drivers/soc/ti/omap_prm.c
driver nowadays.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/prm7xx.h | 613 -----------------------------------
 1 file changed, 613 deletions(-)

diff --git a/arch/arm/mach-omap2/prm7xx.h b/arch/arm/mach-omap2/prm7xx.h
--- a/arch/arm/mach-omap2/prm7xx.h
+++ b/arch/arm/mach-omap2/prm7xx.h
@@ -56,625 +56,12 @@
 #define DRA7XX_PRM_RTC_INST		0x1c60
 #define DRA7XX_PRM_VPE_INST		0x1c80
 #define DRA7XX_PRM_DEVICE_INST		0x1d00
-#define DRA7XX_PRM_INSTR_INST		0x1f00
 
 /* PRM clockdomain register offsets (from instance start) */
 #define DRA7XX_PRM_WKUPAON_CM_WKUPAON_CDOFFS	0x0000
 #define DRA7XX_PRM_EMU_CM_EMU_CDOFFS		0x0000
 
-/* PRM */
-
-/* PRM.OCP_SOCKET_PRM register offsets */
-#define DRA7XX_REVISION_PRM_OFFSET				0x0000
-#define DRA7XX_PRM_IRQSTATUS_MPU_OFFSET				0x0010
-#define DRA7XX_PRM_IRQSTATUS_MPU_2_OFFSET			0x0014
-#define DRA7XX_PRM_IRQENABLE_MPU_OFFSET				0x0018
-#define DRA7XX_PRM_IRQENABLE_MPU_2_OFFSET			0x001c
-#define DRA7XX_PRM_IRQSTATUS_IPU2_OFFSET			0x0020
-#define DRA7XX_PRM_IRQENABLE_IPU2_OFFSET			0x0028
-#define DRA7XX_PRM_IRQSTATUS_DSP1_OFFSET			0x0030
-#define DRA7XX_PRM_IRQENABLE_DSP1_OFFSET			0x0038
-#define DRA7XX_CM_PRM_PROFILING_CLKCTRL_OFFSET			0x0040
-#define DRA7XX_CM_PRM_PROFILING_CLKCTRL				DRA7XX_PRM_REGADDR(DRA7XX_PRM_OCP_SOCKET_INST, 0x0040)
-#define DRA7XX_PRM_IRQENABLE_DSP2_OFFSET			0x0044
-#define DRA7XX_PRM_IRQENABLE_EVE1_OFFSET			0x0048
-#define DRA7XX_PRM_IRQENABLE_EVE2_OFFSET			0x004c
-#define DRA7XX_PRM_IRQENABLE_EVE3_OFFSET			0x0050
-#define DRA7XX_PRM_IRQENABLE_EVE4_OFFSET			0x0054
-#define DRA7XX_PRM_IRQENABLE_IPU1_OFFSET			0x0058
-#define DRA7XX_PRM_IRQSTATUS_DSP2_OFFSET			0x005c
-#define DRA7XX_PRM_IRQSTATUS_EVE1_OFFSET			0x0060
-#define DRA7XX_PRM_IRQSTATUS_EVE2_OFFSET			0x0064
-#define DRA7XX_PRM_IRQSTATUS_EVE3_OFFSET			0x0068
-#define DRA7XX_PRM_IRQSTATUS_EVE4_OFFSET			0x006c
-#define DRA7XX_PRM_IRQSTATUS_IPU1_OFFSET			0x0070
-#define DRA7XX_PRM_DEBUG_CFG1_OFFSET				0x00e4
-#define DRA7XX_PRM_DEBUG_CFG2_OFFSET				0x00e8
-#define DRA7XX_PRM_DEBUG_CFG3_OFFSET				0x00ec
-#define DRA7XX_PRM_DEBUG_OUT_OFFSET				0x00f4
-
 /* PRM.CKGEN_PRM register offsets */
-#define DRA7XX_CM_CLKSEL_SYSCLK1_OFFSET				0x0000
-#define DRA7XX_CM_CLKSEL_SYSCLK1				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0000)
-#define DRA7XX_CM_CLKSEL_WKUPAON_OFFSET				0x0008
-#define DRA7XX_CM_CLKSEL_WKUPAON				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0008)
-#define DRA7XX_CM_CLKSEL_ABE_PLL_REF_OFFSET			0x000c
-#define DRA7XX_CM_CLKSEL_ABE_PLL_REF				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x000c)
-#define DRA7XX_CM_CLKSEL_SYS_OFFSET				0x0010
 #define DRA7XX_CM_CLKSEL_SYS					DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0010)
-#define DRA7XX_CM_CLKSEL_ABE_PLL_BYPAS_OFFSET			0x0014
-#define DRA7XX_CM_CLKSEL_ABE_PLL_BYPAS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0014)
-#define DRA7XX_CM_CLKSEL_ABE_PLL_SYS_OFFSET			0x0018
-#define DRA7XX_CM_CLKSEL_ABE_PLL_SYS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0018)
-#define DRA7XX_CM_CLKSEL_ABE_24M_OFFSET				0x001c
-#define DRA7XX_CM_CLKSEL_ABE_24M				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x001c)
-#define DRA7XX_CM_CLKSEL_ABE_SYS_OFFSET				0x0020
-#define DRA7XX_CM_CLKSEL_ABE_SYS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0020)
-#define DRA7XX_CM_CLKSEL_HDMI_MCASP_AUX_OFFSET			0x0024
-#define DRA7XX_CM_CLKSEL_HDMI_MCASP_AUX				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0024)
-#define DRA7XX_CM_CLKSEL_HDMI_TIMER_OFFSET			0x0028
-#define DRA7XX_CM_CLKSEL_HDMI_TIMER				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0028)
-#define DRA7XX_CM_CLKSEL_MCASP_SYS_OFFSET			0x002c
-#define DRA7XX_CM_CLKSEL_MCASP_SYS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x002c)
-#define DRA7XX_CM_CLKSEL_MLBP_MCASP_OFFSET			0x0030
-#define DRA7XX_CM_CLKSEL_MLBP_MCASP				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0030)
-#define DRA7XX_CM_CLKSEL_MLB_MCASP_OFFSET			0x0034
-#define DRA7XX_CM_CLKSEL_MLB_MCASP				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0034)
-#define DRA7XX_CM_CLKSEL_PER_ABE_X1_GFCLK_MCASP_AUX_OFFSET	0x0038
-#define DRA7XX_CM_CLKSEL_PER_ABE_X1_GFCLK_MCASP_AUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0038)
-#define DRA7XX_CM_CLKSEL_SYS_CLK1_32K_OFFSET			0x0040
-#define DRA7XX_CM_CLKSEL_SYS_CLK1_32K				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0040)
-#define DRA7XX_CM_CLKSEL_TIMER_SYS_OFFSET			0x0044
-#define DRA7XX_CM_CLKSEL_TIMER_SYS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0044)
-#define DRA7XX_CM_CLKSEL_VIDEO1_MCASP_AUX_OFFSET		0x0048
-#define DRA7XX_CM_CLKSEL_VIDEO1_MCASP_AUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0048)
-#define DRA7XX_CM_CLKSEL_VIDEO1_TIMER_OFFSET			0x004c
-#define DRA7XX_CM_CLKSEL_VIDEO1_TIMER				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x004c)
-#define DRA7XX_CM_CLKSEL_VIDEO2_MCASP_AUX_OFFSET		0x0050
-#define DRA7XX_CM_CLKSEL_VIDEO2_MCASP_AUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0050)
-#define DRA7XX_CM_CLKSEL_VIDEO2_TIMER_OFFSET			0x0054
-#define DRA7XX_CM_CLKSEL_VIDEO2_TIMER				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0054)
-#define DRA7XX_CM_CLKSEL_CLKOUTMUX0_OFFSET			0x0058
-#define DRA7XX_CM_CLKSEL_CLKOUTMUX0				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0058)
-#define DRA7XX_CM_CLKSEL_CLKOUTMUX1_OFFSET			0x005c
-#define DRA7XX_CM_CLKSEL_CLKOUTMUX1				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x005c)
-#define DRA7XX_CM_CLKSEL_CLKOUTMUX2_OFFSET			0x0060
-#define DRA7XX_CM_CLKSEL_CLKOUTMUX2				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0060)
-#define DRA7XX_CM_CLKSEL_HDMI_PLL_SYS_OFFSET			0x0064
-#define DRA7XX_CM_CLKSEL_HDMI_PLL_SYS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0064)
-#define DRA7XX_CM_CLKSEL_VIDEO1_PLL_SYS_OFFSET			0x0068
-#define DRA7XX_CM_CLKSEL_VIDEO1_PLL_SYS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0068)
-#define DRA7XX_CM_CLKSEL_VIDEO2_PLL_SYS_OFFSET			0x006c
-#define DRA7XX_CM_CLKSEL_VIDEO2_PLL_SYS				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x006c)
-#define DRA7XX_CM_CLKSEL_ABE_CLK_DIV_OFFSET			0x0070
-#define DRA7XX_CM_CLKSEL_ABE_CLK_DIV				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0070)
-#define DRA7XX_CM_CLKSEL_ABE_GICLK_DIV_OFFSET			0x0074
-#define DRA7XX_CM_CLKSEL_ABE_GICLK_DIV				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0074)
-#define DRA7XX_CM_CLKSEL_AESS_FCLK_DIV_OFFSET			0x0078
-#define DRA7XX_CM_CLKSEL_AESS_FCLK_DIV				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0078)
-#define DRA7XX_CM_CLKSEL_EVE_CLK_OFFSET				0x0080
-#define DRA7XX_CM_CLKSEL_EVE_CLK				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0080)
-#define DRA7XX_CM_CLKSEL_USB_OTG_CLK_CLKOUTMUX_OFFSET		0x0084
-#define DRA7XX_CM_CLKSEL_USB_OTG_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0084)
-#define DRA7XX_CM_CLKSEL_CORE_DPLL_OUT_CLK_CLKOUTMUX_OFFSET	0x0088
-#define DRA7XX_CM_CLKSEL_CORE_DPLL_OUT_CLK_CLKOUTMUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0088)
-#define DRA7XX_CM_CLKSEL_DSP_GFCLK_CLKOUTMUX_OFFSET		0x008c
-#define DRA7XX_CM_CLKSEL_DSP_GFCLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x008c)
-#define DRA7XX_CM_CLKSEL_EMIF_PHY_GCLK_CLKOUTMUX_OFFSET		0x0090
-#define DRA7XX_CM_CLKSEL_EMIF_PHY_GCLK_CLKOUTMUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0090)
-#define DRA7XX_CM_CLKSEL_EMU_CLK_CLKOUTMUX_OFFSET		0x0094
-#define DRA7XX_CM_CLKSEL_EMU_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0094)
-#define DRA7XX_CM_CLKSEL_FUNC_96M_AON_CLK_CLKOUTMUX_OFFSET	0x0098
-#define DRA7XX_CM_CLKSEL_FUNC_96M_AON_CLK_CLKOUTMUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x0098)
-#define DRA7XX_CM_CLKSEL_GMAC_250M_CLK_CLKOUTMUX_OFFSET		0x009c
-#define DRA7XX_CM_CLKSEL_GMAC_250M_CLK_CLKOUTMUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x009c)
-#define DRA7XX_CM_CLKSEL_GPU_GCLK_CLKOUTMUX_OFFSET		0x00a0
-#define DRA7XX_CM_CLKSEL_GPU_GCLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00a0)
-#define DRA7XX_CM_CLKSEL_HDMI_CLK_CLKOUTMUX_OFFSET		0x00a4
-#define DRA7XX_CM_CLKSEL_HDMI_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00a4)
-#define DRA7XX_CM_CLKSEL_IVA_GCLK_CLKOUTMUX_OFFSET		0x00a8
-#define DRA7XX_CM_CLKSEL_IVA_GCLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00a8)
-#define DRA7XX_CM_CLKSEL_L3INIT_480M_GFCLK_CLKOUTMUX_OFFSET	0x00ac
-#define DRA7XX_CM_CLKSEL_L3INIT_480M_GFCLK_CLKOUTMUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00ac)
-#define DRA7XX_CM_CLKSEL_MPU_GCLK_CLKOUTMUX_OFFSET		0x00b0
-#define DRA7XX_CM_CLKSEL_MPU_GCLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00b0)
-#define DRA7XX_CM_CLKSEL_PCIE1_CLK_CLKOUTMUX_OFFSET		0x00b4
-#define DRA7XX_CM_CLKSEL_PCIE1_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00b4)
-#define DRA7XX_CM_CLKSEL_PCIE2_CLK_CLKOUTMUX_OFFSET		0x00b8
-#define DRA7XX_CM_CLKSEL_PCIE2_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00b8)
-#define DRA7XX_CM_CLKSEL_PER_ABE_X1_CLK_CLKOUTMUX_OFFSET	0x00bc
-#define DRA7XX_CM_CLKSEL_PER_ABE_X1_CLK_CLKOUTMUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00bc)
-#define DRA7XX_CM_CLKSEL_SATA_CLK_CLKOUTMUX_OFFSET		0x00c0
-#define DRA7XX_CM_CLKSEL_SATA_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00c0)
-#define DRA7XX_CM_CLKSEL_SECURE_32K_CLK_CLKOUTMUX_OFFSET	0x00c4
-#define DRA7XX_CM_CLKSEL_SECURE_32K_CLK_CLKOUTMUX		DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00c4)
-#define DRA7XX_CM_CLKSEL_SYS_CLK1_CLKOUTMUX_OFFSET		0x00c8
-#define DRA7XX_CM_CLKSEL_SYS_CLK1_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00c8)
-#define DRA7XX_CM_CLKSEL_SYS_CLK2_CLKOUTMUX_OFFSET		0x00cc
-#define DRA7XX_CM_CLKSEL_SYS_CLK2_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00cc)
-#define DRA7XX_CM_CLKSEL_VIDEO1_CLK_CLKOUTMUX_OFFSET		0x00d0
-#define DRA7XX_CM_CLKSEL_VIDEO1_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00d0)
-#define DRA7XX_CM_CLKSEL_VIDEO2_CLK_CLKOUTMUX_OFFSET		0x00d4
-#define DRA7XX_CM_CLKSEL_VIDEO2_CLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00d4)
-#define DRA7XX_CM_CLKSEL_ABE_LP_CLK_OFFSET			0x00d8
-#define DRA7XX_CM_CLKSEL_ABE_LP_CLK				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00d8)
-#define DRA7XX_CM_CLKSEL_ADC_GFCLK_OFFSET			0x00dc
-#define DRA7XX_CM_CLKSEL_ADC_GFCLK				DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00dc)
-#define DRA7XX_CM_CLKSEL_EVE_GFCLK_CLKOUTMUX_OFFSET		0x00e0
-#define DRA7XX_CM_CLKSEL_EVE_GFCLK_CLKOUTMUX			DRA7XX_PRM_REGADDR(DRA7XX_PRM_CKGEN_INST, 0x00e0)
-
-/* PRM.MPU_PRM register offsets */
-#define DRA7XX_PM_MPU_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_MPU_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_MPU_MPU_CONTEXT_OFFSET			0x0024
-
-/* PRM.DSP1_PRM register offsets */
-#define DRA7XX_PM_DSP1_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_DSP1_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_DSP1_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_DSP1_RSTST_OFFSET				0x0014
-#define DRA7XX_RM_DSP1_DSP1_CONTEXT_OFFSET			0x0024
-
-/* PRM.IPU_PRM register offsets */
-#define DRA7XX_PM_IPU_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_IPU_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_IPU1_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_IPU1_RSTST_OFFSET				0x0014
-#define DRA7XX_RM_IPU1_IPU1_CONTEXT_OFFSET			0x0024
-#define DRA7XX_PM_IPU_MCASP1_WKDEP_OFFSET			0x0050
-#define DRA7XX_RM_IPU_MCASP1_CONTEXT_OFFSET			0x0054
-#define DRA7XX_PM_IPU_TIMER5_WKDEP_OFFSET			0x0058
-#define DRA7XX_RM_IPU_TIMER5_CONTEXT_OFFSET			0x005c
-#define DRA7XX_PM_IPU_TIMER6_WKDEP_OFFSET			0x0060
-#define DRA7XX_RM_IPU_TIMER6_CONTEXT_OFFSET			0x0064
-#define DRA7XX_PM_IPU_TIMER7_WKDEP_OFFSET			0x0068
-#define DRA7XX_RM_IPU_TIMER7_CONTEXT_OFFSET			0x006c
-#define DRA7XX_PM_IPU_TIMER8_WKDEP_OFFSET			0x0070
-#define DRA7XX_RM_IPU_TIMER8_CONTEXT_OFFSET			0x0074
-#define DRA7XX_PM_IPU_I2C5_WKDEP_OFFSET				0x0078
-#define DRA7XX_RM_IPU_I2C5_CONTEXT_OFFSET			0x007c
-#define DRA7XX_PM_IPU_UART6_WKDEP_OFFSET			0x0080
-#define DRA7XX_RM_IPU_UART6_CONTEXT_OFFSET			0x0084
-
-/* PRM.COREAON_PRM register offsets */
-#define DRA7XX_PM_COREAON_SMARTREFLEX_MPU_WKDEP_OFFSET		0x0000
-#define DRA7XX_RM_COREAON_SMARTREFLEX_MPU_CONTEXT_OFFSET	0x0004
-#define DRA7XX_PM_COREAON_SMARTREFLEX_CORE_WKDEP_OFFSET		0x0010
-#define DRA7XX_RM_COREAON_SMARTREFLEX_CORE_CONTEXT_OFFSET	0x0014
-#define DRA7XX_PM_COREAON_SMARTREFLEX_GPU_WKDEP_OFFSET		0x0030
-#define DRA7XX_RM_COREAON_SMARTREFLEX_GPU_CONTEXT_OFFSET	0x0034
-#define DRA7XX_PM_COREAON_SMARTREFLEX_DSPEVE_WKDEP_OFFSET	0x0040
-#define DRA7XX_RM_COREAON_SMARTREFLEX_DSPEVE_CONTEXT_OFFSET	0x0044
-#define DRA7XX_PM_COREAON_SMARTREFLEX_IVAHD_WKDEP_OFFSET	0x0050
-#define DRA7XX_RM_COREAON_SMARTREFLEX_IVAHD_CONTEXT_OFFSET	0x0054
-#define DRA7XX_RM_COREAON_DUMMY_MODULE1_CONTEXT_OFFSET		0x0084
-#define DRA7XX_RM_COREAON_DUMMY_MODULE2_CONTEXT_OFFSET		0x0094
-#define DRA7XX_RM_COREAON_DUMMY_MODULE3_CONTEXT_OFFSET		0x00a4
-#define DRA7XX_RM_COREAON_DUMMY_MODULE4_CONTEXT_OFFSET		0x00b4
-
-/* PRM.CORE_PRM register offsets */
-#define DRA7XX_PM_CORE_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_CORE_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_L3MAIN1_L3_MAIN_1_CONTEXT_OFFSET		0x0024
-#define DRA7XX_RM_L3MAIN1_GPMC_CONTEXT_OFFSET			0x002c
-#define DRA7XX_RM_L3MAIN1_MMU_EDMA_CONTEXT_OFFSET		0x0034
-#define DRA7XX_PM_L3MAIN1_OCMC_RAM1_WKDEP_OFFSET		0x0050
-#define DRA7XX_RM_L3MAIN1_OCMC_RAM1_CONTEXT_OFFSET		0x0054
-#define DRA7XX_PM_L3MAIN1_OCMC_RAM2_WKDEP_OFFSET		0x0058
-#define DRA7XX_RM_L3MAIN1_OCMC_RAM2_CONTEXT_OFFSET		0x005c
-#define DRA7XX_PM_L3MAIN1_OCMC_RAM3_WKDEP_OFFSET		0x0060
-#define DRA7XX_RM_L3MAIN1_OCMC_RAM3_CONTEXT_OFFSET		0x0064
-#define DRA7XX_RM_L3MAIN1_OCMC_ROM_CONTEXT_OFFSET		0x006c
-#define DRA7XX_PM_L3MAIN1_TPCC_WKDEP_OFFSET			0x0070
-#define DRA7XX_RM_L3MAIN1_TPCC_CONTEXT_OFFSET			0x0074
-#define DRA7XX_PM_L3MAIN1_TPTC1_WKDEP_OFFSET			0x0078
-#define DRA7XX_RM_L3MAIN1_TPTC1_CONTEXT_OFFSET			0x007c
-#define DRA7XX_PM_L3MAIN1_TPTC2_WKDEP_OFFSET			0x0080
-#define DRA7XX_RM_L3MAIN1_TPTC2_CONTEXT_OFFSET			0x0084
-#define DRA7XX_RM_L3MAIN1_VCP1_CONTEXT_OFFSET			0x008c
-#define DRA7XX_RM_L3MAIN1_VCP2_CONTEXT_OFFSET			0x0094
-#define DRA7XX_RM_L3MAIN1_SPARE_CME_CONTEXT_OFFSET		0x009c
-#define DRA7XX_RM_L3MAIN1_SPARE_HDMI_CONTEXT_OFFSET		0x00a4
-#define DRA7XX_RM_L3MAIN1_SPARE_ICM_CONTEXT_OFFSET		0x00ac
-#define DRA7XX_RM_L3MAIN1_SPARE_IVA2_CONTEXT_OFFSET		0x00b4
-#define DRA7XX_RM_L3MAIN1_SPARE_SATA2_CONTEXT_OFFSET		0x00bc
-#define DRA7XX_RM_L3MAIN1_SPARE_UNKNOWN4_CONTEXT_OFFSET		0x00c4
-#define DRA7XX_RM_L3MAIN1_SPARE_UNKNOWN5_CONTEXT_OFFSET		0x00cc
-#define DRA7XX_RM_L3MAIN1_SPARE_UNKNOWN6_CONTEXT_OFFSET		0x00d4
-#define DRA7XX_RM_L3MAIN1_SPARE_VIDEOPLL1_CONTEXT_OFFSET	0x00dc
-#define DRA7XX_RM_L3MAIN1_SPARE_VIDEOPLL2_CONTEXT_OFFSET	0x00f4
-#define DRA7XX_RM_L3MAIN1_SPARE_VIDEOPLL3_CONTEXT_OFFSET	0x00fc
-#define DRA7XX_RM_IPU2_RSTCTRL_OFFSET				0x0210
-#define DRA7XX_RM_IPU2_RSTST_OFFSET				0x0214
-#define DRA7XX_RM_IPU2_IPU2_CONTEXT_OFFSET			0x0224
-#define DRA7XX_RM_DMA_DMA_SYSTEM_CONTEXT_OFFSET			0x0324
-#define DRA7XX_RM_EMIF_DMM_CONTEXT_OFFSET			0x0424
-#define DRA7XX_RM_EMIF_EMIF_OCP_FW_CONTEXT_OFFSET		0x042c
-#define DRA7XX_RM_EMIF_EMIF1_CONTEXT_OFFSET			0x0434
-#define DRA7XX_RM_EMIF_EMIF2_CONTEXT_OFFSET			0x043c
-#define DRA7XX_RM_EMIF_EMIF_DLL_CONTEXT_OFFSET			0x0444
-#define DRA7XX_RM_ATL_ATL_CONTEXT_OFFSET			0x0524
-#define DRA7XX_RM_L4CFG_L4_CFG_CONTEXT_OFFSET			0x0624
-#define DRA7XX_RM_L4CFG_SPINLOCK_CONTEXT_OFFSET			0x062c
-#define DRA7XX_RM_L4CFG_MAILBOX1_CONTEXT_OFFSET			0x0634
-#define DRA7XX_RM_L4CFG_SAR_ROM_CONTEXT_OFFSET			0x063c
-#define DRA7XX_RM_L4CFG_OCP2SCP2_CONTEXT_OFFSET			0x0644
-#define DRA7XX_RM_L4CFG_MAILBOX2_CONTEXT_OFFSET			0x064c
-#define DRA7XX_RM_L4CFG_MAILBOX3_CONTEXT_OFFSET			0x0654
-#define DRA7XX_RM_L4CFG_MAILBOX4_CONTEXT_OFFSET			0x065c
-#define DRA7XX_RM_L4CFG_MAILBOX5_CONTEXT_OFFSET			0x0664
-#define DRA7XX_RM_L4CFG_MAILBOX6_CONTEXT_OFFSET			0x066c
-#define DRA7XX_RM_L4CFG_MAILBOX7_CONTEXT_OFFSET			0x0674
-#define DRA7XX_RM_L4CFG_MAILBOX8_CONTEXT_OFFSET			0x067c
-#define DRA7XX_RM_L4CFG_MAILBOX9_CONTEXT_OFFSET			0x0684
-#define DRA7XX_RM_L4CFG_MAILBOX10_CONTEXT_OFFSET		0x068c
-#define DRA7XX_RM_L4CFG_MAILBOX11_CONTEXT_OFFSET		0x0694
-#define DRA7XX_RM_L4CFG_MAILBOX12_CONTEXT_OFFSET		0x069c
-#define DRA7XX_RM_L4CFG_MAILBOX13_CONTEXT_OFFSET		0x06a4
-#define DRA7XX_RM_L4CFG_SPARE_SMARTREFLEX_RTC_CONTEXT_OFFSET	0x06ac
-#define DRA7XX_RM_L4CFG_SPARE_SMARTREFLEX_SDRAM_CONTEXT_OFFSET	0x06b4
-#define DRA7XX_RM_L4CFG_SPARE_SMARTREFLEX_WKUP_CONTEXT_OFFSET	0x06bc
-#define DRA7XX_RM_L4CFG_IO_DELAY_BLOCK_CONTEXT_OFFSET		0x06c4
-#define DRA7XX_RM_L3INSTR_L3_MAIN_2_CONTEXT_OFFSET		0x0724
-#define DRA7XX_RM_L3INSTR_L3_INSTR_CONTEXT_OFFSET		0x072c
-#define DRA7XX_RM_L3INSTR_OCP_WP_NOC_CONTEXT_OFFSET		0x0744
-
-/* PRM.IVA_PRM register offsets */
-#define DRA7XX_PM_IVA_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_IVA_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_IVA_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_IVA_RSTST_OFFSET				0x0014
-#define DRA7XX_RM_IVA_IVA_CONTEXT_OFFSET			0x0024
-#define DRA7XX_RM_IVA_SL2_CONTEXT_OFFSET			0x002c
-
-/* PRM.CAM_PRM register offsets */
-#define DRA7XX_PM_CAM_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_CAM_PWRSTST_OFFSET				0x0004
-#define DRA7XX_PM_CAM_VIP1_WKDEP_OFFSET				0x0020
-#define DRA7XX_RM_CAM_VIP1_CONTEXT_OFFSET			0x0024
-#define DRA7XX_PM_CAM_VIP2_WKDEP_OFFSET				0x0028
-#define DRA7XX_RM_CAM_VIP2_CONTEXT_OFFSET			0x002c
-#define DRA7XX_PM_CAM_VIP3_WKDEP_OFFSET				0x0030
-#define DRA7XX_RM_CAM_VIP3_CONTEXT_OFFSET			0x0034
-#define DRA7XX_RM_CAM_LVDSRX_CONTEXT_OFFSET			0x003c
-#define DRA7XX_RM_CAM_CSI1_CONTEXT_OFFSET			0x0044
-#define DRA7XX_RM_CAM_CSI2_CONTEXT_OFFSET			0x004c
-
-/* PRM.DSS_PRM register offsets */
-#define DRA7XX_PM_DSS_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_DSS_PWRSTST_OFFSET				0x0004
-#define DRA7XX_PM_DSS_DSS_WKDEP_OFFSET				0x0020
-#define DRA7XX_RM_DSS_DSS_CONTEXT_OFFSET			0x0024
-#define DRA7XX_PM_DSS_DSS2_WKDEP_OFFSET				0x0028
-#define DRA7XX_RM_DSS_BB2D_CONTEXT_OFFSET			0x0034
-#define DRA7XX_RM_DSS_SDVENC_CONTEXT_OFFSET			0x003c
-
-/* PRM.GPU_PRM register offsets */
-#define DRA7XX_PM_GPU_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_GPU_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_GPU_GPU_CONTEXT_OFFSET			0x0024
-
-/* PRM.L3INIT_PRM register offsets */
-#define DRA7XX_PM_L3INIT_PWRSTCTRL_OFFSET			0x0000
-#define DRA7XX_PM_L3INIT_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_L3INIT_PCIESS_RSTCTRL_OFFSET			0x0010
-#define DRA7XX_PM_L3INIT_MMC1_WKDEP_OFFSET			0x0028
-#define DRA7XX_RM_L3INIT_MMC1_CONTEXT_OFFSET			0x002c
-#define DRA7XX_PM_L3INIT_MMC2_WKDEP_OFFSET			0x0030
-#define DRA7XX_RM_L3INIT_MMC2_CONTEXT_OFFSET			0x0034
-#define DRA7XX_PM_L3INIT_USB_OTG_SS2_WKDEP_OFFSET		0x0040
-#define DRA7XX_RM_L3INIT_USB_OTG_SS2_CONTEXT_OFFSET		0x0044
-#define DRA7XX_PM_L3INIT_USB_OTG_SS3_WKDEP_OFFSET		0x0048
-#define DRA7XX_RM_L3INIT_USB_OTG_SS3_CONTEXT_OFFSET		0x004c
-#define DRA7XX_PM_L3INIT_USB_OTG_SS4_WKDEP_OFFSET		0x0050
-#define DRA7XX_RM_L3INIT_USB_OTG_SS4_CONTEXT_OFFSET		0x0054
-#define DRA7XX_RM_L3INIT_MLB_SS_CONTEXT_OFFSET			0x005c
-#define DRA7XX_RM_L3INIT_IEEE1500_2_OCP_CONTEXT_OFFSET		0x007c
-#define DRA7XX_PM_L3INIT_SATA_WKDEP_OFFSET			0x0088
-#define DRA7XX_RM_L3INIT_SATA_CONTEXT_OFFSET			0x008c
-#define DRA7XX_PM_L3INIT_PCIESS1_WKDEP_OFFSET			0x00b0
-#define DRA7XX_RM_L3INIT_PCIESS1_CONTEXT_OFFSET		0x00b4
-#define DRA7XX_PM_L3INIT_PCIESS2_WKDEP_OFFSET			0x00b8
-#define DRA7XX_RM_L3INIT_PCIESS2_CONTEXT_OFFSET		0x00bc
-#define DRA7XX_RM_GMAC_GMAC_CONTEXT_OFFSET			0x00d4
-#define DRA7XX_RM_L3INIT_OCP2SCP1_CONTEXT_OFFSET		0x00e4
-#define DRA7XX_RM_L3INIT_OCP2SCP3_CONTEXT_OFFSET		0x00ec
-#define DRA7XX_PM_L3INIT_USB_OTG_SS1_WKDEP_OFFSET		0x00f0
-#define DRA7XX_RM_L3INIT_USB_OTG_SS1_CONTEXT_OFFSET		0x00f4
-
-/* PRM.L4PER_PRM register offsets */
-#define DRA7XX_PM_L4PER_PWRSTCTRL_OFFSET			0x0000
-#define DRA7XX_PM_L4PER_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_L4PER2_L4PER2_CONTEXT_OFFSET			0x000c
-#define DRA7XX_RM_L4PER3_L4PER3_CONTEXT_OFFSET			0x0014
-#define DRA7XX_RM_L4PER2_PRUSS1_CONTEXT_OFFSET			0x001c
-#define DRA7XX_RM_L4PER2_PRUSS2_CONTEXT_OFFSET			0x0024
-#define DRA7XX_PM_L4PER_TIMER10_WKDEP_OFFSET			0x0028
-#define DRA7XX_RM_L4PER_TIMER10_CONTEXT_OFFSET			0x002c
-#define DRA7XX_PM_L4PER_TIMER11_WKDEP_OFFSET			0x0030
-#define DRA7XX_RM_L4PER_TIMER11_CONTEXT_OFFSET			0x0034
-#define DRA7XX_PM_L4PER_TIMER2_WKDEP_OFFSET			0x0038
-#define DRA7XX_RM_L4PER_TIMER2_CONTEXT_OFFSET			0x003c
-#define DRA7XX_PM_L4PER_TIMER3_WKDEP_OFFSET			0x0040
-#define DRA7XX_RM_L4PER_TIMER3_CONTEXT_OFFSET			0x0044
-#define DRA7XX_PM_L4PER_TIMER4_WKDEP_OFFSET			0x0048
-#define DRA7XX_RM_L4PER_TIMER4_CONTEXT_OFFSET			0x004c
-#define DRA7XX_PM_L4PER_TIMER9_WKDEP_OFFSET			0x0050
-#define DRA7XX_RM_L4PER_TIMER9_CONTEXT_OFFSET			0x0054
-#define DRA7XX_RM_L4PER_ELM_CONTEXT_OFFSET			0x005c
-#define DRA7XX_PM_L4PER_GPIO2_WKDEP_OFFSET			0x0060
-#define DRA7XX_RM_L4PER_GPIO2_CONTEXT_OFFSET			0x0064
-#define DRA7XX_PM_L4PER_GPIO3_WKDEP_OFFSET			0x0068
-#define DRA7XX_RM_L4PER_GPIO3_CONTEXT_OFFSET			0x006c
-#define DRA7XX_PM_L4PER_GPIO4_WKDEP_OFFSET			0x0070
-#define DRA7XX_RM_L4PER_GPIO4_CONTEXT_OFFSET			0x0074
-#define DRA7XX_PM_L4PER_GPIO5_WKDEP_OFFSET			0x0078
-#define DRA7XX_RM_L4PER_GPIO5_CONTEXT_OFFSET			0x007c
-#define DRA7XX_PM_L4PER_GPIO6_WKDEP_OFFSET			0x0080
-#define DRA7XX_RM_L4PER_GPIO6_CONTEXT_OFFSET			0x0084
-#define DRA7XX_RM_L4PER_HDQ1W_CONTEXT_OFFSET			0x008c
-#define DRA7XX_RM_L4PER2_PWMSS2_CONTEXT_OFFSET			0x0094
-#define DRA7XX_RM_L4PER2_PWMSS3_CONTEXT_OFFSET			0x009c
-#define DRA7XX_PM_L4PER_I2C1_WKDEP_OFFSET			0x00a0
-#define DRA7XX_RM_L4PER_I2C1_CONTEXT_OFFSET			0x00a4
-#define DRA7XX_PM_L4PER_I2C2_WKDEP_OFFSET			0x00a8
-#define DRA7XX_RM_L4PER_I2C2_CONTEXT_OFFSET			0x00ac
-#define DRA7XX_PM_L4PER_I2C3_WKDEP_OFFSET			0x00b0
-#define DRA7XX_RM_L4PER_I2C3_CONTEXT_OFFSET			0x00b4
-#define DRA7XX_PM_L4PER_I2C4_WKDEP_OFFSET			0x00b8
-#define DRA7XX_RM_L4PER_I2C4_CONTEXT_OFFSET			0x00bc
-#define DRA7XX_RM_L4PER_L4PER1_CONTEXT_OFFSET			0x00c0
-#define DRA7XX_RM_L4PER2_PWMSS1_CONTEXT_OFFSET			0x00c4
-#define DRA7XX_PM_L4PER_TIMER13_WKDEP_OFFSET			0x00c8
-#define DRA7XX_RM_L4PER3_TIMER13_CONTEXT_OFFSET			0x00cc
-#define DRA7XX_PM_L4PER_TIMER14_WKDEP_OFFSET			0x00d0
-#define DRA7XX_RM_L4PER3_TIMER14_CONTEXT_OFFSET			0x00d4
-#define DRA7XX_PM_L4PER_TIMER15_WKDEP_OFFSET			0x00d8
-#define DRA7XX_RM_L4PER3_TIMER15_CONTEXT_OFFSET			0x00dc
-#define DRA7XX_PM_L4PER_MCSPI1_WKDEP_OFFSET			0x00f0
-#define DRA7XX_RM_L4PER_MCSPI1_CONTEXT_OFFSET			0x00f4
-#define DRA7XX_PM_L4PER_MCSPI2_WKDEP_OFFSET			0x00f8
-#define DRA7XX_RM_L4PER_MCSPI2_CONTEXT_OFFSET			0x00fc
-#define DRA7XX_PM_L4PER_MCSPI3_WKDEP_OFFSET			0x0100
-#define DRA7XX_RM_L4PER_MCSPI3_CONTEXT_OFFSET			0x0104
-#define DRA7XX_PM_L4PER_MCSPI4_WKDEP_OFFSET			0x0108
-#define DRA7XX_RM_L4PER_MCSPI4_CONTEXT_OFFSET			0x010c
-#define DRA7XX_PM_L4PER_GPIO7_WKDEP_OFFSET			0x0110
-#define DRA7XX_RM_L4PER_GPIO7_CONTEXT_OFFSET			0x0114
-#define DRA7XX_PM_L4PER_GPIO8_WKDEP_OFFSET			0x0118
-#define DRA7XX_RM_L4PER_GPIO8_CONTEXT_OFFSET			0x011c
-#define DRA7XX_PM_L4PER_MMC3_WKDEP_OFFSET			0x0120
-#define DRA7XX_RM_L4PER_MMC3_CONTEXT_OFFSET			0x0124
-#define DRA7XX_PM_L4PER_MMC4_WKDEP_OFFSET			0x0128
-#define DRA7XX_RM_L4PER_MMC4_CONTEXT_OFFSET			0x012c
-#define DRA7XX_PM_L4PER_TIMER16_WKDEP_OFFSET			0x0130
-#define DRA7XX_RM_L4PER3_TIMER16_CONTEXT_OFFSET			0x0134
-#define DRA7XX_PM_L4PER2_QSPI_WKDEP_OFFSET			0x0138
-#define DRA7XX_RM_L4PER2_QSPI_CONTEXT_OFFSET			0x013c
-#define DRA7XX_PM_L4PER_UART1_WKDEP_OFFSET			0x0140
-#define DRA7XX_RM_L4PER_UART1_CONTEXT_OFFSET			0x0144
-#define DRA7XX_PM_L4PER_UART2_WKDEP_OFFSET			0x0148
-#define DRA7XX_RM_L4PER_UART2_CONTEXT_OFFSET			0x014c
-#define DRA7XX_PM_L4PER_UART3_WKDEP_OFFSET			0x0150
-#define DRA7XX_RM_L4PER_UART3_CONTEXT_OFFSET			0x0154
-#define DRA7XX_PM_L4PER_UART4_WKDEP_OFFSET			0x0158
-#define DRA7XX_RM_L4PER_UART4_CONTEXT_OFFSET			0x015c
-#define DRA7XX_PM_L4PER2_MCASP2_WKDEP_OFFSET			0x0160
-#define DRA7XX_RM_L4PER2_MCASP2_CONTEXT_OFFSET			0x0164
-#define DRA7XX_PM_L4PER2_MCASP3_WKDEP_OFFSET			0x0168
-#define DRA7XX_RM_L4PER2_MCASP3_CONTEXT_OFFSET			0x016c
-#define DRA7XX_PM_L4PER_UART5_WKDEP_OFFSET			0x0170
-#define DRA7XX_RM_L4PER_UART5_CONTEXT_OFFSET			0x0174
-#define DRA7XX_PM_L4PER2_MCASP5_WKDEP_OFFSET			0x0178
-#define DRA7XX_RM_L4PER2_MCASP5_CONTEXT_OFFSET			0x017c
-#define DRA7XX_PM_L4PER2_MCASP6_WKDEP_OFFSET			0x0180
-#define DRA7XX_RM_L4PER2_MCASP6_CONTEXT_OFFSET			0x0184
-#define DRA7XX_PM_L4PER2_MCASP7_WKDEP_OFFSET			0x0188
-#define DRA7XX_RM_L4PER2_MCASP7_CONTEXT_OFFSET			0x018c
-#define DRA7XX_PM_L4PER2_MCASP8_WKDEP_OFFSET			0x0190
-#define DRA7XX_RM_L4PER2_MCASP8_CONTEXT_OFFSET			0x0194
-#define DRA7XX_PM_L4PER2_MCASP4_WKDEP_OFFSET			0x0198
-#define DRA7XX_RM_L4PER2_MCASP4_CONTEXT_OFFSET			0x019c
-#define DRA7XX_RM_L4SEC_AES1_CONTEXT_OFFSET			0x01a4
-#define DRA7XX_RM_L4SEC_AES2_CONTEXT_OFFSET			0x01ac
-#define DRA7XX_RM_L4SEC_DES3DES_CONTEXT_OFFSET			0x01b4
-#define DRA7XX_RM_L4SEC_FPKA_CONTEXT_OFFSET			0x01bc
-#define DRA7XX_RM_L4SEC_RNG_CONTEXT_OFFSET			0x01c4
-#define DRA7XX_RM_L4SEC_SHA2MD51_CONTEXT_OFFSET			0x01cc
-#define DRA7XX_PM_L4PER2_UART7_WKDEP_OFFSET			0x01d0
-#define DRA7XX_RM_L4PER2_UART7_CONTEXT_OFFSET			0x01d4
-#define DRA7XX_RM_L4SEC_DMA_CRYPTO_CONTEXT_OFFSET		0x01dc
-#define DRA7XX_PM_L4PER2_UART8_WKDEP_OFFSET			0x01e0
-#define DRA7XX_RM_L4PER2_UART8_CONTEXT_OFFSET			0x01e4
-#define DRA7XX_PM_L4PER2_UART9_WKDEP_OFFSET			0x01e8
-#define DRA7XX_RM_L4PER2_UART9_CONTEXT_OFFSET			0x01ec
-#define DRA7XX_PM_L4PER2_DCAN2_WKDEP_OFFSET			0x01f0
-#define DRA7XX_RM_L4PER2_DCAN2_CONTEXT_OFFSET			0x01f4
-#define DRA7XX_RM_L4SEC_SHA2MD52_CONTEXT_OFFSET			0x01fc
-
-/* PRM.CUSTEFUSE_PRM register offsets */
-#define DRA7XX_PM_CUSTEFUSE_PWRSTCTRL_OFFSET			0x0000
-#define DRA7XX_PM_CUSTEFUSE_PWRSTST_OFFSET			0x0004
-#define DRA7XX_RM_CUSTEFUSE_EFUSE_CTRL_CUST_CONTEXT_OFFSET	0x0024
-
-/* PRM.WKUPAON_PRM register offsets */
-#define DRA7XX_RM_WKUPAON_L4_WKUP_CONTEXT_OFFSET		0x0000
-#define DRA7XX_PM_WKUPAON_WD_TIMER1_WKDEP_OFFSET		0x0004
-#define DRA7XX_RM_WKUPAON_WD_TIMER1_CONTEXT_OFFSET		0x0008
-#define DRA7XX_PM_WKUPAON_WD_TIMER2_WKDEP_OFFSET		0x000c
-#define DRA7XX_RM_WKUPAON_WD_TIMER2_CONTEXT_OFFSET		0x0010
-#define DRA7XX_PM_WKUPAON_GPIO1_WKDEP_OFFSET			0x0014
-#define DRA7XX_RM_WKUPAON_GPIO1_CONTEXT_OFFSET			0x0018
-#define DRA7XX_PM_WKUPAON_TIMER1_WKDEP_OFFSET			0x001c
-#define DRA7XX_RM_WKUPAON_TIMER1_CONTEXT_OFFSET			0x0020
-#define DRA7XX_PM_WKUPAON_TIMER12_WKDEP_OFFSET			0x0024
-#define DRA7XX_RM_WKUPAON_TIMER12_CONTEXT_OFFSET		0x0028
-#define DRA7XX_RM_WKUPAON_COUNTER_32K_CONTEXT_OFFSET		0x0030
-#define DRA7XX_RM_WKUPAON_SAR_RAM_CONTEXT_OFFSET		0x0040
-#define DRA7XX_PM_WKUPAON_KBD_WKDEP_OFFSET			0x0054
-#define DRA7XX_RM_WKUPAON_KBD_CONTEXT_OFFSET			0x0058
-#define DRA7XX_PM_WKUPAON_UART10_WKDEP_OFFSET			0x005c
-#define DRA7XX_RM_WKUPAON_UART10_CONTEXT_OFFSET			0x0060
-#define DRA7XX_PM_WKUPAON_DCAN1_WKDEP_OFFSET			0x0064
-#define DRA7XX_RM_WKUPAON_DCAN1_CONTEXT_OFFSET			0x0068
-#define DRA7XX_PM_WKUPAON_ADC_WKDEP_OFFSET				0x007c
-#define DRA7XX_RM_WKUPAON_ADC_CONTEXT_OFFSET			0x0080
-#define DRA7XX_RM_WKUPAON_SPARE_SAFETY1_CONTEXT_OFFSET		0x0090
-#define DRA7XX_RM_WKUPAON_SPARE_SAFETY2_CONTEXT_OFFSET		0x0098
-#define DRA7XX_RM_WKUPAON_SPARE_SAFETY3_CONTEXT_OFFSET		0x00a0
-#define DRA7XX_RM_WKUPAON_SPARE_SAFETY4_CONTEXT_OFFSET		0x00a8
-#define DRA7XX_RM_WKUPAON_SPARE_UNKNOWN2_CONTEXT_OFFSET		0x00b0
-#define DRA7XX_RM_WKUPAON_SPARE_UNKNOWN3_CONTEXT_OFFSET		0x00b8
-
-/* PRM.WKUPAON_CM register offsets */
-#define DRA7XX_CM_WKUPAON_CLKSTCTRL_OFFSET			0x0000
-#define DRA7XX_CM_WKUPAON_L4_WKUP_CLKCTRL_OFFSET		0x0020
-#define DRA7XX_CM_WKUPAON_L4_WKUP_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0020)
-#define DRA7XX_CM_WKUPAON_WD_TIMER1_CLKCTRL_OFFSET		0x0028
-#define DRA7XX_CM_WKUPAON_WD_TIMER1_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0028)
-#define DRA7XX_CM_WKUPAON_WD_TIMER2_CLKCTRL_OFFSET		0x0030
-#define DRA7XX_CM_WKUPAON_WD_TIMER2_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0030)
-#define DRA7XX_CM_WKUPAON_GPIO1_CLKCTRL_OFFSET			0x0038
-#define DRA7XX_CM_WKUPAON_GPIO1_CLKCTRL				DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0038)
-#define DRA7XX_CM_WKUPAON_TIMER1_CLKCTRL_OFFSET			0x0040
-#define DRA7XX_CM_WKUPAON_TIMER1_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0040)
-#define DRA7XX_CM_WKUPAON_TIMER12_CLKCTRL_OFFSET		0x0048
-#define DRA7XX_CM_WKUPAON_TIMER12_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0048)
-#define DRA7XX_CM_WKUPAON_COUNTER_32K_CLKCTRL_OFFSET		0x0050
-#define DRA7XX_CM_WKUPAON_COUNTER_32K_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0050)
-#define DRA7XX_CM_WKUPAON_SAR_RAM_CLKCTRL_OFFSET		0x0060
-#define DRA7XX_CM_WKUPAON_SAR_RAM_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0060)
-#define DRA7XX_CM_WKUPAON_KBD_CLKCTRL_OFFSET			0x0078
-#define DRA7XX_CM_WKUPAON_KBD_CLKCTRL				DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0078)
-#define DRA7XX_CM_WKUPAON_UART10_CLKCTRL_OFFSET			0x0080
-#define DRA7XX_CM_WKUPAON_UART10_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0080)
-#define DRA7XX_CM_WKUPAON_DCAN1_CLKCTRL_OFFSET			0x0088
-#define DRA7XX_CM_WKUPAON_DCAN1_CLKCTRL				DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0088)
-#define DRA7XX_CM_WKUPAON_SCRM_CLKCTRL_OFFSET			0x0090
-#define DRA7XX_CM_WKUPAON_SCRM_CLKCTRL				DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0090)
-#define DRA7XX_CM_WKUPAON_IO_SRCOMP_CLKCTRL_OFFSET		0x0098
-#define DRA7XX_CM_WKUPAON_IO_SRCOMP_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x0098)
-#define DRA7XX_CM_WKUPAON_ADC_CLKCTRL_OFFSET			0x00a0
-#define DRA7XX_CM_WKUPAON_ADC_CLKCTRL				DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x00a0)
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY1_CLKCTRL_OFFSET		0x00b0
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY1_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x00b0)
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY2_CLKCTRL_OFFSET		0x00b8
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY2_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x00b8)
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY3_CLKCTRL_OFFSET		0x00c0
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY3_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x00c0)
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY4_CLKCTRL_OFFSET		0x00c8
-#define DRA7XX_CM_WKUPAON_SPARE_SAFETY4_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x00c8)
-#define DRA7XX_CM_WKUPAON_SPARE_UNKNOWN2_CLKCTRL_OFFSET		0x00d0
-#define DRA7XX_CM_WKUPAON_SPARE_UNKNOWN2_CLKCTRL		DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x00d0)
-#define DRA7XX_CM_WKUPAON_SPARE_UNKNOWN3_CLKCTRL_OFFSET		0x00d8
-#define DRA7XX_CM_WKUPAON_SPARE_UNKNOWN3_CLKCTRL		DRA7XX_PRM_REGADDR(DRA7XX_PRM_WKUPAON_CM_INST, 0x00d8)
-
-/* PRM.EMU_PRM register offsets */
-#define DRA7XX_PM_EMU_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_EMU_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_EMU_DEBUGSS_CONTEXT_OFFSET			0x0024
-
-/* PRM.EMU_CM register offsets */
-#define DRA7XX_CM_EMU_CLKSTCTRL_OFFSET				0x0000
-#define DRA7XX_CM_EMU_DEBUGSS_CLKCTRL_OFFSET			0x0004
-#define DRA7XX_CM_EMU_DEBUGSS_CLKCTRL				DRA7XX_PRM_REGADDR(DRA7XX_PRM_EMU_CM_INST, 0x0004)
-#define DRA7XX_CM_EMU_DYNAMICDEP_OFFSET				0x0008
-#define DRA7XX_CM_EMU_MPU_EMU_DBG_CLKCTRL_OFFSET		0x000c
-#define DRA7XX_CM_EMU_MPU_EMU_DBG_CLKCTRL			DRA7XX_PRM_REGADDR(DRA7XX_PRM_EMU_CM_INST, 0x000c)
-
-/* PRM.DSP2_PRM register offsets */
-#define DRA7XX_PM_DSP2_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_DSP2_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_DSP2_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_DSP2_RSTST_OFFSET				0x0014
-#define DRA7XX_RM_DSP2_DSP2_CONTEXT_OFFSET			0x0024
-
-/* PRM.EVE1_PRM register offsets */
-#define DRA7XX_PM_EVE1_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_EVE1_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_EVE1_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_EVE1_RSTST_OFFSET				0x0014
-#define DRA7XX_PM_EVE1_EVE1_WKDEP_OFFSET			0x0020
-#define DRA7XX_RM_EVE1_EVE1_CONTEXT_OFFSET			0x0024
-
-/* PRM.EVE2_PRM register offsets */
-#define DRA7XX_PM_EVE2_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_EVE2_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_EVE2_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_EVE2_RSTST_OFFSET				0x0014
-#define DRA7XX_PM_EVE2_EVE2_WKDEP_OFFSET			0x0020
-#define DRA7XX_RM_EVE2_EVE2_CONTEXT_OFFSET			0x0024
-
-/* PRM.EVE3_PRM register offsets */
-#define DRA7XX_PM_EVE3_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_EVE3_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_EVE3_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_EVE3_RSTST_OFFSET				0x0014
-#define DRA7XX_PM_EVE3_EVE3_WKDEP_OFFSET			0x0020
-#define DRA7XX_RM_EVE3_EVE3_CONTEXT_OFFSET			0x0024
-
-/* PRM.EVE4_PRM register offsets */
-#define DRA7XX_PM_EVE4_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_EVE4_PWRSTST_OFFSET				0x0004
-#define DRA7XX_RM_EVE4_RSTCTRL_OFFSET				0x0010
-#define DRA7XX_RM_EVE4_RSTST_OFFSET				0x0014
-#define DRA7XX_PM_EVE4_EVE4_WKDEP_OFFSET			0x0020
-#define DRA7XX_RM_EVE4_EVE4_CONTEXT_OFFSET			0x0024
-
-/* PRM.RTC_PRM register offsets */
-#define DRA7XX_PM_RTC_RTCSS_WKDEP_OFFSET			0x0000
-#define DRA7XX_RM_RTC_RTCSS_CONTEXT_OFFSET			0x0004
-
-/* PRM.VPE_PRM register offsets */
-#define DRA7XX_PM_VPE_PWRSTCTRL_OFFSET				0x0000
-#define DRA7XX_PM_VPE_PWRSTST_OFFSET				0x0004
-#define DRA7XX_PM_VPE_VPE_WKDEP_OFFSET				0x0020
-#define DRA7XX_RM_VPE_VPE_CONTEXT_OFFSET			0x0024
-
-/* PRM.DEVICE_PRM register offsets */
-#define DRA7XX_PRM_RSTCTRL_OFFSET				0x0000
-#define DRA7XX_PRM_RSTST_OFFSET					0x0004
-#define DRA7XX_PRM_RSTTIME_OFFSET				0x0008
-#define DRA7XX_PRM_CLKREQCTRL_OFFSET				0x000c
-#define DRA7XX_PRM_VOLTCTRL_OFFSET				0x0010
-#define DRA7XX_PRM_PWRREQCTRL_OFFSET				0x0014
-#define DRA7XX_PRM_PSCON_COUNT_OFFSET				0x0018
-#define DRA7XX_PRM_IO_COUNT_OFFSET				0x001c
-#define DRA7XX_PRM_IO_PMCTRL_OFFSET				0x0020
-#define DRA7XX_PRM_VOLTSETUP_WARMRESET_OFFSET			0x0024
-#define DRA7XX_PRM_VOLTSETUP_CORE_OFF_OFFSET			0x0028
-#define DRA7XX_PRM_VOLTSETUP_MPU_OFF_OFFSET			0x002c
-#define DRA7XX_PRM_VOLTSETUP_MM_OFF_OFFSET			0x0030
-#define DRA7XX_PRM_VOLTSETUP_CORE_RET_SLEEP_OFFSET		0x0034
-#define DRA7XX_PRM_VOLTSETUP_MPU_RET_SLEEP_OFFSET		0x0038
-#define DRA7XX_PRM_VOLTSETUP_MM_RET_SLEEP_OFFSET		0x003c
-#define DRA7XX_PRM_SRAM_COUNT_OFFSET				0x00bc
-#define DRA7XX_PRM_SRAM_WKUP_SETUP_OFFSET			0x00c0
-#define DRA7XX_PRM_SLDO_CORE_SETUP_OFFSET			0x00c4
-#define DRA7XX_PRM_SLDO_CORE_CTRL_OFFSET			0x00c8
-#define DRA7XX_PRM_SLDO_MPU_SETUP_OFFSET			0x00cc
-#define DRA7XX_PRM_SLDO_MPU_CTRL_OFFSET				0x00d0
-#define DRA7XX_PRM_SLDO_GPU_SETUP_OFFSET			0x00d4
-#define DRA7XX_PRM_SLDO_GPU_CTRL_OFFSET				0x00d8
-#define DRA7XX_PRM_ABBLDO_MPU_SETUP_OFFSET			0x00dc
-#define DRA7XX_PRM_ABBLDO_MPU_CTRL_OFFSET			0x00e0
-#define DRA7XX_PRM_ABBLDO_GPU_SETUP_OFFSET			0x00e4
-#define DRA7XX_PRM_ABBLDO_GPU_CTRL_OFFSET			0x00e8
-#define DRA7XX_PRM_BANDGAP_SETUP_OFFSET				0x00ec
-#define DRA7XX_PRM_DEVICE_OFF_CTRL_OFFSET			0x00f0
-#define DRA7XX_PRM_PHASE1_CNDP_OFFSET				0x00f4
-#define DRA7XX_PRM_PHASE2A_CNDP_OFFSET				0x00f8
-#define DRA7XX_PRM_PHASE2B_CNDP_OFFSET				0x00fc
-#define DRA7XX_PRM_MODEM_IF_CTRL_OFFSET				0x0100
-#define DRA7XX_PRM_VOLTST_MPU_OFFSET				0x0110
-#define DRA7XX_PRM_VOLTST_MM_OFFSET				0x0114
-#define DRA7XX_PRM_SLDO_DSPEVE_SETUP_OFFSET			0x0118
-#define DRA7XX_PRM_SLDO_IVA_SETUP_OFFSET			0x011c
-#define DRA7XX_PRM_ABBLDO_DSPEVE_CTRL_OFFSET			0x0120
-#define DRA7XX_PRM_ABBLDO_IVA_CTRL_OFFSET			0x0124
-#define DRA7XX_PRM_SLDO_DSPEVE_CTRL_OFFSET			0x0128
-#define DRA7XX_PRM_SLDO_IVA_CTRL_OFFSET				0x012c
-#define DRA7XX_PRM_ABBLDO_DSPEVE_SETUP_OFFSET			0x0130
-#define DRA7XX_PRM_ABBLDO_IVA_SETUP_OFFSET			0x0134
 
 #endif
-- 
2.33.0
