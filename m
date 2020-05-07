Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB61D1C978F
	for <lists+linux-omap@lfdr.de>; Thu,  7 May 2020 19:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgEGRYJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 May 2020 13:24:09 -0400
Received: from muru.com ([72.249.23.125]:53338 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728206AbgEGRYI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 May 2020 13:24:08 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1060880CD;
        Thu,  7 May 2020 17:24:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 10/14] ARM: dts: Configure system timers for omap3
Date:   Thu,  7 May 2020 10:23:26 -0700
Message-Id: <20200507172330.18679-11-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507172330.18679-1-tony@atomide.com>
References: <20200507172330.18679-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now init system timers using the dmtimer and 32k counter
based on only devicetree data and drivers/clocksource timers.
Let's configure the clocksource and clockevent, and drop the old
unused platform data.

As we're just dropping platform data, and the early platform data
init is based on the custom ti,hwmods property, we want to drop
both the platform data and ti,hwmods property in a single patch.

Since the dmtimer can use both 32k clock and system clock as the
source, let's also configure the SoC specific default values. The
board specific dts files can reconfigure these with assigned-clocks
and assigned-clock-parents as needed.

Let's also update the dts file to use #include while at it.

Cc: devicetree@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am3517.dtsi              |  24 +++-
 arch/arm/boot/dts/omap3-beagle.dts         |  33 +++++
 arch/arm/boot/dts/omap3-devkit8000.dts     |  33 +++++
 arch/arm/boot/dts/omap3.dtsi               | 134 +++++++++++++++----
 arch/arm/mach-omap2/board-generic.c        |  10 +-
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 146 +--------------------
 6 files changed, 205 insertions(+), 175 deletions(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -169,5 +169,25 @@ &mmu_isp {
 	status = "disabled";
 };
 
-/include/ "am35xx-clocks.dtsi"
-/include/ "omap36xx-am35xx-omap3430es2plus-clocks.dtsi"
+#include "am35xx-clocks.dtsi"
+#include "omap36xx-am35xx-omap3430es2plus-clocks.dtsi"
+
+/* Preferred always-on timer for clocksource */
+&timer1_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt1_fck>;
+		assigned-clock-parents = <&sys_ck>;
+	};
+};
+
+/* Preferred timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt2_fck>;
+		assigned-clock-parents = <&sys_ck>;
+	};
+};
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -304,6 +304,39 @@ &usbhsehci {
 	phys = <0 &hsusb2_phy>;
 };
 
+/* Unusable as clocksource because of unreliable oscillator */
+&counter32k {
+	status = "disabled";
+};
+
+/* Unusable as clockevent because if unreliable oscillator, allow to idle */
+&timer1_target {
+	/delete-property/ti,no-reset-on-init;
+	/delete-property/ti,no-idle;
+	timer@0 {
+		/delete-property/ti,timer-alwon;
+	};
+};
+
+/* Preferred always-on timer for clocksource */
+&timer12_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		/* Always clocked by secure_32k_fck */
+	};
+};
+
+/* Preferred timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt2_fck>;
+		assigned-clock-parents = <&sys_ck>;
+	};
+};
+
 &twl_gpio {
 	ti,use-leds;
 	/* pullups: BIT(1) */
diff --git a/arch/arm/boot/dts/omap3-devkit8000.dts b/arch/arm/boot/dts/omap3-devkit8000.dts
--- a/arch/arm/boot/dts/omap3-devkit8000.dts
+++ b/arch/arm/boot/dts/omap3-devkit8000.dts
@@ -14,3 +14,36 @@ aliases {
 		display2 = &tv0;
 	};
 };
+
+/* Unusable as clocksource because of unreliable oscillator */
+&counter32k {
+	status = "disabled";
+};
+
+/* Unusable as clockevent because if unreliable oscillator, allow to idle */
+&timer1_target {
+	/delete-property/ti,no-reset-on-init;
+	/delete-property/ti,no-idle;
+	timer@0 {
+		/delete-property/ti,timer-alwon;
+	};
+};
+
+/* Preferred always-on timer for clocksource */
+&timer12_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		/* Always clocked by secure_32k_fck */
+	};
+};
+
+/* Preferred timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt2_fck>;
+		assigned-clock-parents = <&sys_ck>;
+	};
+};
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -193,10 +193,23 @@ cm_clockdomains: clockdomains {
 			};
 		};
 
-		counter32k: counter@48320000 {
-			compatible = "ti,omap-counter32k";
-			reg = <0x48320000 0x20>;
-			ti,hwmods = "counter_32k";
+		target-module@48320000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x48320000 0x4>,
+			      <0x48320004 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>;
+			clocks = <&wkup_32k_fck>, <&omap_32ksync_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48320000 0x1000>;
+
+			counter32k: counter@0 {
+				compatible = "ti,omap-counter32k";
+				reg = <0x0 0x20>;
+			};
 		};
 
 		intc: interrupt-controller@48200000 {
@@ -637,19 +650,63 @@ sham: sham@480c3000 {
 			dma-names = "rx";
 		};
 
-		timer1: timer@48318000 {
-			compatible = "ti,omap3430-timer";
-			reg = <0x48318000 0x400>;
-			interrupts = <37>;
-			ti,hwmods = "timer1";
-			ti,timer-alwon;
+		timer1_target: target-module@48318000 {
+			compatible = "ti,sysc-omap2-timer", "ti,sysc";
+			reg = <0x48318000 0x4>,
+			      <0x48318010 0x4>,
+			      <0x48318014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_EMUFREE |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&gpt1_fck>, <&gpt1_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48318000 0x1000>;
+
+			timer1: timer@0 {
+				compatible = "ti,omap3430-timer";
+				reg = <0x0 0x80>;
+				clocks = <&gpt1_fck>;
+				clock-names = "fck";
+				interrupts = <37>;
+				ti,timer-alwon;
+			};
 		};
 
-		timer2: timer@49032000 {
-			compatible = "ti,omap3430-timer";
-			reg = <0x49032000 0x400>;
-			interrupts = <38>;
-			ti,hwmods = "timer2";
+		timer2_target: target-module@49032000 {
+			compatible = "ti,sysc-omap2-timer", "ti,sysc";
+			reg = <0x49032000 0x4>,
+			      <0x49032010 0x4>,
+			      <0x49032014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_EMUFREE |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&gpt2_fck>, <&gpt2_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49032000 0x1000>;
+
+			timer2: timer@0 {
+				compatible = "ti,omap3430-timer";
+				reg = <0 0x400>;
+				interrupts = <38>;
+			};
 		};
 
 		timer3: timer@49034000 {
@@ -723,13 +780,34 @@ timer11: timer@48088000 {
 			ti,timer-pwm;
 		};
 
-		timer12: timer@48304000 {
-			compatible = "ti,omap3430-timer";
-			reg = <0x48304000 0x400>;
-			interrupts = <95>;
-			ti,hwmods = "timer12";
-			ti,timer-alwon;
-			ti,timer-secure;
+		timer12_target: target-module@48304000 {
+			compatible = "ti,sysc-omap2-timer", "ti,sysc";
+			reg = <0x48304000 0x4>,
+			      <0x48304010 0x4>,
+			      <0x48304014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_EMUFREE |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&gpt12_fck>, <&gpt12_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48304000 0x1000>;
+
+			timer12: timer@0 {
+				compatible = "ti,omap3430-timer";
+				reg = <0 0x400>;
+				interrupts = <95>;
+				ti,timer-alwon;
+				ti,timer-secure;
+			};
 		};
 
 		usbhstll: usbhstll@48062000 {
@@ -886,4 +964,14 @@ ssi_port2: ssi-port@4805b000 {
 	};
 };
 
-/include/ "omap3xxx-clocks.dtsi"
+#include "omap3xxx-clocks.dtsi"
+
+/* Preferred always-on timer for clockevent. Some boards must use dmtimer12 */
+&timer1_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt1_fck>;
+		assigned-clock-parents = <&omap_32k_fck>;
+	};
+};
diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -114,7 +114,7 @@ DT_MACHINE_START(OMAP3_N900_DT, "Nokia RX-51 board")
 	.init_early	= omap3430_init_early,
 	.init_machine	= omap_generic_init,
 	.init_late	= omap3_init_late,
-	.init_time	= omap_init_time,
+	.init_time	= omap_init_time_of,
 	.dt_compat	= n900_boards_compat,
 	.restart	= omap3xxx_restart,
 MACHINE_END
@@ -132,7 +132,7 @@ DT_MACHINE_START(OMAP3_DT, "Generic OMAP3 (Flattened Device Tree)")
 	.init_early	= omap3430_init_early,
 	.init_machine	= omap_generic_init,
 	.init_late	= omap3_init_late,
-	.init_time	= omap_init_time,
+	.init_time	= omap_init_time_of,
 	.dt_compat	= omap3_boards_compat,
 	.restart	= omap3xxx_restart,
 MACHINE_END
@@ -149,7 +149,7 @@ DT_MACHINE_START(OMAP36XX_DT, "Generic OMAP36xx (Flattened Device Tree)")
 	.init_early	= omap3630_init_early,
 	.init_machine	= omap_generic_init,
 	.init_late	= omap3_init_late,
-	.init_time	= omap_init_time,
+	.init_time	= omap_init_time_of,
 	.dt_compat	= omap36xx_boards_compat,
 	.restart	= omap3xxx_restart,
 MACHINE_END
@@ -166,7 +166,7 @@ DT_MACHINE_START(OMAP3_GP_DT, "Generic OMAP3-GP (Flattened Device Tree)")
 	.init_early	= omap3430_init_early,
 	.init_machine	= omap_generic_init,
 	.init_late	= omap3_init_late,
-	.init_time	= omap3_secure_sync32k_timer_init,
+	.init_time	= omap_init_time_of,
 	.dt_compat	= omap3_gp_boards_compat,
 	.restart	= omap3xxx_restart,
 MACHINE_END
@@ -182,7 +182,7 @@ DT_MACHINE_START(AM3517_DT, "Generic AM3517 (Flattened Device Tree)")
 	.init_early	= am35xx_init_early,
 	.init_machine	= omap_generic_init,
 	.init_late	= omap3_init_late,
-	.init_time	= omap3_gptimer_timer_init,
+	.init_time	= omap_init_time_of,
 	.dt_compat	= am3517_boards_compat,
 	.restart	= omap3xxx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
@@ -147,36 +147,6 @@ static struct omap_hwmod_class omap3xxx_timer_hwmod_class = {
 	.sysc = &omap3xxx_timer_sysc,
 };
 
-/* timer1 */
-static struct omap_hwmod omap3xxx_timer1_hwmod = {
-	.name		= "timer1",
-	.main_clk	= "gpt1_fck",
-	.prcm		= {
-		.omap2 = {
-			.module_offs = WKUP_MOD,
-			.idlest_reg_id = 1,
-			.idlest_idle_bit = OMAP3430_ST_GPT1_SHIFT,
-		},
-	},
-	.class		= &omap3xxx_timer_hwmod_class,
-	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
-};
-
-/* timer2 */
-static struct omap_hwmod omap3xxx_timer2_hwmod = {
-	.name		= "timer2",
-	.main_clk	= "gpt2_fck",
-	.prcm		= {
-		.omap2 = {
-			.module_offs = OMAP3430_PER_MOD,
-			.idlest_reg_id = 1,
-			.idlest_idle_bit = OMAP3430_ST_GPT2_SHIFT,
-		},
-	},
-	.class		= &omap3xxx_timer_hwmod_class,
-	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
-};
-
 /* timer3 */
 static struct omap_hwmod omap3xxx_timer3_hwmod = {
 	.name		= "timer3",
@@ -312,21 +282,6 @@ static struct omap_hwmod omap3xxx_timer11_hwmod = {
 	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
 };
 
-/* timer12 */
-static struct omap_hwmod omap3xxx_timer12_hwmod = {
-	.name		= "timer12",
-	.main_clk	= "gpt12_fck",
-	.prcm		= {
-		.omap2 = {
-			.module_offs = WKUP_MOD,
-			.idlest_reg_id = 1,
-			.idlest_idle_bit = OMAP3430_ST_GPT12_SHIFT,
-		},
-	},
-	.class		= &omap3xxx_timer_hwmod_class,
-	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
-};
-
 /*
  * 'wd_timer' class
  * 32-bit watchdog upward counter that generates a pulse on the reset pin on
@@ -1524,38 +1479,6 @@ static struct omap_hwmod omap3xxx_sad2d_hwmod = {
 	.class		= &omap3xxx_sad2d_class,
 };
 
-/*
- * '32K sync counter' class
- * 32-bit ordinary counter, clocked by the falling edge of the 32 khz clock
- */
-static struct omap_hwmod_class_sysconfig omap3xxx_counter_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0004,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap3xxx_counter_hwmod_class = {
-	.name	= "counter",
-	.sysc	= &omap3xxx_counter_sysc,
-};
-
-static struct omap_hwmod omap3xxx_counter_32k_hwmod = {
-	.name		= "counter_32k",
-	.class		= &omap3xxx_counter_hwmod_class,
-	.clkdm_name	= "wkup_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE,
-	.main_clk	= "wkup_32k_fck",
-	.prcm		= {
-		.omap2	= {
-			.module_offs = WKUP_MOD,
-			.idlest_reg_id = 1,
-			.idlest_idle_bit = OMAP3430_ST_32KSYNC_SHIFT,
-		},
-	},
-};
-
 /*
  * 'gpmc' class
  * general purpose memory controller
@@ -1868,25 +1791,6 @@ static struct omap_hwmod_ocp_if omap3xxx_l3__iva = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-
-/* l4_wkup -> timer1 */
-static struct omap_hwmod_ocp_if omap3xxx_l4_wkup__timer1 = {
-	.master		= &omap3xxx_l4_wkup_hwmod,
-	.slave		= &omap3xxx_timer1_hwmod,
-	.clk		= "gpt1_ick",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-
-/* l4_per -> timer2 */
-static struct omap_hwmod_ocp_if omap3xxx_l4_per__timer2 = {
-	.master		= &omap3xxx_l4_per_hwmod,
-	.slave		= &omap3xxx_timer2_hwmod,
-	.clk		= "gpt2_ick",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-
 /* l4_per -> timer3 */
 static struct omap_hwmod_ocp_if omap3xxx_l4_per__timer3 = {
 	.master		= &omap3xxx_l4_per_hwmod,
@@ -1965,15 +1869,6 @@ static struct omap_hwmod_ocp_if omap3xxx_l4_core__timer11 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-
-/* l4_core -> timer12 */
-static struct omap_hwmod_ocp_if omap3xxx_l4_sec__timer12 = {
-	.master		= &omap3xxx_l4_sec_hwmod,
-	.slave		= &omap3xxx_timer12_hwmod,
-	.clk		= "gpt12_ick",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_wkup -> wd_timer2 */
 
 static struct omap_hwmod_ocp_if omap3xxx_l4_wkup__wd_timer2 = {
@@ -2325,16 +2220,6 @@ static struct omap_hwmod_ocp_if omap3xxx_l4_core__hdq1w = {
 	.flags		= OMAP_FIREWALL_L4 | OCPIF_SWSUP_IDLE,
 };
 
-/* l4_wkup -> 32ksync_counter */
-
-
-static struct omap_hwmod_ocp_if omap3xxx_l4_wkup__counter_32k = {
-	.master		= &omap3xxx_l4_wkup_hwmod,
-	.slave		= &omap3xxx_counter_32k_hwmod,
-	.clk		= "omap_32ksync_ick",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* am35xx has Davinci MDIO & EMAC */
 static struct omap_hwmod_class am35xx_mdio_class = {
 	.name = "davinci_mdio",
@@ -2551,8 +2436,6 @@ static struct omap_hwmod_ocp_if *omap3xxx_hwmod_ocp_ifs[] __initdata = {
 	&omap3_l4_core__i2c2,
 	&omap3_l4_core__i2c3,
 	&omap3xxx_l4_wkup__l4_sec,
-	&omap3xxx_l4_wkup__timer1,
-	&omap3xxx_l4_per__timer2,
 	&omap3xxx_l4_per__timer3,
 	&omap3xxx_l4_per__timer4,
 	&omap3xxx_l4_per__timer5,
@@ -2580,27 +2463,10 @@ static struct omap_hwmod_ocp_if *omap3xxx_hwmod_ocp_ifs[] __initdata = {
 	&omap34xx_l4_core__mcspi2,
 	&omap34xx_l4_core__mcspi3,
 	&omap34xx_l4_core__mcspi4,
-	&omap3xxx_l4_wkup__counter_32k,
 	&omap3xxx_l3_main__gpmc,
 	NULL,
 };
 
-/* GP-only hwmod links */
-static struct omap_hwmod_ocp_if *omap34xx_gp_hwmod_ocp_ifs[] __initdata = {
-	&omap3xxx_l4_sec__timer12,
-	NULL,
-};
-
-static struct omap_hwmod_ocp_if *omap36xx_gp_hwmod_ocp_ifs[] __initdata = {
-	&omap3xxx_l4_sec__timer12,
-	NULL,
-};
-
-static struct omap_hwmod_ocp_if *am35xx_gp_hwmod_ocp_ifs[] __initdata = {
-	&omap3xxx_l4_sec__timer12,
-	NULL,
-};
-
 /* crypto hwmod links */
 static struct omap_hwmod_ocp_if *omap34xx_sham_hwmod_ocp_ifs[] __initdata = {
 	&omap3xxx_l4_core__sham,
@@ -2774,7 +2640,7 @@ static bool __init omap3xxx_hwmod_is_hs_ip_block_usable(struct device_node *bus,
 int __init omap3xxx_hwmod_init(void)
 {
 	int r;
-	struct omap_hwmod_ocp_if **h = NULL, **h_gp = NULL, **h_sham = NULL;
+	struct omap_hwmod_ocp_if **h = NULL, **h_sham = NULL;
 	struct omap_hwmod_ocp_if **h_aes = NULL;
 	struct device_node *bus;
 	unsigned int rev;
@@ -2797,18 +2663,15 @@ int __init omap3xxx_hwmod_init(void)
 	    rev == OMAP3430_REV_ES2_1 || rev == OMAP3430_REV_ES3_0 ||
 	    rev == OMAP3430_REV_ES3_1 || rev == OMAP3430_REV_ES3_1_2) {
 		h = omap34xx_hwmod_ocp_ifs;
-		h_gp = omap34xx_gp_hwmod_ocp_ifs;
 		h_sham = omap34xx_sham_hwmod_ocp_ifs;
 		h_aes = omap34xx_aes_hwmod_ocp_ifs;
 	} else if (rev == AM35XX_REV_ES1_0 || rev == AM35XX_REV_ES1_1) {
 		h = am35xx_hwmod_ocp_ifs;
-		h_gp = am35xx_gp_hwmod_ocp_ifs;
 		h_sham = am35xx_sham_hwmod_ocp_ifs;
 		h_aes = am35xx_aes_hwmod_ocp_ifs;
 	} else if (rev == OMAP3630_REV_ES1_0 || rev == OMAP3630_REV_ES1_1 ||
 		   rev == OMAP3630_REV_ES1_2) {
 		h = omap36xx_hwmod_ocp_ifs;
-		h_gp = omap36xx_gp_hwmod_ocp_ifs;
 		h_sham = omap36xx_sham_hwmod_ocp_ifs;
 		h_aes = omap36xx_aes_hwmod_ocp_ifs;
 	} else {
@@ -2820,13 +2683,6 @@ int __init omap3xxx_hwmod_init(void)
 	if (r < 0)
 		return r;
 
-	/* Register GP-only hwmod links. */
-	if (h_gp && omap_type() == OMAP2_DEVICE_TYPE_GP) {
-		r = omap_hwmod_register_links(h_gp);
-		if (r < 0)
-			return r;
-	}
-
 	/*
 	 * Register crypto hwmod links only if they are not disabled in DT.
 	 * If DT information is missing, enable them only for GP devices.
-- 
2.26.2
