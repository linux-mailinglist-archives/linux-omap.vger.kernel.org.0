Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A800238BA86
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 01:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbhETXpi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 19:45:38 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40120 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbhETXph (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 May 2021 19:45:37 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KNi3uE026575;
        Thu, 20 May 2021 18:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621554243;
        bh=XqSKglF8ZQD8BUh4sZO7keV9UTnI8a3Us9d+9oYhX+8=;
        h=From:To:CC:Subject:Date;
        b=mq5p8Sq2NT/kI51SqBQf7XMPaGNOFDQoPNRtvoMsgYxRimfCT8ojtVNQHxUJSpbt9
         Cp/5+MxQDLBCvdzbsuS+VPnw0nvG0b7iLCxg93SlQN0/jyvy26RJmr0BjG3c50I1x+
         38ld/4Yz99NrxIu7JZuBcm/xs9Z/c7yfSg8KfkgA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KNi3vg006590
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 May 2021 18:44:03 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 18:44:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 18:44:03 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KNi3jL012407;
        Thu, 20 May 2021 18:44:03 -0500
Received: from localhost ([10.250.32.40])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14KNi2od029973;
        Thu, 20 May 2021 18:44:02 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
CC:     Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2] dt-bindings: mailbox: Convert omap-mailbox.txt binding to YAML
Date:   Thu, 20 May 2021 18:43:48 -0500
Message-ID: <20210520234348.4479-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the current OMAP Mailbox binding from text format to YAML
format/DT schema, and delete the legacy text binding file.

The new YAML binding conversion is an updated version compared to
the original. The descriptions for certain properties have been
improved to provide more clarity. Constraints are added to the
properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
The 'ti,hwmods' is a legacy property and is retained only to reflect
the existing usage on some older OMAP2 and OMAP3 platforms.

All the existing examples have also been updated to reflect the
latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
and interrupts value updated for AM65x SoCs).

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Address Rob's comments
 - Replace definitions with $defs
 - Dropping the trailing | character after all description keywords
 - Marked ti,hwmods as deprecated
 - Updated #mbox-cells description
v1: 
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210518172022.10562-1-s-anna@ti.com/

Note that this would continue to generate the checkpatch warning
"DT binding docs and includes should be a separate patch" for the
deleted text file. The fixes for dtbs_check warnings on mailbox nodes
with this yaml file are posted as well, please see v1 patch for links.

regards
Suman

 .../bindings/mailbox/omap-mailbox.txt         | 184 -----------
 .../bindings/mailbox/ti,omap-mailbox.yaml     | 308 ++++++++++++++++++
 2 files changed, 308 insertions(+), 184 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
deleted file mode 100644
index 12371f5c6cd9..000000000000
--- a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
+++ /dev/null
@@ -1,184 +0,0 @@
-OMAP2+ and K3 Mailbox
-=====================
-
-The OMAP mailbox hardware facilitates communication between different processors
-using a queued mailbox interrupt mechanism. The IP block is external to the
-various processor subsystems and is connected on an interconnect bus. The
-communication is achieved through a set of registers for message storage and
-interrupt configuration registers.
-
-Each mailbox IP block/cluster has a certain number of h/w fifo queues and output
-interrupt lines. An output interrupt line is routed to an interrupt controller
-within a processor subsystem, and there can be more than one line going to a
-specific processor's interrupt controller. The interrupt line connections are
-fixed for an instance and are dictated by the IP integration into the SoC
-(excluding the SoCs that have a Interrupt Crossbar IP). Each interrupt line is
-programmable through a set of interrupt configuration registers, and have a rx
-and tx interrupt source per h/w fifo. Communication between different processors
-is achieved through the appropriate programming of the rx and tx interrupt
-sources on the appropriate interrupt lines.
-
-The number of h/w fifo queues and interrupt lines dictate the usable registers.
-All the current OMAP SoCs except for the newest DRA7xx SoC has a single IP
-instance. DRA7xx has multiple instances with different number of h/w fifo queues
-and interrupt lines between different instances. The interrupt lines can also be
-routed to different processor sub-systems on DRA7xx as they are routed through
-the Crossbar, a kind of interrupt router/multiplexer. The K3 AM65x and J721E
-SoCs has each of these instances form a cluster and combine multiple clusters
-into a single IP block present within the Main NavSS. The interrupt lines from
-all these clusters are multiplexed and routed to different processor subsystems
-over a limited number of common interrupt output lines of an Interrupt Router.
-The AM64x SoCS also uses a single IP block comprising of multiple clusters,
-but the number of clusters are smaller, and the interrupt output lines are
-connected directly to various processors.
-
-Mailbox Device Node:
-====================
-A Mailbox device node is used to represent a Mailbox IP instance/cluster within
-a SoC. The sub-mailboxes are represented as child nodes of this parent node.
-
-Required properties:
---------------------
-- compatible:		Should be one of the following,
-			    "ti,omap2-mailbox" for OMAP2420, OMAP2430 SoCs
-			    "ti,omap3-mailbox" for OMAP3430, OMAP3630 SoCs
-			    "ti,omap4-mailbox" for OMAP44xx, OMAP54xx, AM33xx,
-						   AM43xx and DRA7xx SoCs
-			    "ti,am654-mailbox" for K3 AM65x and J721E SoCs
-			    "ti,am64-mailbox" for K3 AM64x SoCs
-- reg:			Contains the mailbox register address range (base
-			address and length)
-- interrupts:		Contains the interrupt information for the mailbox
-			device. The format is dependent on which interrupt
-			controller the Mailbox device uses
-- #mbox-cells:		Common mailbox binding property to identify the number
-			of cells required for the mailbox specifier. Should be
-			1
-- ti,mbox-num-users:	Number of targets (processor devices) that the mailbox
-			device can interrupt
-- ti,mbox-num-fifos:	Number of h/w fifo queues within the mailbox IP block
-
-SoC-specific Required properties:
----------------------------------
-The following are mandatory properties for the OMAP architecture based SoCs
-only:
-- ti,hwmods:		Name of the hwmod associated with the mailbox. This
-			should be defined in the mailbox node only if the node
-			is not defined as a child node of a corresponding sysc
-			interconnect node.
-
-The following are mandatory properties for the K3 AM65x and J721E SoCs only:
-- interrupt-parent:	Should contain a phandle to the TI-SCI interrupt
-			controller node that is used to dynamically program
-			the interrupt routes between the IP and the main GIC
-			controllers. See the following binding for additional
-			details,
-			Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
-
-Child Nodes:
-============
-A child node is used for representing the actual sub-mailbox device that is
-used for the communication between the host processor and a remote processor.
-Each child node should have a unique node name across all the different
-mailbox device nodes.
-
-Required properties:
---------------------
-- ti,mbox-tx:		sub-mailbox descriptor property defining a Tx fifo
-- ti,mbox-rx:		sub-mailbox descriptor property defining a Rx fifo
-
-Sub-mailbox Descriptor Data
----------------------------
-Each of the above ti,mbox-tx and ti,mbox-rx properties should have 3 cells of
-data that represent the following:
-    Cell #1 (fifo_id) - mailbox fifo id used either for transmitting
-                        (ti,mbox-tx) or for receiving (ti,mbox-rx)
-    Cell #2 (irq_id)  - irq identifier index number to use from the parent's
-                        interrupts data. Should be 0 for most of the cases, a
-                        positive index value is seen only on mailboxes that have
-                        multiple interrupt lines connected to the MPU processor.
-    Cell #3 (usr_id)  - mailbox user id for identifying the interrupt line
-                        associated with generating a tx/rx fifo interrupt.
-
-Optional Properties:
---------------------
-- ti,mbox-send-noirq:   Quirk flag to allow the client user of this sub-mailbox
-                        to send messages without triggering a Tx ready interrupt,
-                        and to control the Tx ticker. Should be used only on
-                        sub-mailboxes used to communicate with WkupM3 remote
-                        processor on AM33xx/AM43xx SoCs.
-
-Mailbox Users:
-==============
-A device needing to communicate with a target processor device should specify
-them using the common mailbox binding properties, "mboxes" and the optional
-"mbox-names" (please see Documentation/devicetree/bindings/mailbox/mailbox.txt
-for details). Each value of the mboxes property should contain a phandle to the
-mailbox controller device node and an args specifier that will be the phandle to
-the intended sub-mailbox child node to be used for communication. The equivalent
-"mbox-names" property value can be used to give a name to the communication channel
-to be used by the client user.
-
-
-Example:
---------
-
-1. /* OMAP4 */
-mailbox: mailbox@4a0f4000 {
-	compatible = "ti,omap4-mailbox";
-	reg = <0x4a0f4000 0x200>;
-	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-	ti,hwmods = "mailbox";
-	#mbox-cells = <1>;
-	ti,mbox-num-users = <3>;
-	ti,mbox-num-fifos = <8>;
-	mbox_ipu: mbox_ipu {
-		ti,mbox-tx = <0 0 0>;
-		ti,mbox-rx = <1 0 0>;
-	};
-	mbox_dsp: mbox_dsp {
-		ti,mbox-tx = <3 0 0>;
-		ti,mbox-rx = <2 0 0>;
-	};
-};
-
-dsp {
-	...
-	mboxes = <&mailbox &mbox_dsp>;
-	...
-};
-
-2. /* AM33xx */
-mailbox: mailbox@480c8000 {
-	compatible = "ti,omap4-mailbox";
-	reg = <0x480C8000 0x200>;
-	interrupts = <77>;
-	ti,hwmods = "mailbox";
-	#mbox-cells = <1>;
-	ti,mbox-num-users = <4>;
-	ti,mbox-num-fifos = <8>;
-	mbox_wkupm3: wkup_m3 {
-		ti,mbox-tx = <0 0 0>;
-		ti,mbox-rx = <0 0 3>;
-	};
-};
-
-3. /* AM65x */
-&cbass_main {
-	cbass_main_navss: interconnect0 {
-		mailbox0_cluster0: mailbox@31f80000 {
-			compatible = "ti,am654-mailbox";
-			reg = <0x00 0x31f80000 0x00 0x200>;
-			#mbox-cells = <1>;
-			ti,mbox-num-users = <4>;
-			ti,mbox-num-fifos = <16>;
-			interrupt-parent = <&intr_main_navss>;
-			interrupts = <164 0>;
-
-			mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
-				ti,mbox-tx = <1 0 0>;
-				ti,mbox-rx = <0 0 0>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
new file mode 100644
index 000000000000..e864d798168d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -0,0 +1,308 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/ti,omap-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP2+ and K3 Mailbox devices
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |
+  The OMAP Mailbox hardware facilitates communication between different
+  processors using a queued mailbox interrupt mechanism. The IP block is
+  external to the various processor subsystems and is connected on an
+  interconnect bus. The communication is achieved through a set of registers
+  for message storage and interrupt configuration registers.
+
+  Each mailbox IP block/cluster has a certain number of h/w fifo queues and
+  output interrupt lines. An output interrupt line is routed to an interrupt
+  controller within a processor subsystem, and there can be more than one line
+  going to a specific processor's interrupt controller. The interrupt line
+  connections are fixed for an instance and are dictated by the IP integration
+  into the SoC (excluding the SoCs that have an Interrupt Crossbar or an
+  Interrupt Router IP). Each interrupt line is programmable through a set of
+  interrupt configuration registers, and have a rx and tx interrupt source per
+  h/w fifo. Communication between different processors is achieved through the
+  appropriate programming of the rx and tx interrupt sources on the appropriate
+  interrupt lines.
+
+  The number of h/w fifo queues and interrupt lines dictate the usable
+  registers. All the current OMAP SoCs except for the newest DRA7xx SoC has a
+  single IP instance. DRA7xx has multiple instances with different number of
+  h/w fifo queues and interrupt lines between different instances. The interrupt
+  lines can also be routed to different processor sub-systems on DRA7xx as they
+  are routed through the Crossbar, a kind of interrupt router/multiplexer. The
+  K3 AM65x, J721E and J7200 SoCs has each of these instances form a cluster and
+  combine multiple clusters into a single IP block present within the Main
+  NavSS. The interrupt lines from all these clusters are multiplexed and routed
+  to different processor subsystems over a limited number of common interrupt
+  output lines of an Interrupt Router. The AM64x SoCS also uses a single IP
+  block comprising of multiple clusters, but the number of clusters are
+  smaller, and the interrupt output lines are connected directly to various
+  processors.
+
+  Mailbox Controller Nodes
+  =========================
+  A Mailbox device node is used to represent a Mailbox IP instance/cluster
+  within a SoC. The sub-mailboxes (actual communication channels) are
+  represented as child nodes of this parent node.
+
+  Mailbox Users
+  ==============
+  A device needing to communicate with a target processor device should specify
+  them using the common mailbox binding properties, "mboxes" and the optional
+  "mbox-names" (please see Documentation/devicetree/bindings/mailbox/mailbox.txt
+  for details). Each value of the mboxes property should contain a phandle to
+  the mailbox controller device node and an args specifier that will be the
+  phandle to the intended sub-mailbox child node to be used for communication.
+  The equivalent "mbox-names" property value can be used to give a name to the
+  communication channel to be used by the client user.
+
+$defs:
+  omap-mbox-descriptor:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      The omap-mbox-descriptor is made of up of 3 cells and represents a single
+      uni-directional communication channel. A typical sub-mailbox device uses
+      two such channels - one for transmitting (Tx) and one for receiving (Rx).
+    items:
+      - description:
+          mailbox fifo id used either for transmitting on ti,mbox-tx channel or
+          for receiving on ti,mbox-rx channel (fifo_id). This is the hardware
+          fifo number within a mailbox cluster.
+      - description:
+          irq identifier index number to use from the parent's interrupts data.
+          Should be 0 for most of the cases, a positive index value is seen only
+          on mailboxes that have multiple interrupt lines connected to the MPU
+          processor (irq_id). This is an index number in the listed interrupts
+          property in the DT nodes.
+      - description:
+          mailbox user id for identifying the interrupt line associated with
+          generating a tx/rx fifo interrupt (usr_id). This is the hardware
+          user id number within a mailbox cluster.
+
+  omap-sub-mailbox:
+    type: object
+    description:
+      The omap-sub-mailbox is a child node within a Mailbox controller device
+      node and represents the actual communication channel used to send and
+      receive messages between the host processor and a remote processor. Each
+      child node should have a unique node name across all the different mailbox
+      device nodes.
+
+    properties:
+      ti,mbox-tx:
+        $ref: "#/$defs/omap-mbox-descriptor"
+        description: sub-mailbox descriptor property defining a Tx fifo.
+
+      ti,mbox-rx:
+        $ref: "#/$defs/omap-mbox-descriptor"
+        description: sub-mailbox descriptor property defining a Rx fifo.
+
+      ti,mbox-send-noirq:
+        type: boolean
+        description:
+          Quirk flag to allow the client user of this sub-mailbox to send
+          messages without triggering a Tx ready interrupt, and to control
+          the Tx ticker. Should be used only on sub-mailboxes used to
+          communicate with WkupM3 remote processor on AM33xx/AM43xx SoCs.
+
+    required:
+      - ti,mbox-tx
+      - ti,mbox-rx
+
+properties:
+  compatible:
+    enum:
+      - ti,omap2-mailbox # for OMAP2420, OMAP2430 SoCs
+      - ti,omap3-mailbox # for OMAP3430, OMAP3630 SoCs
+      - ti,omap4-mailbox # for OMAP44xx, OMAP54xx, AM33xx, AM43xx and DRA7xx SoCs
+      - ti,am654-mailbox # for K3 AM65x, J721E and J7200 SoCs
+      - ti,am64-mailbox  # for K3 AM64x SoCs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Contains the interrupt information for the mailbox device. The format is
+      dependent on which interrupt controller the Mailbox device uses. The
+      number of interrupts listed will at most be the value specified in
+      ti,mbox-num-users property, but is usually limited by the number of
+      interrupts reaching the main processor. An interrupt-parent property
+      is required on SoCs where the interrupt lines are connected through a
+      Interrupt Router before reaching the main processor's GIC.
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The specifier is a phandle to an omap-sub-mailbox device.
+
+  ti,mbox-num-users:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of targets (processor devices) that the mailbox device can
+      interrupt.
+
+  ti,mbox-num-fifos:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of h/w fifo queues within the mailbox IP block.
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+    description:
+      Name of the hwmod associated with the mailbox. This should be defined
+      in the mailbox node only if the node is not defined as a child node of
+      a corresponding sysc interconnect node.
+
+      This property is only needed on some legacy OMAP SoCs which have not
+      yet been converted to the ti,sysc interconnect hierarachy, but is
+      otherwise considered obsolete.
+
+patternProperties:
+  "^mbox-[a-z0-9-]+$":
+    $ref: "#/$defs/omap-sub-mailbox"
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+  - ti,mbox-num-users
+  - ti,mbox-num-fifos
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,am654-mailbox
+    then:
+      required:
+        - interrupt-parent
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,am654-mailbox
+            - ti,am64-mailbox
+    then:
+      properties:
+        ti,mbox-num-users:
+          const: 4
+        ti,mbox-num-fifos:
+          const: 16
+        interrupts:
+          minItems: 1
+          maxItems: 4
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,omap4-mailbox
+    then:
+      properties:
+        ti,mbox-num-users:
+          enum: [3, 4]
+        ti,mbox-num-fifos:
+          enum: [8, 12]
+        interrupts:
+          minItems: 1
+          maxItems: 4
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,omap3-mailbox
+    then:
+      properties:
+        ti,mbox-num-users:
+          const: 2
+        ti,mbox-num-fifos:
+          const: 2
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,omap2-mailbox
+    then:
+      properties:
+        ti,mbox-num-users:
+          const: 4
+        ti,mbox-num-fifos:
+          const: 6
+        interrupts:
+          minItems: 1
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    /* OMAP4 */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mailbox: mailbox@4a0f4000 {
+        compatible = "ti,omap4-mailbox";
+        reg = <0x4a0f4000 0x200>;
+        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+        ti,mbox-num-users = <3>;
+        ti,mbox-num-fifos = <8>;
+
+        mbox_ipu: mbox-ipu {
+            ti,mbox-tx = <0 0 0>;
+            ti,mbox-rx = <1 0 0>;
+        };
+        mbox_dsp: mbox-dsp {
+            ti,mbox-tx = <3 0 0>;
+            ti,mbox-rx = <2 0 0>;
+        };
+    };
+
+    dsp {
+        mboxes = <&mailbox &mbox_dsp>;
+    };
+
+  - |
+    /* AM33xx */
+    mailbox1: mailbox@480c8000 {
+        compatible = "ti,omap4-mailbox";
+        reg = <0x480c8000 0x200>;
+        interrupts = <77>;
+        #mbox-cells = <1>;
+        ti,mbox-num-users = <4>;
+        ti,mbox-num-fifos = <8>;
+
+        mbox_wkupm3: mbox-wkup-m3 {
+            ti,mbox-tx = <0 0 0>;
+            ti,mbox-rx = <0 0 3>;
+            ti,mbox-send-noirq;
+        };
+    };
+
+  - |
+    /* AM65x */
+    mailbox0_cluster0: mailbox@31f80000 {
+        compatible = "ti,am654-mailbox";
+        reg = <0x31f80000 0x200>;
+        #mbox-cells = <1>;
+        ti,mbox-num-users = <4>;
+        ti,mbox-num-fifos = <16>;
+        interrupt-parent = <&intr_main_navss>;
+        interrupts = <436>;
+
+        mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
+            ti,mbox-tx = <1 0 0>;
+            ti,mbox-rx = <0 0 0>;
+        };
+    };
-- 
2.30.1

