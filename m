Return-Path: <linux-omap+bounces-2454-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025789A392D
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 10:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4924BB21B5D
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 08:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3C118FDB9;
	Fri, 18 Oct 2024 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="nR9cAeic"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5D718E773;
	Fri, 18 Oct 2024 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241639; cv=none; b=fCoSaxXGx9iKbGPww8A72q9NXWOnk58ArQRFC+cg+3L69dHMJNvhENewl+lsrtiqeaMs0EvhxXJw7NqfD3t6OQUJB10vz9X2Xoe5jwq/x2E+2ev1oIWIM7uyj2zqKcaJxyWGbmxTa6pdbIiJQlGU1gTBYb07T8YGNjqYEkVjOvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241639; c=relaxed/simple;
	bh=n8E+CKa6lexyQEp9/ocYoRMXdRVHdB1c6TWpBFScthE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bBxT1YphtRFNZxtV6wBs5mFzqr2B6SMhg4Bh5r+6Tk/1YLJWmSvmOnxEgsVVEWx/yHc/kiRMPwOwjmyF68Bs+Ou9Z62dY5aQqmnYjCsAdjYcavdoZzzAF5JZSz2GXFpy06ndb+Lb7BBw2AO2J8G7DuQis+nBjIyt4MwRDVfya9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=nR9cAeic; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qH29W47n+RK5J458tYtWAM3IkZNDBZqad7iiEeHqloI=; b=nR9cAeicqiXw9k680HtGOvlrOz
	edcwlgGmm8WMHYFW4P5TPf5hStre+E66KTW9iQIPLIWmmXGFR4NGXBICHO0gC0EoA7UB3g4jnF0Da
	KPQ23zN6v6oKsVLSMUt19ESICcOP0FViD95qbbgjfwuZSBbkWfDv5H4VvIyoy/cXXYu6c+5wp4tK7
	RczVFpiLGS+HLxy+foj1xaShIT28UWY/Cz8vBGHYh/bw1ENJDhyehDUkrgFU1MVxwJYzJ4iOYVKmE
	cHpMPP2OMJuosxy0gw6SoLfsvmhPWIHZs08NSfswG/GJ8fJHglswIAHzr9Obe1k5C8s85D8/js8mA
	uaKH7SSw==;
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
Subject: [PATCH v3 1/2] dt-bindings: clock: ti: Convert interface.txt to json-schema
Date: Fri, 18 Oct 2024 10:53:46 +0200
Message-Id: <20241018085347.95071-2-andreas@kemnade.info>
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

Convert the OMAP interface clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/ti/interface.txt           | 55 --------------
 .../bindings/clock/ti/ti,interface-clock.yaml | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 55 deletions(-)
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
index 000000000000..1eaf95d88e0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml
@@ -0,0 +1,71 @@
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
+    maximum: 31
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


