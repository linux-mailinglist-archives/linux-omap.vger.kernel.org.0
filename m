Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7837CDCB66
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409104AbfJRQck (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:40 -0400
Received: from muru.com ([72.249.23.125]:38134 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392259AbfJRQcj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:39 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 10F3D8168;
        Fri, 18 Oct 2019 16:33:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 06/10] ARM: OMAP2+: Drop legacy platform data for am3 and am4 rng
Date:   Fri, 18 Oct 2019 09:32:16 -0700
Message-Id: <20191018163220.3504-7-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  1 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 -----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 29 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  1 -
 7 files changed, 43 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -2044,7 +2044,6 @@
 
 		target-module@10000 {			/* 0x48310000, ap 76 4e.1 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "rng";
 			reg = <0x11fe0 0x4>,
 			      <0x11fe4 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1982,7 +1982,6 @@
 
 		target-module@10000 {			/* 0x48310000, ap 64 4e.1 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "rng";
 			reg = <0x11fe0 0x4>,
 			      <0x11fe4 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -53,7 +53,6 @@ extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc2;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__ocmc;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__sha0;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__aes0;
-extern struct omap_hwmod_ocp_if am33xx_l4_per__rng;
 
 extern struct omap_hwmod am33xx_l3_main_hwmod;
 extern struct omap_hwmod am33xx_l3_s_hwmod;
@@ -66,7 +65,6 @@ extern struct omap_hwmod am33xx_gfx_hwmod;
 extern struct omap_hwmod am33xx_prcm_hwmod;
 extern struct omap_hwmod am33xx_aes0_hwmod;
 extern struct omap_hwmod am33xx_sha0_hwmod;
-extern struct omap_hwmod am33xx_rng_hwmod;
 extern struct omap_hwmod am33xx_ocmcram_hwmod;
 extern struct omap_hwmod am33xx_smartreflex0_hwmod;
 extern struct omap_hwmod am33xx_smartreflex1_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -300,11 +300,3 @@ struct omap_hwmod_ocp_if am33xx_l3_main__aes0 = {
 	.clk		= "aes0_fck",
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
-
-/* l4 per -> rng */
-struct omap_hwmod_ocp_if am33xx_l4_per__rng = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_rng_hwmod,
-	.clk		= "rng_fck",
-	.user		= OCP_USER_MPU,
-};
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -265,33 +265,6 @@ struct omap_hwmod am33xx_sha0_hwmod = {
 	},
 };
 
-/* rng */
-static struct omap_hwmod_class_sysconfig am33xx_rng_sysc = {
-	.rev_offs	= 0x1fe0,
-	.sysc_offs	= 0x1fe4,
-	.sysc_flags	= SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE,
-	.idlemodes	= SIDLE_FORCE | SIDLE_NO,
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am33xx_rng_hwmod_class = {
-	.name		= "rng",
-	.sysc		= &am33xx_rng_sysc,
-};
-
-struct omap_hwmod am33xx_rng_hwmod = {
-	.name		= "rng",
-	.class		= &am33xx_rng_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE,
-	.main_clk	= "rng_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* ocmcram */
 static struct omap_hwmod_class am33xx_ocmcram_hwmod_class = {
 	.name = "ocmcram",
@@ -879,7 +852,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_ocmcram_hwmod , AM33XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_sha0_hwmod , AM33XX_CM_PER_SHA0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_aes0_hwmod , AM33XX_CM_PER_AES0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_rng_hwmod, AM33XX_CM_PER_RNG_CLKCTRL_OFFSET);
 }
 
 static void omap_hwmod_am33xx_rst(void)
@@ -935,7 +907,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_ocmcram_hwmod , AM43XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_sha0_hwmod , AM43XX_CM_PER_SHA0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_aes0_hwmod , AM43XX_CM_PER_AES0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_rng_hwmod, AM43XX_CM_PER_RNG_CLKCTRL_OFFSET);
 }
 
 static void omap_hwmod_am43xx_rst(void)
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -447,7 +447,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_s__usbss,
 	&am33xx_l3_main__sha0,
 	&am33xx_l3_main__aes0,
-	&am33xx_l4_per__rng,
 	NULL,
 };
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -786,7 +786,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l3_s__qspi,
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
-	&am33xx_l4_per__rng,
 	&am33xx_l4_ls__mcasp0,
 	&am33xx_l4_ls__mcasp1,
 	&am33xx_l4_ls__timer2,
-- 
2.23.0
