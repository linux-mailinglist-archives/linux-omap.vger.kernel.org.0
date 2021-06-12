Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C353A4BD4
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhFLBDS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:03:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48782 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhFLBDS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:03:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C11IoQ053113;
        Fri, 11 Jun 2021 20:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623459678;
        bh=O+z6rxDk43Xhjtwb3FQLdhrotsk/08Dn822tfzEbcTo=;
        h=From:To:CC:Subject:Date;
        b=Fh2Xh5JkIbhVjAxwE0ozQM3AVkLC0X4gqUOVqs/Ql82BjtN5FUraaKs8IOnaFbRDH
         FTE3HvdLrPwfLRJn7KOQr7VDmw/cZgspwKxc2/qhmss6UxL1ciWPSThduqkbNi0uA4
         Wf4LEx825Jil9fi/Pa++BD7t3bfleAt1Dr2E4Qm0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C11IRL071950
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:01:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:01:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:01:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C11GI9080530;
        Fri, 11 Jun 2021 20:01:17 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next] ARM: dts: am335x-bone: switch to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:01:06 +0300
Message-ID: <20210612010106.9970-1-grygorii.strashko@ti.com>
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

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am335x-bone-common.dtsi     | 13 +++++---
 .../boot/dts/am335x-boneblack-wireless.dts    |  2 +-
 .../boot/dts/am335x-bonegreen-wireless.dts    |  2 +-
 arch/arm/boot/dts/am335x-sancloud-bbe.dts     | 33 ++-----------------
 4 files changed, 12 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 2d51d4bba6d4..37e1539f0211 100644
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
index 80116646a3fe..5a4d5d4ab7b8 100644
--- a/arch/arm/boot/dts/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
@@ -62,7 +62,7 @@
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
 
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
index 275ba339adf4..86dcd1144db4 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -53,22 +53,6 @@
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
@@ -88,25 +72,12 @@
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
+&cpsw_port1 {
 	phy-handle = <&ethphy0>;
 	phy-mode = "rgmii-id";
 };
-- 
2.17.1

