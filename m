Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 674545BCA9B
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 13:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiISLYF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 07:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiISLYE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 07:24:04 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9249C1707F;
        Mon, 19 Sep 2022 04:24:03 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AEE578050;
        Mon, 19 Sep 2022 11:15:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] dt-bindings: timer: Add power-domains for TI timer-dm on K3
Date:   Mon, 19 Sep 2022 14:23:57 +0300
Message-Id: <20220919112357.64997-1-tony@atomide.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On K3 SoCs, the power-domains property is needed. On the earlier SoCs,
the power-domains property is handled by the interconnect target module
parent device.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/timer/ti,timer-dm.yaml  | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
--- a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
+++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
@@ -51,6 +51,11 @@ properties:
       - const: timer_sys_ck
     minItems: 1
 
+  power-domains:
+    description:
+      Power domain if available
+    maxItems: 1
+
   interrupts:
     description:
       Interrupt if available. The timer PWM features may be usable
@@ -94,12 +99,14 @@ additionalProperties: false
 
 allOf:
   - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              const: ti,am654-timer
+      properties:
+        compatible:
+          contains:
+            const: ti,am654-timer
     then:
+      required:
+        - power-domains
+    else:
       required:
         - interrupts
 
-- 
2.37.1
