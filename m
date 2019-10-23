Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2E44E229F
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 20:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbfJWSjv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 14:39:51 -0400
Received: from muru.com ([72.249.23.125]:39496 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729043AbfJWSjv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 14:39:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6D38B80CF;
        Wed, 23 Oct 2019 18:40:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH] ARM: dts: Configure omap3 rng
Date:   Wed, 23 Oct 2019 11:39:42 -0700
Message-Id: <20191023183942.12142-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like omap3 RNG is similar to the omap2 rng, let's get it working
by configring the dts node for it.

We must also add rng_ick to core_l4_clkdm as noted by Adam Ford.

And please note that the RNG is likely disabled on HS devices. At least
n900 does not have it accessible, and instead omap3-rom-rng driver must
be used. So let's tag RNG as disabled on n900 as noted by Pali Rohár
<pali.rohar@gmail.com>.

On am3517 at least the clocks need to be configured to get it working
as noted by Adam Ford, so let's tag it disabled for now.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Sorry for the delay on getting this posted, please test.

---
 arch/arm/boot/dts/am3517.dtsi                 |  6 +++++
 arch/arm/boot/dts/omap3-n900.dts              |  5 ++++
 arch/arm/boot/dts/omap3.dtsi                  | 25 +++++++++++++++++++
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    |  2 +-
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -115,6 +115,12 @@
 	};
 };
 
+/* Not currently working, probably needs at least different clocks */
+&rng_target {
+	status = "disabled";
+	/delete-property/ clocks;
+};
+
 /* Table Table 5-79 of the TRM shows 480ab000 is reserved */
 &usb_otg_hs {
 	status = "disabled";
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -1013,6 +1013,11 @@
 	};
 };
 
+/* RNG not directly accessible on n900, se omap3-rom-rng instead */
+&rng_target {
+	status = "disabled";
+};
+
 &usb_otg_hs {
 	interface-type = <0>;
 	usb-phy = <&usb2_phy>;
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -8,6 +8,7 @@
  * kind, whether express or implied.
  */
 
+#include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/omap.h>
@@ -502,6 +503,30 @@
 			status = "disabled";
 		};
 
+		/* Likely needs to be tagged disabled on HS devices */
+		rng_target: target-module@480a0000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x480a003c 0x4>,
+			      <0x480a0040 0x4>,
+			      <0x480a0044 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>;
+			ti,syss-mask = <1>;
+			clocks = <&rng_ick>;
+			clock-names = "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x480a0000 0x2000>;
+
+			rng: rng@0 {
+				compatible = "ti,omap2-rng";
+				reg = <0x0 0x2000>;
+				interrupts = <52>;
+			};
+		};
+
 		mcbsp2: mcbsp@49022000 {
 			compatible = "ti,omap3-mcbsp";
 			reg = <0x49022000 0xff>,
diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -260,6 +260,6 @@
 			 <&gpt10_ick>, <&mcbsp5_ick>, <&mcbsp1_ick>,
 			 <&omapctrl_ick>, <&aes2_ick>, <&sha12_ick>, <&icr_ick>,
 			 <&des2_ick>, <&mspro_ick>, <&mailboxes_ick>,
-			 <&mspro_fck>;
+			 <&rng_ick>, <&mspro_fck>;
 	};
 };
-- 
2.23.0
