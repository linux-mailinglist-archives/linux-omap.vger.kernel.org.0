Return-Path: <linux-omap+bounces-4315-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C24FB33301
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 00:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A414205A6E
	for <lists+linux-omap@lfdr.de>; Sun, 24 Aug 2025 22:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABE12459F8;
	Sun, 24 Aug 2025 22:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="T7qrSz04"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF314B953;
	Sun, 24 Aug 2025 22:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756073286; cv=none; b=W+QwGf9Bu4e9B4hTMDShJSoEZvyobhNoGYbqZ4l2O3aPJEXNLUM1oTWHygME7xMePqDjnSeRLNCSiAhtjvUOukhrQeoUZTBbhS1xvGCtscLfAhUoip+j5Atizg3W0IcCh4pLLHupRLRepS8kFQG6f8TkV8sGASu6WlhmVraxm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756073286; c=relaxed/simple;
	bh=JmWguJqBi+J6UCLRUwSlxPGfZwJVr4FPhT5TyB6Vwek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axHEIC1Qov21yU282GEECXPfb1ywISArKB4LAFt3ZMZENlRZjRXoy8WiI6V+LKEtXOVqYjI+zC3h9RMleTqOmsACVDZ2bcoUl+gSSRhUCOE9TK0h5uX46V+i0aMwphMAb4vDtrt2wdEHVdK6ntgCRtMlqZyy21gNqBbzZ7wETnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=T7qrSz04; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rKO4zT7vzvCx/0bG5tGPhwMZqbrVhZfe+6sJ40iyBsk=; b=T7qrSz04Htqmiu9gSRkvVIl3e0
	GCPQkpB+1w8TcIqtdH1u0X48Q4qr56Jhc2rl/CGGaeZ7Y/sn0rNAyg/Ywak0Guwg2jNeTK32C+0j1
	/8mJtiqsS7pYDHzxaqWbuTFdn34HW+a7vsJRqcDS2ran9ReQKw8sg9JCgdadTrKUFp14grr28F9FD
	eloVf0LXcaO9cbb6UnXmf98pnYHAJlIObSH9oTfQUMYbBptjGWHpzi7iw59TxizLatuhfShnc6m4r
	C5UA5nv5FFz8mITcvGf38Gkg57NQVyEbzhZSnP15JdE9y2WkP4X+YZXbVcKo8lMLcMbR/VeYEpQJp
	Y/aasPNQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 25 Aug 2025 00:07:28 +0200
Subject: [PATCH RFC 1/3] dt-bindings: input: elan: Introduce Elan eKTP1059
 Touchpad
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-ektp-submit-v1-1-1dd476c1277b@kemnade.info>
References: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
In-Reply-To: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Tony Lindgren <tony@atomide.com>, hns@goldelico.com
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=JmWguJqBi+J6UCLRUwSlxPGfZwJVr4FPhT5TyB6Vwek=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBmrey3CC78Xuk9bP4HrXvInHbuvt2XZT33eeVTiacDfr
 jnSkw6VdJSyMIhxMMiKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjCRBGWG/3E3alfqR8u+ONu6
 LMwn+md8kf1NwfCcAy/OasxSL2x9PIvhf65gdO+Evp4/qRfnZTno3nn05uyPSXVnJF5kcOnxzZ1
 mwgYA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

The Elan eKTP1059 Touchpad is seen in the Epson Moverio BT-200
attached via SPI. Add a binding for this chip. Little is known.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/input/elan,ektp1059.yaml   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ektp1059.yaml b/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
new file mode 100644
index 000000000000..a10256a271e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/elan,ektp1059.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Elantech SPI Touchpad
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+allOf:
+  - $ref: touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    const: elan,ektp1059
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchpad@0 {
+            compatible = "elan,ektp1059";
+            reg = <0x0>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <0x0 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };

-- 
2.39.5


