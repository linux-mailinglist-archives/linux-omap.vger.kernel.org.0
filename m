Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D9D4F907D
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 10:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbiDHIPP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 04:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbiDHIPI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 04:15:08 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 73FE55BE60;
        Fri,  8 Apr 2022 01:13:05 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1CFAB807E;
        Fri,  8 Apr 2022 08:10:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] dt-bindings: timer: Update TI timer to yaml and add compatible for am6
Date:   Fri,  8 Apr 2022 11:12:58 +0300
Message-Id: <20220408081258.57213-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's update the TI timer binding to use yaml. And add compatible for
ti,am654-timer for TI am64, am65 and j72 SoCs. As the timer hardware is
the same between am64, am65 and j72 we use the compatible name for the
earliest SoC with this timer.

As this binding is specific to the TI dual-mode timers also known
as dm-timers, let's use ti,timer-dm.yaml naming for the new file.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../bindings/timer/ti,timer-dm.yaml           | 105 ++++++++++++++++++
 .../devicetree/bindings/timer/ti,timer.txt    |  44 --------
 2 files changed, 105 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt

diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/ti,timer-dm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for TI dual-mode timer
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description: |
+  The TI dual-mode timer is a general purpose timer with PWM capabilities.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap2420-timer
+      - ti,omap3430-timer
+      - ti,omap4430-timer
+      - ti,omap5430-timer
+      - ti,am335x-timer
+      - ti,am335x-timer-1ms
+      - ti,am654-timer
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description: Timer IO register range
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+  clocks:
+    description:
+      The functional clock for the timer. Some SoCs like omap24xx also have a
+      separate interface clock, and some clocks may be only defined for the
+      interconnect target module parent.
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    description:
+      Timer clock names like "fck", "timer_sys_ck".
+    oneOf:
+      - enum: [ ick, fck ]
+      - items:
+          - const: fck
+          - enum: [ ick, timer_sys_ck ]
+
+  interrupts:
+    description:
+      Interrupt if available. The timer PWM features may be usable
+      in a limited way even without interrupts.
+    maxItems: 1
+
+  ti,timer-alwon:
+    description:
+      Timer is always enabled when the SoC is powered. Note that some SoCs like
+      am335x can suspend to PM coprocessor RTC only mode and in that case the
+      SoC power is cut including timers.
+    type: boolean
+
+  ti,timer-dsp:
+    description:
+      Timer is routable to the DSP in addition to the operating system.
+    type: boolean
+
+  ti,timer-pwm:
+    description:
+      Timer has been wired for PWM capability.
+    type: boolean
+
+  ti,timer-secure:
+    description:
+      Timer access has been limited to secure mode only.
+    type: boolean
+
+  ti,hwmods:
+    description:
+      Name of the HWMOD associated with timer. This is for legacy
+      omap2/3 platforms only.
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    timer1: timer@0 {
+      compatible = "ti,am335x-timer-1ms";
+      reg = <0x0 0x400>;
+      interrupts = <67>;
+      ti,timer-alwon;
+      clocks = <&timer1_fck>;
+      clock-names = "fck";
+    };
+...
diff --git a/Documentation/devicetree/bindings/timer/ti,timer.txt b/Documentation/devicetree/bindings/timer/ti,timer.txt
deleted file mode 100644
--- a/Documentation/devicetree/bindings/timer/ti,timer.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-OMAP Timer bindings
-
-Required properties:
-- compatible:		Should be set to one of the below. Please note that
-			OMAP44xx devices have timer instances that are 100%
-			register compatible with OMAP3xxx devices as well as
-			newer timers that are not 100% register compatible.
-			So for OMAP44xx devices timer instances may use
-			different compatible strings.
-
-			ti,omap2420-timer (applicable to OMAP24xx devices)
-			ti,omap3430-timer (applicable to OMAP3xxx/44xx devices)
-			ti,omap4430-timer (applicable to OMAP44xx devices)
-			ti,omap5430-timer (applicable to OMAP543x devices)
-			ti,am335x-timer	(applicable to AM335x devices)
-			ti,am335x-timer-1ms (applicable to AM335x devices)
-
-- reg:			Contains timer register address range (base address and
-			length).
-- interrupts: 		Contains the interrupt information for the timer. The
-			format is being dependent on which interrupt controller
-			the OMAP device uses.
-- ti,hwmods:		Name of the hwmod associated to the timer, "timer<X>",
-			where <X> is the instance number of the timer from the
-			HW spec.
-
-Optional properties:
-- ti,timer-alwon:	Indicates the timer is in an alway-on power domain.
-- ti,timer-dsp:		Indicates the timer can interrupt the on-chip DSP in
-			addition to the ARM CPU.
-- ti,timer-pwm: 	Indicates the timer can generate a PWM output.
-- ti,timer-secure: 	Indicates the timer is reserved on a secure OMAP device
-			and therefore cannot be used by the kernel.
-
-Example:
-
-timer12: timer@48304000 {
-	compatible = "ti,omap3430-timer";
-	reg = <0x48304000 0x400>;
-	interrupts = <95>;
-	ti,hwmods = "timer12"
-	ti,timer-alwon;
-	ti,timer-secure;
-};
-- 
2.35.1
