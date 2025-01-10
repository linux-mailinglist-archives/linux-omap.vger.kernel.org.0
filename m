Return-Path: <linux-omap+bounces-3074-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69EA088DC
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 08:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D95B83A9123
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A756D206F3D;
	Fri, 10 Jan 2025 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="1vWaqtnZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46D188714;
	Fri, 10 Jan 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736493326; cv=none; b=nA9imSGxvhQSZIjbeH1tsJh8/wGRUNuPoKUDWQbuc6hPVDvOuhSdZo2Bz7BR/oOVPjMogDhEoc5g+lLr1ZssiOWh7h7ZEsrpM/hJx6Nq9hLbW9yYkXei9p/2BS+s6zRmrOR23ozXIuNveZxzZNqYxCp3oc28nZixehmZwX0Ih2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736493326; c=relaxed/simple;
	bh=1DUdhbNHwf7Ihdy3qxNIg0dZKQEOY3tk5u6LH7jQ6h8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cEriDFxcBBwIWqmCwDVc68UAYhQrySS4gdaOp4tKC+/QZ9Ls3kWFZuS6UUaw/BBUfjdrlA5FGOOfxm/P3YkuLY5XqlQPTujJdFtrT2JDCuzeqEZpq5zfljZnzdNfiNksGTU6U24lhDW2RwD0ZC2VghEULH16bOU8Jupo/zm0i6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=1vWaqtnZ; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=13OJ8FEoXvsyKmdayUPqlnZCqEb78KeiDL7hDUKSu38=; b=1vWaqtnZpP4/MxtW3PrUtnBuWk
	rjNlapGGrHsUss3n5ly54PBe/AsILvLOWgbuWVf77/HEVN3jzyKIl/ggS0M7uLxx7gVuHtBCpoBmc
	axguzQ3lncK6uJdsTvRLljHFeQsxg1A62t5GmyPx0+gpznGKvjrQLXLCi1A8TY4+04p0MZq/IeAcA
	jovSYEqmpPsHP54Mk38PTvPTOqGcbPnUW5xM3eM5dIJRhpxBBiZXeAume/+RqqpEaXoZa+9Bq9Mvi
	gYno8ksvvSLFM0WSywzRpg3lTev78Wkt9K/KLHuCuWGrgJGIzGjmXVFFTNxc1oDMirwls7Im9lvX3
	8c9mQdVw==;
Received: from [122.175.9.182] (port=50142 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tW9El-0002S5-0z;
	Fri, 10 Jan 2025 12:45:19 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	tony@atomide.com,
	richardcochran@gmail.com,
	parvathi@couthit.com,
	basharath@couthit.com,
	schnelle@linux.ibm.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	m-karicheri2@ti.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [RFC PATCH 10/10] arm: dts: ti: Adds device tree nodes for PRU Cores, IEP and eCAP modules of PRU-ICSS2 Instance.
Date: Fri, 10 Jan 2025 12:43:51 +0530
Message-Id: <20250110071351.66888-11-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109105600.41297-1-basharath@couthit.com>
References: <20250109105600.41297-1-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
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
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
---
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi     | 11 ++++
 arch/arm/boot/dts/ti/omap/am571x-idk.dts      |  8 ++-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts      | 10 +--
 arch/arm/boot/dts/ti/omap/am574x-idk.dts      | 10 +--
 .../boot/dts/ti/omap/am57xx-idk-common.dtsi   | 63 +++++++++++++++++++
 5 files changed, 93 insertions(+), 9 deletions(-)

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
index 43e3623f079c..da94984f47b8 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
@@ -155,6 +155,54 @@ src_clk_x1: src_clk_x1 {
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
+		ecap = <&pruss2_ecap>;
+		interrupts = <20 2 2>, <21 3 3>;
+		interrupt-names = "rx_lre_hp", "rx_lre_lp";
+		interrupt-parent = <&pruss2_intc>;
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pruss2_emac0: port@0 {
+				reg = <0>;
+				phy-handle = <&pruss2_eth0_phy>;
+				phy-mode = "mii";
+				interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+				interrupt-names = "rx", "emac_ptp_tx",
+								"hsr_ptp_tx";
+				ti,no-half-duplex;
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+
+			pruss2_emac1: port@1 {
+				reg = <1>;
+				phy-handle = <&pruss2_eth1_phy>;
+				phy-mode = "mii";
+				interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
+				interrupt-names = "rx", "emac_ptp_tx",
+								"hsr_ptp_tx";
+				ti,no-half-duplex;
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
@@ -606,3 +654,18 @@ dpi_out: endpoint {
 		};
 	};
 };
+
+&pruss2_mdio {
+	status = "okay";
+	pruss2_eth0_phy: ethernet-phy@0 {
+		reg = <0>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	pruss2_eth1_phy: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
-- 
2.34.1


