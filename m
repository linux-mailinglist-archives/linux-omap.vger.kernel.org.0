Return-Path: <linux-omap+bounces-2569-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C19BB6D9
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 14:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5D731F2194F
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 13:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896911339A4;
	Mon,  4 Nov 2024 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="cf8P6HaJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3B42A9E;
	Mon,  4 Nov 2024 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728580; cv=none; b=i0I2qiqkOaCUU1FrYMjMTQ7Gt1vLygwQkCemuG5Sgz7Acp0KY8dE16N2TtK5KLeansz1aTGPQcAJBsruQPosCpUxLj0JKlR6g3OznIRexGZAm1X1j0nnHcFH7CNd+isEz8yEDiT8YULzwvQ1lGGn3xN6FkDv8UkHadagYnb9AT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728580; c=relaxed/simple;
	bh=LFnGHyIFnPZpnC4W0TkiCtiiQ6Tj7q5qpaFCImtsPX0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=A75lrw3aWl5xTI8wh8d8kTFm6GI7IV9khMO5t2FGyFG8p9uWl1tHvU7C+v3Sxsk64zQDUL6ZlAHG3KPb1GreSS3LMb2R2vc116oMM3t9fGWSRvAN/nlW/7bKK9YOVN1lvBsnO1i3mnTPic3gTS4MYr+gAKeFSIHdK4WRh2YiDsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=cf8P6HaJ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=AHIiq5Bgi/FTE/bmYNE1/BMipbYGBmIox57V0t9XEzE=; b=cf8P6HaJpBSwdOjWDt9jLXknGU
	xbRVUw9y1lcilcRVpw7gpWcW9xvDjGY4tRMqYV5a5Dqj473gE8+fKb8momeqLs1eEjWTHIGdAGzRj
	FemwuVr6LK5NHy2UY6O/4OKU1cvNM9dag3tCPDPgEfIlHD4slWLnYkQnbg8dO2Fk8ZSut39hphmIy
	qC3uTAz5kwhGntFSLpeQh8oiv7owjKi2+Ilm1ZxwwvL39CgkKnD3Urd0jEfIyn5nwEB4lTQrKBOLK
	cPYztuudPUD4if8ElH6d8ktDCoQR6XIQTJmPEQpzutQLLka4vN+FCJyaqi4I4YprF5iSIFbib4f7A
	wNDjtSKA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
Date: Mon,  4 Nov 2024 14:55:49 +0100
Message-Id: <20241104135549.38486-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OMAP mux clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.
Choose GPL-only license because original binding was also GPL.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/clock/ti/composite.txt           |   2 +-
 .../devicetree/bindings/clock/ti/mux.txt      |  78 -----------
 .../bindings/clock/ti/ti,mux-clock.yaml       | 123 ++++++++++++++++++
 3 files changed, 124 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/mux.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/composite.txt b/Documentation/devicetree/bindings/clock/ti/composite.txt
index b02f22490dcb..238e6f7d74f8 100644
--- a/Documentation/devicetree/bindings/clock/ti/composite.txt
+++ b/Documentation/devicetree/bindings/clock/ti/composite.txt
@@ -16,7 +16,7 @@ merged to this clock. The component clocks shall be of one of the
 "ti,*composite*-clock" types.
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/ti/mux.txt
+[2] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
 [3] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
 [4] Documentation/devicetree/bindings/clock/ti/gate.txt
 
diff --git a/Documentation/devicetree/bindings/clock/ti/mux.txt b/Documentation/devicetree/bindings/clock/ti/mux.txt
deleted file mode 100644
index cd56d3c1c09f..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/mux.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-Binding for TI mux clock.
-
-This binding uses the common clock binding[1].  It assumes a
-register-mapped multiplexer with multiple input clock signals or
-parents, one of which can be selected as output.  This clock does not
-gate or adjust the parent rate via a divider or multiplier.
-
-By default the "clocks" property lists the parents in the same order
-as they are programmed into the register.  E.g:
-
-	clocks = <&foo_clock>, <&bar_clock>, <&baz_clock>;
-
-results in programming the register as follows:
-
-register value		selected parent clock
-0			foo_clock
-1			bar_clock
-2			baz_clock
-
-Some clock controller IPs do not allow a value of zero to be programmed
-into the register, instead indexing begins at 1.  The optional property
-"index-starts-at-one" modified the scheme as follows:
-
-register value		selected clock parent
-1			foo_clock
-2			bar_clock
-3			baz_clock
-
-The binding must provide the register to control the mux. Optionally
-the number of bits to shift the control field in the register can be
-supplied. If the shift value is missing it is the same as supplying
-a zero shift.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,mux-clock" or "ti,composite-mux-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of parent clocks
-- reg : register offset for register controlling adjustable mux
-
-Optional properties:
-- clock-output-names : from common clock binding.
-- ti,bit-shift : number of bits to shift the bit-mask, defaults to
-  0 if not present
-- ti,index-starts-at-one : valid input select programming starts at 1, not
-  zero
-- ti,set-rate-parent : clk_set_rate is propagated to parent clock,
-  not supported by the composite-mux-clock subtype
-- ti,latch-bit : latch the mux value to HW, only needed if the register
-  access requires this. As an example, dra7x DPLL_GMAC H14 muxing
-  implements such behavior.
-
-Examples:
-
-sys_clkin_ck: sys_clkin_ck@4a306110 {
-	#clock-cells = <0>;
-	compatible = "ti,mux-clock";
-	clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>, <&virt_19200000_ck>, <&virt_26000000_ck>, <&virt_27000000_ck>, <&virt_38400000_ck>;
-	reg = <0x0110>;
-	ti,index-starts-at-one;
-};
-
-abe_dpll_bypass_clk_mux_ck: abe_dpll_bypass_clk_mux_ck@4a306108 {
-	#clock-cells = <0>;
-	compatible = "ti,mux-clock";
-	clocks = <&sys_clkin_ck>, <&sys_32k_ck>;
-	ti,bit-shift = <24>;
-	reg = <0x0108>;
-};
-
-mcbsp5_mux_fck: mcbsp5_mux_fck {
-	#clock-cells = <0>;
-	compatible = "ti,composite-mux-clock";
-	clocks = <&core_96m_fck>, <&mcbsp_clks>;
-	ti,bit-shift = <4>;
-	reg = <0x02d8>;
-};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
new file mode 100644
index 000000000000..b271ab86dde1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments mux clock
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description: |
+  This clock assumes a register-mapped multiplexer with multiple inpt clock
+  signals or parents, one of which can be selected as output. This clock does
+  not gate or adjust the parent rate via a divider or multiplier.
+
+  By default the "clocks" property lists the parents in the same order
+  as they are programmed into the register.  E.g:
+
+    clocks = <&foo_clock>, <&bar_clock>, <&baz_clock>;
+
+  results in programming the register as follows:
+
+  register value   selected parent clock
+  0                foo_clock
+  1                bar_clock
+  2                baz_clock
+
+  Some clock controller IPs do not allow a value of zero to be programmed
+  into the register, instead indexing begins at 1.  The optional property
+  "index-starts-at-one" modified the scheme as follows:
+
+  register value   selected clock parent
+  1                foo_clock
+  2                bar_clock
+  3                baz_clock
+
+  The binding must provide the register to control the mux. Optionally
+  the number of bits to shift the control field in the register can be
+  supplied. If the shift value is missing it is the same as supplying
+  a zero shift.
+
+properties:
+  compatible:
+    enum:
+      - ti,mux-clock
+      - ti,composite-mux-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks: true
+
+  clock-output-names:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  ti,bit-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      number of bits to shift the bit-mask, defaults to 0 if not present
+    maximum: 31
+    default: 0
+
+  ti,index-starts-at-one:
+    type: boolean
+    description:
+      valid input select programming starts at 1, not zero
+
+  ti,set-rate-parent:
+    type: boolean
+    description:
+      clk_set_rate is propagated to parent clock,
+      not supported by the composite-mux-clock subtype.
+  ti,latch-bit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      latch the mux value to HW, only needed if the register
+      access requires this. As an example, dra7x DPLL_GMAC H14 muxing
+      implements such behavior.
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,composite-mux-clock
+then:
+  properties:
+    ti,set-rate-parent: false
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@110 {
+        #clock-cells = <0>;
+        compatible = "ti,mux-clock";
+        clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>;
+        reg = <0x0110>;
+        ti,index-starts-at-one;
+        ti,set-rate-parent;
+      };
+
+      clock-controller@120 {
+        #clock-cells = <0>;
+        compatible = "ti,composite-mux-clock";
+        clocks = <&core_96m_fck>, <&mcbsp_clks>;
+        ti,bit-shift = <4>;
+        reg = <0x02d8>;
+      };
+    };
-- 
2.39.5


