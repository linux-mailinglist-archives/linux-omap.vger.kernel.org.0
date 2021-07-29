Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDCC3DAF54
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhG2Wqf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35794 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhG2Wqe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMAg128796;
        Thu, 29 Jul 2021 17:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598782;
        bh=zyPK25hj+mcVdZ6JnpEZ8xmAdDPtCH3ZFTgBzK2PMmw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ge1/QQTTC1WqgLuPZEVpKKMjsjcFqmabtIKjEw1HRbNtoNRDTBQxg7OG3sl/XezXH
         0LoTyevZ/qQLWS31QRSyJTBc75NMCYqbhmZ+75GvWsByzKF6eitJvBgd/kXJ89JumQ
         Q9Ymu0uVRz+tDP59Y9+kLjeAV2ss5Ou7Ig9wrQro=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkMYR014567
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:22 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMcW043448;
        Thu, 29 Jul 2021 17:46:22 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkLUn016274;
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
Subject: [PATCH 08/11] ARM: dts: am4372: Add the PRU-ICSS0 DT node
Date:   Thu, 29 Jul 2021 17:46:18 -0500
Message-ID: <20210729224621.2295-9-s-anna@ti.com>
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

The AM4376+ SoCs have a second smaller PRU-ICSS subsystem (PRUSS0) in
addition to the primary PRUSS1 instance. The PRUSS0 has less DRAM
per PRU, and no Shared DRAM among other minor differences. The IEP
and MII_RT modules even though present within the IP are not pinned
out.

This PRUSS0 instance has a weird SoC integration. It shares the same
L3 OCP interconnect interface with PRUSS1, and also shares its reset
line and clocks. Any external accesses from PRUSS0 requires the PRUSS1's
PRUSS_SYSCFG register to be programmed properly. That said, it is its
own IP instance (a cut-down version), and so it has been added as an
independent node (sibling node to PRUSS1 node) and a child node of the
corresponding PRUSS target module interconnect node. This allows the
PRUSS0 instance to be enabled/disabled independently of the PRUSS1
instance.

The nodes are added under the corresponding interconnect target module
node in the common am4372 dtsi file. The PRU-ICSS instances are not
supported on AM4372 SoC though in the AM437x family, so the interconnect
target module node should be disabled in any derivative board dts file that
uses AM4372 SoCs. The individual PRUSS node can be disabled in the
corresponding board dts file if desired.

The default names for the firmware images for each PRU core are defined
as follows (these can be adjusted either in derivative board dts files or
through sysfs at runtime if required):
     PRU-ICSS0 PRU0 Core: am437x-pru0_0-fw
     PRU-ICSS0 PRU1 Core: am437x-pru0_1-fw

Note:
1. There are few more sub-modules like the Industrial Ethernet Peripheral
   (IEP), eCAP, UART, that do not have bindings and so will be added in the
   future. Only UART is pinned out, so others should be added in disabled
   state if added.
2. The PRUSS0 INTC on AM437x SoCs routes the host interrupt 5 to the other
   PRUSS1, so it is already marked reserved through the 'ti,irqs-reserved'
   property.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi | 77 +++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index ddfe58b1ae79..2200a09c2065 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -512,6 +512,83 @@ pru1_1: pru@38000 {
 					firmware-name = "am437x-pru1_1-fw";
 				};
 			};
+
+			pruss0: pruss@40000 {
+				compatible = "ti,am4376-pruss0";
+				reg = <0x40000 0x40000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				pruss0_mem: memories@40000 {
+					reg = <0x40000 0x1000>,
+					      <0x42000 0x1000>;
+					reg-names = "dram0", "dram1";
+				};
+
+				pruss0_cfg: cfg@66000 {
+					compatible = "ti,pruss-cfg", "syscon";
+					reg = <0x66000 0x2000>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x0 0x66000 0x2000>;
+
+					clocks {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						pruss0_iepclk_mux: iepclk-mux@30 {
+							reg = <0x30>;
+							#clock-cells = <0>;
+							clocks = <&sysclk_div>,     /* icss_iep_gclk */
+								 <&pruss_ocp_gclk>; /* icss_ocp_gclk */
+						};
+					};
+				};
+
+				pruss0_mii_rt: mii-rt@72000 {
+					compatible = "ti,pruss-mii", "syscon";
+					reg = <0x72000 0x58>;
+					status = "disabled";
+				};
+
+				pruss0_intc: interrupt-controller@60000 {
+					compatible = "ti,pruss-intc";
+					reg = <0x60000 0x2000>;
+					interrupt-controller;
+					#interrupt-cells = <3>;
+					interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "host_intr0", "host_intr1",
+							  "host_intr2", "host_intr3",
+							  "host_intr4",
+							  "host_intr6", "host_intr7";
+					ti,irqs-reserved = /bits/ 8 <0x20>; /* BIT(5) */
+				};
+
+				pru0_0: pru@74000 {
+					compatible = "ti,am4376-pru";
+					reg = <0x74000 0x1000>,
+					      <0x62000 0x400>,
+					      <0x62400 0x100>;
+					reg-names = "iram", "control", "debug";
+					firmware-name = "am437x-pru0_0-fw";
+				};
+
+				pru0_1: pru@78000 {
+					compatible = "ti,am4376-pru";
+					reg = <0x78000 0x1000>,
+					      <0x64000 0x400>,
+					      <0x64400 0x100>;
+					reg-names = "iram", "control", "debug";
+					firmware-name = "am437x-pru0_1-fw";
+				};
+			};
 		};
 
 		target-module@50000000 {
-- 
2.32.0

