Return-Path: <linux-omap+bounces-4815-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A258FC21E03
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 20:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 498AD4EB882
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 19:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44995374AAA;
	Thu, 30 Oct 2025 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJkbj8BL"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C668736E379;
	Thu, 30 Oct 2025 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851447; cv=none; b=f1isrluO3ctx5SHeluzUuIkKSqH6I1R8JQfS9N1YS9YtaZKJuT40+Rln2zODo3HPnfWBM26Mzrge41hTPdM5XO9W8fVfxlGMudKhnYc6UoHGRxg9JxCXSrOVsCR0H5l0sZ1gpSCZ5f5kZDfreHj/bulzvR8H9zCTxokIgOd7bOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851447; c=relaxed/simple;
	bh=91KY+nkPE2QzFwyk2r+ohZxGPmfb6eb5RwKvQfl3ZgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osc0rDXjt2pYecPyG6IHBCZUNueZmTeIMwSvAj4EWYtplRnCScfSmN4W3tjIBTUK5yCcv5Ypnd6Fp+8UHKQ67RYgFRgh1WHXfuRtvX3v1ZIrbQ1DFTFSurpTq/Lc8dog7A9wcmuOUzW7gF9A99+dBAuUhyiMMudNHF45CXNuxSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJkbj8BL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0FEC4CEF8;
	Thu, 30 Oct 2025 19:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761851447;
	bh=91KY+nkPE2QzFwyk2r+ohZxGPmfb6eb5RwKvQfl3ZgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gJkbj8BLLN5Aa6pq8QS85yNz5UkJoNgYsVSUt8jYha2XGcib1lx3Fys7NeAz69DT0
	 zAA6zo/2qiFXMuQmVRqiyYH8w6ysUaAFeOwIJNCf14oB4JVjuYFWAFSNJfAdZ6skVu
	 rQfNpvR+PTftr+sTzlrqSWHd20lneIg4NkqVW6Gnz+dM4LbNMfMfTMylKVK6W0T3+U
	 j74Sz1g9CopHRecjuutenDizsfV7XfSYXCScXd43ZZn5ja1+rIAED6sZi7nknLU4/J
	 eHb5vIehQgmOCFPSSJQf4BX8Z5fDjlwUaE8lJJrQyqmbzW7pEWvek2vtD/X6UBHeOU
	 lmktVhUS3cGWA==
From: akemnade@kernel.org
Date: Thu, 30 Oct 2025 20:10:34 +0100
Subject: [PATCH v2 1/3] dt-bindings: mfd: twl: enable power button also for
 twl603x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-twl6030-button-v2-1-09653d05a2b1@kernel.org>
References: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
In-Reply-To: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=bcJuM4UZV6ZlrCUfx8ZxWUkWFTQekHy49XD66j2NCIg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJnMOww9PQ0rb0jaJi1QO1vocWlyk85Hya7Z6x2YfIzz/
 HvnOk7rKGVhEONikBVTZPllreD2SeVZbvDUCHuYOaxMIEMYuDgFYCIfQxgZZmyoPvJM49cU7k7x
 H79Ytk0SnFDB4dp+YqHy0zf7rn+9XsXIcMwpu3JtJbfwnEXrVz0pf/X+TuPyx4K5R2ep5X3j+zO
 /nAsA
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
 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 ++++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index 776b04e182cb..3527fee32cb0 100644
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


