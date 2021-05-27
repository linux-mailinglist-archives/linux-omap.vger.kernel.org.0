Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59733393463
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 18:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbhE0Q63 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 12:58:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48182 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235252AbhE0Q62 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 May 2021 12:58:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RGunnm039819;
        Thu, 27 May 2021 11:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622134609;
        bh=lcTg9deYB/xQWjoJPZRw96kkkinGFibiZo91LJI62bk=;
        h=From:To:CC:Subject:Date;
        b=tzUz1WT/NODfAUaO7N+fVjBbRP+t6iyPG9QsKFuoOGpsKkrVyIAg4KrPc6+k7B4Hd
         DJfXuOP2cIh1/gpb1V7Ej1j+g7UWMMaunJvoHazleSuK94a3GqjK9En+C9NNIYQwqY
         CPITYP8PDZUzlVMA+f00+riSAb8tSNIFcf8oSYM8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RGun9D041573
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 May 2021 11:56:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 11:56:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 11:56:49 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RGujix038568;
        Thu, 27 May 2021 11:56:46 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] dt-bindings: serial: Move omap-serial.txt to YAML schema
Date:   Thu, 27 May 2021 22:26:36 +0530
Message-ID: <20210527165636.939-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert serial-omap.txt to YAML schema for better checks and documentation.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../bindings/serial/omap_serial.txt           |  40 ------
 .../bindings/serial/ti,omap4-uart.yaml        | 116 ++++++++++++++++++
 2 files changed, 116 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
 create mode 100644 Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/omap_serial.txt b/Documentation/devicetree/bindings/serial/omap_serial.txt
deleted file mode 100644
index c2db8cabf2ab..000000000000
--- a/Documentation/devicetree/bindings/serial/omap_serial.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-OMAP UART controller
-
-Required properties:
-- compatible : should be "ti,am64-uart", "ti,am654-uart" for AM64 controllers
-- compatible : should be "ti,j721e-uart", "ti,am654-uart" for J721E controllers
-- compatible : should be "ti,am654-uart" for AM654 controllers
-- compatible : should be "ti,omap2-uart" for OMAP2 controllers
-- compatible : should be "ti,omap3-uart" for OMAP3 controllers
-- compatible : should be "ti,omap4-uart" for OMAP4 controllers
-- compatible : should be "ti,am4372-uart" for AM437x controllers
-- compatible : should be "ti,am3352-uart" for AM335x controllers
-- compatible : should be "ti,dra742-uart" for DRA7x controllers
-- reg : address and length of the register space
-- interrupts or interrupts-extended : Should contain the uart interrupt
-                                      specifier or both the interrupt
-                                      controller phandle and interrupt
-                                      specifier.
-- ti,hwmods : Must be "uart<n>", n being the instance number (1-based)
-
-Optional properties:
-- clock-frequency : frequency of the clock input to the UART
-- dmas : DMA specifier, consisting of a phandle to the DMA controller
-         node and a DMA channel number.
-- dma-names : "rx" for receive channel, "tx" for transmit channel.
-- rs485-rts-delay, rs485-rx-during-tx, linux,rs485-enabled-at-boot-time: see rs485.txt
-- rs485-rts-active-high: drive RTS high when sending (default is low).
-- clocks: phandle to the functional clock as per
-  Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Example:
-
-                uart4: serial@49042000 {
-                        compatible = "ti,omap3-uart";
-                        reg = <0x49042000 0x400>;
-                        interrupts = <80>;
-                        dmas = <&sdma 81 &sdma 82>;
-                        dma-names = "tx", "rx";
-                        ti,hwmods = "uart4";
-                        clock-frequency = <48000000>;
-                };
diff --git a/Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml b/Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
new file mode 100644
index 000000000000..b3e426c24a9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/ti,omap4-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for 8250 compliant UARTs on TI's OMAP and K3 SoCs
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+  - $ref: /schemas/serial/rs485.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - ti,am3352-uart
+          - ti,am4372-uart
+          - ti,am654-uart
+          - ti,dra742-uart
+          - ti,omap2-uart
+          - ti,omap3-uart
+          - ti,omap4-uart
+      - items:
+          - enum:
+              - ti,am64-uart
+              - ti,j721e-uart
+          - const: ti,am654-uart
+
+  ti,hwmods:
+    description:
+      Must be "uart<n>", n being the instance number (1-based)
+      This property is applicable only on legacy platforms mainly omap2/3
+      and ti81xx and should not be used on other platforms.
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: fclk
+
+  reg-shift:
+    const: 2
+  reg-io-width:
+    const: 4
+
+  rts-gpios: true
+  cts-gpios: true
+  dtr-gpios: true
+  dsr-gpios: true
+  rng-gpios: true
+  dcd-gpios: true
+  rs485-rts-delay: true
+  rs485-rts-active-low: true
+  rs485-rx-during-tx: true
+  rs485-rts-active-high: true
+  linux,rs485-enabled-at-boot-time: true
+  rts-gpio: true
+  power-domains: true
+  clock-frequency: true
+  current-speed: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      oneOf:
+        - const: ti,omap2-uart
+        - const: ti,omap3-uart
+        - const: ti,omap4-uart
+
+then:
+  properties:
+    ti,hwmods:
+      items:
+        - pattern: "^uart([1-9])$"
+
+else:
+  properties:
+    ti,hwmods: false
+
+examples:
+  - |
+          uart4: serial@49042000 {
+                  compatible = "ti,omap3-uart";
+                  reg = <0x49042000 0x400>;
+                  interrupts = <80>;
+                  clock-frequency = <48000000>;
+          };
-- 
2.31.1

