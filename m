Return-Path: <linux-omap+bounces-2455-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D39A3930
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 10:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D21C1F2334D
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 08:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA98A190067;
	Fri, 18 Oct 2024 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="GnO3vr+N"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845FF17DE36;
	Fri, 18 Oct 2024 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241640; cv=none; b=lLS6F9YcoQR8oxXQaJFTfJLjnggqaBMpgOo+O6Z1uxx3PTrjKtaqIoPuYu7ZKBjYFhj0CaK1o0bhTfpUXRRBbRJMJNi/0vlrCQrZz8ENsV5TVzu1JAwiXVjjNjT2459SCGj+jMeXupib4AiRqHRUaXDrdQMWkQ0FoR+EiQlPLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241640; c=relaxed/simple;
	bh=z07TPM6ZmW254J29j+WpD23CGoO+1NpGEwwwuAyjPEE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kImngTGGs8sBDgT5bJUVoRMQeW+bsOL3SHJlddhqLIvsCueaeYqQs9IX8p8zzV4gwRASMRG2uvjAZlUZg6nrvqSr5MyRrPl+kLdo62q2eYZNbmNHRtcEWsst5rxgFWyiqTrLIkyanUGSScXQGO8HVjruMYeu9ynW1T3+n78PRCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=GnO3vr+N; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=e+ZcZSqPvO9P23ddnJT1GBLV7Z9rbOQwEFyuiuNgaHA=; b=GnO3vr+Nf2IYD25oZBTOKdL3RA
	oHGXD2dMZf2e8h7DwTknoctgX4WMA2HYVNT+xG+r1EcfG/+Z4pojjb9IduaAhPLtZwGvR34SMdipx
	nralhghcNg7xg82INPfB3/Sd+jrjmmkJ7tbftSE73nzplguYEfcbTepT5KMK/PBtomkdyHdBz4Qf4
	r801Ff93kMMs/HorTo9QdRrHnbFah3Lj2i7ZWVFOZKmsXrAN4Ax3npMdsAoYao3705S3m0ZCxhoLO
	Um0xZn58pRktoo0jZKOKsIqo7IH7TaD4llM5IAKyXlZv8eda2jV38T0KxlXb9AMkuIG0I2xDnS/2T
	ujfQV8mQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-clk@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/2] dt-bindings: clock: ti: Convert divider.txt to json-schema
Date: Fri, 18 Oct 2024 10:53:47 +0200
Message-Id: <20241018085347.95071-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241018085347.95071-1-andreas@kemnade.info>
References: <20241018085347.95071-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OMAP divider clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/clock/ti/composite.txt           |   2 +-
 .../devicetree/bindings/clock/ti/divider.txt  | 115 -----------
 .../bindings/clock/ti/ti,divider-clock.yaml   | 193 ++++++++++++++++++
 3 files changed, 194 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/divider.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/composite.txt b/Documentation/devicetree/bindings/clock/ti/composite.txt
index 6f7e1331b546..b02f22490dcb 100644
--- a/Documentation/devicetree/bindings/clock/ti/composite.txt
+++ b/Documentation/devicetree/bindings/clock/ti/composite.txt
@@ -17,7 +17,7 @@ merged to this clock. The component clocks shall be of one of the
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 [2] Documentation/devicetree/bindings/clock/ti/mux.txt
-[3] Documentation/devicetree/bindings/clock/ti/divider.txt
+[3] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
 [4] Documentation/devicetree/bindings/clock/ti/gate.txt
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/clock/ti/divider.txt b/Documentation/devicetree/bindings/clock/ti/divider.txt
deleted file mode 100644
index 4d7c76f0b356..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/divider.txt
+++ /dev/null
@@ -1,115 +0,0 @@
-Binding for TI divider clock
-
-This binding uses the common clock binding[1].  It assumes a
-register-mapped adjustable clock rate divider that does not gate and has
-only one input clock or parent.  By default the value programmed into
-the register is one less than the actual divisor value.  E.g:
-
-register value		actual divisor value
-0			1
-1			2
-2			3
-
-This assumption may be modified by the following optional properties:
-
-ti,index-starts-at-one - valid divisor values start at 1, not the default
-of 0.  E.g:
-register value		actual divisor value
-1			1
-2			2
-3			3
-
-ti,index-power-of-two - valid divisor values are powers of two.  E.g:
-register value		actual divisor value
-0			1
-1			2
-2			4
-
-Additionally an array of valid dividers may be supplied like so:
-
-	ti,dividers = <4>, <8>, <0>, <16>;
-
-Which will map the resulting values to a divisor table by their index:
-register value		actual divisor value
-0			4
-1			8
-2			<invalid divisor, skipped>
-3			16
-
-Any zero value in this array means the corresponding bit-value is invalid
-and must not be used.
-
-The binding must also provide the register to control the divider and
-unless the divider array is provided, min and max dividers. Optionally
-the number of bits to shift that mask, if necessary. If the shift value
-is missing it is the same as supplying a zero shift.
-
-This binding can also optionally provide support to the hardware autoidle
-feature, see [2].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/ti/autoidle.txt
-
-Required properties:
-- compatible : shall be "ti,divider-clock" or "ti,composite-divider-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link to phandle of parent clock
-- reg : offset for register controlling adjustable divider
-
-Optional properties:
-- clock-output-names : from common clock binding.
-- ti,dividers : array of integers defining divisors
-- ti,bit-shift : number of bits to shift the divider value, defaults to 0
-- ti,min-div : min divisor for dividing the input clock rate, only
-  needed if the first divisor is offset from the default value (1)
-- ti,max-div : max divisor for dividing the input clock rate, only needed
-  if ti,dividers is not defined.
-- ti,index-starts-at-one : valid divisor programming starts at 1, not zero,
-  only valid if ti,dividers is not defined.
-- ti,index-power-of-two : valid divisor programming must be a power of two,
-  only valid if ti,dividers is not defined.
-- ti,autoidle-shift : bit shift of the autoidle enable bit for the clock,
-  see [2]
-- ti,invert-autoidle-bit : autoidle is enabled by setting the bit to 0,
-  see [2]
-- ti,set-rate-parent : clk_set_rate is propagated to parent
-- ti,latch-bit : latch the divider value to HW, only needed if the register
-  access requires this. As an example dra76x DPLL_GMAC H14 divider implements
-  such behavior.
-
-Examples:
-dpll_usb_m2_ck: dpll_usb_m2_ck@4a008190 {
-	#clock-cells = <0>;
-	compatible = "ti,divider-clock";
-	clocks = <&dpll_usb_ck>;
-	ti,max-div = <127>;
-	reg = <0x190>;
-	ti,index-starts-at-one;
-};
-
-aess_fclk: aess_fclk@4a004528 {
-	#clock-cells = <0>;
-	compatible = "ti,divider-clock";
-	clocks = <&abe_clk>;
-	ti,bit-shift = <24>;
-	reg = <0x528>;
-	ti,max-div = <2>;
-};
-
-dpll_core_m3x2_div_ck: dpll_core_m3x2_div_ck {
-	#clock-cells = <0>;
-	compatible = "ti,composite-divider-clock";
-	clocks = <&dpll_core_x2_ck>;
-	ti,max-div = <31>;
-	reg = <0x0134>;
-	ti,index-starts-at-one;
-};
-
-ssi_ssr_div_fck_3430es2: ssi_ssr_div_fck_3430es2 {
-	#clock-cells = <0>;
-	compatible = "ti,composite-divider-clock";
-	clocks = <&corex2_fck>;
-	ti,bit-shift = <8>;
-	reg = <0x0a40>;
-	ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
-};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
new file mode 100644
index 000000000000..3fbe236eb565
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments divider clock
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description: |
+  This clock It assumes a register-mapped adjustable clock rate divider
+  that does not gate and has only one input clock or parent.  By default the
+  value programmed into the register is one less than the actual divisor value.
+  E.g:
+
+  register value    actual divisor value
+  0                 1
+  1                 2
+  2                 3
+
+  This assumption may be modified by the following optional properties:
+
+  ti,index-starts-at-one - valid divisor values start at 1, not the default
+  of 0.  E.g:
+  register value    actual divisor value
+  1                 1
+  2                 2
+  3                 3
+
+  ti,index-power-of-two - valid divisor values are powers of two.  E.g:
+  register value    actual divisor value
+  0                 1
+  1                 2
+  2                 4
+
+  Additionally an array of valid dividers may be supplied like so:
+
+  ti,dividers = <4>, <8>, <0>, <16>;
+
+  Which will map the resulting values to a divisor table by their index:
+  register value    actual divisor value
+  0                 4
+  1                 8
+  2                 <invalid divisor, skipped>
+  3                 16
+
+  Any zero value in this array means the corresponding bit-value is invalid
+  and must not be used.
+
+  The binding must also provide the register to control the divider and
+  unless the divider array is provided, min and max dividers. Optionally
+  the number of bits to shift that mask, if necessary. If the shift value
+  is missing it is the same as supplying a zero shift.
+
+  This binding can also optionally provide support to the hardware autoidle
+  feature, see [1].
+
+  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
+
+properties:
+  compatible:
+    enum:
+      - ti,divider-clock
+      - ti,composite-divider-clock
+
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
+    maxItems: 1
+
+  ti,dividers:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      array of integers defining divisors
+
+  ti,bit-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      number of bits to shift the divider value
+    maximum: 31
+    default: 0
+
+  ti,min-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      min divisor for dividing the input clock rate, only
+      needed if the first divisor is offset from the default value (1)
+    minimum: 1
+    default: 1
+
+
+  ti,max-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      max divisor for dividing the input clock rate, only needed
+      if ti,dividers is not defined.
+
+  ti,index-starts-at-one:
+    type: boolean
+    description:
+      valid divisor programming starts at 1, not zero,
+      only valid if ti,dividers is not defined
+
+  ti,index-power-of-two:
+    type: boolean
+    description:
+      valid divisor programming must be a power of two,
+      only valid if ti,dividers is not defined.
+
+  ti,autoidle-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      bit shift of the autoidle enable bit for the clock,
+      see [1].
+    maximum: 31
+    default: 0
+
+  ti,invert-autoidle-bit:
+    type: boolean
+    description:
+      autoidle is enabled by setting the bit to 0,
+      see [1]
+
+  ti,set-rate-parent:
+    type: boolean
+    description:
+      clk_set_rate is propagated to parent            |
+
+  ti,latch-bit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      latch the divider value to HW, only needed if the register
+      compatible access requires this. As an example dra76x DPLL_GMAC
+      H14 divider implements such behavior.
+
+dependentSchemas:
+  ti,dividers:
+    properties:
+      ti,min-div: false
+      ti,max-div: false
+      ti,index-power-of-two: false
+      ti,index-starts-at-one: false
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
+      clock-controller@190 {
+        #clock-cells = <0>;
+        compatible = "ti,divider-clock";
+        clocks = <&dpll_usb_ck>;
+        ti,max-div = <127>;
+        reg = <0x190>;
+        ti,index-starts-at-one;
+      };
+
+      clock-controller@528 {
+        #clock-cells = <0>;
+        compatible = "ti,divider-clock";
+        clocks = <&abe_clk>;
+        ti,bit-shift = <24>;
+        reg = <0x528>;
+        ti,max-div = <2>;
+      };
+
+      clock-controller@a40 {
+        #clock-cells = <0>;
+        compatible = "ti,composite-divider-clock";
+        clocks = <&corex2_fck>;
+        ti,bit-shift = <8>;
+        reg = <0x0a40>;
+        ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
+      };
+    };
-- 
2.39.5


