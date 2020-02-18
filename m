Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5601116279F
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 15:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgBROEf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 09:04:35 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52598 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgBROEf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 09:04:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id A615629138B
Received: by earth.universe (Postfix, from userid 1000)
        id F10E93C0C81; Tue, 18 Feb 2020 15:04:31 +0100 (CET)
Date:   Tue, 18 Feb 2020 15:04:31 +0100
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
Message-ID: <20200218140431.emrxgvckrpltmg2s@earth.universe>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
 <20200214013454.GX64767@atomide.com>
 <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
 <20200214170946.GB64767@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7l4uy2pkqo77ymf7"
Content-Disposition: inline
In-Reply-To: <20200214170946.GB64767@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--7l4uy2pkqo77ymf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 14, 2020 at 09:09:46AM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sre@kernel.org> [200214 13:05]:
> > On Thu, Feb 13, 2020 at 05:34:54PM -0800, Tony Lindgren wrote:
> > > And bluetooth would be similar to cpcap_audio and mot_mdm6600_audio
> > > above.
> >=20
> > My understanding is, that CPU is not involved for calls (except for
> > setting up cpcap registers correctly). Basically McBSP3 should
> > remain idle for a call and data goes directly from modem to cpcap.
> > The same should work for modem <-> BT, except that CPCAP seems to
> > always provide the clock. That would imply a direct link between
> > modem and codec / BT?
>=20
> Yes the direct link is i2s. I'm ot sure if mcbsp can be idle during
> voice call though, I guess it should be doable since mcbsp is not
> the clock master :)
>=20
> > > My guess is that only cpcap registers and clock rate needs to be
> > > changed for bluetooth audio BTW, so if somebody havs a bluetooth
> > > headset just do the following in Android:
> > >=20
> > > # cpcaprw --all > /tmp/before
> > > configure bluetooth headset for audio in android and start
> > > playing some music or make a phone call
> > > ...
> > > # cpcaprw --all > /tmp/after
> > > stop playing music or phone call
> > > ...
> > > diff -u /tmp/before /tmp/after
> > >=20
> > > The registers will be different for a bluetooth phone call and
> > > playing music.
> >=20
> > I can provider register values once I find some time.

[NI] Normal idle (no BT headset connected)
[BI] Bluetooth idle (with BT headset connected)
[BC] Bluetooth call in progress
[NC] Normal call in progress (BT headset disabled)

                     [NI]  =3D>  [BI]  =3D>  [BC]  =3D>  [NC]
CPCAP_REG_VAUDIOC   0x0065 =3D> 0x0065 =3D> 0x0065 =3D> 0x0025
CPCAP_REG_CC        0x0000 =3D> 0x0000 =3D> 0x6000 =3D> 0x60df
CPCAP_REG_CDI       0x0040 =3D> 0x0000 =3D> 0xaa40 =3D> 0xae0a
CPCAP_REG_SDAC      -------------- 0x0000 --------------
CPCAP_REG_SDACDI    -------------- 0x0004 --------------
CPCAP_REG_TXI       0x0804 =3D> 0x0004 =3D> 0x0000 =3D> 0x0cc6
CPCAP_REG_TXMP      0x079c =3D> 0x079c =3D> 0x0400 =3D> 0x0673
CPCAP_REG_RXOA      0x0000 =3D> 0x0000 =3D> 0x0001 =3D> 0x0001
CPCAP_REG_RXVC      0x0d34 =3D> 0x0d34 =3D> 0x0000 =3D> 0x0b2c
CPCAP_REG_RXCOA     0x0000 =3D> 0x0000 =3D> 0x0000 =3D> 0x0601
CPCAP_REG_RXSDOA    0x0000 =3D> 0x0000 =3D> 0x0600 =3D> 0x0600
CPCAP_REG_RXEPOA    -------------- 0x0400 --------------
CPCAP_REG_RXLL      -------------- 0x0000 --------------
CPCAP_REG_A2LA      -------------- 0x0030 --------------
CPCAP_REG_MIPIS1    -------------- 0x0000 --------------
CPCAP_REG_MIPIS2    -------------- 0x0000 --------------
CPCAP_REG_MIPIS3    -------------- 0x0000 --------------
CPCAP_REG_LVAB      -------------- 0x0000 --------------

-- Sebastian

--7l4uy2pkqo77ymf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5L7ukACgkQ2O7X88g7
+poophAApJAJiKd6MJhkOGd7eW5g2hWtYr0qp9cVC99Z6POxm8vqSPa1uQvF6oz+
WpT4x0lPj1qTxQJvcsm2MS+HHi3fMdodtfI96kXUxC/owAem23WGtIdggLvsna28
uVoCqRrAVriUsqfyTZDIw7FQNe9rxfOLMilYLQz9KrPF+j+witt2i5hwKAQemXke
wLpTEH3uaT1GgSEsXyu/YUlAY8f5f6lSkQgodG1sLbhrR16MUPDCrlmrHgNI07IK
sXT/wm9urqjkBo5/KWVuLhmXR87TgY6RPx0UEDOSuz2k2a85CoX0dH9Of6dBexj1
eQyOxQZQo+u2cBzBGqZFL9TaW9slOqfbFn8sV3i50sG/0B0UAyfvgtRdJpuZw9Y8
hXuDeyhQ1fj7E2/GmH4+EJhgQ+9xYw8t1oqRDR9LxvtCzi8Kcf9wFRbGpEhunvUQ
kG3HJfOwTtN/fyqkqrIkwxVvvVG0qMNheIsPXMswnYwRTySHypzzsYV+pxe1yxXt
DZiHCB+yydiUzFOOec31nK/O29A5gdsLAtLk715eU75UbB5xz4zBcW+Jx9hnqVgd
CZeolty1OMmDQBfWRlQEs75CAx6aSbWY4kANpxCc0WCq++HnG75m5sgSA2QGucfl
2gCXCdMQoJxTOd+WptS0Hzv0Z8agrMJETT31lvgjXJ7ZH3MIz/w=
=0V6p
-----END PGP SIGNATURE-----

--7l4uy2pkqo77ymf7--
