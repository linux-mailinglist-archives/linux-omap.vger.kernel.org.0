Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA92D1BE0EE
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2OaV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:30:21 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44286 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgD2OaV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:30:21 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEUEL7053747;
        Wed, 29 Apr 2020 09:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588170614;
        bh=wVT5Fy4WxIeGBWpm63lGslI6NL0UocyEOMuJsuDJe2o=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sgElPn0f01EXT9OXVq2RB+s2cgfwEWfROAKK6i60I5jl+LwAK5gdw+dUDAJ//LFAx
         9gHaVSyiyYH2Rpfk2AajDAo6hxXF3cFwwLucA3LJB2TmCT++QsPGDlFTWAnabW3VYR
         oups19K0HVcsqjt+vu2uChwAy7IAj8NThoNkwxPk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEUEca125774
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:30:14 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:30:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:30:13 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU54p010784;
        Wed, 29 Apr 2020 09:30:13 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/8] ARM: dts: omap5: add SHA crypto accelerator node
Date:   Wed, 29 Apr 2020 17:29:59 +0300
Message-ID: <20200429143002.5050-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429143002.5050-1-t-kristo@ti.com>
References: <20200429143002.5050-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add the single available SHA crypto accelerator device for OMAP5 SoC.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap5.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 007911685cd9..5e74f441c7e5 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -305,6 +305,34 @@
 			};
 		};
 
+		sham_target: target-module@4b100000 {
+			compatible = "ti,sysc-omap3-sham", "ti,sysc";
+			reg = <0x4b100100 0x4>,
+			      <0x4b100110 0x4>,
+			      <0x4b100114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): l4per_pwrdm, l4sec_clkdm */
+			clocks = <&l4sec_clkctrl OMAP5_SHA2MD5_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4b100000 0x1000>;
+
+			sham: sham@0 {
+				compatible = "ti,omap4-sham";
+				reg = <0 0x300>;
+				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 119>;
+				dma-names = "rx";
+			};
+		};
+
 		bandgap: bandgap@4a0021e0 {
 			reg = <0x4a0021e0 0xc
 			       0x4a00232c 0xc
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
