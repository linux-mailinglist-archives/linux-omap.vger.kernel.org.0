Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6EE111CD7D
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbfLLMvl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:51:41 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33150 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729244AbfLLMvl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:51:41 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpcik042262;
        Thu, 12 Dec 2019 06:51:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155098;
        bh=gdGNt8Bd4D3tOazg61iqzY4jL5JivnDdetottPmFFxY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QQioPlm4nrA3Zp3Oa39HxQmO7w766wFe4UECAGDEJwzxV0wgOUyVC6Uv3KoJy0WOs
         jnF3ONRE4dY/4n782cZT3dJmaJUM7dV/kiechDhGNS2Nbf5wekkFo3M1wwG2GEoJCD
         IvEIPazpB90t0ahbjaGvN/PNVDfJywwDW8lJP+V0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCCpclk078393
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 06:51:38 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:51:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:51:37 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCCpWNe045158;
        Thu, 12 Dec 2019 06:51:36 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <devicetree@vger.kernel.org>, <bcousson@baylibre.com>
Subject: [PATCH 2/6] ARM: dts: dra74x: convert IOMMUs to use ti-sysc
Date:   Thu, 12 Dec 2019 14:51:19 +0200
Message-ID: <20191212125123.3465-3-t-kristo@ti.com>
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

Convert dra74x IOMMUs to use ti-sysc instead of legacy omap-hwmod based
implementation. Enable the IOMMUs also while doing this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra74x.dtsi | 71 +++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index d1b5b76bc5a8..c5abc436ca1f 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -66,24 +66,63 @@
 			};
 		};
 
-		mmu0_dsp2: mmu@41501000 {
-			compatible = "ti,dra7-dsp-iommu";
-			reg = <0x41501000 0x100>;
-			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu0_dsp2";
-			#iommu-cells = <0>;
-			ti,syscon-mmuconfig = <&dsp2_system 0x0>;
-			status = "disabled";
+		target-module@41501000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x41501000 0x4>,
+			      <0x41501010 0x4>,
+			      <0x41501014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_dsp2 1>;
+			reset-names = "rstctrl";
+			ranges = <0x0 0x41501000 0x1000>;
+			#size-cells = <1>;
+			#address-cells = <1>;
+
+			mmu0_dsp2: mmu@0 {
+				compatible = "ti,dra7-dsp-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,syscon-mmuconfig = <&dsp2_system 0x0>;
+			};
 		};
 
-		mmu1_dsp2: mmu@41502000 {
-			compatible = "ti,dra7-dsp-iommu";
-			reg = <0x41502000 0x100>;
-			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-			ti,hwmods = "mmu1_dsp2";
-			#iommu-cells = <0>;
-			ti,syscon-mmuconfig = <&dsp2_system 0x1>;
-			status = "disabled";
+		target-module@41502000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x41502000 0x4>,
+			      <0x41502010 0x4>,
+			      <0x41502014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+
+			clocks = <&dsp2_clkctrl DRA7_DSP2_MMU0_DSP2_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_dsp2 1>;
+			reset-names = "rstctrl";
+			ranges = <0x0 0x41502000 0x1000>;
+			#size-cells = <1>;
+			#address-cells = <1>;
+
+			mmu1_dsp2: mmu@0 {
+				compatible = "ti,dra7-dsp-iommu";
+				reg = <0x0 0x100>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				#iommu-cells = <0>;
+				ti,syscon-mmuconfig = <&dsp2_system 0x1>;
+			};
 		};
 	};
 };
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
