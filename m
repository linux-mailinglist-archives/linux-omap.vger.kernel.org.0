Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBF016C003
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 12:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbgBYLxq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 06:53:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38734 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbgBYLxq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 06:53:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 3C3E9294C05
Received: by earth.universe (Postfix, from userid 1000)
        id E7EE93C0C83; Tue, 25 Feb 2020 12:53:41 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 57/56] dt-bindings: display: panel-dsi-cm: convert to YAML
Date:   Tue, 25 Feb 2020 12:53:41 +0100
Message-Id: <20200225115341.3558245-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert panel-dsi-cm bindings to YAML and add
missing properties while at it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/display/panel/panel-dsi-cm.txt   | 31 ------
 .../bindings/display/panel/panel-dsi-cm.yaml  | 97 +++++++++++++++++++
 2 files changed, 97 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
deleted file mode 100644
index f92d5c9adfc5..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Generic MIPI DSI Command Mode Panel
-===================================
-
-Required properties:
-- compatible: "panel-dsi-cm"
-- reg: DSI channel number
-
-Optional properties:
-- label: a symbolic name for the panel
-- reset-gpios: panel reset gpio
-- te-gpios: panel TE gpio
-
-Required nodes:
-- Video port for DSI input
-
-Example
--------
-
-lcd0: panel@0 {
-	compatible = "tpo,taal", "panel-dsi-cm";
-	label = "lcd0";
-	reg = <0>;
-
-	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
-
-	port {
-		lcd0_in: endpoint {
-			remote-endpoint = <&dsi1_out_ep>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
new file mode 100644
index 000000000000..ca61171ae145
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-dsi-cm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DSI command mode panels
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+  - Sebastian Reichel <sre@kernel.org>
+
+description: |
+  This binding file is a collection of the DSI panels that
+  are usually driven in command mode. If no backlight is
+  referenced via the optional backlight property, the DSI
+  panel is assumed to have native backlight support.
+  The panel may use an OF graph binding for the association
+  to the display, or it may be a direct child node of the
+  display.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+      # compatible must be listed in alphabetical order, ordered by compatible.
+      # The description in the comment is mandatory for each compatible.
+      - motorola,droid4-panel, panel-dsi-cm
+      - nokia,himalaya, panel-dsi-cm
+      - tpo,taal, panel-dsi-cm
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  te-gpios:
+    maxItems: 1
+    description:
+      Specifier for a GPIO connected to the panel TE (tearing event) signal.
+      The GPIO informs the system, that data should be sent to the display
+      on rising edges of the GPIO to avoid (or reduce) tearing effects.
+      Falling edge can be supported by inverting the GPIO specifier polarity
+      flag.
+
+  vddi-supply:
+    description:
+      Display panels require power to be supplied. While several panels need
+      more than one power supply with panel-specific constraints governing the
+      order and timings of the power supplies, in many cases a single power
+      supply is sufficient, either because the panel has a single power rail, or
+      because all its power rails can be driven by the same supply. In that case
+      the vddi-supply property specifies the supply powering the panel as a
+      phandle to a regulator.
+
+  vpnl-supply:
+    description:
+      When the display panel needs a second power supply, this property can be
+      used in addition to vddi-supply. Both supplies will be enabled at the
+      same time before the panel is being accessed.
+
+  width-mm: true
+  height-mm: true
+  label: true
+  rotation: true
+  panel-timing: true
+  port: true
+  reset-gpios: true
+  backlight: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - reg
+
+examples:
+  - |
+    dsi1@12345678 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "tpo,taal", "panel-dsi-cm";
+        label = "lcd0";
+        reg = <0>;
+        reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&dsi1_out_ep>;
+          };
+        };
+      };
+    };
-- 
2.25.0

