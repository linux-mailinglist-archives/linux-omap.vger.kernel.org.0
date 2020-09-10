Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04F8265508
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 00:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgIJWZn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 18:25:43 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44930 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgIJWZi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 18:25:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPTYa060954;
        Thu, 10 Sep 2020 17:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599776729;
        bh=RU6iRBwYdm7JUjH8AtSM6SAyPPgcRbgfP628viV/sAs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ARaadTmHG4oSAOuFnNnGK5brNB7rTHZuZo0FeRe6TUnMR63ffW/cp0/Vf9Bks4Zrr
         ZtFS8J7opPs8Qb9QdUMMCAXE35SW4bMa7dHG7+eIHl7429u8DshV7pI+ZR+9Y6LPEO
         E3PCOLDwXPxrECdMTnzFRc6b7ecKAn5RgW8W8utU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08AMPTK3028070
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Sep 2020 17:25:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 17:25:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 17:25:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPS04017696;
        Thu, 10 Sep 2020 17:25:28 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 1/3] ARM: dts: am437x-l4: add dt node for new cpsw switchdev driver
Date:   Fri, 11 Sep 2020 01:25:16 +0300
Message-ID: <20200910222518.32486-2-grygorii.strashko@ti.com>
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

Add DT node for the new cpsw switchdev based driver.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index 3d393fe252c6..e702e9576115 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -571,6 +571,60 @@
 					phys = <&phy_gmii_sel 2 0>;
 				};
 			};
+
+			mac_sw: switch@0 {
+				compatible = "ti,am4372-cpsw","ti,cpsw-switch";
+				reg = <0x0 0x4000>;
+				ranges = <0 0 0x4000>;
+				clocks = <&cpsw_125mhz_gclk>, <&dpll_clksel_mac_clk>;
+				clock-names = "fck", "50mclk";
+				assigned-clocks = <&dpll_clksel_mac_clk>;
+				assigned-clock-rates = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				syscon = <&scm_conf>;
+				status = "disabled";
+
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH
+					      GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH
+					      GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH
+					      GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "rx_thresh", "rx", "tx", "misc";
+
+				ethernet-ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cpsw_port1: port@1 {
+						reg = <1>;
+						label = "port1";
+						mac-address = [ 00 00 00 00 00 00 ];
+						phys = <&phy_gmii_sel 1 0>;
+					};
+
+					cpsw_port2: port@2 {
+						reg = <2>;
+						label = "port2";
+						mac-address = [ 00 00 00 00 00 00 ];
+						phys = <&phy_gmii_sel 2 0>;
+					};
+				};
+
+				davinci_mdio_sw: mdio@1000 {
+					compatible = "ti,am4372-mdio", "ti,cpsw-mdio","ti,davinci_mdio";
+					clocks = <&cpsw_125mhz_gclk>;
+					clock-names = "fck";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					bus_freq = <1000000>;
+					reg = <0x1000 0x100>;
+				};
+
+				cpts {
+					clocks = <&cpsw_cpts_rft_clk>;
+					clock-names = "cpts";
+				};
+			};
 		};
 
 		target-module@200000 {			/* 0x4a200000, ap 7 02.0 */
-- 
2.17.1

