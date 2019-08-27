Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F909E97B
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 15:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbfH0Neq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 09:34:46 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34564 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfH0Neq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 09:34:46 -0400
Received: by mail-io1-f68.google.com with SMTP id s21so46382153ioa.1
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LGekAGbeiMBf2vw+AdoyKMH5wiNm7mPHvii0/3qzkJ0=;
        b=a/yVZxjpCTgNfnD1vNe+7Hn0P/iQgJ7KHChobfi2qt06LpBrAlp4+bJeXPSpJ+SSdF
         0iZI902rdu0nKa9O+R7+OdAAI4Y+ZxaMtL+uDPQdnU5TGmaViQV3+8/l6tTiUVKZl8x5
         kIBqkOGmRCLoL/Wt9AJ7A7qUHHNI4VIX2TQE8fjKCCDIENfvIcSBSM/JZZw4orhTCYJP
         6f2eKYPjK/g6sTYd4+OOMUXyCvgcIoy8//vCOAcnSdZKW4Wb3mhBr4B+wkRtZfkc7tEm
         8nv5/8fEk0sS3BhRToBaQDK6LAM5AgLTuEOgtZzkzAP4QxidXxI36hBVEghmxBOFbLyz
         5vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LGekAGbeiMBf2vw+AdoyKMH5wiNm7mPHvii0/3qzkJ0=;
        b=sN5Nae2ZM71h63YW6GG9IFShmnEXMJLOE6ysCJHkRlsVE9FrWJQuYbO2RoEcjqqYOW
         06tAHHpb53xLtA6gDgBCutZ8/xWgh06nNK5mcxJzYmTkZkLPp2in2ym4gPfkih0+sp1B
         NtXgUO1Ur+fbG2cw0gJcwYwSxMuxNrXC1OK2jPIpZcqVnjwtClhLq2N5YTT9IwJhurqH
         r/4rt+lcwUGiYlYLVj4S2Bu4Gmz/Ffnk9P6ANzoxLL1n91iRK8eJMzvEKsi7XinjEG3j
         gfCtIrlqe/0uSmpqichnDYGj32l7sSzHTrQ2em5APA3G6rblk4JRrqboYn9PvLiTmsKJ
         RU8w==
X-Gm-Message-State: APjAAAXvGj5fcYOHiaxykm2Qwu6xdhX9NPG4ZU/ZOIVmqNgnsg7ZBR4y
        8oI+kT2Ny8KzhIP3OA5X8hk57dMGeKpIp2Ua7fs=
X-Google-Smtp-Source: APXvYqwWzF2G3O7guPAEQXVrI4v9zyyMJRgJatemsLCXeg6YjzjybUbuJlLQybidM7v347xpbR+f8CT1RVaBUbeCi3w=
X-Received: by 2002:a05:6602:2195:: with SMTP id b21mr8682021iob.205.1566912885333;
 Tue, 27 Aug 2019 06:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com> <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com> <20190827132419.wgcn36557zlwjmah@pali>
In-Reply-To: <20190827132419.wgcn36557zlwjmah@pali>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 27 Aug 2019 08:34:33 -0500
Message-ID: <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
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

On Tue, Aug 27, 2019 at 8:24 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
>
> On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> > On Tue, Aug 27, 2019 at 3:12 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> =
wrote:
> > >
> > > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > > Hi,
> > > > >
> > > > > I was looking at N900 boot logs from the current mainline (v5.3-r=
c),
> > > > > and noticed this:
> > > > >
> > > > > [    3.297668] omap3_rom_rng: initializing
> > > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with =
error -2
> > > > >
> > > > > It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti:=
 omap3:
> > > > > cleanup unnecessary clock aliases"), including one for omap3-rom-=
rng.
> > > > > How this driver is supposed to work now? I guess it has been brok=
en for
> > > > > a while. :-(
> > > >
> > > > You should have a DT node for the device, which contains the clock =
handle.
> >
> > I am interested in enabling the RNG too, because sshd takes a long
> > time to initialize without the hwrng.
> >
> > I am not able to find addresses in either the DM3730 TRM nor the
> > OMAP3530 TRM.  Can someone from TI make a recommendation as to what
> > the node address should be?  Having this would be a nice starting
> > point.  Also looking at the other omap RNG nodes there are references
> > to hwmods, but looking at the platdata in pdata quirks, I am not
> > seeing anything.
> >
> > There is also chunks of code that exist insdie
> > arch/mach-omap2/omap-secure.c which appear to only be referenced from
> > this driver, so I wonder if there might be some way to
> > combine/condense this once it's been converted to device tree and
> > functional again.
>
> This part of code calls N900's PPA function via SMC instruction, which
> is provided by closed Nokia bootloader NOLO/X-Loader. So it is needed.

I am arguing that there is open source code for OMAP2 and OMAP4 RNG, I
don't understand why we can't have support for everyone.  The TRM
references the RNG, but it doesn't give much info.  There are other
RNG's supported in the open source so I would think if the IP is
present in the chips, we should be able to use it without a custom
bootloader.

adam

>
> > adam
> > >
> > > Hello, I have not tested new kernel on N900 for a longer time. And at
> > > that time (4.9) it worked fine. So it is just missing DT node? Maybe =
you
> > > could fix it when you testing it?
> > >
> > > --
> > > Pali Roh=C3=A1r
> > > pali.rohar@gmail.com
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
