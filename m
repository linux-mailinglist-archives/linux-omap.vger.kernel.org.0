Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46C711BC90
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfLKTMM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:12 -0500
Received: from muru.com ([72.249.23.125]:45798 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTMM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:12 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 377B68185;
        Wed, 11 Dec 2019 19:12:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Roger Quadros <rogerq@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Bin Liu <b-liu@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 01/13] ARM: OMAP2+: Drop legacy platform data for am4 ocp2scp
Date:   Wed, 11 Dec 2019 11:11:54 -0800
Message-Id: <20191211191206.12190-2-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211191206.12190-1-tony@atomide.com>
References: <20191211191206.12190-1-tony@atomide.com>
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
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi           |  2 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 45 ----------------------
 2 files changed, 47 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2332,7 +2332,6 @@ usb1: usb@10000 {
 
 		target-module@a8000 {			/* 0x483a8000, ap 125 6c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "ocp2scp0";
 			reg = <0xa8000 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
@@ -2414,7 +2413,6 @@ usb2: usb@10000 {
 
 		target-module@e8000 {			/* 0x483e8000, ap 129 78.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "ocp2scp1";
 			reg = <0xe8000 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -112,35 +112,6 @@ static struct omap_hwmod am43xx_synctimer_hwmod = {
 	},
 };
 
-static struct omap_hwmod_class am43xx_ocp2scp_hwmod_class = {
-	.name	= "ocp2scp",
-};
-
-static struct omap_hwmod am43xx_ocp2scp0_hwmod = {
-	.name		= "ocp2scp0",
-	.class		= &am43xx_ocp2scp_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = AM43XX_CM_PER_USBPHYOCP2SCP0_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_ocp2scp1_hwmod = {
-	.name		= "ocp2scp1",
-	.class		= &am43xx_ocp2scp_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs	= AM43XX_CM_PER_USBPHYOCP2SCP1_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 static struct omap_hwmod_class_sysconfig am43xx_usb_otg_ss_sysc = {
 	.rev_offs	= 0x0000,
@@ -363,20 +334,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__synctimer = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_ls__ocp2scp0 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_ocp2scp0_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__ocp2scp1 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_ocp2scp1_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss0 = {
 	.master         = &am33xx_l3_s_hwmod,
 	.slave          = &am43xx_usb_otg_ss0_hwmod,
@@ -475,8 +432,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
-	&am43xx_l4_ls__ocp2scp0,
-	&am43xx_l4_ls__ocp2scp1,
 	&am43xx_l3_s__usbotgss0,
 	&am43xx_l3_s__usbotgss1,
 	&am43xx_dss__l3_main,
-- 
2.24.1
