Return-Path: <linux-omap+bounces-2367-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F099770B
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 22:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460151C22C9C
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 20:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A9E1E25ED;
	Wed,  9 Oct 2024 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="eZGC6TAs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932E191473;
	Wed,  9 Oct 2024 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507399; cv=none; b=EPWzo0o/ovMKcRBbd+YW3Lky567TAmpZOKEM30VhEPXuE7W4Q8KFDCeQI1+YxxHkSps4G5P/3PBT6ZD3heKr7eRNflyDn1BV4IYX3ERbBgvOKuo7gc9lVu0K/IKsY+HPFpvNrvjTvyDbY7iuRbwxEX5QE0pkBQLYFo750+tEcZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507399; c=relaxed/simple;
	bh=25CW83HPiUqoSDtzRriqpXsB3Qx4C1kGZPQzbxG9Lf4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dl3F3x0IqT2YI1WYtNm1CXXDbPfoEj39oINeu9KmJROw77InxBzBkPyw1cGoTtQ6EplB8dNycKYjvnOCsfZje4p4+el8XNQ9jbGFKXmbSmTknApp70CnXdcem2rRjCXSP1hEKdcQkBqUmMrn3z+OGkr7iqkpr0Hqh3cCqdESLKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=eZGC6TAs; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XAiJ0t0NwL2bpJ7KatMhp+QkNMyhi+LRb3G5JPOXpbo=; b=eZGC6TAsUNrm/lsKHIQnTt+0hd
	Pd4U6pu+WcenDD+fxSmJ+N5E7q03U9AtN7DYUArv/7/IKEYdjlhPjPW97ig9mtdcuTW5HMFLiYDaR
	G6mPy9ACKzKJeZKIaCuxc8rgD50f/14YSmc16FJsCs6W725rt2N0hHFUjOdai8aMmVRMyJin3ZIp7
	gsoOMQmWmGh5lIxEmBRTt7dw7Xjy9bjmeIvgk57T+wE1/M9TuRNHA7fn9+U/JYCGSsTRHV0lpVEQH
	OKHzj0g5tjaRvvSk9JtxIMyziaBDcWCMnmO09Yw/fvx5lybD0NyYdcMMZcfjF/J4M9HuxSukcmr+O
	ow3Rc4hg==;
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
Subject: [PATCH RFC v2 1/2] dt-bindings: clock: ti: Convert interface.txt to json-schema
Date: Wed,  9 Oct 2024 22:56:18 +0200
Message-Id: <20241009205619.16250-2-andreas@kemnade.info>
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

Convert the OMAP interface clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/clock/ti/interface.txt           | 55 ---------------
 .../bindings/clock/ti/ti,interface-clock.yaml | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/interface.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/interface.txt b/Documentation/devicetree/bindings/clock/ti/interface.txt
deleted file mode 100644
index 85fb1f2d2d28..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/interface.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Binding for Texas Instruments interface clock.
-
-This binding uses the common clock binding[1]. This clock is
-quite much similar to the basic gate-clock [2], however,
-it supports a number of additional features, including
-companion clock finding (match corresponding functional gate
-clock) and hardware autoidle enable / disable.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
-
-Required properties:
-- compatible : shall be one of:
-  "ti,omap3-interface-clock" - basic OMAP3 interface clock
-  "ti,omap3-no-wait-interface-clock" - interface clock which has no hardware
-				       capability for waiting clock to be ready
-  "ti,omap3-hsotgusb-interface-clock" - interface clock with USB specific HW
-					handling
-  "ti,omap3-dss-interface-clock" - interface clock with DSS specific HW handling
-  "ti,omap3-ssi-interface-clock" - interface clock with SSI specific HW handling
-  "ti,am35xx-interface-clock" - interface clock with AM35xx specific HW handling
-  "ti,omap2430-interface-clock" - interface clock with OMAP2430 specific HW
-				  handling
-- #clock-cells : from common clock binding; shall be set to 0
-- clocks : link to phandle of parent clock
-- reg : base address for the control register
-
-Optional properties:
-- clock-output-names : from common clock binding.
-- ti,bit-shift : bit shift for the bit enabling/disabling the clock (default 0)
-
-Examples:
-	aes1_ick: aes1_ick@48004a14 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&security_l4_ick2>;
-		reg = <0x48004a14 0x4>;
-		ti,bit-shift = <3>;
-	};
-
-	cam_ick: cam_ick@48004f10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-no-wait-interface-clock";
-		clocks = <&l4_ick>;
-		reg = <0x48004f10 0x4>;
-		ti,bit-shift = <0>;
-	};
-
-	ssi_ick_3430es2: ssi_ick_3430es2@48004a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-ssi-interface-clock";
-		clocks = <&ssi_l4_ick>;
-		reg = <0x48004a10 0x4>;
-		ti,bit-shift = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
new file mode 100644
index 000000000000..0e9542ed381f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,interface-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments interface clock.
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description: |
+  This clock is quite much similar to the basic gate-clock[1], however,
+  it supports a number of additional features, including
+  companion clock finding (match corresponding functional gate
+  clock) and hardware autoidle enable / disable.
+
+  [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
+
+properties:
+  compatible:
+    enum:
+      - ti,omap3-interface-clock           # basic OMAP3 interface clock
+      - ti,omap3-no-wait-interface-clock   # interface clock which has no hardware
+                                           # capability for waiting clock to be ready
+      - ti,omap3-hsotgusb-interface-clock  # interface clock with USB specific HW handling
+      - ti,omap3-dss-interface-clock       # interface clock with DSS specific HW handling
+      - ti,omap3-ssi-interface-clock       # interface clock with SSI specific HW handling
+      - ti,am35xx-interface-clock          # interface clock with AM35xx specific HW handling
+      - ti,omap2430-interface-clock        # interface clock with OMAP2430 specific HW handling
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
+  ti,bit-shift:
+    description:
+      bit shift for the bit enabling/disabling the clock
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
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
+      aes1_ick: clock-controller@3 {
+        #clock-cells = <0>;
+        compatible = "ti,omap3-interface-clock";
+        clocks = <&security_l4_ick2>;
+        reg = <3>;
+      };
+    };
-- 
2.39.5


