Return-Path: <linux-omap+bounces-34-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EE7FAB49
	for <lists+linux-omap@lfdr.de>; Mon, 27 Nov 2023 21:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 508B9B212DF
	for <lists+linux-omap@lfdr.de>; Mon, 27 Nov 2023 20:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E93445C15;
	Mon, 27 Nov 2023 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D581BD;
	Mon, 27 Nov 2023 12:24:12 -0800 (PST)
Received: from p200301077700a9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:a900:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r7i9I-006mnO-M7; Mon, 27 Nov 2023 21:24:08 +0100
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1r7i9I-000bvU-1J;
	Mon, 27 Nov 2023 21:24:08 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	kristo@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: ti: Convert interface.txt to json-schema
Date: Mon, 27 Nov 2023 21:23:59 +0100
Message-Id: <20231127202359.145778-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OMAP interface clock device tree binding to json-schema
and fix up reg property which is optional and taken from parent if
not specified.
Specify the creator of the original binding as a maintainer.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/clock/ti/interface.txt           | 57 ------------
 .../bindings/clock/ti/ti,interface-clock.yaml | 90 +++++++++++++++++++
 2 files changed, 90 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/interface.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/interface.txt b/Documentation/devicetree/bindings/clock/ti/interface.txt
deleted file mode 100644
index d3eb5ca92a7fe..0000000000000
--- a/Documentation/devicetree/bindings/clock/ti/interface.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Binding for Texas Instruments interface clock.
-
-Binding status: Unstable - ABI compatibility may be broken in the future
-
-This binding uses the common clock binding[1]. This clock is
-quite much similar to the basic gate-clock [2], however,
-it supports a number of additional features, including
-companion clock finding (match corresponding functional gate
-clock) and hardware autoidle enable / disable.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
-
-Required properties:
-- compatible : shall be one of:
-  "ti,omap3-interface-clock" - basic OMAP3 interface clock
-  "ti,omap3-no-wait-interface-clock" - interface clock which has no hardware
-				       capability for waiting clock to be ready
-  "ti,omap3-hsotgusb-interface-clock" - interface clock with USB specific HW
-					handling
-  "ti,omap3-dss-interface-clock" - interface clock with DSS specific HW handling
-  "ti,omap3-ssi-interface-clock" - interface clock with SSI specific HW handling
-  "ti,am35xx-interface-clock" - interface clock with AM35xx specific HW handling
-  "ti,omap2430-interface-clock" - interface clock with OMAP2430 specific HW
-				  handling
-- #clock-cells : from common clock binding; shall be set to 0
-- clocks : link to phandle of parent clock
-- reg : base address for the control register
-
-Optional properties:
-- clock-output-names : from common clock binding.
-- ti,bit-shift : bit shift for the bit enabling/disabling the clock (default 0)
-
-Examples:
-	aes1_ick: aes1_ick@48004a14 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&security_l4_ick2>;
-		reg = <0x48004a14 0x4>;
-		ti,bit-shift = <3>;
-	};
-
-	cam_ick: cam_ick@48004f10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-no-wait-interface-clock";
-		clocks = <&l4_ick>;
-		reg = <0x48004f10 0x4>;
-		ti,bit-shift = <0>;
-	};
-
-	ssi_ick_3430es2: ssi_ick_3430es2@48004a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-ssi-interface-clock";
-		clocks = <&ssi_l4_ick>;
-		reg = <0x48004a10 0x4>;
-		ti,bit-shift = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
new file mode 100644
index 0000000000000..48a54caeb3857
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,interface-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments interface clock.
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description: |
+  This binding uses the common clock binding[1]. This clock is
+  quite much similar to the basic gate-clock[2], however,
+  it supports a number of additional features, including
+  companion clock finding (match corresponding functional gate
+  clock) and hardware autoidle enable / disable.
+
+  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+  [2] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
+
+
+properties:
+  compatible:
+    enum:
+      - ti,omap3-interface-clock           # basic OMAP3 interface clock
+      - ti,omap3-no-wait-interface-clock   # interface clock which has no hardware
+                                           # capability for waiting clock to be ready
+      - ti,omap3-hsotgusb-interface-clock  # interface clock with USB specific HW handling
+      - ti,omap3-dss-interface-clock       # interface clock with DSS specific HW handling
+      - ti,omap3-ssi-interface-clock       # interface clock with SSI specific HW handling
+      - ti,am35xx-interface-clock          # interface clock with AM35xx specific HW handling
+      - ti,omap2430-interface-clock        # interface clock with OMAP2430 specific HW handling
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  reg:
+    description:
+      if not specified, value from parent is used
+    maxItems: 1
+
+  ti,bit-shift:
+    description:
+      bit shift for the bit enabling/disabling the clock
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      aes1_ick: aes1-ick@48004a14 {
+        #clock-cells = <0>;
+        compatible = "ti,omap3-interface-clock";
+        clocks = <&security_l4_ick2>;
+        reg = <0x48004a14 0x4>;
+        ti,bit-shift = <3>;
+      };
+
+      cam_ick: cam-ick@48004f10 {
+        #clock-cells = <0>;
+        compatible = "ti,omap3-no-wait-interface-clock";
+        clocks = <&l4_ick>;
+        reg = <0x48004f10 0x4>;
+        ti,bit-shift = <0>;
+      };
+
+      ssi_ick_3430es2: ssi-ick-3430es2@48004a10 {
+        #clock-cells = <0>;
+        compatible = "ti,omap3-ssi-interface-clock";
+        clocks = <&ssi_l4_ick>;
+        reg = <0x48004a10 0x4>;
+        ti,bit-shift = <0>;
+      };
+    };
-- 
2.39.2


