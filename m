Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D33B7696493
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjBNNXj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjBNNXi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:38 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B96A3C32
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381001; x=1678973001;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Z72v9l6jvwkfJKFAyRbI/kXtM353TiJxZfuvGN/dUOw=;
        b=i9Cbgck/q0JYAz7vfrIJXgAncsJzn5h2QRfdrY7QwAQgysALlySnuki9/PVf65w0
        sL6K5uL8Yno0wOR5eB0y2EnT1rNUljQVEJrq1oWP3ITHSUsKtLMQDkpbaSzxxgnp
        mJWcoQ5bjIuV9FWxGxQLXOVaTlwk0f5bovhqX8obdBk=;
X-AuditID: ac14000a-923ff70000007ecb-ec-63eb8b491179
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 30.D9.32459.94B8BE36; Tue, 14 Feb 2023 14:23:21 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:21 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 3/8] ARM: dts: am335x-wega: Change node name of sound card, remove underscores.
Date:   Tue, 14 Feb 2023 14:22:57 +0100
Message-ID: <20230214132302.39087-3-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWyRpKBV9ez+3WyQeMGc4s78/+yWvS9eMhs
        MXtJP4tF694j7Bb7r3hZdL9Td2Dz+PZ1EovH+xut7B6bVnWyedy5tofNo7+7hdXj8ya5ALYo
        LpuU1JzMstQifbsEroy39xoYC3pEK5qurWFpYDwv2MXIySEhYCLR9qKdpYuRi0NIYDGTxIO2
        D1DOY0aJx/N+MIFUsQmoS8zf+50dxBYRUJA4cqSJFaSIWaCDUaJ5ZjdYQlggXuLi111sIDaL
        gKrEsznfWEBsXgEziVMvOtkg1slL7D94lhnE5hQwl1g+4Q1YXAiopv3wHah6QYmTM5+A2cxA
        9c1bZzND2BISB1+8YIaol5OYc+ojM8zMaedeQ9mhEp1/7rNMYBSahWTULCSjZiEZtYCReRWj
        UG5mcnZqUWa2XkFGZUlqsl5K6iZGUDyIMHDtYOyb43GIkYmD8RCjBAezkgiv8NMXyUK8KYmV
        ValF+fFFpTmpxYcYpTlYlMR57/cwJQoJpCeWpGanphakFsFkmTg4pRoYS/wZt/ifu9nxXeav
        OEd4G9/F5l/OPO2O6ww3xiwy3fd56dnZbL/X6i2J6e9UffLh6FXNE0WyjQrhU6o6Tqx2rrlZ
        pTur/8+ho8ee8D9eJ3ZEJO5JZ/harU672vxn8/xDogtifgW1HNtl9XGFce0unbTL+Wu+GfSX
        XZr0Puf0z1/+3nM/mjDcUmIpzkg01GIuKk4EAGB1mNN1AgAA
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Change node name of sound card to recommended generic and remove also
further underscores in other node names.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/am335x-wega.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-wega.dtsi b/arch/arm/boot/dts/am335x-wega.dtsi
index 6c5d26bbe952..7e9a07b519bd 100644
--- a/arch/arm/boot/dts/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/am335x-wega.dtsi
@@ -8,7 +8,7 @@ / {
 	model = "Phytec AM335x phyBOARD-WEGA";
 	compatible = "phytec,am335x-wega", "phytec,am335x-phycore-som", "ti,am33xx";
 
-	sound: sound-iface {
+	sound: sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "snd-wega";
 		simple-audio-card,format = "i2s";
@@ -50,7 +50,7 @@ vcc3v3: fixedregulator1 {
 
 /* Audio */
 &am33xx_pinmux {
-	mcasp0_pins: pinmux_mcasp0 {
+	mcasp0_pins: pinmux-mcasp0 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_INPUT_PULLDOWN, MUX_MODE0)
@@ -91,7 +91,7 @@ &mcasp0 {
 
 /* CAN Busses */
 &am33xx_pinmux {
-	dcan1_pins: pinmux_dcan1 {
+	dcan1_pins: pinmux-dcan1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT_PULLUP, MUX_MODE2) /* uart0_ctsn.d_can1_tx */
 			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLUP, MUX_MODE2) /* uart0_rtsn.d_can1_rx */
@@ -107,7 +107,7 @@ &dcan1 {
 
 /* Ethernet */
 &am33xx_pinmux {
-	ethernet1_pins: pinmux_ethernet1 {
+	ethernet1_pins: pinmux-ethernet1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_GPMC_A0, PIN_OUTPUT, MUX_MODE1)		/* gpmc_a0.mii2_txen */
 			AM33XX_PADCONF(AM335X_PIN_GPMC_A1, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a1.mii2_rxdv */
@@ -147,7 +147,7 @@ &mac_sw {
 
 /* MMC */
 &am33xx_pinmux {
-	mmc1_pins: pinmux_mmc1 {
+	mmc1_pins: pinmux-mmc1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)
@@ -177,14 +177,14 @@ &vdig1_reg {
 
 /* UARTs */
 &am33xx_pinmux {
-	uart0_pins: pinmux_uart0 {
+	uart0_pins: pinmux-uart0 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART0_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_UART0_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 
-	uart1_pins: pinmux_uart1_pins {
+	uart1_pins: pinmux-uart1 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-- 
2.34.1

