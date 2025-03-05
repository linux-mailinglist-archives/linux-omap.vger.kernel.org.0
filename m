Return-Path: <linux-omap+bounces-3335-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8815A50F0A
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 23:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C265B3A27C0
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 22:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44D8205ABE;
	Wed,  5 Mar 2025 22:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="h4ZCL+WE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6F31EEA5D;
	Wed,  5 Mar 2025 22:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214880; cv=none; b=qboWZw4vaWIX+lpwWZ8UFdNw8iqCNM02LDAq/NuzVgJHuEcmlKPikYMm/u5cWIaar4loWYhZ++xWuJMNCwF2oFngjXwvYFpn1GECQJGLi2oTKRnSov/RgI7NwfM7DpeVAJOMFgfou6QtBjr3WRezKK00wBXP/ZZr7lDg7TIrzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214880; c=relaxed/simple;
	bh=j690KMyiLxuuR24G6j9sZerB6/YuInfz3g49qZUsgvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DvBSqmxuCq4BFdpy3nFIfx8BraHMt9blhmFRAkgHyOILrw/Smctd7/y5l1LYpRwdiml3s8c5jw2qJzyUmzcSvw5qSOcyJTIpFAkCFSpvsW7XaEPtySP3Ibg7vO5Ssw6S/Bhg9/02+GxeRfrGymmvEMWJpnfkD1W5MO6wVCgmZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=h4ZCL+WE; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7fAKyPcFLbipyj8e2+HaYX8ZN0IQD4FgvUWGz9wiNuY=; b=h4ZCL+WExFSPRI+oi7iGgFW+yy
	gjmzS3Ki/r2yubN8dEfbBxkmDm69I0j96wpiL0X5wnLPU3+GwHBGdXQXci1MaRq8r8y42C+BSh8pM
	Yh+dVJNI5dPat7hrnubUkrPOWJFtz5O3qs0+vSQwI8HgqFrw/l9uRubI4ZOu4Wqebnm3yFCGg6pld
	dZ1UDrNkA8+5wUTuCsHLhyNbKL3DDORA8PQ1Hj96+xgvpLSGfYOf0cGObfdqpQUXRiV7t7TgL2eCE
	oZnpAK84atGBwcgVaroU9Sumv60buX6pyc4yjlarRxvvwCLsiIXjGFX4QGoYpa3WXrdiTo7r9eoRH
	ccfANGDA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tony@atomide.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] dt-bindings: clock: ti: Convert ti-clkctrl.txt to json-schema
Date: Wed,  5 Mar 2025 23:47:22 +0100
Message-Id: <20250305224722.66360-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI clkctrl clock device tree binding to json-schema.
Specify the creator of the original binding as a maintainer.

reg property is used mostly with one item, in am3xxx also with
an arbitrary number of items, so divert from the original binding
specifying two (probably meaning one address and one size).
The consumer part of the example is left out because the full consumer
node would be needed.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
@Tony: you seem to be the only contributor to the txt binding,
so we could go with dual-licensing if you agree.

 .../devicetree/bindings/clock/ti,clkctrl.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/ti,clkctrl.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti,clkctrl.yaml b/Documentation/devicetree/bindings/clock/ti,clkctrl.yaml
new file mode 100644
index 0000000000000..bf4119c9c61fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,clkctrl.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,clkctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments clkctrl clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description: |
+  Texas Instruments SoCs can have a clkctrl clock controller for each
+  interconnect target module. The clkctrl clock controller manages functional
+  and interface clocks for each module. Each clkctrl controller can also
+  gate one or more optional functional clocks for a module, and can have one
+  or more clock muxes. There is a clkctrl clock controller typically for each
+  interconnect target module on omap4 and later variants.
+
+  The clock consumers can specify the index of the clkctrl clock using
+  the hardware offset from the clkctrl instance register space. The optional
+  clocks can be specified by clkctrl hardware offset and the index of the
+  optional clock.
+
+properties:
+  compatible:
+    enum:
+      - ti,clkctrl
+      - ti,clkctrl-l4-cfg
+      - ti,clkctrl-l4-per
+      - ti,clkctrl-l4-secure
+      - ti,clkctrl-l4-wkup
+
+  "#clock-cells":
+    const: 2
+
+  clock-output-names:
+    maxItems: 1
+
+  reg:
+    minItems: 1
+    maxItems: 8 # arbitrary, should be enough
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clock-output-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      clock@20 {
+        compatible = "ti,clkctrl";
+        clock-output-names = "l4_per";
+        reg = <0x20 0x1b0>;
+        #clock-cells = <2>;
+      };
+    };
-- 
2.39.5


