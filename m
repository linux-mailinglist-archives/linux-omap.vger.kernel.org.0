Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2C8260593
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 22:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbgIGUVt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 16:21:49 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37364 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729917AbgIGUVs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 16:21:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087KLhP7103751;
        Mon, 7 Sep 2020 15:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599510103;
        bh=G6A2Bv+f5xCG76OjLI2bdOjq+hu9sly1gK8TEdL8zeA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=iaGkfK8LLrh/gCpiXyOZefj5IeZpJo8g914JOYCrqZWGSRHQ2lIOxOZErfJH2+wwz
         L3rPtL95bDyE0is29zJdEHoRDwk/3manzYtFdIoJ0QS8nJmpptv1THa6UBssOtDlfK
         RnXL1XsLWYI0DbvEJih4dMnCw8y4Gifd4BoZO3aA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 087KLh4T049401
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 15:21:43 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 15:21:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 15:21:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KLfdY018195;
        Mon, 7 Sep 2020 15:21:42 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 2/6] ARM: dts: am57xx-idk: switch to new cpsw switch drv
Date:   Mon, 7 Sep 2020 23:21:21 +0300
Message-ID: <20200907202125.22943-3-grygorii.strashko@ti.com>
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

Switch all am571/2/4-idk boards to use new cpsw switch driver.
Those boards have 2 Ext. port wired and configured in dual_mac mode by
default. Hence, dual_mac mode has been preserved the same way between
legacy and new driver it's safe to switch drivers.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am571x-idk.dts         | 27 ------------------------
 arch/arm/boot/dts/am572x-idk.dts         |  5 -----
 arch/arm/boot/dts/am574x-idk.dts         |  5 -----
 arch/arm/boot/dts/am57xx-idk-common.dtsi | 14 +++++++-----
 4 files changed, 9 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index 391a92e24472..e81078c2d00d 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -208,30 +208,3 @@
 	pinctrl-1 = <&mmc2_pins_hs>;
 	pinctrl-2 = <&mmc2_pins_ddr_rev20 &mmc2_iodelay_ddr_conf>;
 };
-
-&mac_sw {
-	pinctrl-names = "default", "sleep";
-	status = "okay";
-};
-
-&cpsw_port1 {
-	phy-handle = <&ethphy0_sw>;
-	phy-mode = "rgmii-rxid";
-	ti,dual-emac-pvid = <1>;
-};
-
-&cpsw_port2 {
-	phy-handle = <&ethphy1_sw>;
-	phy-mode = "rgmii-rxid";
-	ti,dual-emac-pvid = <2>;
-};
-
-&davinci_mdio_sw {
-	ethphy0_sw: ethernet-phy@0 {
-		reg = <0>;
-	};
-
-	ethphy1_sw: ethernet-phy@1 {
-		reg = <1>;
-	};
-};
diff --git a/arch/arm/boot/dts/am572x-idk.dts b/arch/arm/boot/dts/am572x-idk.dts
index 1a3af4b54308..6504265f3f7e 100644
--- a/arch/arm/boot/dts/am572x-idk.dts
+++ b/arch/arm/boot/dts/am572x-idk.dts
@@ -27,8 +27,3 @@
 	pinctrl-1 = <&mmc2_pins_hs>;
 	pinctrl-2 = <&mmc2_pins_ddr_rev20>;
 };
-
-&mac {
-	status = "okay";
-	dual_emac;
-};
diff --git a/arch/arm/boot/dts/am574x-idk.dts b/arch/arm/boot/dts/am574x-idk.dts
index c9275d0c62cf..37758761cd88 100644
--- a/arch/arm/boot/dts/am574x-idk.dts
+++ b/arch/arm/boot/dts/am574x-idk.dts
@@ -36,11 +36,6 @@
 	pinctrl-2 = <&mmc2_pins_default>;
 };
 
-&mac {
-	status = "okay";
-	dual_emac;
-};
-
 &m_can0 {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index 1c77006cccd1..9fcb8944aa3e 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -448,19 +448,23 @@
 	ext-clk-src;
 };
 
-&cpsw_emac0 {
+&mac_sw {
+	status = "okay";
+};
+
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
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	ethphy0: ethernet-phy@0 {
 		reg = <0>;
 	};
-- 
2.17.1

