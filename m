Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238973A4C0C
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhFLBSU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:18:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:32912 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhFLBSR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:18:17 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1GERg094185;
        Fri, 11 Jun 2021 20:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460574;
        bh=mVUg9PPIeusKoplq02v7ONkgJ9lPw5Kzc0Fj3HAmLZQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vxxeeTG9RZvln1cN+iKUnGJLfQTA1VMgVzCbiTEZeu6vCtBhGCJ4dvCraEtw8200x
         Bu6bRu+LuPy+DCtcrmoW8XGasRlaPjww80KHnNJJBE2vrIolRyJ9ulLDg3TO50iIok
         2vWUqtjNXysJ9E6OfDp5SnxSxav+Ksz57r0jEYNk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1GEhF082349
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:16:14 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:16:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:16:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1GD7V057026;
        Fri, 11 Jun 2021 20:16:13 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Teresa Remmet <t.remmet@phytec.de>
Subject: [PATCH next 12/15] ARM: dts: am335x-phycore: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:33 +0300
Message-ID: <20210612011436.10437-13-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210612011436.10437-1-grygorii.strashko@ti.com>
References: <20210612011436.10437-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dual_mac mode has been preserved the same way between legacy and new
driver, and one port devices works the same as 1 dual_mac port - it's safe
to switch drivers.

So, switch Phytec AM335x phyCORE SOM, phyBOARD-WEGA, phyBOARD-REGOR,
PCM-953 to use new cpsw switch driver. Those boards have or 2 Ext. port
wired and configured in dual_mac mode by default, or only 1 Ext. port.

Cc: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-pcm-953.dtsi     | 10 ++++------
 arch/arm/boot/dts/am335x-phycore-som.dtsi | 14 ++++++++------
 arch/arm/boot/dts/am335x-regor.dtsi       | 11 +++++------
 arch/arm/boot/dts/am335x-wega.dtsi        | 11 +++++------
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
index 6c547c83e5dd..124026fa0d09 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -123,24 +123,22 @@
 	};
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy1: ethernet-phy@2 {
 		reg = <2>;
 	};
 };
 
-&mac {
-	slaves = <2>;
+&mac_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet0_pins &ethernet1_pins>;
-	dual_emac;
 };
 
 /* Misc */
diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
index 7e46b4c02709..f65cd1331315 100644
--- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
+++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
@@ -97,24 +97,26 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&phy0>;
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&davinci_mdio {
+&cpsw_port2 {
+	status = "disabled";
+};
+
+&davinci_mdio_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mdio_pins>;
-	status = "okay";
 
 	phy0: ethernet-phy@0 {
 		reg = <0>;
 	};
 };
 
-&mac {
-	slaves = <1>;
+&mac_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet0_pins>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/am335x-regor.dtsi b/arch/arm/boot/dts/am335x-regor.dtsi
index 6fbf4ac739e7..7b3966ee51b9 100644
--- a/arch/arm/boot/dts/am335x-regor.dtsi
+++ b/arch/arm/boot/dts/am335x-regor.dtsi
@@ -85,23 +85,22 @@
 	};
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
+	status = "okay";
 	phy-handle = <&phy1>;
 	phy-mode = "mii";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
 
-&mac {
-	slaves = <2>;
+&mac_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet0_pins &ethernet1_pins>;
-	dual_emac = <1>;
 };
 
 /* GPIOs */
diff --git a/arch/arm/boot/dts/am335x-wega.dtsi b/arch/arm/boot/dts/am335x-wega.dtsi
index 1359bf8715e6..673159d93a6a 100644
--- a/arch/arm/boot/dts/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/am335x-wega.dtsi
@@ -111,23 +111,22 @@
 	};
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
+	status = "okay";
 	phy-handle = <&phy1>;
 	phy-mode = "mii";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
 
-&mac {
-	slaves = <2>;
+&mac_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet0_pins &ethernet1_pins>;
-	dual_emac = <1>;
 };
 
 /* MMC */
-- 
2.17.1

