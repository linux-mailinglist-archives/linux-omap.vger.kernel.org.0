Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC3A119F3E
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfLJXRl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:41 -0500
Received: from muru.com ([72.249.23.125]:45086 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:41 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 34A648385;
        Tue, 10 Dec 2019 23:18:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 12/14] ARM: OMAP2+: Drop legacy platform data for dra7 aes
Date:   Tue, 10 Dec 2019 15:17:20 -0800
Message-Id: <20191210231722.44215-13-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi               |  2 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 60 -----------------------
 2 files changed, 62 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -654,7 +654,6 @@ hdmi: encoder@58060000 {
 
 		aes1_target: target-module@4b500000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "aes1";
 			reg = <0x4b500080 0x4>,
 			      <0x4b500084 0x4>,
 			      <0x4b500088 0x4>;
@@ -686,7 +685,6 @@ aes1: aes@0 {
 
 		aes2_target: target-module@4b700000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "aes2";
 			reg = <0x4b700080 0x4>,
 			      <0x4b700084 0x4>,
 			      <0x4b700088 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -626,48 +626,6 @@ static struct omap_hwmod dra7xx_dss_hdmi_hwmod = {
 	.parent_hwmod	= &dra7xx_dss_hwmod,
 };
 
-/* AES (the 'P' (public) device) */
-static struct omap_hwmod_class_sysconfig dra7xx_aes_sysc = {
-	.rev_offs	= 0x0080,
-	.sysc_offs	= 0x0084,
-	.syss_offs	= 0x0088,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class dra7xx_aes_hwmod_class = {
-	.name	= "aes",
-	.sysc	= &dra7xx_aes_sysc,
-};
-
-/* AES1 */
-static struct omap_hwmod dra7xx_aes1_hwmod = {
-	.name		= "aes1",
-	.class		= &dra7xx_aes_hwmod_class,
-	.clkdm_name	= "l4sec_clkdm",
-	.main_clk	= "l3_iclk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4SEC_AES1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4SEC_AES1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* AES2 */
-static struct omap_hwmod dra7xx_aes2_hwmod = {
-	.name		= "aes2",
-	.class		= &dra7xx_aes_hwmod_class,
-	.clkdm_name	= "l4sec_clkdm",
-	.main_clk	= "l3_iclk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4SEC_AES2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4SEC_AES2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
 
 
 /*
@@ -1736,22 +1694,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__hdmi = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> aes1 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__aes1 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_aes1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> aes2 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__aes2 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_aes2_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_per1 -> elm */
 static struct omap_hwmod_ocp_if dra7xx_l4_per1__elm = {
 	.master		= &dra7xx_l4_per1_hwmod,
@@ -2121,8 +2063,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__dss,
 	&dra7xx_l3_main_1__dispc,
 	&dra7xx_l3_main_1__hdmi,
-	&dra7xx_l3_main_1__aes1,
-	&dra7xx_l3_main_1__aes2,
 	&dra7xx_l4_per1__elm,
 	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_cfg__mpu,
-- 
2.24.0
