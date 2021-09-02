Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25933FEB9F
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 11:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245647AbhIBJ5T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 05:57:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245185AbhIBJ5R (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Sep 2021 05:57:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1A9360724;
        Thu,  2 Sep 2021 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630576578;
        bh=JWOUTN1X7Cc7Ebp1upwtH/j9jK3kl0+01ZNz1pi+41Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DEsDe0I0+M3nQh/OPPwjTBOgBjmDk448rQXBAIwAwdvl0gsCdevRCb0GdTTyC1HZ/
         mu+rZYmTSEYO+yZ3JplfhFbWiPJhV8cP+etPbDzvgQTPsm97s4QbyudXVERXUvErYN
         Wt9wVHx3d1cT6Gz0qDvd0UAzdXHoFBq2Wa8xJYIJqsi/zaavSwEHb3PZQpMCPHNe2x
         q6kZUKWuVmPrq49hvF4gN9fFouEL/AQUneV7oAhhiJhDduoKXwAy5yAuWNJHmhSULw
         nSKaWb+jIATFRWXSS6fCFUAloJqsmQZNrAn9F1cl06P5HiuWo/gZj4rQdD9yo3FHct
         oA+cU9yLsEHcw==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 1/6] ARM: dts: omap: Fixup GPMC child nodes
Date:   Thu,  2 Sep 2021 12:56:04 +0300
Message-Id: <20210902095609.16583-2-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902095609.16583-1-rogerq@kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes up the GPMC child nodes to prevent dtbs_check errors
after device tree binding conversion to yaml.

- Use reg address as node name
- gpmc,cycle2cycle-samecsen and gpmc,cycle2cycle-diffcsen are
  boolean properties.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../boot/dts/logicpd-som-lv-baseboard.dtsi    |  2 +-
 .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |  2 +-
 .../boot/dts/logicpd-torpedo-baseboard.dtsi   |  2 +-
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     | 62 +++++++++----------
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     | 59 +++++++++---------
 arch/arm/boot/dts/omap-zoom-common.dtsi       | 16 ++---
 arch/arm/boot/dts/omap2430-sdp.dts            |  6 +-
 arch/arm/boot/dts/omap3-cm-t3x30.dtsi         |  6 +-
 .../arm/boot/dts/omap3-devkit8000-common.dtsi |  4 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts          |  1 +
 arch/arm/boot/dts/omap3-evm-common.dtsi       |  9 ---
 .../boot/dts/omap3-evm-processor-common.dtsi  |  5 +-
 arch/arm/boot/dts/omap3-evm.dts               |  1 +
 arch/arm/boot/dts/omap3-igep0020-common.dtsi  |  5 +-
 arch/arm/boot/dts/omap3-ldp.dts               |  5 +-
 arch/arm/boot/dts/omap3-n900.dts              |  2 +-
 .../dts/omap3-overo-chestnut43-common.dtsi    |  6 +-
 .../arm/boot/dts/omap3-overo-tobi-common.dtsi |  6 +-
 .../boot/dts/omap3-overo-tobiduo-common.dtsi  |  8 +--
 arch/arm/boot/dts/omap3-sb-t35.dtsi           |  4 +-
 arch/arm/boot/dts/omap4-duovero-parlor.dts    |  6 +-
 21 files changed, 105 insertions(+), 112 deletions(-)

diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
index 7d0468a23781..f2364cb114c5 100644
--- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
@@ -65,7 +65,7 @@
 		  1 0 0x2c000000 0x1000000	/* CS1: 16MB for LAN9221 */
 		  2 0 0x10000000 0x2000000>;    /* CS2: 32MB for NOR */
 
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@1,0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lan9221_pins>;
 		interrupt-parent = <&gpio5>;
diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
index 5532db04046c..6357915d207b 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
@@ -4,8 +4,8 @@
 
 #include "omap36xx.dtsi"
 #include "logicpd-torpedo-som.dtsi"
-#include "omap-gpmc-smsc9221.dtsi"
 #include "logicpd-torpedo-baseboard.dtsi"
+#include "omap-gpmc-smsc9221.dtsi"
 
 / {
 	model = "LogicPD Zoom DM3730 Torpedo + Wireless Development Kit";
diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index 533a47bc4a53..05049a34b6f1 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -95,7 +95,7 @@
 	ranges = <0 0 0x30000000 0x1000000	/* CS0: 16MB for NAND */
 		  1 0 0x2c000000 0x1000000>;	/* CS1: 16MB for LAN9221 */
 
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@1,0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lan9221_pins>;
 		interrupt-parent = <&gpio5>;
diff --git a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
index ded7e8fec9eb..2a462cb65a7d 100644
--- a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
+++ b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
@@ -20,36 +20,34 @@
 	};
 };
 
-&gpmc {
-	ethernet@gpmc {
-		compatible = "smsc,lan9221", "smsc,lan9115";
-		bank-width = <2>;
-		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
-		gpmc,cs-on-ns = <5>;
-		gpmc,cs-rd-off-ns = <150>;
-		gpmc,cs-wr-off-ns = <150>;
-		gpmc,adv-on-ns = <0>;
-		gpmc,adv-rd-off-ns = <15>;
-		gpmc,adv-wr-off-ns = <40>;
-		gpmc,oe-on-ns = <45>;
-		gpmc,oe-off-ns = <140>;
-		gpmc,we-on-ns = <45>;
-		gpmc,we-off-ns = <140>;
-		gpmc,rd-cycle-ns = <155>;
-		gpmc,wr-cycle-ns = <155>;
-		gpmc,access-ns = <120>;
-		gpmc,page-burst-access-ns = <20>;
-		gpmc,bus-turnaround-ns = <75>;
-		gpmc,cycle2cycle-delay-ns = <75>;
-		gpmc,wait-monitoring-ns = <0>;
-		gpmc,clk-activation-ns = <0>;
-		gpmc,wr-data-mux-bus-ns = <0>;
-		gpmc,wr-access-ns = <0>;
-		vddvario-supply = <&vddvario>;
-		vdd33a-supply = <&vdd33a>;
-		reg-io-width = <4>;
-		smsc,save-mac-address;
-	};
+&gpmc_ethernet {
+	compatible = "smsc,lan9221", "smsc,lan9115";
+	bank-width = <2>;
+	gpmc,device-width = <1>;
+	gpmc,cycle2cycle-samecsen;
+	gpmc,cycle2cycle-diffcsen;
+	gpmc,cs-on-ns = <5>;
+	gpmc,cs-rd-off-ns = <150>;
+	gpmc,cs-wr-off-ns = <150>;
+	gpmc,adv-on-ns = <0>;
+	gpmc,adv-rd-off-ns = <15>;
+	gpmc,adv-wr-off-ns = <40>;
+	gpmc,oe-on-ns = <45>;
+	gpmc,oe-off-ns = <140>;
+	gpmc,we-on-ns = <45>;
+	gpmc,we-off-ns = <140>;
+	gpmc,rd-cycle-ns = <155>;
+	gpmc,wr-cycle-ns = <155>;
+	gpmc,access-ns = <120>;
+	gpmc,page-burst-access-ns = <20>;
+	gpmc,bus-turnaround-ns = <75>;
+	gpmc,cycle2cycle-delay-ns = <75>;
+	gpmc,wait-monitoring-ns = <0>;
+	gpmc,clk-activation-ns = <0>;
+	gpmc,wr-data-mux-bus-ns = <0>;
+	gpmc,wr-access-ns = <0>;
+	vddvario-supply = <&vddvario>;
+	vdd33a-supply = <&vdd33a>;
+	reg-io-width = <4>;
+	smsc,save-mac-address;
 };
diff --git a/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
index 7f6aefd13451..c1e78f929d2b 100644
--- a/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
+++ b/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
@@ -24,36 +24,33 @@
 	};
 };
 
-&gpmc {
-	ethernet@gpmc {
-		compatible = "smsc,lan9221","smsc,lan9115";
-		bank-width = <2>;
+&gpmc_ethernet {
+	compatible = "smsc,lan9221","smsc,lan9115";
+	bank-width = <2>;
+	gpmc,mux-add-data = <0>;
+	gpmc,cs-on-ns = <0>;
+	gpmc,cs-rd-off-ns = <42>;
+	gpmc,cs-wr-off-ns = <36>;
+	gpmc,adv-on-ns = <6>;
+	gpmc,adv-rd-off-ns = <12>;
+	gpmc,adv-wr-off-ns = <12>;
+	gpmc,oe-on-ns = <0>;
+	gpmc,oe-off-ns = <42>;
+	gpmc,we-on-ns = <0>;
+	gpmc,we-off-ns = <36>;
+	gpmc,rd-cycle-ns = <60>;
+	gpmc,wr-cycle-ns = <54>;
+	gpmc,access-ns = <36>;
+	gpmc,page-burst-access-ns = <0>;
+	gpmc,bus-turnaround-ns = <0>;
+	gpmc,cycle2cycle-delay-ns = <0>;
+	gpmc,wr-data-mux-bus-ns = <18>;
+	gpmc,wr-access-ns = <42>;
+	gpmc,cycle2cycle-samecsen;
+	gpmc,cycle2cycle-diffcsen;
 
-		gpmc,mux-add-data;
-		gpmc,cs-on-ns = <0>;
-		gpmc,cs-rd-off-ns = <42>;
-		gpmc,cs-wr-off-ns = <36>;
-		gpmc,adv-on-ns = <6>;
-		gpmc,adv-rd-off-ns = <12>;
-		gpmc,adv-wr-off-ns = <12>;
-		gpmc,oe-on-ns = <0>;
-		gpmc,oe-off-ns = <42>;
-		gpmc,we-on-ns = <0>;
-		gpmc,we-off-ns = <36>;
-		gpmc,rd-cycle-ns = <60>;
-		gpmc,wr-cycle-ns = <54>;
-		gpmc,access-ns = <36>;
-		gpmc,page-burst-access-ns = <0>;
-		gpmc,bus-turnaround-ns = <0>;
-		gpmc,cycle2cycle-delay-ns = <0>;
-		gpmc,wr-data-mux-bus-ns = <18>;
-		gpmc,wr-access-ns = <42>;
-		gpmc,cycle2cycle-samecsen;
-		gpmc,cycle2cycle-diffcsen;
-
-		vddvario-supply = <&vddvario>;
-		vdd33a-supply = <&vdd33a>;
-		reg-io-width = <4>;
-		smsc,save-mac-address;
-	};
+	vddvario-supply = <&vddvario>;
+	vdd33a-supply = <&vdd33a>;
+	reg-io-width = <4>;
+	smsc,save-mac-address;
 };
diff --git a/arch/arm/boot/dts/omap-zoom-common.dtsi b/arch/arm/boot/dts/omap-zoom-common.dtsi
index d4ad9e58b199..47192c617cd1 100644
--- a/arch/arm/boot/dts/omap-zoom-common.dtsi
+++ b/arch/arm/boot/dts/omap-zoom-common.dtsi
@@ -3,8 +3,6 @@
  * Common features on the Zoom debug board
  */
 
-#include "omap-gpmc-smsc911x.dtsi"
-
 &gpmc {
 	ranges = <3 0 0x10000000 0x1000000>,	/* CS3: 16MB for UART */
 		 <7 0 0x2c000000 0x01000000>;
@@ -27,8 +25,8 @@
 		gpmc,mux-add-data = <0>;
 		gpmc,device-width = <1>;
 		gpmc,wait-pin = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <155>;
 		gpmc,cs-wr-off-ns = <155>;
@@ -50,7 +48,7 @@
 		gpmc,wr-data-mux-bus-ns = <45>;
 		gpmc,wr-access-ns = <145>;
 	};
-	uart@3,1 {
+	uart@3,100 {
 		compatible = "ns16550a";
 		reg = <3 0x100 8>;	/* CS3, offset 0x100, IO size 8 */
 		bank-width = <2>;
@@ -61,7 +59,7 @@
 		clock-frequency = <1843200>;
 		current-speed = <115200>;
 	};
-	uart@3,2 {
+	uart@3,200 {
 		compatible = "ns16550a";
 		reg = <3 0x200 8>;	/* CS3, offset 0x200, IO size 8 */
 		bank-width = <2>;
@@ -72,7 +70,7 @@
 		clock-frequency = <1843200>;
 		current-speed = <115200>;
 	};
-	uart@3,3 {
+	uart@3,300 {
 		compatible = "ns16550a";
 		reg = <3 0x300 8>;	/* CS3, offset 0x300, IO size 8 */
 		bank-width = <2>;
@@ -84,9 +82,11 @@
 		current-speed = <115200>;
 	};
 
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@7,0 {
 		reg = <7 0 0xff>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;	/* gpio158 */
 	};
 };
+
+#include "omap-gpmc-smsc911x.dtsi"
diff --git a/arch/arm/boot/dts/omap2430-sdp.dts b/arch/arm/boot/dts/omap2430-sdp.dts
index 7d27e907533f..f74906e4721b 100644
--- a/arch/arm/boot/dts/omap2430-sdp.dts
+++ b/arch/arm/boot/dts/omap2430-sdp.dts
@@ -34,7 +34,7 @@
 
 &gpmc {
 	ranges = <5 0 0x08000000 0x01000000>;
-	ethernet@gpmc {
+	ethernet@5,300 {
 		compatible = "smsc,lan91c94";
 		interrupt-parent = <&gpio5>;
 		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;	/* gpio149 */
@@ -43,8 +43,8 @@
 		gpmc,sync-clk-ps = <0>;
 		gpmc,mux-add-data = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <6>;
 		gpmc,cs-rd-off-ns = <187>;
 		gpmc,cs-wr-off-ns = <187>;
diff --git a/arch/arm/boot/dts/omap3-cm-t3x30.dtsi b/arch/arm/boot/dts/omap3-cm-t3x30.dtsi
index 5e8943539fcc..2059463de9d6 100644
--- a/arch/arm/boot/dts/omap3-cm-t3x30.dtsi
+++ b/arch/arm/boot/dts/omap3-cm-t3x30.dtsi
@@ -47,13 +47,11 @@
 	};
 };
 
-#include "omap-gpmc-smsc911x.dtsi"
-
 &gpmc {
 	ranges = <5 0 0x2c000000 0x01000000>, /* CM-T3x30 SMSC9x Eth */
 		 <0 0 0x00000000 0x01000000>; /* CM-T3x NAND */
 
-	smsc1: ethernet@gpmc {
+	gpmc_ethernet: ethernet@5,0 {
 		compatible = "smsc,lan9221", "smsc,lan9115";
 		pinctrl-names = "default";
 		pinctrl-0 = <&smsc1_pins>;
@@ -63,6 +61,8 @@
 	};
 };
 
+#include "omap-gpmc-smsc911x.dtsi"
+
 &i2c1 {
 	twl: twl@48 {
 		reg = <0x48>;
diff --git a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
index 2c19d6e255bd..5e55198e4576 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
@@ -267,8 +267,8 @@
 		gpmc,mux-add-data = <0>;
 		gpmc,device-width = <1>;
 		gpmc,wait-pin = <0>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 
 		gpmc,cs-on-ns = <6>;
 		gpmc,cs-rd-off-ns = <180>;
diff --git a/arch/arm/boot/dts/omap3-evm-37xx.dts b/arch/arm/boot/dts/omap3-evm-37xx.dts
index c9332195d096..077b1a19f171 100644
--- a/arch/arm/boot/dts/omap3-evm-37xx.dts
+++ b/arch/arm/boot/dts/omap3-evm-37xx.dts
@@ -7,6 +7,7 @@
 #include "omap36xx.dtsi"
 #include "omap3-evm-common.dtsi"
 #include "omap3-evm-processor-common.dtsi"
+#include "omap-gpmc-smsc911x.dtsi"
 
 / {
 	model = "TI OMAP37XX EVM (TMDSEVM3730)";
diff --git a/arch/arm/boot/dts/omap3-evm-common.dtsi b/arch/arm/boot/dts/omap3-evm-common.dtsi
index 17c89df6ce6b..2f7bdb248a51 100644
--- a/arch/arm/boot/dts/omap3-evm-common.dtsi
+++ b/arch/arm/boot/dts/omap3-evm-common.dtsi
@@ -4,7 +4,6 @@
  */
 
 #include <dt-bindings/input/input.h>
-#include "omap-gpmc-smsc911x.dtsi"
 
 / {
 	cpus {
@@ -182,14 +181,6 @@
 	power = <50>;
 };
 
-&gpmc {
-	ethernet@gpmc {
-		interrupt-parent = <&gpio6>;
-		interrupts = <16 8>;
-		reg = <5 0 0xff>;
-	};
-};
-
 &vaux2 {
 	regulator-name = "usb_1v8";
 	regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/omap3-evm-processor-common.dtsi b/arch/arm/boot/dts/omap3-evm-processor-common.dtsi
index e6ba30a21166..3adb967b96c4 100644
--- a/arch/arm/boot/dts/omap3-evm-processor-common.dtsi
+++ b/arch/arm/boot/dts/omap3-evm-processor-common.dtsi
@@ -217,8 +217,11 @@
 	ranges = <0 0 0x30000000 0x1000000>,	/* CS0: 16MB for NAND */
 		 <5 0 0x2c000000 0x01000000>;	/* CS5: 16MB for LAN9220 */
 
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@5,0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&smsc911x_pins>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <16 8>;
+		reg = <5 0 0xff>;
 	};
 };
diff --git a/arch/arm/boot/dts/omap3-evm.dts b/arch/arm/boot/dts/omap3-evm.dts
index 5cc0cf7cd16c..805856d47cda 100644
--- a/arch/arm/boot/dts/omap3-evm.dts
+++ b/arch/arm/boot/dts/omap3-evm.dts
@@ -7,6 +7,7 @@
 #include "omap34xx.dtsi"
 #include "omap3-evm-common.dtsi"
 #include "omap3-evm-processor-common.dtsi"
+#include "omap-gpmc-smsc911x.dtsi"
 
 / {
 	model = "TI OMAP35XX EVM (TMDSEVM3530)";
diff --git a/arch/arm/boot/dts/omap3-igep0020-common.dtsi b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
index 73d8f471b9ec..104df84ea720 100644
--- a/arch/arm/boot/dts/omap3-igep0020-common.dtsi
+++ b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
@@ -7,7 +7,6 @@
  */
 
 #include "omap3-igep.dtsi"
-#include "omap-gpmc-smsc9221.dtsi"
 
 / {
 
@@ -217,7 +216,7 @@
 	ranges = <0 0 0x30000000 0x01000000>,	/* CS0: 16MB for NAND */
 		 <5 0 0x2c000000 0x01000000>;	/* CS5: 16MB for ethernet */
 
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@5,0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&smsc9221_pins>;
 		reg = <5 0 0xff>;
@@ -226,6 +225,8 @@
 	};
 };
 
+#include "omap-gpmc-smsc9221.dtsi"
+
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_pins>;
diff --git a/arch/arm/boot/dts/omap3-ldp.dts b/arch/arm/boot/dts/omap3-ldp.dts
index 9c6a92724590..a299f04217fd 100644
--- a/arch/arm/boot/dts/omap3-ldp.dts
+++ b/arch/arm/boot/dts/omap3-ldp.dts
@@ -6,7 +6,6 @@
 
 #include <dt-bindings/input/input.h>
 #include "omap34xx.dtsi"
-#include "omap-gpmc-smsc911x.dtsi"
 
 / {
 	model = "TI OMAP3430 LDP (Zoom1 Labrador)";
@@ -148,13 +147,15 @@
 		};
 	};
 
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@1,0 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
 		reg = <1 0 0xff>;
 	};
 };
 
+#include "omap-gpmc-smsc911x.dtsi"
+
 &i2c1 {
 	clock-frequency = <2600000>;
 
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 32335d4ce478..35602d7876aa 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -936,7 +936,7 @@
 	};
 
 	/* Ethernet is on some early development boards and qemu */
-	ethernet@gpmc {
+	ethernet@1,0 {
 		compatible = "smsc,lan91c94";
 		interrupt-parent = <&gpio2>;
 		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;	/* gpio54 */
diff --git a/arch/arm/boot/dts/omap3-overo-chestnut43-common.dtsi b/arch/arm/boot/dts/omap3-overo-chestnut43-common.dtsi
index 2d2c61d7aa86..34b805851dd2 100644
--- a/arch/arm/boot/dts/omap3-overo-chestnut43-common.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-chestnut43-common.dtsi
@@ -49,16 +49,16 @@
 	};
 };
 
-#include "omap-gpmc-smsc9221.dtsi"
-
 &gpmc {
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@5,0 {
 		reg = <5 0 0xff>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;	/* GPIO 176 */
 	};
 };
 
+#include "omap-gpmc-smsc9221.dtsi"
+
 &lis33de {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/omap3-overo-tobi-common.dtsi b/arch/arm/boot/dts/omap3-overo-tobi-common.dtsi
index 9bf4b88a4b50..895803654e3c 100644
--- a/arch/arm/boot/dts/omap3-overo-tobi-common.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-tobi-common.dtsi
@@ -21,16 +21,16 @@
 	};
 };
 
-#include "omap-gpmc-smsc9221.dtsi"
-
 &gpmc {
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@5,0 {
 		reg = <5 0 0xff>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;	/* GPIO 176 */
 	};
 };
 
+#include "omap-gpmc-smsc9221.dtsi"
+
 &lis33de {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/omap3-overo-tobiduo-common.dtsi b/arch/arm/boot/dts/omap3-overo-tobiduo-common.dtsi
index e5da3bc6f105..c212d72dcfe9 100644
--- a/arch/arm/boot/dts/omap3-overo-tobiduo-common.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-tobiduo-common.dtsi
@@ -9,10 +9,8 @@
 
 #include "omap3-overo-common-peripherals.dtsi"
 
-#include "omap-gpmc-smsc9221.dtsi"
-
 &gpmc {
-	smsc1: ethernet@gpmc {
+	gpmc_ethernet: ethernet@5,0 {
 		reg = <5 0 0xff>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;	/* GPIO 176 */
@@ -22,7 +20,7 @@
 		compatible = "smsc,lan9221","smsc,lan9115";
 		bank-width = <2>;
 
-		gpmc,mux-add-data;
+		gpmc,mux-add-data = <0>;
 		gpmc,cs-on-ns = <0>;
 		gpmc,cs-rd-off-ns = <42>;
 		gpmc,cs-wr-off-ns = <36>;
@@ -54,6 +52,8 @@
 	};
 };
 
+#include "omap-gpmc-smsc9221.dtsi"
+
 &lis33de {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/omap3-sb-t35.dtsi b/arch/arm/boot/dts/omap3-sb-t35.dtsi
index fb9842fa922c..5ec0893415e0 100644
--- a/arch/arm/boot/dts/omap3-sb-t35.dtsi
+++ b/arch/arm/boot/dts/omap3-sb-t35.dtsi
@@ -108,8 +108,8 @@
 		reg = <4 0 0xff>;
 		bank-width = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <150>;
 		gpmc,cs-wr-off-ns = <150>;
diff --git a/arch/arm/boot/dts/omap4-duovero-parlor.dts b/arch/arm/boot/dts/omap4-duovero-parlor.dts
index b294c22177cb..dfc50764c405 100644
--- a/arch/arm/boot/dts/omap4-duovero-parlor.dts
+++ b/arch/arm/boot/dts/omap4-duovero-parlor.dts
@@ -131,12 +131,10 @@
 	status = "disabled";
 };
 
-#include "omap-gpmc-smsc911x.dtsi"
-
 &gpmc {
 	ranges = <5 0 0x2c000000 0x1000000>;			/* CS5 */
 
-	ethernet@gpmc {
+	gpmc_ethernet: ethernet@5,0 {
 		reg = <5 0 0xff>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;		/* gpio_44 */
@@ -170,6 +168,8 @@
 	};
 };
 
+#include "omap-gpmc-smsc911x.dtsi"
+
 &dss {
 	status = "okay";
 };
-- 
2.17.1

