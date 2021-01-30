Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9300F309520
	for <lists+linux-omap@lfdr.de>; Sat, 30 Jan 2021 13:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhA3Mhh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 30 Jan 2021 07:37:37 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:25402 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhA3Mhf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 30 Jan 2021 07:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612010020;
        s=strato-dkim-0002; d=dawncrow.de;
        h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
        bh=hu2FRa0aMvtwNeDVDj//SD6cWCvR0WciJ1k00GaBXv4=;
        b=iIHlGiIHXUowyQqoAJyTlKZZ/lMEmKlYM09YPo/1XjwPFBKo78qQeuRtOKG8adIpf1
        ZAaFPWBYU9L9EzYWjq42QoCJVDT2UlTZZFI0iIQI2PLUVl7uL22eLlcNpnttAMzoKUZn
        b4wKEvkomYSQ8XxxvG9pr3nh0CDsVnqOQroOorR0hiB9m1s6bnb5WgQ7A3CxzUkbySur
        Lfu3RiXE2zMsshekn2SSWNPSSL4ExKv0P971mE6olakPSSwXOoDyzleccGhRPNpc4Z9c
        6ZicHAoLKO25XWTHFVfwP4BflHJHPm4FdN5ROI6UHZOwFq9ZweMnQJIPfS5b5z4BE7ZB
        6phQ==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOaLnXzn3ovD/FrJVNw=="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box
        by smtp.strato.de (RZmta 47.16.0 DYNA|AUTH)
        with ESMTPSA id h096ddx0UCPc826
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 30 Jan 2021 13:25:38 +0100 (CET)
From:   =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
To:     robh+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
        linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: omap3-echo: Update LED configuration
Date:   Sat, 30 Jan 2021 13:25:13 +0100
Message-Id: <20210130122514.58375-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Signed-off-by: André Hentschel <nerv@dawncrow.de>
---

Changes made in 54212f5a1ba3123281877e54c1e5f672bf7563d8 and previous commits broke with the way
the LED drivers were described in device-trees before. These adjustments fix that.

 arch/arm/boot/dts/omap3-echo.dts | 469 ++++++++++++++++++++++---------
 1 file changed, 329 insertions(+), 140 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-echo.dts b/arch/arm/boot/dts/omap3-echo.dts
index b9fd113979f2..3382480d5f19 100644
--- a/arch/arm/boot/dts/omap3-echo.dts
+++ b/arch/arm/boot/dts/omap3-echo.dts
@@ -7,6 +7,7 @@
 #include "dm3725.dtsi"
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Amazon Echo (first generation)";
@@ -139,179 +140,367 @@ &i2c2 {
 	clock-frequency = <400000>;
 
 	lp5523A: lp5523A@32 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "national,lp5523";
 		label = "q1";
 		reg = <0x32>;
 		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
 		enable-gpio = <&gpio4 13 GPIO_ACTIVE_HIGH>; /* GPIO_109 */
 
-		chan0 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan1 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan2 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan3 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan4 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan5 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan6 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan7 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan8 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
+		multi-led@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@0 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x0>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@1 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@6 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@2 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@3 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x3>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@7 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x7>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@4 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@8 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x8>;
+				color = <LED_COLOR_ID_RED>;
+			};
 		};
 	};
 
 	lp5523B: lp5523B@33 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "national,lp5523";
 		label = "q3";
 		reg = <0x33>;
 		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
 
-		chan0 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan1 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan2 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan3 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan4 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan5 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan6 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan7 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan8 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
+		multi-led@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@0 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x0>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@1 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@6 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@2 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@3 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x3>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@7 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x7>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@4 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@8 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x8>;
+				color = <LED_COLOR_ID_RED>;
+			};
 		};
 	};
 
 	lp5523C: lp5523C@34 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "national,lp5523";
 		label = "q4";
 		reg = <0x34>;
 		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
 
-		chan0 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan1 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan2 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan3 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan4 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan5 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan6 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan7 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan8 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
+		multi-led@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@0 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x0>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@1 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@6 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@2 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@3 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x3>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@7 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x7>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@4 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@8 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x8>;
+				color = <LED_COLOR_ID_RED>;
+			};
 		};
 	};
 
 	lp5523D: lp552D@35 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "national,lp5523";
 		label = "q2";
 		reg = <0x35>;
 		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
 
-		chan0 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan1 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan2 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan3 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan4 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan5 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan6 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan7 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
-		};
-		chan8 {
-			led-cur = /bits/ 8 <12>;
-			max-cur = /bits/ 8 <15>;
+		multi-led@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@0 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x0>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@1 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@6 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@2 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@3 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x3>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@7 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x7>;
+				color = <LED_COLOR_ID_RED>;
+			};
+		};
+		multi-led@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+			color = <LED_COLOR_ID_RGB>;
+
+			led@4 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@8 {
+				led-cur = /bits/ 8 <12>;
+				max-cur = /bits/ 8 <15>;
+				reg = <0x8>;
+				color = <LED_COLOR_ID_RED>;
+			};
 		};
 	};
 };
-- 
2.25.1

