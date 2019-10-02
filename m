Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E20D7C8EC4
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 18:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbfJBQo1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 12:44:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:48770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfJBQo1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 12:44:27 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9936421848;
        Wed,  2 Oct 2019 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570034666;
        bh=tLDlCYJhoCJIjUnWmnbaMmlqONN6eRhSs9VM1BeZFZg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=baJrh2T2drgVNNXKQkkIu1Qgp0ejmwr0YdpXTTMRn4/yV1Hs+Lf+uOR/BupV69Ujo
         yf+ux+R2gun6spUF9DsRuzlTEOW/DXo+5WOSVsJMeMsmS/bb+YCJJQkz1A9I3OZ3mn
         koQAcklpfuwEExmDJOEF4LDQpvSIt2BtXLXNLivY=
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
Subject: [PATCH v3 06/10] ARM: dts: imx: Rename "iram" node to "sram"
Date:   Wed,  2 Oct 2019 18:43:12 +0200
Message-Id: <20191002164316.14905-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The device node name should reflect generic class of a device so rename
the "iram" node to "sram".  This will be also in sync with upcoming DT
schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx27.dtsi | 2 +-
 arch/arm/boot/dts/imx31.dtsi | 2 +-
 arch/arm/boot/dts/imx51.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
index 3652f5556b29..f3464cf52e49 100644
--- a/arch/arm/boot/dts/imx27.dtsi
+++ b/arch/arm/boot/dts/imx27.dtsi
@@ -585,7 +585,7 @@
 			status = "disabled";
 		};
 
-		iram: iram@ffff4c00 {
+		iram: sram@ffff4c00 {
 			compatible = "mmio-sram";
 			reg = <0xffff4c00 0xb400>;
 		};
diff --git a/arch/arm/boot/dts/imx31.dtsi b/arch/arm/boot/dts/imx31.dtsi
index d7f6fb764997..6b62f0745b82 100644
--- a/arch/arm/boot/dts/imx31.dtsi
+++ b/arch/arm/boot/dts/imx31.dtsi
@@ -55,7 +55,7 @@
 		interrupt-parent = <&avic>;
 		ranges;
 
-		iram: iram@1fffc000 {
+		iram: sram@1fffc000 {
 			compatible = "mmio-sram";
 			reg = <0x1fffc000 0x4000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index 0a4b9a5d9a9c..dea86b98e9c3 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -116,7 +116,7 @@
 		interrupt-parent = <&tzic>;
 		ranges;
 
-		iram: iram@1ffe0000 {
+		iram: sram@1ffe0000 {
 			compatible = "mmio-sram";
 			reg = <0x1ffe0000 0x20000>;
 		};
-- 
2.17.1

