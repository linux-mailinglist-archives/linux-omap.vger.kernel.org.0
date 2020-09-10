Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3331264C12
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 20:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgIJSAG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 14:00:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:37290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbgIJR7f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 13:59:35 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D445321941;
        Thu, 10 Sep 2020 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599760773;
        bh=sVRW+Q4w/VIyVW+IR4tgq66N90jKOapREO5ueA+lxUY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RlLw5ByX3ZKejd0FSAPRcb/sptlwDMbv3pnc30QdCjyyemYupiY9GHyouBea+Qx5R
         UBsF6wKAVN2QrTZ+xXEvYUhqmVcuRktpPL7W2x/ZxjCqGZar5JWqPYMKu98G9rsm19
         NNcg2sGpQWxJddkZHrVwSMoUAS7FabFEb4T0S5Wc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 15/15] ARM: dts: imx6q: align GPIO hog names with dtschema
Date:   Thu, 10 Sep 2020 19:57:33 +0200
Message-Id: <20200910175733.11046-16-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.  While
touching the hogs, fix indentation (spaces -> tabs).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx6q-b450v3.dts  | 14 +++++++-------
 arch/arm/boot/dts/imx6q-b650v3.dts  | 12 ++++++------
 arch/arm/boot/dts/imx6q-b850v3.dts  |  4 ++--
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 12 ++++++------
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-b450v3.dts b/arch/arm/boot/dts/imx6q-b450v3.dts
index fb0980190aa0..604f2420370f 100644
--- a/arch/arm/boot/dts/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/imx6q-b450v3.dts
@@ -84,19 +84,19 @@
 };
 
 &pca9539 {
-	P04 {
+	P04-hog {
 		gpio-hog;
 		gpios = <4 0>;
 		output-low;
 		line-name = "PCA9539-P04";
 	};
 
-        P07 {
-                gpio-hog;
-                gpios = <7 0>;
-                output-low;
-                line-name = "PCA9539-P07";
-        };
+	P07-hog {
+		gpio-hog;
+		gpios = <7 0>;
+		output-low;
+		line-name = "PCA9539-P07";
+	};
 };
 
 &pci_root {
diff --git a/arch/arm/boot/dts/imx6q-b650v3.dts b/arch/arm/boot/dts/imx6q-b650v3.dts
index 8f762d9c5ae9..56d2aeb1900c 100644
--- a/arch/arm/boot/dts/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/imx6q-b650v3.dts
@@ -84,12 +84,12 @@
 };
 
 &pca9539 {
-        P07 {
-                gpio-hog;
-                gpios = <7 0>;
-                output-low;
-                line-name = "PCA9539-P07";
-        };
+	P07-hog {
+		gpio-hog;
+		gpios = <7 0>;
+		output-low;
+		line-name = "PCA9539-P07";
+	};
 };
 
 &usbphy1 {
diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index 1ea64ecf4291..3d6b757bf325 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -199,14 +199,14 @@
 };
 
 &pca9539 {
-	P10 {
+	P10-hog {
 		gpio-hog;
 		gpios = <8 0>;
 		output-low;
 		line-name = "PCA9539-P10";
 	};
 
-	P11 {
+	P11-hog {
 		gpio-hog;
 		gpios = <9 0>;
 		output-low;
diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index 02812e6cb302..2a98cc657595 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -248,42 +248,42 @@
 				interrupt-parent = <&gpio2>;
 				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
-				P12 {
+				P12-hog {
 					gpio-hog;
 					gpios = <10 0>;
 					output-low;
 					line-name = "PCA9539-P12";
 				};
 
-				P13 {
+				P13-hog {
 					gpio-hog;
 					gpios = <11 0>;
 					output-low;
 					line-name = "PCA9539-P13";
 				};
 
-				P14 {
+				P14-hog {
 					gpio-hog;
 					gpios = <12 0>;
 					output-low;
 					line-name = "PCA9539-P14";
 				};
 
-				P15 {
+				P15-hog {
 					gpio-hog;
 					gpios = <13 0>;
 					output-low;
 					line-name = "PCA9539-P15";
 				};
 
-				P16 {
+				P16-hog {
 					gpio-hog;
 					gpios = <14 0>;
 					output-low;
 					line-name = "PCA9539-P16";
 				};
 
-				P17 {
+				P17-hog {
 					gpio-hog;
 					gpios = <15 0>;
 					output-low;
-- 
2.17.1

