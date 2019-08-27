Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 372849F1D1
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 19:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfH0RqD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 13:46:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34929 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727683AbfH0RqD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 13:46:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id k2so19702055wrq.2
        for <linux-omap@vger.kernel.org>; Tue, 27 Aug 2019 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9AZ3Bg/TSasLOT6oeq+ugGNf+Xgc8ichXcpPRlfB0KI=;
        b=qGjLOoz3nxmwNcBwntnkiWn5u+xZzloPFZtURCbRmYuY/6HHiyy9Mq5LAUQpC8KXfw
         WXam3PMqbJXGRLotMUYIdY/1iDwOb2jjw4I/7jno2hbF50SC3VgabuYAcAE5mpkdG5zH
         Wm7b0f9pjgiOy7sWJA60XPGAH4619AnLcLT7aLHfkNhEokHTwEPN/3w4LhNTnjDNiRZk
         X3xPySPmQpCigft4KJyB5d0w3xSVxMTVaHoEmbB/fCvQ3SqtdOnFGFnRiZ9l3QVeEcVu
         VI51rHa8/9kCAmednz4M257nwiQkfQ0r5N4u0vv/EnGsT9Rr9ZI3HnDE4QPg1Dy5pVAj
         Jglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9AZ3Bg/TSasLOT6oeq+ugGNf+Xgc8ichXcpPRlfB0KI=;
        b=YjmD5L1Qa1FE/pQgkxyUH4JShAIcO96sT0I9Oy5ygmkbxiI1rTRpJsbj0Ej7CHekYy
         ge5tPdstnm2Vb2ucMo3M1GjkNiY4pCBSX+w+2bli+72dT3H8xpaqjoYMfQIoUUwbXeJb
         DesBcT5EofE+Kw/TnjpGyakmD8oDlqsR/EZaBqcTlrbVVHcYgSDSApHWfebSxYn2LIod
         3j4KWE8s/RhcNmOoKixiQ6qa7yBCNOZGvpQZSRl8P192Wph4ANBBnyFUEkCap2dP1UwQ
         5fjVu+w/eLd8fR+IRlBGuOhe7iuXsV/sDchfTXnFx3nKOWSEUg7zOHqSFKzPEiSfzHPn
         KNQQ==
X-Gm-Message-State: APjAAAUeaD/IkESVoVs6/T0LqJE0lLz3BDyVNnSWmhV1a1kbrm8/L7MX
        8wInSbPaRVmRcokfuzT+VMU=
X-Google-Smtp-Source: APXvYqwlhN3Y+9u2R476dY+E+CBxn0h//fMz2l53tV4LhOLOL2EPvSQS16tyoAD8TOj+mELaegqhIg==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr29796139wru.27.1566927959904;
        Tue, 27 Aug 2019 10:45:59 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z2sm60309wmi.2.2019.08.27.10.45.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 10:45:59 -0700 (PDT)
Date:   Tue, 27 Aug 2019 19:45:58 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190827174558.3npn4lposibgwmvc@pali>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
 <20190827132419.wgcn36557zlwjmah@pali>
 <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
 <20190827134905.5mc5b3rxpmojp3ay@pali>
 <CAHCN7x+te3JWGNr440fLsU0fVnaLJY9_cdG_Keo8rPCzXNuODg@mail.gmail.com>
 <1f59d161-cb02-8aa4-269c-0ce3a26707fe@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="o3cgn6amdeqsxj57"
Content-Disposition: inline
In-Reply-To: <1f59d161-cb02-8aa4-269c-0ce3a26707fe@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--o3cgn6amdeqsxj57
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday 27 August 2019 20:42:35 Tero Kristo wrote:
> On 27/08/2019 16:54, Adam Ford wrote:
> > On Tue, Aug 27, 2019 at 8:49 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> =
wrote:
> > >=20
> > > On Tuesday 27 August 2019 08:34:33 Adam Ford wrote:
> > > > On Tue, Aug 27, 2019 at 8:24 AM Pali Roh=C3=A1r <pali.rohar@gmail.c=
om> wrote:
> > > > >=20
> > > > > On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
> > > > > > On Tue, Aug 27, 2019 at 3:12 AM Pali Roh=C3=A1r <pali.rohar@gma=
il.com> wrote:
> > > > > > >=20
> > > > > > > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > > > > > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > I was looking at N900 boot logs from the current mainline=
 (v5.3-rc),
> > > > > > > > > and noticed this:
> > > > > > > > >=20
> > > > > > > > > [    3.297668] omap3_rom_rng: initializing
> > > > > > > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > > > > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng fail=
ed with error -2
> > > > > > > > >=20
> > > > > > > > > It seems some clock data was deleted with 0ed266d7ae5e ("=
clk: ti: omap3:
> > > > > > > > > cleanup unnecessary clock aliases"), including one for om=
ap3-rom-rng.
> > > > > > > > > How this driver is supposed to work now? I guess it has b=
een broken for
> > > > > > > > > a while. :-(
> > > > > > > >=20
> > > > > > > > You should have a DT node for the device, which contains th=
e clock handle.
> > > > > >=20
> > > > > > I am interested in enabling the RNG too, because sshd takes a l=
ong
> > > > > > time to initialize without the hwrng.
> > > > > >=20
> > > > > > I am not able to find addresses in either the DM3730 TRM nor the
> > > > > > OMAP3530 TRM.  Can someone from TI make a recommendation as to =
what
> > > > > > the node address should be?  Having this would be a nice starti=
ng
> > > > > > point.  Also looking at the other omap RNG nodes there are refe=
rences
> > > > > > to hwmods, but looking at the platdata in pdata quirks, I am not
> > > > > > seeing anything.
> > > > > >=20
> > > > > > There is also chunks of code that exist insdie
> > > > > > arch/mach-omap2/omap-secure.c which appear to only be reference=
d from
> > > > > > this driver, so I wonder if there might be some way to
> > > > > > combine/condense this once it's been converted to device tree a=
nd
> > > > > > functional again.
> > > > >=20
> > > > > This part of code calls N900's PPA function via SMC instruction, =
which
> > > > > is provided by closed Nokia bootloader NOLO/X-Loader. So it is ne=
eded.
> > > >=20
> > > > I am arguing that there is open source code for OMAP2 and OMAP4 RNG=
, I
> > > > don't understand why we can't have support for everyone.  The TRM
> > > > references the RNG, but it doesn't give much info.  There are other
> > > > RNG's supported in the open source so I would think if the IP is
> > > > present in the chips, we should be able to use it without a custom
> > > > bootloader.
> > >=20
> > > I do not know about general solution for OMAP3.
> > >=20
> > > But Nokia N900 is HS device, has signed and closed bootloader (Nokia
> > > X-Loader) which is running in secure mode and it does not enable L3
> > > firewall (or how it is called in OMAP world) for accessing RNG blocks
> > > outside of secure mode. It just export PPA function which "other side"
> > > can use to get access to RNG.
> > >=20
> > > Accessing blocks which are not allowed by that firewall cause immedia=
te
> > > reset of board. So kernel must avoid such things.
> > >=20
> > > So for OMAP3 HS devices, like N900, we need signed bootloader which
> > > either enable direct access to RNG (which we do not have) or bootload=
er
> > > which provide custom PPA call for RNG (which we have).
> > >=20
> > > Exactly same problem is with AES acceleration on N900. See for detail=
s:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D69540a7c277d96382257216436f41abc040cc878
> >=20
> > I have an OMAP3 and I am able to access the AES and SHA acceleration
> > using the cryptodev instructions following:
> > http://processors.wiki.ti.com/index.php/AM335x_Crypto_Performance
> >=20
> > I am able to load the SHA and AES modules without signed bootloaders.
> >=20
> > >=20
> > > Later I played a bit with that L3 firewall and reading its configurat=
ion
> > > is also disabled. After trying to read it 3 or 4 times from userspace=
 I
> > > got immediate reset of board. I was told that this is normal (firewall
> > > violation) and reset is there for security reasons.
> >=20
> > If you're using secure world, I would expect this behaviour, but I am
> > just not seeing why access to the HWRNG would be limited to secure
> > world when I can use HWRNG for other processors families without it.
> >=20
> > >=20
> > > Public GP TRM does not provide information because RNG is part of cry=
pto
> > > IP and it is for HS devices. And IIRC TRM for HS devices is (or was)
> > > available only under NDA and only for licensed customers.
> >=20
> > I agree, yet the omap2 and omap4 rng have open source code. I wonder
> > how different the omap3 version is from the omap2.
> >=20
> > >=20
> > > Somebody from TI should really provide up-to-date information about t=
his
> > > topic. All those information are from time when I played with AES whi=
ch
> > > is from year 2014.
> >=20
> > I could not agree more.
>=20
> Delving on the topic of NDA chip features is dangerous area for TI people=
=2E..
> as we might be violating NDA ourselves and get into trouble for it.

Is really GP TRM under NDA? I was thought that only HS documentation is
under NDA.

> I would prefer someone outside TI reverse engineers the support somehow
> against omap2/omap4, and sees what works out. AM35x public TRM might have
> some info on it, that chip is basically a copy of omap3.
>=20
> -Tero
>=20
> >=20
> > adam
> > >=20
> > > > adam
> > > >=20
> > > > >=20
> > > > > > adam
> > > > > > >=20
> > > > > > > Hello, I have not tested new kernel on N900 for a longer time=
=2E And at
> > > > > > > that time (4.9) it worked fine. So it is just missing DT node=
? Maybe you
> > > > > > > could fix it when you testing it?
> > > > > > >=20
> > > > > > > --
> > > > > > > Pali Roh=C3=A1r
> > > > > > > pali.rohar@gmail.com
> > > > >=20
> > > > > --
> > > > > Pali Roh=C3=A1r
> > > > > pali.rohar@gmail.com
> > >=20
> > > --
> > > Pali Roh=C3=A1r
> > > pali.rohar@gmail.com
>=20
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/=
Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--o3cgn6amdeqsxj57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXWVsUQAKCRCL8Mk9A+RD
UlTlAJ0X2C1A/PfMIbIlBN7A6blU6LrBWgCfWZXMniQkX+HE8goYTsEhvSZemho=
=CkFQ
-----END PGP SIGNATURE-----

--o3cgn6amdeqsxj57--
