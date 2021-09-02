Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2FE3FEBA3
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 11:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343546AbhIBJ5W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 05:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245531AbhIBJ5T (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Sep 2021 05:57:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78B2F61041;
        Thu,  2 Sep 2021 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630576580;
        bh=b1AWLEN5psnrretJ8whMPnEaNkPAqn9QrCuQz7yJRkw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ex7H2lJQ8EhQM/jIZbCawC2dxCcvxSqaDA+w5Pk1c+a8HuJopETf9UszjAlBmm0sj
         N9XRARVlYYII5gA0yAAcZ+uZ4UQleuQ+2heXEscsHWuc9g21WggrT9n2GHLpQlhUVB
         LRdAsgZ2WKmG7r1bLqVxHt84A8WWgFML1yR2iYG6ts1I8mSnzbEqzXGBjIy1io4ujL
         8MPYKbaqHjOhtd+SYggibuMXkZ7ihsHaKAqZ+jkUobQzH24WbwUq4X/IqIU0cbmucV
         MCwhcKckUFvIQ2o3WqLdSfl/cjVdGJbXY5bkvLEuEqTWp8XZ6Wbcnp+RnRZcz0BWK2
         1FaRlsF/Skl3g==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 2/6] dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
Date:   Thu,  2 Sep 2021 12:56:05 +0300
Message-Id: <20210902095609.16583-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210902095609.16583-1-rogerq@kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert omap-gpmc.txt to ti,gpmc.yaml.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
 .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
 .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
 .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
 .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
 6 files changed, 370 insertions(+), 163 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
deleted file mode 100644
index c1359f4d48d7..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+++ /dev/null
@@ -1,157 +0,0 @@
-Device tree bindings for OMAP general purpose memory controllers (GPMC)
-
-The actual devices are instantiated from the child nodes of a GPMC node.
-
-Required properties:
-
- - compatible:		Should be set to one of the following:
-
-			ti,omap2420-gpmc (omap2420)
-			ti,omap2430-gpmc (omap2430)
-			ti,omap3430-gpmc (omap3430 & omap3630)
-			ti,omap4430-gpmc (omap4430 & omap4460 & omap543x)
-			ti,am3352-gpmc   (am335x devices)
-
- - reg:			A resource specifier for the register space
-			(see the example below)
- - ti,hwmods:		Should be set to "ti,gpmc" until the DT transition is
-			completed.
- - #address-cells:	Must be set to 2 to allow memory address translation
- - #size-cells:		Must be set to 1 to allow CS address passing
- - gpmc,num-cs:		The maximum number of chip-select lines that controller
-			can support.
- - gpmc,num-waitpins:	The maximum number of wait pins that controller can
-			support.
- - ranges:		Must be set up to reflect the memory layout with four
-			integer values for each chip-select line in use:
-
-			   <cs-number> 0 <physical address of mapping> <size>
-
-			Currently, calculated values derived from the contents
-			of the per-CS register GPMC_CONFIG7 (as set up by the
-			bootloader) are used for the physical address decoding.
-			As this will change in the future, filling correct
-			values here is a requirement.
- - interrupt-controller: The GPMC driver implements and interrupt controller for
-			the NAND events "fifoevent" and "termcount" plus the
-			rising/falling edges on the GPMC_WAIT pins.
-			The interrupt number mapping is as follows
-			0 - NAND_fifoevent
-			1 - NAND_termcount
-			2 - GPMC_WAIT0 pin edge
-			3 - GPMC_WAIT1 pin edge, and so on.
- - interrupt-cells:	Must be set to 2
- - gpio-controller:	The GPMC driver implements a GPIO controller for the
-			GPMC WAIT pins that can be used as general purpose inputs.
-			0 maps to GPMC_WAIT0 pin.
- - gpio-cells:		Must be set to 2
-
-Required properties when using NAND prefetch dma:
- - dmas			GPMC NAND prefetch dma channel
- - dma-names		Must be set to "rxtx"
-
-Timing properties for child nodes. All are optional and default to 0.
-
- - gpmc,sync-clk-ps:	Minimum clock period for synchronous mode, in picoseconds
-
- Chip-select signal timings (in nanoseconds) corresponding to GPMC_CONFIG2:
- - gpmc,cs-on-ns:	Assertion time
- - gpmc,cs-rd-off-ns:	Read deassertion time
- - gpmc,cs-wr-off-ns:	Write deassertion time
-
- ADV signal timings (in nanoseconds) corresponding to GPMC_CONFIG3:
- - gpmc,adv-on-ns:	Assertion time
- - gpmc,adv-rd-off-ns:	Read deassertion time
- - gpmc,adv-wr-off-ns:	Write deassertion time
- - gpmc,adv-aad-mux-on-ns:	Assertion time for AAD
- - gpmc,adv-aad-mux-rd-off-ns:	Read deassertion time for AAD
- - gpmc,adv-aad-mux-wr-off-ns:	Write deassertion time for AAD
-
- WE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
- - gpmc,we-on-ns	Assertion time
- - gpmc,we-off-ns:	Deassertion time
-
- OE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
- - gpmc,oe-on-ns:	Assertion time
- - gpmc,oe-off-ns:	Deassertion time
- - gpmc,oe-aad-mux-on-ns:	Assertion time for AAD
- - gpmc,oe-aad-mux-off-ns:	Deassertion time for AAD
-
- Access time and cycle time timings (in nanoseconds) corresponding to
- GPMC_CONFIG5:
- - gpmc,page-burst-access-ns: 	Multiple access word delay
- - gpmc,access-ns:		Start-cycle to first data valid delay
- - gpmc,rd-cycle-ns:		Total read cycle time
- - gpmc,wr-cycle-ns:		Total write cycle time
- - gpmc,bus-turnaround-ns:	Turn-around time between successive accesses
- - gpmc,cycle2cycle-delay-ns:	Delay between chip-select pulses
- - gpmc,clk-activation-ns: 	GPMC clock activation time
- - gpmc,wait-monitoring-ns:	Start of wait monitoring with regard to valid
-				data
-
-Boolean timing parameters. If property is present parameter enabled and
-disabled if omitted:
- - gpmc,adv-extra-delay:	ADV signal is delayed by half GPMC clock
- - gpmc,cs-extra-delay:		CS signal is delayed by half GPMC clock
- - gpmc,cycle2cycle-diffcsen:	Add "cycle2cycle-delay" between successive
-				accesses to a different CS
- - gpmc,cycle2cycle-samecsen:	Add "cycle2cycle-delay" between successive
-				accesses to the same CS
- - gpmc,oe-extra-delay:		OE signal is delayed by half GPMC clock
- - gpmc,we-extra-delay:		WE signal is delayed by half GPMC clock
- - gpmc,time-para-granularity:	Multiply all access times by 2
-
-The following are only applicable to OMAP3+ and AM335x:
- - gpmc,wr-access-ns:		In synchronous write mode, for single or
-				burst accesses, defines the number of
-				GPMC_FCLK cycles from start access time
-				to the GPMC_CLK rising edge used by the
-				memory device for the first data capture.
- - gpmc,wr-data-mux-bus-ns:	In address-data multiplex mode, specifies
-				the time when the first data is driven on
-				the address-data bus.
-
-GPMC chip-select settings properties for child nodes. All are optional.
-
-- gpmc,burst-length	Page/burst length. Must be 4, 8 or 16.
-- gpmc,burst-wrap	Enables wrap bursting
-- gpmc,burst-read	Enables read page/burst mode
-- gpmc,burst-write	Enables write page/burst mode
-- gpmc,device-width	Total width of device(s) connected to a GPMC
-			chip-select in bytes. The GPMC supports 8-bit
-			and 16-bit devices and so this property must be
-			1 or 2.
-- gpmc,mux-add-data	Address and data multiplexing configuration.
-			Valid values are 1 for address-address-data
-			multiplexing mode and 2 for address-data
-			multiplexing mode.
-- gpmc,sync-read	Enables synchronous read. Defaults to asynchronous
-			is this is not set.
-- gpmc,sync-write	Enables synchronous writes. Defaults to asynchronous
-			is this is not set.
-- gpmc,wait-pin		Wait-pin used by client. Must be less than
-			"gpmc,num-waitpins".
-- gpmc,wait-on-read	Enables wait monitoring on reads.
-- gpmc,wait-on-write	Enables wait monitoring on writes.
-
-Example for an AM33xx board:
-
-	gpmc: gpmc@50000000 {
-		compatible = "ti,am3352-gpmc";
-		ti,hwmods = "gpmc";
-		reg = <0x50000000 0x2000>;
-		interrupts = <100>;
-		dmas = <&edma 52 0>;
-		dma-names = "rxtx";
-		gpmc,num-cs = <8>;
-		gpmc,num-waitpins = <2>;
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges = <0 0 0x08000000 0x10000000>; /* CS0 @addr 0x8000000, size 0x10000000 */
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		/* child nodes go here */
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
new file mode 100644
index 000000000000..b7d43370a95d
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
@@ -0,0 +1,364 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments GPMC Memory Controller device-tree bindings
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Roger Quadros <rogerq@kernel.org>
+
+description:
+  The GPMC is a unified memory controller dedicated for interfacing
+  with external memory devices like
+  - Asynchronous SRAM-like memories and ASICs
+  - Asynchronous, synchronous, and page mode burst NOR flash
+  - NAND flash
+  - Pseudo-SRAM devices
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ti,omap2420-gpmc
+          - ti,omap2430-gpmc
+          - ti,omap3430-gpmc
+          - ti,omap4430-gpmc
+          - ti,am3352-gpmc
+
+  reg:
+    items:
+      - description:
+          Configuration registers for the controller.
+
+  interrupts: true
+
+  clocks:
+    maxItems: 1
+    description: |
+      Functional clock. Used for bus timing calculations and
+      GPMC configuration.
+
+  clock-names:
+    items:
+      - const: fck
+
+  dmas:
+    items:
+      - description: DMA channel for GPMC NAND prefetch
+
+  dma-names:
+    items:
+      - const: rxtx
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  gpmc,num-cs:
+    description: maximum number of supported chip-select lines.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  gpmc,num-waitpins:
+    description: maximum number of supported wait pins.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ranges:
+    minItems: 1
+    description: |
+      Must be set up to reflect the memory layout with four
+      integer values for each chip-select line in use,
+      <cs-number> 0 <physical address of mapping> <size>
+
+    items:
+      - description: NAND bank 0
+      - description: NOR/SRAM bank 0
+      - description: NOR/SRAM bank 1
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller:
+    description: |
+      The GPMC driver implements and interrupt controller for
+      the NAND events "fifoevent" and "termcount" plus the
+      rising/falling edges on the GPMC_WAIT pins.
+      The interrupt number mapping is as follows
+      0 - NAND_fifoevent
+      1 - NAND_termcount
+      2 - GPMC_WAIT0 pin edge
+      3 - GPMC_WAIT1 pin edge, and so on.
+
+  '#gpio-cells':
+     const: 2
+
+  gpio-controller:
+    description: |
+      The GPMC driver implements a GPIO controller for the
+      GPMC WAIT pins that can be used as general purpose inputs.
+      0 maps to GPMC_WAIT0 pin.
+
+  ti,hwmods:
+    description:
+      Name of the HWMOD associated with GPMC. This is for legacy
+      omap2/3 platforms only.
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+  ti,no-idle-on-init:
+    description:
+      Prevent idling the module at init. This is for legacy omap2/3
+      platforms only.
+    type: boolean
+    deprecated: true
+
+patternProperties:
+#  "@[0-3],[a-f0-9]+$":
+  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$":
+    type: object
+    description: |
+      The child device node represents the device connected to the GPMC
+      bus. The device can be a NAND controller, SRAM device, NOR device
+      or an ASIC.
+
+    properties:
+      compatible:
+        description:
+          Compatible of attached device.
+
+      reg:
+        items:
+        - description: Register access space for the device
+
+# GPMC Timing properties for child nodes. All are optional and default to 0.
+
+      gpmc,sync-clk-ps:
+        description: Minimum clock period for synchronous mode, in picoseconds
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+# Chip-select signal timings (in nanoseconds) corresponding to GPMC_CONFIG2:
+      gpmc,cs-on-ns:
+        description: Assertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,cs-rd-off-ns:
+        description: Read deassertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,cs-wr-off-ns:
+        description: Write deassertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+# ADV signal timings (in nanoseconds) corresponding to GPMC_CONFIG3:
+      gpmc,adv-on-ns:
+        description: Assertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,adv-rd-off-ns:
+        description: Read deassertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,adv-wr-off-ns:
+        description: Write deassertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,adv-aad-mux-on-ns:
+        description: Assertion time for AAD
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,adv-aad-mux-rd-off-ns:
+        description: Read deassertion time for AAD
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,adv-aad-mux-wr-off-ns:
+        description: Write deassertion time for AAD
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+# WE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
+      gpmc,we-on-ns:
+        description: Assertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,we-off-ns:
+        description: Deassertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+# OE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
+      gpmc,oe-on-ns:
+        description: Assertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,oe-off-ns:
+        description: Deassertion time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,oe-aad-mux-on-ns:
+        description:       Assertion time for AAD
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,oe-aad-mux-off-ns:
+        description:      Deassertion time for AAD
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+# Access time and cycle time timings (in nanoseconds) corresponding to
+# GPMC_CONFIG5:
+      gpmc,page-burst-access-ns:
+        description:   Multiple access word delay
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,access-ns:
+        description:              Start-cycle to first data valid delay
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,rd-cycle-ns:
+        description:            Total read cycle time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,wr-cycle-ns:
+        description:            Total write cycle time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,bus-turnaround-ns:
+        description:      Turn-around time between successive accesses
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,cycle2cycle-delay-ns:
+        description:   Delay between chip-select pulses
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,clk-activation-ns:
+        description:      GPMC clock activation time
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,wait-monitoring-ns:
+        description:     Start of wait monitoring with regard to valid data
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+# Boolean timing parameters. If property is present, parameter is enabled
+# otherwise disabled.
+      gpmc,adv-extra-delay:
+        description:        ADV signal is delayed by half GPMC clock
+        type: boolean
+      gpmc,cs-extra-delay:
+        description:         CS signal is delayed by half GPMC clock
+        type: boolean
+      gpmc,cycle2cycle-diffcsen:
+        description: |
+          Add "cycle2cycle-delay" between successive accesses
+          to a different CS
+        type: boolean
+      gpmc,cycle2cycle-samecsen:
+        description: |
+          Add "cycle2cycle-delay" between successive accesses
+          to the same CS
+        type: boolean
+      gpmc,oe-extra-delay:
+        description:         OE signal is delayed by half GPMC clock
+        type: boolean
+      gpmc,we-extra-delay:
+        description:         WE signal is delayed by half GPMC clock
+        type: boolean
+      gpmc,time-para-granularity:
+        description:  Multiply all access times by 2
+        type: boolean
+
+# The following two properties are applicable only to OMAP3+ and AM335x:
+      gpmc,wr-access-ns:
+        description: |
+          In synchronous write mode, for single or
+          burst accesses, defines the number of
+          GPMC_FCLK cycles from start access time
+          to the GPMC_CLK rising edge used by the
+          memory device for the first data capture.
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,wr-data-mux-bus-ns:
+        description: |
+          In address-data multiplex mode, specifies
+          the time when the first data is driven on
+          the address-data bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+# GPMC chip-select settings properties for child nodes. All are optional.
+
+      gpmc,burst-length:
+        description:     Page/burst length. Must be 4, 8 or 16.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [4, 8, 16]
+      gpmc,burst-wrap:
+        description:       Enables wrap bursting
+        type: boolean
+      gpmc,burst-read:
+        description:       Enables read page/burst mode
+        type: boolean
+      gpmc,burst-write:
+        description:      Enables write page/burst mode
+        type: boolean
+      gpmc,device-width:
+        description: |
+          Total width of device(s) connected to a GPMC
+          chip-select in bytes. The GPMC supports 8-bit
+          and 16-bit devices and so this property must be
+          1 or 2.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [1, 2]
+      gpmc,mux-add-data:
+        description: |
+          Address and data multiplexing configuration.
+          Valid values are:
+          0 for Non multiplexed mode
+          1 for address-address-data multiplexing mode and
+          2 for address-data multiplexing mode.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+      gpmc,sync-read:
+        description: |
+          Enables synchronous read. Defaults to asynchronous
+          is this is not set.
+        type: boolean
+      gpmc,sync-write:
+        description: |
+          Enables synchronous writes. Defaults to asynchronous
+          is this is not set.
+        type: boolean
+      gpmc,wait-pin:
+        description: |
+          Wait-pin used by client. Must be less than "gpmc,num-waitpins".
+        $ref: /schemas/types.yaml#/definitions/uint32
+      gpmc,wait-on-read:
+        description:     Enables wait monitoring on reads.
+        type: boolean
+      gpmc,wait-on-write:
+        description:    Enables wait monitoring on writes.
+        type: boolean
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - gpmc,num-cs
+  - gpmc,num-waitpins
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    gpmc: memory-controller@50000000 {
+      compatible = "ti,am3352-gpmc";
+      reg = <0x50000000 0x2000>;
+      interrupts = <100>;
+      clocks = <&l3s_clkctrl>;
+      clock-names = "fck";
+      dmas = <&edma 52 0>;
+      dma-names = "rxtx";
+      gpmc,num-cs = <8>;
+      gpmc,num-waitpins = <2>;
+      #address-cells = <2>;
+      #size-cells = <1>;
+      ranges = <0 0 0x08000000 0x10000000>; /* CS0 @addr 0x8000000, size 0x10000000 */
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      nand@0,0 {
+        compatible = "ti,omap2-nand";
+        reg = <0 0 4>;
+        interrupt-parent = <&gpmc>;
+        interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
+                     <1 IRQ_TYPE_NONE>; /* termcount */
+        rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 pin */
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index 44919d48d241..e439949d49e6 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -5,7 +5,7 @@ the GPMC controller with a name of "nand".
 
 All timing relevant properties as well as generic gpmc child properties are
 explained in a separate documents - please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 
 For NAND specific properties such as ECC modes or bus width, please refer to
 Documentation/devicetree/bindings/mtd/nand-controller.yaml
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
index c8567b40fe13..c9bea106ea65 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
@@ -5,7 +5,7 @@ child nodes of the GPMC controller with a name of "nor".
 
 All timing relevant properties as well as generic GPMC child properties are
 explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 
 Required properties:
 - bank-width: 		Width of NOR flash in bytes. GPMC supports 8-bit and
@@ -28,7 +28,7 @@ Required properties:
 
 Optional properties:
 - gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+			Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 
 Optional properties for partition table parsing:
 - #address-cells: should be set to 1
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
index e9f01a963a0a..0da78cc4ccca 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
@@ -5,7 +5,7 @@ the GPMC controller with a name of "onenand".
 
 All timing relevant properties as well as generic gpmc child properties are
 explained in a separate documents - please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/net/gpmc-eth.txt b/Documentation/devicetree/bindings/net/gpmc-eth.txt
index 32821066a85b..5e2f610455fa 100644
--- a/Documentation/devicetree/bindings/net/gpmc-eth.txt
+++ b/Documentation/devicetree/bindings/net/gpmc-eth.txt
@@ -9,7 +9,7 @@ the GPMC controller with an "ethernet" name.
 
 All timing relevant properties as well as generic GPMC child properties are
 explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 
 For the properties relevant to the ethernet controller connected to the GPMC
 refer to the binding documentation of the device. For example, the documentation
@@ -43,7 +43,7 @@ Required properties:
 
 Optional properties:
 - gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+			Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 
 Example:
 
-- 
2.17.1

