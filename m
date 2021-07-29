Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1063DAF52
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbhG2Wqe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35796 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhG2Wqe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMZ6128800;
        Thu, 29 Jul 2021 17:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598782;
        bh=sphePILKvI69JTyB6aEcwoWTBX4ED7swhTFW9xrTKAU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=aqlSMlkiv0akGJyFKtDSqa2jJwYNdlHHfuKNvEUvnhfqFkAw6BqmETURvKh5ML4fM
         f5hjcJ1rwpcW2HR6VPdt2fJpx4YpULZ1pf5yFW6WvJI2L0mHCYPXuO4iJYVzaCxHse
         whvY2ONK5xTj8BZnamKZxm3YfDUTgfz7NLTndDiM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkMW4014573
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:22 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMqU076799;
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkMF2016280;
        Thu, 29 Jul 2021 17:46:22 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 10/11] ARM: dts: am57xx: Add PRU-ICSS nodes
Date:   Thu, 29 Jul 2021 17:46:20 -0500
Message-ID: <20210729224621.2295-11-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729224621.2295-1-s-anna@ti.com>
References: <20210729224621.2295-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add the DT nodes for the PRU-ICSS1 and PRU-ICSS2 processor subsystems
that are present on AM57xx family of SoCs. Each PRU-ICSS instance is
represented by a pruss node and other child nodes. The two PRU-ICSSs
are identical to each other. They are not supported on DRA7xx SoCs in
general, so the nodes are added under the respective interconnect target
module nodes in a common am57-pruss.dtsi file. The file is already
included only in the AM57xx related board files.

The PRU-ICSSs on AM57xx are very similar to the PRUSS in AM33xx and AM437x
except for variations in the RAM sizes and the number of interrupts coming
into the MPU INTC. The interrupt events into the PRU-ICSS also requires
programming of the corresponding crossbars properly.

The PRUSS subsystem node contains the entire address space. The various
sub-modules of the PRU-ICSS are represented as individual child nodes
(so platform devices themselves) of the PRUSS subsystem node. These
include the two PRU cores and the interrupt controller. All the Data
RAMs are represented within a child node of its own named 'memories'
without any compatible. The Real Time Media Independent Interface
controller (MII_RT), and the CFG sub-module are represented as syscon
nodes. The PRUSS CFG module has a clock mux for IEP clock, this clk
node is added under the CFG child node 'clocks'. The default source
for this mux clock is the ICSS_IEP_CLK clock.

The DT nodes use all standard properties. The regs property in the PRU
nodes define the addresses for the Instruction RAM, the Debug and Control
sub-modules for that PRU core. The firmware for each PRU core is defined
through a 'firmware-name' property.

The default names for the firmware images for each PRU core are defined
as follows (these can be adjusted either in derivative board dts files or
through sysfs at runtime if required):
    PRU-ICSS1 PRU0 Core: am57xx-pru1_0-fw
    PRU-ICSS1 PRU1 Core: am57xx-pru1_1-fw
    PRU-ICSS2 PRU0 Core: am57xx-pru2_0-fw
    PRU-ICSS2 PRU1 Core: am57xx-pru2_1-fw

Note:
1. There are few more sub-modules like the Industrial Ethernet Peripheral
   (IEPs), MDIO, UART, eCAP that do not have bindings and so will be added
   in the future.
2. The PRUSS INTC on AM57xx SoCs also connect the host interrupts 6 and 7
   as possible DMA events, so use the 'ti,irqs-reserved' property in
   derivative board dts files _if_ any of them should not be handled by
   the host OS.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/boot/dts/am57-pruss.dtsi | 158 +++++++++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am57-pruss.dtsi b/arch/arm/boot/dts/am57-pruss.dtsi
index 032c1acfcda3..494d56830b34 100644
--- a/arch/arm/boot/dts/am57-pruss.dtsi
+++ b/arch/arm/boot/dts/am57-pruss.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2020-2021 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Common PRUSS data for TI AM57xx platforms
  */
@@ -25,6 +25,84 @@ pruss1_tm: target-module@4b226000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x4b200000 0x80000>;
+
+		pruss1: pruss@0 {
+			compatible = "ti,am5728-pruss";
+			reg = <0x0 0x80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			pruss1_mem: memories@0 {
+				reg = <0x0 0x2000>,
+				      <0x2000 0x2000>,
+				      <0x10000 0x8000>;
+				reg-names = "dram0", "dram1",
+					    "shrdram2";
+			};
+
+			pruss1_cfg: cfg@26000 {
+				compatible = "ti,pruss-cfg", "syscon";
+				reg = <0x26000 0x2000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x26000 0x2000>;
+
+				clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					pruss1_iepclk_mux: iepclk-mux@30 {
+						reg = <0x30>;
+						#clock-cells = <0>;
+						clocks = <&dpll_gmac_m3x2_ck>,  /* icss_iep_clk */
+							 <&dpll_gmac_h13x2_ck>; /* icss_clk */
+					};
+				};
+			};
+
+			pruss1_mii_rt: mii-rt@32000 {
+				compatible = "ti,pruss-mii", "syscon";
+				reg = <0x32000 0x58>;
+			};
+
+			pruss1_intc: interrupt-controller@20000 {
+				compatible = "ti,pruss-intc";
+				reg = <0x20000 0x2000>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "host_intr0", "host_intr1",
+						  "host_intr2", "host_intr3",
+						  "host_intr4", "host_intr5",
+						  "host_intr6", "host_intr7";
+			};
+
+			pru1_0: pru@34000 {
+				compatible = "ti,am5728-pru";
+				reg = <0x34000 0x3000>,
+				      <0x22000 0x400>,
+				      <0x22400 0x100>;
+				reg-names = "iram", "control", "debug";
+				firmware-name = "am57xx-pru1_0-fw";
+			};
+
+			pru1_1: pru@38000 {
+				compatible = "ti,am5728-pru";
+				reg = <0x38000 0x3000>,
+				      <0x24000 0x400>,
+				      <0x24400 0x100>;
+				reg-names = "iram", "control", "debug";
+				firmware-name = "am57xx-pru1_1-fw";
+			};
+		};
 	};
 
 	pruss2_tm: target-module@4b2a6000 {
@@ -46,5 +124,83 @@ pruss2_tm: target-module@4b2a6000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x4b280000 0x80000>;
+
+		pruss2: pruss@0 {
+			compatible = "ti,am5728-pruss";
+			reg = <0x0 0x80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			pruss2_mem: memories@0 {
+				reg = <0x0 0x2000>,
+				      <0x2000 0x2000>,
+				      <0x10000 0x8000>;
+				reg-names = "dram0", "dram1",
+					    "shrdram2";
+			};
+
+			pruss2_cfg: cfg@26000 {
+				compatible = "ti,pruss-cfg", "syscon";
+				reg = <0x26000 0x2000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x26000 0x2000>;
+
+				clocks {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					pruss2_iepclk_mux: iepclk-mux@30 {
+						reg = <0x30>;
+						#clock-cells = <0>;
+						clocks = <&dpll_gmac_m3x2_ck>,  /* icss_iep_clk */
+							 <&dpll_gmac_h13x2_ck>; /* icss_clk */
+					};
+				};
+			};
+
+			pruss2_mii_rt: mii-rt@32000 {
+				compatible = "ti,pruss-mii", "syscon";
+				reg = <0x32000 0x58>;
+			};
+
+			pruss2_intc: interrupt-controller@20000 {
+				compatible = "ti,pruss-intc";
+				reg = <0x20000 0x2000>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "host_intr0", "host_intr1",
+						  "host_intr2", "host_intr3",
+						  "host_intr4", "host_intr5",
+						  "host_intr6", "host_intr7";
+			};
+
+			pru2_0: pru@34000 {
+				compatible = "ti,am5728-pru";
+				reg = <0x34000 0x3000>,
+				      <0x22000 0x400>,
+				      <0x22400 0x100>;
+				reg-names = "iram", "control", "debug";
+				firmware-name = "am57xx-pru2_0-fw";
+			};
+
+			pru2_1: pru@38000 {
+				compatible = "ti,am5728-pru";
+				reg = <0x38000 0x3000>,
+				      <0x24000 0x400>,
+				      <0x24400 0x100>;
+				reg-names = "iram", "control", "debug";
+				firmware-name = "am57xx-pru2_1-fw";
+			};
+		};
 	};
 };
-- 
2.32.0

