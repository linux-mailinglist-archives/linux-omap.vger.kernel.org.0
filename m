Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1887E6C6063
	for <lists+linux-omap@lfdr.de>; Thu, 23 Mar 2023 08:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCWHHC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Mar 2023 03:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjCWHHB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Mar 2023 03:07:01 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C5BF0C4
        for <linux-omap@vger.kernel.org>; Thu, 23 Mar 2023 00:07:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1C86880CF;
        Thu, 23 Mar 2023 07:07:00 +0000 (UTC)
Date:   Thu, 23 Mar 2023 09:06:58 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Bin Liu <b-liu@ti.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: am335x: performnce issues with FTDI and LOW_LATENCY
Message-ID: <20230323070658.GP7501@atomide.com>
References: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
 <20230306074200.GD7501@atomide.com>
 <CAGm1_ktJH21qk=eRH_xJgwkf_pGCgp1z7Jrp5M2orZ-eNRNg=Q@mail.gmail.com>
 <20230309073000.GG7501@atomide.com>
 <20230310223541.xa372p4gbfqg4dh2@iaqt7>
 <CAGm1_kvffnb2jYtY5NzMUkekTf4eOc7D2r2dHuf0_bOEqZEu=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGm1_kvffnb2jYtY5NzMUkekTf4eOc7D2r2dHuf0_bOEqZEu=A@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [230313 07:09]:
> On Fri, Mar 10, 2023 at 11:35 PM Bin Liu <b-liu@ti.com> wrote:
> >
> > On Thu, Mar 09, 2023 at 09:30:00AM +0200, Tony Lindgren wrote:
> > > * Yegor Yefremov <yegorslists@googlemail.com> [230307 09:53]:
> > > > On Mon, Mar 6, 2023 at 8:42 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > >
> > > > > * Yegor Yefremov <yegorslists@googlemail.com> [230228 08:01]:
> > > > > > Any idea why the performance drop is so big?
> > > > >
> > > > > Maybe lots of interrupts and dma not being used for musb in this case?
> > > >
> > > > Using "irqtop -d 1", I get the following results:
> > > >
> > > > 3.18.1 LATENCY_OFF (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller
> > > > 3.18.1 LATENCY_ON (16 ports): ca. 4000 IRQs/s INTC 17 47400000.dma-controller
> > > >
> > > > 6.2.1 LATENCY_OFF (16 ports): ca. 300 IRQs/s INTC 17 47400000.dma-controller
> > > > 6.2.1 LATENCY_ON (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller
> > >
> > > Hmm I wonder what's causing that. Earlier the Ethernet gadget had some
> > > alignment define tweak that made transfers faster. What kind of data
> > > transfer are you testing with?
> > >
> > > > #zcat /proc/config.gz | grep CPP
> > > > CONFIG_USB_TI_CPPI41_DMA=y
> > > > CONFIG_TI_CPPI41=y
> > >
> > > From what I recall musb still handles short transfers with PIO, I think
> > > this is the case also for cppi41 dma. Sounds like that does not explain
> > > the difference you're seeing between 3.18 and 6.2 kernels though.
> >
> > I quickly scanned the changes on musb_cppi41.c and dma/cppi41.c between
> > v3.18 and v5.4, but nothing stands out. I am wondering if this is
> > something caused by outside of usb subsystem...
> 
> As for the network transfer, here is some background info. The devices
> use SNMP (also internally) to handle device configuration data. This
> issue was first detected as devices with 8 serial ports reacted really
> slow when opening their web interface (on a 16 port device, opening a
> web page lasted more than 2 minutes). Profiling showed the system was
> busy handling UDP transactions (internal UDP requests to collect data
> for the web interface).
> 
> The devices that were using OMAP UARTs only (one and two port devices)
> didn't show this behavior. So the root cause was found: FTDIs. To
> examine their impact on the system without our firmware, I have
> written a small program where I can open as many ports as I need and
> also specify the LOW_LATENCY flag. iperf3 with default settings (TCP)
> could exactly show the influence of the LOW_LATENCY flag.
> 
> "modprobe mtd_speedtest" shows 50% performance degradation with 16
> ports open and the LOW_LATENCY flag.
> 
> Any idea how I can get more info about what's going on in the kernel?

Maybe try adding some trace_printk() to the code.

I'd check the fifo read/write for PIO, those should end up using
ldmia/stdmia via the related read and write functions.

And maybe threaded IRQ related changes have caused longer latencies
for PIO transfers? Maybe check DMA related transfers and see if they
too are slower now?

Regards,

Tony
