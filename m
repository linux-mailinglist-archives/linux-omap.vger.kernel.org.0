Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8A01AF2F0
	for <lists+linux-omap@lfdr.de>; Sat, 18 Apr 2020 19:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgDRRwy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 18 Apr 2020 13:52:54 -0400
Received: from muru.com ([72.249.23.125]:50306 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgDRRwy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 18 Apr 2020 13:52:54 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2A52B80E1;
        Sat, 18 Apr 2020 17:53:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: omap4-droid4: Fix flakey wlan by disabling internal pull for gpio
Date:   Sat, 18 Apr 2020 10:52:48 -0700
Message-Id: <20200418175248.42963-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The wlan on droid4 is flakey on some devices, and experiments have shown this
gets fixed if we disable the internal pull for wlan gpio interrupt line.

The symptoms are that the wlan connection is very slow and almost useless
with lots of wlcore firmware reboot warnings in the dmesg.

In addition to configuring the wlan gpio pulls, let's also configure the rest
of the wlan sd pins. We have not configured those eariler as we're booting
using kexec.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../boot/dts/motorola-mapphone-common.dtsi    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -371,6 +371,8 @@ &mmc2 {
 };
 
 &mmc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc3_pins>;
 	vmmc-supply = <&wl12xx_vmmc>;
 	/* uart2_tx.sdmmc3_dat1 pad as wakeirq */
 	interrupts-extended = <&wakeupgen GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH
@@ -483,6 +485,37 @@ OMAP4_IOPAD(0x09e, PIN_INPUT | MUX_MODE0)
 		>;
 	};
 
+	/*
+	 * Android uses PIN_OFF_INPUT_PULLDOWN | PIN_INPUT_PULLUP | MUX_MODE3
+	 * for gpio_100, but the internal pull makes wlan flakey on some
+	 * devices. Off mode value should be tested if we have off mode working
+	 * later on.
+	 */
+	mmc3_pins: pinmux_mmc3_pins {
+		pinctrl-single,pins = <
+		/* 0x4a10008e gpmc_wait2.gpio_100 d23 */
+		OMAP4_IOPAD(0x08e, PIN_INPUT | MUX_MODE3)
+
+		/* 0x4a100102 abe_mcbsp1_dx.sdmmc3_dat2 ab25 */
+		OMAP4_IOPAD(0x102, PIN_INPUT_PULLUP | MUX_MODE1)
+
+		/* 0x4a100104 abe_mcbsp1_fsx.sdmmc3_dat3 ac27 */
+		OMAP4_IOPAD(0x104, PIN_INPUT_PULLUP | MUX_MODE1)
+
+		/* 0x4a100118 uart2_cts.sdmmc3_clk ab26 */
+		OMAP4_IOPAD(0x118, PIN_INPUT | MUX_MODE1)
+
+		/* 0x4a10011a uart2_rts.sdmmc3_cmd ab27 */
+		OMAP4_IOPAD(0x11a, PIN_INPUT_PULLUP | MUX_MODE1)
+
+		/* 0x4a10011c uart2_rx.sdmmc3_dat0 aa25 */
+		OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE1)
+
+		/* 0x4a10011e uart2_tx.sdmmc3_dat1 aa26 */
+		OMAP4_IOPAD(0x11e, PIN_INPUT_PULLUP | MUX_MODE1)
+		>;
+	};
+
 	/* gpmc_ncs0.gpio_50 */
 	poweroff_gpio: pinmux_poweroff_pins {
 		pinctrl-single,pins = <
-- 
2.26.1
