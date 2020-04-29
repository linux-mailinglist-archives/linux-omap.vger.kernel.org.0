Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4C71BEA5E
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 23:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgD2VyZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 17:54:25 -0400
Received: from muru.com ([72.249.23.125]:51904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727908AbgD2VyY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Apr 2020 17:54:24 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1FDB1810A;
        Wed, 29 Apr 2020 21:55:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 07/15] ARM: dts: Configure system timers for am335x
Date:   Wed, 29 Apr 2020 14:53:54 -0700
Message-Id: <20200429215402.18125-8-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429215402.18125-1-tony@atomide.com>
References: <20200429215402.18125-1-tony@atomide.com>
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

Cc: devicetree@vger.kernel.org
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  6 ++---
 arch/arm/boot/dts/am33xx.dtsi                 | 24 +++++++++++++++++++
 arch/arm/mach-omap2/board-generic.c           |  2 +-
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  2 --
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    | 10 --------
 5 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -330,9 +330,8 @@ scm_clockdomains: clockdomains {
 			};
 		};
 
-		target-module@31000 {			/* 0x44e31000, ap 25 40.0 */
+		timer1_target: target-module@31000 {	/* 0x44e31000, ap 25 40.0 */
 			compatible = "ti,sysc-omap2-timer", "ti,sysc";
-			ti,hwmods = "timer1";
 			reg = <0x31000 0x4>,
 			      <0x31010 0x4>,
 			      <0x31014 0x4>;
@@ -1117,9 +1116,8 @@ mcasp1: mcasp@0 {
 			};
 		};
 
-		target-module@40000 {			/* 0x48040000, ap 22 1e.0 */
+		timer2_target: target-module@40000 {	/* 0x48040000, ap 22 1e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer2";
 			reg = <0x40000 0x4>,
 			      <0x40010 0x4>,
 			      <0x40014 0x4>;
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -619,3 +619,27 @@ prm_gfx: prm@1100 {
 		#reset-cells = <1>;
 	};
 };
+
+/* Timer for clocksource, configured without interrupts */
+&timer1_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		compatible = "ti,dmtimer";
+		/delete-property/interrupts;
+		/delete-property/interrupts-extended;
+		assigned-clocks = <&timer1_fck>;
+		assigned-clock-parents = <&sys_clkin_ck>;
+	};
+};
+
+/* Timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		compatible = "ti,dmtimer";
+		assigned-clocks = <&timer2_fck>;
+		assigned-clock-parents = <&sys_clkin_ck>;
+	};
+};
diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -236,7 +236,7 @@ DT_MACHINE_START(AM33XX_DT, "Generic AM33XX (Flattened Device Tree)")
 	.init_early	= am33xx_init_early,
 	.init_machine	= omap_generic_init,
 	.init_late	= am33xx_init_late,
-	.init_time	= omap3_gptimer_timer_init,
+	.init_time	= omap_init_time_of,
 	.dt_compat	= am33xx_boards_compat,
 	.restart	= am33xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -367,12 +367,10 @@ struct omap_hwmod am33xx_timer2_hwmod = {
 
 static void omap_hwmod_am33xx_clkctrl(void)
 {
-	CLKCTRL(am33xx_timer2_hwmod, AM33XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer1_hwmod, AM33XX_CM_WKUP_TIMER1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_rtc_hwmod, AM33XX_CM_RTC_RTC_CLKCTRL_OFFSET);
 	PRCM_FLAGS(am33xx_rtc_hwmod, HWMOD_OMAP4_ZERO_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gpmc_hwmod, AM33XX_CM_PER_GPMC_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -265,14 +265,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__control = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 wkup -> timer1 */
-static struct omap_hwmod_ocp_if am33xx_l4_wkup__timer1 = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_timer1_hwmod,
-	.clk		= "dpll_core_m4_div2_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__emif,
 	&am33xx_mpu__l3_main,
@@ -291,9 +283,7 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__control,
 	&am33xx_l4_wkup__smartreflex0,
 	&am33xx_l4_wkup__smartreflex1,
-	&am33xx_l4_wkup__timer1,
 	&am33xx_l4_wkup__rtc,
-	&am33xx_l4_ls__timer2,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__ocmc,
 	NULL,
-- 
2.26.2
