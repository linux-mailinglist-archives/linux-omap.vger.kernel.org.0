Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E899E8E2
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 15:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfH0NSI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 09:18:08 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34612 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfH0NSI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 09:18:08 -0400
Received: by mail-io1-f66.google.com with SMTP id s21so46250055ioa.1
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1pkRVznGKJn2z3uI90pRH3USsWcuJPwCpBe5WVVqRQg=;
        b=SxqYjGoCK0deYXj3q6btb5bzsjCjt+oW3o2N1s+DB1CvaVkj15ze1tMVH6On6GlDIV
         BJWJPpSmwDffNKIzjuBsgdLCv0NaejMHrLnMAmNyBYeesNxOyCtZ/zxWQn8OX8r468ZU
         Vb4iTX0WQMqCG6/lOEECWzogdJw8ujrpPoHJykbasbyGtJUsPICa/pLENZPFlc9WtR1K
         iztj4ft0HVaWQlNPfU/ivSVrQaRY4ZRqPAnUn4Canv0PkJvNxrOCUeKn3L0ixMX6YcLk
         JjeKYf9GSsynJ0ugdP0aA0PNl84pIlh+X8mO5IWbhuZdt1ZoxXbrq/+XqQbLNV+QM7fR
         vIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1pkRVznGKJn2z3uI90pRH3USsWcuJPwCpBe5WVVqRQg=;
        b=YlUjgt/7mFKJ9Qh1dADS3xFGMrRW9khAd9Sdf/9HC3Eo+y4OBQ7tt0GRyTLmJ9JJzV
         RT6UCg9eX/eG+0v8MnRDJ9fQBPntQfQ0m5B4IhkseiA6Aw9vNEa8VzqXIv9sqfuyHJgt
         CQCeO+DRngwjlf6pMwIv1tjIM4GpC1hvdE83Gk8IjMbdVy4WJI7JfmmlTsFLC5BXJB03
         W5tshysI4Jmey/ipbkzzwE5RNb1RT6yEFLi7KGQwXShmUVc3+fxHIxNXAZIk5OKmpwdf
         OjxfEiViU9vV8eEDZ9/nOjd2+Y28+ZeOwuoOTl4bm4z5vRwGcZJbEgMwXTF//I43lSi3
         OHmQ==
X-Gm-Message-State: APjAAAWO07TLNlz+UZLlaN1dGekTpmIq5FYpVglKZQDm8T4iDZCDZl6k
        eWXP7/sKsXUxr4ra+nSAqloiH0S3MFbc97N0586n6fdg
X-Google-Smtp-Source: APXvYqz6jNuUHZAEadnNeAO1NDgNdBpiBfgqjHxI2WlGeWYawgS9MPimLr+MpumTb8Y9/7lAGq+F+VJKeUo2JzB8oJo=
X-Received: by 2002:a6b:e511:: with SMTP id y17mr7302942ioc.228.1566911887038;
 Tue, 27 Aug 2019 06:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com> <20190827081120.6lvtmqrdh2un7kit@pali>
In-Reply-To: <20190827081120.6lvtmqrdh2un7kit@pali>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 27 Aug 2019 08:17:55 -0500
Message-ID: <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
Subject: Re: OMAP3 ROM RNG probe failure on N900
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Aug 27, 2019 at 3:12 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
>
> On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > Hi,
> > >
> > > I was looking at N900 boot logs from the current mainline (v5.3-rc),
> > > and noticed this:
> > >
> > > [    3.297668] omap3_rom_rng: initializing
> > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with erro=
r -2
> > >
> > > It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: oma=
p3:
> > > cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
> > > How this driver is supposed to work now? I guess it has been broken f=
or
> > > a while. :-(
> >
> > You should have a DT node for the device, which contains the clock hand=
le.

I am interested in enabling the RNG too, because sshd takes a long
time to initialize without the hwrng.

I am not able to find addresses in either the DM3730 TRM nor the
OMAP3530 TRM.  Can someone from TI make a recommendation as to what
the node address should be?  Having this would be a nice starting
point.  Also looking at the other omap RNG nodes there are references
to hwmods, but looking at the platdata in pdata quirks, I am not
seeing anything.

There is also chunks of code that exist insdie
arch/mach-omap2/omap-secure.c which appear to only be referenced from
this driver, so I wonder if there might be some way to
combine/condense this once it's been converted to device tree and
functional again.

adam
>
> Hello, I have not tested new kernel on N900 for a longer time. And at
> that time (4.9) it worked fine. So it is just missing DT node? Maybe you
> could fix it when you testing it?
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
