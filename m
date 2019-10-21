Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8ADF6D0
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 22:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbfJUUej (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 16:34:39 -0400
Received: from muru.com ([72.249.23.125]:38734 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729406AbfJUUej (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 16:34:39 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5793880CC;
        Mon, 21 Oct 2019 20:35:09 +0000 (UTC)
Date:   Mon, 21 Oct 2019 13:34:31 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 08/10] ARM: OMAP2+: Drop legacy platform data for am3 and
 am4 mcasp
Message-ID: <20191021203431.GG5610@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
 <20191018163220.3504-9-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018163220.3504-9-tony@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191018 16:33]:
> We can now probe devices with ti-sysc interconnect driver and dts
> data. Let's drop the related platform data and custom ti,hwmods
> dts property.
> 
> As we're just dropping data, and the early platform data init
> is based on the custom ti,hwmods property, we want to drop both
> the platform data and ti,hwmods property in a single patch.

Sorry this one left behind some empty platform data causing an
on bbb. Updated patch below.

Regards,

Tony

8< ---------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Thu, 17 Oct 2019 13:26:56 -0700
Subject: [PATCHv2] ARM: OMAP2+: Drop legacy platform data for am3 and am4
 mcasp

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  2 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  2 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  4 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  | 16 -------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 45 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  2 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  2 -
 7 files changed, 73 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1039,7 +1039,6 @@
 
 		target-module@38000 {			/* 0x48038000, ap 16 02.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp0";
 			reg = <0x38000 0x4>,
 			      <0x38004 0x4>;
 			reg-names = "rev", "sysc";
@@ -1070,7 +1069,6 @@
 
 		target-module@3c000 {			/* 0x4803c000, ap 20 32.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp1";
 			reg = <0x3c000 0x4>,
 			      <0x3c004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -810,7 +810,6 @@
 
 		target-module@38000 {			/* 0x48038000, ap 14 04.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp0";
 			reg = <0x38000 0x4>,
 			      <0x38004 0x4>;
 			reg-names = "rev", "sysc";
@@ -842,7 +841,6 @@
 
 		target-module@3c000 {			/* 0x4803c000, ap 16 2a.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp1";
 			reg = <0x3c000 0x4>,
 			      <0x3c004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -36,8 +36,6 @@ extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss2;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__spinlock;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp0;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi0;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
@@ -75,8 +73,6 @@ extern struct omap_hwmod am33xx_epwmss0_hwmod;
 extern struct omap_hwmod am33xx_epwmss1_hwmod;
 extern struct omap_hwmod am33xx_epwmss2_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
-extern struct omap_hwmod am33xx_mcasp0_hwmod;
-extern struct omap_hwmod am33xx_mcasp1_hwmod;
 extern struct omap_hwmod am33xx_rtc_hwmod;
 extern struct omap_hwmod am33xx_spi0_hwmod;
 extern struct omap_hwmod am33xx_spi1_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -166,22 +166,6 @@ struct omap_hwmod_ocp_if am33xx_l4_ls__spinlock = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 ls -> mcasp0 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp0 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_mcasp0_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4 ls -> mcasp1 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp1 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_mcasp1_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l4 ls -> mcspi0 */
 struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi0 = {
 	.master		= &am33xx_l4_ls_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -468,47 +468,6 @@ struct omap_hwmod am33xx_gpmc_hwmod = {
 	},
 };
 
-/*
- * 'mcasp' class
- */
-static struct omap_hwmod_class_sysconfig am33xx_mcasp_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x4,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type3,
-};
-
-static struct omap_hwmod_class am33xx_mcasp_hwmod_class = {
-	.name		= "mcasp",
-	.sysc		= &am33xx_mcasp_sysc,
-};
-
-/* mcasp0 */
-struct omap_hwmod am33xx_mcasp0_hwmod = {
-	.name		= "mcasp0",
-	.class		= &am33xx_mcasp_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-	.main_clk	= "mcasp0_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcasp1 */
-struct omap_hwmod am33xx_mcasp1_hwmod = {
-	.name		= "mcasp1",
-	.class		= &am33xx_mcasp_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-	.main_clk	= "mcasp1_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'rtc' class
@@ -819,8 +778,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM33XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM33XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM33XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp0_hwmod, AM33XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp1_hwmod, AM33XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM33XX_CM_PER_SPI0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi1_hwmod, AM33XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM33XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
@@ -875,8 +832,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM43XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM43XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM43XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp0_hwmod, AM43XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp1_hwmod, AM43XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM43XX_CM_PER_SPI0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi1_hwmod, AM43XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM43XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -422,8 +422,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_hs__pruss,
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
-	&am33xx_l4_ls__mcasp0,
-	&am33xx_l4_ls__mcasp1,
 	&am33xx_l4_ls__timer2,
 	&am33xx_l4_ls__timer3,
 	&am33xx_l4_ls__timer4,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -786,8 +786,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l3_s__qspi,
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
-	&am33xx_l4_ls__mcasp0,
-	&am33xx_l4_ls__mcasp1,
 	&am33xx_l4_ls__timer2,
 	&am33xx_l4_ls__timer3,
 	&am33xx_l4_ls__timer4,
-- 
2.23.0
