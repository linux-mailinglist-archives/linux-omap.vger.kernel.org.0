Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F15119F42
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfLJXRn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:43 -0500
Received: from muru.com ([72.249.23.125]:45098 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:43 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C6D918387;
        Tue, 10 Dec 2019 23:18:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 14/14] ARM: OMAP2+: Drop legacy platform data for dra7 des
Date:   Tue, 10 Dec 2019 15:17:22 -0800
Message-Id: <20191210231722.44215-15-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 37 -----------------------
 2 files changed, 38 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2046,7 +2046,6 @@ target-module@a4000 {			/* 0x480a4000, ap 57 42.0 */
 
 		des_target: target-module@a5000 {	/* 0x480a5000 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "des";
 			reg = <0xa5030 0x4>,
 			      <0xa5034 0x4>,
 			      <0xa5038 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -1336,34 +1336,6 @@ static struct omap_hwmod dra7xx_timer16_hwmod = {
 	},
 };
 
-/* DES (the 'P' (public) device) */
-static struct omap_hwmod_class_sysconfig dra7xx_des_sysc = {
-	.rev_offs	= 0x0030,
-	.sysc_offs	= 0x0034,
-	.syss_offs	= 0x0038,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class dra7xx_des_hwmod_class = {
-	.name	= "des",
-	.sysc	= &dra7xx_des_sysc,
-};
-
-/* DES */
-static struct omap_hwmod dra7xx_des_hwmod = {
-	.name		= "des",
-	.class		= &dra7xx_des_hwmod_class,
-	.clkdm_name	= "l4sec_clkdm",
-	.main_clk	= "l3_iclk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4SEC_DES3DES_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4SEC_DES3DES_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'usb_otg_ss' class
  *
@@ -1942,14 +1914,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per3__timer16 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per1 -> des */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__des = {
-	.master		= &dra7xx_l4_per1_hwmod,
-	.slave		= &dra7xx_des_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_per3 -> usb_otg_ss1 */
 static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss1 = {
 	.master		= &dra7xx_l4_per3_hwmod,
@@ -2092,7 +2056,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_per3__timer14,
 	&dra7xx_l4_per3__timer15,
 	&dra7xx_l4_per3__timer16,
-	&dra7xx_l4_per1__des,
 	&dra7xx_l4_per3__usb_otg_ss1,
 	&dra7xx_l4_per3__usb_otg_ss2,
 	&dra7xx_l4_per3__usb_otg_ss3,
-- 
2.24.0
