Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E74DB7F2
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440422AbfJQTot (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:49 -0400
Received: from muru.com ([72.249.23.125]:38004 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389248AbfJQTot (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3080B81AC;
        Thu, 17 Oct 2019 19:45:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 20/21] ARM: OMAP2+: Drop legacy platform data for dra7 wdt
Date:   Thu, 17 Oct 2019 12:44:10 -0700
Message-Id: <20191017194411.18258-21-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017194411.18258-1-tony@atomide.com>
References: <20191017194411.18258-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 47 -----------------------
 2 files changed, 48 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4294,7 +4294,6 @@
 
 		target-module@4000 {			/* 0x4ae14000, ap 7 28.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "wd_timer2";
 			reg = <0x4000 0x4>,
 			      <0x4010 0x4>,
 			      <0x4014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -24,7 +24,6 @@
 #include "cm1_7xx.h"
 #include "cm2_7xx.h"
 #include "prm7xx.h"
-#include "wd_timer.h"
 #include "soc.h"
 
 /* Base offset for all DRA7XX interrupts external to MPUSS */
@@ -1627,43 +1626,6 @@ static struct omap_hwmod dra7xx_vcp2_hwmod = {
 	},
 };
 
-/*
- * 'wd_timer' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_wd_timer_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_wd_timer_hwmod_class = {
-	.name		= "wd_timer",
-	.sysc		= &dra7xx_wd_timer_sysc,
-	.pre_shutdown	= &omap2_wd_timer_disable,
-	.reset		= &omap2_wd_timer_reset,
-};
-
-/* wd_timer2 */
-static struct omap_hwmod dra7xx_wd_timer2_hwmod = {
-	.name		= "wd_timer2",
-	.class		= &dra7xx_wd_timer_hwmod_class,
-	.clkdm_name	= "wkupaon_clkdm",
-	.main_clk	= "sys_32k_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_WKUPAON_WD_TIMER2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_WKUPAON_WD_TIMER2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 
 /*
@@ -2221,14 +2183,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per2__vcp2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_wkup -> wd_timer2 */
-static struct omap_hwmod_ocp_if dra7xx_l4_wkup__wd_timer2 = {
-	.master		= &dra7xx_l4_wkup_hwmod,
-	.slave		= &dra7xx_wd_timer2_hwmod,
-	.clk		= "wkupaon_iclk_mux",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_per2 -> epwmss0 */
 static struct omap_hwmod_ocp_if dra7xx_l4_per2__epwmss0 = {
 	.master		= &dra7xx_l4_per2_hwmod,
@@ -2319,7 +2273,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_per2__vcp1,
 	&dra7xx_l3_main_1__vcp2,
 	&dra7xx_l4_per2__vcp2,
-	&dra7xx_l4_wkup__wd_timer2,
 	&dra7xx_l4_per2__epwmss0,
 	&dra7xx_l4_per2__epwmss1,
 	&dra7xx_l4_per2__epwmss2,
-- 
2.23.0
