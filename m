Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579152B96C1
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 16:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgKSPpP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 10:45:15 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51430 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgKSPpP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 10:45:15 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJFjDBL090601;
        Thu, 19 Nov 2020 09:45:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605800713;
        bh=1993+ACNh+sFEoA9gjGEtB/4mJV7oFDFNR1Zxy0HxLM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hSljs4uggTJB3EqcNnYYtXaA9oY6wgW/H4Soy5ZsHXgjXV7vov5wtgpjthP1ZxDY8
         3f08DIWLOfsPUH/vY+oVwySBCDPcnN43xh7BgfiQbcbBRAn26+jXtLHGi2ukIHjDWj
         ir02GmEP3jjcx4mvCdG5wkqzvaAG/v4bzpQxLBMU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJFjDV6093626
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Nov 2020 09:45:13 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 09:45:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 09:45:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJFjBMO103624;
        Thu, 19 Nov 2020 09:45:12 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 2/2] ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw switch drv
Date:   Thu, 19 Nov 2020 17:44:52 +0200
Message-ID: <20201119154452.26961-3-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119154452.26961-1-grygorii.strashko@ti.com>
References: <20201119154452.26961-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dual_mac mode has been preserved the same way between legacy and new
driver, and one port devices works the same as 1 dual_mac port - it's safe
to switch drivers.

So, Switch amam335x-evm, am335x-evmsk and am335x-icev2 boards to use new
cpsw switch driver. Those boards have or 2 Ext. port wired and configured
in dual_mac mode by default, or only 1 Ext. port.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-evm.dts   | 13 ++++++++-----
 arch/arm/boot/dts/am335x-evmsk.dts | 14 ++++++--------
 arch/arm/boot/dts/am335x-icev2.dts | 14 ++++++--------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 12dffccd1ffd..1753ce2b1773 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -684,28 +684,31 @@
 	};
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
 
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-id";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	 status = "disabled";
 };
 
 &tscadc {
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index b43b94122d3c..d5f8d5e2eb5d 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -596,19 +596,17 @@
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
 
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
@@ -619,16 +617,16 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
 &mmc1 {
diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
index b958ab56a412..e923d065304d 100644
--- a/arch/arm/boot/dts/am335x-icev2.dts
+++ b/arch/arm/boot/dts/am335x-icev2.dts
@@ -474,31 +474,29 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&mac {
+&mac_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
 	status = "okay";
-	dual_emac;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
 	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
 	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
 	reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
 
-- 
2.17.1

