Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96F0257BEB
	for <lists+linux-omap@lfdr.de>; Mon, 31 Aug 2020 17:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgHaPMm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 Aug 2020 11:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbgHaPJu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 Aug 2020 11:09:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062D1C06123A
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:49 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d2so3702792lfj.1
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u1zTkqnTP0QEq+fQsoM32Ydh1bc33d0QaswgtNicndw=;
        b=uZp/F6+Oc7l2UmeyMM+s8Jku1mVMjgfRtc5h4Pj6NGyBVn6ANuV9WG7IoiaoymkXzg
         QLNR6ypBLRAvSCrhtNAUu8EBnOXxoGftQVGt/AK2U2XZ8bVS6x2CH10tr9E6cDTVbHpL
         m+ttwY+36PImaWy4UmuEfL3hkZA4E3HJj3vE9vcYqB60KFYt61wHt9ZJNfjxtwR3VDaE
         ZV4RdxsPh7LWODgjiyEsHW9bkIESAYF3XvN1SNTHxKR/malFzVxZQN4HxI/EQ7jjMmrf
         BfHNIYf7ZCCHz7r8DtQRCgUS1NV14Jc5byoIJWt7NsGsgBzDaNOIN7eu+0KsZeLD9Wgd
         PtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u1zTkqnTP0QEq+fQsoM32Ydh1bc33d0QaswgtNicndw=;
        b=WKX1TGj1gBYIu8XiJfsiCtvfbrK6jlOdd54iLAyCQYFV0UVl6P0lgosEjKiIY2NxrK
         OD3TeG9bOAHleM7kt/B27QVwvrCn3O3bv64YfcJZeXcHJLZkDsQwUrhX2vXnKiYmaOIq
         ZLOYIQijV1mupBEam4ffYnp/LaUkl+Odtv+fTeGXxKW3+ScQjLYAJR0krQOPsfBPYWjF
         N5lP0zdtsaPcqM5O+iSx54UeQT8SJK9Pbn/YlRx57V+zo/CiMa9P6/6ufdadxA049R11
         JLbm8nbSuPErGxE04F6RLwDGarqNCd21hlNrSQQcvdf+rQaYMXAAVks/CPGrPLo/1wcR
         NloA==
X-Gm-Message-State: AOAM533ccKRptzfEfHI9VMhbNgSm4QiPHXLP+JasOYmipo2um8RBhQGz
        b2zrFTER6MMuM6Rwlo/C98Rn3XZkXkDMug==
X-Google-Smtp-Source: ABdhPJyzyoDJsB0+4jFruNy089wLDcNsdyQH4/dwqx6YFfSXadQTZZM/ZmYYg0BSMb/14311XHSOgg==
X-Received: by 2002:a19:cca:: with SMTP id 193mr912211lfm.208.1598886587342;
        Mon, 31 Aug 2020 08:09:47 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w6sm2034388lfn.73.2020.08.31.08.09.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 08:09:46 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Subject: [RESEND PATCH v5 1/5] dt-bindings: irqchip: Add PRU-ICSS interrupt controller bindings
Date:   Mon, 31 Aug 2020 17:09:14 +0200
Message-Id: <1598886558-16546-2-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Programmable Real-Time Unit and Industrial Communication Subsystem
(PRU-ICSS or simply PRUSS) contains an interrupt controller (INTC) that
can handle various system input events and post interrupts back to the
device-level initiators. The INTC can support up to 64 input events on
most SoCs with individual control configuration and h/w prioritization.
These events are mapped onto 10 output interrupt lines through two levels
of many-to-one mapping support. Different interrupt lines are routed to
the individual PRU cores or to the host CPU or to other PRUSS instances.

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
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4->v5:
- Fix typo in commit description.
- Update interrupt-cells description regarding each cells meaning.
v3->v4:
- Drop allOf references to interrupt-controller.yaml and
  interrupts.yaml.
- Drop items descriptions and use only maxItems: 1 as suggested by Rob.
- Convert irqs-reserved property from uint8-array to bitmask.
- Minor descriptions updates.
- Change interrupt-cells to 3 in order to provide 2-level mapping
  description for interrupts routed to the main CPU (as Marc requested).
- Merge the irqs-reserved and irqs-shared to one property since they
  can be handled by one logic.
- Drop reviewed-by due to introduced changes.
- Add another example illustrating irqs-reserved property usage.
v2->v3:
- Convert dt-binding to YAML
v1->v2:
- https://patchwork.kernel.org/patch/11069767/
---
 .../interrupt-controller/ti,pruss-intc.yaml        | 158 +++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
new file mode 100644
index 0000000..bbf79d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ti,pruss-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI PRU-ICSS Local Interrupt Controller
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |
+  Each PRU-ICSS has a single interrupt controller instance that is common
+  to all the PRU cores. Most interrupt controllers can route 64 input events
+  which are then mapped to 10 possible output interrupts through two levels
+  of mapping. The input events can be triggered by either the PRUs and/or
+  various other PRUSS internal and external peripherals. The first 2 output
+  interrupts (0, 1) are fed exclusively to the internal PRU cores, with the
+  remaining 8 (2 through 9) connected to external interrupt controllers
+  including the MPU and/or other PRUSS instances, DSPs or devices.
+
+  The property "ti,irqs-reserved" is used for denoting the connection
+  differences on the output interrupts 2 through 9. If this property is not
+  defined, it implies that all the PRUSS INTC output interrupts 2 through 9
+  (host_intr0 through host_intr7) are connected exclusively to the Arm interrupt
+  controller.
+
+  The K3 family of SoCs can handle 160 input events that can be mapped to 20
+  different possible output interrupts. The additional output interrupts (10
+  through 19) are connected to new sub-modules within the ICSSG instances.
+
+  This interrupt-controller node should be defined as a child node of the
+  corresponding PRUSS node. The node should be named "interrupt-controller".
+
+properties:
+  compatible:
+    enum:
+      - ti,pruss-intc
+      - ti,icssg-intc
+    description: |
+      Use "ti,pruss-intc" for OMAP-L13x/AM18x/DA850 SoCs,
+                              AM335x family of SoCs,
+                              AM437x family of SoCs,
+                              AM57xx family of SoCs
+                              66AK2G family of SoCs
+      Use "ti,icssg-intc" for K3 AM65x & J721E family of SoCs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 8
+    description: |
+      All the interrupts generated towards the main host processor in the SoC.
+      A shared interrupt can be skipped if the desired destination and usage is
+      by a different processor/device.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      pattern: host_intr[0-7]
+    description: |
+      Should use one of the above names for each valid host event interrupt
+      connected to Arm interrupt controller, the name should match the
+      corresponding host event interrupt number.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+    description: |
+      Client users shall use the PRU System event number (the interrupt source
+      that the client is interested in) [cell 1], PRU channel [cell 2] and PRU
+      host_event (target) [cell 3] as the value of the interrupts property in
+      their node.  The system events can be mapped to some output host
+      interrupts through 2 levels of many-to-one mapping i.e. events to channel
+      mapping and channels to host interrupts so through this property entire
+      mapping is provided.
+
+  ti,irqs-reserved:
+    $ref: /schemas/types.yaml#definitions/uint8
+    description: |
+      Bitmask of host interrupts between 0 and 7 (corresponding to PRUSS INTC
+      output interrupts 2 through 9) that are not connected to the Arm interrupt
+      controller or are shared and used by other devices or processors in the
+      SoC. Define this property when any of 8 interrupts should not be handled
+      by Arm interrupt controller.
+        Eg: - AM437x and 66AK2G SoCs do not have "host_intr5" interrupt
+              connected to MPU
+            - AM65x and J721E SoCs have "host_intr5", "host_intr6" and
+              "host_intr7" interrupts connected to MPU, and other ICSSG
+              instances.
+
+required:
+ - compatible
+ - reg
+ - interrupts
+ - interrupt-names
+ - interrupt-controller
+ - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    /* AM33xx PRU-ICSS */
+    pruss: pruss@0 {
+        compatible = "ti,am3356-pruss";
+        reg = <0x0 0x80000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        pruss_intc: interrupt-controller@20000 {
+            compatible = "ti,pruss-intc";
+            reg = <0x20000 0x2000>;
+            interrupts = <20 21 22 23 24 25 26 27>;
+            interrupt-names = "host_intr0", "host_intr1",
+                              "host_intr2", "host_intr3",
+                              "host_intr4", "host_intr5",
+                              "host_intr6", "host_intr7";
+            interrupt-controller;
+            #interrupt-cells = <3>;
+        };
+    };
+
+  - |
+
+    /* AM4376 PRU-ICSS */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pruss@0 {
+        compatible = "ti,am4376-pruss";
+        reg = <0x0 0x40000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        interrupt-controller@20000 {
+            compatible = "ti,pruss-intc";
+            reg = <0x20000 0x2000>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "host_intr0", "host_intr1",
+                              "host_intr2", "host_intr3",
+                              "host_intr4",
+                              "host_intr6", "host_intr7";
+            ti,irqs-reserved = /bits/ 8 <0x20>; /* BIT(5) */
+        };
+    };
-- 
2.7.4

