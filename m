Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF339FC58
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfH1H5Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:16 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37178 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfH1H5P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:15 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7vBIU127680;
        Wed, 28 Aug 2019 02:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979031;
        bh=5yW8fV2aU6cp78IZNk82SS1ovC+9UqCNq1P3T0ks24o=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WTjatuQZFbOkDItcdVs8lF25JbP8N1+tRMJ0V1iSmb6dMu8b5PF5JUBFbzr5SwWDB
         sZMMKI0lNVEhjXUSjP2UxuUQfE457FWBOWoHZG9PHsYcX06nc/mU/WI3KfV8qSrVFb
         GM3G0WskhfwnnrFeJNr0WyDZMAZ7hvOlZEY7LIKY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7vA9I124390
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:57:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:57:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:57:10 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFs107124;
        Wed, 28 Aug 2019 02:57:09 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 09/10] ARM: dts: omap4: convert IOMMUs to use ti-sysc
Date:   Wed, 28 Aug 2019 10:56:43 +0300
Message-ID: <20190828075644.4493-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828075644.4493-1-t-kristo@ti.com>
References: <20190828075644.4493-1-t-kristo@ti.com>
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
index 0977bc39955b..7eca6cdbbdd9 100644
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
index e377f66fc322..f28fe1c36b0c 100644
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
