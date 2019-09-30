Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20BF1C23BF
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 16:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731905AbfI3O5Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 10:57:16 -0400
Received: from muru.com ([72.249.23.125]:34892 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730780AbfI3O5Q (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Sep 2019 10:57:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id ADF3B80FA;
        Mon, 30 Sep 2019 14:57:47 +0000 (UTC)
Date:   Mon, 30 Sep 2019 07:57:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-omap@vger.kernel.org, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when
 connected to musb directly
Message-ID: <20190930145711.GG5610@atomide.com>
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
 <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
 <20190927151935.GD5610@atomide.com>
 <20190927155738.GF5610@atomide.com>
 <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
 <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [190930 08:20]:
> On Mon, Sep 30, 2019 at 8:59 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > On Sat, Sep 28, 2019 at 6:09 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > On Fri, Sep 27, 2019 at 5:57 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > Looks like I'm unable to reproduce this with bbb and FT232R
> > > > USB UART.
> > > >
> > > > I tried v5.3 with omap2plus_defconfig, then boot, load musb
> > > > and ftdi-sio modules, then connect ftdi directly to bbb,
> > > > and then run "minicom -D /dev/ttyUSB0" on bbb and it works
> > > > just fine for me.
> > > >
> > > > I tried also rebooting the device inbetween in case it only
> > > > happens on the first connect after boot but still no luck
> > > > reproducing.
> > >
> > > Strange. I've used a loopback to check whether the characters will be echoed.
> > > FTDI cable was connected all the time so that I could check RX right after boot.
> > > Both Buildroot and OpenWrt rootfs's showed this behaviour.
> > >
> > > > Maybe try adding some debug prints to cppi41_runtime_suspend()
> > > > and cppi41_runtime_resume() to see if gets runtime suspended
> > > > too early?
> > >
> > > Will do on Mo.
> >
> > I've added the printks to both routines and the result is quite
> > interesting. On the system with a directly attached FTDI both routines
> > will be always invoked before (resume) and after (suspend) the
> > test/minicom i.e. during the USB initialization.
> >
> > On the systems with a USB hub, these routines will be invoked only
> > during the USB initialization and the last invocation is resume.
> > During the test, there are no invocations.

Hmm OK thanks. Hard to say still based on that what might be missing.

I just tried also musb and phy built-in with FTDI connected on
boot, but still no luck reproducing the issue here.

> Removing PM routines workarounds the issue. Quick and dirty.
> 
>  static struct platform_driver cpp41_dma_driver = {
>           .probe  = cppi41_dma_probe,
>           .remove = cppi41_dma_remove,
>           .driver = {
>                   .name = "cppi41-dma-engine",
>                   /*.pm = &cppi41_pm_ops,*/
>                   .of_match_table = of_match_ptr(cppi41_dma_ids),
>           },
>   };

Well doing something like this to disable autosuspend might
be less intrusive until this one is fixed:

# echo on > /sys/bus/platform/drivers/musb-hdrc/musb-hdrc.1/power/control

But before that, maybe try with control set to auto, and increase the
autosuspend_delay_ms from 500 ms to let's say 2500 ms:

# echo 2500 > /sys/bus/platform/drivers/musb-hdrc/musb-hdrc.1/power/autosuspend_delay_ms

That is assuming the musb instance is 1 on your board, replace
with musb-hdrc.0 if a different interface from bbb.

Regards,

Tony
