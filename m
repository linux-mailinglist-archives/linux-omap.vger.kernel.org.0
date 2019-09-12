Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E72B06B2
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 04:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbfILCGS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 22:06:18 -0400
Received: from mail.gallagher.co.nz ([203.167.229.98]:10187 "EHLO
        mail.gallagher.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbfILCGS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 22:06:18 -0400
X-Greylist: delayed 905 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Sep 2019 22:06:17 EDT
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by mail.gallagher.co.nz  (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B5d79a4900000>; Thu, 12 Sep 2019 13:51:12 +1200
Received: from ubuntu.localdomain ([10.60.3.76])
          by gglnzdom1.gallagher.local
          with ESMTP id 2019091213511135-285939 ;
          Thu, 12 Sep 2019 13:51:11 +1200 
From:   Ankur Tyagi <ankur.tyagi@gallagher.com>
To:     t-kristo@ti.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     ankur.tyagi@gallagher.com, linux-omap@vger.kernel.org,
        ondrej.pohl@gallagher.com
Subject: [PATCH 2/2] clk: ti: clk-33xx.c: Update GPIO number as per datasheet
Date:   Wed, 11 Sep 2019 18:51:04 -0700
Message-Id: <20190912015104.10737-1-ankur.tyagi@gallagher.com>
X-TNEFEvaluated: 1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sitara technical reference manual numbers GPIO from 0-3 whereas
in code GPIO are numbered from 1-4.

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 drivers/clk/ti/clk-33xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

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
