Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6EA7C4B9B
	for <lists+linux-omap@lfdr.de>; Wed, 11 Oct 2023 09:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344526AbjJKHTN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Oct 2023 03:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjJKHTM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Oct 2023 03:19:12 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A54C78F;
        Wed, 11 Oct 2023 00:19:11 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BF8B28111;
        Wed, 11 Oct 2023 07:19:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: [PATCH 2/2] clk: ti: Fix missing omap5 mcbsp functional clock and aliases
Date:   Wed, 11 Oct 2023 10:18:56 +0300
Message-ID: <20231011071856.11594-2-tony@atomide.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011071856.11594-1-tony@atomide.com>
References: <20231011071856.11594-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are using a wrong mcbsp functional clock. The interconnect target module
driver provided clock for mcbsp is not same as the mcbsp functional clock
known as the gfclk main_clk. The mcbsp functional clocks for mcbsp should
have been added before we dropped the legacy platform data.

Additionally we are also missing the clock aliases for the clocks used by
the audio driver if reparenting is needed. This causes audio driver errors
like "CLKS: could not clk_get() prcm_fck" for mcbsp as reported by Andreas.
The mcbsp clock aliases too should have been added before we dropped the
legacy platform data.

Let's add the clocks and aliases with a single patch to fix the issue
similar to omap4. On omap5, there is no mcbsp4 instance on the l4_per
interconnect.

Fixes: b1da0fa21bd1 ("ARM: OMAP2+: Drop legacy platform data for omap5 mcbsp")
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Reported-by: Andreas Kemnade <andreas@kemnade.info>
Reported-by: Péter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi | 6 ++++++
 drivers/clk/ti/clk-54xx.c                   | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
@@ -109,6 +109,8 @@ mcbsp1: mcbsp@0 {
 				reg = <0x0 0xff>, /* MPU private access */
 				      <0x49022000 0xff>; /* L3 Interconnect */
 				reg-names = "mpu", "dma";
+				clocks = <&abe_clkctrl OMAP5_MCBSP1_CLKCTRL 24>;
+				clock-names = "fck";
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "common";
 				ti,buffer-size = <128>;
@@ -142,6 +144,8 @@ mcbsp2: mcbsp@0 {
 				reg = <0x0 0xff>, /* MPU private access */
 				      <0x49024000 0xff>; /* L3 Interconnect */
 				reg-names = "mpu", "dma";
+				clocks = <&abe_clkctrl OMAP5_MCBSP2_CLKCTRL 24>;
+				clock-names = "fck";
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "common";
 				ti,buffer-size = <128>;
@@ -175,6 +179,8 @@ mcbsp3: mcbsp@0 {
 				reg = <0x0 0xff>, /* MPU private access */
 				      <0x49026000 0xff>; /* L3 Interconnect */
 				reg-names = "mpu", "dma";
+				clocks = <&abe_clkctrl OMAP5_MCBSP3_CLKCTRL 24>;
+				clock-names = "fck";
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "common";
 				ti,buffer-size = <128>;
diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -565,15 +565,19 @@ static struct ti_dt_clk omap54xx_clks[] = {
 	DT_CLK(NULL, "gpio8_dbclk", "l4per-clkctrl:00f8:8"),
 	DT_CLK(NULL, "mcbsp1_gfclk", "abe-clkctrl:0028:24"),
 	DT_CLK(NULL, "mcbsp1_sync_mux_ck", "abe-clkctrl:0028:26"),
+	DT_CLK("40122000.mcbsp", "prcm_fck", "abe-clkctrl:0028:26"),
 	DT_CLK(NULL, "mcbsp2_gfclk", "abe-clkctrl:0030:24"),
 	DT_CLK(NULL, "mcbsp2_sync_mux_ck", "abe-clkctrl:0030:26"),
+	DT_CLK("40124000.mcbsp", "prcm_fck", "abe-clkctrl:0030:26"),
 	DT_CLK(NULL, "mcbsp3_gfclk", "abe-clkctrl:0038:24"),
 	DT_CLK(NULL, "mcbsp3_sync_mux_ck", "abe-clkctrl:0038:26"),
+	DT_CLK("40126000.mcbsp", "prcm_fck", "abe-clkctrl:0038:26"),
 	DT_CLK(NULL, "mmc1_32khz_clk", "l3init-clkctrl:0008:8"),
 	DT_CLK(NULL, "mmc1_fclk", "l3init-clkctrl:0008:25"),
 	DT_CLK(NULL, "mmc1_fclk_mux", "l3init-clkctrl:0008:24"),
 	DT_CLK(NULL, "mmc2_fclk", "l3init-clkctrl:0010:25"),
 	DT_CLK(NULL, "mmc2_fclk_mux", "l3init-clkctrl:0010:24"),
+	DT_CLK(NULL, "pad_fck", "pad_clks_ck"),
 	DT_CLK(NULL, "sata_ref_clk", "l3init-clkctrl:0068:8"),
 	DT_CLK(NULL, "timer10_gfclk_mux", "l4per-clkctrl:0008:24"),
 	DT_CLK(NULL, "timer11_gfclk_mux", "l4per-clkctrl:0010:24"),
-- 
2.42.0
