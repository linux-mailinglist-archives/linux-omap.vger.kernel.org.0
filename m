Return-Path: <linux-omap+bounces-5199-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0820CC9061
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 18:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA8930F457E
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 17:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6828335C1B0;
	Wed, 17 Dec 2025 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="HenOOCBD"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295835C182;
	Wed, 17 Dec 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976906; cv=none; b=iShMIYuz6OFVgMgYlhCC+bOX9aOqJEh5KebezJ+l8oeygkwPL08xazwLIjPkIGwlREhkzST9tACQBI2+ajn542cgVpspgOOomnPDUOAKN9uXrKvmyybo6t5dGGrfWhWEusC9l7gmDH9w5eoWFh5bE3PD7c0M9FjLGfPZixDw3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976906; c=relaxed/simple;
	bh=m+o8ilr2xwFBOvmY5HuCXFh9hTQVbVfG3UukeDc7eck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIeDuMd65QCI6yHCOrx7BUlIUhe0KozixDmkwp1joNvby8OnlJku+O3aDVhhGgoKs9Xe3knTLnLDDfdM9H2jv+VDiAin+qUcEXCCjfNIMCkeBe+JRfcuqjpGCK37GrDxUL20RRFCqKB0nJhs+Xv6Axu7gJ8ki5Ci671p3mq/iyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=HenOOCBD; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OCGh0Zzbvq8aDNVgo+bLQ986ExQjwSh4I8caNL1GVCs=; b=HenOOCBDab0XagTWxbf4VpiwnL
	5eVnP8Ll1PEn4ZH7BcX43iOTzbvgKCg22tNDQ2a0cxpDHq6nBY1UH1qvPwCy8oLU8PsgRlAR+hFVL
	KUXM0CijH3JGOjjETCAkicz+nDkx2TepL3i5Eon6Rp0d+6HmYV7LQ7pB2fYt0ePtfV1A6e9Qo6KyR
	sTqexmDXMv4p28+J+/lSBBFCc6+6/zIByeSD5tqx4q7WORoDzv823FZwgneRPJw2e8WSVYtxMA8WB
	gCNfd8Ro54uHGQrXOFJvovbk6aqIukNqmFOdWpGuOMt1xbPY59gICvwKw8y3bVAY4hF+qK8mM7mCC
	U8FwLS8g==;
Received: from [122.175.9.182] (port=62422 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vVrGP-0000000FG2C-0SpB;
	Wed, 17 Dec 2025 08:08:21 -0500
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	afd@ti.com,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info
Cc: andrew@lunn.ch,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	danishanwar@ti.com,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com,
	parvathi@couthit.com,
	Murali Karicheri <m-karicheri2@ti.com>
Subject: [RESEND PATCH v3 2/2] arm: dts: ti: Adds support for AM335x and AM437x
Date: Wed, 17 Dec 2025 18:34:39 +0530
Message-ID: <20251217130715.1327138-3-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217130715.1327138-1-parvathi@couthit.com>
References: <20251217130715.1327138-1-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Roger Quadros <rogerq@ti.com>

PRU-ICSS instance consists of two PRU cores along with various
peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
Ethernet Peripheral(IEP), the Real Time Media Independent Interface
controller (MII_RT), and the Enhanced Capture (eCAP) event module.

The TI Sitara AM335x ICE-V2 consists of single PRU-ICSS instance,
This patch adds the new device tree overlay file in-order to enable
PRU-ICSS instance, along with makefile changes.

The TI Sitara AM437x series of devices consists of 2 PRU-ICSS instances
(PRU-ICSS0 and PRU-ICSS1). This patch adds the device tree nodes for the
PRU-ICSS1 instance to support DUAL-MAC mode of operation. Support for
Ethernet over PRU is available only for ICSS1 instance.

am33xx-l4.dtsi, am4372.dtsi - Adds IEP and eCAP peripheral as child nodes
of the PRUSS subsystem node.

am335x-icev2-prueth.dtso, am437x-idk-evm.dts - Adds PRU-ICSS
instance node along with PRU eth port information and corresponding
port configuration. It includes interrupt mapping for packet reception,
HW timestamp collection, and PRU Ethernet ports in MII mode,

GPIO configuration, boot strapping along with delay configuration for
individual PRU Ethernet port and other required nodes.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |   5 +
 .../ti/omap/am335x-icev2-prueth-overlay.dtso  | 190 ++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
 arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++++++++++-
 5 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 14e500846875..c68948035eca 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -82,6 +82,10 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-var-stk-om44.dtb \
 	omap4-xyboard-mz609.dtb \
 	omap4-xyboard-mz617.dtb
+
+am335x-icev2-prueth-dtbs := am335x-icev2.dtb \
+	am335x-icev2-prueth-overlay.dtbo
+
 dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-baltos-ir2110.dtb \
 	am335x-baltos-ir3220.dtb \
@@ -100,6 +104,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-evmsk.dtb \
 	am335x-guardian.dtb \
 	am335x-icev2.dtb \
+	am335x-icev2-prueth.dtb \
 	am335x-lxm.dtb \
 	am335x-mba335x.dtb \
 	am335x-moxa-uc-2101.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
new file mode 100644
index 000000000000..abde5119875f
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT overlay for IDK AM335x
+ *
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/*
+ * AM335x ICE V2 board
+ * http://www.ti.com/tool/tmdsice3359
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/bus/ti-sysc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/am33xx.h>
+#include <dt-bindings/clock/am3.h>
+
+&{/} {
+        /* Dual-MAC Ethernet application node on PRU-ICSS */
+        pruss_eth: pruss-eth {
+                compatible = "ti,am3359-prueth";
+                ti,prus = <&pru0>, <&pru1>;
+                sram = <&ocmcram>;
+                ti,mii-rt = <&pruss_mii_rt>;
+                ti,iep = <&pruss_iep>;
+                ti,ecap = <&pruss_ecap>;
+                interrupts = <20 2 2>, <21 3 3>;
+                interrupt-names = "rx_hp", "rx_lp";
+                interrupt-parent = <&pruss_intc>;
+
+                pinctrl-0 = <&pruss_eth_default>;
+                pinctrl-names = "default";
+
+                ethernet-ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        pruss_emac0: ethernet-port@0 {
+                                reg = <0>;
+                                phy-handle = <&pruss_eth0_phy>;
+                                phy-mode = "mii";
+                                interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+                                interrupt-names = "rx", "emac_ptp_tx",
+                                                  "hsr_ptp_tx";
+                                /* Filled in by bootloader */
+                                local-mac-address = [00 00 00 00 00 00];
+                        };
+
+                        pruss_emac1: ethernet-port@1 {
+                                reg = <1>;
+                                phy-handle = <&pruss_eth1_phy>;
+                                phy-mode = "mii";
+                                interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
+                                interrupt-names = "rx", "emac_ptp_tx",
+                                                  "hsr_ptp_tx";
+                                /* Filled in by bootloader */
+                                local-mac-address = [00 00 00 00 00 00];
+                        };
+                };
+        };
+};
+
+&am33xx_pinmux {
+	/* MDIO node for PRU-ICSS */
+        pruss_mdio_default: pruss_mdio_default {
+                pinctrl-single,pins = <
+                        /* gpmc_clk.pr1_mdio_mdclk */
+                        AM33XX_PADCONF(0x88c, PIN_OUTPUT, MUX_MODE5)
+                        /* gpmc_csn3.pr1_mdio_data */
+                        AM33XX_PADCONF(0x888, PIN_INPUT, MUX_MODE5)
+                        /* gpmc_ben0_cle.gpio2_5 */
+                        AM33XX_PADCONF(0x89c, PIN_INPUT_PULLUP, MUX_MODE7)
+                        /* disable CPSW MDIO */
+                        /* mdio_data.gpio0_0 */
+                        AM33XX_PADCONF(0x948, PIN_INPUT_PULLUP, MUX_MODE7)
+                        /* mdio_clk.gpio0_1 */
+                        AM33XX_PADCONF(0x94c, PIN_INPUT_PULLUP, MUX_MODE7)
+                >;
+        };
+
+	/* Pinmux configuration for PRU-ICSS */
+        pruss_eth_default: pruss_eth_default {
+                pinctrl-single,pins = <
+                        /* dss_data0.pr1_mii_mt0_clk */
+                        AM33XX_PADCONF(0x8a0, PIN_INPUT,   MUX_MODE2)
+                        /* dss_data5.pr1_mii0_txd0 */
+                        AM33XX_PADCONF(0x8b4, PIN_OUTPUT,  MUX_MODE2)
+                        /* dss_data4.pr1_mii0_txd1 */
+                        AM33XX_PADCONF(0x8b0, PIN_OUTPUT,  MUX_MODE2)
+                        /* dss_data3.pr1_mii0_txd2 */
+                        AM33XX_PADCONF(0x8ac, PIN_OUTPUT,  MUX_MODE2)
+                        /* dss_data2.pr1_mii0_txd3 */
+                        AM33XX_PADCONF(0x8a8, PIN_OUTPUT,  MUX_MODE2)
+                        /* dss_data11.pr1_mii0_rxd0 */
+                        AM33XX_PADCONF(0x8cc, PIN_INPUT,   MUX_MODE5)
+                        /* dss_data10.pr1_mii0_rxd1 */
+                        AM33XX_PADCONF(0x8c8, PIN_INPUT,   MUX_MODE5)
+                        /* dss_data9.pr1_mii0_rxd2 */
+                        AM33XX_PADCONF(0x8c4, PIN_INPUT,   MUX_MODE5)
+                        /* dss_data8.pr1_mii0_rxd3 */
+                        AM33XX_PADCONF(0x8c0, PIN_INPUT,   MUX_MODE5)
+                        /* dss_data1.pr1_mii0_txen */
+                        AM33XX_PADCONF(0x8a4, PIN_OUTPUT,  MUX_MODE2)
+                        /* dss_data14.pr1_mii_mr0_clk */
+                        AM33XX_PADCONF(0x8d8, PIN_INPUT,   MUX_MODE5)
+                        /* dss_data15.pr1_mii0_rxdv */
+                        AM33XX_PADCONF(0x8dc, PIN_INPUT,   MUX_MODE5)
+                        /* dss_data13.pr1_mii0_rxer */
+                        AM33XX_PADCONF(0x8d4, PIN_INPUT,   MUX_MODE5)
+                        /* dss_data12.pr1_mii0_rxlink */
+                        AM33XX_PADCONF(0x8d0, PIN_INPUT,   MUX_MODE5)
+                        /* dss_pclk.pr1_mii0_crs */
+                        AM33XX_PADCONF(0x8e8, PIN_INPUT,   MUX_MODE2)
+
+                        /* gpmc_a0.pr1_mii_mt1_clk */
+                        AM33XX_PADCONF(0x840, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_a4.pr1_mii1_txd0 */
+                        AM33XX_PADCONF(0x850, PIN_OUTPUT,  MUX_MODE5)
+                        /* gpmc_a3.pr1_mii1_txd1 */
+                        AM33XX_PADCONF(0x84c, PIN_OUTPUT,  MUX_MODE5)
+                        /* gpmc_a2.pr1_mii1_txd2 */
+                        AM33XX_PADCONF(0x848, PIN_OUTPUT,  MUX_MODE5)
+                        /* gpmc_a1.pr1_mii1_txd3 */
+                        AM33XX_PADCONF(0x844, PIN_OUTPUT,  MUX_MODE5)
+                        /* gpmc_a8.pr1_mii1_rxd0 */
+                        AM33XX_PADCONF(0x860, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_a7.pr1_mii1_rxd1 */
+                        AM33XX_PADCONF(0x85c, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_a6.pr1_mii1_rxd2 */
+                        AM33XX_PADCONF(0x858, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_a5.pr1_mii1_rxd3 */
+                        AM33XX_PADCONF(0x854, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_wpn.pr1_mii1_txen */
+                        AM33XX_PADCONF(0x874, PIN_OUTPUT,  MUX_MODE5)
+                        /* gpmc_a9.pr1_mii_mr1_clk */
+                        AM33XX_PADCONF(0x864, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_a10.pr1_mii1_rxdv */
+                        AM33XX_PADCONF(0x868, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_a11.pr1_mii1_rxer */
+                        AM33XX_PADCONF(0x86c, PIN_INPUT,   MUX_MODE5)
+                        /* gpmc_ben1.pr1_mii1_rxlink */
+                        AM33XX_PADCONF(0x878, PIN_INPUT,   MUX_MODE5)
+                        /* lcd_ac_bias_en.pr1_mii1_crs */
+                        AM33XX_PADCONF(0x8ec, PIN_INPUT,   MUX_MODE2)
+                        /* gpmc_wait0.pr1_mii1_col */
+                        AM33XX_PADCONF(0x870, PIN_INPUT,   MUX_MODE5)
+                >;
+        };
+};
+
+&gpio3 {
+        mux-mii-hog {
+                /* ETH1 mux: Low for MII-PRU, high for RMII-CPSW */
+                output-low;
+        };
+};
+
+/*
+ * Disable CPSW switch node and
+ * MDIO configuration to prevent
+ * conflict with PRU-ICSS
+ */
+&mac_sw {
+        status = "disable";
+};
+
+&davinci_mdio_sw {
+        status = "disable";
+};
+
+/* PRU-ICSS MDIO configuration */
+&pruss_mdio {
+        pinctrl-0 = <&pruss_mdio_default>;
+        pinctrl-names = "default";
+        reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+        reset-delay-us = <2>; /* PHY datasheet states 1uS min */
+        status = "okay";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pruss_eth0_phy: ethernet-phy@1 {
+                 reg = <1>;
+        };
+
+        pruss_eth1_phy: ethernet-phy@3 {
+                 reg = <3>;
+        };
+};
diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 89d16fcc773e..a63ef307d918 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -896,6 +896,17 @@ pruss_mii_rt: mii-rt@32000 {
 					reg = <0x32000 0x58>;
 				};
 
+				pruss_iep: iep@2e000 {
+					compatible = "ti,am3356-icss-iep";
+					reg = <0x2e000 0x31c>;
+					clocks = <&pruss_iepclk_mux>;
+				};
+
+				pruss_ecap: ecap@30000 {
+					compatible = "ti,pruss-ecap";
+					reg = <0x30000 0x60>;
+				};
+
 				pruss_intc: interrupt-controller@20000 {
 					compatible = "ti,pruss-intc";
 					reg = <0x20000 0x2000>;
diff --git a/arch/arm/boot/dts/ti/omap/am4372.dtsi b/arch/arm/boot/dts/ti/omap/am4372.dtsi
index 504fa6b57d39..494f251c8e6a 100644
--- a/arch/arm/boot/dts/ti/omap/am4372.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am4372.dtsi
@@ -476,6 +476,17 @@ pruss1_mii_rt: mii-rt@32000 {
 					reg = <0x32000 0x58>;
 				};
 
+				pruss1_iep: iep@2e000 {
+					compatible = "ti,am4376-icss-iep";
+					reg = <0x2e000 0x31c>;
+					clocks = <&pruss1_iepclk_mux>;
+				};
+
+				pruss1_ecap: ecap@30000 {
+					compatible = "ti,pruss-ecap";
+					reg = <0x30000 0x60>;
+				};
+
 				pruss1_intc: interrupt-controller@20000 {
 					compatible = "ti,pruss-intc";
 					reg = <0x20000 0x2000>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts b/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
index 826f687c368a..3d755d875a70 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
@@ -168,6 +168,48 @@ led-out7 {
 			default-state = "off";
 		};
 	};
+
+	/* Dual-MAC Ethernet application node on PRU-ICSS1 */
+	pruss1_eth: pruss1-eth {
+		compatible = "ti,am4376-prueth";
+		ti,prus = <&pru1_0>, <&pru1_1>;
+		sram = <&ocmcram>;
+		ti,mii-rt = <&pruss1_mii_rt>;
+		ti,iep = <&pruss1_iep>;
+		ti,ecap = <&pruss1_ecap>;
+		interrupts = <20 2 2>, <21 3 3>;
+		interrupt-names = "rx_hp", "rx_lp";
+		interrupt-parent = <&pruss1_intc>;
+
+		pinctrl-0 = <&pruss1_eth_default>;
+		pinctrl-names = "default";
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pruss1_emac0: ethernet-port@0 {
+				reg = <0>;
+				phy-handle = <&pruss1_eth0_phy>;
+				phy-mode = "mii";
+				interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+				interrupt-names = "rx", "emac_ptp_tx",
+						  "hsr_ptp_tx";
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+
+			pruss1_emac1: ethernet-port@1 {
+				reg = <1>;
+				phy-handle = <&pruss1_eth1_phy>;
+				phy-mode = "mii";
+				interrupts = <21 3 3>, <27 9 5>, <24 9 5>;
+				interrupt-names = "rx", "emac_ptp_tx",
+						  "hsr_ptp_tx";
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+		};
+	};
 };
 
 &am43xx_pinmux {
@@ -303,6 +345,86 @@ AM4372_IOPAD(0x94c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
+	pruss1_mdio_default: pruss1_mdio_default {
+		pinctrl-single,pins = <
+			/* gpmc_clk.pr1_mdio_mdclk */
+			AM4372_IOPAD(0x88c, (PIN_OUTPUT | MUX_MODE5))
+			/* xdma_event_intr0.pr1_mdio_data */
+			AM4372_IOPAD(0xa70, (PIN_INPUT  | MUX_MODE8))
+			/* cam1_data6.gpio4_20 */
+			AM4372_IOPAD(0xa00, (PIN_INPUT_PULLUP | MUX_MODE7))
+		>;
+	};
+
+	pruss1_eth_default: pruss1_eth_default {
+		pinctrl-single,pins = <
+			/* dss_data0.pr1_mii_mt0_clk */
+			AM4372_IOPAD(0x8a0, (PIN_INPUT  | MUX_MODE2))
+			/* dss_data5.pr1_mii0_txd0 */
+			AM4372_IOPAD(0x8b4, (PIN_OUTPUT | MUX_MODE2))
+			/* dss_data4.pr1_mii0_txd1 */
+			AM4372_IOPAD(0x8b0, (PIN_OUTPUT | MUX_MODE2))
+			/* dss_data3.pr1_mii0_txd2 */
+			AM4372_IOPAD(0x8ac, (PIN_OUTPUT | MUX_MODE2))
+			/* dss_data2.pr1_mii0_txd3 */
+			AM4372_IOPAD(0x8a8, (PIN_OUTPUT | MUX_MODE2))
+			/* dss_data11.pr1_mii0_rxd0 */
+			AM4372_IOPAD(0x8cc, (PIN_INPUT  | MUX_MODE5))
+			/* dss_data10.pr1_mii0_rxd1 */
+			AM4372_IOPAD(0x8c8, (PIN_INPUT  | MUX_MODE5))
+			/* dss_data9.pr1_mii0_rxd2 */
+			AM4372_IOPAD(0x8c4, (PIN_INPUT  | MUX_MODE5))
+			/* dss_data8.pr1_mii0_rxd3 */
+			AM4372_IOPAD(0x8c0, (PIN_INPUT  | MUX_MODE5))
+			/* dss_data1.pr1_mii0_txen */
+			AM4372_IOPAD(0x8a4, (PIN_OUTPUT | MUX_MODE2))
+			/* dss_data14.pr1_mii_mr0_clk */
+			AM4372_IOPAD(0x8d8, (PIN_INPUT  | MUX_MODE5))
+			/* dss_data15.pr1_mii0_rxdv */
+			AM4372_IOPAD(0x8dc, (PIN_INPUT  | MUX_MODE5))
+			/* dss_data13.pr1_mii0_rxer */
+			AM4372_IOPAD(0x8d4, (PIN_INPUT  | MUX_MODE5))
+			/* dss_data12.pr1_mii0_rxlink */
+			AM4372_IOPAD(0x8d0, (PIN_INPUT  | MUX_MODE5))
+			/* gpio5_10.pr1_mii0_crs */
+			AM4372_IOPAD(0xa40, (PIN_INPUT  | MUX_MODE5))
+			/* gpio5_8.pr1_mii0_col */
+			AM4372_IOPAD(0xa38, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_a6.pr1_mii_mt1_clk */
+			AM4372_IOPAD(0x858, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_a5.pr1_mii1_txd0 */
+			AM4372_IOPAD(0x854, (PIN_OUTPUT | MUX_MODE5))
+			/* gpmc_a4.pr1_mii1_txd1 */
+			AM4372_IOPAD(0x850, (PIN_OUTPUT | MUX_MODE5))
+			/* gpmc_a3.pr1_mii1_txd2 */
+			AM4372_IOPAD(0x84c, (PIN_OUTPUT | MUX_MODE5))
+			/* gpmc_a2.pr1_mii1_txd3 */
+			AM4372_IOPAD(0x848, (PIN_OUTPUT | MUX_MODE5))
+			/* gpmc_a11.pr1_mii1_rxd0 */
+			AM4372_IOPAD(0x86c, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_a10.pr1_mii1_rxd1 */
+			AM4372_IOPAD(0x868, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_a9.pr1_mii1_rxd2 */
+			AM4372_IOPAD(0x864, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_a8.pr1_mii1_rxd3 */
+			AM4372_IOPAD(0x860, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_a0.pr1_mii1_txen */
+			AM4372_IOPAD(0x840, (PIN_OUTPUT | MUX_MODE5))
+			/* gpmc_a7.pr1_mii_mr1_clk */
+			AM4372_IOPAD(0x85c, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_a1.pr1_mii1_rxdv */
+			AM4372_IOPAD(0x844, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_wpn.pr1_mii1_rxer */
+			AM4372_IOPAD(0x874, (PIN_INPUT  | MUX_MODE5))
+			/* gpio5_13.pr1_mii1_rxlink */
+			AM4372_IOPAD(0xa4c, (PIN_INPUT  | MUX_MODE5))
+			/* gpio5_11.pr1_mii1_crs */
+			AM4372_IOPAD(0xa44, (PIN_INPUT  | MUX_MODE5))
+			/* gpmc_be1n.pr1_mii1_col */
+			AM4372_IOPAD(0x878, (PIN_INPUT  | MUX_MODE5))
+		>;
+	};
+
 	qspi_pins_default: qspi-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x87c, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_csn0.qspi_csn */
@@ -539,5 +661,18 @@ opp-100-600000000 {
 };
 
 &pruss1_mdio {
-	status = "disabled";
+	pinctrl-0 = <&pruss1_mdio_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <2>;	/* PHY datasheet states 1uS min */
+
+	pruss1_eth0_phy: ethernet-phy@0 {
+		reg = <0>;
+	};
+
+	pruss1_eth1_phy: ethernet-phy@1 {
+		reg = <1>;
+	};
 };
-- 
2.43.0


