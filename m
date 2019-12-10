Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7490A119F40
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfLJXRm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:42 -0500
Received: from muru.com ([72.249.23.125]:45092 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:42 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 911AB820B;
        Tue, 10 Dec 2019 23:18:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 13/14] ARM: OMAP2+: Drop legacy platform data for am4 des
Date:   Tue, 10 Dec 2019 15:17:21 -0800
Message-Id: <20191210231722.44215-14-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210231722.44215-1-tony@atomide.com>
References: <20191210231722.44215-1-tony@atomide.com>
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
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi              |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 33 ----------------------
 2 files changed, 34 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -316,7 +316,6 @@ aes: aes@0 {
 
 		des_target: target-module@53701000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "des";
 			reg = <0x53701030 0x4>,
 			      <0x53701034 0x4>,
 			      <0x53701038 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -347,31 +347,6 @@ static struct omap_hwmod am43xx_adc_tsc_hwmod = {
 	},
 };
 
-static struct omap_hwmod_class_sysconfig am43xx_des_sysc = {
-	.rev_offs	= 0x30,
-	.sysc_offs	= 0x34,
-	.syss_offs	= 0x38,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class am43xx_des_hwmod_class = {
-	.name		= "des",
-	.sysc		= &am43xx_des_sysc,
-};
-
-static struct omap_hwmod am43xx_des_hwmod = {
-	.name		= "des",
-	.class		= &am43xx_des_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_PER_DES_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* dss */
 
 static struct omap_hwmod am43xx_dss_core_hwmod = {
@@ -711,13 +686,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_ls__vpfe1 = {
 	.user           = OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l3_main__des = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am43xx_des_hwmod,
-	.clk		= "l3_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__synctimer,
 	&am43xx_l4_ls__timer8,
@@ -771,7 +739,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
-	&am43xx_l3_main__des,
 	&am43xx_l4_ls__ocp2scp0,
 	&am43xx_l4_ls__ocp2scp1,
 	&am43xx_l3_s__usbotgss0,
-- 
2.24.0
