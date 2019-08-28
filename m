Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AE59FC5A
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfH1H5b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:57:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39496 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfH1H5b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:57:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7vRxD007447;
        Wed, 28 Aug 2019 02:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566979047;
        bh=TGUVPD43qbXTCmcwpihYxSJ/SRD6X4Ttg1A4Zd2r+Xk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=apg1o24YwGO1eLSjaCit8514janK3qe2NeoN8RFojLPDvnKt7OYOmymY5ducRgcL1
         0mXwKT3CtGjQ3RrllutdV31SarlGlfrnBK065wn+5qcVvMVRnrJ0JapRbMMrbkPFbu
         feh5YrgNr8jrxkjkUEot/3K1M6237SZCUmBsXE28=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7vRiJ128550
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:57:27 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:57:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:57:27 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7uuFt107124;
        Wed, 28 Aug 2019 02:57:10 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 10/10] ARM: dts: omap5: convert IOMMUs to use ti-sysc
Date:   Wed, 28 Aug 2019 10:56:44 +0300
Message-ID: <20190828075644.4493-11-t-kristo@ti.com>
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

Convert omap5 IOMMUs to use ti-sysc instead of legacy omap-hwmod based
implementation. Enable the IOMMUs also while doing this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi | 11 ++++++---
 arch/arm/boot/dts/omap5.dtsi    | 40 +++++++++++++++++++++------------
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
index 0960348002ad..80c2d2fcc03b 100644
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
index c8bde171a949..05929d59b0af 100644
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
