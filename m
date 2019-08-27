Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA469F2F9
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 21:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbfH0TKU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 15:10:20 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55088 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730421AbfH0TKU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 15:10:20 -0400
Received: by mail-wm1-f68.google.com with SMTP id t6so206931wmj.4
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G8TI/bfNsu0s6+QfSVPzUaPZ98q+wRNVr9152oDlIcw=;
        b=WLmlRdMIKWX99RVP/ZWnnjqKr1tZSxacyITeflFjIX63veMYrbbWduNe3A1/2j8B5C
         vEPAcoB1yE0CARNnVkp0Hc0lDJIk6Xv7xSrZT7X57U4Khbyup3EF+y5Tnq98T2rjQ/18
         ZEwW3gjefHzu/+lJ7TvcnAJCSRdSV6TRxKXnqHM3qTfH8VUoZf/HvUUhfiZO7WBDwK1X
         0/EGqXTNR5C0Kqm0gQPwSuSw7BUUJM9gENV+bgOyCFHkhXaIklEBRGYPkJn62IMwSZzs
         msV/L2z2oIxku1nI6doTvhYmyCdN+4UtZ6JtHNDLen7UHvddQxgwJLXb4uGPavBRAlV7
         txNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G8TI/bfNsu0s6+QfSVPzUaPZ98q+wRNVr9152oDlIcw=;
        b=oU+7aqnEe1+Mf5P4CAMliijtSCrbmOUfh38/k30oqaUssTHimIzcHAimO3t5ZtYGMl
         N7sBR/U4BECEJmvz3qMrwsCyUvGWA0rcsCuCKW5GVQdzJCcAEjK1k/3GDWZPBc6uFuDA
         duSRiyMSr+OcLizqR858COjYZxrpNVubZ4dBtKIfsrnQyHRIpqD8goLU50l1UFEQCIPl
         /RXX7EkJLgoHojpmZU44Xn50Cs29+QFueMqZNWMcopxboqVLoru4HefZhHAI/5rKuqTq
         rP1/bZB0NhuQr188vTEgGaB+ZnA21MY+lhXXMmQ73xZye/3F+0PA8QG1X1VW749nXDbk
         bcbA==
X-Gm-Message-State: APjAAAVe2St5sbNZBVeL9RISR4fv8Msvt+nRKhImt39bTA2eKGvJ7b4Y
        0YsX6OZrdeZskvQO6iFHyO0=
X-Google-Smtp-Source: APXvYqw0KKymhsm7hGw1uzOrnuzKLk8XooLbT797auqT7bxe9T92AXs3ALjHDxYXKKFywnhSw6raSA==
X-Received: by 2002:a1c:9855:: with SMTP id a82mr63289wme.134.1566933016879;
        Tue, 27 Aug 2019 12:10:16 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z8sm50791wmi.7.2019.08.27.12.10.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 12:10:15 -0700 (PDT)
Date:   Tue, 27 Aug 2019 21:10:14 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190827191014.hj6rlu3l4qawx2kj@pali>
References: <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
 <20190827132419.wgcn36557zlwjmah@pali>
 <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
 <20190827134905.5mc5b3rxpmojp3ay@pali>
 <CAHCN7x+te3JWGNr440fLsU0fVnaLJY9_cdG_Keo8rPCzXNuODg@mail.gmail.com>
 <1f59d161-cb02-8aa4-269c-0ce3a26707fe@ti.com>
 <20190827174558.3npn4lposibgwmvc@pali>
 <CAHCN7x+wWHy=YH2Zk3mkuJXTp3RnPebEK3dXkOTLN+eYnV=X=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tixjy5pe5qse7qyq"
Content-Disposition: inline
In-Reply-To: <CAHCN7x+wWHy=YH2Zk3mkuJXTp3RnPebEK3dXkOTLN+eYnV=X=A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--tixjy5pe5qse7qyq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday 27 August 2019 13:10:38 Adam Ford wrote:
> On Tue, Aug 27, 2019 at 12:46 PM Pali Roh=C3=A1r <pali.rohar@gmail.com> w=
rote:
> >
> > On Tuesday 27 August 2019 20:42:35 Tero Kristo wrote:
> > > On 27/08/2019 16:54, Adam Ford wrote:
> > > > On Tue, Aug 27, 2019 at 8:49 AM Pali Roh=C3=A1r <pali.rohar@gmail.c=
om> wrote:
> > > > >
> > > > > On Tuesday 27 August 2019 08:34:33 Adam Ford wrote:
> > > > > > On Tue, Aug 27, 2019 at 8:24 AM Pali Roh=C3=A1r <pali.rohar@gma=
il.com> wrote:
> > > > > > >
> > > > > > > On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> > > > > > > > On Tue, Aug 27, 2019 at 3:12 AM Pali Roh=C3=A1r <pali.rohar=
@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > > > > > > > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > >
> > > > > > > > > > > I was looking at N900 boot logs from the current main=
line (v5.3-rc),
> > > > > > > > > > > and noticed this:
> > > > > > > > > > >
> > > > > > > > > > > [    3.297668] omap3_rom_rng: initializing
> > > > > > > > > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > > > > > > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng =
failed with error -2
> > > > > > > > > > >
> > > > > > > > > > > It seems some clock data was deleted with 0ed266d7ae5=
e ("clk: ti: omap3:
> > > > > > > > > > > cleanup unnecessary clock aliases"), including one fo=
r omap3-rom-rng.
> > > > > > > > > > > How this driver is supposed to work now? I guess it h=
as been broken for
> > > > > > > > > > > a while. :-(
> > > > > > > > > >
> > > > > > > > > > You should have a DT node for the device, which contain=
s the clock handle.
> > > > > > > >
> > > > > > > > I am interested in enabling the RNG too, because sshd takes=
 a long
> > > > > > > > time to initialize without the hwrng.
> > > > > > > >
> > > > > > > > I am not able to find addresses in either the DM3730 TRM no=
r the
> > > > > > > > OMAP3530 TRM.  Can someone from TI make a recommendation as=
 to what
> > > > > > > > the node address should be?  Having this would be a nice st=
arting
> > > > > > > > point.  Also looking at the other omap RNG nodes there are =
references
> > > > > > > > to hwmods, but looking at the platdata in pdata quirks, I a=
m not
> > > > > > > > seeing anything.
> > > > > > > >
> > > > > > > > There is also chunks of code that exist insdie
> > > > > > > > arch/mach-omap2/omap-secure.c which appear to only be refer=
enced from
> > > > > > > > this driver, so I wonder if there might be some way to
> > > > > > > > combine/condense this once it's been converted to device tr=
ee and
> > > > > > > > functional again.
> > > > > > >
> > > > > > > This part of code calls N900's PPA function via SMC instructi=
on, which
> > > > > > > is provided by closed Nokia bootloader NOLO/X-Loader. So it i=
s needed.
> > > > > >
> > > > > > I am arguing that there is open source code for OMAP2 and OMAP4=
 RNG, I
> > > > > > don't understand why we can't have support for everyone.  The T=
RM
> > > > > > references the RNG, but it doesn't give much info.  There are o=
ther
> > > > > > RNG's supported in the open source so I would think if the IP is
> > > > > > present in the chips, we should be able to use it without a cus=
tom
> > > > > > bootloader.
> > > > >
> > > > > I do not know about general solution for OMAP3.
> > > > >
> > > > > But Nokia N900 is HS device, has signed and closed bootloader (No=
kia
> > > > > X-Loader) which is running in secure mode and it does not enable =
L3
> > > > > firewall (or how it is called in OMAP world) for accessing RNG bl=
ocks
> > > > > outside of secure mode. It just export PPA function which "other =
side"
> > > > > can use to get access to RNG.
> > > > >
> > > > > Accessing blocks which are not allowed by that firewall cause imm=
ediate
> > > > > reset of board. So kernel must avoid such things.
> > > > >
> > > > > So for OMAP3 HS devices, like N900, we need signed bootloader whi=
ch
> > > > > either enable direct access to RNG (which we do not have) or boot=
loader
> > > > > which provide custom PPA call for RNG (which we have).
> > > > >
> > > > > Exactly same problem is with AES acceleration on N900. See for de=
tails:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D69540a7c277d96382257216436f41abc040cc878
> > > >
> > > > I have an OMAP3 and I am able to access the AES and SHA acceleration
> > > > using the cryptodev instructions following:
> > > > http://processors.wiki.ti.com/index.php/AM335x_Crypto_Performance
> > > >
> > > > I am able to load the SHA and AES modules without signed bootloader=
s.
> > > >
> > > > >
> > > > > Later I played a bit with that L3 firewall and reading its config=
uration
> > > > > is also disabled. After trying to read it 3 or 4 times from users=
pace I
> > > > > got immediate reset of board. I was told that this is normal (fir=
ewall
> > > > > violation) and reset is there for security reasons.
> > > >
> > > > If you're using secure world, I would expect this behaviour, but I =
am
> > > > just not seeing why access to the HWRNG would be limited to secure
> > > > world when I can use HWRNG for other processors families without it.
> > > >
> > > > >
> > > > > Public GP TRM does not provide information because RNG is part of=
 crypto
> > > > > IP and it is for HS devices. And IIRC TRM for HS devices is (or w=
as)
> > > > > available only under NDA and only for licensed customers.
> > > >
> > > > I agree, yet the omap2 and omap4 rng have open source code. I wonder
> > > > how different the omap3 version is from the omap2.
> > > >
> > > > >
> > > > > Somebody from TI should really provide up-to-date information abo=
ut this
> > > > > topic. All those information are from time when I played with AES=
 which
> > > > > is from year 2014.
> > > >
> > > > I could not agree more.
> > >
> > > Delving on the topic of NDA chip features is dangerous area for TI pe=
ople...
> > > as we might be violating NDA ourselves and get into trouble for it.
> >
> > Is really GP TRM under NDA? I was thought that only HS documentation is
> > under NDA.
>=20
> I was able to download the am3517 TRM:
> http://www.ti.com/lit/ug/sprugr0c/sprugr0c.pdf
>=20
> >
> > > I would prefer someone outside TI reverse engineers the support someh=
ow
> > > against omap2/omap4, and sees what works out. AM35x public TRM might =
have
> > > some info on it, that chip is basically a copy of omap3.
>=20
> I am going under the assumption that the omap-rng driver that supports
> omap2 and omap4 could be modified to support the omap3 based on the
> fact that the AES and SHA drivers work on omap2, omap3, and omap4.  If
> we can do that, I would think we could deprecate the existing omap3
> version which requires platdata and pdata-quirks.

We cannot deprecate it for HS devices where direct access to RNG is not
allowed by firewall, like for N900.

> I have the AM35 doc, but the AM35 doc shows the IP address blocks for
> RNG, AES and SHA match the omap2 and not omap3, so I assume that the
> RNG will probably be different as well.  I checked the IRQ mapping for
> AES and SHA, and RNG  on the AM3517 IRQ also matches the OMAP2 (not
> OMAP3), so I also assume the IRQ won't match OMAP3 either.
>=20
> Looking at the omap-rng driver (not the omap3 version), it appears as
> if the omap2 version doesn't appear to use an ISR, so the actual
> interrupt may be less important.  If I was to guess what the address
> would be, I would guess the address for omap3 to be 480c1000, and I am
> also guessing the omap2/omap4 driver would work once the device tree
> is addressed, but it's just a guess based on the addresses of AES and
> SHA.
>=20
> Using the 4.19 kernel, I wasn't able to get it working due to missing
> hwmods for omap3, but I am hoping with hwmods going away, we might be
> able to address this easier in the future.
>=20
> omap34xx-omap36xx-clocks.dtsi shows rng_ick, but I am not sure if it's
> fully functional.  If it is, I would assume that it would.

Thanks for quick investigation. I was hoping that somebody from TI could
bring some light and help with these details...

> adam
> > >
> > > -Tero
> > >
> > > >
> > > > adam
> > > > >
> > > > > > adam
> > > > > >
> > > > > > >
> > > > > > > > adam
> > > > > > > > >
> > > > > > > > > Hello, I have not tested new kernel on N900 for a longer =
time. And at
> > > > > > > > > that time (4.9) it worked fine. So it is just missing DT =
node? Maybe you
> > > > > > > > > could fix it when you testing it?
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Pali Roh=C3=A1r
> > > > > > > > > pali.rohar@gmail.com
> > > > > > >
> > > > > > > --
> > > > > > > Pali Roh=C3=A1r
> > > > > > > pali.rohar@gmail.com
> > > > >
> > > > > --
> > > > > Pali Roh=C3=A1r
> > > > > pali.rohar@gmail.com
> > >
> > > --
> > > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tun=
nus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> >
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--tixjy5pe5qse7qyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXWWAFQAKCRCL8Mk9A+RD
Uoj6AJ9E2RCByqiLV2/DcDlPaXQUxOrDfACeN6Pm1Zt4zsvQ6330seUKJb9Jmm4=
=fAgs
-----END PGP SIGNATURE-----

--tixjy5pe5qse7qyq--
