Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC3EB4575
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 04:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728906AbfIQCP0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 22:15:26 -0400
Received: from mail.gallagher.co.nz ([203.167.229.98]:10602 "EHLO
        mail.gallagher.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbfIQCP0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 22:15:26 -0400
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by mail.gallagher.co.nz  (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B5d8041b90000>; Tue, 17 Sep 2019 14:15:21 +1200
Received: from ubuntu.localdomain ([10.60.3.76])
          by gglnzdom1.gallagher.local
          with ESMTP id 2019091714152148-21601 ;
          Tue, 17 Sep 2019 14:15:21 +1200 
From:   Ankur Tyagi <ankur.tyagi@gallagher.com>
To:     t-kristo@ti.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] clk: ti: Update AM3/4 GPIO number as per datasheet
Date:   Mon, 16 Sep 2019 19:15:21 -0700
Message-Id: <20190917021521.7012-1-ankur.tyagi@gallagher.com>
X-TNEFEvaluated: 1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sitara technical reference manual numbers GPIO from 0 whereas
in code GPIO are numbered from 1.

Changes since v1:
- Combine changes in single patch to avoid compilation failure
- Update AM4 GPIO numbers as well

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 drivers/clk/ti/clk-33xx-compat.c | 12 ++++++------
 drivers/clk/ti/clk-33xx.c        | 12 ++++++------
 drivers/clk/ti/clk-43xx-compat.c | 16 ++++++++--------
 drivers/clk/ti/clk-43xx.c        | 16 ++++++++--------
 include/dt-bindings/clock/am3.h  | 16 ++++++++--------
 include/dt-bindings/clock/am4.h  | 24 ++++++++++++------------
 6 files changed, 48 insertions(+), 48 deletions(-)

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
