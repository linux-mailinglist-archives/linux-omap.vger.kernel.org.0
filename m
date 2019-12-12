Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA7611CD7E
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbfLLMvn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:51:43 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33158 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729244AbfLLMvn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:51:43 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpe0a042272;
        Thu, 12 Dec 2019 06:51:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155100;
        bh=0eKKUKb1+FCo4Bz8Ve5JRVMU/HQLBZnzbJ1HqqzcI/A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FxcX5LppZlvT1fJE1djKQ03g406Dp3pFJZ9fir9vNMAba8BzoTSwRb8bOlLVNyE5i
         h78LM1UGlZsSjn6QLaCRgkJGJBbv+CzijXkyV47HfUHoLBDQUT7dBoHhEOco3LZ+vA
         GXvCWnkNRoeLYuWhkCWY7iWyJg/DBeWDYf0RuBbY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCCpeU8033980
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 06:51:40 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:51:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:51:40 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpWNg045158;
        Thu, 12 Dec 2019 06:51:39 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <bcousson@baylibre.com>
Subject: [PATCH 4/6] ARM: dts: omap5: convert IOMMUs to use ti-sysc
Date:   Thu, 12 Dec 2019 14:51:21 +0200
Message-ID: <20191212125123.3465-5-t-kristo@ti.com>
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

Convert omap5 IOMMUs to use ti-sysc instead of legacy omap-hwmod based
implementation. Enable the IOMMUs also while doing this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi | 11 ++++++---
 arch/arm/boot/dts/omap5.dtsi    | 40 +++++++++++++++++++++------------
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
index 25aacf1ba708..a29261dea3e2 100644
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -349,7 +349,6 @@
 
 		target-module@66000 {			/* 0x4a066000, ap 23 0a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mmu_dsp";
 			reg = <0x66000 0x4>,
 			      <0x66010 0x4>,
 			      <0x66014 0x4>;
@@ -364,12 +363,18 @@
 			/* Domains (V, P, C): mm, dsp_pwrdm, dsp_clkdm */
 			clocks = <&dsp_clkctrl OMAP5_MMU_DSP_CLKCTRL 0>;
 			clock-names = "fck";
+			resets = <&prm_dsp 1>;
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
 
 		target-module@70000 {			/* 0x4a070000, ap 79 2e.0 */
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 1f6ad1debc90..d0ecf54d5a23 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -186,21 +186,33 @@
 			#gpio-cells = <2>;
 		};
 
-		mmu_dsp: mmu@4a066000 {
-			compatible = "ti,omap4-iommu";
-			reg = <0x4a066000 0x100>;
-			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu_dsp";
-			#iommu-cells = <0>;
-		};
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
+			clocks = <&ipu_clkctrl OMAP5_MMU_IPU_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_core 2>;
+			reset-names = "rstctrl";
+			ranges = <0x0 0x55082000 0x100>;
+			#size-cells = <1>;
+			#address-cells = <1>;
 
-		mmu_ipu: mmu@55082000 {
-			compatible = "ti,omap4-iommu";
-			reg = <0x55082000 0x100>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu_ipu";
-			#iommu-cells = <0>;
-			ti,iommu-bus-err-back;
+			mmu_ipu: mmu@0 {
+				compatible = "ti,omap4-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,iommu-bus-err-back;
+			};
 		};
 
 		dmm@4e000000 {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
