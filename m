Return-Path: <linux-omap+bounces-2990-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5FA01AC5
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2025 18:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5FDF7A1695
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2025 17:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA180165F13;
	Sun,  5 Jan 2025 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="t8ftkCCW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B735336D;
	Sun,  5 Jan 2025 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736096948; cv=none; b=uriULr4dq/nwQPg9NfJVnbfH/l9t6RFEZuNvRcdldJenCfBaJJOXkvJ1DvlS78SNvdft/quyKH4w+zr5IrTPeDHbjkBI8H3OSpuxK5HZjN4lHAjBWWhfWv7ZxP3qg31Lxzv4QgXFbqFelMLqqgiUxUFYryYGDCco4Qguje96488=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736096948; c=relaxed/simple;
	bh=GyXX1xgwxDQnJTtFfSH0NCj6dbOlZdD+P4lPF1azVGw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=by2umiIbuOBXm68QuDUiBDdrydCKndOWfc1OC6EM/O4RFYFUG74TiuojI3YUjN7htkWtlWhEjL8PLETiohHSzXQokS7NcbT7p/bAarnIXZ1wB7Y39A5WYAUmRoyfaPPGUhpZGBCc4K2IEahkyfzSMs6ZD0w5zQArfRdXDyBA+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=t8ftkCCW; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=f5CUdA3v1pvk6RnXG4q/EtVFObfrYNfr/RDS/iTtu6s=; b=t8ftkCCWdPH6VYdx5QDz+lGzWR
	cWmp8/82tu5IceUUjFroayZXy26WCQF5Ei/n7fL/3MDMsHSN2TAPWfTAgzC8p8xVOFlTAOuC4ULrK
	AQa+RHWj+qVYo0U02RCh4+Yw2Y6ofGHAcmIzrSkFPuITIMqUWHtKUXfxt3y67cDQuCIDQyO2egkYx
	lZvOgm1NZrLyvzNE1+lqB6dXjxn9vB1MaxtdnxEuXWuo+49eHbqy2KBye6S735GE1MqYWLFh6qiGt
	Epq5IjIqP4B1Qx+wQgOW2jzOdpBKvb9e8wfRjYG77rFGusiXlFZ80w7cdwQwSqBB0FCn1oVBC4WyG
	byeu4gQA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: clock: ti: Convert composite.txt to json-schema
Date: Sun,  5 Jan 2025 18:08:54 +0100
Message-Id: <20250105170854.408875-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250105170854.408875-1-andreas@kemnade.info>
References: <20250105170854.408875-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OMAP gate clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.
Choose GPL-only license because original binding was also GPL.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/clock/ti/composite.txt           | 55 -------------
 .../bindings/clock/ti/ti,composite-clock.yaml | 82 +++++++++++++++++++
 2 files changed, 82 insertions(+), 55 deletions(-)
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
index 000000000000..2ab64dd129fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
@@ -0,0 +1,82 @@
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
+  *Depcrecated design pattern: one node per clock*
+
+  This binding assumes a register-mapped composite clock with multiple
+  different sub-types:
+
+    a multiplexer clock with multiple input clock signals or parents, one
+    of which can be selected as output, this behaves exactly as [1].
+
+    an adjustable clock rate divider, this behaves exactly as [2].
+
+    a gating function which can be used to enable and disable the output
+    clock, this behaves exactly as [3].
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
+        compatible = "ti,composite-gate-clock";
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


