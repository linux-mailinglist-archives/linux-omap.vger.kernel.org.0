Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3A31CFF95
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 22:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731250AbgELUjS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 16:39:18 -0400
Received: from muru.com ([72.249.23.125]:54188 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731209AbgELUjS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 16:39:18 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3D16C812F;
        Tue, 12 May 2020 20:40:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 6/6] ARM: dts: Configure omap4 and 5 l4_abe for genpd and drop platform data
Date:   Tue, 12 May 2020 13:38:52 -0700
Message-Id: <20200512203852.29499-7-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512203852.29499-1-tony@atomide.com>
References: <20200512203852.29499-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can power off l4_abe domain when not in use when we configure it for
genpd. And with that change, we can now also drop the old unused legacy
platform data.

Note that we also need to now use "simple-pm-bus" instead of "simple-bus"
for PM runtime to get enabled for the bus.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi        |  7 +++--
 arch/arm/boot/dts/omap4.dtsi               |  6 ++++
 arch/arm/boot/dts/omap5-l4-abe.dtsi        |  7 +++--
 arch/arm/boot/dts/omap5.dtsi               |  6 ++++
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 33 ----------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 31 --------------------
 6 files changed, 22 insertions(+), 68 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -1,14 +1,17 @@
 &l4_abe {						/* 0x40100000 */
-	compatible = "ti,omap4-l4-abe", "simple-bus";
+	compatible = "ti,omap4-l4-abe", "simple-pm-bus";
 	reg = <0x40100000 0x400>,
 	      <0x40100400 0x400>;
 	reg-names = "la", "ap";
+	power-domains = <&prm_abe>;
+	clocks = <&abe_clkctrl OMAP4_L4_ABE_CLKCTRL 0>;
+	clock-names = "fck";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x00000000 0x40100000 0x100000>,	/* segment 0 */
 		 <0x49000000 0x49000000 0x100000>;
 	segment@0 {					/* 0x40100000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges =
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -637,6 +637,12 @@ prm_tesla: prm@400 {
 		#reset-cells = <1>;
 	};
 
+	prm_abe: prm@500 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x500 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_core: prm@700 {
 		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x700 0x100>;
diff --git a/arch/arm/boot/dts/omap5-l4-abe.dtsi b/arch/arm/boot/dts/omap5-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap5-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap5-l4-abe.dtsi
@@ -1,14 +1,17 @@
 &l4_abe {						/* 0x40100000 */
-	compatible = "ti,omap5-l4-abe", "simple-bus";
+	compatible = "ti,omap5-l4-abe", "simple-pm-bus";
 	reg = <0x40100000 0x400>,
 	      <0x40100400 0x400>;
 	reg-names = "la", "ap";
+	power-domains = <&prm_abe>;
+	clocks = <&abe_clkctrl OMAP5_L4_ABE_CLKCTRL 0>;
+	clock-names = "fck";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x00000000 0x40100000 0x100000>,	/* segment 0 */
 		 <0x49000000 0x49000000 0x100000>;
 	segment@0 {					/* 0x40100000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges =
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -563,6 +563,12 @@ prm_dsp: prm@400 {
 		#reset-cells = <1>;
 	};
 
+	prm_abe: prm@500 {
+		compatible = "ti,omap5-prm-inst", "ti,omap-prm-inst";
+		reg = <0x500 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_core: prm@700 {
 		compatible = "ti,omap5-prm-inst", "ti,omap-prm-inst";
 		reg = <0x700 0x100>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -124,21 +124,6 @@ static struct omap_hwmod_class omap44xx_l4_hwmod_class = {
 	.name	= "l4",
 };
 
-/* l4_abe */
-static struct omap_hwmod omap44xx_l4_abe_hwmod = {
-	.name		= "l4_abe",
-	.class		= &omap44xx_l4_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_L4ABE_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_AESS_CONTEXT_OFFSET,
-			.lostcontext_mask = OMAP4430_LOSTMEM_AESSMEM_MASK,
-			.flags	      = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
 /* l4_cfg */
 static struct omap_hwmod omap44xx_l4_cfg_hwmod = {
 	.name		= "l4_cfg",
@@ -1007,22 +992,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> l4_abe */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l4_abe = {
-	.master		= &omap44xx_l3_main_1_hwmod,
-	.slave		= &omap44xx_l4_abe_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* mpu -> l4_abe */
-static struct omap_hwmod_ocp_if omap44xx_mpu__l4_abe = {
-	.master		= &omap44xx_mpu_hwmod,
-	.slave		= &omap44xx_l4_abe_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l4_cfg */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l4_cfg = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -1266,8 +1235,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_1__l3_main_3,
 	&omap44xx_l3_main_2__l3_main_3,
 	&omap44xx_l4_cfg__l3_main_3,
-	&omap44xx_l3_main_1__l4_abe,
-	&omap44xx_mpu__l4_abe,
 	&omap44xx_l3_main_1__l4_cfg,
 	&omap44xx_l3_main_2__l4_per,
 	&omap44xx_l4_cfg__l4_wkup,
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -121,19 +121,6 @@ static struct omap_hwmod_class omap54xx_l4_hwmod_class = {
 	.name	= "l4",
 };
 
-/* l4_abe */
-static struct omap_hwmod omap54xx_l4_abe_hwmod = {
-	.name		= "l4_abe",
-	.class		= &omap54xx_l4_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_ABE_L4_ABE_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
 /* l4_cfg */
 static struct omap_hwmod omap54xx_l4_cfg_hwmod = {
 	.name		= "l4_cfg",
@@ -618,22 +605,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__l3_main_3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> l4_abe */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l4_abe = {
-	.master		= &omap54xx_l3_main_1_hwmod,
-	.slave		= &omap54xx_l4_abe_hwmod,
-	.clk		= "abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* mpu -> l4_abe */
-static struct omap_hwmod_ocp_if omap54xx_mpu__l4_abe = {
-	.master		= &omap54xx_mpu_hwmod,
-	.slave		= &omap54xx_l4_abe_hwmod,
-	.clk		= "abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l4_cfg */
 static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l4_cfg = {
 	.master		= &omap54xx_l3_main_1_hwmod,
@@ -741,8 +712,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_1__l3_main_3,
 	&omap54xx_l3_main_2__l3_main_3,
 	&omap54xx_l4_cfg__l3_main_3,
-	&omap54xx_l3_main_1__l4_abe,
-	&omap54xx_mpu__l4_abe,
 	&omap54xx_l3_main_1__l4_cfg,
 	&omap54xx_l3_main_2__l4_per,
 	&omap54xx_l3_main_1__l4_wkup,
-- 
2.26.2
