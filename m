Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CD5264C90
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 20:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgIJSOi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 14:14:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgIJR6T (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 13:58:19 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D80B221E2;
        Thu, 10 Sep 2020 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599760697;
        bh=udNEmeVyLPWdARKfdcfI5Aq87zp3Ww2DikohbfSaNM8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qD5SpAJwCblaZ3hpivgzqSRdZQmdif0nTbQ5ZZR/4Ap7SjEnTGOn0O40cxdUSHxIh
         H4nKxTtrt62dnBPCVnbSj6iAmKxNIPHtNBHSjXxeLpYie8/AToVbQnbpmwtdc0ftvn
         irlcQJl2LjvNbp7iPMunJ2IqkMB6RfQJGgTnExSM=
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
Subject: [PATCH v2 04/15] arm64: dts: mediatek: align GPIO hog names with dtschema
Date:   Thu, 10 Sep 2020 19:57:22 +0200
Message-Id: <20200910175733.11046-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The convention for node names is to use hyphens, not underscores.
dtschema for pca95xx requires GPIO hogs to end with 'hog' prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../boot/dts/mediatek/pumpkin-common.dtsi     | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 29d8cf6df46b..351a1905a074 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -63,91 +63,91 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		eint20_mux_sel0 {
+		eint20-mux-sel0-hog {
 			gpio-hog;
 			gpios = <0 0>;
 			input;
 			line-name = "eint20_mux_sel0";
 		};
 
-		expcon_mux_sel1 {
+		expcon-mux-sel1-hog {
 			gpio-hog;
 			gpios = <1 0>;
 			input;
 			line-name = "expcon_mux_sel1";
 		};
 
-		mrg_di_mux_sel2 {
+		mrg-di-mux-sel2-hog {
 			gpio-hog;
 			gpios = <2 0>;
 			input;
 			line-name = "mrg_di_mux_sel2";
 		};
 
-		sd_sdio_mux_sel3 {
+		sd-sdio-mux-sel3-hog {
 			gpio-hog;
 			gpios = <3 0>;
 			input;
 			line-name = "sd_sdio_mux_sel3";
 		};
 
-		sd_sdio_mux_ctrl7 {
+		sd-sdio-mux-ctrl7-hog {
 			gpio-hog;
 			gpios = <7 0>;
 			output-low;
 			line-name = "sd_sdio_mux_ctrl7";
 		};
 
-		hw_id0 {
+		hw-id0-hog {
 			gpio-hog;
 			gpios = <8 0>;
 			input;
 			line-name = "hw_id0";
 		};
 
-		hw_id1 {
+		hw-id1-hog {
 			gpio-hog;
 			gpios = <9 0>;
 			input;
 			line-name = "hw_id1";
 		};
 
-		hw_id2 {
+		hw-id2-hog {
 			gpio-hog;
 			gpios = <10 0>;
 			input;
 			line-name = "hw_id2";
 		};
 
-		fg_int_n {
+		fg-int-n-hog {
 			gpio-hog;
 			gpios = <11 0>;
 			input;
 			line-name = "fg_int_n";
 		};
 
-		usba_pwr_en {
+		usba-pwr-en-hog {
 			gpio-hog;
 			gpios = <12 0>;
 			output-high;
 			line-name = "usba_pwr_en";
 		};
 
-		wifi_3v3_pg {
+		wifi-3v3-pg-hog {
 			gpio-hog;
 			gpios = <13 0>;
 			input;
 			line-name = "wifi_3v3_pg";
 		};
 
-		cam_rst {
+		cam-rst-hog {
 			gpio-hog;
 			gpios = <14 0>;
 			output-low;
 			line-name = "cam_rst";
 		};
 
-		cam_pwdn {
+		cam-pwdn-hog {
 			gpio-hog;
 			gpios = <15 0>;
 			output-low;
-- 
2.17.1

