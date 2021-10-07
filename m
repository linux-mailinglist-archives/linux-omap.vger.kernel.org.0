Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358514252A9
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 14:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241278AbhJGMK7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 08:10:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:50746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241282AbhJGMKn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 08:10:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D679B60F90;
        Thu,  7 Oct 2021 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633608530;
        bh=3lABtzEvVZ9ovEAf/wq5+A7SfbOl7pqClaBJfM79UyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FbSjqUut7j3ApWtmsxnoc+zrP4Jnjl11oP5+fQ6m9Dy93xCQy2ksZs1bOn7vIuznX
         vzK7LVw2ZpJUFgbEhZmTbMBOHyHpgTdQeUvYeiT/DOekjB2wHpGmHzmOYTDQjFkc3+
         NYxsFYJKEUtTvjUP1kBKHBxSfg1ycRaS319iQVZefgwYXgb00bN3tETUo4SZA4DQPz
         xInmrBCWcRha9B3CoQ2gFpZBl8GqW1bg2B48HEaP8Faenk+uTG/7St05DdgCitXSR9
         MbIulkW4VG2XcJMVkU83Kahlgcp5sM5B3yqmwpt0uWPsakLJC6WDqaqArUgssQTSgc
         7dBT5h/sbJoSg==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v5 5/8] dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
Date:   Thu,  7 Oct 2021 15:08:27 +0300
Message-Id: <20211007120830.17221-6-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007120830.17221-1-rogerq@kernel.org>
References: <20211007120830.17221-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert gpmc-onenand.txt to ti,gpmc-onenand.yaml.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/gpmc-onenand.txt  | 48 -----------
 .../bindings/mtd/ti,gpmc-onenand.yaml         | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
deleted file mode 100644
index e9f01a963a0a..000000000000
--- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Device tree bindings for GPMC connected OneNANDs
-
-GPMC connected OneNAND (found on OMAP boards) are represented as child nodes of
-the GPMC controller with a name of "onenand".
-
-All timing relevant properties as well as generic gpmc child properties are
-explained in a separate documents - please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-Required properties:
-
- - compatible:		"ti,omap2-onenand"
- - reg:			The CS line the peripheral is connected to
- - gpmc,device-width:	Width of the ONENAND device connected to the GPMC
-			in bytes. Must be 1 or 2.
-
-Optional properties:
-
- - int-gpios:		GPIO specifier for the INT pin.
-
-For inline partition table parsing (optional):
-
- - #address-cells: should be set to 1
- - #size-cells: should be set to 1
-
-Example for an OMAP3430 board:
-
-	gpmc: gpmc@6e000000 {
-		compatible = "ti,omap3430-gpmc";
-		ti,hwmods = "gpmc";
-		reg = <0x6e000000 0x1000000>;
-		interrupts = <20>;
-		gpmc,num-cs = <8>;
-		gpmc,num-waitpins = <4>;
-		#address-cells = <2>;
-		#size-cells = <1>;
-
-		onenand@0 {
-			compatible = "ti,omap2-onenand";
-			reg = <0 0 0>; /* CS0, offset 0 */
-			gpmc,device-width = <2>;
-
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			/* partitions go here */
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
new file mode 100644
index 000000000000..a953f7397c40
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ti,gpmc-onenand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OneNAND over Texas Instruments GPMC bus.
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Roger Quadros <rogerq@kernel.org>
+
+description:
+  GPMC connected OneNAND (found on OMAP boards) are represented
+  as child nodes of the GPMC controller.
+
+properties:
+  compatible:
+    const: ti,omap2-onenand
+
+  reg:
+    items:
+      - description: |
+          Chip Select number, register offset and size of
+          OneNAND register window.
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  int-gpios:
+    description: GPIO specifier for the INT pin.
+
+patternProperties:
+  "@[0-9a-f]+$":
+    $ref: "/schemas/mtd/partitions/partition.yaml"
+
+allOf:
+  - $ref: "/schemas/memory-controllers/ti,gpmc-child.yaml"
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gpmc: memory-controller@6e000000 {
+      compatible = "ti,omap3430-gpmc";
+      reg = <0x6e000000 0x02d0>;
+      interrupts = <20>;
+      gpmc,num-cs = <8>;
+      gpmc,num-waitpins = <4>;
+      clocks = <&l3s_clkctrl>;
+      clock-names = "fck";
+      #address-cells = <2>;
+      #size-cells = <1>;
+
+      ranges = <0 0 0x01000000 0x01000000>,   /* 16 MB for OneNAND */
+               <1 0 0x02000000 0x01000000>;   /* 16 MB for smc91c96 */
+
+      onenand@0,0 {
+        compatible = "ti,omap2-onenand";
+        reg = <0 0 0x20000>;    /* CS0, offset 0, IO size 128K */
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+          label = "bootloader";
+          reg = <0x00000000 0x00100000>;
+        };
+
+        partition@100000 {
+          label = "config";
+          reg = <0x00100000 0x002c0000>;
+        };
+      };
+    };
-- 
2.17.1

