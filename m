Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F849213D46
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jul 2020 18:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgGCQHq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jul 2020 12:07:46 -0400
Received: from muru.com ([72.249.23.125]:60624 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCQHq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 3 Jul 2020 12:07:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7F553807E;
        Fri,  3 Jul 2020 16:08:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 2/3] ARM: OMAP2+: Drop legacy platform data for am3 and am4 rtc
Date:   Fri,  3 Jul 2020 09:07:30 -0700
Message-Id: <20200703160731.53698-3-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703160731.53698-1-tony@atomide.com>
References: <20200703160731.53698-1-tony@atomide.com>
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

Note that we also must tag rtc as disabled on am43x-epos-evm as
it's not accessible according to commit 4321dc8dff35 ("ARM: AM43XX:
hwmod: Add rtc hwmod"). And we must keep RTC enabled for rtcwake
to work now that we've removed the custom platfor code for
re-enabling the RTC on suspend.

Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  1 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  3 +-
 arch/arm/boot/dts/am43x-epos-evm.dts          |  4 ++
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 ----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 37 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  8 ----
 8 files changed, 5 insertions(+), 59 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -413,7 +413,6 @@ target-module@39000 {			/* 0x44e39000, ap 33 02.0 */
 
 		target-module@3e000 {			/* 0x44e3e000, ap 35 60.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "rtc";
 			reg = <0x3e074 0x4>,
 			      <0x3e078 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -409,9 +409,8 @@ target-module@39000 {			/* 0x44e39000, ap 32 02.0 */
 			ranges = <0x0 0x39000 0x1000>;
 		};
 
-		target-module@3e000 {			/* 0x44e3e000, ap 34 60.0 */
+		rtc_target: target-module@3e000 {	/* 0x44e3e000, ap 34 60.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "rtc";
 			reg = <0x3e074 0x4>,
 			      <0x3e078 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -833,6 +833,10 @@ &epwmss0 {
 	status = "okay";
 };
 
+&rtc_target {
+	status = "disabled";
+};
+
 &tscadc {
 	status = "okay";
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -26,7 +26,6 @@ extern struct omap_hwmod_ocp_if am33xx_mpu__prcm;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_gfx__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
-extern struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__ocmc;
@@ -43,7 +42,6 @@ extern struct omap_hwmod am33xx_ocmcram_hwmod;
 extern struct omap_hwmod am33xx_smartreflex0_hwmod;
 extern struct omap_hwmod am33xx_smartreflex1_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
-extern struct omap_hwmod am33xx_rtc_hwmod;
 
 extern struct omap_hwmod_class am33xx_emif_hwmod_class;
 extern struct omap_hwmod_class am33xx_l4_hwmod_class;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -90,14 +90,6 @@ struct omap_hwmod_ocp_if am33xx_l3_main__gfx = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4 wkup -> rtc */
-struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_rtc_hwmod,
-	.clk		= "clkdiv32k_ick",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3s cfg -> gpmc */
 struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
 	.master		= &am33xx_l3_s_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -26,7 +26,6 @@
 #define CLKCTRL(oh, clkctrl) ((oh).prcm.omap4.clkctrl_offs = (clkctrl))
 #define RSTCTRL(oh, rstctrl) ((oh).prcm.omap4.rstctrl_offs = (rstctrl))
 #define RSTST(oh, rstst) ((oh).prcm.omap4.rstst_offs = (rstst))
-#define PRCM_FLAGS(oh, flag) ((oh).prcm.omap4.flags = (flag))
 
 /*
  * 'l3' class
@@ -274,47 +273,12 @@ struct omap_hwmod am33xx_gpmc_hwmod = {
 	},
 };
 
-
-/*
- * 'rtc' class
- * rtc subsystem
- */
-static struct omap_hwmod_class_sysconfig am33xx_rtc_sysc = {
-	.rev_offs	= 0x0074,
-	.sysc_offs	= 0x0078,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO |
-			  SIDLE_SMART | SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type3,
-};
-
-static struct omap_hwmod_class am33xx_rtc_hwmod_class = {
-	.name		= "rtc",
-	.sysc		= &am33xx_rtc_sysc,
-	.unlock		= &omap_hwmod_rtc_unlock,
-	.lock		= &omap_hwmod_rtc_lock,
-};
-
-struct omap_hwmod am33xx_rtc_hwmod = {
-	.name		= "rtc",
-	.class		= &am33xx_rtc_hwmod_class,
-	.clkdm_name	= "l4_rtc_clkdm",
-	.main_clk	= "clk_32768_ck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static void omap_hwmod_am33xx_clkctrl(void)
 {
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_rtc_hwmod, AM33XX_CM_RTC_RTC_CLKCTRL_OFFSET);
-	PRCM_FLAGS(am33xx_rtc_hwmod, HWMOD_OMAP4_ZERO_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gpmc_hwmod, AM33XX_CM_PER_GPMC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_ls_hwmod, AM33XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM33XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
@@ -343,7 +307,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 		AM43XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_rtc_hwmod, AM43XX_CM_RTC_RTC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gpmc_hwmod, AM43XX_CM_PER_GPMC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -283,7 +283,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__control,
 	&am33xx_l4_wkup__smartreflex0,
 	&am33xx_l4_wkup__smartreflex1,
-	&am33xx_l4_wkup__rtc,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__ocmc,
 	NULL,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -216,11 +216,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	NULL,
 };
 
-static struct omap_hwmod_ocp_if *am43xx_rtc_hwmod_ocp_ifs[] __initdata = {
-	&am33xx_l4_wkup__rtc,
-	NULL,
-};
-
 int __init am43xx_hwmod_init(void)
 {
 	int ret;
@@ -229,8 +224,5 @@ int __init am43xx_hwmod_init(void)
 	omap_hwmod_init();
 	ret = omap_hwmod_register_links(am43xx_hwmod_ocp_ifs);
 
-	if (!ret && of_machine_is_compatible("ti,am4372"))
-		ret = omap_hwmod_register_links(am43xx_rtc_hwmod_ocp_ifs);
-
 	return ret;
 }
-- 
2.27.0
