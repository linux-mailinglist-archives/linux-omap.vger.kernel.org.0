Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7FD40F635
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 12:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241710AbhIQKsm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 06:48:42 -0400
Received: from muru.com ([72.249.23.125]:33900 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240611AbhIQKsk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Sep 2021 06:48:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C7ED680B3;
        Fri, 17 Sep 2021 10:47:44 +0000 (UTC)
Date:   Fri, 17 Sep 2021 13:47:16 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Message-ID: <YURyNMsUKpEST9sT@atomide.com>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210917 10:29]:
> Oh.. Sorry! I don't know where I picked Tom from... My bad!

No worries :)

> > For me, adding any kind of delay fixed the issue. Also adding some printk
> > statements fixed it for me.
> > 
> >> Any suggestions what to check next?
> > 
> > Maybe try the attached patch? If it helps, just try with the with the
> > ti,sysc-delay-us = <2> added as few modules need that after enable.
> > 
> > It's also possible there is an issue with some other device that is now
> > getting enabled other than pruss. The last XXX printk output should show
> > the last device being probed.
> > 
> > Looks like you need to also enable CONFIG_SERIAL_EARLYCON=y, and pass
> > console=ttyS0,115200 debug earlycon in the kernel command line.
> 
> Ah. Thanks again. I indeed lacked the "debug earlycon" parameters. Now 
> we're more likely to see what went wrong :) I pasted the serial log form 
> failing boot with v5.15-rc1 which has both the patch you linked me above 
> and the patch you suggested me to test in previous email.

OK thanks.

> [    2.830347] ti-sysc 4a326000.target-module: XXX sysc_probe
> [    2.836198] 8<--- cut here ---
> [    2.839339] Unhandled fault: external abort on non-linefetch (0x1008) 
> at 0xe0266000

Yup, this is the pruss target-module@300000 that has the first reg at
4a326000. The oops look very similar to what I was seeing with my bbb.
The external abort means the pruss module is not properly enabled when
accessing the registers.

Not sure what might be different here, presumably all am335x hardware has
the pruss. Maybe try with a larger ti,sysc-delay-us value? I doubt that
helps though as 2 is the most we've seen so far for the delay needed..

Maybe the issue is in omap_reset_deassert(). You could try adding some
printk to omap_reset_deassert() and see if the issue happens right away
or after deasserting the reset. If it's after deasserting the reset, you
could adding delay to the end of omap_reset_deassert() and see if that
helps.

Regards,

Tony
