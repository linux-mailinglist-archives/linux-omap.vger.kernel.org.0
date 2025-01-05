Return-Path: <linux-omap+bounces-2991-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D9A01AC8
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2025 18:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C37188323F
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2025 17:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC541922C0;
	Sun,  5 Jan 2025 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="kygtfAaR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37614D44D;
	Sun,  5 Jan 2025 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736096949; cv=none; b=qe+FHlk9SXHZd6zTy6j1T7wEnTFmz+kbcLaWUaQ+YZEPU8J3fVdlN/1X8QpEo+vYsXibLgREf+l34UZKobVHGSKy5d9q59sNL7VOM7mdsXpzNqhUur2OCxbig+SeT6/qztnlMlh4aUrmIvN/HTfT5pasSj1oXeVh32SEbIGXoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736096949; c=relaxed/simple;
	bh=FFVRSI9xYD3g9SweNGZa964KQWVtX9yAVrCRElRuWlw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frXejgvypYlFvocEgAh0F1twvs/EtX32KmLsYPd0u7sYaATQ1jET3pVO1svDIPpZkX8SXNbiaZwxa90pEVVUIJStZbvfEJ/gQ/uQJeY/+FziG08/S0AMOqvfTNi+SpioVrdFtgeyqEpjyelV67wf07AYrHmjJdsEaV5bg/w5LiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=kygtfAaR; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Z9oVUYKGT1xg9Xl7f1QIQquhd2zA3tfKAmTmGuRCsvA=; b=kygtfAaRQUf1OLgoZSxtTO1Pih
	Ou+TdGzZ5A0RB7d9eTNZDSa4SiJDBFZD24wD8/54l3T3gnuefafSFF09Jmb0ZqIko8h2Flg3ewggf
	l58IzrJW21RzLMZ2e1dt6IvgJdsNNcng8ybkpIXukaz2KcSsuCcPDP8fxVLO+yBIIS7PTrkG0lQCg
	0w9IAKrW15V9Tfs9F1vzitbWo3BR+rkeZJQIZs5rq0psn8UlYP51SWLhYBHmf2EqNIAuyfzXZB2C2
	Td5tACtIVvB5v+r5v1zcGfqZWjSjwIImR4CrT2zdMgOFw6od0UpvGNo1YTlyR4xSEo+RyTZaS2M/w
	h+pc4i0w==;
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
Subject: [PATCH v2 1/2] dt-bindings: clock: ti: Convert gate.txt to json-schema
Date: Sun,  5 Jan 2025 18:08:53 +0100
Message-Id: <20250105170854.408875-2-andreas@kemnade.info>
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
Clean up the examples during conversion to meet modern standards and
remove examples with no additional value.
Due to usage in code and existing devicetree binding, add the
ti,set-rate-parent property.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/clock/ti/gate.txt     | 105 ---------------
 .../bindings/clock/ti/ti,gate-clock.yaml      | 125 ++++++++++++++++++
 2 files changed, 125 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/gate.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/gate.txt b/Documentation/devicetree/bindings/clock/ti/gate.txt
deleted file mode 100644
index a8e0335b006a..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/gate.txt
+++ /dev/null
@@ -1,105 +0,0 @@
-Binding for Texas Instruments gate clock.
-
-This binding uses the common clock binding[1]. This clock is
-quite much similar to the basic gate-clock [2], however,
-it supports a number of additional features. If no register
-is provided for this clock, the code assumes that a clockdomain
-will be controlled instead and the corresponding hw-ops for
-that is used.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
-[3] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
-
-Required properties:
-- compatible : shall be one of:
-  "ti,gate-clock" - basic gate clock
-  "ti,wait-gate-clock" - gate clock which waits until clock is active before
-			 returning from clk_enable()
-  "ti,dss-gate-clock" - gate clock with DSS specific hardware handling
-  "ti,am35xx-gate-clock" - gate clock with AM35xx specific hardware handling
-  "ti,clkdm-gate-clock" - clockdomain gate clock, which derives its functional
-			  clock directly from a clockdomain, see [3] how
-			  to map clockdomains properly
-  "ti,hsdiv-gate-clock" - gate clock with OMAP36xx specific hardware handling,
-			  required for a hardware errata
-  "ti,composite-gate-clock" - composite gate clock, to be part of composite
-			      clock
-  "ti,composite-no-wait-gate-clock" - composite gate clock that does not wait
-				      for clock to be active before returning
-				      from clk_enable()
-- #clock-cells : from common clock binding; shall be set to 0
-- clocks : link to phandle of parent clock
-- reg : offset for register controlling adjustable gate, not needed for
-	ti,clkdm-gate-clock type
-
-Optional properties:
-- clock-output-names : from common clock binding.
-- ti,bit-shift : bit shift for programming the clock gate, invalid for
-		 ti,clkdm-gate-clock type
-- ti,set-bit-to-disable : inverts default gate programming. Setting the bit
-  gates the clock and clearing the bit ungates the clock.
-
-Examples:
-	mmchs2_fck: mmchs2_fck@48004a00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <25>;
-	};
-
-	uart4_fck_am35xx: uart4_fck_am35xx {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_48m_fck>;
-		reg = <0x0a00>;
-		ti,bit-shift = <23>;
-	};
-
-	dss1_alwon_fck_3430es2: dss1_alwon_fck_3430es2@48004e00 {
-		#clock-cells = <0>;
-		compatible = "ti,dss-gate-clock";
-		clocks = <&dpll4_m4x2_ck>;
-		reg = <0x0e00>;
-		ti,bit-shift = <0>;
-	};
-
-	emac_ick: emac_ick@4800259c {
-		#clock-cells = <0>;
-		compatible = "ti,am35xx-gate-clock";
-		clocks = <&ipss_ick>;
-		reg = <0x059c>;
-		ti,bit-shift = <1>;
-	};
-
-	emu_src_ck: emu_src_ck {
-		#clock-cells = <0>;
-		compatible = "ti,clkdm-gate-clock";
-		clocks = <&emu_src_mux_ck>;
-	};
-
-	dpll4_m2x2_ck: dpll4_m2x2_ck@48004d00 {
-		#clock-cells = <0>;
-		compatible = "ti,hsdiv-gate-clock";
-		clocks = <&dpll4_m2x2_mul_ck>;
-		ti,bit-shift = <0x1b>;
-		reg = <0x0d00>;
-		ti,set-bit-to-disable;
-	};
-
-	vlynq_gate_fck: vlynq_gate_fck {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&core_ck>;
-		ti,bit-shift = <3>;
-		reg = <0x0200>;
-	};
-
-	sys_clkout2_src_gate: sys_clkout2_src_gate {
-		#clock-cells = <0>;
-		compatible = "ti,composite-no-wait-gate-clock";
-		clocks = <&core_ck>;
-		ti,bit-shift = <15>;
-		reg = <0x0070>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
new file mode 100644
index 000000000000..2eb1d1929c39
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments gate clock
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description: |
+  *Depcrecated design pattern: one node per clock*
+
+  This clock is quite much similar to the basic gate-clock [1], however,
+  it supports a number of additional features. If no register
+  is provided for this clock, the code assumes that a clockdomain
+  will be controlled instead and the corresponding hw-ops for
+  that is used.
+
+  [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
+  [2] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+
+properties:
+  compatible:
+    enum:
+      - ti,gate-clock           # basic gate clock
+      - ti,wait-gate-clock      # gate clock which waits until clock is
+                                # active before returning from clk_enable()
+      - ti,dss-gate-clock       # gate clock with DSS specific hardware
+                                # handling
+      - ti,am35xx-gate-clock    # gate clock with AM35xx specific hardware
+                                # handling
+      - ti,clkdm-gate-clock     # clockdomain gate clock, which derives its
+                                # functional clock directly from a
+                                # clockdomain, see [2] how to map
+                                # clockdomains properly
+      - ti,hsdiv-gate-clock     # gate clock with OMAP36xx specific hardware
+                                # handling, required for a hardware errata
+      - ti,composite-gate-clock # composite gate clock, to be part of
+                                # composite clock
+      - ti,composite-no-wait-gate-clock # composite gate clock that does not
+                                        # wait for clock to be active before
+                                        # returning from clk_enable()
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
+  ti,set-bit-to-disable:
+    type: boolean
+    description:
+      Inverts default gate programming. Setting the bit
+      gates the clock and clearing the bit ungates the clock.
+
+  ti,set-rate-parent:
+    type: boolean
+    description:
+      clk_set_rate is propagated to parent clock,
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,clkdm-gate-clock
+then:
+  properties:
+    reg: false
+  required:
+    - compatible
+    - "#clock-cells"
+    - clocks
+else:
+  required:
+    - compatible
+    - "#clock-cells"
+    - clocks
+    - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@a00 {
+        #clock-cells = <0>;
+        compatible = "ti,gate-clock";
+        clocks = <&core_96m_fck>;
+        reg = <0x0a00>;
+        ti,bit-shift = <25>;
+      };
+
+      clock-controller@d00 {
+        compatible = "ti,hsdiv-gate-clock";
+        reg = <0x0d00>;
+        #clock-cells = <0>;
+        clocks = <&dpll4_m2x2_mul_ck>;
+        ti,bit-shift = <0x1b>;
+        ti,set-bit-to-disable;
+      };
+    };
+
+  - |
+    clock-controller {
+      #clock-cells = <0>;
+      compatible = "ti,clkdm-gate-clock";
+      clocks = <&emu_src_mux_ck>;
+    };
+
-- 
2.39.5


