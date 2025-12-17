Return-Path: <linux-omap+bounces-5198-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADACC8499
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA15B301B124
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111C335BDB4;
	Wed, 17 Dec 2025 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="P6tSKQkr"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133C535B144;
	Wed, 17 Dec 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976894; cv=none; b=fjvHLHC8bOTQXmebxIKCm/ICg1LHjWSBUuSTrmifICJjj37t438+DsPo/vzd7mHgBQhDpXRV83Ow2Nq9tY4/UGZILhXNtNtXryjfW88tu/PL/zSCMTcyG0EFNBgg46c8gDw37N0hUpQHlzVIY1Lr8G7e3wpjGparqHK42bbFNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976894; c=relaxed/simple;
	bh=61vKQtd1+DXJGLlnZ0i6TtmC3aOZQw7WeXdw/2PUKKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6Arcq/qiuENgY8WKEwoHHIjzJRcmKeQncsaAdYzM9f7bhfyViTflFfUGLVq9fyIxLWWQzDFeWsX7K8Pmi8jpaJhbPYRKqj+jCD2BOPIa8IVVOd/3zmg3p3Sz9lprREKf4trcQWTBs+gg6MoL2kcQ+xf3QXoeYSs0Ozs4XKTJVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=P6tSKQkr; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/8JAxWZBvsIgT3JdjEwbxw+itBrVTYerSzmGiXRisbE=; b=P6tSKQkrVt9FqYsOSwdws/m2aC
	zLvaTBCYPwv5j3tMFqiR60UrAspQ8sG1Mla5X7Ou5uy9uHXwSemgGGDE/svK6xeMbPdMK7mn8+YEo
	a8uLshHcH3BohDXCvRMJC20/XlNPgzoAwyJtmiTFcqZzw1j65kE9UfKRfd29Cge57Gv8IlGIjvhmb
	KJMcayLEk37LFvDgp9nKM1GfN5uklL/t/VM7dmbJdmI0tsNrTNOwksOYvu61FuH0OinbGtyKdvrk9
	PVqLU4j6txB0S0yV3NCzrRd61Rj2yAZ9iPRp6QqRJNdhwXxrOV4A5cpLsZnhCYKEn/kfA4ZneIbWk
	vH7PHUAQ==;
Received: from [122.175.9.182] (port=62422 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vVrGC-0000000FG2C-3lJ8;
	Wed, 17 Dec 2025 08:08:09 -0500
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
Subject: [RESEND PATCH v3 1/2] arm: dts: ti: Adds device tree nodes for PRU Cores, IEP and eCAP modules of PRU-ICSS2 Instance.
Date: Wed, 17 Dec 2025 18:34:38 +0530
Message-ID: <20251217130715.1327138-2-parvathi@couthit.com>
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

The TI Sitara AM57xx series of devices consists of 2 PRU-ICSS instances
(PRU-ICSS1 and PRU-ICSS2). This patch adds the device tree nodes for the
PRU-ICSS2 instance to support DUAL-MAC mode of operation.

Each PRU-ICSS instance consists of two PRU cores along with various
peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
Ethernet Peripheral(IEP), the Real Time Media Independent Interface
controller (MII_RT), and the Enhanced Capture (eCAP) event module.

am57-pruss.dtsi - Adds IEP and eCAP peripheral as child nodes of
the PRUSS subsystem node.

am57xx-idk-common.dtsi - Adds PRU-ICSS2 instance node along with
PRU eth port information and corresponding port configuration. It includes
interrupt mapping for packet reception, HW timestamp collection, and
PRU Ethernet ports in MII mode.

am571x-idk.dts, am572x-idk.dts and am574x-idk.dts - GPIO configuration
along with delay configuration for individual PRU Ethernet port.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi     | 11 ++++
 arch/arm/boot/dts/ti/omap/am571x-idk.dts      |  8 ++-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts      | 10 +--
 arch/arm/boot/dts/ti/omap/am574x-idk.dts      | 10 +--
 .../boot/dts/ti/omap/am57xx-idk-common.dtsi   | 61 +++++++++++++++++++
 5 files changed, 91 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am57-pruss.dtsi b/arch/arm/boot/dts/ti/omap/am57-pruss.dtsi
index 46c5383f0eee..f73316625608 100644
--- a/arch/arm/boot/dts/ti/omap/am57-pruss.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57-pruss.dtsi
@@ -170,6 +170,17 @@ pruss2_iepclk_mux: iepclk-mux@30 {
 				};
 			};
 
+			pruss2_iep: iep@2e000 {
+				compatible = "ti,am5728-icss-iep";
+				reg = <0x2e000 0x31c>;
+				clocks = <&pruss2_iepclk_mux>;
+			};
+
+			pruss2_ecap: ecap@30000 {
+				compatible = "ti,pruss-ecap";
+				reg = <0x30000 0x60>;
+			};
+
 			pruss2_mii_rt: mii-rt@32000 {
 				compatible = "ti,pruss-mii", "syscon";
 				reg = <0x32000 0x58>;
diff --git a/arch/arm/boot/dts/ti/omap/am571x-idk.dts b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
index 322cf79d22e9..02653b440585 100644
--- a/arch/arm/boot/dts/ti/omap/am571x-idk.dts
+++ b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
@@ -214,5 +214,11 @@ &pruss1_mdio {
 };
 
 &pruss2_mdio {
-	status = "disabled";
+	reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <2>;   /* PHY datasheet states 1uS min */
+};
+
+&pruss2_eth {
+	ti,pruss-gp-mux-sel = <4>,      /* MII2, needed for PRUSS1_MII0 */
+			      <4>;      /* MII2, needed for PRUSS1_MII1 */
 };
diff --git a/arch/arm/boot/dts/ti/omap/am572x-idk.dts b/arch/arm/boot/dts/ti/omap/am572x-idk.dts
index 94a738cb0a4d..54a8ccb9ca14 100644
--- a/arch/arm/boot/dts/ti/omap/am572x-idk.dts
+++ b/arch/arm/boot/dts/ti/omap/am572x-idk.dts
@@ -28,10 +28,12 @@ &mmc2 {
 	pinctrl-2 = <&mmc2_pins_ddr_rev20>;
 };
 
-&pruss1_mdio {
-	status = "disabled";
+&pruss2_eth0_phy {
+	reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+	reset-assert-us = <2>;   /* PHY datasheet states 1uS min */
 };
 
-&pruss2_mdio {
-	status = "disabled";
+&pruss2_eth1_phy {
+	reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	reset-assert-us = <2>;   /* PHY datasheet states 1uS min */
 };
diff --git a/arch/arm/boot/dts/ti/omap/am574x-idk.dts b/arch/arm/boot/dts/ti/omap/am574x-idk.dts
index 47b9174d2353..47b6c6cb210c 100644
--- a/arch/arm/boot/dts/ti/omap/am574x-idk.dts
+++ b/arch/arm/boot/dts/ti/omap/am574x-idk.dts
@@ -40,10 +40,12 @@ &emif1 {
 	status = "okay";
 };
 
-&pruss1_mdio {
-	status = "disabled";
+&pruss2_eth0_phy {
+	reset-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+	reset-assert-us = <2>;   /* PHY datasheet states 1uS min */
 };
 
-&pruss2_mdio {
-	status = "disabled";
+&pruss2_eth1_phy {
+	reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	reset-assert-us = <2>;   /* PHY datasheet states 1uS min */
 };
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
index 43e3623f079c..5eccff3bb4b6 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
@@ -155,6 +155,52 @@ src_clk_x1: src_clk_x1 {
 		compatible = "fixed-clock";
 		clock-frequency = <20000000>;
 	};
+
+	/* Dual-MAC Ethernet application node on PRU-ICSS2 */
+	pruss2_eth: pruss2-eth {
+		compatible = "ti,am57-prueth";
+		ti,prus = <&pru2_0>, <&pru2_1>;
+		sram = <&ocmcram1>;
+		ti,mii-rt = <&pruss2_mii_rt>;
+		ti,iep = <&pruss2_iep>;
+		ti,ecap = <&pruss2_ecap>;
+		interrupts = <20 2 2>, <21 3 3>;
+		interrupt-names = "rx_hp", "rx_lp";
+		interrupt-parent = <&pruss2_intc>;
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pruss2_emac0: ethernet-port@0 {
+				reg = <0>;
+				phy-handle = <&pruss2_eth0_phy>;
+				phy-mode = "mii";
+				interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+				interrupt-names = "rx", "emac_ptp_tx",
+						  "hsr_ptp_tx";
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+
+			pruss2_emac1: ethernet-port@1 {
+				reg = <1>;
+				phy-handle = <&pruss2_eth1_phy>;
+				phy-mode = "mii";
+				interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
+				interrupt-names = "rx", "emac_ptp_tx",
+						  "hsr_ptp_tx";
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+		};
+	};
+
+};
+
+&pruss2_iep {
+	interrupt-parent = <&pruss2_intc>;
+	interrupts = <7 7 8>;
+	interrupt-names = "iep_cap_cmp";
 };
 
 &dra7_pmx_core {
@@ -606,3 +652,18 @@ dpi_out: endpoint {
 		};
 	};
 };
+
+&pruss2_mdio {
+	status = "okay";
+	pruss2_eth0_phy: ethernet-phy@0 {
+		reg = <0>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pruss2_eth1_phy: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.43.0


