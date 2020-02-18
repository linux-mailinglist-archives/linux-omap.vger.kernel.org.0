Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCA6162AC0
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 17:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgBRQfT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 11:35:19 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54338 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgBRQfT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 11:35:19 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id EAEAB26CF76
Received: by earth.universe (Postfix, from userid 1000)
        id 823A53C0C81; Tue, 18 Feb 2020 17:35:15 +0100 (CET)
Date:   Tue, 18 Feb 2020 17:35:15 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200218163515.rxdvv5ponu2ndwn7@earth.universe>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
 <20200214013454.GX64767@atomide.com>
 <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
 <20200214170946.GB64767@atomide.com>
 <20200218140431.emrxgvckrpltmg2s@earth.universe>
 <20200218141905.GG35972@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="njnztwvky5sdzicr"
Content-Disposition: inline
In-Reply-To: <20200218141905.GG35972@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--njnztwvky5sdzicr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 18, 2020 at 06:19:05AM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sebastian.reichel@collabora.com> [200218 06:05]:
> > On Fri, Feb 14, 2020 at 09:09:46AM -0800, Tony Lindgren wrote:
> > > * Sebastian Reichel <sre@kernel.org> [200214 13:05]:
> > > > On Thu, Feb 13, 2020 at 05:34:54PM -0800, Tony Lindgren wrote:
> > > > > And bluetooth would be similar to cpcap_audio and mot_mdm6600_aud=
io
> > > > > above.
> > > >=20
> > > > My understanding is, that CPU is not involved for calls (except for
> > > > setting up cpcap registers correctly). Basically McBSP3 should
> > > > remain idle for a call and data goes directly from modem to cpcap.
> > > > The same should work for modem <-> BT, except that CPCAP seems to
> > > > always provide the clock. That would imply a direct link between
> > > > modem and codec / BT?
> > >=20
> > > Yes the direct link is i2s. I'm ot sure if mcbsp can be idle during
> > > voice call though, I guess it should be doable since mcbsp is not
> > > the clock master :)
> > >=20
> > > > > My guess is that only cpcap registers and clock rate needs to be
> > > > > changed for bluetooth audio BTW, so if somebody havs a bluetooth
> > > > > headset just do the following in Android:
> > > > >=20
> > > > > # cpcaprw --all > /tmp/before
> > > > > configure bluetooth headset for audio in android and start
> > > > > playing some music or make a phone call
> > > > > ...
> > > > > # cpcaprw --all > /tmp/after
> > > > > stop playing music or phone call
> > > > > ...
> > > > > diff -u /tmp/before /tmp/after
> > > > >=20
> > > > > The registers will be different for a bluetooth phone call and
> > > > > playing music.
> > > >=20
> > > > I can provider register values once I find some time.
> >=20
> > [NI] Normal idle (no BT headset connected)
> > [BI] Bluetooth idle (with BT headset connected)
> > [BC] Bluetooth call in progress
> > [NC] Normal call in progress (BT headset disabled)
> >=20
> >                      [NI]  =3D>  [BI]  =3D>  [BC]  =3D>  [NC]
> > CPCAP_REG_VAUDIOC   0x0065 =3D> 0x0065 =3D> 0x0065 =3D> 0x0025
> > CPCAP_REG_CC        0x0000 =3D> 0x0000 =3D> 0x6000 =3D> 0x60df
> > CPCAP_REG_CDI       0x0040 =3D> 0x0000 =3D> 0xaa40 =3D> 0xae0a
> > CPCAP_REG_SDAC      -------------- 0x0000 --------------
> > CPCAP_REG_SDACDI    -------------- 0x0004 --------------
> > CPCAP_REG_TXI       0x0804 =3D> 0x0004 =3D> 0x0000 =3D> 0x0cc6
> > CPCAP_REG_TXMP      0x079c =3D> 0x079c =3D> 0x0400 =3D> 0x0673
> > CPCAP_REG_RXOA      0x0000 =3D> 0x0000 =3D> 0x0001 =3D> 0x0001
> > CPCAP_REG_RXVC      0x0d34 =3D> 0x0d34 =3D> 0x0000 =3D> 0x0b2c
> > CPCAP_REG_RXCOA     0x0000 =3D> 0x0000 =3D> 0x0000 =3D> 0x0601
> > CPCAP_REG_RXSDOA    0x0000 =3D> 0x0000 =3D> 0x0600 =3D> 0x0600
> > CPCAP_REG_RXEPOA    -------------- 0x0400 --------------
> > CPCAP_REG_RXLL      -------------- 0x0000 --------------
> > CPCAP_REG_A2LA      -------------- 0x0030 --------------
> > CPCAP_REG_MIPIS1    -------------- 0x0000 --------------
> > CPCAP_REG_MIPIS2    -------------- 0x0000 --------------
> > CPCAP_REG_MIPIS3    -------------- 0x0000 --------------
> > CPCAP_REG_LVAB      -------------- 0x0000 --------------
>=20
> Great thanks! Care to do also a dump just playing music to on
> bluetooth headset at some point?

AFAIK BT music is usually done via A2DP using the data connection,
but I can get a register dump to make sure. I guess the more
interesting bit would be to use BT headset for a VOIP call, which
requires the headset profile being routed to the CPU.

-- Sebastian

--njnztwvky5sdzicr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5MEj4ACgkQ2O7X88g7
+poFYw//XQ7O3qOgKSSW0CMyFy16w6YZb78hfG0vsiZOA+KshUjO/hGfzhv9ySM3
QQvcrsENfeadQ6EqFLUK/1xcDUjDgziemLEPnbSHwXfWz4DwFmVYyxwaQc1XaeRm
qzgVBlvMiUCKKkDrhQz482eTWMZt6OyuXQ8YHZL1mCzrxdXDy7yYm5f1BIHLQK0H
+yboDLCloyuu+qiTinurCZxzmU8VuAbBFfh1iAQsfeJqcau8MEr0yTFHV77cHikU
kAYczOFDDjROvE8Q56vxnpYuC1M7Rbz9Jj0Y1C78VVjJRAt5gyKMgreK213J6xZb
nWXuBDoWKthTv2akmJ+HClx3kyi8TweQKnaDGPSy1/ub+6FswXCcZ172bg+kyUV2
RM+HjqHeocK3fr8YIRxrPIVIih4NCTWuoc8xfCG5y314wS+D9KfD1aI3TMaKeKxG
6ID7143Qgs1XxyBoAJ8dIW7knKxSldUs2LhSuglBeOhHCBVgBs4hHWbTUvCrR5Jt
jCeVEt1SQ+wgsTgbTYbnUlzwLRWAIpuBzrprCndipfUTx0KQsvDS6aUFRkEx70HL
CVEsTaDX3V7r1Z5izI6B7DJKw2gElRzRTHRQBhaqpvnxu57DEqdas4fQ/bdLbZj9
3GTcae+qU+oaImxVYb4hZNKX740QeL1zoJ8YSzONOTrKBq/zx/g=
=GOC7
-----END PGP SIGNATURE-----

--njnztwvky5sdzicr--
