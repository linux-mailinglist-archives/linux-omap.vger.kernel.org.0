Return-Path: <linux-omap+bounces-2917-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E09FDF31
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 14:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F9BB3A1843
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 13:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E971946C7;
	Sun, 29 Dec 2024 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2v7eaEC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78E192D77;
	Sun, 29 Dec 2024 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735480442; cv=none; b=P3E5eIT0mEgeeEFirzgA5MnG+fR9z4SAnE6S6qzSQuoRRtWNiVE9ofh57QCbrDNsCgh2bsZDWCm/WsWzmyLgZhDTFyMGZtWnA3I6XTC7HvKx+o7MYVov5C4SKlPTvUKvoIt6hKyAgnWcHRP/zk2f682MoZGT2btLq9xFkhGrE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735480442; c=relaxed/simple;
	bh=Mjk7H9T4yOglu2hD+Hop4F3BZQxBR6z2904vQhHkkUA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lpf8Mfa28qfbR+8oZHsfWAdZdYpHYeqd4Nr3Y9IrNgiNa5Plg33iP+lrlucXcefyd2LeJZ7yTHSSlUqhC9fJvQ76k6CoBl3a/o9GPQhIk4smOwGgJ4O+ER/+qi97mmH5Nv23B5TXlOdl2w74EkYqlyYk05pbP5Hl0/XVoBMlJdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2v7eaEC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470DAC4CED1;
	Sun, 29 Dec 2024 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735480441;
	bh=Mjk7H9T4yOglu2hD+Hop4F3BZQxBR6z2904vQhHkkUA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L2v7eaECT3SyNdexIgdukCMzHRPzZH94Y8ZQEtDXYukUc7hVEpbTa/ElyJnwunZ2H
	 c6II6VbyksGjegG8AAhpL6R6ZEf5mncUe9qkzmMcS7AovawPqeQxTVbvI9y0l/JM14
	 gq8Hfj/8mddhM2mVStec1FWy7KGKShARN5jd3TfUPV47x136C2BODMqlsgWNH6880X
	 NpoUgWCtR30AsJC2T+tu0p9Co5P3MV/UhzkYjUC4bZlrTII4Hbo+GodOtqHShAZB4S
	 8ZhDp5ewpCKlbnOxsIkRc5l9xyyePIVBTEc47lP0a66O3iCLJ0DRZIxQZ6oLHPQbEp
	 2o9ErIIbnICIQ==
From: akemnade@kernel.org
To: Tero Kristo <kristo@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: clock: ti: Convert composite.txt to json-schema
Date: Sun, 29 Dec 2024 14:53:51 +0100
Message-Id: <20241229135351.5014-3-akemnade@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241229135351.5014-1-akemnade@kernel.org>
References: <20241229135351.5014-1-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <andreas@kemnade.info>

Convert the OMAP gate clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.
Choose GPL-only license because original binding was also GPL.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/clock/ti/composite.txt           | 55 -------------
 .../bindings/clock/ti/ti,composite-clock.yaml | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/composite.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/composite.txt b/Documentation/devicetree/bindings/clock/ti/composite.txt
deleted file mode 100644
index 238e6f7d74f8..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/composite.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Binding for TI composite clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped composite clock with multiple different sub-types;
-
-a multiplexer clock with multiple input clock signals or parents, one
-of which can be selected as output, this behaves exactly as [2]
-
-an adjustable clock rate divider, this behaves exactly as [3]
-
-a gating function which can be used to enable and disable the output
-clock, this behaves exactly as [4]
-
-The binding must provide a list of the component clocks that shall be
-merged to this clock. The component clocks shall be of one of the
-"ti,*composite*-clock" types.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
-[3] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
-[4] Documentation/devicetree/bindings/clock/ti/gate.txt
-
-Required properties:
-- compatible : shall be: "ti,composite-clock"
-- clocks : link phandles of component clocks
-- #clock-cells : from common clock binding; shall be set to 0.
-
-Optional properties:
-- clock-output-names : from common clock binding.
-
-Examples:
-
-usb_l4_gate_ick: usb_l4_gate_ick {
-	#clock-cells = <0>;
-	compatible = "ti,composite-interface-clock";
-	clocks = <&l4_ick>;
-	ti,bit-shift = <5>;
-	reg = <0x0a10>;
-};
-
-usb_l4_div_ick: usb_l4_div_ick {
-	#clock-cells = <0>;
-	compatible = "ti,composite-divider-clock";
-	clocks = <&l4_ick>;
-	ti,bit-shift = <4>;
-	ti,max-div = <1>;
-	reg = <0x0a40>;
-	ti,index-starts-at-one;
-};
-
-usb_l4_ick: usb_l4_ick {
-	#clock-cells = <0>;
-	compatible = "ti,composite-clock";
-	clocks = <&usb_l4_gate_ick>, <&usb_l4_div_ick>;
-};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
new file mode 100644
index 000000000000..b7063764bc0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,composite-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments composite clock
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description: |
+  This binding assumes a register-mapped composite clock with multiple
+  different sub-types;
+
+  a multiplexer clock with multiple input clock signals or parents, one
+  of which can be selected as output, this behaves exactly as [1].
+
+  an adjustable clock rate divider, this behaves exactly as [2].
+
+  a gating function which can be used to enable and disable the output
+  clock, this behaves exactly as [3].
+
+  The binding must provide a list of the component clocks that shall be
+  merged to this clock. The component clocks shall be of one of the
+  "ti,*composite*-clock" types.
+
+  [1] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
+  [2] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
+  [3] Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
+
+properties:
+  compatible:
+    const: ti,composite-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks: true
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      usb_l4_gate_ick: clock-controller@a10 {
+        #clock-cells = <0>;
+        compatible = "ti,composite-interface-clock";
+        clocks = <&l4_ick>;
+        ti,bit-shift = <5>;
+        reg = <0x0a10>;
+      };
+
+      usb_l4_div_ick: clock-controller@a40 {
+        #clock-cells = <0>;
+        compatible = "ti,composite-divider-clock";
+        clocks = <&l4_ick>;
+        ti,bit-shift = <4>;
+        ti,max-div = <1>;
+        reg = <0x0a40>;
+        ti,index-starts-at-one;
+      };
+    };
+
+    clock-controller {
+      #clock-cells = <0>;
+      compatible = "ti,composite-clock";
+      clocks = <&usb_l4_gate_ick>, <&usb_l4_div_ick>;
+    };
-- 
2.39.5


