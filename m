Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2BB619A3
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 05:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbfGHDx7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 7 Jul 2019 23:53:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39818 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728958AbfGHDx7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 7 Jul 2019 23:53:59 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x683qkKH073380;
        Sun, 7 Jul 2019 22:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562557966;
        bh=EcFLJFC2+wvayMjqstbhNZltmYBb5S5lX7Fn2k8pbl0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mTMxLCa/fwW2j/kg1ssLNIzmpF7ibPiqLDHvf4TWz8rRFUGFABerB8tIfkNEWbCx3
         D11kqcIy0uucnGLzcW8O7/at4tj5/xinfYjz7hv9Qc/GjhhHv9Y33Bi6vGtK6rvhuV
         UXkyTwvcD+1qWUV/HaIFOZStDT7xOFW/Pn7R/P+E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x683qkfh016576
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 7 Jul 2019 22:52:46 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 7 Jul
 2019 22:52:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 7 Jul 2019 22:52:45 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x683qjDX026300;
        Sun, 7 Jul 2019 22:52:45 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x683qjm26433;
        Sun, 7 Jul 2019 22:52:45 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/6] dt-bindings: irqchip: Add PRUSS interrupt controller bindings
Date:   Sun, 7 Jul 2019 22:52:38 -0500
Message-ID: <20190708035243.12170-2-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708035243.12170-1-s-anna@ti.com>
References: <20190708035243.12170-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Programmable Real-Time Unit Subsystem (PRUSS) contains an interrupt
controller (INTC) that can handle various system input events and post
interrupts back to the device-level initiators. The INTC can support
upto 64 input events on most SoCs with individual control configuration
and hardware prioritization. These events are mapped onto 10 interrupt
lines through two levels of many-to-one mapping support. Different
interrupt lines are routed to the individual PRU cores or to the
host CPU or to other PRUSS instances.

The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
commonly called ICSSG. The ICSSG interrupt controller on K3 SoCs provide
a higher number of host interrupts (20 vs 10) and can handle an increased
number of input events (160 vs 64) from various SoC interrupt sources.

Add the bindings document for these interrupt controllers on all the
applicable SoCs. It covers the OMAP architecture SoCs - AM33xx, AM437x
and AM57xx; the Keystone 2 architecture based 66AK2G SoC; the Davinci
architecture based OMAPL138 SoCs, and the K3 architecture based AM65x
and J721E SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
Prior version: https://patchwork.kernel.org/patch/10795771/

 .../interrupt-controller/ti,pruss-intc.txt    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
new file mode 100644
index 000000000000..020073c07a92
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.txt
@@ -0,0 +1,92 @@
+PRU ICSS INTC on TI SoCs
+========================
+
+Each PRUSS has a single interrupt controller instance that is common to both
+the PRU cores. Most interrupt controllers can route 64 input events which are
+then mapped to 10 possible output interrupts through two levels of mapping.
+The input events can be triggered by either the PRUs and/or various other
+PRUSS internal and external peripherals. The first 2 output interrupts are
+fed exclusively to the internal PRU cores, with the remaining 8 (2 through 9)
+connected to external interrupt controllers including the MPU and/or other
+PRUSS instances, DSPs or devices.
+
+The K3 family of SoCs can handle 160 input events that can be mapped to 20
+different possible output interrupts. The additional output interrupts (10
+through 19) are connected to new sub-modules within the ICSSG instances.
+
+This interrupt-controller node should be defined as a child node of the
+corresponding PRUSS node. The node should be named "interrupt-controller".
+Please see the overall PRUSS bindings document for additional details
+including a complete example,
+    Documentation/devicetree/bindings/soc/ti/ti,pruss.txt
+
+Required Properties:
+--------------------
+- compatible           : should be one of the following,
+                             "ti,pruss-intc" for OMAP-L13x/AM18x/DA850 SoCs,
+                                                 AM335x family of SoCs,
+                                                 AM437x family of SoCs,
+                                                 AM57xx family of SoCs
+                                                 66AK2G family of SoCs
+                             "ti,icssg-intc" for K3 AM65x & J721E family of SoCs
+- reg                  : base address and size for the PRUSS INTC sub-module
+- interrupts           : all the interrupts generated towards the main host
+                         processor in the SoC. The format depends on the
+                         interrupt specifier for the particular SoC's ARM GIC
+                         parent interrupt controller. A shared interrupt can
+                         be skipped if the desired destination and usage is by
+                         a different processor/device.
+- interrupt-names      : should use one of the following names for each valid
+                         interrupt connected to ARM GIC, the name should match
+                         the corresponding host interrupt number,
+                             "host0", "host1", "host2", "host3", "host4",
+                             "host5", "host6" or "host7"
+- interrupt-controller : mark this node as an interrupt controller
+- #interrupt-cells     : should be 1. Client users shall use the PRU System
+                         event number (the interrupt source that the client
+                         is interested in) as the value of the interrupts
+                         property in their node
+
+Optional Properties:
+--------------------
+The following properties are _required_ only for some SoCs. If none of the below
+properties are defined, it implies that all the host interrupts 2 through 9 are
+connected exclusively to the ARM GIC.
+
+- ti,irqs-reserved     : an array of 8-bit elements of host interrupts between
+                         0 and 7 (corresponding to PRUSS INTC output interrupts
+                         2 through 9) that are not connected to the ARM GIC.
+                           Eg: AM437x and 66AK2G SoCs do not have "host5"
+                               interrupt connected to MPU
+- ti,irqs-shared       : an array of 8-bit elements of host interrupts between
+                         0 and 7 (corresponding to PRUSS INTC output interrupts
+                         2 through 9) that are also connected to other devices
+                         or processors in the SoC.
+                           Eg: AM65x and J721E SoCs have "host5", "host6" and
+                               "host7" interrupts connected to MPU, and other
+                               ICSSG instances
+
+
+Example:
+--------
+
+1.	/* AM33xx PRU-ICSS */
+	pruss: pruss@0 {
+		compatible = "ti,am3356-pruss";
+		reg = <0x0 0x80000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		...
+
+		pruss_intc: interrupt-controller@20000 {
+			compatible = "ti,pruss-intc";
+			reg = <0x20000 0x2000>;
+			interrupts = <20 21 22 23 24 25 26 27>;
+			interrupt-names = "host0", "host1", "host2",
+					  "host3", "host4", "host5",
+					  "host6", "host7";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			ti,irqs-shared = /bits/ 8 <0 6 7>;
+		};
+	};
-- 
2.22.0

