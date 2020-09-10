Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2425C264C13
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 20:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIJSAA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 14:00:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:36904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726805AbgIJR7V (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 13:59:21 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFB6120C09;
        Thu, 10 Sep 2020 17:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599760760;
        bh=4N+AVz1iFewUv22C1sZLRU1oZ3vPM6n5YgLdZX5yJcs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N9Q8v8rYJEGYTGOGYdjCjPtkPabMqxu9+jIF3945v1aI8f8LKhOUot2QegtJ+jYFD
         4nGGpy3v3t1Da+kE5INyAPk2VWb2YuDZkg0/DcceHwbDtT6sQwhm8ObmtjOEmxmjBu
         76bSjuzPwQzWPUYVTdBieRSM7tdXbX7qQJ8oM3U0=
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
Subject: [PATCH v2 13/15] ARM: dts: dove: fix PCA95xx GPIO expander properties on A510
Date:   Thu, 10 Sep 2020 19:57:31 +0200
Message-Id: <20200910175733.11046-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910175733.11046-1-krzk@kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PCA95xx GPIO expander requires GPIO controller properties to operate
properly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/dove-sbc-a510.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/dove-sbc-a510.dts b/arch/arm/boot/dts/dove-sbc-a510.dts
index 2bb85a9b7614..df021f9b0117 100644
--- a/arch/arm/boot/dts/dove-sbc-a510.dts
+++ b/arch/arm/boot/dts/dove-sbc-a510.dts
@@ -143,6 +143,7 @@
 	gpio_ext: gpio@20 {
 		compatible = "nxp,pca9555";
 		reg = <0x20>;
+		gpio-controller;
 		#gpio-cells = <2>;
 	};
 };
-- 
2.17.1

