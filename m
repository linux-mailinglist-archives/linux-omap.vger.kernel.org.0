Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC0415D7E9
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 14:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgBNNEc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 08:04:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:44390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgBNNEc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 08:04:32 -0500
Received: from earth.universe (dyndsl-095-033-170-229.ewe-ip-backbone.de [95.33.170.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 021942168B;
        Fri, 14 Feb 2020 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581685471;
        bh=Whpmh17W3kSxzCbioGOu19PQoaptQmnJO000zV6cl/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PlL/l3Z7kdOoZpVyGq4Roudbx0tJgxPrPX2KIHigFeXx4RIrrrT+QNcPyJFJjicgb
         qxc27FG+O+7IGNWpHE0t33kVWRXs4y3BEylH+Lsal/AqdD/0i59RTOC4sTKBI9292O
         X0ddPyfqq3ku12pGk9j3YuYrLx9AJfVNmaYFZ4T0=
Received: by earth.universe (Postfix, from userid 1000)
        id A5A543C0C83; Fri, 14 Feb 2020 14:04:28 +0100 (CET)
Date:   Fri, 14 Feb 2020 14:04:28 +0100
From:   Sebastian Reichel <sre@kernel.org>
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
Message-ID: <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
 <20200214013454.GX64767@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="grqobqlnl2f7lvmu"
Content-Disposition: inline
In-Reply-To: <20200214013454.GX64767@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--grqobqlnl2f7lvmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 13, 2020 at 05:34:54PM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sre@kernel.org> [200214 00:35]:
> > On Wed, Feb 12, 2020 at 06:35:43AM -0800, Tony Lindgren wrote:
> > > Yes this should follow the audio-graph-card.txt example. We end up wi=
th
> > > mcbsp3 dts node as below on droid4:
> > >=20
> > > &mcbsp3 {
> > >         #sound-dai-cells =3D <0>;
> > >         pinctrl-names =3D "default";
> > >         pinctrl-0 =3D <&mcbsp3_pins>;
> > >         status =3D "okay";
> > >=20
> > >         ports {
> > >                 mcbsp3_port: port@0 {
> > >                         #address-cells =3D <1>;
> > >                         #size-cells =3D <0>;
> > >=20
> > >                         cpu_dai3: endpoint@0 {
> >=20
> > cpu_dai3_cpcap
> >=20
> > >                                 reg =3D <0>;
> > >                                 dai-format =3D "dsp_a";
> > >                                 frame-master =3D <&cpcap_audio_codec1=
>;
> > >                                 bitclock-master =3D <&cpcap_audio_cod=
ec1>;
> > >                                 remote-endpoint =3D <&cpcap_audio_cod=
ec1>;
> > >                         };
> > >=20
> > >                         cpu_dai_mdm: endpoint@1 {
> >=20
> > cpu_dai3_mdm
>=20
> OK
>=20
> > >                                 reg =3D <1>;
> > >                                 dai-format =3D "dsp_a";
> > >                                 frame-master =3D <&cpcap_audio_codec1=
>;
> > >                                 bitclock-master =3D <&cpcap_audio_cod=
ec1>;
> > >                                 remote-endpoint =3D <&mot_mdm6600_aud=
io_codec0>;
> > >                         };
> > >                 };
> > >         };
> > > };
> > >=20
> > > That is pretty much the same as the 'Multi DAI with DPCM' example, wi=
th
> > > dne dai, and multiple endpoints. I think we still have just one port
> > > for one i2s transport on the mcbsp :)
> > >=20
> > > Does the above look as what you would expect based on the binding?
> >=20
> > I haven't had a look at this for quite some time. I suppose the
> > cpcap voice DAI and the modem will also have two endpoints? So
> > once the BT support is added it will looks like this [simplified]?
>=20
> Well it will be even simpler, no need for extra endpoints at
> the codecs, see below.
> =20
> > &mcbsp3 {
> >     ports {
> >         port@0 {
> >             cpu_dai3_cpcap: endpoint@0 {};
> >             cpu_dai3_modem: endpoint@1 {};
> >             cpu_dai3_bt: endpoint@2 {};
> >         };
> >     };
> > };
>=20
> But yes, bluetooth would be just added as above under mcbsp3.
>=20
[...]
>
> Then the modem codec looks like this:
>=20
> mot_mdm6600_audio: audio-codec {
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
> 	#sound-dai-cells =3D <1>;
>=20
> 	port@0 {
> 		mot_mdm6600_audio_codec0: endpoint {
> 			remote-endpoint =3D <&cpu_dai_mdm>;
> 		};
> 	};
> };
>=20
> > &bluetooth {
> >     ports {
> >         port@0 {
> >             bt_dai_cpu: endpoint@0 {};
> >             bt_dai_modem: endpoint@1 {};
> >             bt_dai_cpcap: endpoint@2 {};
> >         };
> >     };
> > };
>=20
> And bluetooth would be similar to cpcap_audio and mot_mdm6600_audio
> above.

My understanding is, that CPU is not involved for calls (except for
setting up cpcap registers correctly). Basically McBSP3 should
remain idle for a call and data goes directly from modem to cpcap.
The same should work for modem <-> BT, except that CPCAP seems to
always provide the clock. That would imply a direct link between
modem and codec / BT?

> My guess is that only cpcap registers and clock rate needs to be
> changed for bluetooth audio BTW, so if somebody havs a bluetooth
> headset just do the following in Android:
>=20
> # cpcaprw --all > /tmp/before
> configure bluetooth headset for audio in android and start
> playing some music or make a phone call
> ...
> # cpcaprw --all > /tmp/after
> stop playing music or phone call
> ...
> diff -u /tmp/before /tmp/after
>=20
> The registers will be different for a bluetooth phone call and
> playing music.

I can provider register values once I find some time.

-- Sebastian

--grqobqlnl2f7lvmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5GmtMACgkQ2O7X88g7
+poqlxAAoWvnDgIQ89tEJ3QSMvEfczJKLhj/o5/V9vMZaFmtaPu/FfV1uSgVl62E
u7yH8XYBz/SFzkspyURXuBR0BVN8HYqgIDT7sMGfF56SqWR31aUgEPQP2W1SVZeR
W7x2NcPDRBpRciEqiwEWWp7ikRd5XWvDOwFL6moH1fNhHK3ckznQzC4AAg1FvAdv
9YYdYfq+HV+TXGlGZHS8NV0+a+jzVUDrHY4FN/WaHBFnfoPMzZXicdtWv5gYcS8A
5Iq1Rm28VX/r0aOsk6UaPOeKkynjHfueQhPHnlao5SRsaA4dLJG4OXIkJdbLs0xw
Bt9AumrNmMpfMh5l4jmNezh+EBHARY0pgnzptPga/cdaCjIFMBwsSVHtkJmNT5Z1
iXujx+GP838sqdnKE141bo2fePlZ6cn4qY5kWsN4jf8BkxNKexP8Qz8UVc3820rn
WFhzRdDVLJLBZga464CWaYAdUxnv52TcfmDyETUeGs4CQVcM5a3s00Xn+U70cFvd
oz4TD7OsXcyrhQgisbrUpQ3rhLVr4zzn2Bj9/3jOodJezPXp/TJSaWnZsEwRH3jg
tyCsODn49aYuJEc6lGLwH8edtbJyU0eApVzQ5XCA3pwmcRZzA34sefpYyw791kdM
8H0dpVRfaBxg8VBFhb437qUMAukYjN9rj8MuzPi/rdDrCOKopZ0=
=s63e
-----END PGP SIGNATURE-----

--grqobqlnl2f7lvmu--
