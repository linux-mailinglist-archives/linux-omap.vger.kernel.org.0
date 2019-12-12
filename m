Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A636711CD7A
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729270AbfLLMvl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:51:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41510 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbfLLMvk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:51:40 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpb4T101330;
        Thu, 12 Dec 2019 06:51:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155097;
        bh=1Zg+C9+mOLS4pU15/CRjCfOGBrSNNhZJr+fi9fi9PEc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FEP+6UEGwPYoZTCypmeMrbK24la76LvHpq1hk2yqtXQ8VPt8W16DGBsTM11rrJ7tK
         7KwKD7F/SRotWMdKGOSZltCo/sXA/E7bW7XnAlv4dMWqBSZ/gYIhmMB1ei/2djZvj6
         FL07v5STE0f5gY3W3Nbb1a7g0qfdvjmJnHpcnsVs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpbJ3017598;
        Thu, 12 Dec 2019 06:51:37 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:51:36 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:51:36 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpWNd045158;
        Thu, 12 Dec 2019 06:51:34 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <bcousson@baylibre.com>
Subject: [PATCH 1/6] ARM: dts: dra7: convert IOMMUs to use ti-sysc
Date:   Thu, 12 Dec 2019 14:51:18 +0200
Message-ID: <20191212125123.3465-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212125123.3465-1-t-kristo@ti.com>
References: <20191212125123.3465-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert dra7 IOMMUs to use ti-sysc instead of legacy omap-hwmod based
implementation. Enable the IOMMUs also while doing this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra7.dtsi | 140 +++++++++++++++++++++++++++---------
 1 file changed, 108 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index 73e5011f531a..e7c9b81d929a 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -377,44 +377,120 @@
 			ti,hwmods = "dmm";
 		};
 
-		mmu0_dsp1: mmu@40d01000 {
-			compatible = "ti,dra7-dsp-iommu";
-			reg = <0x40d01000 0x100>;
-			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu0_dsp1";
-			#iommu-cells = <0>;
-			ti,syscon-mmuconfig = <&dsp1_system 0x0>;
-			status = "disabled";
+		target-module@40d01000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x40d01000 0x4>,
+			      <0x40d01010 0x4>,
+			      <0x40d01014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			clocks = <&dsp1_clkctrl DRA7_DSP1_MMU0_DSP1_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_dsp1 1>;
+			reset-names = "rstctrl";
+			ranges = <0x0 0x40d01000 0x1000>;
+			#size-cells = <1>;
+			#address-cells = <1>;
+
+			mmu0_dsp1: mmu@0 {
+				compatible = "ti,dra7-dsp-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,syscon-mmuconfig = <&dsp1_system 0x0>;
+			};
 		};
 
-		mmu1_dsp1: mmu@40d02000 {
-			compatible = "ti,dra7-dsp-iommu";
-			reg = <0x40d02000 0x100>;
-			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu1_dsp1";
-			#iommu-cells = <0>;
-			ti,syscon-mmuconfig = <&dsp1_system 0x1>;
-			status = "disabled";
+		target-module@40d02000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x40d02000 0x4>,
+			      <0x40d02010 0x4>,
+			      <0x40d02014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			clocks = <&dsp1_clkctrl DRA7_DSP1_MMU0_DSP1_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_dsp1 1>;
+			reset-names = "rstctrl";
+			ranges = <0x0 0x40d02000 0x1000>;
+			#size-cells = <1>;
+			#address-cells = <1>;
+
+			mmu1_dsp1: mmu@0 {
+				compatible = "ti,dra7-dsp-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,syscon-mmuconfig = <&dsp1_system 0x1>;
+			};
 		};
 
-		mmu_ipu1: mmu@58882000 {
-			compatible = "ti,dra7-iommu";
-			reg = <0x58882000 0x100>;
-			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu_ipu1";
-			#iommu-cells = <0>;
-			ti,iommu-bus-err-back;
-			status = "disabled";
+		target-module@58882000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x58882000 0x4>,
+			      <0x58882010 0x4>,
+			      <0x58882014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			clocks = <&ipu1_clkctrl DRA7_IPU1_MMU_IPU1_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_ipu 2>;
+			reset-names = "rstctrl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x58882000 0x100>;
+
+			mmu_ipu1: mmu@0 {
+				compatible = "ti,dra7-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,iommu-bus-err-back;
+			};
 		};
 
-		mmu_ipu2: mmu@55082000 {
-			compatible = "ti,dra7-iommu";
-			reg = <0x55082000 0x100>;
-			interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu_ipu2";
-			#iommu-cells = <0>;
-			ti,iommu-bus-err-back;
-			status = "disabled";
+		target-module@55082000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x55082000 0x4>,
+			      <0x55082010 0x4>,
+			      <0x55082014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			clocks = <&ipu2_clkctrl DRA7_IPU2_MMU_IPU2_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_core 2>;
+			reset-names = "rstctrl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x55082000 0x100>;
+
+			mmu_ipu2: mmu@0 {
+				compatible = "ti,dra7-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,iommu-bus-err-back;
+			};
 		};
 
 		abb_mpu: regulator-abb-mpu {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
