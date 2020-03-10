Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D160017F6C0
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 12:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgCJLx1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 07:53:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43044 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgCJLx1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Mar 2020 07:53:27 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02ABrGt4090450;
        Tue, 10 Mar 2020 06:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583841196;
        bh=/V05tI97b+o4euK188OHj7APR/Z3sRaOxeCvenO2y2c=;
        h=From:To:CC:Subject:Date;
        b=Ke8TM4q7CUvf5KCHilVqDfCAZErBaeGLhSor80fhUsPVikiyFtcNPs6Gao2WB9Qu5
         pPJHoDtCSG5lsyMNCYVz8oyIrLq+7gHjouUGvGre9A+wLNGRF0F9QWQVj7e/HCsSqF
         C/qwHE/gQ011UIGGux2oUMNIZjTnjJVZjSgHdjhA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02ABrGEi104406
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Mar 2020 06:53:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Mar 2020 06:53:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Mar 2020 06:53:16 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02ABrDAD009274;
        Tue, 10 Mar 2020 06:53:13 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <tony@atomide.com>
CC:     <hch@lst.de>, <robin.murphy@arm.com>, <robh+dt@kernel.org>,
        <nm@ti.com>, <t-kristo@ti.com>, <nsekhar@ti.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH] ARM: dts: dra7: Add bus_dma_limit for L3 bus
Date:   Tue, 10 Mar 2020 13:53:09 +0200
Message-ID: <20200310115309.31354-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The L3 interconnect can access only 32-bits of address.
Add the dma-ranges property to reflect this limit.

This will ensure that no device under L3 is
given > 32-bit address for DMA.

Issue was observed only with SATA on DRA7-EVM with 4GB RAM
and CONFIG_ARM_LPAE enabled. This is because the controller
can perform 64-bit DMA and was setting the dma_mask to 64-bit.

Setting the correct bus_dma_limit fixes the issue.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi |  20 ++---
 arch/arm/boot/dts/dra7.dtsi    | 129 +++++++++++++++++----------------
 arch/arm/boot/dts/dra72x.dtsi  |   6 +-
 arch/arm/boot/dts/dra74x.dtsi  |  33 +++++----
 4 files changed, 95 insertions(+), 93 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index fc418834890d..5bbe3de7eba3 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2280,11 +2280,11 @@
 
 &l4_per2 {						/* 0x48400000 */
 	compatible = "ti,dra7-l4-per2", "simple-bus";
-	reg = <0x48400000 0x800>,
-	      <0x48400800 0x800>,
-	      <0x48401000 0x400>,
-	      <0x48401400 0x400>,
-	      <0x48401800 0x400>;
+	reg = <0x48400000 0x0 0x800>,
+	      <0x48400800 0x0 0x800>,
+	      <0x48401000 0x0 0x400>,
+	      <0x48401400 0x0 0x400>,
+	      <0x48401800 0x0 0x400>;
 	reg-names = "ap", "la", "ia0", "ia1", "ia2";
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -3152,11 +3152,11 @@
 
 &l4_per3 {						/* 0x48800000 */
 	compatible = "ti,dra7-l4-per3", "simple-bus";
-	reg = <0x48800000 0x800>,
-	      <0x48800800 0x800>,
-	      <0x48801000 0x400>,
-	      <0x48801400 0x400>,
-	      <0x48801800 0x400>;
+	reg = <0x48800000 0x0 0x800>,
+	      <0x48800800 0x0 0x800>,
+	      <0x48801000 0x0 0x400>,
+	      <0x48801400 0x0 0x400>,
+	      <0x48801800 0x0 0x400>;
 	reg-names = "ap", "la", "ia0", "ia1", "ia2";
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index d78b684e7fca..81e7f30afe02 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -146,8 +146,9 @@
 	ocp {
 		compatible = "ti,dra7-l3-noc", "simple-bus";
 		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x0 0xc0000000>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x0 0xc0000000>;
+		dma-ranges = <0x0 0x0 0x0 0x1 0x00000000>;
 		ti,hwmods = "l3_main_1", "l3_main_2";
 		reg = <0x0 0x44000000 0x0 0x1000000>,
 		      <0x0 0x45000000 0x0 0x1000>;
@@ -261,7 +262,7 @@
 
 		ocmcram1: ocmcram@40300000 {
 			compatible = "mmio-sram";
-			reg = <0x40300000 0x80000>;
+			reg = <0x40300000 0x0 0x80000>;
 			ranges = <0x0 0x40300000 0x80000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -291,7 +292,7 @@
 		ocmcram2: ocmcram@40400000 {
 			status = "disabled";
 			compatible = "mmio-sram";
-			reg = <0x40400000 0x100000>;
+			reg = <0x40400000 0x0 0x100000>;
 			ranges = <0x0 0x40400000 0x100000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -300,19 +301,19 @@
 		ocmcram3: ocmcram@40500000 {
 			status = "disabled";
 			compatible = "mmio-sram";
-			reg = <0x40500000 0x100000>;
+			reg = <0x40500000 0x0 0x100000>;
 			ranges = <0x0 0x40500000 0x100000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 		};
 
 		bandgap: bandgap@4a0021e0 {
-			reg = <0x4a0021e0 0xc
-				0x4a00232c 0xc
-				0x4a002380 0x2c
-				0x4a0023C0 0x3c
-				0x4a002564 0x8
-				0x4a002574 0x50>;
+			reg = <0x4a0021e0 0x0 0xc
+				0x4a00232c 0x0 0xc
+				0x4a002380 0x0 0x2c
+				0x4a0023C0 0x0 0x3c
+				0x4a002564 0x0 0x8
+				0x4a002574 0x0 0x50>;
 				compatible = "ti,dra752-bandgap";
 				interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 				#thermal-sensor-cells = <1>;
@@ -320,12 +321,12 @@
 
 		dsp1_system: dsp_system@40d00000 {
 			compatible = "syscon";
-			reg = <0x40d00000 0x100>;
+			reg = <0x40d00000 0x0 0x100>;
 		};
 
 		dra7_iodelay_core: padconf@4844a000 {
 			compatible = "ti,dra7-iodelay";
-			reg = <0x4844a000 0x0d1c>;
+			reg = <0x4844a000 0x0 0x0d1c>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#pinctrl-cells = <2>;
@@ -334,7 +335,7 @@
 		edma: edma@43300000 {
 			compatible = "ti,edma3-tpcc";
 			ti,hwmods = "tpcc";
-			reg = <0x43300000 0x100000>;
+			reg = <0x43300000 0x0 0x100000>;
 			reg-names = "edma3_cc";
 			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
@@ -357,7 +358,7 @@
 		edma_tptc0: tptc@43400000 {
 			compatible = "ti,edma3-tptc";
 			ti,hwmods = "tptc0";
-			reg =	<0x43400000 0x100000>;
+			reg =	<0x43400000 0x0 0x100000>;
 			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "edma3_tcerrint";
 		};
@@ -365,23 +366,23 @@
 		edma_tptc1: tptc@43500000 {
 			compatible = "ti,edma3-tptc";
 			ti,hwmods = "tptc1";
-			reg =	<0x43500000 0x100000>;
+			reg =	<0x43500000 0x0 0x100000>;
 			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "edma3_tcerrint";
 		};
 
 		dmm@4e000000 {
 			compatible = "ti,omap5-dmm";
-			reg = <0x4e000000 0x800>;
+			reg = <0x4e000000 0x0 0x800>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			ti,hwmods = "dmm";
 		};
 
 		target-module@40d01000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x40d01000 0x4>,
-			      <0x40d01010 0x4>,
-			      <0x40d01014 0x4>;
+			reg = <0x40d01000 0x0 0x4>,
+			      <0x40d01010 0x0 0x4>,
+			      <0x40d01014 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
@@ -408,9 +409,9 @@
 
 		target-module@40d02000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x40d02000 0x4>,
-			      <0x40d02010 0x4>,
-			      <0x40d02014 0x4>;
+			reg = <0x40d02000 0x0 0x4>,
+			      <0x40d02010 0x0 0x4>,
+			      <0x40d02014 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
@@ -437,9 +438,9 @@
 
 		target-module@58882000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x58882000 0x4>,
-			      <0x58882010 0x4>,
-			      <0x58882014 0x4>;
+			reg = <0x58882000 0x0 0x4>,
+			      <0x58882010 0x0 0x4>,
+			      <0x58882014 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
@@ -466,9 +467,9 @@
 
 		target-module@55082000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x55082000 0x4>,
-			      <0x55082010 0x4>,
-			      <0x55082014 0x4>;
+			reg = <0x55082000 0x0 0x4>,
+			      <0x55082010 0x0 0x4>,
+			      <0x55082014 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
@@ -502,9 +503,9 @@
 			ti,settling-time = <50>;
 			ti,clock-cycles = <16>;
 
-			reg = <0x4ae07ddc 0x4>, <0x4ae07de0 0x4>,
-			      <0x4ae06014 0x4>, <0x4a003b20 0xc>,
-			      <0x4ae0c158 0x4>;
+			reg = <0x4ae07ddc 0x0 0x4>, <0x4ae07de0 0x0 0x4>,
+			      <0x4ae06014 0x0 0x4>, <0x4a003b20 0x0 0xc>,
+			      <0x4ae0c158 0x0 0x4>;
 			reg-names = "setup-address", "control-address",
 				    "int-address", "efuse-address",
 				    "ldo-address";
@@ -535,9 +536,9 @@
 			ti,settling-time = <50>;
 			ti,clock-cycles = <16>;
 
-			reg = <0x4ae07e34 0x4>, <0x4ae07e24 0x4>,
-			      <0x4ae06010 0x4>, <0x4a0025cc 0xc>,
-			      <0x4a002470 0x4>;
+			reg = <0x4ae07e34 0x0 0x4>, <0x4ae07e24 0x0 0x4>,
+			      <0x4ae06010 0x0 0x4>, <0x4a0025cc 0x0 0xc>,
+			      <0x4a002470 0x0 0x4>;
 			reg-names = "setup-address", "control-address",
 				    "int-address", "efuse-address",
 				    "ldo-address";
@@ -568,9 +569,9 @@
 			ti,settling-time = <50>;
 			ti,clock-cycles = <16>;
 
-			reg = <0x4ae07e30 0x4>, <0x4ae07e20 0x4>,
-			      <0x4ae06010 0x4>, <0x4a0025e0 0xc>,
-			      <0x4a00246c 0x4>;
+			reg = <0x4ae07e30 0x0 0x4>, <0x4ae07e20 0x0 0x4>,
+			      <0x4ae06010 0x0 0x4>, <0x4a0025e0 0x0 0xc>,
+			      <0x4a00246c 0x0 0x4>;
 			reg-names = "setup-address", "control-address",
 				    "int-address", "efuse-address",
 				    "ldo-address";
@@ -601,9 +602,9 @@
 			ti,settling-time = <50>;
 			ti,clock-cycles = <16>;
 
-			reg = <0x4ae07de4 0x4>, <0x4ae07de8 0x4>,
-			      <0x4ae06010 0x4>, <0x4a003b08 0xc>,
-			      <0x4ae0c154 0x4>;
+			reg = <0x4ae07de4 0x0 0x4>, <0x4ae07de8 0x0 0x4>,
+			      <0x4ae06010 0x0 0x4>, <0x4a003b08 0x0 0xc>,
+			      <0x4ae0c154 0x0 0x4>;
 			reg-names = "setup-address", "control-address",
 				    "int-address", "efuse-address",
 				    "ldo-address";
@@ -627,8 +628,8 @@
 
 		qspi: spi@4b300000 {
 			compatible = "ti,dra7xxx-qspi";
-			reg = <0x4b300000 0x100>,
-			      <0x5c000000 0x4000000>;
+			reg = <0x4b300000 0x0 0x100>,
+			      <0x5c000000 0x0 0x4000000>;
 			reg-names = "qspi_base", "qspi_mmap";
 			syscon-chipselects = <&scm_conf 0x558>;
 			#address-cells = <1>;
@@ -644,7 +645,7 @@
 		/* OCP2SCP3 */
 		sata: sata@4a141100 {
 			compatible = "snps,dwc-ahci";
-			reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
+			reg = <0x4a140000 0x0 0x1100>, <0x4a141100 0x0 0x7>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&sata_phy>;
 			phy-names = "sata-phy";
@@ -658,7 +659,7 @@
 		gpmc: gpmc@50000000 {
 			compatible = "ti,am3352-gpmc";
 			ti,hwmods = "gpmc";
-			reg = <0x50000000 0x37c>;      /* device IO registers */
+			reg = <0x50000000 0x0 0x37c>;      /* device IO registers */
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&edma_xbar 4 0>;
 			dma-names = "rxtx";
@@ -675,8 +676,8 @@
 
 		target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			reg = <0x5600fe00 0x4>,
-			      <0x5600fe10 0x4>;
+			reg = <0x5600fe00 0x0 0x4>,
+			      <0x5600fe10 0x0 0x4>;
 			reg-names = "rev", "sysc";
 			ti,sysc-midle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
@@ -693,7 +694,7 @@
 
 		crossbar_mpu: crossbar@4a002a48 {
 			compatible = "ti,irq-crossbar";
-			reg = <0x4a002a48 0x130>;
+			reg = <0x4a002a48 0x0 0x130>;
 			interrupt-controller;
 			interrupt-parent = <&wakeupgen>;
 			#interrupt-cells = <3>;
@@ -715,11 +716,11 @@
 			syscon-pll-ctrl = <&scm_conf 0x538>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x58000000 0x79000>;
 
 			dispc@58001000 {
 				compatible = "ti,dra7-dispc";
-				reg = <0x58001000 0x1000>;
+				reg = <0x1000 0x1000>;
 				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 				ti,hwmods = "dss_dispc";
 				clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>;
@@ -730,10 +731,10 @@
 
 			hdmi: encoder@58060000 {
 				compatible = "ti,dra7-hdmi";
-				reg = <0x58040000 0x200>,
-				      <0x58040200 0x80>,
-				      <0x58040300 0x80>,
-				      <0x58060000 0x19000>;
+				reg = <0x40000 0x200>,
+				      <0x40200 0x80>,
+				      <0x40300 0x80>,
+				      <0x60000 0x19000>;
 				reg-names = "wp", "pll", "phy", "core";
 				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -748,9 +749,9 @@
 
 		aes1_target: target-module@4b500000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x4b500080 0x4>,
-			      <0x4b500084 0x4>,
-			      <0x4b500088 0x4>;
+			reg = <0x4b500080 0x0 0x4>,
+			      <0x4b500084 0x0 0x4>,
+			      <0x4b500088 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
 					 SYSC_OMAP2_AUTOIDLE)>;
@@ -779,9 +780,9 @@
 
 		aes2_target: target-module@4b700000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x4b700080 0x4>,
-			      <0x4b700084 0x4>,
-			      <0x4b700088 0x4>;
+			reg = <0x4b700080 0x0 0x4>,
+			      <0x4b700084 0x0 0x4>,
+			      <0x4b700088 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
 					 SYSC_OMAP2_AUTOIDLE)>;
@@ -810,9 +811,9 @@
 
 		sham_target: target-module@4b101000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
-			reg = <0x4b101100 0x4>,
-			      <0x4b101110 0x4>,
-			      <0x4b101114 0x4>;
+			reg = <0x4b101100 0x0 0x4>,
+			      <0x4b101110 0x0 0x4>,
+			      <0x4b101114 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
 					 SYSC_OMAP2_AUTOIDLE)>;
@@ -840,7 +841,7 @@
 
 		opp_supply_mpu: opp-supply@4a003b20 {
 			compatible = "ti,omap5-opp-supply";
-			reg = <0x4a003b20 0xc>;
+			reg = <0x4a003b20 0x0 0xc>;
 			ti,efuse-settings = <
 			/* uV   offset */
 			1060000 0x0
diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index 82b57a35abc0..09c1801c18c3 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -60,9 +60,9 @@
 };
 
 &dss {
-	reg = <0x58000000 0x80>,
-	      <0x58004054 0x4>,
-	      <0x58004300 0x20>;
+	reg = <0x58000000 0x0 0x80>,
+	      <0x58004054 0x0 0x4>,
+	      <0x58004300 0x0 0x20>;
 	reg-names = "dss", "pll1_clkctrl", "pll1";
 
 	clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>,
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index c5abc436ca1f..a88a64af41e0 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -39,22 +39,23 @@
 	ocp {
 		dsp2_system: dsp_system@41500000 {
 			compatible = "syscon";
-			reg = <0x41500000 0x100>;
+			reg = <0x41500000 0x0 0x100>;
 		};
 
 		omap_dwc3_4: omap_dwc3_4@48940000 {
 			compatible = "ti,dwc3";
 			ti,hwmods = "usb_otg_ss4";
-			reg = <0x48940000 0x10000>;
+			reg = <0x48940000 0x0 0x10000>;
 			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			utmi-mode = <2>;
-			ranges;
+			ranges = <0x0 0x48940000 0x20000>;
 			status = "disabled";
-			usb4: usb@48950000 {
+
+			usb4: usb@10000 {
 				compatible = "snps,dwc3";
-				reg = <0x48950000 0x17000>;
+				reg = <0x10000 0x17000>;
 				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
@@ -68,9 +69,9 @@
 
 		target-module@41501000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x41501000 0x4>,
-			      <0x41501010 0x4>,
-			      <0x41501014 0x4>;
+			reg = <0x41501000 0x0 0x4>,
+			      <0x41501010 0x0 0x4>,
+			      <0x41501014 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
@@ -97,9 +98,9 @@
 
 		target-module@41502000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			reg = <0x41502000 0x4>,
-			      <0x41502010 0x4>,
-			      <0x41502014 0x4>;
+			reg = <0x41502000 0x0 0x4>,
+			      <0x41502010 0x0 0x4>,
+			      <0x41502014 0x0 0x4>;
 			reg-names = "rev", "sysc", "syss";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
@@ -132,11 +133,11 @@
 };
 
 &dss {
-	reg = <0x58000000 0x80>,
-	      <0x58004054 0x4>,
-	      <0x58004300 0x20>,
-	      <0x58009054 0x4>,
-	      <0x58009300 0x20>;
+	reg = <0x58000000 0x0 0x80>,
+	      <0x58004054 0x0 0x4>,
+	      <0x58004300 0x0 0x20>,
+	      <0x58009054 0x0 0x4>,
+	      <0x58009300 0x0 0x20>;
 	reg-names = "dss", "pll1_clkctrl", "pll1",
 		    "pll2_clkctrl", "pll2";
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

