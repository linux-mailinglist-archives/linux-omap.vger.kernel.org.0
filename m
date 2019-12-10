Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3221118ED7
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 18:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbfLJRVT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 12:21:19 -0500
Received: from muru.com ([72.249.23.125]:44690 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfLJRVT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 12:21:19 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CECD781A7;
        Tue, 10 Dec 2019 17:21:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/5] ARM: dts: Add missing omap5 secure clocks
Date:   Tue, 10 Dec 2019 09:21:06 -0800
Message-Id: <20191210172108.38868-4-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210172108.38868-1-tony@atomide.com>
References: <20191210172108.38868-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The secure clocks on omap5 are similar to what we already have for dra7
with dra7_l4sec_clkctrl_regs and documented in the omap5432 TRM in
"Table 3-1044. CORE_CM_CORE Registers Mapping Summary".

The secure clocks are part of the l4per clock manager. As the l4per
clock manager has now two clock domains as children, let's also update
the l4per clockdomain node name to follow the "clock" node naming with
a domain specific compatible property.

Compared to omap4, omap5 has more clocks working in hardare autogating
mode.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 10 ++++++++--
 drivers/clk/ti/clk-54xx.c              | 13 +++++++++++++
 include/dt-bindings/clock/omap5.h      | 11 +++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
@@ -1125,11 +1125,17 @@ l4per_cm: l4per_cm@1000 {
 		#size-cells = <1>;
 		ranges = <0 0x1000 0x200>;
 
-		l4per_clkctrl: clk@20 {
-			compatible = "ti,clkctrl";
+		l4per_clkctrl: clock@20 {
+			compatible = "ti,clkctrl-l4per", "ti,clkctrl";
 			reg = <0x20 0x15c>;
 			#clock-cells = <2>;
 		};
+
+		l4sec_clkctrl: clock@1a0 {
+			compatible = "ti,clkctrl-l4sec", "ti,clkctrl";
+			reg = <0x1a0 0x3c>;
+			#clock-cells = <2>;
+		};
 	};
 
 	dss_cm: dss_cm@1400 {
diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -286,6 +286,18 @@ static const struct omap_clkctrl_reg_data omap5_l4per_clkctrl_regs[] __initconst
 	{ 0 },
 };
 
+static const struct
+omap_clkctrl_reg_data omap5_l4_secure_clkctrl_regs[] __initconst = {
+	{ OMAP5_AES1_CLKCTRL, NULL, CLKF_HW_SUP, "" },
+	{ OMAP5_AES2_CLKCTRL, NULL, CLKF_HW_SUP, "" },
+	{ OMAP5_DES3DES_CLKCTRL, NULL, CLKF_HW_SUP, "" },
+	{ OMAP5_FPKA_CLKCTRL, NULL, CLKF_SW_SUP, "" },
+	{ OMAP5_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ OMAP5_SHA2MD5_CLKCTRL, NULL, CLKF_HW_SUP, "" },
+	{ OMAP5_DMA_CRYPTO_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ 0 },
+};
+
 static const struct omap_clkctrl_reg_data omap5_iva_clkctrl_regs[] __initconst = {
 	{ OMAP5_IVA_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_h12x2_ck" },
 	{ OMAP5_SL2IF_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_h12x2_ck" },
@@ -508,6 +520,7 @@ const struct omap_clkctrl_data omap5_clkctrl_data[] __initconst = {
 	{ 0x4a008d20, omap5_l4cfg_clkctrl_regs },
 	{ 0x4a008e20, omap5_l3instr_clkctrl_regs },
 	{ 0x4a009020, omap5_l4per_clkctrl_regs },
+	{ 0x4a0091a0, omap5_l4_secure_clkctrl_regs },
 	{ 0x4a009220, omap5_iva_clkctrl_regs },
 	{ 0x4a009420, omap5_dss_clkctrl_regs },
 	{ 0x4a009520, omap5_gpu_clkctrl_regs },
diff --git a/include/dt-bindings/clock/omap5.h b/include/dt-bindings/clock/omap5.h
--- a/include/dt-bindings/clock/omap5.h
+++ b/include/dt-bindings/clock/omap5.h
@@ -86,6 +86,17 @@
 #define OMAP5_UART5_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x170)
 #define OMAP5_UART6_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x178)
 
+/* l4_secure clocks */
+#define OMAP5_L4_SECURE_CLKCTRL_OFFSET	0x1a0
+#define OMAP5_L4_SECURE_CLKCTRL_INDEX(offset)	((offset) - OMAP5_L4_SECURE_CLKCTRL_OFFSET)
+#define OMAP5_AES1_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1a0)
+#define OMAP5_AES2_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1a8)
+#define OMAP5_DES3DES_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1b0)
+#define OMAP5_FPKA_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1b8)
+#define OMAP5_RNG_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1c0)
+#define OMAP5_SHA2MD5_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1c8)
+#define OMAP5_DMA_CRYPTO_CLKCTRL	OMAP5_L4_SECURE_CLKCTRL_INDEX(0x1d8)
+
 /* iva clocks */
 #define OMAP5_IVA_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
 #define OMAP5_SL2IF_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
-- 
2.24.0
