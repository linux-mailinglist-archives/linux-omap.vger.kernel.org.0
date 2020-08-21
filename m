Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE83424D78A
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 16:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgHUOog (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Aug 2020 10:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgHUOoZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 10:44:25 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E54FC061795
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:24 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id s9so1043724lfs.4
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F3QgkOxvUOv2uoXK2jia9w2DTNKIt/enPriKnSEb8Kk=;
        b=d/52J5Ls5w/PrP6x/PATX9upcVCXm2pTK5QLqXrgJfdt3lsblb81ih7bdagqs/pI0y
         +By0GjaElhAqdoT9KvclO3/QwCljGOtCgfx8NORNLWJYq4Ew6e4X4EwMzMVO+t/w44Sv
         ALcH5epnSyfU/2R1jrs+EOrTlThHK4WeLGtg0TXcJsiaVVciSV030ZB/T0vkYUYpSLcc
         9E2dapJtx8R0GW2E1WSA+L0uRkwLJklKTuJXupTm3N8qsVb5iAo/15SNa5mAHVQRhtUW
         9mhWMN9OP3wNWKhN0wMUYgjvfHmwlzPCw1Pu6RsZG8C2rvYXNqKlQOpolBk0auJKyXtv
         bqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F3QgkOxvUOv2uoXK2jia9w2DTNKIt/enPriKnSEb8Kk=;
        b=gRpiafYlToVHpoYEd6elh+v7TlUy4BthWjVLwMQSjJgfBANHkOEvv1eNdm9lOmZ+tB
         LoKcWUC0rh5dulhsKNblF7N3VQNe1r81hLf/VhlqQh+Rk1wirFy2cVu9pJD1UYS8IJC5
         DXkzXB2JiiXgR0gj+4IkkkeRLGrO/igUde8JmUgdvmyP0damy+k2xlvT4wo7e0xuNJuz
         PvMOYMjVhzidGxaz7QFniPJMPuRWLz9zOHuPmnH2zwgAOtVC5dn71c3roZoBKGSMBxbA
         mX+ErUniR1fDkuomrqJzTs7K/LrMpO9GANwmD6fHbNqum0OA3oSExnJ1HY2bbnHn8ZLI
         DMCw==
X-Gm-Message-State: AOAM533/Hk55EX3MHsn8T5C6tcRUpZ5ge23bnDBKBvKRFNZCnHdkIgpz
        D1Mw5c1UXzR1FbMG01qTelW9vw==
X-Google-Smtp-Source: ABdhPJytRNIzgHgIle7z5DMWMhjbsC400dKsIIcn6m0B9k3ZlmuOBVy3zfJhS2/qziM+FtNayYON5w==
X-Received: by 2002:a19:c752:: with SMTP id x79mr1495379lff.197.1598021062291;
        Fri, 21 Aug 2020 07:44:22 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:21 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 1/7] dt-bindings: soc: ti: Add TI PRUSS bindings
Date:   Fri, 21 Aug 2020 16:42:38 +0200
Message-Id: <1598020964-29877-2-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch adds the bindings for the Programmable Real-Time Unit
and Industrial Communication Subsystem (PRU-ICSS) present on various
TI SoCs. The IP is present on multiple TI SoC architecture families
including the OMAP architecture SoCs such as AM33xx, AM437x and
AM57xx; and on a Keystone 2 architecture based 66AK2G SoC. It is
also present on the Davinci based OMAPL138 SoCs and K3 architecture
based AM65x and J721E SoCs as well.

The IP has a number of sub-modules some of which are represented as
their own devices. This binding covers only the top-level sub-system
devices, and some sub-modules like MDIO, MII_RT (Ethernet MII_RT module
with MII ports) and IEP (Industrial Ethernet Peripheral). The remaining
sub-modules bindings shall be defined in the respective driver
subsystem bindings folders. Couple of full examples have also been
added demonstrating the devices on AM335x and AM437x SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1-v2 (requested by Rob):
- Add unit address pattern for all sub-nodes.
- Add "additionalProperties: false" to all sub-nodes and entire
  description. This allow to catch and fix some issues like missing
  "#address-cells" property description.
- Drop ranges description.
- Fix compatible name in example binding for AM43xx.
- Drop the *.yaml references from description as they are not merged yet
  and therefore they can't be converted to $ref.
- Drop reviewed-by tag due to introduced changes.
---
 .../devicetree/bindings/soc/ti/ti,pruss.yaml       | 320 +++++++++++++++++++++
 1 file changed, 320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
new file mode 100644
index 0000000..a13e4df
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -0,0 +1,320 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: |+
+  TI Programmable Real-Time Unit and Industrial Communication Subsystem
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |+
+
+  The Programmable Real-Time Unit and Industrial Communication Subsystem
+  (PRU-ICSS a.k.a. PRUSS) is present on various TI SoCs such as AM335x, AM437x,
+  Keystone 66AK2G, OMAP-L138/DA850 etc. A PRUSS consists of dual 32-bit RISC
+  cores (Programmable Real-Time Units, or PRUs), shared RAM, data and
+  instruction RAMs, some internal peripheral modules to facilitate industrial
+  communication, and an interrupt controller.
+
+  The programmable nature of the PRUs provide flexibility to implement custom
+  peripheral interfaces, fast real-time responses, or specialized data handling.
+  The common peripheral modules include the following,
+    - an Ethernet MII_RT module with two MII ports
+    - an MDIO port to control external Ethernet PHYs
+    - an Industrial Ethernet Peripheral (IEP) to manage/generate Industrial
+      Ethernet functions
+    - an Enhanced Capture Module (eCAP)
+    - an Industrial Ethernet Timer with 7/9 capture and 16 compare events
+    - a 16550-compatible UART to support PROFIBUS
+    - Enhanced GPIO with async capture and serial support
+
+  A PRU-ICSS subsystem can have up to three shared data memories. A PRU core
+  acts on a primary Data RAM (there are usually 2 Data RAMs) at its address
+  0x0, but also has access to a secondary Data RAM (primary to the other PRU
+  core) at its address 0x2000. A shared Data RAM, if present, can be accessed
+  by both the PRU cores. The Interrupt Controller (INTC) and a CFG module are
+  common to both the PRU cores. Each PRU core also has a private instruction
+  RAM, and specific register spaces for Control and Debug functionalities.
+
+  Various sub-modules within a PRU-ICSS subsystem are represented as individual
+  nodes and are defined using a parent-child hierarchy depending on their
+  integration within the IP and the SoC. These nodes are described in the
+  following sections.
+
+
+  PRU-ICSS Node
+  ==============
+  Each PRU-ICSS instance is represented as its own node with the individual PRU
+  processor cores, the memories node, an INTC node and an MDIO node represented
+  as child nodes within this PRUSS node. This node shall be a child of the
+  corresponding interconnect bus nodes or target-module nodes.
+
+  See ../../mfd/syscon.yaml for generic SysCon binding details.
+
+
+properties:
+  $nodename:
+    pattern: "^(pruss|icssg)@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - ti,am3356-pruss  # for AM335x SoC family
+      - ti,am4376-pruss0 # for AM437x SoC family and PRUSS unit 0
+      - ti,am4376-pruss1 # for AM437x SoC family and PRUSS unit 1
+      - ti,am5728-pruss  # for AM57xx SoC family
+      - ti,k2g-pruss     # for 66AK2G SoC family
+      - ti,am654-icssg   # for K3 AM65x SoC family
+      - ti,j721e-icssg   # for K3 J721E SoC family
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    maxItems: 1
+
+  power-domains:
+    description: |
+      This property is as per sci-pm-domain.txt.
+
+patternProperties:
+
+  memories@[a-f0-9]+$:
+    description: |
+      The various Data RAMs within a single PRU-ICSS unit are represented as a
+      single node with the name 'memories'.
+
+    type: object
+
+    properties:
+      reg:
+        minItems: 2 # On AM437x one of two PRUSS units don't contain Shared RAM.
+        maxItems: 3
+        items:
+          - description: Address and size of the Data RAM0.
+          - description: Address and size of the Data RAM1.
+          - description: |
+              Address and size of the Shared Data RAM. Note that on AM437x one
+              of two PRUSS units don't contain Shared RAM, while the second one
+              has it.
+
+      reg-names:
+        minItems: 2
+        maxItems: 3
+        items:
+          - const: dram0
+          - const: dram1
+          - const: shrdram2
+
+    required:
+      - reg
+      - reg-names
+
+    additionalProperties: false
+
+  cfg@[a-f0-9]+$:
+    description: |
+      PRU-ICSS configuration space. CFG sub-module represented as a SysCon.
+
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - const: ti,pruss-cfg
+          - const: syscon
+
+      reg:
+        maxItems: 1
+
+    additionalProperties: false
+
+  iep@[a-f0-9]+$:
+    description: |
+      Industrial Ethernet Peripheral to manage/generate Industrial Ethernet
+      functions such as time stamping. Each PRUSS has either 1 IEP (on AM335x,
+      AM437x, AM57xx & 66AK2G SoCs) or 2 IEPs (on K3 AM65x & J721E SoCs ). IEP
+      is used for creating PTP clocks and generating PPS signals.
+
+    type: object
+
+  mii-rt@[a-f0-9]+$:
+    description: |
+      Real-Time Ethernet to support multiple industrial communication protocols.
+      MII-RT sub-module represented as a SysCon.
+
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - const: ti,pruss-mii
+          - const: syscon
+
+      reg:
+        maxItems: 1
+
+    additionalProperties: false
+
+  mii-g-rt@[a-f0-9]+$:
+    description: |
+      The Real-time Media Independent Interface to support multiple industrial
+      communication protocols (G stands for Gigabit). MII-G-RT sub-module
+      represented as a SysCon.
+
+    type: object
+
+    properties:
+      compatible:
+        items:
+          - const: ti,pruss-mii-g
+          - const: syscon
+
+      reg:
+        maxItems: 1
+
+    additionalProperties: false
+
+  interrupt-controller@[a-f0-9]+$:
+    description: |
+      PRUSS INTC Node. Each PRUSS has a single interrupt controller instance
+      that is common to all the PRU cores. This should be represented as an
+      interrupt-controller node.
+
+    type: object
+
+  mdio@[a-f0-9]+$:
+    description: |
+      MDIO Node. Each PRUSS has an MDIO module that can be used to control
+      external PHYs. The MDIO module used within the PRU-ICSS is an instance of
+      the MDIO Controller used in TI Davinci SoCs.
+
+    allOf:
+      - $ref: /schemas/net/ti,davinci-mdio.yaml#
+
+    type: object
+
+  "^(pru|rtu|txpru)@[0-9a-f]+$":
+    description: |
+      PRU Node. Each PRUSS has dual PRU cores, each represented as a RemoteProc
+      device through a PRU child node each. Each node can optionally be rendered
+      inactive by using the standard DT string property, "status". The ICSSG IP
+      present on K3 SoCs have additional auxiliary PRU cores with slightly
+      different IP integration.
+
+    type: object
+
+required:
+  - compatible
+  - reg
+  - ranges
+
+additionalProperties: false
+
+# Due to inability of correctly verifying sub-nodes with an @address through
+# the "required" list, the required sub-nodes below are commented out for now.
+
+#required:
+# - memories
+# - interrupt-controller
+# - pru
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ti,k2g-pruss
+          - ti,am654-icssg
+          - ti,j721e-icssg
+then:
+  required:
+    - power-domains
+
+examples:
+  - |
+
+    /* Example 1 AM33xx PRU-ICSS */
+    pruss: pruss@0 {
+        compatible = "ti,am3356-pruss";
+        reg = <0x0 0x80000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        pruss_mem: memories@0 {
+            reg = <0x0 0x2000>,
+                  <0x2000 0x2000>,
+                  <0x10000 0x3000>;
+            reg-names = "dram0", "dram1", "shrdram2";
+        };
+
+        pruss_cfg: cfg@26000 {
+            compatible = "ti,pruss-cfg", "syscon";
+            reg = <0x26000 0x2000>;
+        };
+
+        pruss_mii_rt: mii-rt@32000 {
+            compatible = "ti,pruss-mii", "syscon";
+            reg = <0x32000 0x58>;
+        };
+
+        pruss_mdio: mdio@32400 {
+            compatible = "ti,davinci_mdio";
+            reg = <0x32400 0x90>;
+            clocks = <&dpll_core_m4_ck>;
+            clock-names = "fck";
+            bus_freq = <1000000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
+  - |
+
+    /* Example 2 AM43xx PRU-ICSS with PRUSS1 node */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pruss1: pruss@0 {
+        compatible = "ti,am4376-pruss1";
+        reg = <0x0 0x40000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        pruss1_mem: memories@0 {
+            reg = <0x0 0x2000>,
+                  <0x2000 0x2000>,
+                  <0x10000 0x8000>;
+            reg-names = "dram0", "dram1", "shrdram2";
+        };
+
+        pruss1_cfg: cfg@26000 {
+            compatible = "ti,pruss-cfg", "syscon";
+            reg = <0x26000 0x2000>;
+        };
+
+        pruss1_mii_rt: mii-rt@32000 {
+            compatible = "ti,pruss-mii", "syscon";
+            reg = <0x32000 0x58>;
+        };
+
+        pruss1_mdio: mdio@32400 {
+            compatible = "ti,davinci_mdio";
+            reg = <0x32400 0x90>;
+            clocks = <&dpll_core_m4_ck>;
+            clock-names = "fck";
+            bus_freq = <1000000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
+...
-- 
2.7.4

