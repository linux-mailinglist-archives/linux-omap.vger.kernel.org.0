Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA45D25668B
	for <lists+linux-omap@lfdr.de>; Sat, 29 Aug 2020 11:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgH2Jkw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 29 Aug 2020 05:40:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:36698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbgH2Jkv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 29 Aug 2020 05:40:51 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B10192068E;
        Sat, 29 Aug 2020 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598694051;
        bh=nYdsEt4eLLJRNSq2tYSCZbVTWwm5iqC5mEub4SpLTXE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M+AW6B8kuEnSEreujpXzL/G4Mn0mHf2FuD9pGulvPENZ7reL0mggc/spGKxnw1Ahf
         CrCcct/M6IUKzHwzf4LzUzIqnrc17098cbh2lQKhh0EPCz1SUUwvqQ+36JUBJEUr5o
         EKDRSqEjaBO2UaSmL/lgdx39x1LNp2EfW9GzESg8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/6] ARM: dts: aspeed: Fix PCA95xx GPIO expander properties on Portwell
Date:   Sat, 29 Aug 2020 11:40:22 +0200
Message-Id: <20200829094024.31842-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829094024.31842-1-krzk@kernel.org>
References: <20200829094024.31842-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PCA95xx GPIO expander requires GPIO controller properties to operate
properly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 4a1ca8f5b6a7..03c161493ffc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -121,6 +121,8 @@
 	pca9555@27 {
 		compatible = "nxp,pca9555";
 		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
 };
 
-- 
2.17.1

