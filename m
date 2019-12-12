Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F121C11CD7B
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbfLLMvl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:51:41 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49186 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfLLMvl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:51:41 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpdoa109099;
        Thu, 12 Dec 2019 06:51:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155099;
        bh=TEr6SScWfvJ0lJeE6Waov2g8ftJ41ES/0yvum08aSVs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EXWxqrNt40U3Tu9Fw8Q7ee8LR76D69WKe04YQu2DHZMpXHbN1MvKzHvzK8vIN3Nwl
         6IJrCUdJxt1NbBO0gWyN29C9dWoTQfUZeHhnI75vRyV4w3I0Y3Kgzlj/t7HUi4NFaI
         1t3LR284ji750+SQTzWKumX2RvbkiCdOmiZMJq7U=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCCpdno078400
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 06:51:39 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:51:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:51:38 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpWNf045158;
        Thu, 12 Dec 2019 06:51:37 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <bcousson@baylibre.com>
Subject: [PATCH 3/6] ARM: dts: omap4: convert IOMMUs to use ti-sysc
Date:   Thu, 12 Dec 2019 14:51:20 +0200
Message-ID: <20191212125123.3465-4-t-kristo@ti.com>
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

Convert omap4 IOMMUs to use ti-sysc instead of legacy omap-hwmod based
implementation. Enable the IOMMUs also while doing this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi | 11 ++++++---
 arch/arm/boot/dts/omap4.dtsi    | 43 +++++++++++++++++++++------------
 2 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
index 83f803be8ee2..8a76b6b86a97 100644
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -321,7 +321,6 @@
 
 		target-module@66000 {			/* 0x4a066000, ap 25 26.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mmu_dsp";
 			reg = <0x66000 0x4>,
 			      <0x66010 0x4>,
 			      <0x66014 0x4>;
@@ -335,12 +334,18 @@
 			/* Domains (V, P, C): iva, tesla_pwrdm, tesla_clkdm */
 			clocks = <&tesla_clkctrl OMAP4_DSP_CLKCTRL 0>;
 			clock-names = "fck";
+			resets = <&prm_tesla 1>;
+			reset-names = "rstctrl";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x66000 0x1000>;
 
-			/* mmu_dsp cannot be moved before reset driver */
-			status = "disabled";
+			mmu_dsp: mmu@0 {
+				compatible = "ti,omap4-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 2de8a6b53de9..af901fc6e909 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -173,14 +173,6 @@
 			#gpio-cells = <2>;
 		};
 
-		mmu_dsp: mmu@4a066000 {
-			compatible = "ti,omap4-iommu";
-			reg = <0x4a066000 0x100>;
-			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu_dsp";
-			#iommu-cells = <0>;
-		};
-
 		target-module@52000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "iss";
@@ -206,14 +198,35 @@
 			/* No child device binding, driver in staging */
 		};
 
-		mmu_ipu: mmu@55082000 {
-			compatible = "ti,omap4-iommu";
-			reg = <0x55082000 0x100>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu_ipu";
-			#iommu-cells = <0>;
-			ti,iommu-bus-err-back;
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
+			clocks = <&ducati_clkctrl OMAP4_IPU_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_core 2>;
+			reset-names = "rstctrl";
+			ranges = <0x0 0x55082000 0x100>;
+			#size-cells = <1>;
+			#address-cells = <1>;
+
+			mmu_ipu: mmu@0 {
+				compatible = "ti,omap4-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,iommu-bus-err-back;
+			};
 		};
+
 		target-module@4012c000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "slimbus1";
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
