Return-Path: <linux-omap+bounces-4852-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1DDC37945
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 20:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F233BDB78
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 19:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1613451C4;
	Wed,  5 Nov 2025 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i349puz6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7C342CB6;
	Wed,  5 Nov 2025 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372373; cv=none; b=BDBS5rdmYtJaRB8qwSLQ3fDySY7APXSmWEOCQRv2F2jGvw3FkjaD7X9bhW0A4L7h1FSoYPE0g6C8Wq+G6187R2hh9q/NoS4FVqDpRnw/ie+CoRcZz29tlMHKVZFgKGEix5xjFyC8bcW0BcPkhnSNa5Y90/TZIcBy9ZYnn5+mmo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372373; c=relaxed/simple;
	bh=0+mhj7rfyq0ihaynFxab7j2Zxin8YIpJjYpan11euhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ft6K2GlulzmcBFet2MnhZtyl1X++zMYaihix1KJPuwqe9i70Of3qhSk2Ccj0UFFsue6v3VNtuXpfk4ioS4LfBdKfR0rBeL0bY7d/7euP5LqBxuXqK8uVbjTER3bu9Wc85hmrqSGYWGEswLlGzKUF6/Fta5tiaVvog5ZzRMDjknM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i349puz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B46AC116B1;
	Wed,  5 Nov 2025 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762372371;
	bh=0+mhj7rfyq0ihaynFxab7j2Zxin8YIpJjYpan11euhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i349puz6NdzMj0uApX4+zA88cw6tQGEn+rj4vpudj5i6PS+v3QiyiEVwiYxRVvNMc
	 ZGw1I3oghyJTOpfbXH9HJugfzuxjgeKwTskU+gbxUEcYzWilwoD5Dol75LETxOW8eF
	 SJPaWbsL51/Fj2gDoww+FIPltLQCFCAjiFtWNrY+kpTY6XpPLLeF+Hr3izQIllH+4l
	 suscSrQHOL6vyFTSt3vBIdsIIRQfEuT9woXFHU9Vc3Xl15X/owr8x6r9f5td7ux+J4
	 5Bnw4pxi9oj/OGM2WmGWL/jeQiuryCxnc6AXNnkMNIjRrMuofB1FENXMhMXd9c26Yo
	 HUqT8fJHy5ZqA==
From: akemnade@kernel.org
Date: Wed, 05 Nov 2025 20:52:35 +0100
Subject: [PATCH v3 1/3] dt-bindings: mfd: twl: enable power button also for
 twl603x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-twl6030-button-v3-1-9b37eb2b0989@kernel.org>
References: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
In-Reply-To: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=5e8dspO3eC9P6aN13/cWN/AxzNfhJQvtiM4MO48925g=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJncq3lLljetb13P2viDVaws+NzkDSf/F7Zxzvs7Y5qP8
 7Gsc88udpSyMIhxMciKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjCRhVsZGe4cyPzrVRm6R/4J
 M4dA9d29mYu1LtRz90wL3nXPoiDyxUNGhr1MjIYJsSxdDVFVTXu4v3EIN+1NnXboYu1S2zq/Xwr
 zuQE=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Andreas Kemnade <andreas@kemnade.info>

TWL603x has also a power button function, so add the corresponding subnode.
As not in all cases there is a power button connected to the corresponding
pad of the TWL603x, the functionality can be disabled by
status = "disabled" or simply not adding the subnode.
To keep things simple, follow the established design pattern of using const
interrupts as used also by the other subdevices.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 +++++++++++++++++++----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index 776b04e182cb..045fd07f476e 100644
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
 
@@ -226,11 +249,11 @@ properties:
 
     properties:
       compatible:
-        const: ti,twl4030-pwrbutton
+        enum:
+          - ti,twl4030-pwrbutton
+          - ti,twl6030-pwrbutton
       interrupts:
-        items:
-          - items:
-              const: 8
+        maxItems: 1
 
   watchdog:
     type: object
@@ -459,6 +482,11 @@ examples:
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


