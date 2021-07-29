Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954113DAF5E
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbhG2Wqh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:37 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60424 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbhG2Wqg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMKo036088;
        Thu, 29 Jul 2021 17:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598782;
        bh=jBoHk2AZxZa5f0VnqyGUWec6ZW20bZlvqoGlJvKmZTI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dc+ALbpS9hJkMzWob6G581AszHWDtpRcatJvNBgA6aUtUt5bGJQB3/hCh15ZrjI87
         rAaFWFQjRyMSHJt8NAFoCEk/Fgc15jGKcWiz2jS/Ufj3ZVHujr7IKtJROcRfEbyR/C
         hVUBLm/EzG6yHSqJrQ3jKK7yAdCNbCbUcNiVnF94=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkMYF014564
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:21 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkLMp024724;
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkLub016271;
        Thu, 29 Jul 2021 17:46:21 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 07/11] ARM: dts: am4372: Add the PRU-ICSS1 DT node
Date:   Thu, 29 Jul 2021 17:46:17 -0500
Message-ID: <20210729224621.2295-8-s-anna@ti.com>
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

Add the DT node for the PRU-ICSS1 instance on the AM437x family of SoCs.
Each PRU-ICSS instance is represented by a pruss node and other child
nodes. The nodes are added under the interconnect target module node in
the common am4372 dtsi file. The PRU-ICSS instances are supported only
on AM4376+ SoCs though in the AM437x family, so the interconnect target
module node should be disabled in any derivative board dts file that
uses AM4372 SoCs.

The PRU-ICSS1 on AM437x is very similar to the PRUSS in AM33xx, except
for variations in the RAM sizes, bus addresses and the number of
interrupts coming into the MPU INTC (host interrupt 5 is routed to
the other PRUSS instead of MPU).

The PRUSS subsystem node contains the entire address space. The various
sub-modules of the PRU-ICSS are represented as individual child nodes
(so platform devices themselves) of the PRUSS subsystem node. These
include the two PRU cores and the interrupt controller. All the Data
RAMs are represented within a child node of its own named 'memories'
without any compatible. The Real Time Media Independent Interface
controller (MII_RT), and the CFG sub-module are represented as syscon
nodes. The PRUSS CFG module has a clock mux for IEP clock, this clk
node is added under the CFG child node 'clocks'. The default source
for this mux clock is the PRU_ICSS_IEP_GCLK clock.

The DT nodes use all standard properties. The regs property in the PRU
nodes define the addresses for the Instruction RAM, the Debug and Control
sub-modules for that PRU core. The firmware for each PRU core is defined
through a 'firmware-name' property.

The default names for the firmware images for each PRU core are defined
as follows (these can be adjusted either in derivative board dts files
or through sysfs at runtime if required):
     PRU-ICSS1 PRU0 Core: am437x-pru1_0-fw
     PRU-ICSS1 PRU1 Core: am437x-pru1_1-fw

Note:
1. There are few more sub-modules like the Industrial Ethernet Peripheral
   (IEP), MDIO, UART, eCAP that do not have bindings and so will be added
   in the future.
2. The PRUSS INTC on AM437x SoCs also connect the host interrupt 0 to ADC0
   and ADC1; 6 and 7 as possible DMA events, so use the 'ti,irqs-reserved'
   property in derivative board dts files _if_ any of them should not be
   handled by the host OS. Host interrupt 5 is already marked reserved as
   it is connected to the other PRUSS instance.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi | 78 +++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index 57a85a6c34a2..ddfe58b1ae79 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -434,6 +434,84 @@ pruss_tm: target-module@54400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x54400000 0x80000>;
+
+			pruss1: pruss@0 {
+				compatible = "ti,am4376-pruss1";
+				reg = <0x0 0x40000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				pruss1_mem: memories@0 {
+					reg = <0x0 0x2000>,
+					      <0x2000 0x2000>,
+					      <0x10000 0x8000>;
+					reg-names = "dram0", "dram1",
+						    "shrdram2";
+				};
+
+				pruss1_cfg: cfg@26000 {
+					compatible = "ti,pruss-cfg", "syscon";
+					reg = <0x26000 0x2000>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x0 0x26000 0x2000>;
+
+					clocks {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						pruss1_iepclk_mux: iepclk-mux@30 {
+							reg = <0x30>;
+							#clock-cells = <0>;
+							clocks = <&sysclk_div>,     /* icss_iep_gclk */
+								 <&pruss_ocp_gclk>; /* icss_ocp_gclk */
+						};
+					};
+				};
+
+				pruss1_mii_rt: mii-rt@32000 {
+					compatible = "ti,pruss-mii", "syscon";
+					reg = <0x32000 0x58>;
+				};
+
+				pruss1_intc: interrupt-controller@20000 {
+					compatible = "ti,pruss-intc";
+					reg = <0x20000 0x2000>;
+					interrupt-controller;
+					#interrupt-cells = <3>;
+					interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "host_intr0", "host_intr1",
+							  "host_intr2", "host_intr3",
+							  "host_intr4",
+							  "host_intr6", "host_intr7";
+					ti,irqs-reserved = /bits/ 8 <0x20>; /* BIT(5) */
+				};
+
+				pru1_0: pru@34000 {
+					compatible = "ti,am4376-pru";
+					reg = <0x34000 0x3000>,
+					      <0x22000 0x400>,
+					      <0x22400 0x100>;
+					reg-names = "iram", "control", "debug";
+					firmware-name = "am437x-pru1_0-fw";
+				};
+
+				pru1_1: pru@38000 {
+					compatible = "ti,am4376-pru";
+					reg = <0x38000 0x3000>,
+					      <0x24000 0x400>,
+					      <0x24400 0x100>;
+					reg-names = "iram", "control", "debug";
+					firmware-name = "am437x-pru1_1-fw";
+				};
+			};
 		};
 
 		target-module@50000000 {
-- 
2.32.0

