Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF7B1806AD
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbgCJSfL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:35:11 -0400
Received: from muru.com ([72.249.23.125]:59572 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727272AbgCJSfL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 14:35:11 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 538F5812F;
        Tue, 10 Mar 2020 18:35:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 01/10] clk: ti: Fix dm814x clkctrl for ethernet
Date:   Tue, 10 Mar 2020 11:34:55 -0700
Message-Id: <20200310183504.65358-2-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310183504.65358-1-tony@atomide.com>
References: <20200310183504.65358-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are missing alwon ethernet clock for dm814x and this prevents us
from probing the CPSW with device tree only data. Looks like Ethernet
currently only works if it has been enabled in the bootloader.

Looks like relying on the bootloader clocks is not an issue with the
mainline kernel currently, but it will be an issue when configuring
CPSW Ethernet to probe with device tree data only as we will be managing
the clocks.

Fixes: 26ca2e973844 ("clk: ti: dm814: add clkctrl clock data")
Cc: linux-clk@vger.kernel.org
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Stephen & Tero, can you guys please ack if this patch looks OK?

---
 arch/arm/boot/dts/dm814x-clocks.dtsi | 14 ++++++++++++++
 drivers/clk/ti/clk-814x.c            |  7 ++++++-
 include/dt-bindings/clock/dm814.h    |  5 +++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/dm814x-clocks.dtsi b/arch/arm/boot/dts/dm814x-clocks.dtsi
--- a/arch/arm/boot/dts/dm814x-clocks.dtsi
+++ b/arch/arm/boot/dts/dm814x-clocks.dtsi
@@ -362,4 +362,18 @@ alwon_clkctrl: clk@0 {
 			#clock-cells = <2>;
 		};
 	};
+
+	alwon_ethernet_cm: alwon_ethernet_cm@15d4 {
+		compatible = "ti,omap4-cm";
+		reg = <0x15d4 0x4>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x15d4 0x4>;
+
+		alwon_ethernet_clkctrl: clk@0 {
+			compatible = "ti,clkctrl";
+			reg = <0 0x4>;
+			#clock-cells = <2>;
+		};
+	};
 };
diff --git a/drivers/clk/ti/clk-814x.c b/drivers/clk/ti/clk-814x.c
--- a/drivers/clk/ti/clk-814x.c
+++ b/drivers/clk/ti/clk-814x.c
@@ -25,7 +25,6 @@ static const struct omap_clkctrl_reg_data dm814_alwon_clkctrl_regs[] __initconst
 	{ DM814_WD_TIMER_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "sysclk18_ck" },
 	{ DM814_MCSPI1_CLKCTRL, NULL, CLKF_SW_SUP, "sysclk10_ck" },
 	{ DM814_GPMC_CLKCTRL, NULL, CLKF_SW_SUP, "sysclk6_ck" },
-	{ DM814_CPGMAC0_CLKCTRL, NULL, CLKF_SW_SUP, "cpsw_125mhz_gclk" },
 	{ DM814_MPU_CLKCTRL, NULL, CLKF_SW_SUP, "mpu_ck" },
 	{ DM814_RTC_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "sysclk18_ck" },
 	{ DM814_TPCC_CLKCTRL, NULL, CLKF_SW_SUP, "sysclk4_ck" },
@@ -39,9 +38,15 @@ static const struct omap_clkctrl_reg_data dm814_alwon_clkctrl_regs[] __initconst
 	{ 0 },
 };
 
+static const struct
+omap_clkctrl_reg_data dm814_alwon_ethernet_clkctrl_regs[] __initconst = {
+	{ 0, NULL, CLKF_SW_SUP, "cpsw_125mhz_gclk" },
+};
+
 const struct omap_clkctrl_data dm814_clkctrl_data[] __initconst = {
 	{ 0x48180500, dm814_default_clkctrl_regs },
 	{ 0x48181400, dm814_alwon_clkctrl_regs },
+	{ 0x481815d4, dm814_alwon_ethernet_clkctrl_regs },
 	{ 0 },
 };
 
diff --git a/include/dt-bindings/clock/dm814.h b/include/dt-bindings/clock/dm814.h
--- a/include/dt-bindings/clock/dm814.h
+++ b/include/dt-bindings/clock/dm814.h
@@ -34,4 +34,9 @@
 #define DM814_MMC2_CLKCTRL	DM814_CLKCTRL_INDEX(0x220)
 #define DM814_MMC3_CLKCTRL	DM814_CLKCTRL_INDEX(0x224)
 
+/* alwon_ethernet clocks */
+#define DM814_ETHERNET_CLKCTRL_OFFSET	0x1d4
+#define DM814_ETHERNET_CLKCTRL_INDEX(offset)	((offset) - DM814_ETHERNET_CLKCTRL_OFFSET)
+#define DM814_ETHERNET_CPGMAC0_CLKCTRL	DM814_ETHERNET_CLKCTRL_INDEX(0x1d4)
+
 #endif
-- 
2.25.1
