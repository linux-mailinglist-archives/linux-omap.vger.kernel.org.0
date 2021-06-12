Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23803A4BFD
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFLBRv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:17:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60932 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbhFLBRu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:17:50 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1FkjA093942;
        Fri, 11 Jun 2021 20:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460546;
        bh=VltHuh0czpyPvJidvnIc/A5oP8FJWnpMtInZvaiFYHQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TFDtGMcnyWh8JJ/pNA/l6nnNwacYMtXo563m0JGAvrmr+I5L/88DK/3BVRzprP78Y
         1KyTZ340FXE1LNo4szslNmBkjmNxbGHXLH7oD5AWkDVRiotvSq7cjrEgzcu+VEeFZn
         bMKEayGcl6yQjkPPgBxdHDj5wj2oQU4O5SvKR8xc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1Fks6081383
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:15:46 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:15:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:15:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1FiIq007826;
        Fri, 11 Jun 2021 20:15:45 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH next 08/15] ARM: dts: am335x-myirtech: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:29 +0300
Message-ID: <20210612011436.10437-9-grygorii.strashko@ti.com>
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

So, switch MYIR MYC-AM335X/MYD-AM335X to use new cpsw switch driver. Those
boards have or 2 Ext. port wired and configured in dual_mac mode by
default, or only 1 Ext. port.

Cc: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi | 25 ++++++++++++----------
 arch/arm/boot/dts/am335x-myirtech-myd.dts  | 18 +++++++++-------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
index 270a3d5e8f98..245c35f41cdf 100644
--- a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
+++ b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
@@ -57,16 +57,27 @@
 	};
 };
 
-&cpsw_emac0 {
+&mac_sw {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_slave1_pins_default>;
+	pinctrl-1 = <&eth_slave1_pins_sleep>;
+	status = "okay";
+};
+
+&cpsw_port1 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdio_pins_default>;
 	pinctrl-1 = <&mdio_pins_sleep>;
-	status = "okay";
 
 	phy0: ethernet-phy@4 {
 		reg = <4>;
@@ -137,14 +148,6 @@
 	};
 };
 
-&mac {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&eth_slave1_pins_default>;
-	pinctrl-1 = <&eth_slave1_pins_sleep>;
-	slaves = <1>;
-	status = "okay";
-};
-
 &rtc {
 	system-power-controller;
 };
diff --git a/arch/arm/boot/dts/am335x-myirtech-myd.dts b/arch/arm/boot/dts/am335x-myirtech-myd.dts
index c996639874e6..1479fd95dec2 100644
--- a/arch/arm/boot/dts/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/am335x-myirtech-myd.dts
@@ -86,18 +86,26 @@
 	};
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
+	status = "okay";
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	phy1: ethernet-phy@6 {
 		reg = <6>;
 		eee-broken-1000t;
 	};
 };
 
+&mac_sw {
+	pinctrl-0 = <&eth_slave1_pins_default>, <&eth_slave2_pins_default>;
+	pinctrl-1 = <&eth_slave1_pins_sleep>, <&eth_slave2_pins_sleep>;
+	slaves = <2>;
+};
+
 &dcan0 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcan0_pins_default>;
@@ -194,12 +202,6 @@
 	};
 };
 
-&mac {
-	pinctrl-0 = <&eth_slave1_pins_default>, <&eth_slave2_pins_default>;
-	pinctrl-1 = <&eth_slave1_pins_sleep>, <&eth_slave2_pins_sleep>;
-	slaves = <2>;
-};
-
 &mcasp0 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mcasp0_pins_default>;
-- 
2.17.1

