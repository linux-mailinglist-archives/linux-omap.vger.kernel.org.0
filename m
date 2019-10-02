Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7F2C8EAB
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 18:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfJBQnw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 12:43:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:48060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfJBQnw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 12:43:52 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DABB21848;
        Wed,  2 Oct 2019 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570034631;
        bh=6TGfhp6A9L6XL3h83OQIrQQEBV22mU2Dsc9NbOkvBhE=;
        h=From:To:Subject:Date:From;
        b=CUwCvhqHj52pdVjBwYJz3x8y4HFSYL0mkneIaaksQyDIdslFJVbjijLvVgE87v8rT
         KrjejYQZ+S1jh4cl0pkZv3OUPYLAcyQCZAtffRQlzEv3OlI2A/NasNcZoq7V/U+Z5R
         nFf4LVNvIJZ9Pua6oAB+4yuo2FyAQMem8vO0pIXM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 01/10] dt-bindings: sram: Convert SRAM bindings to json-schema
Date:   Wed,  2 Oct 2019 18:43:07 +0200
Message-Id: <20191002164316.14905-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert generic mmio-sram bindings to DT schema format using
json-schema.  Require the address/size cells to be 1, not equal to root
node.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Add Rob as maintainer,
2. Use "contains" for compatible,
3. Fix address and size cells to 1,
4. Add maxitems to reg under children,
5. Remove unneeded string type from label.

Changes since v1:
1. Indent example with four spaces (more readable).
---
 .../devicetree/bindings/sram/sram.txt         |  80 -----------
 .../devicetree/bindings/sram/sram.yaml        | 134 ++++++++++++++++++
 2 files changed, 134 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sram/sram.txt
 create mode 100644 Documentation/devicetree/bindings/sram/sram.yaml

diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
deleted file mode 100644
index e98908bd4227..000000000000
--- a/Documentation/devicetree/bindings/sram/sram.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-Generic on-chip SRAM
-
-Simple IO memory regions to be managed by the genalloc API.
-
-Required properties:
-
-- compatible : mmio-sram or atmel,sama5d2-securam
-
-- reg : SRAM iomem address range
-
-Reserving sram areas:
----------------------
-
-Each child of the sram node specifies a region of reserved memory. Each
-child node should use a 'reg' property to specify a specific range of
-reserved memory.
-
-Following the generic-names recommended practice, node names should
-reflect the purpose of the node. Unit address (@<address>) should be
-appended to the name.
-
-Required properties in the sram node:
-
-- #address-cells, #size-cells : should use the same values as the root node
-- ranges : standard definition, should translate from local addresses
-           within the sram to bus addresses
-
-Optional properties in the sram node:
-
-- no-memory-wc : the flag indicating, that SRAM memory region has not to
-                 be remapped as write combining. WC is used by default.
-
-Required properties in the area nodes:
-
-- reg : iomem address range, relative to the SRAM range
-
-Optional properties in the area nodes:
-
-- compatible : standard definition, should contain a vendor specific string
-               in the form <vendor>,[<device>-]<usage>
-- pool : indicates that the particular reserved SRAM area is addressable
-         and in use by another device or devices
-- export : indicates that the reserved SRAM area may be accessed outside
-           of the kernel, e.g. by bootloader or userspace
-- protect-exec : Same as 'pool' above but with the additional
-		 constraint that code wil be run from the region and
-		 that the memory is maintained as read-only, executable
-		 during code execution. NOTE: This region must be page
-		 aligned on start and end in order to properly allow
-		 manipulation of the page attributes.
-- label : the name for the reserved partition, if omitted, the label
-          is taken from the node name excluding the unit address.
-- clocks : a list of phandle and clock specifier pair that controls the
-	   single SRAM clock.
-
-Example:
-
-sram: sram@5c000000 {
-	compatible = "mmio-sram";
-	reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
-
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0 0x5c000000 0x40000>;
-
-	smp-sram@100 {
-		compatible = "socvendor,smp-sram";
-		reg = <0x100 0x50>;
-	};
-
-	device-sram@1000 {
-		reg = <0x1000 0x1000>;
-		pool;
-	};
-
-	exported@20000 {
-		reg = <0x20000 0x20000>;
-		export;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
new file mode 100644
index 000000000000..a1c1ec2183f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sram/sram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic on-chip SRAM
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |+
+  Simple IO memory regions to be managed by the genalloc API.
+
+  Each child of the sram node specifies a region of reserved memory. Each
+  child node should use a 'reg' property to specify a specific range of
+  reserved memory.
+
+  Following the generic-names recommended practice, node names should
+  reflect the purpose of the node. Unit address (@<address>) should be
+  appended to the name.
+
+properties:
+  $nodename:
+    pattern: "^sram(@.*)?"
+
+  compatible:
+    contains:
+      enum:
+        - mmio-sram
+        - atmel,sama5d2-securam
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
+    description:
+      Should translate from local addresses within the sram to bus addresses.
+
+  no-memory-wc:
+    description:
+      The flag indicating, that SRAM memory region has not to be remapped
+      as write combining. WC is used by default.
+    type: boolean
+
+patternProperties:
+  "^([a-z]*-)?sram@[a-f0-9]$":
+    type: object
+    description:
+      Each child of the sram node specifies a region of reserved memory.
+    properties:
+      reg:
+        description:
+          IO mem address range, relative to the SRAM range.
+        maxItems: 1
+
+      compatible:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          Should contain a vendor specific string in the form
+          <vendor>,[<device>-]<usage>
+
+      pool:
+        description:
+          Indicates that the particular reserved SRAM area is addressable
+          and in use by another device or devices.
+        type: boolean
+
+      export:
+        description:
+          Indicates that the reserved SRAM area may be accessed outside
+          of the kernel, e.g. by bootloader or userspace.
+        type: boolean
+
+      protect-exec:
+        description: |
+          Same as 'pool' above but with the additional constraint that code
+          will be run from the region and that the memory is maintained as
+          read-only, executable during code execution. NOTE: This region must
+          be page aligned on start and end in order to properly allow
+          manipulation of the page attributes.
+        type: boolean
+
+      label:
+        description:
+          The name for the reserved partition, if omitted, the label is taken
+          from the node name excluding the unit address.
+
+      clocks:
+        description:
+          A list of phandle and clock specifier pair that controls the
+          single SRAM clock.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+examples:
+  - |
+    sram: sram@5c000000 {
+        compatible = "mmio-sram";
+        reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x5c000000 0x40000>;
+
+        smp-sram@100 {
+            compatible = "socvendor,smp-sram";
+            reg = <0x100 0x50>;
+        };
+
+        device-sram@1000 {
+            reg = <0x1000 0x1000>;
+            pool;
+        };
+
+        exported@20000 {
+            reg = <0x20000 0x20000>;
+            export;
+        };
+    };
-- 
2.17.1

