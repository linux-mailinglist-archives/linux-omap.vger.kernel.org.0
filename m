Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C46326059C
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 22:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbgIGUWP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 16:22:15 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50918 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730261AbgIGUWP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 16:22:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087KMCMT036338;
        Mon, 7 Sep 2020 15:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599510132;
        bh=QU39mscjtPHjuuKEj11p2GA7hSHd5TgWJ0hXRoHNo28=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mG0m9VDAz31i0ZbCKd2NNbv7d3UcotdLLNcoZPW4kGRLkoVtK3apMhkvHi0sH/+7w
         xrucWHIBh7lTBNnbvNcMc/cQf0rwl1b2Ch1Se8aIpbF4MAGwECWxx9HLevIz81Aujp
         1LrM5zcLdkC8Dv5x8bYmjWqFsA4OT6DIEE1ZUa/8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 087KMCwJ085929
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 15:22:12 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 15:22:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 15:22:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KMAcb054519;
        Mon, 7 Sep 2020 15:22:11 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 6/6] ARM: dts: dra7: drop legacy cpsw dt node
Date:   Mon, 7 Sep 2020 23:21:25 +0300
Message-ID: <20200907202125.22943-7-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907202125.22943-1-grygorii.strashko@ti.com>
References: <20200907202125.22943-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All dra7/am57 boards converted to use new driver, so drop legacy
cpsw dt node.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 54 ----------------------------------
 arch/arm/boot/dts/dra7.dtsi    |  4 +--
 2 files changed, 2 insertions(+), 56 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 27a6a83cc60c..703ba6a26272 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3038,60 +3038,6 @@
 			 */
 			ti,no-idle;
 
-			mac: ethernet@0 {
-				compatible = "ti,dra7-cpsw","ti,cpsw";
-				clocks = <&gmac_main_clk>, <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
-				clock-names = "fck", "cpts";
-				cpdma_channels = <8>;
-				ale_entries = <1024>;
-				bd_ram_size = <0x2000>;
-				mac_control = <0x20>;
-				slaves = <2>;
-				active_slave = <0>;
-				cpts_clock_mult = <0x784CFE14>;
-				cpts_clock_shift = <29>;
-				reg = <0x0 0x1000
-				       0x1200 0x2e00>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-
-				/*
-				 * rx_thresh_pend
-				 * rx_pend
-				 * tx_pend
-				 * misc_pend
-				 */
-				interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>;
-				ranges = <0 0 0x4000>;
-				syscon = <&scm_conf>;
-				status = "disabled";
-
-				davinci_mdio: mdio@1000 {
-					compatible = "ti,cpsw-mdio","ti,davinci_mdio";
-					clocks = <&gmac_main_clk>;
-					clock-names = "fck";
-					#address-cells = <1>;
-					#size-cells = <0>;
-					bus_freq = <1000000>;
-					reg = <0x1000 0x100>;
-				};
-
-				cpsw_emac0: slave@200 {
-					/* Filled in by U-Boot */
-					mac-address = [ 00 00 00 00 00 00 ];
-					phys = <&phy_gmii_sel 1>;
-				};
-
-				cpsw_emac1: slave@300 {
-					/* Filled in by U-Boot */
-					mac-address = [ 00 00 00 00 00 00 ];
-					phys = <&phy_gmii_sel 2>;
-				};
-			};
-
 			mac_sw: switch@0 {
 				compatible = "ti,dra7-cpsw-switch","ti,cpsw-switch";
 				reg = <0x0 0x4000>;
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index cca6b123856f..4e1bbc0198eb 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -37,8 +37,8 @@
 		serial7 = &uart8;
 		serial8 = &uart9;
 		serial9 = &uart10;
-		ethernet0 = &cpsw_emac0;
-		ethernet1 = &cpsw_emac1;
+		ethernet0 = &cpsw_port1;
+		ethernet1 = &cpsw_port2;
 		d_can0 = &dcan1;
 		d_can1 = &dcan2;
 		spi0 = &qspi;
-- 
2.17.1

