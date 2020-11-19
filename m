Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71AF62B96BF
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 16:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgKSPpI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 10:45:08 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50904 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgKSPpI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 10:45:08 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJFj67r126863;
        Thu, 19 Nov 2020 09:45:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605800706;
        bh=K6/+bqPgqxNYeZrn2Alo2UZZh4XfSRrW8f4wwrjH5kA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mZE3F27smoiz1XoKz2SBeZ1IROk4cxZZCxCUa2HvpA1QOsOjHBa+SAgqD4/8ZD7jr
         3PfVBupZE5GpOsZfk6I4urdwGP2huSepsMgDQ+JFU9bzmaOjci7Onoku1dTFknUZ1T
         o4BZ+GeGEA/7NgGZbgv8UUsDKiHRBqE8Q61dGVko=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJFj6Tx090812
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Nov 2020 09:45:06 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 09:45:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 09:45:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJFj5dC103354;
        Thu, 19 Nov 2020 09:45:05 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 1/2] ARM: dts: am33xx-l4: add dt node for new cpsw switchdev driver
Date:   Thu, 19 Nov 2020 17:44:51 +0200
Message-ID: <20201119154452.26961-2-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119154452.26961-1-grygorii.strashko@ti.com>
References: <20201119154452.26961-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add DT node for the new cpsw switchdev based driver.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 49 ++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index ea20e4bdf040..2dbf7cdc9882 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -751,6 +751,55 @@
 					phys = <&phy_gmii_sel 2 1>;
 				};
 			};
+
+			mac_sw: switch@0 {
+				compatible = "ti,am335x-cpsw-switch", "ti,cpsw-switch";
+				reg = <0x0 0x4000>;
+				ranges = <0 0 0x4000>;
+				clocks = <&cpsw_125mhz_gclk>;
+				clock-names = "fck";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				syscon = <&scm_conf>;
+				status = "disabled";
+
+				interrupts = <40 41 42 43>;
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
+						phys = <&phy_gmii_sel 1 1>;
+					};
+
+					cpsw_port2: port@2 {
+						reg = <2>;
+						label = "port2";
+						mac-address = [ 00 00 00 00 00 00 ];
+						phys = <&phy_gmii_sel 2 1>;
+					};
+				};
+
+				davinci_mdio_sw: mdio@1000 {
+					compatible = "ti,cpsw-mdio","ti,davinci_mdio";
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
 
 		target-module@180000 {			/* 0x4a180000, ap 5 10.0 */
-- 
2.17.1

