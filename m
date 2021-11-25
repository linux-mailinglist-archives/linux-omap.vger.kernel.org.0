Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72CC45DCAE
	for <lists+linux-omap@lfdr.de>; Thu, 25 Nov 2021 15:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355879AbhKYOwX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Nov 2021 09:52:23 -0500
Received: from muru.com ([72.249.23.125]:60126 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355966AbhKYOvy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Nov 2021 09:51:54 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AED778027;
        Thu, 25 Nov 2021 14:49:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [PATCH] ARM: dts: Fix timer regression for beagleboard revision c
Date:   Thu, 25 Nov 2021 16:48:34 +0200
Message-Id: <20211125144834.52457-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit e428e250fde6 ("ARM: dts: Configure system timers for omap3")
caused a timer regression for beagleboard revision c where the system
clockevent stops working if omap3isp module is unloaded.

Turns out we still have beagleboard revisions a-b4 capacitor c70 quirks
applied that limit the usable timers for no good reason. This also affects
the power management as we use the system clock instead of the 32k clock
source.

Let's fix the issue by adding a new omap3-beagle-ab4.dts for the old timer
quirks. This allows us to remove the timer quirks for later beagleboard
revisions. We also need to update the related timer quirk check for the
correct compatible property.

Fixes: e428e250fde6 ("ARM: dts: Configure system timers for omap3")
Cc: linux-kernel@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/arm/omap/omap.txt     |  3 ++
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/omap3-beagle-ab4.dts        | 47 +++++++++++++++++++
 arch/arm/boot/dts/omap3-beagle.dts            | 33 -------------
 drivers/clocksource/timer-ti-dm-systimer.c    |  2 +-
 5 files changed, 52 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap3-beagle-ab4.dts

diff --git a/Documentation/devicetree/bindings/arm/omap/omap.txt b/Documentation/devicetree/bindings/arm/omap/omap.txt
--- a/Documentation/devicetree/bindings/arm/omap/omap.txt
+++ b/Documentation/devicetree/bindings/arm/omap/omap.txt
@@ -119,6 +119,9 @@ Boards (incomplete list of examples):
 - OMAP3 BeagleBoard : Low cost community board
   compatible = "ti,omap3-beagle", "ti,omap3430", "ti,omap3"
 
+- OMAP3 BeagleBoard A to B4 : Early BeagleBoard revisions A to B4 with a timer quirk
+  compatible = "ti,omap3-beagle-ab4", "ti,omap3-beagle", "ti,omap3430", "ti,omap3"
+
 - OMAP3 Tobi with Overo : Commercial expansion board with daughter board
   compatible = "gumstix,omap3-overo-tobi", "gumstix,omap3-overo", "ti,omap3430", "ti,omap3"
 
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -794,6 +794,7 @@ dtb-$(CONFIG_ARCH_OMAP3) += \
 	logicpd-som-lv-37xx-devkit.dtb \
 	omap3430-sdp.dtb \
 	omap3-beagle.dtb \
+	omap3-beagle-ab4.dtb \
 	omap3-beagle-xm.dtb \
 	omap3-beagle-xm-ab.dtb \
 	omap3-cm-t3517.dtb \
diff --git a/arch/arm/boot/dts/omap3-beagle-ab4.dts b/arch/arm/boot/dts/omap3-beagle-ab4.dts
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/omap3-beagle-ab4.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "omap3-beagle.dts"
+
+/ {
+	model = "TI OMAP3 BeagleBoard A to B4";
+	compatible = "ti,omap3-beagle-ab4", "ti,omap3-beagle", "ti,omap3430", "ti,omap3";
+};
+
+/*
+ * Workaround for capacitor C70 issue, see "Boards revision A and < B5"
+ * section at https://elinux.org/BeagleBoard_Community
+ */
+
+/* Unusable as clocksource because of unreliable oscillator */
+&counter32k {
+	status = "disabled";
+};
+
+/* Unusable as clockevent because of unreliable oscillator, allow to idle */
+&timer1_target {
+	/delete-property/ti,no-reset-on-init;
+	/delete-property/ti,no-idle;
+	timer@0 {
+		/delete-property/ti,timer-alwon;
+	};
+};
+
+/* Preferred always-on timer for clocksource */
+&timer12_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		/* Always clocked by secure_32k_fck */
+	};
+};
+
+/* Preferred timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt2_fck>;
+		assigned-clock-parents = <&sys_ck>;
+	};
+};
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -308,39 +308,6 @@ &usbhsehci {
 	phys = <0 &hsusb2_phy>;
 };
 
-/* Unusable as clocksource because of unreliable oscillator */
-&counter32k {
-	status = "disabled";
-};
-
-/* Unusable as clockevent because if unreliable oscillator, allow to idle */
-&timer1_target {
-	/delete-property/ti,no-reset-on-init;
-	/delete-property/ti,no-idle;
-	timer@0 {
-		/delete-property/ti,timer-alwon;
-	};
-};
-
-/* Preferred always-on timer for clocksource */
-&timer12_target {
-	ti,no-reset-on-init;
-	ti,no-idle;
-	timer@0 {
-		/* Always clocked by secure_32k_fck */
-	};
-};
-
-/* Preferred timer for clockevent */
-&timer2_target {
-	ti,no-reset-on-init;
-	ti,no-idle;
-	timer@0 {
-		assigned-clocks = <&gpt2_fck>;
-		assigned-clock-parents = <&sys_ck>;
-	};
-};
-
 &twl_gpio {
 	ti,use-leds;
 	/* pullups: BIT(1) */
diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -241,7 +241,7 @@ static void __init dmtimer_systimer_assign_alwon(void)
 	bool quirk_unreliable_oscillator = false;
 
 	/* Quirk unreliable 32 KiHz oscillator with incomplete dts */
-	if (of_machine_is_compatible("ti,omap3-beagle") ||
+	if (of_machine_is_compatible("ti,omap3-beagle-ab4") ||
 	    of_machine_is_compatible("timll,omap3-devkit8000")) {
 		quirk_unreliable_oscillator = true;
 		counter_32k = -ENODEV;
-- 
2.33.1
