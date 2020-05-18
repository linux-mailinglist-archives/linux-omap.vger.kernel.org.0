Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0706E1D7503
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 12:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgERKTr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 06:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgERKTq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 06:19:46 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5C4C061A0C
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 03:19:46 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id j3so9240163ilk.11
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rLmkVzPobBYXUrEoEhYdcYB2lEJTqIjnOOM8GJfPDkI=;
        b=kwbsIAt3F3ezeg2SRqlpVsNfcffi5AyMNJxuryVkrQiV8uBVzR6oaBE+IKn2prlrIb
         DYiUqqtJSOdDi4V8ewLUG6EUwn47MktAel4cm1emT16ym6baB0oeAJamLaaGoWqjR6Ub
         o6xhdzNBwl3sqFkiBycGD3KcPX1a+U9bD9Jc9kf/yo8nBw98mmLwvGOUz584SggCtF6v
         Rp9Lt4dvE3gdygPiLs81tRXjMF0Nd2VErEfAPZqOTGgIYFzOkUl05RIevr2DhIGOpg5Y
         DilaUDqIce0hzDwZp3TJ4BSQ2AWpvF49+acia2dBRTogf5kxvP4u/tk1+xOd2EWu31Yn
         jaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rLmkVzPobBYXUrEoEhYdcYB2lEJTqIjnOOM8GJfPDkI=;
        b=adQWVdgBahekKbeYzPEwC0+J2aJAKi2fhXuxZ78R2J3AgmpslQ8Jyb7836vFB0IUg1
         GczXJQSmstMlY4Z9cM30UmjB13T5ByEvSBruS+p7kcJPaNFM4LmvsFqmccNA5luEweSP
         b9q9d9gNPBrAwywQJJ4AuQVqv7vsZOUt4/Vd3iIPZd6EZZhsJaLcVeotdsmj3VG+8Oyi
         CN1gYu1sst2ZkqUEwl8KxFN1z2+Zgpk+rNmHWI2ZR3zxuEJzGDP0LgEt14z3frVmCGFf
         DSg6Rfr8IHEPySh6KidZ3rZiijvBJWk7TF2RqM/rpzS+axnJZo2akHdV94NOI+qGDcca
         K9UQ==
X-Gm-Message-State: AOAM531is1VwCOO82GlGbZkPt2STifMbWvrPSm2uv7z2jUusVrgsIQZV
        NwZCWfLjFCYde1FWH57kwV+GvVxOXAmVS2h6mGQ=
X-Google-Smtp-Source: ABdhPJx6SwawAEPuoI5Pnz0uEWR8lat5l+EzLBN2MJ90FNUtkzXY8xz2mOLDrL5CXgiMiAnr8VfJuiNa6jNLhUt1Vao=
X-Received: by 2002:a92:3d8c:: with SMTP id k12mr14558160ilf.65.1589797185305;
 Mon, 18 May 2020 03:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
 <fedbed5e-8365-85ab-9b81-2ec25ffa64b4@ti.com>
In-Reply-To: <fedbed5e-8365-85ab-9b81-2ec25ffa64b4@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 18 May 2020 05:19:32 -0500
Message-ID: <CAHCN7x+E3YrRFerzOHKOQHfx67g=ANESuopskKpZHX5qBx_fHQ@mail.gmail.com>
Subject: Re: AM3517 MUSB and CPPI
To:     Sekhar Nori <nsekhar@ti.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>, "Liu, Bin" <b-liu@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 18, 2020 at 12:35 AM Sekhar Nori <nsekhar@ti.com> wrote:
>
> + Bin who maintains MUSB controller support
>
> On 5/18/20 8:17 AM, Adam Ford wrote:
> > From what I can tell, the MUSB controller on the AM3517 hasn't worked
> > in a very long time.

Thanks for adding Bin.

I can post of code patches as an RFC if interested.  They don't work
any better, but they don't work any worse either.

I have modifications to the am35x glue to support cppi41, cppi41 to
support am35, and updates to the device tree to point the musb
controller to the am35 glue with additions for cppi41 references and
some additional clocks.

adam

> >
> > I have been going through the TRM for the AM3517, and I am convinced
> > the device tree for the OTG port is wrong, but I am struggling to fix
> > it.
> >
> > From what I can see the USB OTG Port support the CPPI 4.1 DMA
> > controller, but the CPPI 4.1 only appears to support the
> > DA850/OMAP-L138 and the AM335x family.
> >
> > It appears as if the AM35xx is a bit closer in behavior to the AM335x
> > than the L138, but I was hoping either Tony, Tero or someone from TI
> > might have a suggestion.
> >
> > The compatible flag need to be something like "compatible =
> > "ti,am35xx-musb" and not omap3, because OMAP3 doesn't support the CPPI
> > 4.1 DMA controller and the AM3517 does.
> >
> > Secondly, we need to update a couple of the tables in the cppi driver
> > to support the am3517, and lastly, the device tree node needs to
> > support the CPPI driver.
> >
> > It looks like the DA850/L138 makes the CPPI driver a sub-node of the
> > OTG port, while the am335x has it as a separate node from the USB
> > controller.
> >
> > From what I can tell on the AM3517, the CPPI DMA node should be a
> > sub-node of the OTG.
> >
> > What I am struggling with now is the register offsets for controller,
> > scheduler and queue manager.
> > On both DA850 the 335x, there is an explicit table entry showing the
> > offset of DMAREVID, which tells the DMA revision ID.  I cannot find a
> > corresponding register for the AM3517, yet the AM3517
> >
> > FWICT, the scheduler is offset 0x2000 with respect to the OTG
> > controller, and the Queue Manager register is at 0ffset 0x4000, both
> > with respect to the OTG base address.  Unfortunately, I am not finding
> > the offset for the CDMA controller itself.
> >
> > Can someone tell me what it should be?  I am guessing it would be near
> > the 0x1000 offset, but it's a pure guess.
> >
> > adam
> >
>
