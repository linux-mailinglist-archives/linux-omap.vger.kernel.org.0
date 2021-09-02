Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002FF3FEBA9
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 11:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343812AbhIBJ50 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 05:57:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:39332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343723AbhIBJ5Y (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Sep 2021 05:57:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBAB761090;
        Thu,  2 Sep 2021 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630576585;
        bh=Q0LIPQvXy4Qbvq7k78WLCwV4gbJDUmFfKPPMh096G/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CK9C4I9ZIGwNwMB4jnFQLPVN8zyBIV+WpHqagpZXSCN63QIfd9SEHvhXVUPgGhEsm
         xlI5r+qxTdPPPnT4laSu7WdQnqyrmy2jzLbbeBySnW6x++jGtQNpyTzdxGmin2aHFK
         /gddYu2Lz5vumAn59TTDnIQmXPivNeqSPcnt5mIPylriC0qdbCtNBaIr00soljz+nH
         CQIoj1lOs+HY11pnNYJ0gNgGDkwiml+DrCFyNrzNqyotHLoRrtXW7ycIz0gucfymR0
         LCkM5LlBZ1MlVvmri8fJyGxss6sX3B9T4N/NS/Z6rhRvRNweOSg85exIapcrerTHLf
         /zpejmsfhpxBg==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 4/6] dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
Date:   Thu,  2 Sep 2021 12:56:07 +0300
Message-Id: <20210902095609.16583-5-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902095609.16583-1-rogerq@kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert gpmc-onenand.txt to ti,gpmc-onenand.yaml.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/mtd/gpmc-onenand.txt  | 48 -------------
 .../bindings/mtd/ti,gpmc-onenand.yaml         | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
deleted file mode 100644
index 0da78cc4ccca..000000000000
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
-Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
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
index 000000000000..5b0d2b549919
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
@@ -0,0 +1,71 @@
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
+
+  GPMC connected OneNAND (found on OMAP boards) are represented
+  as child nodes of the GPMC controller.
+
+  All timing relevant properties as well as generic gpmc child properties are
+  explained in
+  Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  int-gpios:
+    description: GPIO specifier for the INT pin.
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: true
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
+      };
+    };
-- 
2.17.1

