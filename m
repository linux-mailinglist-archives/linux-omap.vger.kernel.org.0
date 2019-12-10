Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC60119F3A
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfLJXRi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:38 -0500
Received: from muru.com ([72.249.23.125]:45078 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:37 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6992B8385;
        Tue, 10 Dec 2019 23:18:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 10/14] ARM: OMAP2+: Drop legacy platform data for dra7 sham
Date:   Tue, 10 Dec 2019 15:17:18 -0800
Message-Id: <20191210231722.44215-11-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 35 -----------------------
 2 files changed, 36 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -718,7 +718,6 @@ aes2: aes@0 {
 
 		sham_target: target-module@4b101000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
-			ti,hwmods = "sham";
 			reg = <0x4b101100 0x4>,
 			      <0x4b101110 0x4>,
 			      <0x4b101114 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -669,32 +669,6 @@ static struct omap_hwmod dra7xx_aes2_hwmod = {
 	},
 };
 
-/* sha0 HIB2 (the 'P' (public) device) */
-static struct omap_hwmod_class_sysconfig dra7xx_sha0_sysc = {
-	.rev_offs	= 0x100,
-	.sysc_offs	= 0x110,
-	.syss_offs	= 0x114,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class dra7xx_sha0_hwmod_class = {
-	.name		= "sham",
-	.sysc		= &dra7xx_sha0_sysc,
-};
-
-static struct omap_hwmod dra7xx_sha0_hwmod = {
-	.name		= "sham",
-	.class		= &dra7xx_sha0_hwmod_class,
-	.clkdm_name	= "l4sec_clkdm",
-	.main_clk	= "l3_iclk_div",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4SEC_SHA2MD51_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4SEC_SHA2MD51_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
 
 /*
  * 'elm' class
@@ -1778,14 +1752,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__aes2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> sha0 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__sha0 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_sha0_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_per1 -> elm */
 static struct omap_hwmod_ocp_if dra7xx_l4_per1__elm = {
 	.master		= &dra7xx_l4_per1_hwmod,
@@ -2157,7 +2123,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__hdmi,
 	&dra7xx_l3_main_1__aes1,
 	&dra7xx_l3_main_1__aes2,
-	&dra7xx_l3_main_1__sha0,
 	&dra7xx_l4_per1__elm,
 	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_cfg__mpu,
-- 
2.24.0
