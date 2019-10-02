Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7678AC8EDB
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 18:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfJBQoz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 12:44:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:49330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727587AbfJBQoz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 12:44:55 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00C5221D82;
        Wed,  2 Oct 2019 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570034694;
        bh=R3JtOA0Dfq49tu8H2veFMJQO3r2gPbDYYE4d7ZI1Ix8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MwRjVxg5VW4JlCPfao/vHhQoNy67kt4iEbnc0YMpw30oX3aIBpRBHn1zF4T4qxZXD
         KgPq9w5E8dz4qOVlO3mwxSRUskZsQ/cKaUCvbCNT4eDs8BcppMaWMcEWxri1AhtN0Q
         pz0an0WXawlkxRqiL5dOMDVreqb08i6T1muT0iAI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 10/10] ARM: dts: omap: Rename "ocmcram" node to "sram"
Date:   Wed,  2 Oct 2019 18:43:16 +0200
Message-Id: <20191002164316.14905-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The device node name should reflect generic class of a device so rename
the "ocmcram" node to "sram".  This will be also in sync with upcoming DT
schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/omap4.dtsi | 2 +-
 arch/arm/boot/dts/omap5.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 7cc95bc1598b..413304540f8b 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -148,7 +148,7 @@
 		l4_abe: interconnect@40100000 {
 		};
 
-		ocmcram: ocmcram@40304000 {
+		ocmcram: sram@40304000 {
 			compatible = "mmio-sram";
 			reg = <0x40304000 0xa000>; /* 40k */
 		};
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 1fb7937638f0..9f1621f554d7 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -162,7 +162,7 @@
 		l4_abe: interconnect@40100000 {
 		};
 
-		ocmcram: ocmcram@40300000 {
+		ocmcram: sram@40300000 {
 			compatible = "mmio-sram";
 			reg = <0x40300000 0x20000>; /* 128k */
 		};
-- 
2.17.1

