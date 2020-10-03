Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF76282481
	for <lists+linux-omap@lfdr.de>; Sat,  3 Oct 2020 16:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJCOQL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 3 Oct 2020 10:16:11 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:25021 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgJCOQL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 3 Oct 2020 10:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601734569;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bEm3QEiaBmcEgvr3w1BrIX12xWr95cu35StsZUlJDn0=;
        b=qvSGlK75tFtN7CbFyLbZTaIn9CFLAwpT7GCsRDDdC66p1rmRKOFq3ScXyE3vsu2l0A
        Ccw4WH5vKNkSYU4/Qoas4x3Ut9mSqmYS9s/WXRbVLWLnYROFLHv5l3O+5YvNgRAYZ/+p
        oN1DvRGpw9M2awkqbtlQ3J6tAcGlpBZClH+a9NL6Ru5enSzkUmwKHTagRV+ej1lAQlaV
        iU7Dzf1XvHk2ZTWhEaPjxY7hZEnQcpYZr5UNQANShT3rQi+OTJlefAYOfzP97RU10I5c
        IUzj7CWp3grM4laE4111Y/lonfBZPBUOYwxey5Hg7GxTeU3Yi9T5a3+HBuKZSZbbRrEz
        dHYQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDzZw9i90="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
        with ESMTPSA id 3005f6w93EA23C4
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 3 Oct 2020 16:10:02 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 2/2] ARM: dts: pandaboard es: add bluetooth uart for HCI
Date:   Sat,  3 Oct 2020 16:10:01 +0200
Message-Id: <eab9ebb735ab68f104623aa083b0e15f6ac263ea.1601734200.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601734200.git.hns@goldelico.com>
References: <cover.1601734200.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The wl271 bluetooth uart is connected to uart2.
Setup a serdev uart child and separate bluetooth and uart2 pinmux
from wl12xx pinmux to better group the pins and muxes.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap4-panda-es.dts | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-panda-es.dts b/arch/arm/boot/dts/omap4-panda-es.dts
index 6afa8fd7c412de..7c6886cd738f03 100644
--- a/arch/arm/boot/dts/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/omap4-panda-es.dts
@@ -49,6 +49,22 @@ button_pins: pinmux_button_pins {
 			OMAP4_IOPAD(0x0fc, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio_113 */
 		>;
 	};
+
+	bt_pins: pinmux_bt_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 - BTEN */
+			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 - BTWAKEUP */
+		>;
+	};
+
+	uart2_pins: pinmux_uart2_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_cts.uart2_cts - HCI */
+			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)		/* uart2_rts.uart2_rts */
+			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_rx.uart2_rx */
+			OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)		/* uart2_tx.uart2_tx */
+		>;
+	};
 };
 
 &led_wkgpio_pins {
@@ -80,3 +96,19 @@ buttonS2 {
 &gpio1_target {
 	 ti,no-reset-on-init;
 };
+
+&wl12xx_gpio {
+	pinctrl-single,pins = <
+		OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
+		OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */
+	>;
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins &bt_pins>;
+	bluetooth: tiwi {
+		compatible = "ti,wl1271-st";
+		enable-gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>;	/* GPIO_46 */
+	};
+};
-- 
2.26.2

