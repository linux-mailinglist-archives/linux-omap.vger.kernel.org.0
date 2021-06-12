Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D1F3A4BE8
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhFLBRA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:17:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51450 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhFLBRA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:17:00 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1Et88057603;
        Fri, 11 Jun 2021 20:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460495;
        bh=9w+Ol26VsA9m2NuR6iy8gfvc2sRH6lQKJ958+5OYHGs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=DdnNNW2st7IN47atZb/0RpiFl3e90aJWWmqa8wrGElgTMmpmBEwPzHbwhqcnEQpVq
         zQ7YOfFYUf4FelgkGYDZrzgssvIQ9zkaQV0rq3cb4E4eVdAWdG1/itwhwrYkatxpz/
         IKZQipEWD999jY5Z1QmpPbslZ+EhIUcX5KGtOS7Y=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1Etef056840
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:14:55 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:14:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:14:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1EsSw053886;
        Fri, 11 Jun 2021 20:14:55 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Christina Quast <cquast@hanoverdisplays.com>
Subject: [PATCH next 01/15] ARM: dts: am335x-baltos: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:22 +0300
Message-ID: <20210612011436.10437-2-grygorii.strashko@ti.com>
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

So, switch OnRISC Baltos and NetCom/Cam boards to use new cpsw switch
driver. Those boards have or 2 Ext. port wired and configured in dual_mac
mode by default, or only 1 Ext. port.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Christina Quast <cquast@hanoverdisplays.com>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-baltos-ir2110.dts   | 10 +++++-----
 arch/arm/boot/dts/am335x-baltos-ir3220.dts   |  8 ++++----
 arch/arm/boot/dts/am335x-baltos-ir5221.dts   |  8 ++++----
 arch/arm/boot/dts/am335x-baltos.dtsi         |  5 ++---
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts | 10 +++++-----
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts | 10 +++++-----
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts | 10 +++++-----
 7 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index 56915b6d818d..daf4cb398070 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -58,21 +58,21 @@
 	dr_mode = "host";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy0: ethernet-phy@0 {
 		reg = <1>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 	phy-handle = <&phy0>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
 };
 
diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index d8d60398d803..2123bd589484 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -103,18 +103,18 @@
 	dr_mode = "host";
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 	fixed-link {
 		speed = <100>;
 		full-duplex;
 	};
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
 };
 
diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index 8096d459b93f..2f3872dbf4f4 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -120,18 +120,18 @@
 	dr_mode = "host";
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 	fixed-link {
 		speed = <100>;
 		full-duplex;
 	};
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
 };
 
diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
index 1103a2cb836f..366702630290 100644
--- a/arch/arm/boot/dts/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos.dtsi
@@ -339,16 +339,15 @@
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
 	status = "okay";
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
diff --git a/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
index 8303b832aa50..57e756b0f192 100644
--- a/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
+++ b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
@@ -61,21 +61,21 @@
 	dr_mode = "host";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy0: ethernet-phy@0 {
 		reg = <1>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 	phy-handle = <&phy0>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
 };
 
diff --git a/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
index f8e0e95a751f..c6cc1c6218a9 100644
--- a/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
+++ b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
@@ -76,20 +76,20 @@
 	status = "okay";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy0: ethernet-phy@0 {
 		reg = <1>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 	phy-handle = <&phy0>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
 };
diff --git a/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
index a4e137527215..96dffd3ffd85 100644
--- a/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
+++ b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
@@ -96,20 +96,20 @@
 	};
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy0: ethernet-phy@0 {
 		reg = <1>;
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-mode = "rmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 	phy-handle = <&phy0>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
 };
-- 
2.17.1

