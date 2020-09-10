Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E367264C56
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 20:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgIJSIk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 14:08:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726792AbgIJR7O (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 13:59:14 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 712A521D92;
        Thu, 10 Sep 2020 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599760753;
        bh=cnme77ncydCGyn5yAaUYaAlKma6Mlrz2eobW02u1gNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u/eABZ9F+q2oSujqAJjIRw8ViIgsQGgybCFx15PV5lua7Q9B5GJUPJLxb3bYeztBd
         Ojde/RzdDa09Zdk69i0L/0S6UdsLYhED9ISPUM7rwK9npdivrHozn3/F9H/GTfmAPA
         P5aBvwZu9lzvafuk+kRk6236Z3+JBHYvo3ZHAv5s=
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
Subject: [PATCH v2 12/15] ARM: dts: aspeed: align GPIO hog names with dtschema
Date:   Thu, 10 Sep 2020 19:57:30 +0200
Message-Id: <20200910175733.11046-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts  | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 1fa233d2da26..0aa437486a0d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -560,7 +560,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		smbus0 {
+		smbus0-hog {
 			gpio-hog;
 			gpios = <4 GPIO_ACTIVE_HIGH>;
 			output-high;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index cb85168f6761..577c211c469e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -827,7 +827,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus0 {
+				smbus0-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -852,7 +852,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus1 {
+				smbus1-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -900,7 +900,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus2 {
+				smbus2-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -925,7 +925,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus3 {
+				smbus3-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -992,7 +992,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus4 {
+				smbus4-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -1017,7 +1017,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus5 {
+				smbus5-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -1065,7 +1065,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus6 {
+				smbus6-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
@@ -1090,7 +1090,7 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 
-				smbus7 {
+				smbus7-hog {
 					gpio-hog;
 					gpios = <4 GPIO_ACTIVE_HIGH>;
 					output-high;
-- 
2.17.1

