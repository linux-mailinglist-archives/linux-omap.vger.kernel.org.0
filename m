Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345CB3913EF
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 11:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhEZJqH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 05:46:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59154 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbhEZJqH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 05:46:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14Q9iVUn074605;
        Wed, 26 May 2021 04:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622022271;
        bh=KB395orf3y4WJVFVLtMUrAe+eTRNHenLkAg7Teew4nE=;
        h=From:To:CC:Subject:Date;
        b=gOFb5ofyNw2gOKLgl6mJ0zFIuqMhYg7bqXzwcNldTevRgQCvAyDW1c2QJkS5OJfn6
         cHupXA4Hu2D+fecl/n7AbY20+Rb+yQySwqzCa5yyiVDw9OkEle10SLiKiD9Rq0ndBm
         OdQSSKtAGtNivzajdrnOpv7bgWOxD6VmIOxv0wHg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14Q9iVWc021005
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 04:44:31 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 04:44:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 04:44:31 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14Q9iRwv102071;
        Wed, 26 May 2021 04:44:28 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] ARM: dts: omap2/3: Drop dmas property from I2C node
Date:   Wed, 26 May 2021 15:14:24 +0530
Message-ID: <20210526094424.27234-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DMA was never supported by i2c-omap driver and the bindings were never
documented. Therefore drop the entries in preparation to moving
bindings to YAML schema.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 arch/arm/boot/dts/dm816x.dtsi | 4 ----
 arch/arm/boot/dts/omap2.dtsi  | 4 ----
 arch/arm/boot/dts/omap3.dtsi  | 6 ------
 3 files changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/dm816x.dtsi b/arch/arm/boot/dts/dm816x.dtsi
index 3551a64963f8..2d3d6906b3fb 100644
--- a/arch/arm/boot/dts/dm816x.dtsi
+++ b/arch/arm/boot/dts/dm816x.dtsi
@@ -314,8 +314,6 @@ i2c1: i2c@48028000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupts = <70>;
-			dmas = <&edma 58 0 &edma 59 0>;
-			dma-names = "tx", "rx";
 		};
 
 		i2c2: i2c@4802a000 {
@@ -325,8 +323,6 @@ i2c2: i2c@4802a000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupts = <71>;
-			dmas = <&edma 60 0 &edma 61 0>;
-			dma-names = "tx", "rx";
 		};
 
 		intc: interrupt-controller@48200000 {
diff --git a/arch/arm/boot/dts/omap2.dtsi b/arch/arm/boot/dts/omap2.dtsi
index f9c2a9938898..5750ca1233cc 100644
--- a/arch/arm/boot/dts/omap2.dtsi
+++ b/arch/arm/boot/dts/omap2.dtsi
@@ -120,8 +120,6 @@ i2c1: i2c@48070000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupts = <56>;
-			dmas = <&sdma 27 &sdma 28>;
-			dma-names = "tx", "rx";
 		};
 
 		i2c2: i2c@48072000 {
@@ -131,8 +129,6 @@ i2c2: i2c@48072000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupts = <57>;
-			dmas = <&sdma 29 &sdma 30>;
-			dma-names = "tx", "rx";
 		};
 
 		mcspi1: spi@48098000 {
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index c5b9da0d7e6c..eeee6c95a42e 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -403,8 +403,6 @@ i2c1: i2c@48070000 {
 			compatible = "ti,omap3-i2c";
 			reg = <0x48070000 0x80>;
 			interrupts = <56>;
-			dmas = <&sdma 27 &sdma 28>;
-			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ti,hwmods = "i2c1";
@@ -414,8 +412,6 @@ i2c2: i2c@48072000 {
 			compatible = "ti,omap3-i2c";
 			reg = <0x48072000 0x80>;
 			interrupts = <57>;
-			dmas = <&sdma 29 &sdma 30>;
-			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ti,hwmods = "i2c2";
@@ -425,8 +421,6 @@ i2c3: i2c@48060000 {
 			compatible = "ti,omap3-i2c";
 			reg = <0x48060000 0x80>;
 			interrupts = <61>;
-			dmas = <&sdma 25 &sdma 26>;
-			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ti,hwmods = "i2c3";
-- 
2.31.1

