Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEEB45A01C
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 11:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbhKWK30 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 05:29:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:45334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235333AbhKWK3X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 05:29:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1650160FED;
        Tue, 23 Nov 2021 10:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663176;
        bh=GkkzDrPN3gvbRpySqrAoi0o0ncoxYPPz7mEl7oQUqHE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dD3kfBjrm0CDAbNIsdpi0TMkuc20/msC8rBhB92D8d80CHceBtHzk2u2UpnxwEVVJ
         BmIKV4xLI70pw1TyWTIrVkmFq0kNXABcKTOq+KxsnfCHB/c7goQKcRKwcTOSgRXQrT
         F76o+Lq7RzbJKg5qNuYIc4IHgsAeINjS450KLRncotv0dtmYo6b1zUeyE2hfKmlyuQ
         lyyDls3Y9ZeRay9CyOSRiqp53EeClkzzkEsowLxooRyux/loOMHf1k9+dyujQ59yhF
         pQ2QtBXfGUkTWzB1UlXI0nb01Xba8l9AvU90O0I188sejN4V4ro97g9AmjUaq4B3mF
         Nw+HdvSE8Q4sQ==
From:   Roger Quadros <rogerq@kernel.org>
To:     krzysztof.kozlowski@canonical.com, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/4] dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
Date:   Tue, 23 Nov 2021 12:26:02 +0200
Message-Id: <20211123102607.13002-2-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123102607.13002-1-rogerq@kernel.org>
References: <20211123102607.13002-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

AM64 SoC contains the GPMC module. Add compatible for it.

Newer SoCs don't necessarily map GPMC data region at the same place
as legacy SoCs. Add reg-names "data", to provide this information to
the device driver.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../bindings/memory-controllers/ti,gpmc.yaml         | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
index 25b42d68f9b3..1869cc6f949b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
@@ -23,13 +23,20 @@ properties:
     items:
       - enum:
           - ti,am3352-gpmc
+          - ti,am64-gpmc
           - ti,omap2420-gpmc
           - ti,omap2430-gpmc
           - ti,omap3430-gpmc
           - ti,omap4430-gpmc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: data
 
   interrupts:
     maxItems: 1
@@ -44,6 +51,9 @@ properties:
     items:
       - const: fck
 
+  power-domains:
+    maxItems: 1
+
   dmas:
     items:
       - description: DMA channel for GPMC NAND prefetch
-- 
2.17.1

