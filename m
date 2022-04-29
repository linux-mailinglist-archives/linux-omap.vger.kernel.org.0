Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2635142DE
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbiD2HJo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238440AbiD2HJn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 03654BE9CA;
        Fri, 29 Apr 2022 00:06:26 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5F47C8196;
        Fri, 29 Apr 2022 07:03:17 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 03/19] ARM: dts: Group omap3 CM_FCLKEN1_CORE clocks
Date:   Fri, 29 Apr 2022 10:05:57 +0300
Message-Id: <20220429070613.62360-4-tony@atomide.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220429070613.62360-1-tony@atomide.com>
References: <20220429070613.62360-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The clksel related registers on omap3 cause unique_unit_address and
node_name_chars_strict warnings with the W=1 or W=2 make flags enabled.

With the clock drivers updated, we can now avoid most of these warnings
by grouping the TI component clocks using the TI clksel binding, and
with the use of clock-output-names property to avoid non-standard node
names for the clocks.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am35xx-clocks.dtsi          |  19 +-
 arch/arm/boot/dts/omap3430es1-clocks.dtsi     |  51 ++--
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    |  35 ++-
 ...map36xx-am35xx-omap3430es2plus-clocks.dtsi |  19 +-
 .../dts/omap36xx-omap3430es2plus-clocks.dtsi  |  19 +-
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 260 +++++++++---------
 6 files changed, 223 insertions(+), 180 deletions(-)

diff --git a/arch/arm/boot/dts/am35xx-clocks.dtsi b/arch/arm/boot/dts/am35xx-clocks.dtsi
--- a/arch/arm/boot/dts/am35xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am35xx-clocks.dtsi
@@ -90,12 +90,19 @@ uart4_ick_am35xx: uart4_ick_am35xx@a10 {
 		ti,bit-shift = <23>;
 	};
 
-	uart4_fck_am35xx: uart4_fck_am35xx@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <23>;
+	clock@a00 {
+		compatible = "ti,clksel";
+		reg = <0xa00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		uart4_fck_am35xx: clock-uart4-fck-am35xx {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "uart4_fck_am35xx";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <23>;
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/omap3430es1-clocks.dtsi b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
--- a/arch/arm/boot/dts/omap3430es1-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
@@ -46,28 +46,35 @@ gfx_cg2_ck: gfx_cg2_ck@b00 {
 		ti,bit-shift = <2>;
 	};
 
-	d2d_26m_fck: d2d_26m_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&sys_ck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <3>;
-	};
-
-	fshostusb_fck: fshostusb_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <5>;
-	};
-
-	ssi_ssr_gate_fck_3430es1: ssi_ssr_gate_fck_3430es1@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-no-wait-gate-clock";
-		clocks = <&corex2_fck>;
-		ti,bit-shift = <0>;
-		reg = <0x0a00>;
+	clock@a00 {
+		compatible = "ti,clksel";
+		reg = <0xa00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		d2d_26m_fck: clock-d2d-26m-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "d2d_26m_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <3>;
+		};
+
+		fshostusb_fck: clock-fshostusb-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "fshostusb_fck";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <5>;
+		};
+
+		ssi_ssr_gate_fck_3430es1: clock-ssi-ssr-gate-fck-3430es1 {
+			#clock-cells = <0>;
+			compatible = "ti,composite-no-wait-gate-clock";
+			clock-output-names = "ssi_ssr_gate_fck_3430es1";
+			clocks = <&corex2_fck>;
+			ti,bit-shift = <0>;
+		};
 	};
 
 	ssi_ssr_div_fck_3430es1: ssi_ssr_div_fck_3430es1@a40 {
diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -187,14 +187,28 @@ iva2_ck: iva2_ck@0 {
 		ti,bit-shift = <0>;
 	};
 
-	modem_fck: modem_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&sys_ck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <31>;
-	};
+	clock@a00 {
+		compatible = "ti,clksel";
+		reg = <0xa00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		modem_fck: clock-modem-fck {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "modem_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <31>;
+		};
 
+		mspro_fck: clock-mspro-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mspro_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <23>;
+		};
+	};
 	sad2d_ick: sad2d_ick@a10 {
 		#clock-cells = <0>;
 		compatible = "ti,omap3-interface-clock";
@@ -211,13 +225,6 @@ mad2d_ick: mad2d_ick@a18 {
 		ti,bit-shift = <3>;
 	};
 
-	mspro_fck: mspro_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <23>;
-	};
 };
 
 &cm_clockdomains {
diff --git a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
@@ -149,12 +149,19 @@ mmchs3_ick: mmchs3_ick@a10 {
 		ti,bit-shift = <30>;
 	};
 
-	mmchs3_fck: mmchs3_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <30>;
+	clock@a00 {
+		compatible = "ti,clksel";
+		reg = <0xa00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		mmchs3_fck: clock-mmchs3-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mmchs3_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <30>;
+		};
 	};
 
 	dss1_alwon_fck: dss1_alwon_fck_3430es2@e00 {
diff --git a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
@@ -5,12 +5,19 @@
  * Copyright (C) 2013 Texas Instruments, Inc.
  */
 &cm_clocks {
-	ssi_ssr_gate_fck_3430es2: ssi_ssr_gate_fck_3430es2@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-no-wait-gate-clock";
-		clocks = <&corex2_fck>;
-		ti,bit-shift = <0>;
-		reg = <0x0a00>;
+	clock@a00 {
+		compatible = "ti,clksel";
+		reg = <0xa00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		ssi_ssr_gate_fck_3430es2: clock-ssi-ssr-gate-fck-3430es2 {
+			#clock-cells = <0>;
+			compatible = "ti,composite-no-wait-gate-clock";
+			clock-output-names = "ssi_ssr_gate_fck_3430es2";
+			clocks = <&corex2_fck>;
+			ti,bit-shift = <0>;
+		};
 	};
 
 	ssi_ssr_div_fck_3430es2: ssi_ssr_div_fck_3430es2@a40 {
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -603,12 +603,140 @@ rm_ick: rm_ick@c40 {
 		ti,index-starts-at-one;
 	};
 
-	gpt10_gate_fck: gpt10_gate_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <11>;
-		reg = <0x0a00>;
+	/* CM_FCLKEN1_CORE */
+	clock@a00 {
+		compatible = "ti,clksel";
+		reg = <0xa00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		gpt10_gate_fck: clock-gpt10-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt10_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <11>;
+		};
+
+		gpt11_gate_fck: clock-gpt11-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt11_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <12>;
+		};
+
+		mmchs2_fck: clock-mmchs2-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mmchs2_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <25>;
+		};
+
+		mmchs1_fck: clock-mmchs1-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mmchs1_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <24>;
+		};
+
+		i2c3_fck: clock-i2c3-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "i2c3_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <17>;
+		};
+
+		i2c2_fck: clock-i2c2-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "i2c2_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <16>;
+		};
+
+		i2c1_fck: clock-i2c1-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "i2c1_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <15>;
+		};
+
+		mcbsp5_gate_fck: clock-mcbsp5-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "mcbsp5_gate_fck";
+			clocks = <&mcbsp_clks>;
+			ti,bit-shift = <10>;
+		};
+
+		mcbsp1_gate_fck: clock-mcbsp1-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "mcbsp1_gate_fck";
+			clocks = <&mcbsp_clks>;
+			ti,bit-shift = <9>;
+		};
+
+		mcspi4_fck: clock-mcspi4-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mcspi4_fck";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <21>;
+		};
+
+		mcspi3_fck: clock-mcspi3-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mcspi3_fck";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <20>;
+		};
+
+		mcspi2_fck: clock-mcspi2-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mcspi2_fck";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <19>;
+		};
+
+		mcspi1_fck: clock-mcspi1-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "mcspi1_fck";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <18>;
+		};
+
+		uart2_fck: clock-uart2-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "uart2_fck";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <14>;
+		};
+
+		uart1_fck: clock-uart1-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "uart1_fck";
+			clocks = <&core_48m_fck>;
+			ti,bit-shift = <13>;
+		};
+
+		hdq_fck: clock-hdq-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "hdq_fck";
+			clocks = <&core_12m_fck>;
+			ti,bit-shift = <22>;
+		};
 	};
 
 	gpt10_mux_fck: gpt10_mux_fck@a40 {
@@ -625,14 +753,6 @@ gpt10_fck: gpt10_fck {
 		clocks = <&gpt10_gate_fck>, <&gpt10_mux_fck>;
 	};
 
-	gpt11_gate_fck: gpt11_gate_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <12>;
-		reg = <0x0a00>;
-	};
-
 	gpt11_mux_fck: gpt11_mux_fck@a40 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -655,62 +775,6 @@ core_96m_fck: core_96m_fck {
 		clock-div = <1>;
 	};
 
-	mmchs2_fck: mmchs2_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <25>;
-	};
-
-	mmchs1_fck: mmchs1_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <24>;
-	};
-
-	i2c3_fck: i2c3_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <17>;
-	};
-
-	i2c2_fck: i2c2_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <16>;
-	};
-
-	i2c1_fck: i2c1_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <15>;
-	};
-
-	mcbsp5_gate_fck: mcbsp5_gate_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&mcbsp_clks>;
-		ti,bit-shift = <10>;
-		reg = <0x0a00>;
-	};
-
-	mcbsp1_gate_fck: mcbsp1_gate_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&mcbsp_clks>;
-		ti,bit-shift = <9>;
-		reg = <0x0a00>;
-	};
-
 	core_48m_fck: core_48m_fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
@@ -719,54 +783,6 @@ core_48m_fck: core_48m_fck {
 		clock-div = <1>;
 	};
 
-	mcspi4_fck: mcspi4_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <21>;
-	};
-
-	mcspi3_fck: mcspi3_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <20>;
-	};
-
-	mcspi2_fck: mcspi2_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <19>;
-	};
-
-	mcspi1_fck: mcspi1_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <18>;
-	};
-
-	uart2_fck: uart2_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <14>;
-	};
-
-	uart1_fck: uart1_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <13>;
-	};
-
 	core_12m_fck: core_12m_fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
@@ -775,14 +791,6 @@ core_12m_fck: core_12m_fck {
 		clock-div = <1>;
 	};
 
-	hdq_fck: hdq_fck@a00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_12m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <22>;
-	};
-
 	core_l3_ick: core_l3_ick {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
-- 
2.35.2
