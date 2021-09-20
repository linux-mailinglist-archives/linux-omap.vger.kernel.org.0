Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052344115E6
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 15:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhITNg2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 09:36:28 -0400
Received: from muru.com ([72.249.23.125]:34970 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233401AbhITNg2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Sep 2021 09:36:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 65E4080FE;
        Mon, 20 Sep 2021 13:35:28 +0000 (UTC)
Date:   Mon, 20 Sep 2021 16:34:59 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YUiOA4QEbZXPmQ7F@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210919 17:42]:
> Hi
> 
> I found another timer related regression on BeagleBoard Rev C2 which was
> present before 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix
> suspend and resume for am3 and am4") and which remains after fix
> 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with reserved
> status") including today's head d4d016caa4b8 ("alpha: move __udiv_qrnnd
> library function to arch/alpha/lib/").
> 
> Issue occurs when omap3_isp is not loaded and symptoms are the same than
> my previous finding [1]. I.e. timer interrupts appear missing and need
> to hit keys on serial console in order to let boot (when omap3_isp not
> built) or "sleep 1" in shell to continue.
> 
> I bisected that regression to commit
> e428e250fde6 ("ARM: dts: Configure system timers for omap3")

OK thanks for bisecting it down :)

> According to commit and dmesg it seems to switch from 32k timer to 13
> MHz timer. Commit does not explain why it marks 32k timer as unusable on
> the BeagleBoard. Or was that a copy-paste error from another dts?

There is a 32k timer errata for beagleboard "Boards revision A and < B5"
at https://elinux.org/BeagleBoard_Community, but looks like that is
not what we were doing earlier looks like..

> Before
> 
> [    0.000000] OMAP clockevent source: timer12 at 32768 Hz
> [    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
> [    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 58327039986419 ns
> [    0.000030] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
> every 65535999984741ns

Interesting, so the workaround we've had is still using the 32k clock
source instead of the mpu clock source, and also using the 32k_counter.
Let's switch back to that then, that sounds much nicer :)

> After e428e250fde6
> 
> [    0.000000] TI gptimer clockevent: 13000000 Hz at
> /ocp@68000000/target-module@49032000
> [    0.000000] TI gptimer clocksource: always-on
> /ocp@68000000/target-module@48304000
> [    0.000091] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
> every 65535999984741ns
> [    0.000183] clocksource: dmtimer: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 58327039986419 ns

The patch below should take us back to the earlier configuration,
can you please give it a try?

> I fail to understand how omap3isp affects this since it actually disable
> clocks after probe. Does it keep some power domain active which then
> keeps the timer active etc?

Sounds like it's because omap3isp never allows the SoC to enter deeper
idle states. The mpu clock is stopped for idle states.

Regards,

Tony

8<---------------
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -304,11 +304,6 @@ &usbhsehci {
 	phys = <0 &hsusb2_phy>;
 };
 
-/* Unusable as clocksource because of unreliable oscillator */
-&counter32k {
-	status = "disabled";
-};
-
 /* Unusable as clockevent because if unreliable oscillator, allow to idle */
 &timer1_target {
 	/delete-property/ti,no-reset-on-init;
@@ -318,22 +313,13 @@ timer@0 {
 	};
 };
 
-/* Preferred always-on timer for clocksource */
+/* Preferred always-on timer for clockevent */
 &timer12_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
 	timer@0 {
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
+		assigned-clocks = <&gpt12_fck>;
+		assigned-clock-parents = <&secure_32k_fck>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/omap3-devkit8000.dts b/arch/arm/boot/dts/omap3-devkit8000.dts
--- a/arch/arm/boot/dts/omap3-devkit8000.dts
+++ b/arch/arm/boot/dts/omap3-devkit8000.dts
@@ -15,11 +15,6 @@ aliases {
 	};
 };
 
-/* Unusable as clocksource because of unreliable oscillator */
-&counter32k {
-	status = "disabled";
-};
-
 /* Unusable as clockevent because if unreliable oscillator, allow to idle */
 &timer1_target {
 	/delete-property/ti,no-reset-on-init;
@@ -29,21 +24,12 @@ timer@0 {
 	};
 };
 
-/* Preferred always-on timer for clocksource */
+/* Preferred always-on timer for clockevent */
 &timer12_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
 	timer@0 {
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
+		assigned-clocks = <&gpt12_fck>;
+		assigned-clock-parents = <&secure_32k_fck>;
 	};
 };
-- 
2.33.0
