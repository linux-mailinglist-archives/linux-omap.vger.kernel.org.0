Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0975696496
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjBNNXk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbjBNNXi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:38 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A6226BF
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381002; x=1678973002;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YML1F09DdGbJNQSgv+f9JFnpW/HUSoQNQbqVsefbvko=;
        b=JlJcAjwG4n0txAZYUJUfv7UL5oZTo7ixl64cB/iHNMV+asIxNSZ5MwE2o2U7keQO
        V10LAiVqx+IiHg2m6LLBrNAsxns9tqDzryL6NZhGn+eg0ArSIlr4xTIkFfAylGpo
        sc16tyDflC82Kpz+0YG0Dar0FX/dDKhZW6tlUC9iP+k=;
X-AuditID: ac14000a-917fe70000007ecb-ed-63eb8b490ff8
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A0.D9.32459.A4B8BE36; Tue, 14 Feb 2023 14:23:22 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:21 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 4/8] ARM: dts: am335x-pcm-935: Remove underscore in node names.
Date:   Tue, 14 Feb 2023 14:22:58 +0100
Message-ID: <20230214132302.39087-4-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWyRpKBV9er+3WywbNfrBZ35v9lteh78ZDZ
        YvaSfhaL1r1H2C32X/Gy6H6n7sDm8e3rJBaP9zda2T02repk87hzbQ+bR393C6vH501yAWxR
        XDYpqTmZZalF+nYJXBkbfyxlK9goX3HnwjTGBsblUl2MnBwSAiYS7479Z+li5OIQEljMJHHw
        4UtGCOcxo8TjeT+YQKrYBNQl5u/9zg5iiwgoSBw50sQKUsQs0MEo0TyzGywhLOAv8X7iamYQ
        m0VAVeJN7wGgZg4OXgEzibbNhhDb5CX2HzwLVsIpYC6xfMIbNhBbCKik/fAdFhCbV0BQ4uTM
        J2A2M1B989bZzBC2hMTBFy+YIerlJOac+sgMM3PauddQdqhE55/7LBMYhWYhGTULyahZSEYt
        YGRexSiUm5mcnVqUma1XkFFZkpqsl5K6iREUDSIMXDsY++Z4HGJk4mA8xCjBwawkwiv89EWy
        EG9KYmVValF+fFFpTmrxIUZpDhYlcd77PUyJQgLpiSWp2ampBalFMFkmDk6pBkaFRvuGr2pO
        +48/kuDytnz47LnNy1t2c3T2OE56x+vCev9+o84uF6YWAYvmq2nfTc9W9wbMXvrYTq9m22uJ
        xuxtzMffZHFJNS/2nNFtG+k71/+Y3pm1fplPWDdzmmz1ndl/MsLsVbRJzcTvW4+ZL5rw5exi
        s1nM/1wvz4iee6lr/hHfnitLGT8psRRnJBpqMRcVJwIAWV6DGnQCAAA=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove underscore in node names following conventions.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/am335x-pcm-953.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
index 947497413977..92f2a283fe92 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -29,7 +29,7 @@ vcc1v8: fixedregulator2 {
 	};
 
 	/* User IO */
-	user_leds: user_leds {
+	user_leds: user-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&user_leds_pins>;
@@ -47,7 +47,7 @@ user-led1 {
 		};
 	};
 
-	user_buttons: user_buttons {
+	user_buttons: user-buttons {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&user_buttons_pins>;
@@ -70,14 +70,14 @@ button-1 {
 };
 
 &am33xx_pinmux {
-	user_buttons_pins: pinmux_user_buttons {
+	user_buttons_pins: pinmux-user-buttons {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_EMU0, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* emu0.gpio3_7 */
 			AM33XX_PADCONF(AM335X_PIN_EMU1, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* emu1.gpio3_8 */
 		>;
 	};
 
-	user_leds_pins: pinmux_user_leds {
+	user_leds_pins: pinmux-user-leds {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN1, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_csn1.gpio1_30 */
 			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN2, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_csn2.gpio1_31 */
@@ -87,7 +87,7 @@ AM33XX_PADCONF(AM335X_PIN_GPMC_CSN2, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_csn
 
 /* CAN */
 &am33xx_pinmux {
-	dcan1_pins: pinmux_dcan1 {
+	dcan1_pins: pinmux-dcan1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_OUTPUT_PULLUP, MUX_MODE2)	/* uart1_rxd.dcan1_tx_mux2 */
 			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_INPUT_PULLUP, MUX_MODE2)	/* uart1_txd.dcan1_rx_mux2 */
@@ -144,7 +144,7 @@ &am33xx_pinmux {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cb_gpio_pins>;
 
-	cb_gpio_pins: pinmux_cb_gpio {
+	cb_gpio_pins: pinmux-cb-gpio {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* uart0_ctsn.gpio1_8 */
 			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* uart0_rtsn.gpio1_9 */
@@ -154,7 +154,7 @@ AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* uart0_r
 
 /* MMC */
 &am33xx_pinmux {
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: pinmux-mmc1-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)
@@ -178,14 +178,14 @@ &mmc1 {
 
 /* UARTs */
 &am33xx_pinmux {
-	uart0_pins: pinmux_uart0 {
+	uart0_pins: pinmux-uart0 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART0_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_UART0_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 
-	uart1_pins: pinmux_uart1 {
+	uart1_pins: pinmux-uart1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
@@ -194,14 +194,14 @@ AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 
-	uart2_pins: pinmux_uart2 {
+	uart2_pins: pinmux-uart2 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_INPUT_PULLUP, MUX_MODE1)	/* mii1_tx_clk.uart2_rxd */
 			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE1)	/* mii1_rx_clk.uart2_txd */
 		>;
 	};
 
-	uart3_pins: pinmux_uart3 {
+	uart3_pins: pinmux-uart3 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLUP, MUX_MODE1)	/* mii1_rxd3.uart3_rxd */
 			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_OUTPUT_PULLDOWN, MUX_MODE1)	/* mii1_rxd2.uart3_txd */
-- 
2.34.1

