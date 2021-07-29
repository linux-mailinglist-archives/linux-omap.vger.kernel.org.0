Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09343DAF66
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbhG2Wqj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35850 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbhG2Wqi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:38 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkLfs128784;
        Thu, 29 Jul 2021 17:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598781;
        bh=+JaWdEPcqLXpeqKO8Qmfcf+nkg6wwGPU3NDL4eX/yDM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=X52P1mVFC4H7Vd3XXoF0EafW1y/F+LiXDMZ0izP/CwassOKQ2RU7+LokhXroLI1M1
         TSjhEyXqoVK1jT1pbdpZBmuUCbt5fEyritK9OvNFx6QQNExBb9ZXp2JaGCqIOHWWH5
         af8rvPISppHhvRuMrFW9UgtURNvIbS5RrFUlZM5E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkLc2014560
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:21 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkLhd073991;
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkLRc016252;
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
Subject: [PATCH 01/11] ARM: dts: am33xx-l4: Add PRUSS node
Date:   Thu, 29 Jul 2021 17:46:11 -0500
Message-ID: <20210729224621.2295-2-s-anna@ti.com>
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

Add the DT nodes for the PRU-ICSS on AM33xx family of SoCs. The AM33xx
SoCs contain a single PRU-ICSS instance and is represented by a pruss
node and other child nodes. PRU-ICSS is supported only on AM3356+ SoCs
though in the AM33xx family, so the nodes are added under the
corresponding disabled interconnect target module node in the common
am33xx-l4 dtsi file. The target module node should be enabled in only
those derivative board files that use a SoC containing PRU-ICSS.

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
     PRU-ICSS PRU0 Core: am335x-pru1_0-fw
     PRU-ICSS PRU1 Core: am335x-pru1_1-fw

Note:
1. There are few more sub-modules like the Industrial Ethernet Peripheral
   (IEP), MDIO, UART, eCAP that do not have bindings and so will be added
   in the future.
2. The PRUSS INTC on AM335x SoCs also connect the host interrupts 0 to
   TSC_ADC; 6 and 7 as possible DMA events, so use the 'ti,irqs-reserved'
   property in derivative board dts files _if_ any of them should not be
   handled by the host OS.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 71 ++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 859e760df4c8..148176361b4e 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -853,6 +853,77 @@ pruss_tm: target-module@300000 {	/* 0x4a300000, ap 9 04.0 */
 			#size-cells = <1>;
 			ranges = <0x0 0x300000 0x80000>;
 			status = "disabled";
+
+			pruss: pruss@0 {
+				compatible = "ti,am3356-pruss";
+				reg = <0x0 0x80000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				pruss_mem: memories@0 {
+					reg = <0x0 0x2000>,
+					      <0x2000 0x2000>,
+					      <0x10000 0x3000>;
+					reg-names = "dram0", "dram1",
+						    "shrdram2";
+				};
+
+				pruss_cfg: cfg@26000 {
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
+						pruss_iepclk_mux: iepclk-mux@30 {
+							reg = <0x30>;
+							#clock-cells = <0>;
+							clocks = <&l3_gclk>,        /* icss_iep_gclk */
+								 <&pruss_ocp_gclk>; /* icss_ocp_gclk */
+						};
+					};
+				};
+
+				pruss_mii_rt: mii-rt@32000 {
+					compatible = "ti,pruss-mii", "syscon";
+					reg = <0x32000 0x58>;
+				};
+
+				pruss_intc: interrupt-controller@20000 {
+					compatible = "ti,pruss-intc";
+					reg = <0x20000 0x2000>;
+					interrupts = <20 21 22 23 24 25 26 27>;
+					interrupt-names = "host_intr0", "host_intr1",
+							  "host_intr2", "host_intr3",
+							  "host_intr4", "host_intr5",
+							  "host_intr6", "host_intr7";
+					interrupt-controller;
+					#interrupt-cells = <3>;
+				};
+
+				pru0: pru@34000 {
+					compatible = "ti,am3356-pru";
+					reg = <0x34000 0x2000>,
+					      <0x22000 0x400>,
+					      <0x22400 0x100>;
+					reg-names = "iram", "control", "debug";
+					firmware-name = "am335x-pru0-fw";
+				};
+
+				pru1: pru@38000 {
+					compatible = "ti,am3356-pru";
+					reg = <0x38000 0x2000>,
+					      <0x24000 0x400>,
+					      <0x24400 0x100>;
+					reg-names = "iram", "control", "debug";
+					firmware-name = "am335x-pru1-fw";
+				};
+			};
 		};
 	};
 };
-- 
2.32.0

