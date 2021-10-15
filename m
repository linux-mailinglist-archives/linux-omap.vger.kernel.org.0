Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2746842EFC5
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 13:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbhJOLgF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 07:36:05 -0400
Received: from muru.com ([72.249.23.125]:44996 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230030AbhJOLgF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 07:36:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C8AF880F1;
        Fri, 15 Oct 2021 11:34:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCHv2] dt-bindings: bus: ti-sysc: Update to use yaml binding
Date:   Fri, 15 Oct 2021 14:33:50 +0300
Message-Id: <20211015113350.35830-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update the binding for ti-sysc interconnect target module driver to yaml
format.

Note that the old binding was never updated for the need to always specify
also the generic compatible "ti,sysc". This is needed for the auxdata
for platform clockdomain autoidle related functions.

Cc: Rob Herring <robh@kernel.org>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v1:

- Update based on comments from Rob

---
 .../devicetree/bindings/bus/ti-sysc.txt       | 139 ----------
 .../devicetree/bindings/bus/ti-sysc.yaml      | 242 ++++++++++++++++++
 2 files changed, 242 insertions(+), 139 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.txt
 create mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.yaml

diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
deleted file mode 100644
--- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
+++ /dev/null
@@ -1,139 +0,0 @@
-Texas Instruments sysc interconnect target module wrapper binding
-
-Texas Instruments SoCs can have a generic interconnect target module
-hardware for devices connected to various interconnects such as L3
-interconnect (Arteris NoC) and L4 interconnect (Sonics s3220). The sysc
-is mostly used for interaction between module and PRCM. It participates
-in the OCP Disconnect Protocol but other than that is mostly independent
-of the interconnect.
-
-Each interconnect target module can have one or more devices connected to
-it. There is a set of control registers for managing interconnect target
-module clocks, idle modes and interconnect level resets for the module.
-
-These control registers are sprinkled into the unused register address
-space of the first child device IP block managed by the interconnect
-target module and typically are named REVISION, SYSCONFIG and SYSSTATUS.
-
-Required standard properties:
-
-- compatible	shall be one of the following generic types:
-
-		"ti,sysc"
-		"ti,sysc-omap2"
-		"ti,sysc-omap4"
-		"ti,sysc-omap4-simple"
-
-		or one of the following derivative types for hardware
-		needing special workarounds:
-
-		"ti,sysc-omap2-timer"
-		"ti,sysc-omap4-timer"
-		"ti,sysc-omap3430-sr"
-		"ti,sysc-omap3630-sr"
-		"ti,sysc-omap4-sr"
-		"ti,sysc-omap3-sham"
-		"ti,sysc-omap-aes"
-		"ti,sysc-mcasp"
-		"ti,sysc-dra7-mcasp"
-		"ti,sysc-usb-host-fs"
-		"ti,sysc-dra7-mcan"
-		"ti,sysc-pruss"
-
-- reg		shall have register areas implemented for the interconnect
-		target module in question such as revision, sysc and syss
-
-- reg-names	shall contain the register names implemented for the
-		interconnect target module in question such as
-		"rev, "sysc", and "syss"
-
-- ranges	shall contain the interconnect target module IO range
-		available for one or more child device IP blocks managed
-		by the interconnect target module, the ranges may include
-		multiple ranges such as device L4 range for control and
-		parent L3 range for DMA access
-
-Optional properties:
-
-- ti,sysc-mask	shall contain mask of supported register bits for the
-		SYSCONFIG register as documented in the Technical Reference
-		Manual (TRM) for the interconnect target module
-
-- ti,sysc-midle	list of master idle modes supported by the interconnect
-		target module as documented in the TRM for SYSCONFIG
-		register MIDLEMODE bits
-
-- ti,sysc-sidle	list of slave idle modes supported by the interconnect
-		target module as documented in the TRM for SYSCONFIG
-		register SIDLEMODE bits
-
-- ti,sysc-delay-us	delay needed after OCP softreset before accssing
-			SYSCONFIG register again
-
-- ti,syss-mask	optional mask of reset done status bits as described in the
-		TRM for SYSSTATUS registers, typically 1 with some devices
-		having separate reset done bits for children like OHCI and
-		EHCI
-
-- clocks	clock specifier for each name in the clock-names as
-		specified in the binding documentation for ti-clkctrl,
-		typically available for all interconnect targets on TI SoCs
-		based on omap4 except if it's read-only register in hwauto
-		mode as for example omap4 L4_CFG_CLKCTRL
-
-- clock-names	should contain at least "fck", and optionally also "ick"
-		depending on the SoC and the interconnect target module,
-		some interconnect target modules also need additional
-		optional clocks that can be specified as listed in TRM
-		for the related CLKCTRL register bits 8 to 15 such as
-		"dbclk" or "clk32k" depending on their role
-
-- ti,hwmods	optional TI interconnect module name to use legacy
-		hwmod platform data
-
-- ti,no-reset-on-init	interconnect target module should not be reset at init
-
-- ti,no-idle-on-init	interconnect target module should not be idled at init
-
-- ti,no-idle		interconnect target module should not be idled
-
-Example: Single instance of MUSB controller on omap4 using interconnect ranges
-using offsets from l4_cfg second segment (0x4a000000 + 0x80000 = 0x4a0ab000):
-
-	target-module@2b000 {		/* 0x4a0ab000, ap 84 12.0 */
-		compatible = "ti,sysc-omap2";
-		ti,hwmods = "usb_otg_hs";
-		reg = <0x2b400 0x4>,
-		      <0x2b404 0x4>,
-		      <0x2b408 0x4>;
-		reg-names = "rev", "sysc", "syss";
-		clocks = <&l3_init_clkctrl OMAP4_USB_OTG_HS_CLKCTRL 0>;
-		clock-names = "fck";
-		ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
-				 SYSC_OMAP2_SOFTRESET |
-				 SYSC_OMAP2_AUTOIDLE)>;
-		ti,sysc-midle = <SYSC_IDLE_FORCE>,
-				<SYSC_IDLE_NO>,
-				<SYSC_IDLE_SMART>;
-		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-				<SYSC_IDLE_NO>,
-				<SYSC_IDLE_SMART>,
-				<SYSC_IDLE_SMART_WKUP>;
-		ti,syss-mask = <1>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x2b000 0x1000>;
-
-		usb_otg_hs: otg@0 {
-			compatible = "ti,omap4-musb";
-			reg = <0x0 0x7ff>;
-			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
-			usb-phy = <&usb2_phy>;
-			...
-		};
-	};
-
-Note that other SoCs, such as am335x can have multiple child devices. On am335x
-there are two MUSB instances, two USB PHY instances, and a single CPPI41 DMA
-instance as children of a single interconnect target module.
diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.yaml b/Documentation/devicetree/bindings/bus/ti-sysc.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti-sysc.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti-sysc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments interconnect target module binding
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description:
+  Texas Instruments SoCs can have a generic interconnect target module
+  for devices connected to various interconnects such as L3 interconnect
+  using Arteris NoC, and L4 interconnect using Sonics s3220. This module
+  is mostly used for interaction between module and Power, Reset and Clock
+  Manager PRCM. It participates in the OCP Disconnect Protocol, but other
+  than that it is mostly independent of the interconnect.
+
+  Each interconnect target module can have one or more devices connected to
+  it. There is a set of control registers for managing the interconnect target
+  module clocks, idle modes and interconnect level resets.
+
+  The interconnect target module control registers are sprinkled into the
+  unused register address space of the first child device IP block managed by
+  the interconnect target module. Typically the register names are REVISION,
+  SYSCONFIG and SYSSTATUS.
+
+properties:
+  $nodename:
+    pattern: "^target-module(@[0-9a-f]+)?$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,sysc-omap2
+              - ti,sysc-omap2
+              - ti,sysc-omap4
+              - ti,sysc-omap4-simple
+              - ti,sysc-omap2-timer
+              - ti,sysc-omap4-timer
+              - ti,sysc-omap3430-sr
+              - ti,sysc-omap3630-sr
+              - ti,sysc-omap4-sr
+              - ti,sysc-omap3-sham
+              - ti,sysc-omap-aes
+              - ti,sysc-mcasp
+              - ti,sysc-dra7-mcasp
+              - ti,sysc-usb-host-fs
+              - ti,sysc-dra7-mcan
+              - ti,sysc-pruss
+          - const: ti,sysc
+      - items:
+          - const: ti,sysc
+
+  reg:
+    description:
+      Interconnect target module control registers consisting of
+      REVISION, SYSCONFIG and SYSSTATUS registers as defined in the
+      Technical Reference Manual for the SoC.
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    description:
+      Interconnect target module control register names consisting
+      of "rev", "sysc" and "syss".
+    oneOf:
+      - items:
+          - const: rev
+          - const: sysc
+          - const: syss
+      - items:
+          - const: rev
+          - const: sysc
+      - items:
+          - const: rev
+          - const: syss
+      - items:
+          - const: sysc
+      - items:
+          - const: syss
+      - items:
+          - const: rev
+
+  power-domains:
+    description: Target module power domain if available.
+    maxItems: 1
+
+  clocks:
+    description:
+      Target module clocks consisting of one functional clock, one
+      interface clock, and up to 8 module specific optional clocks.
+      Some modules may have only the functional clock, and some have
+      no configurable clocks.
+
+  clock-names:
+    description:
+      Target module clock names like "fck", "ick", "optck1", "optck2"
+      if the clocks are configurable.
+    oneOf:
+      - items:
+          - const: fck
+      - items:
+          - const: ick
+      - items:
+          - const: sys_clk
+      - items:
+          - const: fck
+          - const: ick
+      - items:
+          - const: fck
+          - const: dbclk
+      - items:
+          - const: fck
+          - const: osc
+      - items:
+          - const: fck
+          - const: sys_clk
+      - items:
+          - const: fck
+          - const: phy-clk
+          - const: phy-clk-div
+      - items:
+          - const: fck
+          - const: dss_clk
+      - items:
+          - const: fck
+          - const: hdmi_clk
+          - const: sys_clk
+          - const: tv_clk
+      - items:
+          - const: fck
+          - const: ahclkx
+      - items:
+          - const: fck
+          - const: ahclkx
+          - const: ahclkr
+
+  resets:
+    description:
+      Target module reset bit in the RSTCTRL register if wired for the module.
+      Note that the other reset bits should be mapped for the child device
+      driver to use.
+    maxItems: 1
+
+  reset-names:
+    description:
+      Target module reset names in the RSTCTRL register, typically named
+      "rstctrl" if only one reset bit is wired for the module.
+    oneOf:
+      - items:
+          - const: rstctrl
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+  dma-ranges: true
+
+  ti,sysc-mask:
+    description: Mask of supported register bits for the SYSCONFIG register
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ti,sysc-midle:
+    description: List of hardware supported idle modes
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  ti,sysc-sidle:
+    description: List of hardware supported idle modes
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  ti,syss-mask:
+    description: Mask of supported register bits for the SYSSTATUS register
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ti,sysc-delay-us:
+    description: Delay needed after OCP softreset before accessing SYCONFIG
+    default: 0
+    minimum: 0
+    maximum: 2
+
+  ti,no-reset-on-init:
+    description: Interconnect target module shall not be reset at init
+    type: boolean
+
+  ti,no-idle-on-init:
+    description: Interconnect target module shall not be idled at init
+    type: boolean
+
+  ti,no-idle:
+    description: Interconnect target module shall not be idled
+    type: boolean
+
+  ti,hwmods:
+    description: Interconnect module name to use with legacy hwmod data
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    #include <dt-bindings/bus/ti-sysc.h>
+    #include <dt-bindings/clock/omap4.h>
+
+    target-module@2b000 {
+        compatible = "ti,sysc-omap2", "ti,sysc";
+        ti,hwmods = "usb_otg_hs";
+        reg = <0x2b400 0x4>,
+              <0x2b404 0x4>,
+              <0x2b408 0x4>;
+        reg-names = "rev", "sysc", "syss";
+        clocks = <&l3_init_clkctrl OMAP4_USB_OTG_HS_CLKCTRL 0>;
+        clock-names = "fck";
+        ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
+                         SYSC_OMAP2_SOFTRESET |
+                         SYSC_OMAP2_AUTOIDLE)>;
+        ti,sysc-midle = <SYSC_IDLE_FORCE>,
+                        <SYSC_IDLE_NO>,
+                        <SYSC_IDLE_SMART>;
+        ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+                        <SYSC_IDLE_NO>,
+                        <SYSC_IDLE_SMART>,
+                        <SYSC_IDLE_SMART_WKUP>;
+        ti,syss-mask = <1>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x2b000 0x1000>;
+    };
-- 
2.33.0
