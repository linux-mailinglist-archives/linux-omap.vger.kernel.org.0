Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A1FB58C1
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 01:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfIQXsd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 19:48:33 -0400
Received: from mail.gallagher.co.nz ([203.167.229.98]:17316 "EHLO
        mail.gallagher.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfIQXsd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 19:48:33 -0400
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by mail.gallagher.co.nz  (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B5d8170ce0001>; Wed, 18 Sep 2019 11:48:30 +1200
Received: from ubuntu.localdomain ([10.60.3.76])
          by gglnzdom1.gallagher.local
          with ESMTP id 2019091811483021-33742 ;
          Wed, 18 Sep 2019 11:48:30 +1200 
From:   Ankur Tyagi <ankur.tyagi@gallagher.com>
To:     t-kristo@ti.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] clk: ti: am3: Update AM3 GPIO number as per datasheet
Date:   Tue, 17 Sep 2019 16:48:28 -0700
Message-Id: <20190917234829.91132-2-ankur.tyagi@gallagher.com>
In-Reply-To: <20190917234829.91132-1-ankur.tyagi@gallagher.com>
References: <20190917234829.91132-1-ankur.tyagi@gallagher.com>
X-TNEFEvaluated: 1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sitara technical reference manual numbers GPIO from 0 whereas in
code GPIO are numbered from 1

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 24 ++++++++++++------------
 drivers/clk/ti/clk-33xx-compat.c | 12 ++++++------
 drivers/clk/ti/clk-33xx.c        | 12 ++++++------
 include/dt-bindings/clock/am3.h  | 16 ++++++++--------
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 46849d6ecb3e..cc0414ccaf29 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -129,7 +129,7 @@
 
 		target-module@7000 {			/* 0x44e07000, ap 14 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio1";
+			ti,hwmods = "gpio0";
 			reg = <0x7000 0x4>,
 			      <0x7010 0x4>,
 			      <0x7114 0x4>;
@@ -143,8 +143,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): wkup_pwrdm, l4_wkup_clkdm */
-			clocks = <&l4_wkup_clkctrl AM3_L4_WKUP_GPIO1_CLKCTRL 0>,
-				 <&l4_wkup_clkctrl AM3_L4_WKUP_GPIO1_CLKCTRL 18>;
+			clocks = <&l4_wkup_clkctrl AM3_L4_WKUP_GPIO0_CLKCTRL 0>,
+				 <&l4_wkup_clkctrl AM3_L4_WKUP_GPIO0_CLKCTRL 18>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1270,7 +1270,7 @@
 
 		target-module@4c000 {			/* 0x4804c000, ap 32 36.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio2";
+			ti,hwmods = "gpio1";
 			reg = <0x4c000 0x4>,
 			      <0x4c010 0x4>,
 			      <0x4c114 0x4>;
@@ -1284,8 +1284,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM3_L4LS_GPIO2_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM3_L4LS_GPIO2_CLKCTRL 18>;
+			clocks = <&l4ls_clkctrl AM3_L4LS_GPIO1_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM3_L4LS_GPIO1_CLKCTRL 18>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1682,7 +1682,7 @@
 
 		target-module@ac000 {			/* 0x481ac000, ap 54 38.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio3";
+			ti,hwmods = "gpio2";
 			reg = <0xac000 0x4>,
 			      <0xac010 0x4>,
 			      <0xac114 0x4>;
@@ -1696,8 +1696,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM3_L4LS_GPIO3_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM3_L4LS_GPIO3_CLKCTRL 18>;
+			clocks = <&l4ls_clkctrl AM3_L4LS_GPIO2_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM3_L4LS_GPIO2_CLKCTRL 18>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1716,7 +1716,7 @@
 
 		target-module@ae000 {			/* 0x481ae000, ap 56 3a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio4";
+			ti,hwmods = "gpio3";
 			reg = <0xae000 0x4>,
 			      <0xae010 0x4>,
 			      <0xae114 0x4>;
@@ -1730,8 +1730,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM3_L4LS_GPIO4_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM3_L4LS_GPIO4_CLKCTRL 18>;
+			clocks = <&l4ls_clkctrl AM3_L4LS_GPIO3_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM3_L4LS_GPIO3_CLKCTRL 18>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/drivers/clk/ti/clk-33xx-compat.c b/drivers/clk/ti/clk-33xx-compat.c
index 3e07f127912a..7c80522a577a 100644
--- a/drivers/clk/ti/clk-33xx-compat.c
+++ b/drivers/clk/ti/clk-33xx-compat.c
@@ -28,17 +28,17 @@ static const char * const am3_gpio1_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio2_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio1_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio3_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio2_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio4_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio3_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
@@ -72,9 +72,9 @@ static const struct omap_clkctrl_reg_data am3_l4_per_clkctrl_regs[] __initconst
 	{ AM3_RNG_CLKCTRL, NULL, CLKF_SW_SUP, "rng_fck" },
 	{ AM3_AES_CLKCTRL, NULL, CLKF_SW_SUP, "aes0_fck", "l3_clkdm" },
 	{ AM3_SHAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
+	{ AM3_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM3_GPIO2_CLKCTRL, am3_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM3_GPIO3_CLKCTRL, am3_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_GPIO4_CLKCTRL, am3_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM3_TPCC_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
 	{ AM3_D_CAN0_CLKCTRL, NULL, CLKF_SW_SUP, "dcan0_fck" },
 	{ AM3_D_CAN1_CLKCTRL, NULL, CLKF_SW_SUP, "dcan1_fck" },
@@ -103,7 +103,7 @@ static const char * const am3_gpio0_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio1_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio0_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio0_dbclk_parents, NULL },
 	{ 0 },
 };
@@ -156,7 +156,7 @@ static const struct omap_clkctrl_bit_data am3_debugss_bit_data[] __initconst = {
 
 static const struct omap_clkctrl_reg_data am3_l4_wkup_clkctrl_regs[] __initconst = {
 	{ AM3_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
-	{ AM3_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
+	{ AM3_GPIO0_CLKCTRL, am3_gpio0_bit_data, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
 	{ AM3_L4_WKUP_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
 	{ AM3_DEBUGSS_CLKCTRL, am3_debugss_bit_data, CLKF_SW_SUP, "l4_wkup_cm:clk:0010:24", "l3_aon_clkdm" },
 	{ AM3_WKUP_M3_CLKCTRL, NULL, CLKF_NO_IDLEST, "dpll_core_m4_div2_ck", "l4_wkup_aon_clkdm" },
diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
index a360d3109555..d67f1f6bbec0 100644
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -28,17 +28,17 @@ static const char * const am3_gpio1_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio2_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio1_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio3_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio2_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio4_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio3_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
@@ -61,9 +61,9 @@ static const struct omap_clkctrl_reg_data am3_l4ls_clkctrl_regs[] __initconst =
 	{ AM3_L4LS_TIMER3_CLKCTRL, NULL, CLKF_SW_SUP, "timer3_fck" },
 	{ AM3_L4LS_TIMER4_CLKCTRL, NULL, CLKF_SW_SUP, "timer4_fck" },
 	{ AM3_L4LS_RNG_CLKCTRL, NULL, CLKF_SW_SUP, "rng_fck" },
+	{ AM3_L4LS_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM3_L4LS_GPIO2_CLKCTRL, am3_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM3_L4LS_GPIO3_CLKCTRL, am3_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_L4LS_GPIO4_CLKCTRL, am3_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM3_L4LS_D_CAN0_CLKCTRL, NULL, CLKF_SW_SUP, "dcan0_fck" },
 	{ AM3_L4LS_D_CAN1_CLKCTRL, NULL, CLKF_SW_SUP, "dcan1_fck" },
 	{ AM3_L4LS_EPWMSS1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
@@ -131,14 +131,14 @@ static const char * const am3_gpio0_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am3_gpio1_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am3_gpio0_bit_data[] __initconst = {
 	{ 18, TI_CLK_GATE, am3_gpio0_dbclk_parents, NULL },
 	{ 0 },
 };
 
 static const struct omap_clkctrl_reg_data am3_l4_wkup_clkctrl_regs[] __initconst = {
 	{ AM3_L4_WKUP_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
-	{ AM3_L4_WKUP_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
+	{ AM3_L4_WKUP_GPIO0_CLKCTRL, am3_gpio0_bit_data, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
 	{ AM3_L4_WKUP_L4_WKUP_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
 	{ AM3_L4_WKUP_UART1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
 	{ AM3_L4_WKUP_I2C1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
diff --git a/include/dt-bindings/clock/am3.h b/include/dt-bindings/clock/am3.h
index 894951541276..980fdc05c3d0 100644
--- a/include/dt-bindings/clock/am3.h
+++ b/include/dt-bindings/clock/am3.h
@@ -41,9 +41,9 @@
 #define AM3_RNG_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x90)
 #define AM3_AES_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x94)
 #define AM3_SHAM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xa0)
-#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
-#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
-#define AM3_GPIO4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
+#define AM3_GPIO1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
+#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
+#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
 #define AM3_TPCC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xbc)
 #define AM3_D_CAN0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc0)
 #define AM3_D_CAN1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc4)
@@ -69,7 +69,7 @@
 #define AM3_L4_WKUP_CLKCTRL_OFFSET	0x4
 #define AM3_L4_WKUP_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_WKUP_CLKCTRL_OFFSET)
 #define AM3_CONTROL_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x4)
-#define AM3_GPIO1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
+#define AM3_GPIO0_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
 #define AM3_L4_WKUP_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc)
 #define AM3_DEBUGSS_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x14)
 #define AM3_WKUP_M3_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb0)
@@ -121,9 +121,9 @@
 #define AM3_L4LS_TIMER3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x84)
 #define AM3_L4LS_TIMER4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x88)
 #define AM3_L4LS_RNG_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0x90)
-#define AM3_L4LS_GPIO2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xac)
-#define AM3_L4LS_GPIO3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb0)
-#define AM3_L4LS_GPIO4_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb4)
+#define AM3_L4LS_GPIO1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xac)
+#define AM3_L4LS_GPIO2_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb0)
+#define AM3_L4LS_GPIO3_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xb4)
 #define AM3_L4LS_D_CAN0_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc0)
 #define AM3_L4LS_D_CAN1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xc4)
 #define AM3_L4LS_EPWMSS1_CLKCTRL	AM3_L4LS_CLKCTRL_INDEX(0xcc)
@@ -184,7 +184,7 @@
 
 /* l4_wkup clocks */
 #define AM3_L4_WKUP_CONTROL_CLKCTRL	AM3_CLKCTRL_INDEX(0x4)
-#define AM3_L4_WKUP_GPIO1_CLKCTRL	AM3_CLKCTRL_INDEX(0x8)
+#define AM3_L4_WKUP_GPIO0_CLKCTRL	AM3_CLKCTRL_INDEX(0x8)
 #define AM3_L4_WKUP_L4_WKUP_CLKCTRL	AM3_CLKCTRL_INDEX(0xc)
 #define AM3_L4_WKUP_UART1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb4)
 #define AM3_L4_WKUP_I2C1_CLKCTRL	AM3_CLKCTRL_INDEX(0xb8)
-- 
2.17.1


###########################################################################
This email is confidential and may contain information subject to legal 
privilege.  If you are not the intended recipient please advise us of our
error by return e-mail then delete this email and any attached files.  
You may not copy, disclose or use the contents in any way.  

The views expressed in this email may not be those of Gallagher Group 
Ltd or subsidiary companies thereof.
###########################################################################
