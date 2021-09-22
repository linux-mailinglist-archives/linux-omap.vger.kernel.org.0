Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7705A4145C3
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 12:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbhIVKJa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Sep 2021 06:09:30 -0400
Received: from muru.com ([72.249.23.125]:36078 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234414AbhIVKJ3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Sep 2021 06:09:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F194480F0;
        Wed, 22 Sep 2021 10:08:26 +0000 (UTC)
Date:   Wed, 22 Sep 2021 13:07:57 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YUsAffFIHUi1ZxEY@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210921 17:50]:
> On 9/21/21 10:00 AM, Tony Lindgren wrote:
> > * Jarkko Nikula <jarkko.nikula@bitmer.com> [210920 16:35]:
> >> On 9/20/21 4:34 PM, Tony Lindgren wrote:
> >>> The patch below should take us back to the earlier configuration,
> >>> can you please give it a try?
> >>>
> >> I double checked and unfortunate it doesn't boot at all or give any
> >> output when patch is applied:
> > 
> > Hmm I tested it with copying the beagle timer configuration to omap3.dtsi
> > and things worked for me. If you can, please try adding
> > CONFIG_SERIAL_EARLYCON=y and then also add "debug earlyprintk" to kernel
> > command line. It might show something that I'm not able to reproduce.
> > Maybe there is a bootloader dependency or something like that.
> > 
> Hmm.. no luck on top of d5f6545934c4 ("qnx4: work around gcc false
> positive warning bug") with the patch. Nothing gets printed after
> "Starting kernel ...". Without the patch boots fine.

OK interesting. Best to keep the booting quirk handling for beagle
rev a to b4 then. No reason to keep the timer quirks for rev b5 and c
boards though.

Can you try the following patch that removes the quirks for omap3-beagle
by default?

The patch also adds a new omap3-beagle-ab4.dts that keeps the current
quirks and also limits the pmic capabilities for the old known buggy
boards.

I also noticed that omap3-beagle.dts is missing the twl power node
probably because of the rev a to b4 quirks.

Adding the twl power node with "ti,twl4030-power-idle-osc-off" similar
to beagle xm might produce some nice power savings after the quirks are
gone :)

Needs to be tested with kernel serial console detached and serial
port autoidle configured. That's a different patch for sure.

Regards,

Tony

8< -----------------------
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
@@ -0,0 +1,49 @@
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
+
+&twl {
+	twl_power: power {
+		compatible = "ti,twl4030-power-idle";
+		ti,use_poweroff;
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
