Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D37925F6E6
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 11:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgIGJw5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 05:52:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54230 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbgIGJw4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 05:52:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0879qmdQ117456;
        Mon, 7 Sep 2020 04:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599472368;
        bh=i3j76ZYhe9h91va69GB+bKTwbsMcKWkJWLeNjHjKQeU=;
        h=From:To:CC:Subject:Date;
        b=K4xXfzbLGEo3bgrGzGkuXP3SffMuB6udV/OafLpBfVF4Ua1bcICZkHG7ouH0Fdb2m
         2WNVxvqziWBL5VnWGSDKU2+jbs1gd9/Jo/xmaY2V0Lha08kKjarq2tOdMhEr/QW8vG
         D8kkKIzkuOodpSZYjEyPu16qK9cROEnigUP8LscI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0879qmeW048613
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 04:52:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 04:52:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 04:52:48 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0879qkIR013265;
        Mon, 7 Sep 2020 04:52:47 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] ARM: dts: dra7: add second SHA instance
Date:   Mon, 7 Sep 2020 12:52:46 +0300
Message-ID: <20200907095246.1651-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DRA7 SoC has two SHA instances, add the missing second one under the
main dts file.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
Hi Tony,

This patch depends on: https://patchwork.kernel.org/patch/11760193/

 arch/arm/boot/dts/dra7.dtsi | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index cca6b123856f..b9cd5bacd606 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -932,7 +932,7 @@
 			};
 		};
 
-		sham_target: target-module@4b101000 {
+		sham1_target: target-module@4b101000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
 			reg = <0x4b101100 0x4>,
 			      <0x4b101110 0x4>,
@@ -951,7 +951,7 @@
 			#size-cells = <1>;
 			ranges = <0x0 0x4b101000 0x1000>;
 
-			sham: sham@0 {
+			sham1: sham@0 {
 				compatible = "ti,omap5-sham";
 				reg = <0 0x300>;
 				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
@@ -962,6 +962,36 @@
 			};
 		};
 
+		sham2_target: target-module@42701000 {
+			compatible = "ti,sysc-omap3-sham", "ti,sysc";
+			reg = <0x42701100 0x4>,
+			      <0x42701110 0x4>,
+			      <0x42701114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): l4per_pwrdm, l4sec_clkdm */
+			clocks = <&l4sec_clkctrl DRA7_L4SEC_SHAM2_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x42701000 0x1000>;
+
+			sham2: sham@0 {
+				compatible = "ti,omap5-sham";
+				reg = <0 0x300>;
+				interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&edma_xbar 165 0>;
+				dma-names = "rx";
+				clocks = <&l3_iclk_div>;
+				clock-names = "fck";
+			};
+		};
+
 		opp_supply_mpu: opp-supply@4a003b20 {
 			compatible = "ti,omap5-opp-supply";
 			reg = <0x4a003b20 0xc>;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
