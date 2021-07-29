Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284EA3DAF60
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhG2Wqi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:38 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60426 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbhG2Wqg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMJk036096;
        Thu, 29 Jul 2021 17:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598782;
        bh=Chl8srlAMyp3nmt6HWWf9y1ZvmcjU37q7T7fu/6EFMA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MS6er1A27ReU2RIfyCE4+ZxmH21Ai/Xk+Fw+8p6SWAqD7SndM/Bw1LU+uHOTOYfyl
         1k+omrgYhgLFv/fx7QjarVjn4Lc5/WvlSfGae3F0Xln8yELibcZgC2Nq3bXnvKUxDt
         o37rxPP4mlrxP6VwRDzIh8dPPMejH3rNxZVv5m6s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkMMW125312
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:22 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMm7076805;
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkMOB016283;
        Thu, 29 Jul 2021 17:46:22 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 11/11] ARM: dts: am57xx: Add PRUSS MDIO controller nodes
Date:   Thu, 29 Jul 2021 17:46:21 -0500
Message-ID: <20210729224621.2295-12-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729224621.2295-1-s-anna@ti.com>
References: <20210729224621.2295-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRUSSs on AM57xx SoCs contain an MDIO controller that can
be used to control external PHYs associated with the Industrial
Ethernet peripherals within each PRUSS. The MDIO module used
within the PRU-ICSS is an instance of the MDIO Controller used
in TI Davinci SoCs. The same bus frequency of 1 MHz is chosen as
the regular MDIO node.

The nodes are added in the common am57-pruss.dtsi file and enabled
by default, but are disabled in all the existing AM57xx board dts
files. These nodes need pinctrl lines, and so should be enabled
only on boards where they are actually wired and pinned out for
PRUSS Ethernet. Any new board dts file should disable these if
they are not sure.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/boot/dts/am57-pruss.dtsi             | 20 +++++++++++++++++++
 arch/arm/boot/dts/am571x-idk.dts              |  8 ++++++++
 arch/arm/boot/dts/am572x-idk.dts              |  8 ++++++++
 arch/arm/boot/dts/am574x-idk.dts              |  8 ++++++++
 .../boot/dts/am57xx-beagle-x15-common.dtsi    |  8 ++++++++
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts     |  8 ++++++++
 6 files changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/am57-pruss.dtsi b/arch/arm/boot/dts/am57-pruss.dtsi
index 494d56830b34..46c5383f0eee 100644
--- a/arch/arm/boot/dts/am57-pruss.dtsi
+++ b/arch/arm/boot/dts/am57-pruss.dtsi
@@ -102,6 +102,16 @@ pru1_1: pru@38000 {
 				reg-names = "iram", "control", "debug";
 				firmware-name = "am57xx-pru1_1-fw";
 			};
+
+			pruss1_mdio: mdio@32400 {
+				compatible = "ti,davinci_mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&dpll_gmac_h13x2_ck>;
+				clock-names = "fck";
+				bus_freq = <1000000>;
+				reg = <0x32400 0x90>;
+			};
 		};
 	};
 
@@ -201,6 +211,16 @@ pru2_1: pru@38000 {
 				reg-names = "iram", "control", "debug";
 				firmware-name = "am57xx-pru2_1-fw";
 			};
+
+			pruss2_mdio: mdio@32400 {
+				compatible = "ti,davinci_mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&dpll_gmac_h13x2_ck>;
+				clock-names = "fck";
+				bus_freq = <1000000>;
+				reg = <0x32400 0x90>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index e81078c2d00d..48425020281a 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -208,3 +208,11 @@ &mmc2 {
 	pinctrl-1 = <&mmc2_pins_hs>;
 	pinctrl-2 = <&mmc2_pins_ddr_rev20 &mmc2_iodelay_ddr_conf>;
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
+
+&pruss2_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am572x-idk.dts b/arch/arm/boot/dts/am572x-idk.dts
index 6504265f3f7e..94a738cb0a4d 100644
--- a/arch/arm/boot/dts/am572x-idk.dts
+++ b/arch/arm/boot/dts/am572x-idk.dts
@@ -27,3 +27,11 @@ &mmc2 {
 	pinctrl-1 = <&mmc2_pins_hs>;
 	pinctrl-2 = <&mmc2_pins_ddr_rev20>;
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
+
+&pruss2_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am574x-idk.dts b/arch/arm/boot/dts/am574x-idk.dts
index 1b8f3a28af05..c4bf9cb2c9dc 100644
--- a/arch/arm/boot/dts/am574x-idk.dts
+++ b/arch/arm/boot/dts/am574x-idk.dts
@@ -43,3 +43,11 @@ &m_can0 {
 &emif1 {
 	status = "okay";
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
+
+&pruss2_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index 6b82ecf803c5..994e69ab38d7 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -637,3 +637,11 @@ &dsp2 {
 	status = "okay";
 	memory-region = <&dsp2_memory_region>;
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
+
+&pruss2_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index aed81568a297..2e94f32d9dfc 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -618,3 +618,11 @@ &gpio2_target {
 	status = "okay";
 	ti,no-reset-on-init;
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
+
+&pruss2_mdio {
+	status = "disabled";
+};
-- 
2.32.0

