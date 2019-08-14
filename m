Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 911EC8D459
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfHNNOZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:14:25 -0400
Received: from muru.com ([72.249.23.125]:57646 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfHNNOZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:14:25 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 360658216;
        Wed, 14 Aug 2019 13:14:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Filip=20Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/6] clk: ti: add clkctrl data omap5 sgx
Date:   Wed, 14 Aug 2019 06:14:05 -0700
Message-Id: <20190814131408.57162-4-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814131408.57162-1-tony@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like we have sgx clock missing currently so let's add it.

Cc: Adam Ford <aford173@gmail.com>
Cc: Filip Matijević <filip.matijevic.pz@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: moaz korena <moaz@korena.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Philipp Rossak <embed3d@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk-54xx.c         | 34 +++++++++++++++++++++++++++++++
 include/dt-bindings/clock/omap5.h |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -314,6 +314,39 @@ static const struct omap_clkctrl_reg_data omap5_dss_clkctrl_regs[] __initconst =
 	{ 0 },
 };
 
+static const char * const omap5_gpu_core_mux_parents[] __initconst = {
+	"dpll_core_h14x2_ck",
+	"dpll_per_h14x2_ck",
+	NULL,
+};
+
+static const char * const omap5_gpu_hyd_mux_parents[] __initconst = {
+	"dpll_core_h14x2_ck",
+	"dpll_per_h14x2_ck",
+	NULL,
+};
+
+static const char * const omap5_gpu_sys_clk_parents[] __initconst = {
+	"sys_clkin",
+	NULL,
+};
+
+static const struct omap_clkctrl_div_data omap5_gpu_sys_clk_data __initconst = {
+	.max_div = 2,
+};
+
+static const struct omap_clkctrl_bit_data omap5_gpu_core_bit_data[] __initconst = {
+	{ 24, TI_CLK_MUX, omap5_gpu_core_mux_parents, NULL },
+	{ 25, TI_CLK_MUX, omap5_gpu_hyd_mux_parents, NULL },
+	{ 26, TI_CLK_DIVIDER, omap5_gpu_sys_clk_parents, &omap5_gpu_sys_clk_data },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data omap5_gpu_clkctrl_regs[] __initconst = {
+	{ OMAP5_GPU_CLKCTRL, omap5_gpu_core_bit_data, CLKF_SW_SUP, "gpu_cm:clk:0000:24" },
+	{ 0 },
+};
+
 static const char * const omap5_mmc1_fclk_mux_parents[] __initconst = {
 	"func_128m_clk",
 	"dpll_per_m2x2_ck",
@@ -470,6 +503,7 @@ const struct omap_clkctrl_data omap5_clkctrl_data[] __initconst = {
 	{ 0x4a008e20, omap5_l3instr_clkctrl_regs },
 	{ 0x4a009020, omap5_l4per_clkctrl_regs },
 	{ 0x4a009420, omap5_dss_clkctrl_regs },
+	{ 0x4a009520, omap5_gpu_clkctrl_regs },
 	{ 0x4a009620, omap5_l3init_clkctrl_regs },
 	{ 0x4ae07920, omap5_wkupaon_clkctrl_regs },
 	{ 0 },
diff --git a/include/dt-bindings/clock/omap5.h b/include/dt-bindings/clock/omap5.h
--- a/include/dt-bindings/clock/omap5.h
+++ b/include/dt-bindings/clock/omap5.h
@@ -89,6 +89,9 @@
 /* dss clocks */
 #define OMAP5_DSS_CORE_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
 
+/* gpu clocks */
+#define OMAP5_GPU_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
+
 /* l3init clocks */
 #define OMAP5_MMC1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
 #define OMAP5_MMC2_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
-- 
2.21.0
