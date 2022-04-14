Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30952500904
	for <lists+linux-omap@lfdr.de>; Thu, 14 Apr 2022 10:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241323AbiDNJAx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Apr 2022 05:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241337AbiDNJAu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Apr 2022 05:00:50 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F0116B53B;
        Thu, 14 Apr 2022 01:58:16 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EACBE8128;
        Thu, 14 Apr 2022 08:55:36 +0000 (UTC)
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
Subject: [PATCH v5 1/2] dt-bindings: timer: Update TI timer to yaml
Date:   Thu, 14 Apr 2022 11:58:06 +0300
Message-Id: <20220414085807.7389-2-tony@atomide.com>
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

Let's update the TI timer binding to use yaml. As this binding is specific
to the TI dual-mode timers also known as dm-timers, let's use file name
ti,timer-dm.yaml to avoid confusion with other timers.

We add checks for the deprecated ti,hwmods property as done for other TI
device driver bindings earlier.

We also correct the issue with the old binding that was out of date for
several properties.

The am43 related timers are undocumented, but compatible with the am3
timers. Let's add the am43 timers too.

The dm814 and dm816 timers are missing, let's add them.

Some timers on some SoCs are dual mapped, like the ABE timers on omap4
and 5. The reg property maxItems must be updated to 2.

The timer clocks can be managed by the parent interconnect target module
with no clocks assigned for the timer node. And in some cases, the SoC may
need to configure additional system clock for the timer in addition to the
functional clock.

The clock names are optional and not specific to the comptible property.
For example, dra7 timers on l3 interconnect do not need clock-names, while
the timers on dra7 l4 interconnect need them with both being compatible
with ti,omap5430-timer.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
 .../bindings/timer/ti,timer-dm.yaml           | 142 ++++++++++++++++++
 .../devicetree/bindings/timer/ti,timer.txt    |  44 ------
 3 files changed, 143 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt b/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
--- a/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
@@ -2,7 +2,7 @@
 
 Required properties:
 - compatible: Shall contain "ti,omap-dmtimer-pwm".
-- ti,timers: phandle to PWM capable OMAP timer. See timer/ti,timer.txt for info
+- ti,timers: phandle to PWM capable OMAP timer. See timer/ti,timer-dm.yaml for info
   about these timers.
 - #pwm-cells: Should be 3. See pwm.yaml in this directory for a description of
   the cells format.
diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/ti,timer-dm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI dual-mode timer
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description: |
+  The TI dual-mode timer is a general purpose timer with PWM capabilities.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,am335x-timer
+              - ti,am335x-timer-1ms
+              - ti,dm814-timer
+              - ti,dm816-timer
+              - ti,omap2420-timer
+              - ti,omap3430-timer
+              - ti,omap4430-timer
+              - ti,omap5430-timer
+      - items:
+          - const: ti,am4372-timer
+          - const: ti,am335x-timer
+      - items:
+          - const: ti,am4372-timer-1ms
+          - const: ti,am335x-timer-1ms
+
+  reg:
+    items:
+      - description: IO address
+      - description: L3 to L4 mapping for omap4/5 L4 ABE
+    minItems: 1
+
+  clocks:
+    items:
+      - description: Functional clock
+      - description: System clock for omap4/5 and dra7
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: fck
+      - const: timer_sys_ck
+    minItems: 1
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
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ti,omap3430-timer
+                - ti,omap4430-timer
+                - ti,omap5430-timer
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,dm814-timer
+              - ti,dm816-timer
+              - ti,omap2420-timer
+              - ti,omap3430-timer
+    then:
+      properties:
+        ti,hwmods:
+          items:
+            - pattern: "^timer([1-9]|1[0-2])$"
+    else:
+      properties:
+        ti,hwmods: false
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
