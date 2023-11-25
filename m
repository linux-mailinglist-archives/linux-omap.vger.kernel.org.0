Return-Path: <linux-omap+bounces-27-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D67F89BE
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 10:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7348B212EC
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 09:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A98C2CC;
	Sat, 25 Nov 2023 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="N7Ia6NIu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BDC10CA;
	Sat, 25 Nov 2023 01:44:20 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id A464A60BB9;
	Sat, 25 Nov 2023 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1700905460;
	bh=DcUhj4XEY8fud/bB8kk0KiARyPJ8Izzt0h6YBxqhGNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N7Ia6NIu6xardaP3u8SWdphrKmSYo3ZOI18Ifpjl/1pKzPJNwsU9A6V9xYuV6kySA
	 uGToM9vA+9bugC2YwkvzEGSjfVZLt210Z1F0UTHV0QeBh+NNCfmVB8fRr/hufyaIeo
	 zpUI5ZmlU9wWyfNHIo1Dmj0nfnkdiqrqpBlGe15mQvEtRW1u7Ptlgoi9m3lYBI3p25
	 2SvraVLoq6NUltpuyPYR5rOPpTUG96ZHs6J9N5+0kII62JrUs0P/uZIwDFi5hzhY8p
	 G3lcpnpJE5fUMy1iyDcdQQSOC1tIGvKRKW/x0KA5zotcn1erv8fI189rt5V401vntb
	 JnYlo3DLYlC4w==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Carl Philipp Klemm <philipp@uvos.xyz>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Merlijn Wajer <merlijn@wizzup.org>,
	Pavel Machek <pavel@ucw.cz>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: motorola-mapphone: Add basic support for mz609 and mz617
Date: Sat, 25 Nov 2023 11:42:48 +0200
Message-ID: <20231125094248.43537-4-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231125094248.43537-1-tony@atomide.com>
References: <20231125094248.43537-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Motorola mapphone tablets are similar to the mapphone phones, but with
different display and without some phone related peripherals.

Let's add a new motorola-mapphone-mz607-mz617.dtsi and basic files for
xyboard mz609 and mz617. All the tablets from mz607 to mz617 are quite
similar so let's use motorola-mapphone-mz607-mz617.dtsi naming for the
common file.

Note that the tc358765 lcd bridge needs driver changes before it can be
added.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |  4 +-
 .../omap/motorola-mapphone-mz607-mz617.dtsi   | 21 +++++++++
 .../boot/dts/ti/omap/omap4-xyboard-mz609.dts  | 46 +++++++++++++++++++
 .../boot/dts/ti/omap/omap4-xyboard-mz617.dts  | 17 +++++++
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -79,7 +79,9 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-sdp.dtb \
 	omap4-sdp-es23plus.dtb \
 	omap4-var-dvk-om44.dtb \
-	omap4-var-stk-om44.dtb
+	omap4-var-stk-om44.dtb \
+	omap4-xyboard-mz609.dtb \
+	omap4-xyboard-mz617.dtb
 dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-baltos-ir2110.dtb \
 	am335x-baltos-ir3220.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "motorola-mapphone-common.dtsi"
+
+&keypad {
+	keypad,num-rows = <8>;
+	keypad,num-columns = <8>;
+	linux,keymap = <MATRIX_KEY(5, 0, KEY_VOLUMEUP)>,
+		       <MATRIX_KEY(3, 0, KEY_VOLUMEDOWN)>;
+};
+
+/*
+ * On tablets, mmc1 regulator is vsimcard instead of vwlan2 in the stock kernel
+ * dtb. The regulator may not be wired even if a MMC cage is added though.
+ */
+&mmc1 {
+	vmmc-supply = <&vsimcard>;
+	bus-width = <4>;
+	cd-gpios = <&gpio6 16 GPIO_ACTIVE_LOW>;	/* gpio_176 */
+};
diff --git a/arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dts b/arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dts
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "motorola-mapphone-mz607-mz617.dtsi"
+
+/ {
+	model = "Motorola Xyboard MZ609";
+	compatible = "motorola,xyboard-mz609", "ti,omap4430", "ti,omap4";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	aliases {
+		display1 = &hdmi0;
+	};
+
+	backlight: backlight {
+		compatible = "led-backlight";
+
+		leds = <&backlight_led>;
+		brightness-levels = <31 63 95 127 159 191 223 255>;
+		default-brightness-level = <6>;
+	};
+};
+
+&i2c1 {
+	led-controller@38 {
+		compatible = "ti,lm3532";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x38>;
+
+		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+
+		ramp-up-us = <1024>;
+		ramp-down-us = <8193>;
+
+		backlight_led: led@0 {
+			reg = <0>;
+			led-sources = <2>;
+			ti,led-mode = <0>;
+			label = ":backlight";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dts b/arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dts
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "motorola-mapphone-mz607-mz617.dtsi"
+
+/ {
+	model = "Motorola Xyboard MZ617";
+	compatible = "motorola,xyboard-mz617", "ti,omap4430", "ti,omap4";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	aliases {
+		display1 = &hdmi0;
+	};
+};
-- 
2.42.1

