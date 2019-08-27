Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0686B9EA27
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 15:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfH0Nyu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 09:54:50 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36824 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfH0Nyt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 09:54:49 -0400
Received: by mail-io1-f68.google.com with SMTP id o9so46460845iom.3
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 06:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3GoxYzc0iWGnVxafTiyZEikCiQ7dQpacmXUkly5lPHQ=;
        b=mPbTeDHobHib7kMaymZX7hLSPuCLJM74LUgC9F0vxsdwHkrI38QsjHKcsd/E/2k310
         OMoPFMsADA/lb1s8h02qzkYLs4jgVGPRxeAtRy1T+cgt97oIukJLVeBEDBl2C1SkJN4Z
         h3tn2jhENOLhJE5HyHSVmT9HNG8VO61Vz0JyNUx+xGlDscJKt9Toc6PisNeGMACsuYSo
         4znGaooe09tiQk5fAOSv0h1r81BuwY5CMISQ/A1NXAaJr+C5cB8fhysE9Kc/Rvt+RguY
         GuT8fyKLzm2m0lU0oJILA8uUzw1LwJ7+hu2WTIBGS7hrxZRE06tkLCd9CxMr2d72/l89
         xBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3GoxYzc0iWGnVxafTiyZEikCiQ7dQpacmXUkly5lPHQ=;
        b=YqgmHQ/jDib1cthcVMrizSMJZCrEFzWKVtpJJ1KFh0Vf8B2Bpbr2mLu7TpK747DkYO
         /gvjZgNNQCWWpB32arovYAIe5/Z9xUV19i336dJJ1zcjfi/ZXhAh8TZWxZbkNjMyyYQB
         Od020a3AGeQuHNW3zQ8zcADy7FQBWlZ/cWnhr3tNpKV+l/ZoHnyRAyYihrGiNot0qNMM
         C8hZXChfV+alEwYNNcBrK4Ch69gdMEMB1blVvmEOMwVQqYQzJUE8aUrfLckMfjEX7Kpa
         G6UcfQjnIKQReyfEWRyqk0s2W5FSlNRiiCNjhHlYQGxW1VqhpR5jkj7gY5eY4fea4sAi
         DCrA==
X-Gm-Message-State: APjAAAWGGb3jTEWLkUA6t1+nitE2G3Ib10V3g4mp5Wk334+S7dnNb+8q
        UmhG0O5AY/85Wm4l7WSmWzHtObBmtDYFIQTeHco=
X-Google-Smtp-Source: APXvYqxugy5qEXXnxXx3NFgNewoNlBlow+agBmZtjDHjAki6RxPtepVHtjI1VDrboGNPvANyD15bw65KeaWoc08eCcw=
X-Received: by 2002:a6b:e511:: with SMTP id y17mr7495200ioc.228.1566914088492;
 Tue, 27 Aug 2019 06:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com> <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
 <20190827132419.wgcn36557zlwjmah@pali> <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
 <20190827134905.5mc5b3rxpmojp3ay@pali>
In-Reply-To: <20190827134905.5mc5b3rxpmojp3ay@pali>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 27 Aug 2019 08:54:36 -0500
Message-ID: <CAHCN7x+te3JWGNr440fLsU0fVnaLJY9_cdG_Keo8rPCzXNuODg@mail.gmail.com>
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

On Tue, Aug 27, 2019 at 8:49 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
>
> On Tuesday 27 August 2019 08:34:33 Adam Ford wrote:
> > On Tue, Aug 27, 2019 at 8:24 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> =
wrote:
> > >
> > > On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> > > > On Tue, Aug 27, 2019 at 3:12 AM Pali Roh=C3=A1r <pali.rohar@gmail.c=
om> wrote:
> > > > >
> > > > > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > > > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > I was looking at N900 boot logs from the current mainline (v5=
.3-rc),
> > > > > > > and noticed this:
> > > > > > >
> > > > > > > [    3.297668] omap3_rom_rng: initializing
> > > > > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed w=
ith error -2
> > > > > > >
> > > > > > > It seems some clock data was deleted with 0ed266d7ae5e ("clk:=
 ti: omap3:
> > > > > > > cleanup unnecessary clock aliases"), including one for omap3-=
rom-rng.
> > > > > > > How this driver is supposed to work now? I guess it has been =
broken for
> > > > > > > a while. :-(
> > > > > >
> > > > > > You should have a DT node for the device, which contains the cl=
ock handle.
> > > >
> > > > I am interested in enabling the RNG too, because sshd takes a long
> > > > time to initialize without the hwrng.
> > > >
> > > > I am not able to find addresses in either the DM3730 TRM nor the
> > > > OMAP3530 TRM.  Can someone from TI make a recommendation as to what
> > > > the node address should be?  Having this would be a nice starting
> > > > point.  Also looking at the other omap RNG nodes there are referenc=
es
> > > > to hwmods, but looking at the platdata in pdata quirks, I am not
> > > > seeing anything.
> > > >
> > > > There is also chunks of code that exist insdie
> > > > arch/mach-omap2/omap-secure.c which appear to only be referenced fr=
om
> > > > this driver, so I wonder if there might be some way to
> > > > combine/condense this once it's been converted to device tree and
> > > > functional again.
> > >
> > > This part of code calls N900's PPA function via SMC instruction, whic=
h
> > > is provided by closed Nokia bootloader NOLO/X-Loader. So it is needed=
.
> >
> > I am arguing that there is open source code for OMAP2 and OMAP4 RNG, I
> > don't understand why we can't have support for everyone.  The TRM
> > references the RNG, but it doesn't give much info.  There are other
> > RNG's supported in the open source so I would think if the IP is
> > present in the chips, we should be able to use it without a custom
> > bootloader.
>
> I do not know about general solution for OMAP3.
>
> But Nokia N900 is HS device, has signed and closed bootloader (Nokia
> X-Loader) which is running in secure mode and it does not enable L3
> firewall (or how it is called in OMAP world) for accessing RNG blocks
> outside of secure mode. It just export PPA function which "other side"
> can use to get access to RNG.
>
> Accessing blocks which are not allowed by that firewall cause immediate
> reset of board. So kernel must avoid such things.
>
> So for OMAP3 HS devices, like N900, we need signed bootloader which
> either enable direct access to RNG (which we do not have) or bootloader
> which provide custom PPA call for RNG (which we have).
>
> Exactly same problem is with AES acceleration on N900. See for details:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D69540a7c277d96382257216436f41abc040cc878

I have an OMAP3 and I am able to access the AES and SHA acceleration
using the cryptodev instructions following:
http://processors.wiki.ti.com/index.php/AM335x_Crypto_Performance

I am able to load the SHA and AES modules without signed bootloaders.

>
> Later I played a bit with that L3 firewall and reading its configuration
> is also disabled. After trying to read it 3 or 4 times from userspace I
> got immediate reset of board. I was told that this is normal (firewall
> violation) and reset is there for security reasons.

If you're using secure world, I would expect this behaviour, but I am
just not seeing why access to the HWRNG would be limited to secure
world when I can use HWRNG for other processors families without it.

>
> Public GP TRM does not provide information because RNG is part of crypto
> IP and it is for HS devices. And IIRC TRM for HS devices is (or was)
> available only under NDA and only for licensed customers.

I agree, yet the omap2 and omap4 rng have open source code. I wonder
how different the omap3 version is from the omap2.

>
> Somebody from TI should really provide up-to-date information about this
> topic. All those information are from time when I played with AES which
> is from year 2014.

I could not agree more.

adam
>
> > adam
> >
> > >
> > > > adam
> > > > >
> > > > > Hello, I have not tested new kernel on N900 for a longer time. An=
d at
> > > > > that time (4.9) it worked fine. So it is just missing DT node? Ma=
ybe you
> > > > > could fix it when you testing it?
> > > > >
> > > > > --
> > > > > Pali Roh=C3=A1r
> > > > > pali.rohar@gmail.com
> > >
> > > --
> > > Pali Roh=C3=A1r
> > > pali.rohar@gmail.com
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
