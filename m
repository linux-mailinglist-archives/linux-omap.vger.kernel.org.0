Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7000F1DE405
	for <lists+linux-omap@lfdr.de>; Fri, 22 May 2020 12:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgEVKQR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 May 2020 06:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgEVKQQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 22 May 2020 06:16:16 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05E7C061A0E
        for <linux-omap@vger.kernel.org>; Fri, 22 May 2020 03:16:15 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id l20so10131431ilj.10
        for <linux-omap@vger.kernel.org>; Fri, 22 May 2020 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=lFglfxtflhYB6+KPpkNDLZLP+UDYE2uMjE/WOWfdIQ4=;
        b=PwP/wnylahn6Q8UfoXhziwB+1v9cLXkxedtHcubFNn/eq00GGkYxBGkC8ZWdZj8SQu
         OyWD3A43+c0+lEDTm4IwjBgw9sGE8QLBo4wCpHGsEHoHgcgK/3MTucg6+tkFeQS4y+L0
         7Lsw7RII+nGD0B2smh6Ze06JmbLDIY+ooLOi3MuN7JMVlHvxT9d8t6kSeCuCGklbAJGZ
         3AB6LJHIeuI7zYV+GrEi3+0MRTTTnZV1AIMuz/OjQttG1NVJC9xtHm/P3ZJ5rrmHWLL7
         m8o9iywouXyXreDQsZlhY4JgkYMGP7rAs++PaNIibJtEccSSi6s+nb5qsGz/NwqDqjbh
         /IRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=lFglfxtflhYB6+KPpkNDLZLP+UDYE2uMjE/WOWfdIQ4=;
        b=VOUrqOMiZ6WtkXry+e3XnqavSNYbA7ioL33XB7BsT1uci04mC9ByVe8s9TQpJ9FpRF
         Zs8OBRv1Hi9C0SpU8nuWeF4lNZB0PO5WKBKeletLBcrMEAPZkQOCV/VsBUmnXjm9J885
         Fc2JZ5ntGcpxo4Mx+1p/NyFLBuFdA1oGRMz/ugVcBBH2noqnxxQQQKoSuMLYctuNzmSb
         b6+FyjpRW2scAa4YcJI8en3QGMzPmgYpTbshCzQKywFHkm80X6cUOyk5+qm0qJOyNX47
         KfWRdcABDDjGAlu1pMvklFklwxz5h4v1JR5+np8Azp3fvHN6c/ufDXDrxAR40kDmkMaM
         QpVA==
X-Gm-Message-State: AOAM530H40ROg5/rXH9su9Avb42NtRQ+h+HkE68qrjcCY0xcp1RkXKTy
        rsmniz1VGTEmU99vFGqdFucC5HaJasD/FdQhx/HWJHVxlrw=
X-Google-Smtp-Source: ABdhPJwm5PAX8tg0XXP+5DRtVDcEVZSPIdVgCtqVw0d864xj90X1X7WpHAKgIy87wOlN/sa14KmxwhegFJ43VGPaZz8=
X-Received: by 2002:a92:7e51:: with SMTP id z78mr9367851ilc.214.1590142574997;
 Fri, 22 May 2020 03:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
 <fedbed5e-8365-85ab-9b81-2ec25ffa64b4@ti.com> <CAHCN7x+E3YrRFerzOHKOQHfx67g=ANESuopskKpZHX5qBx_fHQ@mail.gmail.com>
 <20200521024445.GC5684@iaqt7>
In-Reply-To: <20200521024445.GC5684@iaqt7>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 22 May 2020 05:16:03 -0500
Message-ID: <CAHCN7x+cL00Vhdat5R6=AoTVpq7kt9C28aibZiwe3QuyCQ_fAw@mail.gmail.com>
Subject: Re: AM3517 MUSB and CPPI
To:     Bin Liu <b-liu@ti.com>, Adam Ford <aford173@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 20, 2020 at 9:44 PM Bin Liu <b-liu@ti.com> wrote:
>
> Hi Adam,
>
> First of all for my curiosity, what motivates you to bring up the AM3517
> MUSB support up to date?

I work for Logic PD, now called Beacon EmbeddedWorks, and we still get
inquiries for that SOM.  I've been trying to keep all the older SOM's
up-to-date in my spare time.  We have an L138/AM1808 SOM that seems
like it's in decent shape, as well as an OMAP3530 and a DM3730 which
all have most of their functionality.  The last remaining SOM to need
some fixing is the AM3517.

>
> Though I maintain the musb drivers, I don't know much about the devices
> other than AM335x. But I spent a little time looked at the drivers and
> the TRM, here is what I thought.
>
> Your query below seems showing that you are trying to bring up the CPPI41
> support for AM3517 MUSB, but have you got the glue driver working in PIO
> mode yet? It seems to be quite amount of effort to get PIO mode working.

I do not have either PIO nor CPPI41 support working yet.  I've been
using the L138 and the am335x as references because the AM3517 seems
very similar to both in some ways.  It appears more similar to the
am335x.

> The glue driver am35x.c is there but it doesn't support device tree. The
> dts am3517.dtsi defines the musb node with 'ti,omap3-musb' compatible,
> which seems not right, at least internal phy vs external phy, comparing
> with omap3 musb. am3517.dtsi also misses some required musb properties.

I've been working on that too, and the glue for the am35x glue that
was present before now probes when adding DT support and pointing the
am3517 OTG node to it.

> So I am not sure which glue driver should be used for AM3517 MUSB.
There was an am35x glue driver already present, but it was incomplete.

>
> I also looked the CPPI section in the TRM, yes, the scheduler register
> base offset should be 0x2000, and the queue manager register base offset
> should be 0x4000. But I think the CDMA controller register base should
> be 0x1800, not 0x1000 as shown in Table 20-9. However the register
> layout in these 3 segments are quite different from those on AM335x, so
> it seems the CPPI41 dmaengine driver need some work as well to support
> AM3517 CPPI.

That's what worries me.  I am OK with using PIO instead of the DMA,
but I wasn't sure which driver to use as an example to follow.  If you
have any suggestions or pointers, I'm fine with PIO.  My main goal is
to get the MUSB working again, and we can improve power or performance
later.

thanks
>
> -Bin.
>
> On Mon, May 18, 2020 at 05:19:32AM -0500, Adam Ford wrote:
> > On Mon, May 18, 2020 at 12:35 AM Sekhar Nori <nsekhar@ti.com> wrote:
> > >
> > > + Bin who maintains MUSB controller support
> > >
> > > On 5/18/20 8:17 AM, Adam Ford wrote:
> > > > From what I can tell, the MUSB controller on the AM3517 hasn't worked
> > > > in a very long time.
> >
> > Thanks for adding Bin.
> >
> > I can post of code patches as an RFC if interested.  They don't work
> > any better, but they don't work any worse either.
> >
> > I have modifications to the am35x glue to support cppi41, cppi41 to
> > support am35, and updates to the device tree to point the musb
> > controller to the am35 glue with additions for cppi41 references and
> > some additional clocks.
> >
> > adam
> >
> > > >
> > > > I have been going through the TRM for the AM3517, and I am convinced
> > > > the device tree for the OTG port is wrong, but I am struggling to fix
> > > > it.
> > > >
> > > > From what I can see the USB OTG Port support the CPPI 4.1 DMA
> > > > controller, but the CPPI 4.1 only appears to support the
> > > > DA850/OMAP-L138 and the AM335x family.
> > > >
> > > > It appears as if the AM35xx is a bit closer in behavior to the AM335x
> > > > than the L138, but I was hoping either Tony, Tero or someone from TI
> > > > might have a suggestion.
> > > >
> > > > The compatible flag need to be something like "compatible =
> > > > "ti,am35xx-musb" and not omap3, because OMAP3 doesn't support the CPPI
> > > > 4.1 DMA controller and the AM3517 does.
> > > >
> > > > Secondly, we need to update a couple of the tables in the cppi driver
> > > > to support the am3517, and lastly, the device tree node needs to
> > > > support the CPPI driver.
> > > >
> > > > It looks like the DA850/L138 makes the CPPI driver a sub-node of the
> > > > OTG port, while the am335x has it as a separate node from the USB
> > > > controller.
> > > >
> > > > From what I can tell on the AM3517, the CPPI DMA node should be a
> > > > sub-node of the OTG.
> > > >
> > > > What I am struggling with now is the register offsets for controller,
> > > > scheduler and queue manager.
> > > > On both DA850 the 335x, there is an explicit table entry showing the
> > > > offset of DMAREVID, which tells the DMA revision ID.  I cannot find a
> > > > corresponding register for the AM3517, yet the AM3517
> > > >
> > > > FWICT, the scheduler is offset 0x2000 with respect to the OTG
> > > > controller, and the Queue Manager register is at 0ffset 0x4000, both
> > > > with respect to the OTG base address.  Unfortunately, I am not finding
> > > > the offset for the CDMA controller itself.
> > > >
> > > > Can someone tell me what it should be?  I am guessing it would be near
> > > > the 0x1000 offset, but it's a pure guess.
> > > >
> > > > adam
> > > >
> > >
