Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF663E1F2F
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 01:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhHEXKV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Aug 2021 19:10:21 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49838 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhHEXKU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Aug 2021 19:10:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 175NA0C3096509;
        Thu, 5 Aug 2021 18:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1628205000;
        bh=ThN2FmLumQVqOQMVQSRYRzdVLB1Kzlgj72nVzeD0km0=;
        h=From:To:CC:Subject:Date;
        b=pYCPISS4Nyw5Uk0KEYdAfMDi6+E9ilPsqGzQSKWq6qjvqSK0Swk32rBe5/EbMDmrI
         UiVn+iHmKxHT8zgLeoxiQ0yMV4jwxd2qr127jY5MTrSK9mAdmANU2PVSVxmhCxmxR+
         Lzgi8UWsxzZ1N4N0FwVpGgInO3diKyktN5gNzzIk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 175NA0sr005723
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Aug 2021 18:10:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 5 Aug
 2021 18:10:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 5 Aug 2021 18:10:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 175N9wDC030172;
        Thu, 5 Aug 2021 18:09:59 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2] ARM: dts: am335x-bone: switch to new cpsw switch drv
Date:   Fri, 6 Aug 2021 02:09:56 +0300
Message-ID: <20210805230956.7379-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dual_mac mode has been preserved the same way between legacy and new
driver, and one port devices works the same as 1 dual_mac port - it's safe
to switch drivers.

So, Switch BeagleBone boards to use new cpsw switch driver. Those boards
have or 2 Ext. port wired and configured in dual_mac mode by default, or
only 1 Ext. port.

For am335x-sancloud-bbe-common.dtsi also removed duplicated davinci_mdio DT
nodes which already defined in am335x-bone-common.dtsi.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---

changes in v2:
 - commit message updated to indicate duplicated nodes removal in am335x-sancloud-bbe-common.dtsi
 - dropped phy-handle for cpsw port in am335x-sancloud-bbe-common.dtsi

 arch/arm/boot/dts/am335x-bone-common.dtsi     | 13 ++++---
 .../boot/dts/am335x-boneblack-wireless.dts    |  2 +-
 .../boot/dts/am335x-bonegreen-wireless.dts    |  2 +-
 .../boot/dts/am335x-sancloud-bbe-common.dtsi  | 34 ++-----------------
 4 files changed, 12 insertions(+), 39 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 34a0045b5f65..0ccdc7cd463b 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -353,24 +353,27 @@
 	};
 };
 
-&cpsw_emac0 {
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "mii";
+	ti,dual-emac-pvid = <1>;
 };
 
-&mac {
-	slaves = <1>;
+&cpsw_port2 {
+	status = "disabled";
+};
+
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
diff --git a/arch/arm/boot/dts/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
index 8b2b24c80670..c72b09ab8da0 100644
--- a/arch/arm/boot/dts/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
@@ -63,7 +63,7 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
index 74db0fc39397..215f279e476b 100644
--- a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
@@ -62,7 +62,7 @@
 	};
 };
 
-&mac {
+&mac_sw {
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
index bd9c21813192..627c18d23f94 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
@@ -40,22 +40,6 @@
 		>;
 	};
 
-	davinci_mdio_default: davinci_mdio_default {
-		pinctrl-single,pins = <
-			/* MDIO */
-			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLUP | SLEWCTRL_FAST, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_OUTPUT_PULLUP, MUX_MODE0)
-		>;
-	};
-
-	davinci_mdio_sleep: davinci_mdio_sleep {
-		pinctrl-single,pins = <
-			/* MDIO reset value */
-			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_INPUT_PULLDOWN, MUX_MODE7)
-		>;
-	};
-
 	usb_hub_ctrl: usb_hub_ctrl {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_RMII1_REF_CLK, PIN_OUTPUT_PULLUP, MUX_MODE7)     /* rmii1_refclk.gpio0_29 */
@@ -63,26 +47,12 @@
 	};
 };
 
-&mac {
-	pinctrl-names = "default", "sleep";
+&mac_sw {
 	pinctrl-0 = <&cpsw_default>;
 	pinctrl-1 = <&cpsw_sleep>;
-	status = "okay";
-};
-
-&davinci_mdio {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&davinci_mdio_default>;
-	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
-
-	ethphy0: ethernet-phy@0 {
-		reg = <0>;
-	};
 };
 
-&cpsw_emac0 {
-	phy-handle = <&ethphy0>;
+&cpsw_port1 {
 	phy-mode = "rgmii-id";
 };
 
-- 
2.17.1

