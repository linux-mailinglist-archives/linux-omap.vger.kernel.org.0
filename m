Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605045B8AA2
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 16:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiINOd7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 10:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbiINOd5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 10:33:57 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA0E7E037
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 07:33:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
        by baptiste.telenet-ops.be with bizsmtp
        id KqZi2800s3vs4GX01qZiPV; Wed, 14 Sep 2022 16:33:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTSP-005B5L-Rc; Wed, 14 Sep 2022 16:33:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTS7-000zXm-2p; Wed, 14 Sep 2022 16:33:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x: Convert to json-schema
Date:   Wed, 14 Sep 2022 16:33:22 +0200
Message-Id: <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663165552.git.geert+renesas@glider.be>
References: <cover.1663165552.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the NXP TDA998x HDMI transmitter Device Tree binding
documentation to json-schema.

Add missing "#sound-dai-cells" property.
Add ports hierarchy, as an alternative to port.
Drop pinctrl properties, as they do not belong here.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add maximum to video-ports,
  - Drop unneeded maxItems for audio-ports,
  - Complete port descriptions.
---
 .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
 .../bindings/display/bridge/tda998x.txt       |  54 ---------
 2 files changed, 109 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
new file mode 100644
index 0000000000000000..c4bf543974737b5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP TDA998x HDMI transmitter
+
+maintainers:
+  - Russell King <linux@armlinux.org.uk>
+
+properties:
+  compatible:
+    const: nxp,tda998x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  video-ports:
+    default: 0x230145
+    maximum: 0xffffff
+    description:
+      24 bits value which defines how the video controller output is wired to
+      the TDA998x input.
+
+  audio-ports:
+    description:
+      Array of 8-bit values, 2 values per DAI (Documentation/sound/soc/dai.rst).
+      The implementation allows one or two DAIs.
+      If two DAIs are defined, they must be of different type.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      minItems: 1
+      items:
+        - description: |
+            The first value defines the DAI type: TDA998x_SPDIF or TDA998x_I2S
+            (see include/dt-bindings/display/tda998x.h).
+        - description:
+            The second value defines the tda998x AP_ENA reg content when the
+            DAI in question is used.
+
+  '#sound-dai-cells':
+    enum: [ 0, 1 ]
+
+  nxp,calib-gpios:
+    maxItems: 1
+    description:
+      Calibration GPIO, which must correspond with the gpio used for the
+      TDA998x interrupt pin.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Parallel input port
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        type: object
+        description: Parallel input port
+
+      port@1:
+        type: object
+        description: HDMI output port
+
+required:
+  - compatible
+  - reg
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/display/tda998x.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tda998x: hdmi-encoder@70 {
+            compatible = "nxp,tda998x";
+            reg = <0x70>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+            video-ports = <0x230145>;
+
+            #sound-dai-cells = <1>;
+                         /* DAI-format / AP_ENA reg value */
+            audio-ports = <TDA998x_SPDIF 0x04>,
+                          <TDA998x_I2S 0x03>;
+
+            port {
+                tda998x_in: endpoint {
+                    remote-endpoint = <&lcdc_0>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/bridge/tda998x.txt b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
deleted file mode 100644
index f5a02f61dd36f1c6..0000000000000000
--- a/Documentation/devicetree/bindings/display/bridge/tda998x.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-Device-Tree bindings for the NXP TDA998x HDMI transmitter
-
-Required properties;
-  - compatible: must be "nxp,tda998x"
-
-  - reg: I2C address
-
-Required node:
-  - port: Input port node with endpoint definition, as described
-        in Documentation/devicetree/bindings/graph.txt
-
-Optional properties:
-  - interrupts: interrupt number and trigger type
-	default: polling
-
-  - pinctrl-0: pin control group to be used for
-	screen plug/unplug interrupt.
-
-  - pinctrl-names: must contain a "default" entry.
-
-  - video-ports: 24 bits value which defines how the video controller
-	output is wired to the TDA998x input - default: <0x230145>
-
-  - audio-ports: array of 8-bit values, 2 values per one DAI[1].
-	The first value defines the DAI type: TDA998x_SPDIF or TDA998x_I2S[2].
-	The second value defines the tda998x AP_ENA reg content when the DAI
-	in question is used. The implementation allows one or two DAIs. If two
-	DAIs are defined, they must be of different type.
-
-  - nxp,calib-gpios: calibration GPIO, which must correspond with the
-	gpio used for the TDA998x interrupt pin.
-
-[1] Documentation/sound/soc/dai.rst
-[2] include/dt-bindings/display/tda998x.h
-
-Example:
-
-#include <dt-bindings/display/tda998x.h>
-
-	tda998x: hdmi-encoder {
-		compatible = "nxp,tda998x";
-		reg = <0x70>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <27 2>;		/* falling edge */
-		pinctrl-0 = <&pmx_camera>;
-		pinctrl-names = "default";
-		video-ports = <0x230145>;
-
-		#sound-dai-cells = <2>;
-			     /*	DAI-format	AP_ENA reg value */
-		audio-ports = <	TDA998x_SPDIF	0x04
-				TDA998x_I2S	0x03>;
-
-	};
-- 
2.25.1

