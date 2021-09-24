Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACCA416C75
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 09:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244216AbhIXHEW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 03:04:22 -0400
Received: from muru.com ([72.249.23.125]:36748 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244191AbhIXHEV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 03:04:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9E16980EE;
        Fri, 24 Sep 2021 07:03:16 +0000 (UTC)
Date:   Fri, 24 Sep 2021 10:02:46 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YU14FjzAMU0uUubW@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
 <YUsAffFIHUi1ZxEY@atomide.com>
 <cbe53e9f-b407-d758-67bb-5fb65bddfc03@bitmer.com>
 <YUwThz8SAdjBD+cn@atomide.com>
 <93196bcd-836d-2432-9d1c-458904ba4f41@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93196bcd-836d-2432-9d1c-458904ba4f41@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210923 18:04]:
> On 9/23/21 8:41 AM, Tony Lindgren wrote:
> > * Jarkko Nikula <jarkko.nikula@bitmer.com> [210922 17:22]:
> >> Better luck with this one but looks like idling cause "undefined
> >> instruction" crash. Cache/memory etc corruption perhaps? Serial console
> >> log attached.
> > 
> > Hmm. If you comment out the twl power node, does the omap3-beagle-ab4.dtb
> > boot normally for you? It should behave the same as current mainline then
> > with the omap3isp issue.
> > 
> Commenting the twl_power node out or removing the twl section leads to
> immediately rebooting kernel:

Below is an updated patch to move the timer quirks to omap3-beagle-ab4.dtb
with no twl changes.

I've verified the resulting omap3-beagle-ab4.dtb matches the current
unpatched mainline kernel omap3-beagle.dtb.

Then for figuring out why omap3-beagle.dtb with no timer quirks does not
boot on rev c, if you could please enable CONFIG_DEBUG_LL=y and
CONFIG_EARLY_PRINTK=y and select the related debug uart. You can select
the defaults for other configuration options.

Also, note that if your u-boot fdtaddr is too low enabling more things in
the kernel may cause a situation where the uncompressing kernel overwrites
the dtb. Looks like i have setenv fdtaddr 0x84000000.

Regards,

Tony

8< ---------------------
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -779,6 +779,7 @@ dtb-$(CONFIG_ARCH_OMAP3) += \
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
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "omap3-beagle.dts"
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
+/* Unusable as clockevent because if unreliable oscillator, allow to idle */
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
@@ -304,39 +304,6 @@ &usbhsehci {
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
-- 
2.33.0
