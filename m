Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2538118ED4
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 18:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbfLJRVR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 12:21:17 -0500
Received: from muru.com ([72.249.23.125]:44684 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfLJRVR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 12:21:17 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 721D181A3;
        Tue, 10 Dec 2019 17:21:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/5] ARM: dts: Add missing omap4 secure clocks
Date:   Tue, 10 Dec 2019 09:21:05 -0800
Message-Id: <20191210172108.38868-3-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210172108.38868-1-tony@atomide.com>
References: <20191210172108.38868-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The secure clocks on omap4 are similar to what we already have for dra7
in dra7_l4sec_clkctrl_regs and documented in the omap4460 TRM "Table
3-1346 L4PER_CM2 Registers Mapping Summary".

The secure clocks are part of the l4_per clock manager. As the l4_per
clock manager has now two clock domains as children, let's also update
the l4_per clockdomain node name to follow the "clock" node naming with
a domain specific compatible property.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap44xx-clocks.dtsi | 11 ++++++++---
 drivers/clk/ti/clk-44xx.c              | 13 +++++++++++++
 include/dt-bindings/clock/omap4.h      | 11 +++++++++++
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi b/arch/arm/boot/dts/omap44xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
@@ -1279,13 +1279,18 @@ l4_per_cm: l4_per_cm@1400 {
 		#size-cells = <1>;
 		ranges = <0 0x1400 0x200>;
 
-		l4_per_clkctrl: clk@20 {
-			compatible = "ti,clkctrl";
+		l4_per_clkctrl: clock@20 {
+			compatible = "ti,clkctrl-l4-per", "ti,clkctrl";
 			reg = <0x20 0x144>;
 			#clock-cells = <2>;
 		};
-	};
 
+		l4_secure_clkctrl: clock@1a0 {
+			compatible = "ti,clkctrl-l4-secure", "ti,clkctrl";
+			reg = <0x1a0 0x3c>;
+			#clock-cells = <2>;
+		};
+	};
 };
 
 &prm {
diff --git a/drivers/clk/ti/clk-44xx.c b/drivers/clk/ti/clk-44xx.c
--- a/drivers/clk/ti/clk-44xx.c
+++ b/drivers/clk/ti/clk-44xx.c
@@ -604,6 +604,18 @@ static const struct omap_clkctrl_reg_data omap4_l4_per_clkctrl_regs[] __initcons
 	{ 0 },
 };
 
+static const struct
+omap_clkctrl_reg_data omap4_l4_secure_clkctrl_regs[] __initconst = {
+	{ OMAP4_AES1_CLKCTRL, NULL, CLKF_SW_SUP, "" },
+	{ OMAP4_AES2_CLKCTRL, NULL, CLKF_SW_SUP, "" },
+	{ OMAP4_DES3DES_CLKCTRL, NULL, CLKF_SW_SUP, "" },
+	{ OMAP4_PKA_CLKCTRL, NULL, CLKF_SW_SUP, "" },
+	{ OMAP4_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ OMAP4_SHA2MD5_CLKCTRL, NULL, CLKF_SW_SUP, "" },
+	{ OMAP4_CRYPTODMA_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
+	{ 0 },
+};
+
 static const struct omap_clkctrl_bit_data omap4_gpio1_bit_data[] __initconst = {
 	{ 8, TI_CLK_GATE, omap4_gpio2_dbclk_parents, NULL },
 	{ 0 },
@@ -691,6 +703,7 @@ const struct omap_clkctrl_data omap4_clkctrl_data[] __initconst = {
 	{ 0x4a009220, omap4_l3_gfx_clkctrl_regs },
 	{ 0x4a009320, omap4_l3_init_clkctrl_regs },
 	{ 0x4a009420, omap4_l4_per_clkctrl_regs },
+	{ 0x4a0095a0, omap4_l4_secure_clkctrl_regs },
 	{ 0x4a307820, omap4_l4_wkup_clkctrl_regs },
 	{ 0x4a307a20, omap4_emu_sys_clkctrl_regs },
 	{ 0 },
diff --git a/include/dt-bindings/clock/omap4.h b/include/dt-bindings/clock/omap4.h
--- a/include/dt-bindings/clock/omap4.h
+++ b/include/dt-bindings/clock/omap4.h
@@ -124,6 +124,17 @@
 #define OMAP4_UART4_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x158)
 #define OMAP4_MMC5_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x160)
 
+/* l4_secure clocks */
+#define OMAP4_L4_SECURE_CLKCTRL_OFFSET	0x1a0
+#define OMAP4_L4_SECURE_CLKCTRL_INDEX(offset)	((offset) - OMAP4_L4_SECURE_CLKCTRL_OFFSET)
+#define OMAP4_AES1_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1a0)
+#define OMAP4_AES2_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1a8)
+#define OMAP4_DES3DES_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1b0)
+#define OMAP4_PKA_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1b8)
+#define OMAP4_RNG_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1c0)
+#define OMAP4_SHA2MD5_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1c8)
+#define OMAP4_CRYPTODMA_CLKCTRL	OMAP4_L4_SECURE_CLKCTRL_INDEX(0x1d8)
+
 /* l4_wkup clocks */
 #define OMAP4_L4_WKUP_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x20)
 #define OMAP4_WD_TIMER2_CLKCTRL	OMAP4_CLKCTRL_INDEX(0x30)
-- 
2.24.0
