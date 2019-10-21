Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F03DF779
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 23:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbfJUVaX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 17:30:23 -0400
Received: from muru.com ([72.249.23.125]:38790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727264AbfJUVaX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 17:30:23 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C66F4810A;
        Mon, 21 Oct 2019 21:30:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/3] ARM: OMAP2+: Drop legacy platform data for am335x musb
Date:   Mon, 21 Oct 2019 14:30:11 -0700
Message-Id: <20191021213011.29110-4-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021213011.29110-1-tony@atomide.com>
References: <20191021213011.29110-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

Cc: Bin Liu <b-liu@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 44 ----------------------
 1 file changed, 44 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -254,39 +254,6 @@ static struct omap_hwmod am33xx_lcdc_hwmod = {
 	},
 };
 
-/*
- * 'usb_otg' class
- * high-speed on-the-go universal serial bus (usb_otg) controller
- */
-static struct omap_hwmod_class_sysconfig am33xx_usbhsotg_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x10,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			  MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class am33xx_usbotg_class = {
-	.name		= "usbotg",
-	.sysc		= &am33xx_usbhsotg_sysc,
-};
-
-static struct omap_hwmod am33xx_usbss_hwmod = {
-	.name		= "usb_otg_hs",
-	.class		= &am33xx_usbotg_class,
-	.clkdm_name	= "l3s_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "usbotg_fck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM33XX_CM_PER_USB0_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-
 /*
  * Interfaces
  */
@@ -386,16 +353,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__timer1 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* usbss */
-/* l3 s -> USBSS interface */
-static struct omap_hwmod_ocp_if am33xx_l3_s__usbss = {
-	.master		= &am33xx_l3_s_hwmod,
-	.slave		= &am33xx_usbss_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU,
-	.flags		= OCPIF_SWSUP_IDLE,
-};
-
 static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__emif,
 	&am33xx_mpu__l3_main,
@@ -441,7 +398,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
-	&am33xx_l3_s__usbss,
 	&am33xx_l3_main__sha0,
 	&am33xx_l3_main__aes0,
 	NULL,
-- 
2.23.0
