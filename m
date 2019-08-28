Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 453A1A00EA
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 13:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfH1LqT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 07:46:19 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36542 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1LqT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 07:46:19 -0400
Received: by mail-ed1-f67.google.com with SMTP id g24so2678003edu.3
        for <linux-omap@vger.kernel.org>; Wed, 28 Aug 2019 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DE7SOubbo9GYpjNJO+7yuxwoQPWxKuy3j8+3U2ui4SU=;
        b=cn/eiZMHgtDKM1c0JufHe20fYGx1pMnB1QLehVvNRHC0cspr/1/fKRMiuz5knWxAwh
         q596Sfsr+j9j2Ka54IskKZlnmnqJHyCyZN3XReS7MYwukUh92Ze5KvXH2pozLVjd7mDi
         DKzCVswVw3t1QBS9CC6Zg21Uxgn8tCVQaDWOQiyp0dFpk048+U6X8RZ1YL3IF9mOMbhB
         bXms9h5e7juk5J0gSBffyI862bHUjiVW0kFfXlwBe0SeyQvpkPkvx7vp/6+UWbMzZqqB
         swbHBipzTkkhOZx4jpqMrQW0LiEwaixijvYCuKBXoHYCdb0ahJV7W7kHY9SCFLImN4zo
         eiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DE7SOubbo9GYpjNJO+7yuxwoQPWxKuy3j8+3U2ui4SU=;
        b=dPs6yJeiH3P9WdhVE1xvN1oHSdDOumf9kl5IB+Q3ERn5IciVfNk+vsQTRxW+0W5dD+
         ascLl5243IAfAwSFV6rlsSIQBKoGHSm8TL1YZ+E6c8JunYc7vOLFp4HtksMhXC4YNSH+
         hmO0uKw9uhibbhxnvJhe4D0YplpoWapH/dRrm3TidZQAEcnlZuVryQRKeJO662G7fYZt
         7jVj+Rgjihaz6cgaD1ApZSvVfEAJ2zcxAHt+JF4kuLxL94k7+aBwf1N5Np1eZHT1/b4S
         5vWaQ0wZBO+lyDRpRLqzFdKhNE8rIPPIMZHFU3Fo2UCH4VVM4EGhSTpPM1fOHiZMWFHl
         8DIg==
X-Gm-Message-State: APjAAAWASi5rK6TkH0H9M+y9LxWYlr2zR6FTg5UtdWdOF/rWFlqdcVIh
        7HRRPK4UeGZPxAQDtHkKocnzmGnLfgYbt5bABVs=
X-Google-Smtp-Source: APXvYqxIZzLIaab8sgj62+7cz9oQan/E/XW62aUBlfKecR8xcRsDHvA4aBSi61xwiFpwlqvZBoWzBRV/qVeB8+br0MA=
X-Received: by 2002:a50:88c5:: with SMTP id d63mr3498701edd.122.1566992776691;
 Wed, 28 Aug 2019 04:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <7d195797-085e-3bcc-933e-dca71dc12364@ti.com> <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
 <20190827132419.wgcn36557zlwjmah@pali> <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
 <20190827134905.5mc5b3rxpmojp3ay@pali> <CAHCN7x+te3JWGNr440fLsU0fVnaLJY9_cdG_Keo8rPCzXNuODg@mail.gmail.com>
 <1f59d161-cb02-8aa4-269c-0ce3a26707fe@ti.com> <20190827174558.3npn4lposibgwmvc@pali>
 <CAHCN7x+wWHy=YH2Zk3mkuJXTp3RnPebEK3dXkOTLN+eYnV=X=A@mail.gmail.com> <20190827191014.hj6rlu3l4qawx2kj@pali>
In-Reply-To: <20190827191014.hj6rlu3l4qawx2kj@pali>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 28 Aug 2019 06:46:06 -0500
Message-ID: <CAHCN7xKE2wU9Uem2BcrP8evzgzrpP3UPw-EvQyzq0Yh1nGoRSw@mail.gmail.com>
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

On Tue, Aug 27, 2019 at 2:10 PM Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
>
> On Tuesday 27 August 2019 13:10:38 Adam Ford wrote:
> > On Tue, Aug 27, 2019 at 12:46 PM Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> > >
> > > On Tuesday 27 August 2019 20:42:35 Tero Kristo wrote:
> > > > On 27/08/2019 16:54, Adam Ford wrote:
> > > > > On Tue, Aug 27, 2019 at 8:49 AM Pali Roh=C3=A1r <pali.rohar@gmail=
.com> wrote:
> > > > > >
> > > > > > On Tuesday 27 August 2019 08:34:33 Adam Ford wrote:
> > > > > > > On Tue, Aug 27, 2019 at 8:24 AM Pali Roh=C3=A1r <pali.rohar@g=
mail.com> wrote:
> > > > > > > >
> > > > > > > > On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> > > > > > > > > On Tue, Aug 27, 2019 at 3:12 AM Pali Roh=C3=A1r <pali.roh=
ar@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > > > > > > > > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >
> > > > > > > > > > > > I was looking at N900 boot logs from the current ma=
inline (v5.3-rc),
> > > > > > > > > > > > and noticed this:
> > > > > > > > > > > >
> > > > > > > > > > > > [    3.297668] omap3_rom_rng: initializing
> > > > > > > > > > > > [    3.301940] omap3_rom_rng: unable to get RNG clo=
ck
> > > > > > > > > > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rn=
g failed with error -2
> > > > > > > > > > > >
> > > > > > > > > > > > It seems some clock data was deleted with 0ed266d7a=
e5e ("clk: ti: omap3:
> > > > > > > > > > > > cleanup unnecessary clock aliases"), including one =
for omap3-rom-rng.
> > > > > > > > > > > > How this driver is supposed to work now? I guess it=
 has been broken for
> > > > > > > > > > > > a while. :-(
> > > > > > > > > > >
> > > > > > > > > > > You should have a DT node for the device, which conta=
ins the clock handle.
> > > > > > > > >
> > > > > > > > > I am interested in enabling the RNG too, because sshd tak=
es a long
> > > > > > > > > time to initialize without the hwrng.
> > > > > > > > >
> > > > > > > > > I am not able to find addresses in either the DM3730 TRM =
nor the
> > > > > > > > > OMAP3530 TRM.  Can someone from TI make a recommendation =
as to what
> > > > > > > > > the node address should be?  Having this would be a nice =
starting
> > > > > > > > > point.  Also looking at the other omap RNG nodes there ar=
e references
> > > > > > > > > to hwmods, but looking at the platdata in pdata quirks, I=
 am not
> > > > > > > > > seeing anything.
> > > > > > > > >
> > > > > > > > > There is also chunks of code that exist insdie
> > > > > > > > > arch/mach-omap2/omap-secure.c which appear to only be ref=
erenced from
> > > > > > > > > this driver, so I wonder if there might be some way to
> > > > > > > > > combine/condense this once it's been converted to device =
tree and
> > > > > > > > > functional again.
> > > > > > > >
> > > > > > > > This part of code calls N900's PPA function via SMC instruc=
tion, which
> > > > > > > > is provided by closed Nokia bootloader NOLO/X-Loader. So it=
 is needed.
> > > > > > >
> > > > > > > I am arguing that there is open source code for OMAP2 and OMA=
P4 RNG, I
> > > > > > > don't understand why we can't have support for everyone.  The=
 TRM
> > > > > > > references the RNG, but it doesn't give much info.  There are=
 other
> > > > > > > RNG's supported in the open source so I would think if the IP=
 is
> > > > > > > present in the chips, we should be able to use it without a c=
ustom
> > > > > > > bootloader.
> > > > > >
> > > > > > I do not know about general solution for OMAP3.
> > > > > >
> > > > > > But Nokia N900 is HS device, has signed and closed bootloader (=
Nokia
> > > > > > X-Loader) which is running in secure mode and it does not enabl=
e L3
> > > > > > firewall (or how it is called in OMAP world) for accessing RNG =
blocks
> > > > > > outside of secure mode. It just export PPA function which "othe=
r side"
> > > > > > can use to get access to RNG.
> > > > > >
> > > > > > Accessing blocks which are not allowed by that firewall cause i=
mmediate
> > > > > > reset of board. So kernel must avoid such things.
> > > > > >
> > > > > > So for OMAP3 HS devices, like N900, we need signed bootloader w=
hich
> > > > > > either enable direct access to RNG (which we do not have) or bo=
otloader
> > > > > > which provide custom PPA call for RNG (which we have).
> > > > > >
> > > > > > Exactly same problem is with AES acceleration on N900. See for =
details:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D69540a7c277d96382257216436f41abc040cc878
> > > > >
> > > > > I have an OMAP3 and I am able to access the AES and SHA accelerat=
ion
> > > > > using the cryptodev instructions following:
> > > > > http://processors.wiki.ti.com/index.php/AM335x_Crypto_Performance
> > > > >
> > > > > I am able to load the SHA and AES modules without signed bootload=
ers.
> > > > >
> > > > > >
> > > > > > Later I played a bit with that L3 firewall and reading its conf=
iguration
> > > > > > is also disabled. After trying to read it 3 or 4 times from use=
rspace I
> > > > > > got immediate reset of board. I was told that this is normal (f=
irewall
> > > > > > violation) and reset is there for security reasons.
> > > > >
> > > > > If you're using secure world, I would expect this behaviour, but =
I am
> > > > > just not seeing why access to the HWRNG would be limited to secur=
e
> > > > > world when I can use HWRNG for other processors families without =
it.
> > > > >
> > > > > >
> > > > > > Public GP TRM does not provide information because RNG is part =
of crypto
> > > > > > IP and it is for HS devices. And IIRC TRM for HS devices is (or=
 was)
> > > > > > available only under NDA and only for licensed customers.
> > > > >
> > > > > I agree, yet the omap2 and omap4 rng have open source code. I won=
der
> > > > > how different the omap3 version is from the omap2.
> > > > >
> > > > > >
> > > > > > Somebody from TI should really provide up-to-date information a=
bout this
> > > > > > topic. All those information are from time when I played with A=
ES which
> > > > > > is from year 2014.
> > > > >
> > > > > I could not agree more.
> > > >
> > > > Delving on the topic of NDA chip features is dangerous area for TI =
people...
> > > > as we might be violating NDA ourselves and get into trouble for it.
> > >
> > > Is really GP TRM under NDA? I was thought that only HS documentation =
is
> > > under NDA.
> >
> > I was able to download the am3517 TRM:
> > http://www.ti.com/lit/ug/sprugr0c/sprugr0c.pdf
> >
> > >
> > > > I would prefer someone outside TI reverse engineers the support som=
ehow
> > > > against omap2/omap4, and sees what works out. AM35x public TRM migh=
t have
> > > > some info on it, that chip is basically a copy of omap3.
> >
> > I am going under the assumption that the omap-rng driver that supports
> > omap2 and omap4 could be modified to support the omap3 based on the
> > fact that the AES and SHA drivers work on omap2, omap3, and omap4.  If
> > we can do that, I would think we could deprecate the existing omap3
> > version which requires platdata and pdata-quirks.
>
> We cannot deprecate it for HS devices where direct access to RNG is not
> allowed by firewall, like for N900.

I was only proposing deprecating it if the stock omap2-rng driver
worked for your application.
>
> > I have the AM35 doc, but the AM35 doc shows the IP address blocks for
> > RNG, AES and SHA match the omap2 and not omap3, so I assume that the
> > RNG will probably be different as well.  I checked the IRQ mapping for
> > AES and SHA, and RNG  on the AM3517 IRQ also matches the OMAP2 (not
> > OMAP3), so I also assume the IRQ won't match OMAP3 either.

When I originally looked, the addresses of the various IP blocks like
AES and SHA were different between omap2.dtsi and omap3.dtsi, but it
turns out they're pointing to different instances.  From the AM3517
TRM, AES1 exists where omap2.dtsi lists it, and AES2 exists where
omap3.dtsi places it.  The same can be said for SHA, so I am not under
the assumption that the RNG is going to follow suite.  Based on this,
I tried to port over the hwmods from omap2 to omap3 and copied the
device tree entry from omap2.dtsi to omap3.dtsi.

According to the AM3517 TRM, the RNG is part of the L4 domain, and
CORE_RST rests it along with a variety of other devices like HS USB,
SPI, GPTimers, etc. so that seems straight forward.  What is lesser
known to me is the SECRUITY_L4_ICLK2 which appears to connect to AES1,
RNG, SHA1 and DES1 but not AES2 or SHA2, which may explain why the
omap3's can use AES2 and SHA2 without security.  The device tree shows
a reference to the various security clocks in
omap34xx-omap36xx-clocks.dtsi, but when I port the HW mods from omap2
to omap3 for the RNG, it hangs when I add the a reference to
omap3xxx_l4_core_rng to the hwmod_ocp_ifs table.  Since it doesn't
crash, but it hangs, this leads me to wonder if the rng_ick or the
security_l4_ick2 are not running. yet.

adam
> >
> > Looking at the omap-rng driver (not the omap3 version), it appears as
> > if the omap2 version doesn't appear to use an ISR, so the actual
> > interrupt may be less important.  If I was to guess what the address
> > would be, I would guess the address for omap3 to be 480c1000, and I am
> > also guessing the omap2/omap4 driver would work once the device tree
> > is addressed, but it's just a guess based on the addresses of AES and
> > SHA.
> >
> > Using the 4.19 kernel, I wasn't able to get it working due to missing
> > hwmods for omap3, but I am hoping with hwmods going away, we might be
> > able to address this easier in the future.
> >
> > omap34xx-omap36xx-clocks.dtsi shows rng_ick, but I am not sure if it's
> > fully functional.  If it is, I would assume that it would.
>
> Thanks for quick investigation. I was hoping that somebody from TI could
> bring some light and help with these details...
>
> > adam
> > > >
> > > > -Tero
> > > >
> > > > >
> > > > > adam
> > > > > >
> > > > > > > adam
> > > > > > >
> > > > > > > >
> > > > > > > > > adam
> > > > > > > > > >
> > > > > > > > > > Hello, I have not tested new kernel on N900 for a longe=
r time. And at
> > > > > > > > > > that time (4.9) it worked fine. So it is just missing D=
T node? Maybe you
> > > > > > > > > > could fix it when you testing it?
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Pali Roh=C3=A1r
> > > > > > > > > > pali.rohar@gmail.com
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
> > > > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-t=
unnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> > >
> > > --
> > > Pali Roh=C3=A1r
> > > pali.rohar@gmail.com
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
