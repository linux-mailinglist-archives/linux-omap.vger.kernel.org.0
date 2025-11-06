Return-Path: <linux-omap+bounces-4863-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF2C39B41
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 10:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5974418C7920
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 09:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D8830AAC0;
	Thu,  6 Nov 2025 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAI/sTBL"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB930AAB6;
	Thu,  6 Nov 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419645; cv=none; b=CCzuHPDGO8ZkKy+fXVPXYYao2ZvQbjH99gxLLPpppYoAaGzFvKYn2qwgQTKnXxqiFfydGN9jlPBQ5eOS8OISTDCAC3jplrjlOM8dOJFpczH2rM/cOwk1lEd9UzCfwZ9P0s/Inhak937kg0iQFkV45ySAj4Z9dsFN/Vjn3XiBZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419645; c=relaxed/simple;
	bh=0+mhj7rfyq0ihaynFxab7j2Zxin8YIpJjYpan11euhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3dc/1rlChZ1K9jXQq1e0Id3iuw40fhRfPWn7Twly0qWbnnqweeayJrcEeb0BwuwO7eR4EuIUkzLsFMw0bWIbZEzlWT2rBmMMoUikDqGsCkXUeyATPlyfR10gT3AGeLV6ee6TSlUDKiuVY3wDiY064HVA+gxs/mxbT3qVJ6o0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAI/sTBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED747C4AF0D;
	Thu,  6 Nov 2025 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762419644;
	bh=0+mhj7rfyq0ihaynFxab7j2Zxin8YIpJjYpan11euhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kAI/sTBLzE19t6PhIhbMMKD2wr52f5+GzQMEdC8vutDvLEJ54bCURp2brz7TO0hGm
	 29MT5660T5N8pVD+AGg7Ts4c2LJZkWIdnQ3BKcrybHWxHpbsaiwSxiG6Q2PCisphMz
	 ZJv/0t/Cf9Q9gtDN3FEjyR3esw9R18Z8l2MmheiF+E2KURT+ML0rc9F0C00QiiGFE7
	 RpKeEEDORkLKDfnBlBZBtx8luBtr1//5gA4K3yuHiwyXGKca0yEmE+oPtAvpVVymED
	 yPacZn+RgCvkl63SuuJ3/GwfXgCwsOB/S2QzZ+1/4jRov58ZbJVtcxFPbQx0G5L4KW
	 h+0AqgRu4Ycrw==
From: akemnade@kernel.org
Date: Thu, 06 Nov 2025 10:00:25 +0100
Subject: [PATCH v4 1/3] dt-bindings: mfd: twl: enable power button also for
 twl603x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-twl6030-button-v4-1-fdf1aa6e1e9a@kernel.org>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
In-Reply-To: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
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
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJk8ydtqPTbF6z+YHG7hs1ael+1HPcs2pfJwK029vd6ih
 7wPft/eUcrCIMbFICumyPLLWsHtk8qz3OCpEfYwc1iZQIYwcHEKwESqfBj+6aocv+eixmtfoz/1
 nPsszTNPozlEm4Jeex2pjPzxOWznJkaGa+lfDgR5/F0ftqx3Zp8Fm0osc4bZ6sB3uUf+d/c26S5
 nBQA=
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


