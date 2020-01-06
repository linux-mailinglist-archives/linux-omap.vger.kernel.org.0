Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF23E13113B
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgAFLNz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:13:55 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51774 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgAFLNz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:13:55 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006BDl1h127501;
        Mon, 6 Jan 2020 05:13:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578309227;
        bh=HJGTH6Q8gsRD6/e3keuuaD4sz9lTtUucnK3jDu4bszE=;
        h=From:To:CC:Subject:Date;
        b=EjAlSWECBcM54mUQ6LkGKaUxCaF3vjnAlHp1qukMwAcPgYbSEKUpsREhfPvtGIvDr
         hNsSzeJcQDzZvPb5+eBK5GDyZTdM3MKUanZ9CaT5/pUYxNc1qHE37MUBciGZjjQ9pU
         Y0aKIcX2yEp0pB3HK56WExb4kdP04MaMWxsva8ec=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006BDluj052552
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 Jan 2020 05:13:47 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:13:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:13:46 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006BDhuf086022;
        Mon, 6 Jan 2020 05:13:44 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <mark.rutland@arm.com>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <faiz_abbas@ti.com>, <kishon@ti.com>
Subject: [PATCH] arm: dts: Move am33xx and am43xx mmc nodes to sdhci-omap driver
Date:   Mon, 6 Jan 2020 16:45:17 +0530
Message-ID: <20200106111517.15158-1-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Move mmc nodes to be compatible with the sdhci-omap driver. The following
modifications are required for omap_hsmmc specific properties:

ti,non-removable: convert to the generic mmc non-removable
ti,needs-special-reset:  co-opted into the sdhci-omap driver
ti,dual-volt: removed. Legacy property not used in am335x or am43xx
ti,needs-special-hs-handling: removed. Legacy property not used in am335x or am43xx

Also since the sdhci-omap driver does not support runtime PM, explicitly
disable the mmc3 instance in the dtsi.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---

Driver modifications have been posted separately:
https://patchwork.kernel.org/project/linux-mmc/list/?series=224053

Tested on: am335x-evm, am335x-boneblack, am335x-sk, am335x-bone, am437x-idk,
am43xx-gp-evm, am43xx-epos-evm.

I need some help with testing all other am335x variants and SDIO cards.

Here's a branch for testing: https://github.com/faizinator/linux/tree/sdhci-omap_v4_2

 arch/arm/boot/dts/am335x-baltos.dtsi              | 2 +-
 arch/arm/boot/dts/am335x-boneblack-common.dtsi    | 1 +
 arch/arm/boot/dts/am335x-boneblack-wireless.dts   | 1 -
 arch/arm/boot/dts/am335x-boneblue.dts             | 1 -
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts   | 1 -
 arch/arm/boot/dts/am335x-evm.dts                  | 3 +--
 arch/arm/boot/dts/am335x-evmsk.dts                | 2 +-
 arch/arm/boot/dts/am335x-lxm.dts                  | 2 +-
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi | 2 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts    | 2 +-
 arch/arm/boot/dts/am335x-pepper.dts               | 4 ++--
 arch/arm/boot/dts/am335x-phycore-som.dtsi         | 2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi                  | 6 ++----
 arch/arm/boot/dts/am33xx.dtsi                     | 3 ++-
 arch/arm/boot/dts/am4372.dtsi                     | 3 ++-
 arch/arm/boot/dts/am437x-cm-t43.dts               | 2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts               | 4 ++--
 arch/arm/boot/dts/am437x-l4.dtsi                  | 5 ++---
 arch/arm/boot/dts/am437x-sk-evm.dts               | 2 +-
 19 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
index 05e7b5d4a95b..04f0b1227efe 100644
--- a/arch/arm/boot/dts/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos.dtsi
@@ -369,7 +369,7 @@
 &mmc2 {
 	status = "okay";
 	vmmc-supply = <&wl12xx_vmmc>;
-	ti,non-removable;
+	non-removable;
 	bus-width = <4>;
 	cap-power-off-card;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
index 7ad079861efd..83a71c4565eb 100644
--- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
@@ -22,6 +22,7 @@
 	pinctrl-0 = <&emmc_pins>;
 	bus-width = <8>;
 	status = "okay";
+	non-removable;
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
index 3124d94c0b3c..e07dd7979586 100644
--- a/arch/arm/boot/dts/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
@@ -75,7 +75,6 @@
 	bus-width = <4>;
 	non-removable;
 	cap-power-off-card;
-	ti,needs-special-hs-handling;
 	keep-power-in-suspend;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc3_pins &wl18xx_pins>;
diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index 5811fb8d4fdf..83f9452c9cd3 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -367,7 +367,6 @@
 	bus-width = <4>;
 	non-removable;
 	cap-power-off-card;
-	ti,needs-special-hs-handling;
 	keep-power-in-suspend;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc3_pins &wl18xx_pins>;
diff --git a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
index 4092cd193b8a..609c8db687ec 100644
--- a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
@@ -75,7 +75,6 @@
 	bus-width = <4>;
 	non-removable;
 	cap-power-off-card;
-	ti,needs-special-hs-handling;
 	keep-power-in-suspend;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc3_pins &wl18xx_pins>;
diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 6f0a6be93098..cacfceb5765b 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -757,8 +757,7 @@
 	bus-width = <4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc3_pins &wlan_pins>;
-	ti,non-removable;
-	ti,needs-special-hs-handling;
+	non-removable;
 	cap-power-off-card;
 	keep-power-in-suspend;
 
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index a97f9df460c1..f2ad6f614b52 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -675,7 +675,7 @@
 &mmc2 {
 	status = "okay";
 	vmmc-supply = <&wl12xx_vmmc>;
-	ti,non-removable;
+	non-removable;
 	bus-width = <4>;
 	cap-power-off-card;
 	keep-power-in-suspend;
diff --git a/arch/arm/boot/dts/am335x-lxm.dts b/arch/arm/boot/dts/am335x-lxm.dts
index fef582852820..dbedf729205c 100644
--- a/arch/arm/boot/dts/am335x-lxm.dts
+++ b/arch/arm/boot/dts/am335x-lxm.dts
@@ -339,7 +339,7 @@
 	pinctrl-0 = <&emmc_pins>;
 	vmmc-supply = <&vmmcsd_fixed>;
 	bus-width = <8>;
-	ti,non-removable;
+	non-removable;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
index 6495a125c01f..4e90f9c23d2e 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
+++ b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
@@ -159,7 +159,7 @@
 	vmmc-supply = <&vmmcsd_fixed>;
 	bus-width = <8>;
 	pinctrl-0 = <&mmc1_pins_default>;
-	ti,non-removable;
+	non-removable;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
index 244df9c5a537..f03e72cada41 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
+++ b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
@@ -451,7 +451,7 @@
 	vmmc-supply = <&vmmcsd_fixed>;
 	bus-width = <8>;
 	pinctrl-0 = <&mmc2_pins_default>;
-	ti,non-removable;
+	non-removable;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/am335x-pepper.dts b/arch/arm/boot/dts/am335x-pepper.dts
index 6d7608d9377b..f9a027b47962 100644
--- a/arch/arm/boot/dts/am335x-pepper.dts
+++ b/arch/arm/boot/dts/am335x-pepper.dts
@@ -341,7 +341,7 @@
 	pinctrl-0 = <&emmc_pins>;
 	vmmc-supply = <&ldo3_reg>;
 	bus-width = <8>;
-	ti,non-removable;
+	non-removable;
 };
 
 &mmc3 {
@@ -351,7 +351,7 @@
 	pinctrl-0 = <&wireless_pins>;
 	vmmmc-supply = <&v3v3c_reg>;
 	bus-width = <4>;
-	ti,non-removable;
+	non-removable;
 	dmas = <&edma_xbar 12 0 1
 		&edma_xbar 13 0 2>;
 	dma-names = "tx", "rx";
diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
index 3d0672b53d77..7e46b4c02709 100644
--- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
+++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
@@ -69,7 +69,7 @@
 	pinctrl-0 = <&emmc_pins>;
 	vmmc-supply = <&vmmc_reg>;
 	bus-width = <8>;
-	ti,non-removable;
+	non-removable;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 3a8a205c27b5..ba2bde6dd9e4 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1329,10 +1329,8 @@
 			ranges = <0x0 0x60000 0x1000>;
 
 			mmc1: mmc@0 {
-				compatible = "ti,omap4-hsmmc";
-				ti,dual-volt;
+				compatible = "ti,am335-sdhci";
 				ti,needs-special-reset;
-				ti,needs-special-hs-handling;
 				dmas = <&edma_xbar 24 0 0
 					&edma_xbar 25 0 0>;
 				dma-names = "tx", "rx";
@@ -1815,7 +1813,7 @@
 			ranges = <0x0 0xd8000 0x1000>;
 
 			mmc2: mmc@0 {
-				compatible = "ti,omap4-hsmmc";
+				compatible = "ti,am335-sdhci";
 				ti,needs-special-reset;
 				dmas = <&edma 2 0
 					&edma 3 0>;
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 646f11430dad..ddcfc8a40e41 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -255,10 +255,11 @@
 			ranges = <0x0 0x47810000 0x1000>;
 
 			mmc3: mmc@0 {
-				compatible = "ti,omap4-hsmmc";
+				compatible = "ti,am335-sdhci";
 				ti,needs-special-reset;
 				interrupts = <29>;
 				reg = <0x0 0x1000>;
+				status = "disabled";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index ca0aa3f26c0a..157a1ba15ca4 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -249,10 +249,11 @@
 			ranges = <0x0 0x47810000 0x1000>;
 
 			mmc3: mmc@0 {
-				compatible = "ti,omap4-hsmmc";
+				compatible = "ti,am437-sdhci";
 				ti,needs-special-reset;
 				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x0 0x1000>;
+				status = "disabled";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/am437x-cm-t43.dts b/arch/arm/boot/dts/am437x-cm-t43.dts
index 063113a5da2d..a6b4fca8626a 100644
--- a/arch/arm/boot/dts/am437x-cm-t43.dts
+++ b/arch/arm/boot/dts/am437x-cm-t43.dts
@@ -291,7 +291,7 @@
 	pinctrl-0 = <&emmc_pins>;
 	vmmc-supply = <&vmmc_3v3>;
 	bus-width = <8>;
-	ti,non-removable;
+	non-removable;
 };
 
 &spi0 {
diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 811c8cae315b..cadf47ee337f 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -869,7 +869,7 @@
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&emmc_pins_default>;
 	pinctrl-1 = <&emmc_pins_sleep>;
-	ti,non-removable;
+	non-removable;
 };
 
 &mmc3 {
@@ -886,7 +886,7 @@
 	pinctrl-1 = <&mmc3_pins_sleep>;
 	cap-power-off-card;
 	keep-power-in-suspend;
-	ti,non-removable;
+	non-removable;
 
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index 0dd59ee14585..99741be9bcfe 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1093,9 +1093,8 @@
 			ranges = <0x0 0x60000 0x1000>;
 
 			mmc1: mmc@0 {
-				compatible = "ti,omap4-hsmmc";
+				compatible = "ti,am437-sdhci";
 				reg = <0x0 0x1000>;
-				ti,dual-volt;
 				ti,needs-special-reset;
 				dmas = <&edma 24 0>,
 					<&edma 25 0>;
@@ -1616,7 +1615,7 @@
 			ranges = <0x0 0xd8000 0x1000>;
 
 			mmc2: mmc@0 {
-				compatible = "ti,omap4-hsmmc";
+				compatible = "ti,am437-sdhci";
 				reg = <0x0 0x1000>;
 				ti,needs-special-reset;
 				dmas = <&edma 2 0>,
diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 74eaa6a3b258..292153c6cb5d 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -694,7 +694,7 @@
 	pinctrl-1 = <&mmc3_pins_sleep>;
 	cap-power-off-card;
 	keep-power-in-suspend;
-	ti,non-removable;
+	non-removable;
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.19.2

