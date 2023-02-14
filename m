Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900FB69649B
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbjBNNXm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjBNNXk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:40 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24814484
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381002; x=1678973002;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cI4SWDavJmrO/+kWVvvQonwsP/pEl7KznLY+044NnAo=;
        b=ZK0OMjq9sh3VkM4uZPvip16f88Zu7CGoxnm4uBnOlNHkWZDmsnty3n+Otd9Uh1X0
        2Z4RMCuGEHlN+50JFMrag0pbsv/yuNywUgixu4zmmWjmME5G2VVfeYyVvFhgqyMK
        1zAQz/6HB7hfmfwQvBSgOSVRxSiQmHeCPMp+lAavxtY=;
X-AuditID: ac14000a-923ff70000007ecb-ee-63eb8b4af95f
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id B0.D9.32459.A4B8BE36; Tue, 14 Feb 2023 14:23:22 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:21 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 5/8] ARM: dts: am335x-regor: Remove underscore in node names.
Date:   Tue, 14 Feb 2023 14:22:59 +0100
Message-ID: <20230214132302.39087-5-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRpKBV9er+3WyQcsMXos78/+yWvS9eMhs
        MXtJP4tF694j7Bb7r3hZdL9Td2Dz+PZ1EovH+xut7B6bVnWyedy5tofNo7+7hdXj8ya5ALYo
        LpuU1JzMstQifbsErowX39ayF0ySrjh6YzNbA+MDsS5GTg4JAROJDxNesnQxcnEICSxmktjw
        9hYThPOYUeLxvB9MIFVsAuoS8/d+ZwexRQQUJI4caWIFKWIW6GCUaJ7ZDZYQFvCVmPPiCVsX
        IwcHi4CqxKfvRSAmr4CZxOSGIohl8hL7D55lBrE5Bcwllk94wwZiCwGVtB++wwJi8woISpyc
        +QTMZgaqb946mxnClpA4+OIFM0S9nMScUx+ZYWZOO/cayg6V6Pxzn2UCo9AsJKNmIRk1C8mo
        BYzMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzGCYkGEgWsHY98cj0OMTByMhxglOJiVRHiFn75I
        FuJNSaysSi3Kjy8qzUktPsQozcGiJM57v4cpUUggPbEkNTs1tSC1CCbLxMEp1cBYn1G0mHlb
        lfbSpn3c02xdNpY4m2ZbZBhFPpsToz95gwzztFqdvNVr9glc7zvx9PRd96AZRl+beF1Ko76E
        PJ/69ODKia08dy6YborMvKPG5tw+u4PJt2ij6OecXg2Oqhdh8RIvmNjDfz2/tSiF43Fd9+2q
        mauf/wx7/1tg3wW159UXlkedElJSYinOSDTUYi4qTgQAKoHeh3MCAAA=
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
 arch/arm/boot/dts/am335x-regor.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-regor.dtsi b/arch/arm/boot/dts/am335x-regor.dtsi
index 7b3966ee51b9..3894f14a914c 100644
--- a/arch/arm/boot/dts/am335x-regor.dtsi
+++ b/arch/arm/boot/dts/am335x-regor.dtsi
@@ -18,7 +18,7 @@ vcc3v3: fixedregulator@1 {
 	};
 
 	/* User IO */
-	user_leds: user_leds {
+	user_leds: user-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&user_leds_pins>;
@@ -39,7 +39,7 @@ error-led {
 
 /* User Leds */
 &am33xx_pinmux {
-	user_leds_pins: pinmux_user_leds {
+	user_leds_pins: pinmux-user-leds {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* lcd_hsync.gpio2_22 */
 			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* mcasp0_fsx.gpio3_15 */
@@ -49,7 +49,7 @@ AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* mcasp0_
 
 /* CAN Busses */
 &am33xx_pinmux {
-	dcan1_pins: pinmux_dcan1 {
+	dcan1_pins: pinmux-dcan1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT_PULLUP, MUX_MODE2)	/* uart0_ctsn.d_can1_tx */
 			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLUP, MUX_MODE2)	/* uart0_rtsn.d_can1_rx */
@@ -65,7 +65,7 @@ &dcan1 {
 
 /* Ethernet */
 &am33xx_pinmux {
-	ethernet1_pins: pinmux_ethernet1 {
+	ethernet1_pins: pinmux-ethernet1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_GPMC_A0, PIN_OUTPUT, MUX_MODE1)		/* gpmc_a0.mii2_txen */
 			AM33XX_PADCONF(AM335X_PIN_GPMC_A1, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a1.mii2_rxdv */
@@ -108,7 +108,7 @@ &am33xx_pinmux {
 	pinctrl-names = "default";
 	pinctrl-0 = <&user_gpios_pins>;
 
-	user_gpios_pins: pinmux_user_gpios {
+	user_gpios_pins: pinmux-user-gpios {
 		pinctrl-single,pins = <
 			/* DIGIN 1-4 */
 			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_INPUT, MUX_MODE7)		/* gpmc_ad11.gpio0_27 */
@@ -126,7 +126,7 @@ AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_OUTPUT, MUX_MODE7)		/* gpmc_ad12.gpio1_
 
 /* MMC */
 &am33xx_pinmux {
-	mmc1_pins: pinmux_mmc1 {
+	mmc1_pins: pinmux-mmc1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)
@@ -155,14 +155,14 @@ &i2c_rtc {
 
 /* UARTs */
 &am33xx_pinmux {
-	uart0_pins: pinmux_uart0 {
+	uart0_pins: pinmux-uart0 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART0_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_UART0_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 
-	uart2_pins: pinmux_uart2 {
+	uart2_pins: pinmux-uart2 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_INPUT_PULLUP, MUX_MODE1)	/* mii1_tx_clk.uart2_rxd */
 			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE1)	/* mii1_rx_clk.uart2_txd */
@@ -184,7 +184,7 @@ &uart2 {
 
 /* RS485 - UART1 */
 &am33xx_pinmux {
-	uart1_rs485_pins: pinmux_uart1_rs485_pins {
+	uart1_rs485_pins: pinmux-uart1-rs485-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-- 
2.34.1

