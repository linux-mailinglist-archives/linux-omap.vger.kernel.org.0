Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA2640F225
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 08:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234581AbhIQGPu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 02:15:50 -0400
Received: from muru.com ([72.249.23.125]:33802 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232039AbhIQGPu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Sep 2021 02:15:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D4DC180FB;
        Fri, 17 Sep 2021 06:14:54 +0000 (UTC)
Date:   Fri, 17 Sep 2021 09:14:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Suman Anna <s-anna@ti.com>, "Andrew F. Davis" <afd@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Message-ID: <YUQyQgFAOFnBlcdP@atomide.com>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="oRDPEQLgRneHPu9G"
Content-Disposition: inline
In-Reply-To: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--oRDPEQLgRneHPu9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210916 09:15]:
> Yesterday I asked about this at #armlinux so if someone saw my message 
> there - this is the same topic.
> 
> My beaglebone black (rev c) based test environment fails to boot with 
> v5.15-rc1. Boot succeeds with the v5.14.
> 
> I use pretty old uBoot, TFTP to load kernel and device-tree, and have 
> hosted the rootfs on NFS server.

Using older u-boot versions should be just fine. Using bootz with zImage
instead of uimage is a good reason to update for folks using a really
old u-boot though.

> The v5.15-rc1 fails to boot with no prints from kernel visible in serial 
> console. Please see the serial log at the end of this message.
> 
> Bisecting the Linus' tree pointed out the commit:
> [1c7ba565e70365763ea780666a3eee679344b962] ARM: dts: am335x-baltos: 
> switch to new cpsw switch drv
> 
> I don't see this exact commit touching the BBB device-tree. In Linus' 
> tree it is a part of a merge commit. Reverting the whole merge on top of 
> the v5.15-rc1
> 
> This reverts commit 81b6a285737700c2e04ef0893617b80481b6b4b7, reversing
> changes made to f73979109bc11a0ed26b6deeb403fb5d05676ffc.
> 
> makes my beaglebone black to boot again.
> 
> Yesterday I tried adding this patch:
> https://lore.kernel.org/linux-omap/20210915065032.45013-1-tony@atomide.com/T/#u
> pointed by Tom on top of the v5.15-rc1 - no avail. I also did #define 
> DEBUG at ti-sys.c as was suggested by Tom - but I don't see any more output.

Correction, that was me, not Tom :)

For me, adding any kind of delay fixed the issue. Also adding some printk
statements fixed it for me.

> Any suggestions what to check next?

Maybe try the attached patch? If it helps, just try with the with the
ti,sysc-delay-us = <2> added as few modules need that after enable.

It's also possible there is an issue with some other device that is now
getting enabled other than pruss. The last XXX printk output should show
the last device being probed.

Looks like you need to also enable CONFIG_SERIAL_EARLYCON=y, and pass
console=ttyS0,115200 debug earlycon in the kernel command line.

Regards,

Tony

--oRDPEQLgRneHPu9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="debug.patch"

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -845,6 +845,7 @@ pruss_tm: target-module@300000 {	/* 0x4a300000, ap 9 04.0 */
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
 			clocks = <&pruss_ocp_clkctrl AM3_PRUSS_OCP_PRUSS_CLKCTRL 0>;
 			clock-names = "fck";
 			resets = <&prm_per 1>;
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2,7 +2,7 @@
 /*
  * ti-sysc.c - Texas Instruments sysc interconnect target driver
  */
-
+#define DEBUG
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
@@ -3051,6 +3051,8 @@ static int sysc_probe(struct platform_device *pdev)
 	if (!ddata)
 		return -ENOMEM;
 
+	dev_info(&pdev->dev, "XXX %s\n", __func__);
+
 	ddata->offsets[SYSC_REVISION] = -ENODEV;
 	ddata->offsets[SYSC_SYSCONFIG] = -ENODEV;
 	ddata->offsets[SYSC_SYSSTATUS] = -ENODEV;

--oRDPEQLgRneHPu9G--
