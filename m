Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F71C16B53F
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbgBXXWL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:22:11 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48842 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbgBXXWL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:22:11 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ONLx8e054490;
        Mon, 24 Feb 2020 17:21:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582586519;
        bh=kjOgXsrESZgMPcQh8nlroFzIl2u5v6OBTQCxTbw4U18=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VO4EVSQgTlHQXGx2BocszJGJ8tcLmWILd+IJY3uiHOFtDMf+yNR/lGuxYdB3fDSJd
         YmT6qyvQH77a31s0naUq6dN8NuZN2kIXTwCeQq6xRM3/LseMOfh0qOmkCKFWvML0PG
         R0rcEy/AFlfSWpa3N7p1ZYtQLsF4WT/UQ4N45d2c=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01ONLxk9095516
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Feb 2020 17:21:59 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 17:21:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 17:21:59 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ONLwS5117540;
        Mon, 24 Feb 2020 17:21:58 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 01ONLwVN021238;
        Mon, 24 Feb 2020 17:21:58 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/3] ARM: OMAP2+: Drop hwmod data for am3 and am4 PRUSS
Date:   Mon, 24 Feb 2020 17:21:50 -0600
Message-ID: <20200224232152.25562-2-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200224232152.25562-1-s-anna@ti.com>
References: <20200224232152.25562-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRUSS hwmod is currently not used in DT, and the new DTS
nodes shall be added using the ti-sysc infrastructure and the
omap-prm reset driver. Drop the legacy hwmod data for the
PRUSS module on both the AM33xx and AM437x family of SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 -----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 33 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    | 10 ------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  9 -----
 5 files changed, 62 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
index 5ef76fe3f33d..75aabbf5ff22 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -24,7 +24,6 @@ extern struct omap_hwmod_ocp_if am33xx_l3_s__l4_wkup;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__l3_instr;
 extern struct omap_hwmod_ocp_if am33xx_mpu__prcm;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__l3_main;
-extern struct omap_hwmod_ocp_if am33xx_pruss__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_gfx__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
 extern struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc;
@@ -42,7 +41,6 @@ extern struct omap_hwmod am33xx_l3_instr_hwmod;
 extern struct omap_hwmod am33xx_l4_ls_hwmod;
 extern struct omap_hwmod am33xx_l4_wkup_hwmod;
 extern struct omap_hwmod am33xx_mpu_hwmod;
-extern struct omap_hwmod am33xx_pruss_hwmod;
 extern struct omap_hwmod am33xx_gfx_hwmod;
 extern struct omap_hwmod am33xx_prcm_hwmod;
 extern struct omap_hwmod am33xx_ocmcram_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
index ac7d5bb1a02f..4731946ee2ab 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -74,14 +74,6 @@ struct omap_hwmod_ocp_if am33xx_l3_s__l3_main = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* pru-icss -> l3 main */
-struct omap_hwmod_ocp_if am33xx_pruss__l3_main = {
-	.master		= &am33xx_pruss_hwmod,
-	.slave		= &am33xx_l3_main_hwmod,
-	.clk		= "l3_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* gfx -> l3 main */
 struct omap_hwmod_ocp_if am33xx_gfx__l3_main = {
 	.master		= &am33xx_gfx_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
index 78ec1bc8e3a1..dc2a684d375d 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -133,34 +133,6 @@ struct omap_hwmod_class am33xx_wkup_m3_hwmod_class = {
 	.name		= "wkup_m3",
 };
 
-/*
- * 'pru-icss' class
- * Programmable Real-Time Unit and Industrial Communication Subsystem
- */
-static struct omap_hwmod_class am33xx_pruss_hwmod_class = {
-	.name	= "pruss",
-};
-
-static struct omap_hwmod_rst_info am33xx_pruss_resets[] = {
-	{ .name = "pruss", .rst_shift = 1 },
-};
-
-/* pru-icss */
-/* Pseudo hwmod for reset control purpose only */
-struct omap_hwmod am33xx_pruss_hwmod = {
-	.name		= "pruss",
-	.class		= &am33xx_pruss_hwmod_class,
-	.clkdm_name	= "pruss_ocp_clkdm",
-	.main_clk	= "pruss_ocp_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-	.rst_lines	= am33xx_pruss_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(am33xx_pruss_resets),
-};
-
 /* gfx */
 /* Pseudo hwmod for reset control purpose only */
 static struct omap_hwmod_class am33xx_gfx_hwmod_class = {
@@ -486,7 +458,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_tptc1_hwmod, AM33XX_CM_PER_TPTC1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_tptc2_hwmod, AM33XX_CM_PER_TPTC2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gfx_hwmod, AM33XX_CM_GFX_GFX_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_pruss_hwmod, AM33XX_CM_PER_PRUSS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM33XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM33XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_ocmcram_hwmod , AM33XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
@@ -494,7 +465,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 
 static void omap_hwmod_am33xx_rst(void)
 {
-	RSTCTRL(am33xx_pruss_hwmod, AM33XX_RM_PER_RSTCTRL_OFFSET);
 	RSTCTRL(am33xx_gfx_hwmod, AM33XX_RM_GFX_RSTCTRL_OFFSET);
 	RSTST(am33xx_gfx_hwmod, AM33XX_RM_GFX_RSTST_OFFSET);
 }
@@ -523,7 +493,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_tptc1_hwmod, AM43XX_CM_PER_TPTC1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_tptc2_hwmod, AM43XX_CM_PER_TPTC2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gfx_hwmod, AM43XX_CM_GFX_GFX_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_pruss_hwmod, AM43XX_CM_PER_PRUSS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM43XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_ocmcram_hwmod , AM43XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
@@ -531,9 +500,7 @@ static void omap_hwmod_am43xx_clkctrl(void)
 
 static void omap_hwmod_am43xx_rst(void)
 {
-	RSTCTRL(am33xx_pruss_hwmod, AM43XX_RM_PER_RSTCTRL_OFFSET);
 	RSTCTRL(am33xx_gfx_hwmod, AM43XX_RM_GFX_RSTCTRL_OFFSET);
-	RSTST(am33xx_pruss_hwmod, AM43XX_RM_PER_RSTST_OFFSET);
 	RSTST(am33xx_gfx_hwmod, AM43XX_RM_GFX_RSTST_OFFSET);
 }
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
index f1ea8c604595..1c258616b9a9 100644
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -233,14 +233,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__wkup_m3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4 hs -> pru-icss */
-static struct omap_hwmod_ocp_if am33xx_l4_hs__pruss = {
-	.master		= &am33xx_l4_hs_hwmod,
-	.slave		= &am33xx_pruss_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main -> debugss */
 static struct omap_hwmod_ocp_if am33xx_l3_main__debugss = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -292,7 +284,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__l3_instr,
 	&am33xx_l3_main__gfx,
 	&am33xx_l3_s__l3_main,
-	&am33xx_pruss__l3_main,
 	&am33xx_wkup_m3__l4_wkup,
 	&am33xx_gfx__l3_main,
 	&am33xx_l3_main__debugss,
@@ -302,7 +293,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__smartreflex1,
 	&am33xx_l4_wkup__timer1,
 	&am33xx_l4_wkup__rtc,
-	&am33xx_l4_hs__pruss,
 	&am33xx_l4_ls__timer2,
 	&am33xx_l3_main__tpcc,
 	&am33xx_l3_s__gpmc,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
index d0867dbd788e..e939dde4a5fe 100644
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -254,13 +254,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_wkup__wkup_m3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l3_main__pruss = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_pruss_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l4_wkup__smartreflex0 = {
 	.master		= &am33xx_l4_wkup_hwmod,
 	.slave		= &am33xx_smartreflex0_hwmod,
@@ -340,7 +333,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_ls__dss_rfbi = {
 
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__synctimer,
-	&am43xx_l3_main__pruss,
 	&am33xx_mpu__l3_main,
 	&am33xx_mpu__prcm,
 	&am33xx_l3_s__l4_ls,
@@ -351,7 +343,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__gfx,
 	&am33xx_l3_s__l3_main,
 	&am43xx_l3_main__emif,
-	&am33xx_pruss__l3_main,
 	&am43xx_wkup_m3__l4_wkup,
 	&am33xx_gfx__l3_main,
 	&am43xx_l4_wkup__wkup_m3,
-- 
2.23.0

