Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB97526550C
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 00:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgIJWZx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 18:25:53 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41464 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgIJWZq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 18:25:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPiAM090190;
        Thu, 10 Sep 2020 17:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599776744;
        bh=gD11JyVdwWaHLo3Ml11eQLz7gFzw5VXQ8yRD/2vidE4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ejgtl18ysksbw3s01cEeE+pITUeihYnS4w5v4uTkaxP+6cCK+jFBpBRyd+qF/RdxO
         jdG9NvxIxeoZqSHUGHyU3ISW4ZOeIYdoDtHw9QNLyf3KOG3dGRJi3YohJQ2xWNH/VQ
         PsdCJGmddYoWiGzFv5qTkFm0WI6lW2mNFrdURVc4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08AMPiGL088296
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Sep 2020 17:25:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 17:25:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 17:25:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPgiP121612;
        Thu, 10 Sep 2020 17:25:43 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 3/3] ARM: dts: am437x-l4: drop legacy cpsw dt node
Date:   Fri, 11 Sep 2020 01:25:18 +0300
Message-ID: <20200910222518.32486-4-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910222518.32486-1-grygorii.strashko@ti.com>
References: <20200910222518.32486-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All am437x boards have been converted to use new driver, so drop legacy
cpsw dt node.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 51 --------------------------------
 1 file changed, 51 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index e702e9576115..d82a6eeaf1b3 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -521,57 +521,6 @@
 			#size-cells = <1>;
 			ranges = <0x0 0x100000 0x8000>;
 
-			mac: ethernet@0 {
-				compatible = "ti,am4372-cpsw","ti,cpsw";
-				reg = <0x0 0x800
-				       0x1200 0x100>;
-				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH
-					      GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH
-					      GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH
-					      GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				clocks = <&cpsw_125mhz_gclk>, <&cpsw_cpts_rft_clk>,
-					 <&dpll_clksel_mac_clk>;
-				clock-names = "fck", "cpts", "50mclk";
-				assigned-clocks = <&dpll_clksel_mac_clk>;
-				assigned-clock-rates = <50000000>;
-				status = "disabled";
-				cpdma_channels = <8>;
-				ale_entries = <1024>;
-				bd_ram_size = <0x2000>;
-				mac_control = <0x20>;
-				slaves = <2>;
-				active_slave = <0>;
-				cpts_clock_mult = <0x80000000>;
-				cpts_clock_shift = <29>;
-				ranges = <0 0 0x8000>;
-				syscon = <&scm_conf>;
-
-				davinci_mdio: mdio@1000 {
-					compatible = "ti,am4372-mdio","ti,cpsw-mdio","ti,davinci_mdio";
-					reg = <0x1000 0x100>;
-					clocks = <&cpsw_125mhz_clkctrl AM4_CPSW_125MHZ_CPGMAC0_CLKCTRL 0>;
-					clock-names = "fck";
-					#address-cells = <1>;
-					#size-cells = <0>;
-					bus_freq = <1000000>;
-					status = "disabled";
-				};
-
-				cpsw_emac0: slave@200 {
-					/* Filled in by U-Boot */
-					mac-address = [ 00 00 00 00 00 00 ];
-					phys = <&phy_gmii_sel 1 0>;
-				};
-
-				cpsw_emac1: slave@300 {
-					/* Filled in by U-Boot */
-					mac-address = [ 00 00 00 00 00 00 ];
-					phys = <&phy_gmii_sel 2 0>;
-				};
-			};
-
 			mac_sw: switch@0 {
 				compatible = "ti,am4372-cpsw","ti,cpsw-switch";
 				reg = <0x0 0x4000>;
-- 
2.17.1

