Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC6AB58C3
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 01:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfIQXsd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 19:48:33 -0400
Received: from mail.gallagher.co.nz ([203.167.229.98]:17315 "EHLO
        mail.gallagher.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfIQXsd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 19:48:33 -0400
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by mail.gallagher.co.nz  (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B5d8170ce0002>; Wed, 18 Sep 2019 11:48:30 +1200
Received: from ubuntu.localdomain ([10.60.3.76])
          by gglnzdom1.gallagher.local
          with ESMTP id 2019091811483043-33743 ;
          Wed, 18 Sep 2019 11:48:30 +1200 
From:   Ankur Tyagi <ankur.tyagi@gallagher.com>
To:     t-kristo@ti.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] clk: ti: am4: Update AM4 GPIO number as per datasheet
Date:   Tue, 17 Sep 2019 16:48:29 -0700
Message-Id: <20190917234829.91132-3-ankur.tyagi@gallagher.com>
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
 arch/arm/boot/dts/am437x-l4.dtsi | 36 ++++++++++++++++----------------
 drivers/clk/ti/clk-43xx-compat.c | 16 +++++++-------
 drivers/clk/ti/clk-43xx.c        | 16 +++++++-------
 include/dt-bindings/clock/am4.h  | 24 ++++++++++-----------
 4 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index 04bee4ff9dcb..32c82709cd45 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -132,7 +132,7 @@
 
 		target-module@7000 {			/* 0x44e07000, ap 14 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio1";
+			ti,hwmods = "gpio0";
 			reg = <0x7000 0x4>,
 			      <0x7010 0x4>,
 			      <0x7114 0x4>;
@@ -146,8 +146,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): wkup_pwrdm, l4_wkup_clkdm */
-			clocks = <&l4_wkup_clkctrl AM4_L4_WKUP_GPIO1_CLKCTRL 0>,
-				 <&l4_wkup_clkctrl AM4_L4_WKUP_GPIO1_CLKCTRL 8>;
+			clocks = <&l4_wkup_clkctrl AM4_L4_WKUP_GPIO0_CLKCTRL 0>,
+				 <&l4_wkup_clkctrl AM4_L4_WKUP_GPIO0_CLKCTRL 8>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1050,7 +1050,7 @@
 
 		target-module@4c000 {			/* 0x4804c000, ap 28 36.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio2";
+			ti,hwmods = "gpio1";
 			reg = <0x4c000 0x4>,
 			      <0x4c010 0x4>,
 			      <0x4c114 0x4>;
@@ -1064,8 +1064,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO2_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM4_L4LS_GPIO2_CLKCTRL 8>;
+			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO1_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM4_L4LS_GPIO1_CLKCTRL 8>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1477,7 +1477,7 @@
 
 		target-module@ac000 {			/* 0x481ac000, ap 46 30.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio3";
+			ti,hwmods = "gpio2";
 			reg = <0xac000 0x4>,
 			      <0xac010 0x4>,
 			      <0xac114 0x4>;
@@ -1491,8 +1491,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO3_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM4_L4LS_GPIO3_CLKCTRL 8>;
+			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO2_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM4_L4LS_GPIO2_CLKCTRL 8>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1512,7 +1512,7 @@
 
 		target-module@ae000 {			/* 0x481ae000, ap 48 32.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio4";
+			ti,hwmods = "gpio3";
 			reg = <0xae000 0x4>,
 			      <0xae010 0x4>,
 			      <0xae114 0x4>;
@@ -1526,8 +1526,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO4_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM4_L4LS_GPIO4_CLKCTRL 8>;
+			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO3_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM4_L4LS_GPIO3_CLKCTRL 8>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -2040,7 +2040,7 @@
 
 		target-module@20000 {			/* 0x48320000, ap 82 34.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio5";
+			ti,hwmods = "gpio4";
 			reg = <0x20000 0x4>,
 			      <0x20010 0x4>,
 			      <0x20114 0x4>;
@@ -2054,8 +2054,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO5_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM4_L4LS_GPIO5_CLKCTRL 8>;
+			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO4_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM4_L4LS_GPIO4_CLKCTRL 8>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -2075,7 +2075,7 @@
 
 		target-module@22000 {			/* 0x48322000, ap 116 64.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio6";
+			ti,hwmods = "gpio5";
 			reg = <0x22000 0x4>,
 			      <0x22010 0x4>,
 			      <0x22114 0x4>;
@@ -2089,8 +2089,8 @@
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO6_CLKCTRL 0>,
-				 <&l4ls_clkctrl AM4_L4LS_GPIO6_CLKCTRL 8>;
+			clocks = <&l4ls_clkctrl AM4_L4LS_GPIO5_CLKCTRL 0>,
+				 <&l4ls_clkctrl AM4_L4LS_GPIO5_CLKCTRL 8>;
 			clock-names = "fck", "dbclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/drivers/clk/ti/clk-43xx-compat.c b/drivers/clk/ti/clk-43xx-compat.c
index 513039843392..915b73fa9da4 100644
--- a/drivers/clk/ti/clk-43xx-compat.c
+++ b/drivers/clk/ti/clk-43xx-compat.c
@@ -38,7 +38,7 @@ static const char * const am4_gpio0_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio1_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio0_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio0_dbclk_parents, NULL },
 	{ 0 },
 };
@@ -55,7 +55,7 @@ static const struct omap_clkctrl_reg_data am4_l4_wkup_clkctrl_regs[] __initconst
 	{ AM4_SMARTREFLEX0_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex0_fck", "l4_wkup_clkdm" },
 	{ AM4_SMARTREFLEX1_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex1_fck", "l4_wkup_clkdm" },
 	{ AM4_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "sys_clkin_ck", "l4_wkup_clkdm" },
-	{ AM4_GPIO1_CLKCTRL, am4_gpio1_bit_data, CLKF_SW_SUP, "sys_clkin_ck", "l4_wkup_clkdm" },
+	{ AM4_GPIO0_CLKCTRL, am4_gpio0_bit_data, CLKF_SW_SUP, "sys_clkin_ck", "l4_wkup_clkdm" },
 	{ 0 },
 };
 
@@ -94,27 +94,27 @@ static const char * const am4_gpio1_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio2_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio1_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio3_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio2_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio4_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio3_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio5_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio4_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio6_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio5_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
@@ -151,11 +151,11 @@ static const struct omap_clkctrl_reg_data am4_l4_per_clkctrl_regs[] __initconst
 	{ AM4_EPWMSS4_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_EPWMSS5_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_ELM_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_GPIO1_CLKCTRL, am4_gpio1_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_GPIO2_CLKCTRL, am4_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_GPIO3_CLKCTRL, am4_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_GPIO4_CLKCTRL, am4_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_GPIO5_CLKCTRL, am4_gpio5_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_GPIO6_CLKCTRL, am4_gpio6_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_HDQ1W_CLKCTRL, NULL, CLKF_SW_SUP, "func_12m_clk" },
 	{ AM4_I2C2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
 	{ AM4_I2C3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
index 2782d91838ac..d182c4f1f156 100644
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -49,7 +49,7 @@ static const char * const am4_gpio0_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio1_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio0_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio0_dbclk_parents, NULL },
 	{ 0 },
 };
@@ -63,7 +63,7 @@ static const struct omap_clkctrl_reg_data am4_l4_wkup_clkctrl_regs[] __initconst
 	{ AM4_L4_WKUP_SMARTREFLEX0_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex0_fck" },
 	{ AM4_L4_WKUP_SMARTREFLEX1_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex1_fck" },
 	{ AM4_L4_WKUP_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "sys_clkin_ck" },
-	{ AM4_L4_WKUP_GPIO1_CLKCTRL, am4_gpio1_bit_data, CLKF_SW_SUP, "sys_clkin_ck" },
+	{ AM4_L4_WKUP_GPIO0_CLKCTRL, am4_gpio0_bit_data, CLKF_SW_SUP, "sys_clkin_ck" },
 	{ 0 },
 };
 
@@ -135,27 +135,27 @@ static const char * const am4_gpio1_dbclk_parents[] __initconst = {
 	NULL,
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio2_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio1_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio3_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio2_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio4_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio3_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio5_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio4_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
 
-static const struct omap_clkctrl_bit_data am4_gpio6_bit_data[] __initconst = {
+static const struct omap_clkctrl_bit_data am4_gpio5_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
 	{ 0 },
 };
@@ -171,11 +171,11 @@ static const struct omap_clkctrl_reg_data am4_l4ls_clkctrl_regs[] __initconst =
 	{ AM4_L4LS_EPWMSS4_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_L4LS_EPWMSS5_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_L4LS_ELM_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_GPIO1_CLKCTRL, am4_gpio1_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_L4LS_GPIO2_CLKCTRL, am4_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_L4LS_GPIO3_CLKCTRL, am4_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_L4LS_GPIO4_CLKCTRL, am4_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_L4LS_GPIO5_CLKCTRL, am4_gpio5_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_L4LS_GPIO6_CLKCTRL, am4_gpio6_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_L4LS_HDQ1W_CLKCTRL, NULL, CLKF_SW_SUP, "func_12m_clk" },
 	{ AM4_L4LS_I2C2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
 	{ AM4_L4LS_I2C3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
diff --git a/include/dt-bindings/clock/am4.h b/include/dt-bindings/clock/am4.h
index d961e7cb3682..f33647d730ce 100644
--- a/include/dt-bindings/clock/am4.h
+++ b/include/dt-bindings/clock/am4.h
@@ -22,7 +22,7 @@
 #define AM4_SMARTREFLEX0_CLKCTRL	AM4_CLKCTRL_INDEX(0x350)
 #define AM4_SMARTREFLEX1_CLKCTRL	AM4_CLKCTRL_INDEX(0x358)
 #define AM4_CONTROL_CLKCTRL	AM4_CLKCTRL_INDEX(0x360)
-#define AM4_GPIO1_CLKCTRL	AM4_CLKCTRL_INDEX(0x368)
+#define AM4_GPIO0_CLKCTRL	AM4_CLKCTRL_INDEX(0x368)
 
 /* mpu clocks */
 #define AM4_MPU_CLKCTRL	AM4_CLKCTRL_INDEX(0x20)
@@ -65,11 +65,11 @@
 #define AM4_EPWMSS4_CLKCTRL	AM4_CLKCTRL_INDEX(0x458)
 #define AM4_EPWMSS5_CLKCTRL	AM4_CLKCTRL_INDEX(0x460)
 #define AM4_ELM_CLKCTRL	AM4_CLKCTRL_INDEX(0x468)
-#define AM4_GPIO2_CLKCTRL	AM4_CLKCTRL_INDEX(0x478)
-#define AM4_GPIO3_CLKCTRL	AM4_CLKCTRL_INDEX(0x480)
-#define AM4_GPIO4_CLKCTRL	AM4_CLKCTRL_INDEX(0x488)
-#define AM4_GPIO5_CLKCTRL	AM4_CLKCTRL_INDEX(0x490)
-#define AM4_GPIO6_CLKCTRL	AM4_CLKCTRL_INDEX(0x498)
+#define AM4_GPIO1_CLKCTRL	AM4_CLKCTRL_INDEX(0x478)
+#define AM4_GPIO2_CLKCTRL	AM4_CLKCTRL_INDEX(0x480)
+#define AM4_GPIO3_CLKCTRL	AM4_CLKCTRL_INDEX(0x488)
+#define AM4_GPIO4_CLKCTRL	AM4_CLKCTRL_INDEX(0x490)
+#define AM4_GPIO5_CLKCTRL	AM4_CLKCTRL_INDEX(0x498)
 #define AM4_HDQ1W_CLKCTRL	AM4_CLKCTRL_INDEX(0x4a0)
 #define AM4_I2C2_CLKCTRL	AM4_CLKCTRL_INDEX(0x4a8)
 #define AM4_I2C3_CLKCTRL	AM4_CLKCTRL_INDEX(0x4b0)
@@ -128,7 +128,7 @@
 #define AM4_L4_WKUP_SMARTREFLEX0_CLKCTRL	AM4_L4_WKUP_CLKCTRL_INDEX(0x350)
 #define AM4_L4_WKUP_SMARTREFLEX1_CLKCTRL	AM4_L4_WKUP_CLKCTRL_INDEX(0x358)
 #define AM4_L4_WKUP_CONTROL_CLKCTRL	AM4_L4_WKUP_CLKCTRL_INDEX(0x360)
-#define AM4_L4_WKUP_GPIO1_CLKCTRL	AM4_L4_WKUP_CLKCTRL_INDEX(0x368)
+#define AM4_L4_WKUP_GPIO0_CLKCTRL	AM4_L4_WKUP_CLKCTRL_INDEX(0x368)
 
 /* mpu clocks */
 #define AM4_MPU_MPU_CLKCTRL	AM4_CLKCTRL_INDEX(0x20)
@@ -183,11 +183,11 @@
 #define AM4_L4LS_EPWMSS4_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x458)
 #define AM4_L4LS_EPWMSS5_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x460)
 #define AM4_L4LS_ELM_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x468)
-#define AM4_L4LS_GPIO2_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x478)
-#define AM4_L4LS_GPIO3_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x480)
-#define AM4_L4LS_GPIO4_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x488)
-#define AM4_L4LS_GPIO5_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x490)
-#define AM4_L4LS_GPIO6_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x498)
+#define AM4_L4LS_GPIO1_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x478)
+#define AM4_L4LS_GPIO2_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x480)
+#define AM4_L4LS_GPIO3_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x488)
+#define AM4_L4LS_GPIO4_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x490)
+#define AM4_L4LS_GPIO5_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x498)
 #define AM4_L4LS_HDQ1W_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x4a0)
 #define AM4_L4LS_I2C2_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x4a8)
 #define AM4_L4LS_I2C3_CLKCTRL	AM4_L4LS_CLKCTRL_INDEX(0x4b0)
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
