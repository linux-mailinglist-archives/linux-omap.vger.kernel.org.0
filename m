Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AB543639D
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 15:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhJUOA4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 10:00:56 -0400
Received: from muru.com ([72.249.23.125]:47058 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230390AbhJUOAt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 21 Oct 2021 10:00:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B4E3E80EB;
        Thu, 21 Oct 2021 13:59:06 +0000 (UTC)
Date:   Thu, 21 Oct 2021 16:58:32 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YXFyCIGJj4HnHCpy@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <2e85559a-52fe-f887-51b5-4e7505ebda1e@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e85559a-52fe-f887-51b5-4e7505ebda1e@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Jarkko Nikula <jarkko.nikula@bitmer.com> [211020 17:53]:
> Hi
> 
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
> As discussed offline recently I triple checked your first patch in this
> thread on top of v5.15-rc6 and using omap2plus_defconfig (has
> CONFIG_SERIAL_EARLYCON=y) and still I'm not able to get any output with
> earlyprintk.

Oh looks like omap3-beagle variants are missing the stdout-path
that allows CONFIG_SERIAL_EARLYCON=y with "earlycon" in the kernel
command line to show early serial debug output. Can you try with the
patch below?

> My kernel command line included "console=ttyO2,115200n8 debug
> earlyprintk=ttyO2,115200n8". Plain v5.15-rc6 boots.

You also need to add "earlycon" to the command line. You could just add
"debug earlycon earlyprintk" if you ever need these and debug is not
too noisy for you :) With the stdout-path, you don't need to specify
earlyprintk.

You should also update your command line to use use ttyS2 instead
of ttyO2 to avoid extra warnings while at it. And make sure your
.config has CONFIG_SERIAL_8250_OMAP=y. These should not affect the
earlycon output AFAIK though.

> Could it be possible the "secure_32k_fck" clock has some system hanging
> issue on my beagle? How I understand from e428e250fde6 ("ARM: dts:
> Configure system timers for omap3") that "secure_32k_fck" is not
> referenced explicitly but your patch here does.

Yes seems like there may be some extra issue on the omap3-beagle
boards. Seeing the earlycon output would be good to see.

Regards,

Tony

8< -----------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Thu, 21 Oct 2021 16:48:30 +0300
Subject: [PATCH] ARM: dts: Add missing stdout-path for omap3-beagle
 variants

This allows seeing early serial console output as long as the kernel
config has CONFIG_SERIAL_EARLYCON=y, and the kernel command line has
earlycon.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap3-beagle-xm.dts | 4 ++++
 arch/arm/boot/dts/omap3-beagle.dts    | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-beagle-xm.dts b/arch/arm/boot/dts/omap3-beagle-xm.dts
--- a/arch/arm/boot/dts/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/omap3-beagle-xm.dts
@@ -21,6 +21,10 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>; /* 512 MB */
 	};
 
+	chosen {
+		stdout-path = &uart3;
+	};
+
 	aliases {
 		display0 = &dvi0;
 		display1 = &tv0;
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -21,6 +21,10 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>; /* 256 MB */
 	};
 
+	chosen {
+		stdout-path = &uart3;
+	};
+
 	aliases {
 		display0 = &dvi0;
 		display1 = &tv0;
-- 
2.33.0
