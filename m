Return-Path: <linux-omap+bounces-2669-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C909C5F4E
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 18:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15ADAB81C4A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 16:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78F5205AC6;
	Tue, 12 Nov 2024 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="oWUxLxDY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B762038B3;
	Tue, 12 Nov 2024 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731428801; cv=none; b=kkZHl7y2xwa0e96LS2lh3i0fOEZlfj22X9I/vm9OlrSq6PyG2rQegaYHGJTFe6cINGPJe+HrFIiHcmCCITghT0vW7QOq+QNWB1cBAQ6Xn5T5TfTXjupt62no5MhxXMVc+Dh8YYTqffeNt5Lh7oXvzKfmOtXEPJs30jsuDBIwwso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731428801; c=relaxed/simple;
	bh=IqEczWekzxYl+rUQSLzOwNdhVtKicDZtXRp4rHyUOkk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EyRXf1RwgTA8/CXG18gUvM5IEka2j28oijaJLZqfsKb5xr/liRD1kasGjIjf37FMxeiVC6r4mFO/k39+JoOCm7bSQieSYpgnUi5oK77Tkxu47P0fybcqt0fiqL3hm36Yk/Ug+A1UZKRO49XSjSHOBeF6I0Zai8H9EWpf1ZIIte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=oWUxLxDY; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=OoRkpTwRzRzvN9NjbJDTBcpLX4syiHChqdr6ee/ygJQ=; b=oWUxLxDYbTgDQLD47pCqbMEyq9
	uJ+F249SI7GTHT8dyDzqCFi8/1Tqg74UDk5ltVIVCgE7BfoJIBMRNfbhhN9XdVHoSHRDY5SCMyk6Q
	dold7r8M+zuYyZgq2Cu7Ye41TjMCV60HEGaJCox26OfjlR6Qiv11gvXoNvKJ8ezbjc6iR9OfkX8aE
	5uyLwDeIug2kYTSMcmQ847Si00n8bamWq8s6fosRdNtvD6ht9Qzp3UHkdl9PBj26tri3g9xrctu1h
	3C78QGjJOltwyRfcwYmVut/mJLlVLZq/RpB6RCg9ewOoYzWJWWNvhOVcOTd6vXU/HC0xpPV6VaNY5
	ovwHdtEA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3] dt-bindings: clock: ti: Convert mux.txt to json-schema
Date: Tue, 12 Nov 2024 17:26:18 +0100
Message-Id: <20241112162618.400194-1-andreas@kemnade.info>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in V3:
- reordering properties in examples

Changes in V2:
- some orthography fixes
- fix addresses in example
- no prose for defaults
- constraints for latch-bit

 .../bindings/clock/ti/composite.txt           |   2 +-
 .../devicetree/bindings/clock/ti/mux.txt      |  78 -----------
 .../bindings/clock/ti/ti,mux-clock.yaml       | 125 ++++++++++++++++++
 3 files changed, 126 insertions(+), 79 deletions(-)
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
index 000000000000..485b6aae85d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
@@ -0,0 +1,125 @@
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
+  Results in programming the register as follows:
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
+      Number of bits to shift the bit-mask
+    maximum: 31
+    default: 0
+
+  ti,index-starts-at-one:
+    type: boolean
+    description:
+      Valid input select programming starts at 1, not zero
+
+  ti,set-rate-parent:
+    type: boolean
+    description:
+      clk_set_rate is propagated to parent clock,
+      not supported by the composite-mux-clock subtype.
+
+  ti,latch-bit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Latch the mux value to HW, only needed if the register
+      access requires this. As an example, dra7x DPLL_GMAC H14 muxing
+      implements such behavior.
+    maximum: 31
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
+        compatible = "ti,mux-clock";
+        reg = <0x0110>;
+        #clock-cells = <0>;
+        clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>;
+        ti,index-starts-at-one;
+        ti,set-rate-parent;
+      };
+
+      clock-controller@120 {
+        compatible = "ti,composite-mux-clock";
+        reg = <0x0120>;
+        #clock-cells = <0>;
+        clocks = <&core_96m_fck>, <&mcbsp_clks>;
+        ti,bit-shift = <4>;
+      };
+    };
-- 
2.39.5


