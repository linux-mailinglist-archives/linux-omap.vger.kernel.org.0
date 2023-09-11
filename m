Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13A679A1FD
	for <lists+linux-omap@lfdr.de>; Mon, 11 Sep 2023 05:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjIKD6o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Sep 2023 23:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjIKD6k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Sep 2023 23:58:40 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98A151A2;
        Sun, 10 Sep 2023 20:58:33 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B0A198027;
        Mon, 11 Sep 2023 03:58:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ARM: dts: motorola-mapphone: Add mdm6600 sleep pins
Date:   Mon, 11 Sep 2023 06:58:28 +0300
Message-ID: <20230911035828.36984-1-tony@atomide.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The sleep pins never got added earlier probably because the driver was not
behaving correctly with the sleep pins. We need the sleep pins to prevent
the modem from waking up on it's own if the reset pin glitches in deeper
SoC idle states.

Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../dts/ti/omap/motorola-mapphone-common.dtsi | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
@@ -67,7 +67,8 @@ hdmi_regulator: regulator-hdmi {
 	fsusb1_phy: usb-phy@1 {
 		compatible = "motorola,mapphone-mdm6600";
 		pinctrl-0 = <&usb_mdm6600_pins>;
-		pinctrl-names = "default";
+		pinctrl-1 = <&usb_mdm6600_sleep_pins>;
+		pinctrl-names = "default", "sleep";
 		enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;     /* gpio_95 */
 		power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;	/* gpio_54 */
 		reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;	/* gpio_49 */
@@ -476,6 +477,23 @@ OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
 		>;
 	};
 
+	/* Modem sleep pins to keep gpio_49 high with internal pull */
+	usb_mdm6600_sleep_pins: usb-mdm6600-sleep-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x072, PIN_INPUT_PULLUP | MUX_MODE7) /* Keep gpio_49 reset high */
+		OMAP4_IOPAD(0x14e, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x150, PIN_OFF_OUTPUT_LOW | PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x07e, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
+		>;
+	};
+
 	usb_ulpi_pins: usb-ulpi-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x196, MUX_MODE7)
-- 
2.42.0
