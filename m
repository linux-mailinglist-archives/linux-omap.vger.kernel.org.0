Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4058C8EB5
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 18:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfJBQoG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 12:44:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfJBQoF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 12:44:05 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88DCA21D81;
        Wed,  2 Oct 2019 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570034644;
        bh=UmEHRN9iGNdvANrP038774VqJvTLK0XIrWHKs42XDIc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bk/fs5HSy2Bms4sYmUo5urCsI1uxRu1O4NUPW8RT+5VCT7RxRp8StxBxCTslOYZuH
         JakGUtv1BUC0JZTEQaFqSiU67aUSuH9TDEMWLSlG+foCZcME4VOhouVkc7mu1rwIaN
         VZ7UV6aPWeLtX9gYRDZ1U5S1OOKhLDZo6mZa5O4M=
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
Subject: [PATCH v3 03/10] ARM: dts: exynos: Rename SysRAM node to "sram"
Date:   Wed,  2 Oct 2019 18:43:09 +0200
Message-Id: <20191002164316.14905-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The device node name should reflect generic class of a device so rename
the SysRAM node from "sysram" to "sram".  The child nodes stay as before
as "smp-sysram" to match their real purpose.  This will be also in sync
with upcoming DT schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 arch/arm/boot/dts/exynos4210.dtsi | 2 +-
 arch/arm/boot/dts/exynos4412.dtsi | 2 +-
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 arch/arm/boot/dts/exynos54xx.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index d122fb52d3d4..cf422b48cb15 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -138,7 +138,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 298b8ddc0545..554819ae1446 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -72,7 +72,7 @@
 	};
 
 	soc: soc {
-		sysram: sysram@2020000 {
+		sysram: sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x20000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 6cf0e259fb39..5022aa574b26 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -188,7 +188,7 @@
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f01e3156191d..2780bf5c83c8 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -164,7 +164,7 @@
 	};
 
 	soc: soc {
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x30000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 06ae40a2f1e9..dff9ef3ad0ef 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -46,7 +46,7 @@
 	};
 
 	soc: soc {
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x54000>;
 			#address-cells = <1>;
-- 
2.17.1

