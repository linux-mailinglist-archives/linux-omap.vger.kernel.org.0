Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC08265507
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 00:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgIJWZn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 18:25:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36056 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgIJWZk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 18:25:40 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPaxB018698;
        Thu, 10 Sep 2020 17:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599776736;
        bh=4alZupngZtjEUrT9XN1DwDPMFjZDs8ugUIbCASVfdu4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dAl1Tu2oaWQ9RZ4GK0tXl8Xb2Eclm+Ru6p6c/t14GUc0GGzzIeyp4bQSBz53P2XQ5
         Qso92MLZUkJZdW3Q9gvnhcYwwgMGsB7Y4WlwgMkCr6yiFaB9TnOeowCCHR++CN6oQy
         WJZfLFpipm1Krh0VBgyL9cKt9GpfDJBJmwgSp9/E=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08AMPaIm088222
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Sep 2020 17:25:36 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 17:25:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 17:25:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPZR1106095;
        Thu, 10 Sep 2020 17:25:36 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 2/3] ARM: dts: am437x: switch to new cpsw switch drv
Date:   Fri, 11 Sep 2020 01:25:17 +0300
Message-ID: <20200910222518.32486-3-grygorii.strashko@ti.com>
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

The dual_mac mode has been preserved the same way between legacy and new
driver, and one port devices works the same as 1 dual_mac port - it's safe
to switch drivers.
So, Switch all am437x boards to use new cpsw switch driver. Those boards
have or 2 Ext. port wired and configured in dual_mac mode by default, or
only 1 Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi        |  4 ++--
 arch/arm/boot/dts/am437x-cm-t43.dts  | 14 ++++++--------
 arch/arm/boot/dts/am437x-gp-evm.dts  | 13 ++++++++-----
 arch/arm/boot/dts/am437x-idk-evm.dts | 13 ++++++++-----
 arch/arm/boot/dts/am437x-sk-evm.dts  | 14 ++++++--------
 arch/arm/boot/dts/am43x-epos-evm.dts | 13 ++++++++-----
 6 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index 14314046256c..38a7dd64f8df 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -35,8 +35,8 @@
 		serial3 = &uart3;
 		serial4 = &uart4;
 		serial5 = &uart5;
-		ethernet0 = &cpsw_emac0;
-		ethernet1 = &cpsw_emac1;
+		ethernet0 = &cpsw_port1;
+		ethernet1 = &cpsw_port2;
 		spi0 = &qspi;
 	};
 
diff --git a/arch/arm/boot/dts/am437x-cm-t43.dts b/arch/arm/boot/dts/am437x-cm-t43.dts
index a6b4fca8626a..a83f46ed0c9a 100644
--- a/arch/arm/boot/dts/am437x-cm-t43.dts
+++ b/arch/arm/boot/dts/am437x-cm-t43.dts
@@ -325,17 +325,15 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cpsw_default>;
-	dual_emac = <1>;
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&davinci_mdio_default>;
-	status = "okay";
 
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
@@ -346,16 +344,16 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-txid";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rgmii-txid";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
 &dwc3_1 {
diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index b28e5c8cd02a..e4a1d7d87b1e 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -906,28 +906,31 @@
 	status = "okay";
 };
 
-&mac {
-	slaves = <1>;
+&mac_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
 	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
 
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-rxid";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
 };
 
 &elm {
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
index 8b986c45f09d..2dc525512266 100644
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -483,28 +483,31 @@
 	};
 };
 
-&mac {
-	slaves = <1>;
+&mac_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
 	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
 
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-rxid";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
 };
 
 &rtc {
diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 5fffdce853b1..496ed34f7755 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -792,19 +792,17 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
-	dual_emac = <1>;
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
 	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
 
 	ethphy0: ethernet-phy@4 {
 		reg = <4>;
@@ -815,16 +813,16 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-rxid";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rgmii-rxid";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
 &elm {
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index de4fc78498a0..a242282466e5 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -550,29 +550,32 @@
 	cd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
 };
 
-&mac {
+&mac_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
 	status = "okay";
-	slaves = <1>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
 	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
 
 	ethphy0: ethernet-phy@16 {
 		reg = <16>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rmii";
 	phys = <&phy_gmii_sel 1 1>;
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
 };
 
 &i2c0 {
-- 
2.17.1

