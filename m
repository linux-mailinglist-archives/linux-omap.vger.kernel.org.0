Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A245260598
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 22:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbgIGUWC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 16:22:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50898 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730173AbgIGUWB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 16:22:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087KLwGR036304;
        Mon, 7 Sep 2020 15:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599510118;
        bh=Wcn5F6ZFfH+qQl5imFM6aOi17YdmT6HR6wxZrLWBhdQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LR+7ANqsIzcm1LcaKKYRXkkEafdevzsJK3qIb8CYr4Ekhy3HOYdhf50yZ8Ud4fq/U
         JUunQCZvjd8uXYKjZfuIohjlxKWX7F/deDOvgeYu4ZM3x1Pnen6I1DuUGWXD7vRv7o
         cwSGx/cS/kurN0WEO6huLgHnDBLIbRjiQuwb987A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 087KLwL9085036
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 15:21:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 15:21:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 15:21:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KLuZQ053209;
        Mon, 7 Sep 2020 15:21:57 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 4/6] ARM: dts: dra7x-evm: switch to new cpsw switch drv
Date:   Mon, 7 Sep 2020 23:21:23 +0300
Message-ID: <20200907202125.22943-5-grygorii.strashko@ti.com>
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

Switch all TI DRA7x boards to use new cpsw switch driver. Those boards
configured in dual_mac mode by default. Hence, dual_mac mode has been
preserved the same way between legacy and new driver it's safe to switch
drivers.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/dra7-evm.dts          | 13 ++++++-------
 arch/arm/boot/dts/dra71-evm.dts         | 14 +++++++-------
 arch/arm/boot/dts/dra72-evm-common.dtsi |  4 ----
 arch/arm/boot/dts/dra72-evm-revc.dts    | 14 +++++++-------
 arch/arm/boot/dts/dra72-evm.dts         | 13 +++++++++----
 arch/arm/boot/dts/dra76-evm.dts         | 14 ++++++--------
 6 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index a952d934fcf2..051aac4e95b7 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -537,24 +537,23 @@
 	ti,no-idle-on-init;
 };
 
-&mac {
+&mac_sw {
 	status = "okay";
-	dual_emac;
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&ethphy1>;
 	phy-mode = "rgmii";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	ethphy0: ethernet-phy@2 {
 		reg = <2>;
 	};
diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 10da51bee42f..cad58f733bd6 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -219,26 +219,26 @@
 	vqmmc-supply = <&evm_1v8_sw>;
 };
 
-&mac {
+&mac_sw {
 	mode-gpios = <&pcf_gpio_21 4 GPIO_ACTIVE_LOW>,
 		     <&pcf_hdmi 9 GPIO_ACTIVE_LOW>,	/* P11 */
 		     <&pcf_hdmi 10 GPIO_ACTIVE_LOW>;	/* P12 */
-	dual_emac;
+	status = "okay";
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&dp83867_0>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&dp83867_1>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	dp83867_0: ethernet-phy@2 {
 		reg = <2>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 9273a7d6fa29..8d0d960107fb 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -462,10 +462,6 @@
 	};
 };
 
-&mac {
-	status = "okay";
-};
-
 &dcan1 {
 	status = "ok";
 	pinctrl-names = "default", "sleep", "active";
diff --git a/arch/arm/boot/dts/dra72-evm-revc.dts b/arch/arm/boot/dts/dra72-evm-revc.dts
index 54dab0f212d1..f242b937f88c 100644
--- a/arch/arm/boot/dts/dra72-evm-revc.dts
+++ b/arch/arm/boot/dts/dra72-evm-revc.dts
@@ -77,26 +77,26 @@
 	interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
 };
 
-&mac {
+&mac_sw {
 	mode-gpios = <&pcf_gpio_21 4 GPIO_ACTIVE_LOW>,
 		     <&pcf_hdmi 9 GPIO_ACTIVE_LOW>,	/* P11 */
 		     <&pcf_hdmi 10 GPIO_ACTIVE_LOW>;	/* P12 */
-	dual_emac;
+	status = "okay";
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&dp83867_0>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&dp83867_1>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	dp83867_0: ethernet-phy@2 {
 		reg = <2>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm/boot/dts/dra72-evm.dts b/arch/arm/boot/dts/dra72-evm.dts
index 6ea9936f7d9c..5f62f92eb96c 100644
--- a/arch/arm/boot/dts/dra72-evm.dts
+++ b/arch/arm/boot/dts/dra72-evm.dts
@@ -69,17 +69,22 @@
 	interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 };
 
-&mac {
-	slaves = <1>;
+&mac_sw {
 	mode-gpios = <&pcf_gpio_21 4 GPIO_ACTIVE_HIGH>;
+	status = "okay";
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	ethphy0: ethernet-phy@3 {
 		reg = <3>;
 	};
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 803981cc762e..34f655be4fb4 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -475,25 +475,23 @@
 	status = "disabled";
 };
 
-&mac {
+&mac_sw {
 	status = "okay";
-
-	dual_emac;
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&dp83867_0>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <1>;
+	ti,dual-emac-pvid = <1>;
 };
 
-&cpsw_emac1 {
+&cpsw_port2 {
 	phy-handle = <&dp83867_1>;
 	phy-mode = "rgmii-id";
-	dual_emac_res_vlan = <2>;
+	ti,dual-emac-pvid = <2>;
 };
 
-&davinci_mdio {
+&davinci_mdio_sw {
 	dp83867_0: ethernet-phy@2 {
 		reg = <2>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
-- 
2.17.1

