Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462133DAF5C
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbhG2Wqg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60404 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbhG2Wqf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:35 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkM1C036092;
        Thu, 29 Jul 2021 17:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598782;
        bh=CGqqtBXZQj636K55bIY88SfvDT1XNe1TEWjPiHUZSDk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FCFAcN77tCmojn56sTa5sisf2bLFGbZIrKTJp5W9Fa1r2ysxB+7dDlInl0PdIPCW6
         /cyqrpgTpcPGvR7cr1ltkFIzwGKBUO6Bl8S0O1vyYiOMlEY+9nzxTjqiV2jxS3e/Z8
         kPe9D0+Cn88VqD8JWRmmKsJ3fb0fVYFUj8+2uY/c=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkMiH029007
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:22 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMue076793;
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkMeu016277;
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
Subject: [PATCH 09/11] ARM: dts: am4372: Add PRUSS MDIO controller node
Date:   Thu, 29 Jul 2021 17:46:19 -0500
Message-ID: <20210729224621.2295-10-s-anna@ti.com>
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

From: "Andrew F. Davis" <afd@ti.com>

The PRU-ICSS1 instance on AM437x SoCs has a MDIO sub-module that
can be used to control external PHYs associated with the Industrial
Ethernet peripherals within the PRUSS. The MDIO module used within
this PRU-ICSS is an instance of the MDIO Controller used in TI
Davinci SoCs. The same bus frequency of 1 MHz is chosen as the
regular MDIO node. Note that there is no MDIO node added to the
smaller PRU-ICSS0 instance as the MDIO pins are not pinned out.

The node is added and enabled in the common am4372.dtsi file by
default, and disabled in all the existing AM437x board dts files.
This node needs pinctrl lines, and so should be enabled only on
boards where they are actually wired and pinned out for PRUSS
Ethernet. Any new board dts file should disable these if they
are not sure.

Signed-off-by: Andrew F. Davis <afd@ti.com>
[s-anna@ti.com: fix reg address, add commit description]
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi        | 10 ++++++++++
 arch/arm/boot/dts/am437x-cm-t43.dts  |  4 ++++
 arch/arm/boot/dts/am437x-gp-evm.dts  |  4 ++++
 arch/arm/boot/dts/am437x-idk-evm.dts |  4 ++++
 arch/arm/boot/dts/am437x-sk-evm.dts  |  4 ++++
 arch/arm/boot/dts/am43x-epos-evm.dts |  4 ++++
 6 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index 2200a09c2065..61a1d88f9df6 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -511,6 +511,16 @@ pru1_1: pru@38000 {
 					reg-names = "iram", "control", "debug";
 					firmware-name = "am437x-pru1_1-fw";
 				};
+
+				pruss1_mdio: mdio@32400 {
+					compatible = "ti,davinci_mdio";
+					reg = <0x32400 0x90>;
+					clocks = <&dpll_core_m4_ck>;
+					clock-names = "fck";
+					bus_freq = <1000000>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
 			};
 
 			pruss0: pruss@40000 {
diff --git a/arch/arm/boot/dts/am437x-cm-t43.dts b/arch/arm/boot/dts/am437x-cm-t43.dts
index a83f46ed0c9a..5ce8e684e7d3 100644
--- a/arch/arm/boot/dts/am437x-cm-t43.dts
+++ b/arch/arm/boot/dts/am437x-cm-t43.dts
@@ -416,3 +416,7 @@ &cpu {
 			   <600000 1100000>,
 			   <300000 950000>;
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index e2677682b540..c2e4896076e7 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -1118,3 +1118,7 @@ &rtc {
 &cpu {
 	cpu0-supply = <&dcdc2>;
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
index 2dc525512266..53f64e3ce735 100644
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -537,3 +537,7 @@ opp100-600000000 {
 		opp-suspend;
 	};
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 496ed34f7755..20a34d2d85df 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -892,3 +892,7 @@ vpfe0_ep: endpoint {
 		};
 	};
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index aae0af10a5b1..d16aa2221c91 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -1018,3 +1018,7 @@ &mux_synctimer32k_ck {
 &cpu {
 	cpu0-supply = <&dcdc2>;
 };
+
+&pruss1_mdio {
+	status = "disabled";
+};
-- 
2.32.0

