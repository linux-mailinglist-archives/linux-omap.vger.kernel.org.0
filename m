Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC259F214
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 20:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbfH0SKw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 14:10:52 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41041 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727683AbfH0SKw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 14:10:52 -0400
Received: by mail-ed1-f68.google.com with SMTP id w5so32488201edl.8
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jyQDgMMHAFqp4jY5ru4ZijR8X5TR8wTmlZAOEg4OEPE=;
        b=ZCy8V9CYaA2nlp3GaXg/4d4zdcsR8mDCaustuBqxG8Db3hD/3+EAsG7Bw89IScPSBA
         Y/e6s1kOA98uFM0uRCK8MV9y3TKjErR6HKsXyYAOi3nb5eFDn3u/R64S/SbX0t8demYl
         D1tJuzmIG6OBaptdHPaA5C0aEG1q1RMJfgghcEcCrOzu2gRdQrTuP8RKNHKJ3SYkFKsi
         muB02SaBEWKdjzE2rFhmUqFEm3hEUe5dokON9gQgmMQv8dxyDgEigP8QXbVF3tpbWmE6
         wNdmCWRS+t32RxqZ3WQhtoecnrqhI6bPa0dup0WoOXRStsODgRrtIKkj1yhkksqy/I9U
         rMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jyQDgMMHAFqp4jY5ru4ZijR8X5TR8wTmlZAOEg4OEPE=;
        b=fqEMg/OsHNkjdAufl+jSjc4SvRIIY8vurHs2dVFW7O/wn5QdCSwaiacxNglsRvnyYX
         DF+eKGvDGwpOyN6luUWy52SQHX0oWNIOGV69HZynbx1wtFJctZgXXcNt7Gk066DNO+HP
         gHuDmDdn8tZZA/bwNuSt1LO/0UW32LBaRR5Yq8sFbLlJn1h3sBqWNcKpREaARLoyK895
         uk1jbdpSgEXeoWQTwlAe10vFu2h25DF7kciWyigQiICQMsFCzHvlPf6XGBXjKjx2ZdHs
         wlG48qRcSVJlBnZdJRMGbqVI2W8+XVmzYWjKRzV60z36PXGpXeKVLxEhJFOL/WpXx5YY
         f7/g==
X-Gm-Message-State: APjAAAXVYkjCoM5Q6CDNORnIxXEe2c6nRJn3fs6LIpYAiKtYegtjccDW
        yvQEIN/797b0afPFs77a7hMIoIbkB2MZ8LLCvMw=
X-Google-Smtp-Source: APXvYqwSwqO9/vCAVonFT4NlZDfyAGiJN51rz3l7mL2pkyrR+IXoOMlHWMaB6arUNNKnIaJQBPxDpXuipZ00UJ3rnsk=
X-Received: by 2002:a50:9401:: with SMTP id p1mr25327137eda.189.1566929449429;
 Tue, 27 Aug 2019 11:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com> <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
 <20190827132419.wgcn36557zlwjmah@pali> <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
 <20190827134905.5mc5b3rxpmojp3ay@pali> <CAHCN7x+te3JWGNr440fLsU0fVnaLJY9_cdG_Keo8rPCzXNuODg@mail.gmail.com>
 <1f59d161-cb02-8aa4-269c-0ce3a26707fe@ti.com> <20190827174558.3npn4lposibgwmvc@pali>
In-Reply-To: <20190827174558.3npn4lposibgwmvc@pali>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 27 Aug 2019 13:10:38 -0500
Message-ID: <CAHCN7x+wWHy=YH2Zk3mkuJXTp3RnPebEK3dXkOTLN+eYnV=X=A@mail.gmail.com>
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

On Tue, Aug 27, 2019 at 12:46 PM Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
>
> On Tuesday 27 August 2019 20:42:35 Tero Kristo wrote:
> > On 27/08/2019 16:54, Adam Ford wrote:
> > > On Tue, Aug 27, 2019 at 8:49 AM Pali Roh=C3=A1r <pali.rohar@gmail.com=
> wrote:
> > > >
> > > > On Tuesday 27 August 2019 08:34:33 Adam Ford wrote:
> > > > > On Tue, Aug 27, 2019 at 8:24 AM Pali Roh=C3=A1r <pali.rohar@gmail=
.com> wrote:
> > > > > >
> > > > > > On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> > > > > > > On Tue, Aug 27, 2019 at 3:12 AM Pali Roh=C3=A1r <pali.rohar@g=
mail.com> wrote:
> > > > > > > >
> > > > > > > > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > > > > > > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > > > > > > > Hi,
> > > > > > > > > >
> > > > > > > > > > I was looking at N900 boot logs from the current mainli=
ne (v5.3-rc),
> > > > > > > > > > and noticed this:
> > > > > > > > > >
> > > > > > > > > > [    3.297668] omap3_rom_rng: initializing
> > > > > > > > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > > > > > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng fa=
iled with error -2
> > > > > > > > > >
> > > > > > > > > > It seems some clock data was deleted with 0ed266d7ae5e =
("clk: ti: omap3:
> > > > > > > > > > cleanup unnecessary clock aliases"), including one for =
omap3-rom-rng.
> > > > > > > > > > How this driver is supposed to work now? I guess it has=
 been broken for
> > > > > > > > > > a while. :-(
> > > > > > > > >
> > > > > > > > > You should have a DT node for the device, which contains =
the clock handle.
> > > > > > >
> > > > > > > I am interested in enabling the RNG too, because sshd takes a=
 long
> > > > > > > time to initialize without the hwrng.
> > > > > > >
> > > > > > > I am not able to find addresses in either the DM3730 TRM nor =
the
> > > > > > > OMAP3530 TRM.  Can someone from TI make a recommendation as t=
o what
> > > > > > > the node address should be?  Having this would be a nice star=
ting
> > > > > > > point.  Also looking at the other omap RNG nodes there are re=
ferences
> > > > > > > to hwmods, but looking at the platdata in pdata quirks, I am =
not
> > > > > > > seeing anything.
> > > > > > >
> > > > > > > There is also chunks of code that exist insdie
> > > > > > > arch/mach-omap2/omap-secure.c which appear to only be referen=
ced from
> > > > > > > this driver, so I wonder if there might be some way to
> > > > > > > combine/condense this once it's been converted to device tree=
 and
> > > > > > > functional again.
> > > > > >
> > > > > > This part of code calls N900's PPA function via SMC instruction=
, which
> > > > > > is provided by closed Nokia bootloader NOLO/X-Loader. So it is =
needed.
> > > > >
> > > > > I am arguing that there is open source code for OMAP2 and OMAP4 R=
NG, I
> > > > > don't understand why we can't have support for everyone.  The TRM
> > > > > references the RNG, but it doesn't give much info.  There are oth=
er
> > > > > RNG's supported in the open source so I would think if the IP is
> > > > > present in the chips, we should be able to use it without a custo=
m
> > > > > bootloader.
> > > >
> > > > I do not know about general solution for OMAP3.
> > > >
> > > > But Nokia N900 is HS device, has signed and closed bootloader (Noki=
a
> > > > X-Loader) which is running in secure mode and it does not enable L3
> > > > firewall (or how it is called in OMAP world) for accessing RNG bloc=
ks
> > > > outside of secure mode. It just export PPA function which "other si=
de"
> > > > can use to get access to RNG.
> > > >
> > > > Accessing blocks which are not allowed by that firewall cause immed=
iate
> > > > reset of board. So kernel must avoid such things.
> > > >
> > > > So for OMAP3 HS devices, like N900, we need signed bootloader which
> > > > either enable direct access to RNG (which we do not have) or bootlo=
ader
> > > > which provide custom PPA call for RNG (which we have).
> > > >
> > > > Exactly same problem is with AES acceleration on N900. See for deta=
ils:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D69540a7c277d96382257216436f41abc040cc878
> > >
> > > I have an OMAP3 and I am able to access the AES and SHA acceleration
> > > using the cryptodev instructions following:
> > > http://processors.wiki.ti.com/index.php/AM335x_Crypto_Performance
> > >
> > > I am able to load the SHA and AES modules without signed bootloaders.
> > >
> > > >
> > > > Later I played a bit with that L3 firewall and reading its configur=
ation
> > > > is also disabled. After trying to read it 3 or 4 times from userspa=
ce I
> > > > got immediate reset of board. I was told that this is normal (firew=
all
> > > > violation) and reset is there for security reasons.
> > >
> > > If you're using secure world, I would expect this behaviour, but I am
> > > just not seeing why access to the HWRNG would be limited to secure
> > > world when I can use HWRNG for other processors families without it.
> > >
> > > >
> > > > Public GP TRM does not provide information because RNG is part of c=
rypto
> > > > IP and it is for HS devices. And IIRC TRM for HS devices is (or was=
)
> > > > available only under NDA and only for licensed customers.
> > >
> > > I agree, yet the omap2 and omap4 rng have open source code. I wonder
> > > how different the omap3 version is from the omap2.
> > >
> > > >
> > > > Somebody from TI should really provide up-to-date information about=
 this
> > > > topic. All those information are from time when I played with AES w=
hich
> > > > is from year 2014.
> > >
> > > I could not agree more.
> >
> > Delving on the topic of NDA chip features is dangerous area for TI peop=
le...
> > as we might be violating NDA ourselves and get into trouble for it.
>
> Is really GP TRM under NDA? I was thought that only HS documentation is
> under NDA.

I was able to download the am3517 TRM:
http://www.ti.com/lit/ug/sprugr0c/sprugr0c.pdf

>
> > I would prefer someone outside TI reverse engineers the support somehow
> > against omap2/omap4, and sees what works out. AM35x public TRM might ha=
ve
> > some info on it, that chip is basically a copy of omap3.

I am going under the assumption that the omap-rng driver that supports
omap2 and omap4 could be modified to support the omap3 based on the
fact that the AES and SHA drivers work on omap2, omap3, and omap4.  If
we can do that, I would think we could deprecate the existing omap3
version which requires platdata and pdata-quirks.

I have the AM35 doc, but the AM35 doc shows the IP address blocks for
RNG, AES and SHA match the omap2 and not omap3, so I assume that the
RNG will probably be different as well.  I checked the IRQ mapping for
AES and SHA, and RNG  on the AM3517 IRQ also matches the OMAP2 (not
OMAP3), so I also assume the IRQ won't match OMAP3 either.

Looking at the omap-rng driver (not the omap3 version), it appears as
if the omap2 version doesn't appear to use an ISR, so the actual
interrupt may be less important.  If I was to guess what the address
would be, I would guess the address for omap3 to be 480c1000, and I am
also guessing the omap2/omap4 driver would work once the device tree
is addressed, but it's just a guess based on the addresses of AES and
SHA.

Using the 4.19 kernel, I wasn't able to get it working due to missing
hwmods for omap3, but I am hoping with hwmods going away, we might be
able to address this easier in the future.

omap34xx-omap36xx-clocks.dtsi shows rng_ick, but I am not sure if it's
fully functional.  If it is, I would assume that it would.

adam
> >
> > -Tero
> >
> > >
> > > adam
> > > >
> > > > > adam
> > > > >
> > > > > >
> > > > > > > adam
> > > > > > > >
> > > > > > > > Hello, I have not tested new kernel on N900 for a longer ti=
me. And at
> > > > > > > > that time (4.9) it worked fine. So it is just missing DT no=
de? Maybe you
> > > > > > > > could fix it when you testing it?
> > > > > > > >
> > > > > > > > --
> > > > > > > > Pali Roh=C3=A1r
> > > > > > > > pali.rohar@gmail.com
> > > > > >
> > > > > > --
> > > > > > Pali Roh=C3=A1r
> > > > > > pali.rohar@gmail.com
> > > >
> > > > --
> > > > Pali Roh=C3=A1r
> > > > pali.rohar@gmail.com
> >
> > --
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnu=
s/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
