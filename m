Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E443995B6
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jun 2021 00:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhFBWG5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 18:06:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48774 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFBWG5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Jun 2021 18:06:57 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 152M508o030312;
        Wed, 2 Jun 2021 17:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622671500;
        bh=j3t5c9mN7k2JsE5wtJ311Gk1Snmmw2xtUpavCue0hr4=;
        h=From:To:CC:Subject:Date;
        b=dijCnpt1Mde11TyBg4lClI8w2/Tglvi0A3UhcApEO1CGzp5pdg9chF2POPcu+n59k
         jo1X6iBwbAvVqTQtojjjpgmfY+axv5dc7af2aKBFiTnvQU4xUXp4CvqGu+KS1Dxr51
         dw5qtEx7HDPnYj2xKj30H9/vkYDBrXvi8tThDFEw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 152M503f010712
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Jun 2021 17:05:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 2 Jun
 2021 17:05:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 2 Jun 2021 17:05:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 152M50Vs050993;
        Wed, 2 Jun 2021 17:05:00 -0500
From:   Gowtham Tammana <g-tammana@ti.com>
To:     Suman Anna <s-anna@ti.com>, <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        <bcousson@baylibre.com>
CC:     <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Nisanth Menon <nm@ti.com>,
        Gowtham Tammana <g-tammana@ti.com>
Subject: [PATCH v4] ARM: dts: dra7: Fix duplicate USB4 target module node
Date:   Wed, 2 Jun 2021 17:04:58 -0500
Message-ID: <20210602220458.9728-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With [1] USB4 target-module node got defined in dra74x.dtsi file.
However, the earlier definition in [2] was not removed, and this
duplication of the target module is causing boot failure on dra74
variant boards - dra7-evm, dra76-evm.

USB4 is only present in DRA74x variants, so keeping the entry in
dra74x.dtsi and removing it from the top level interconnect hierarchy
dra7-l4.dtsi file. This change makes the USB4 target module no longer
visible to AM5718, DRA71x and DRA72x so removing references to it in
their respective dts files.

[1]: commit c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for
dra7 dwc3")
[2]: commit 549fce068a311 ("ARM: dts: dra7: Add l4 interconnect
hierarchy and ti-sysc data")

Fixes: c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")
Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v4:
  - moved the node under l4_per3 instead of ocp as per Tony and
    Grygorii suggestion 
v3:
  - https://lore.kernel.org/linux-arm-kernel/20210526213035.15448-1-g-tammana@ti.com/
  - fixed error in references to the commits
  - mentioned the boards that failed
v2:
  - https://lore.kernel.org/linux-arm-kernel/20210526172038.17542-1-g-tammana@ti.com/
  - changed reference to commit sha instead of line numbers
  - added Fixes: tag
  - moved the defintion to dra74.dtsi as per Suman and Tony review comments
v1:
  - https://lore.kernel.org/linux-arm-kernel/20210521211851.14674-1-g-tammana@ti.com/


 arch/arm/boot/dts/am5718.dtsi  |  6 +--
 arch/arm/boot/dts/dra7-l4.dtsi | 22 --------
 arch/arm/boot/dts/dra71x.dtsi  |  4 --
 arch/arm/boot/dts/dra72x.dtsi  |  4 --
 arch/arm/boot/dts/dra74x.dtsi  | 92 ++++++++++++++++++----------------
 5 files changed, 50 insertions(+), 78 deletions(-)

diff --git a/arch/arm/boot/dts/am5718.dtsi b/arch/arm/boot/dts/am5718.dtsi
index ebf4d3cc1cfb..6d7530a48c73 100644
--- a/arch/arm/boot/dts/am5718.dtsi
+++ b/arch/arm/boot/dts/am5718.dtsi
@@ -17,17 +17,13 @@
  * VCP1, VCP2
  * MLB
  * ISS
- * USB3, USB4
+ * USB3
  */
 
 &usb3_tm {
 	status = "disabled";
 };
 
-&usb4_tm {
-	status = "disabled";
-};
-
 &atl_tm {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 149144cdff35..648d23f7f748 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4129,28 +4129,6 @@
 			};
 		};
 
-		usb4_tm: target-module@140000 {		/* 0x48940000, ap 75 3c.0 */
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			reg = <0x140000 0x4>,
-			      <0x140010 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
-			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			/* Domains (P, C): l3init_pwrdm, l3init_clkdm */
-			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x140000 0x20000>;
-		};
-
 		target-module@170000 {			/* 0x48970000, ap 21 0a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x170010 0x4>;
diff --git a/arch/arm/boot/dts/dra71x.dtsi b/arch/arm/boot/dts/dra71x.dtsi
index cad0e4a2bd8d..9c270d8f75d5 100644
--- a/arch/arm/boot/dts/dra71x.dtsi
+++ b/arch/arm/boot/dts/dra71x.dtsi
@@ -11,7 +11,3 @@
 &rtctarget {
 	status = "disabled";
 };
-
-&usb4_tm {
-	status = "disabled";
-};
diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index d403acc754b6..f3e934ef7d3e 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -108,7 +108,3 @@
 &pcie2_rc {
 	compatible = "ti,dra726-pcie-rc", "ti,dra7-pcie";
 };
-
-&usb4_tm {
-	status = "disabled";
-};
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index e1850d6c841a..b4e07d99ffde 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -49,49 +49,6 @@
 			reg = <0x41500000 0x100>;
 		};
 
-		target-module@48940000 {
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			reg = <0x48940000 0x4>,
-			      <0x48940010 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
-			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x48940000 0x20000>;
-
-			omap_dwc3_4: omap_dwc3_4@0 {
-				compatible = "ti,dwc3";
-				reg = <0 0x10000>;
-				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				utmi-mode = <2>;
-				ranges;
-				status = "disabled";
-				usb4: usb@10000 {
-					compatible = "snps,dwc3";
-					reg = <0x10000 0x17000>;
-					interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-						     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-						     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
-					interrupt-names = "peripheral",
-							  "host",
-							  "otg";
-					maximum-speed = "high-speed";
-					dr_mode = "otg";
-				};
-			};
-		};
 
 		target-module@41501000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
@@ -224,3 +181,52 @@
 &pcie2_rc {
 	compatible = "ti,dra746-pcie-rc", "ti,dra7-pcie";
 };
+
+&l4_per3 {
+	segment@0 {
+		usb4_tm: target-module@140000 {         /* 0x48940000, ap 75 3c.0 */
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x140000 0x4>,
+			      <0x140010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			/* Domains (P, C): l3init_pwrdm, l3init_clkdm */
+			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x140000 0x20000>;
+
+			omap_dwc3_4: omap_dwc3_4@0 {
+				compatible = "ti,dwc3";
+				reg = <0 0x10000>;
+				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				utmi-mode = <2>;
+				ranges;
+				status = "disabled";
+				usb4: usb@10000 {
+					compatible = "snps,dwc3";
+					reg = <0x10000 0x17000>;
+					interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "peripheral",
+							  "host",
+							  "otg";
+					maximum-speed = "high-speed";
+					dr_mode = "otg";
+				};
+			};
+		};
+	};
+};
-- 
2.17.1

