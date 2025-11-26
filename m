Return-Path: <linux-omap+bounces-5041-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E78CC8B455
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 18:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38883B8D53
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 17:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11164340DA3;
	Wed, 26 Nov 2025 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XdIHFCWM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5518B340A79;
	Wed, 26 Nov 2025 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178619; cv=none; b=bvJ7Q3mpSPwxopaX0T0vCaAp42TNbktg7pNnUNuy4kkhpw7hgioN57as70eULXXQ1Wds1YiFx8r+VO2Nd8+By7eKG7lmaSjyZtfaC+V0s1VvrqMGVQ/zImgSuIZFh78iiqLWH9PYYmHjpn68YaZwEr92O46PCvJaTe9Pnf1Ivr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178619; c=relaxed/simple;
	bh=NObLl9fDFrFZkTv9xsvJQK5vK4J1/jFJFVcI30Ygmfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nb9c2VuRXSYnGVq+HqYaoYhrwRpOyWLEhjABvmmqRMeXfYOa3Lnwz8VYdMd2WiyeN/TjARDs/PN8bn+cuAj8K7XHpjXt77fkDgcXZ4y99MzHycl+QCTpQXqHZvKeZjESTWoEwhkIYe96c+6LnEx7vif+btfRcgDslgOJmdlyrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XdIHFCWM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E26094E418F9;
	Wed, 26 Nov 2025 17:36:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B41D560721;
	Wed, 26 Nov 2025 17:36:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6A24102F221D;
	Wed, 26 Nov 2025 18:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0CUr9ddV3oZ41q3/D/0z/oo3oYkxXbRVdv8SyL1wMI0=;
	b=XdIHFCWMG+5JwqdNGZHvzcPTLjOUAqtIc13sFCqdx8WbFpzLBq7SdG5+3ABrAJ8zaffh5F
	tkcakLaIexbu6VluNW93m3bfPyk0TfF53m9C03x3trO4Uacq1qfZzewsxrv5K+BrLiC+WZ
	VDS74JMKtjMMvi+/Dkcfzet1BBW4jP23Z9t4SWYxNpEcFDv23hnIL5Jug3P9Sv3GD5AYYM
	vR4A3S477UtgpN6NysxxlAHkihiyW4fRxuk0fH7h9iFbQ5+O6OTy7ZIa5gwhz7zI391bbq
	I1AuNnFoS50wmEKc3LcPCiOu2zUlf+h+p4i1Oz0kvLA/x2t3qH4+tAhyhDC0PQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:43 +0100
Subject: [PATCH 01/21] dt-bindings: display: tilcdc: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-1-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Convert the device tree binding documentation for tilcdc
from plain text to DT binding schema.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  | 82 ------------------
 .../devicetree/bindings/display/tilcdc/tilcdc.yaml | 96 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 82 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
new file mode 100644
index 0000000000000..34ac1fd04d5c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tilcdc/tilcdc.yaml#
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
+
+  max-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum horizontal pixel width supported by the lcd controller.
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
+    tilcdc: tilcdc@4830e000 {
+        compatible = "ti,am33xx-tilcdc";
+        reg = <0x4830e000 0x1000>;
+        interrupt-parent = <&intc>;
+        interrupts = <36>;
+        ti,hwmods = "lcdc";
+
+        blue-and-red-wiring = "crossed";
+
+        port {
+            lcdc_0: endpoint {
+                remote-endpoint = <&hdmi_0>;
+            };
+        };
+    };

-- 
2.43.0


