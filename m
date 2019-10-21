Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAA1DF778
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 23:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbfJUVaW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 17:30:22 -0400
Received: from muru.com ([72.249.23.125]:38784 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727264AbfJUVaW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 17:30:22 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B8ADA80CC;
        Mon, 21 Oct 2019 21:30:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 2/3] ARM: dts: Drop pointless status changing for am3 musb
Date:   Mon, 21 Oct 2019 14:30:10 -0700
Message-Id: <20191021213011.29110-3-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021213011.29110-1-tony@atomide.com>
References: <20191021213011.29110-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The default is enabled, and there should be no need to reconfigure
the status for SoC internal devices in the board specific files.

Only the USB PHY used needs to be configured in the board specific
files.

Cc: Bin Liu <b-liu@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am335x-baltos.dtsi          | 12 --------
 arch/arm/boot/dts/am335x-bone-common.dtsi     | 22 ---------------
 arch/arm/boot/dts/am335x-boneblue.dts         | 22 ---------------
 arch/arm/boot/dts/am335x-chiliboard.dts       | 18 ------------
 arch/arm/boot/dts/am335x-cm-t335.dts          | 20 -------------
 arch/arm/boot/dts/am335x-evm.dts              | 25 -----------------
 arch/arm/boot/dts/am335x-evmsk.dts            | 25 -----------------
 arch/arm/boot/dts/am335x-guardian.dts         | 22 ---------------
 arch/arm/boot/dts/am335x-igep0033.dtsi        | 25 -----------------
 arch/arm/boot/dts/am335x-lxm.dts              | 22 ---------------
 .../boot/dts/am335x-moxa-uc-2100-common.dtsi  | 17 -----------
 .../arm/boot/dts/am335x-moxa-uc-8100-me-t.dts | 22 ---------------
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts   | 22 ---------------
 arch/arm/boot/dts/am335x-pcm-953.dtsi         | 25 -----------------
 arch/arm/boot/dts/am335x-pdu001.dts           | 28 -------------------
 arch/arm/boot/dts/am335x-pepper.dts           | 20 -------------
 arch/arm/boot/dts/am335x-pocketbeagle.dts     | 22 ---------------
 arch/arm/boot/dts/am335x-regor.dtsi           | 21 --------------
 arch/arm/boot/dts/am335x-shc.dts              | 17 -----------
 arch/arm/boot/dts/am335x-sl50.dts             | 22 ---------------
 arch/arm/boot/dts/am335x-wega.dtsi            | 26 -----------------
 21 files changed, 455 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
--- a/arch/arm/boot/dts/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos.dtsi
@@ -258,18 +258,6 @@
 	};
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&cppi41dma  {
-	status = "okay";
-};
-
 #include "tps65910.dtsi"
 
 &tps {
diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -191,38 +191,16 @@
 	status = "okay";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "peripheral";
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };
 
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -278,38 +278,16 @@
 	status = "okay";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "peripheral";
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };
 
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &i2c0 {
 	baseboard_eeprom: baseboard_eeprom@50 {
 		compatible = "atmel,24c256";
diff --git a/arch/arm/boot/dts/am335x-chiliboard.dts b/arch/arm/boot/dts/am335x-chiliboard.dts
--- a/arch/arm/boot/dts/am335x-chiliboard.dts
+++ b/arch/arm/boot/dts/am335x-chiliboard.dts
@@ -153,30 +153,12 @@
 };
 
 /* USB */
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_drvvbus>;
-
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 /* microSD */
 &mmc1 {
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/am335x-cm-t335.dts b/arch/arm/boot/dts/am335x-cm-t335.dts
--- a/arch/arm/boot/dts/am335x-cm-t335.dts
+++ b/arch/arm/boot/dts/am335x-cm-t335.dts
@@ -330,26 +330,6 @@ status = "okay";
 	};
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
-&cppi41dma  {
-	status = "okay";
-};
-
 &epwmss0 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -433,35 +433,10 @@
 	};
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -523,35 +523,10 @@
 	};
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &epwmss2 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/am335x-guardian.dts b/arch/arm/boot/dts/am335x-guardian.dts
--- a/arch/arm/boot/dts/am335x-guardian.dts
+++ b/arch/arm/boot/dts/am335x-guardian.dts
@@ -115,10 +115,6 @@
 	};
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &elm {
 	status = "okay";
 };
@@ -328,30 +324,12 @@
 	status = "okay";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
 &usb0 {
 	dr_mode = "peripheral";
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
 };
 
 &usb1 {
 	dr_mode = "host";
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/am335x-igep0033.dtsi b/arch/arm/boot/dts/am335x-igep0033.dtsi
--- a/arch/arm/boot/dts/am335x-igep0033.dtsi
+++ b/arch/arm/boot/dts/am335x-igep0033.dtsi
@@ -217,35 +217,10 @@
 	pinctrl-0 = <&uart0_pins>;
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 #include "tps65910.dtsi"
 
 &tps {
diff --git a/arch/arm/boot/dts/am335x-lxm.dts b/arch/arm/boot/dts/am335x-lxm.dts
--- a/arch/arm/boot/dts/am335x-lxm.dts
+++ b/arch/arm/boot/dts/am335x-lxm.dts
@@ -283,36 +283,14 @@
 	status = "okay";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "host";
 };
 
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &cpsw_emac0 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rmii";
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
--- a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
+++ b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
@@ -111,27 +111,10 @@
 	};
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 /* Power */
 &vbat {
 	regulator-name = "vbat";
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
--- a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
+++ b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
@@ -290,36 +290,14 @@
 	};
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "host";
 };
 
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 #include "tps65910.dtsi"
 
 &tps {
diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
--- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
@@ -384,38 +384,16 @@
 	status = "okay";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "peripheral";
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };
 
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -237,31 +237,6 @@
 };
 
 /* USB */
-&cppi41dma {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
-
-&usb1_phy {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/am335x-pdu001.dts b/arch/arm/boot/dts/am335x-pdu001.dts
--- a/arch/arm/boot/dts/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/am335x-pdu001.dts
@@ -384,34 +384,6 @@
 	};
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
-&usb1 {
-	status = "okay";
-};
-
-&cppi41dma  {
-	status = "okay";
-};
-
 /*
  * Disable soc's rtc as we have no VBAT for it. This makes the board
  * rtc (Microchip MCP79400) the default rtc device 'rtc0'.
diff --git a/arch/arm/boot/dts/am335x-pepper.dts b/arch/arm/boot/dts/am335x-pepper.dts
--- a/arch/arm/boot/dts/am335x-pepper.dts
+++ b/arch/arm/boot/dts/am335x-pepper.dts
@@ -552,38 +552,18 @@
 
 /* USB */
 &usb {
-	status = "okay";
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb_pins>;
 };
 
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
         dr_mode = "host";
 };
 
 &usb1 {
-	status = "okay";
         dr_mode = "host";
 };
 
-&cppi41dma {
-	status = "okay";
-};
-
 &am33xx_pinmux {
 	usb_pins: pinmux_usb {
 		pinctrl-single,pins = <
diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -206,32 +206,10 @@
 	status = "okay";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "otg";
 };
 
-&usb1_phy {
-	status = "okay";
-};
-
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
-
-&cppi41dma  {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/am335x-regor.dtsi b/arch/arm/boot/dts/am335x-regor.dtsi
--- a/arch/arm/boot/dts/am335x-regor.dtsi
+++ b/arch/arm/boot/dts/am335x-regor.dtsi
@@ -200,24 +200,3 @@
 	status = "okay";
 	linux,rs485-enabled-at-boot-time;
 };
-
-/* USB */
-&cppi41dma {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/am335x-shc.dts b/arch/arm/boot/dts/am335x-shc.dts
--- a/arch/arm/boot/dts/am335x-shc.dts
+++ b/arch/arm/boot/dts/am335x-shc.dts
@@ -117,10 +117,6 @@
 	status = "okay";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &davinci_mdio {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
@@ -358,20 +354,7 @@
 	status = "okay";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
diff --git a/arch/arm/boot/dts/am335x-sl50.dts b/arch/arm/boot/dts/am335x-sl50.dts
--- a/arch/arm/boot/dts/am335x-sl50.dts
+++ b/arch/arm/boot/dts/am335x-sl50.dts
@@ -512,36 +512,14 @@
 	status = "disabled";
 };
 
-&usb {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
 &usb0 {
-	status = "okay";
 	dr_mode = "otg";
 };
 
 &usb1 {
-	status = "okay";
 	dr_mode = "host";
 };
 
-&cppi41dma  {
-	status = "okay";
-};
-
 &mmc1 {
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/am335x-wega.dtsi b/arch/arm/boot/dts/am335x-wega.dtsi
--- a/arch/arm/boot/dts/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/am335x-wega.dtsi
@@ -191,32 +191,6 @@
 	status = "okay";
 };
 
-/* USB */
-&cppi41dma {
-	status = "okay";
-};
-
-&usb_ctrl_mod {
-	status = "okay";
-};
-
-&usb {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
-&usb0_phy {
-	status = "okay";
-};
-
 &usb1 {
 	dr_mode = "host";
-	status = "okay";
-};
-
-&usb1_phy {
-	status = "okay";
 };
-- 
2.23.0
