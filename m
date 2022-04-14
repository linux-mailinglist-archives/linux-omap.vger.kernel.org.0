Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B4B500907
	for <lists+linux-omap@lfdr.de>; Thu, 14 Apr 2022 10:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241353AbiDNJAv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Apr 2022 05:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241317AbiDNJAu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Apr 2022 05:00:50 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 632AB6A058;
        Thu, 14 Apr 2022 01:58:18 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 615A18132;
        Thu, 14 Apr 2022 08:55:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/2] dt-bindings: timer: Add compatible for am6 for TI timer-dm
Date:   Thu, 14 Apr 2022 11:58:07 +0300
Message-Id: <20220414085807.7389-3-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414085807.7389-1-tony@atomide.com>
References: <20220414085807.7389-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's add compatible for ti,am654-timer for TI am64, am65 and j72 SoCs.
As the timer hardware is the same between am64, am65 and j72 we use the
compatible name for the earliest SoC with this timer.

The timer interrupts are not routable for the operating system for some
timers on am6. Let's make sure the interrupts are configured for the
timers on all other SoCs.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/timer/ti,timer-dm.yaml       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
--- a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
+++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - ti,am335x-timer
               - ti,am335x-timer-1ms
+              - ti,am654-timer
               - ti,dm814-timer
               - ti,dm816-timer
               - ti,omap2420-timer
@@ -88,11 +89,20 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 additionalProperties: false
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ti,am654-timer
+    then:
+      required:
+        - interrupts
+
   - if:
       not:
         properties:
-- 
2.35.1
