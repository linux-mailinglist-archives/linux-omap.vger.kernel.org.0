Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B5737351D
	for <lists+linux-omap@lfdr.de>; Wed,  5 May 2021 08:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhEEG4Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 May 2021 02:56:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58842 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhEEG4P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 May 2021 02:56:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1456tIeJ057059;
        Wed, 5 May 2021 01:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620197718;
        bh=Y5UWzWg7x0wMfAnQMe8QYtS0K1vtF29Yvy6lzPK7r0o=;
        h=From:To:CC:Subject:Date;
        b=ZL9EqW0jlRkn8ieNsym2eHBvGft0Ui7ulxi8tZwCcfIRNFszWo4FLM8XHyYPgGLM0
         bw50C6zwX2wxx5LIy0xk6Ii+itpg4TGm96rEjunD2WqRfGUSzcQq2fXotiftGCkhnL
         s6tKmtUz5kd2Q+Jcy2riaPhy3V6xRPSUA4OowgKo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1456tIZh035151
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 May 2021 01:55:18 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 5 May
 2021 01:55:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 5 May 2021 01:55:18 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1456tDFT066833;
        Wed, 5 May 2021 01:55:15 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Date:   Wed, 5 May 2021 12:25:11 +0530
Message-ID: <20210505065511.918-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert i2c-omap.txt to YAML schema for better checks and documentation.

Following properties were used in DT but were not documented in txt
bindings and has been included in YAML schema:
1. Include ti,am4372-i2c compatible
2. Include dmas property used in few OMAP dts files
3. Document clocks property

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../devicetree/bindings/i2c/i2c-omap.txt      | 37 ---------
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml | 75 +++++++++++++++++++
 2 files changed, 75 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-omap.txt b/Documentation/devicetree/bindings/i2c/i2c-omap.txt
deleted file mode 100644
index a425b91af48f..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-omap.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-I2C for OMAP platforms
-
-Required properties :
-- compatible : Must be
-	"ti,omap2420-i2c" for OMAP2420 SoCs
-	"ti,omap2430-i2c" for OMAP2430 SoCs
-	"ti,omap3-i2c" for OMAP3 SoCs
-	"ti,omap4-i2c" for OMAP4+ SoCs
-	"ti,am654-i2c", "ti,omap4-i2c" for AM654 SoCs
-	"ti,j721e-i2c", "ti,omap4-i2c" for J721E SoCs
-	"ti,am64-i2c", "ti,omap4-i2c" for AM64 SoCs
-- ti,hwmods : Must be "i2c<n>", n being the instance number (1-based)
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Recommended properties :
-- clock-frequency : Desired I2C bus clock frequency in Hz. Otherwise
-  the default 100 kHz frequency will be used.
-
-Optional properties:
-- Child nodes conforming to i2c bus binding
-
-Note: Current implementation will fetch base address, irq and dma
-from omap hwmod data base during device registration.
-Future plan is to migrate hwmod data base contents into device tree
-blob so that, all the required data will be used from device tree dts
-file.
-
-Examples :
-
-i2c1: i2c@0 {
-    compatible = "ti,omap3-i2c";
-    #address-cells = <1>;
-    #size-cells = <0>;
-    ti,hwmods = "i2c1";
-    clock-frequency = <400000>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
new file mode 100644
index 000000000000..acf8872a7a7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ti,omap4-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for I2C controllers on TI's OMAP and K3 SoCs
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,omap2420-i2c
+      - const: ti,omap2430-i2c
+      - const: ti,omap3-i2c
+      - const: ti,omap4-i2c
+      - items:
+          - enum:
+              - ti,am4372-i2c
+              - ti,am64-i2c
+              - ti,am654-i2c
+              - ti,j721e-i2c
+          - const: ti,omap4-i2c
+
+  ti,hwmods:
+    description:
+      Must be "i2c<n>", n being the instance number (1-based)
+    $ref: /schemas/types.yaml#/definitions/string
+    items:
+      - pattern: "^i2c([1-9])$"
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
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: fck
+
+  clock-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     main_i2c0: i2c@2000000 {
+             compatible = "ti,j721e-i2c", "ti,omap4-i2c";
+             reg = <0x00 0x2000000 0x00 0x100>;
+             interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+             #address-cells = <1>;
+             #size-cells = <0>;
+       };
-- 
2.31.1

