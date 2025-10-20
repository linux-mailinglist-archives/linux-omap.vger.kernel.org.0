Return-Path: <linux-omap+bounces-4720-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14DBF1491
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 14:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF2BE4245F1
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 12:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5569831A072;
	Mon, 20 Oct 2025 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIEoHMLQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDEA3195FC;
	Mon, 20 Oct 2025 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963534; cv=none; b=nGAjiFkUDgdI18/Y/I0u3mG5BFwTD2zcJiwa7gYgEfwwWjRKpPNbouAGKmoJ74wEJtx2B7JJNNVU9syJuQxwcceS+dNbDUd6dNszFiPK0Yy0BO+LkdVR/CU/KeTXWXFRh53YMjanl6Cu/a7RaCby8/tmx9M8BXG6DbQQuIFf3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963534; c=relaxed/simple;
	bh=OHwVKDD+cG18NTehyMY3aiUMQu2mrDx7wRLrJtUBJWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJw3iWWEZ1GOvTnVWrTJZvSrs+1C8GcaDZdxzY1JsdXCKw15uIbAXMfiqAYuQzAXP+QGNBHZ1QV57tUMDC8pyvpJQKVBRR3Vhd6q7ChI9PSSsqvz0PTeDCa1gTf/Pgx4GY4hbldp9K/TF6Lcjpd5AJH/jcUZlAIJTU+zgwoijQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIEoHMLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BB5C4CEF9;
	Mon, 20 Oct 2025 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963533;
	bh=OHwVKDD+cG18NTehyMY3aiUMQu2mrDx7wRLrJtUBJWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kIEoHMLQqWsocZpZpJPbxmofECllkc/H4bDo+ZALjV3bXb76rB39Kj08NkPot/4ET
	 5MKtfehm3JUcqF6QbSUTO1st7GnUNEZcMnK/tGn5ztUNjpHy3DLZvRmWlfSyBNMmC7
	 xcUXeiV3Hs184Zr2P9E4qsniGc8UK8zVsaLjC57OjDeLiG/1Lbtq4GLFKFbq/dMNkM
	 ypJh8C0X5bcyURK1aDumTx+MEiNNC59KwShTGT51vyA1aDpe3ZFsRMrqWA4dHc1PFw
	 Vt+dEUM0z7D5YuYWrItrhvNUuK/oQ70gviIwQlrzMX8rrc3bqCESg0vRyX3wiiR4Zc
	 7d84CIDtKQLvA==
From: akemnade@kernel.org
Date: Mon, 20 Oct 2025 14:31:58 +0200
Subject: [PATCH 1/3] dt-bindings: mfd: twl: enable power button also for
 twl603x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-twl6030-button-v1-1-93e4644ac974@kernel.org>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
In-Reply-To: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=ynX2wZwnZSVAVqkf20VfNLm9xWA8C9XOIqWKb6PfGl0=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDBnftI+dS66sy9nJsubAnQstrEft5S8vl7wZfDbKWbXlX
 FlihZJIRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABP5psfIsPTN/0Nij6qPrJiV
 qnL8ve+t9QFP/TY/PdxVeMtQ6P6XUE9GhgVmvQnF1vzr7IRiZwQxaC3bbzZ7btHHJMe+91v/ejd
 NZQMA
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Andreas Kemnade <andreas@kemnade.info>

TWL603x has also a power button, so add the corresponding subnode.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 ++++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index 776b04e182cb2..3527fee32cb07 100644
--- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
@@ -55,6 +55,15 @@ allOf:
 
         gpadc: false
 
+        pwrbutton:
+          properties:
+            compatible:
+              const: ti,twl4030-pwrbutton
+            interrupts:
+              items:
+                - items:
+                    const: 8
+
         usb-comparator: false
 
   - if:
@@ -95,7 +104,14 @@ allOf:
             compatible:
               const: ti,twl6030-gpadc
 
-        pwrbutton: false
+        pwrbutton:
+          properties:
+            compatible:
+              const: ti,twl6030-pwrbutton
+            interrupts:
+              items:
+                - items:
+                    const: 0
 
         madc: false
 
@@ -146,7 +162,14 @@ allOf:
             compatible:
               const: ti,twl6032-gpadc
 
-        pwrbutton: false
+        pwrbutton:
+          properties:
+            compatible:
+              const: ti,twl6030-pwrbutton
+            interrupts:
+              items:
+                - items:
+                    const: 0
 
         madc: false
 
@@ -225,12 +248,8 @@ properties:
     additionalProperties: false
 
     properties:
-      compatible:
-        const: ti,twl4030-pwrbutton
-      interrupts:
-        items:
-          - items:
-              const: 8
+      compatible: true
+      interrupts: true
 
   watchdog:
     type: object
@@ -459,6 +478,11 @@ examples:
           #io-channel-cells = <1>;
         };
 
+        pwrbutton {
+          compatible = "ti,twl6030-pwrbutton";
+          interrupts = <0>;
+        };
+
         rtc {
           compatible = "ti,twl4030-rtc";
           interrupts = <8>;

-- 
2.47.3


