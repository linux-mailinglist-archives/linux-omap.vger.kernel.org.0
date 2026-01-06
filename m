Return-Path: <linux-omap+bounces-5345-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53874CFAA55
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 20:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49AED30591D4
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 19:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1C93451C6;
	Tue,  6 Jan 2026 17:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tvVwcC8U"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E4733FE2B;
	Tue,  6 Jan 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721407; cv=none; b=HQNhuCd2kPGCaeDEasYcl9sBBFp4JP4RJ6LZPia7z0pJBZ/Jr5yUlYaHfkX2v6I+8bjPpsUWHj2mKxKpsabLJgCa40yofgaIirsOBjl2PYmD6R12WUDRDme2tnRcFjlzq8WVYSXTjE0RQcfcwXzm9Y0KYQWZLP4vbdbHpv9HWfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721407; c=relaxed/simple;
	bh=f0RIJwgQVq/mV+rQhublJd9MGZJIHAh4csiPypk9fmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huLVVYcr5kLGlr3hFKrpUpzThcg3JrPdLHPsaAbE2/AWFjLaGnrhdC4x0sLzKxRZY6TU1sks1l7HQ4px4Z8b9JE10V8C4Cs6yYn1EfUrJ7hB+4vXliHGDHKS6Dn6c3a2EXyvFXi0Z7v1SCcjjoI72UDezeQJRrurs9LgSct26tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tvVwcC8U; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E602FC1E4AB;
	Tue,  6 Jan 2026 17:42:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3A0C60739;
	Tue,  6 Jan 2026 17:43:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 447E5103C81A0;
	Tue,  6 Jan 2026 18:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fbSfNwB1WkSY2iPd/6BPZFGgPTacQL14qwc+lCPe/vo=;
	b=tvVwcC8UeJJh49uRdXVrnooCOXaJTZfK1m8Plsrf3n5nVyMnlI57ZJl2k5kkE2QSivkkU6
	PB4jCWb0GXCAaeB83P8Zag1qGn89K/gEkdfWDxj7n84oz2oynIUlUYcVTKRbkLIdfjJQpm
	brtFLpJwORGZZZik7HjQo8ZDx+fLAsY7QG0Ndi7xmWJ2O5y8SZeU1PkNYoRQJLIL4gqLkG
	pkGgVQbY9f+eCeebDIxMiyf67VdlPOdUbj6Bj+HzscZ4jOxyNUviL8Yx5IJ5i3jhLynQKJ
	UWe+pqCkeQatyHy2V0lFgHAZOk/fal34bFAo6SIQ8rOptq3th2ObvjQLoY5EZQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:17 +0100
Subject: [PATCH v3 01/22] dt-bindings: display: tilcdc: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-1-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Convert the device tree binding documentation for tilcdc
from plain text to DT binding schema.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Change in v3:
- Rename binding file to ti,am33xx-tilcdc.yaml.
- Use generic node name and drop unused label.
---
 .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  | 100 +++++++++++++++++++++
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 -----------------
 2 files changed, 100 insertions(+), 82 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml
new file mode 100644
index 0000000000000..eb0ebb678fa87
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Bootlin
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LCD Controller, found on AM335x, DA850, AM18x and OMAP-L138
+
+maintainers:
+  - Kory Maincent <kory.maincent@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,am33xx-tilcdc
+      - ti,da850-tilcdc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the hwmod associated to the LCDC
+
+  max-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum pixels per second that the memory interface / lcd
+      controller combination can sustain
+    # maximum: 2048*2048*60
+    maximum: 251658240
+
+  max-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum horizontal pixel width supported by the lcd controller.
+    maximum: 2048
+
+  max-pixelclock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum pixel clock that can be supported by the lcd controller
+      in KHz.
+
+  blue-and-red-wiring:
+    enum: [straight, crossed]
+    description:
+      This property deals with the LCDC revision 2 (found on AM335x)
+      color errata [1].
+       - "straight" indicates normal wiring that supports RGB565,
+         BGR888, and XBGR8888 color formats.
+       - "crossed" indicates wiring that has blue and red wires
+         crossed. This setup supports BGR565, RGB888 and XRGB8888
+         formats.
+       - If the property is not present or its value is not recognized
+         the legacy mode is assumed. This configuration supports RGB565,
+         RGB888 and XRGB8888 formats. However, depending on wiring, the red
+         and blue colors are swapped in either 16 or 24-bit color modes.
+
+       [1] There is an errata about AM335x color wiring. For 16-bit color
+       mode the wires work as they should (LCD_DATA[0:4] is for Blue[3:7]),
+       but for 24 bit color modes the wiring of blue and red components is
+       crossed and LCD_DATA[0:4] is for Red[3:7] and LCD_DATA[11:15] is
+       for Blue[3-7]. For more details see section 3.1.1 in AM335x
+       Silicon Errata
+       https://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumber=sprz360
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@4830e000 {
+        compatible = "ti,am33xx-tilcdc";
+        reg = <0x4830e000 0x1000>;
+        interrupt-parent = <&intc>;
+        interrupts = <36>;
+        ti,hwmods = "lcdc";
+
+        blue-and-red-wiring = "crossed";
+
+        port {
+            endpoint {
+                remote-endpoint = <&hdmi_0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
deleted file mode 100644
index 3b3d0bbfcfff4..0000000000000
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-Device-Tree bindings for tilcdc DRM driver
-
-Required properties:
- - compatible: value should be one of the following:
-    - "ti,am33xx-tilcdc" for AM335x based boards
-    - "ti,da850-tilcdc" for DA850/AM18x/OMAP-L138 based boards
- - interrupts: the interrupt number
- - reg: base address and size of the LCDC device
-
-Recommended properties:
- - ti,hwmods: Name of the hwmod associated to the LCDC
-
-Optional properties:
- - max-bandwidth: The maximum pixels per second that the memory
-   interface / lcd controller combination can sustain
- - max-width: The maximum horizontal pixel width supported by
-   the lcd controller.
- - max-pixelclock: The maximum pixel clock that can be supported
-   by the lcd controller in KHz.
- - blue-and-red-wiring: Recognized values "straight" or "crossed".
-   This property deals with the LCDC revision 2 (found on AM335x)
-   color errata [1].
-    - "straight" indicates normal wiring that supports RGB565,
-      BGR888, and XBGR8888 color formats.
-    - "crossed" indicates wiring that has blue and red wires
-      crossed. This setup supports BGR565, RGB888 and XRGB8888
-      formats.
-    - If the property is not present or its value is not recognized
-      the legacy mode is assumed. This configuration supports RGB565,
-      RGB888 and XRGB8888 formats. However, depending on wiring, the red
-      and blue colors are swapped in either 16 or 24-bit color modes.
-
-Optional nodes:
-
- - port/ports: to describe a connection to an external encoder. The
-   binding follows Documentation/devicetree/bindings/graph.txt and
-   supports a single port with a single endpoint.
-
- - See also Documentation/devicetree/bindings/display/tilcdc/panel.txt and
-   Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml for connecting
-   tfp410 DVI encoder or lcd panel to lcdc
-
-[1] There is an errata about AM335x color wiring. For 16-bit color mode
-    the wires work as they should (LCD_DATA[0:4] is for Blue[3:7]),
-    but for 24 bit color modes the wiring of blue and red components is
-    crossed and LCD_DATA[0:4] is for Red[3:7] and LCD_DATA[11:15] is
-    for Blue[3-7]. For more details see section 3.1.1 in AM335x
-    Silicon Errata:
-    https://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumber=sprz360
-
-Example:
-
-	fb: fb@4830e000 {
-		compatible = "ti,am33xx-tilcdc", "ti,da850-tilcdc";
-		reg = <0x4830e000 0x1000>;
-		interrupt-parent = <&intc>;
-		interrupts = <36>;
-		ti,hwmods = "lcdc";
-
-		blue-and-red-wiring = "crossed";
-
-		port {
-			lcdc_0: endpoint {
-				remote-endpoint = <&hdmi_0>;
-			};
-		};
-	};
-
-	tda19988: tda19988 {
-		compatible = "nxp,tda998x";
-		reg = <0x70>;
-
-		pinctrl-names = "default", "off";
-		pinctrl-0 = <&nxp_hdmi_bonelt_pins>;
-		pinctrl-1 = <&nxp_hdmi_bonelt_off_pins>;
-
-		port {
-			hdmi_0: endpoint {
-				remote-endpoint = <&lcdc_0>;
-			};
-		};
-	};

-- 
2.43.0


