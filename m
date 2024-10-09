Return-Path: <linux-omap+bounces-2366-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E099770A
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 22:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91AC2836FC
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 20:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D462D1E231C;
	Wed,  9 Oct 2024 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="xmKsTM0s"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737740849;
	Wed,  9 Oct 2024 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507399; cv=none; b=A8EFvk2VjDESWFvlbka1EafuxVHVeb8y9ukwryN+5Ur3MNP4RGhrt1YS+5u+ElkVJDOMKlzGWO4N2IMcLKvAaiqBDX6vbWjNXA548E98kl2TzbWOi9lD786RHn9qTSst1q9pcUE5Ne39g+IjKbbnp4ldA9RH2lZ/d0tAPntaw44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507399; c=relaxed/simple;
	bh=sB7L/+DP7+wsazntw0eYyJbiuzRfbOCPdlDYZcDQzsE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fd6mdYiIgH78mtX272xfAeR3RutFr/pj0IKrklVexojPV+iAPSvaRn9Q21GV3nIfp7VqxXLZE8FTWVKPEga0kLxJ91sGnMWF9c0nLQ1MGSJWZ1CRTiruuxVG6c/bwcZ8EVCh+judm7MZ4O19LhioPKmXaUe7+6SA6wHETqYNms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=xmKsTM0s; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KkVDYwEdUXr7HgZjftAfw5lK2G4Novf4Z64rkQh2tdA=; b=xmKsTM0sA8LbTuyNRCURdLBKbx
	F2XzQQg1XQKa4m3+TRUYMKi+az89ybwuJZpwHDKT7gNTYH2wN3wpxPzMdgP/05hgO2GUtalJblUAW
	MZ8Z2uvp/50na85I4+Z+AySNyyeVOtNxmxZjdFmnZQ1xtS08xuN7LufmfZF3j/VrBrN1JrzSWGOPV
	fwQjr9kECsMoROtDQ9rbSUOlz4MFHWqMcvUsoFLiIl/7Ky7UGLtcPWV1cxPILl0dOiRWXPLn90ywl
	Vw5bB1IeU9yLJ0ACeBPAqu2Ipy+q8LgTaA2Q1P2WLf7s+FssnRYEuhPn2ui1ITuDz1s9FVfzlnVnW
	ZI8bwg6w==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 2/2] dt-bindings: clock: ti: Convert divider.txt to json-schema
Date: Wed,  9 Oct 2024 22:56:19 +0200
Message-Id: <20241009205619.16250-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241009205619.16250-1-andreas@kemnade.info>
References: <20241009205619.16250-1-andreas@kemnade.info>
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
 .../devicetree/bindings/clock/ti/divider.txt  | 115 ------------
 .../bindings/clock/ti/ti,divider-clock.yaml   | 175 ++++++++++++++++++
 2 files changed, 175 insertions(+), 115 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/divider.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml

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
index 000000000000..31fe876fb40b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
@@ -0,0 +1,175 @@
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
+  ti,dividers: true
+
+  ti,bit-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      number of bits to shift the divider value
+
+  ti,min-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      min divisor for dividing the input clock rate, only
+      needed if the first divisor is offset from the default value (1)
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
+      dpll_usb_m2_ck: clock-controller@190 {
+        #clock-cells = <0>;
+        compatible = "ti,divider-clock";
+        clocks = <&dpll_usb_ck>;
+        ti,max-div = <127>;
+        reg = <0x190>;
+        ti,index-starts-at-one;
+      };
+
+      aess_fclk: clock-controller@528 {
+        #clock-cells = <0>;
+        compatible = "ti,divider-clock";
+        clocks = <&abe_clk>;
+        ti,bit-shift = <24>;
+        reg = <0x528>;
+        ti,max-div = <2>;
+      };
+
+      ssi_ssr_div_fck_3430es2: clock-controller@a40 {
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


