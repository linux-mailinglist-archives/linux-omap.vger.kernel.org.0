Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA84162B71
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 18:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbgBRRGh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 12:06:37 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54692 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgBRRGd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 12:06:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id A56E72942E5
Received: by earth.universe (Postfix, from userid 1000)
        id 04A863C0C81; Tue, 18 Feb 2020 18:06:29 +0100 (CET)
Date:   Tue, 18 Feb 2020 18:06:28 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        "Arthur D ." <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call
 support
Message-ID: <20200218170628.r47xc3yydg6xx2yh@earth.universe>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e4xhqf4ckenfagk5"
Content-Disposition: inline
In-Reply-To: <20200218153211.GI35972@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--e4xhqf4ckenfagk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 18, 2020 at 07:32:11AM -0800, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200218 15:16]:
> > On 18/02/2020 1.23, Tony Lindgren wrote:
> > > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200214 13:30]:
> > >> Hi Tony,
> > >>
> > >> On 12/02/2020 16.46, Tony Lindgren wrote:
> > >>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 09:18]:
> > >>>> On 11/02/2020 20.10, Tony Lindgren wrote:
> > >>>>> +static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
> > >>>>> +				    unsigned int tx_mask, unsigned int rx_mask,
> > >>>>> +				    int slots, int slot_width)
> > >>>>> +{
> > >>>>> +	struct snd_soc_component *component =3D dai->component;
> > >>>>> +	struct cpcap_audio *cpcap =3D snd_soc_component_get_drvdata(com=
ponent);
> > >>>>> +	int err, ts_mask, mask;
> > >>>>> +	bool voice_call;
> > >>>>> +
> > >>>>> +	/*
> > >>>>> +	 * Primitive test for voice call, probably needs more checks
> > >>>>> +	 * later on for 16-bit calls detected, Bluetooth headset etc.
> > >>>>> +	 */
> > >>>>> +	if (tx_mask =3D=3D 0 && rx_mask =3D=3D 1 && slot_width =3D=3D 8)
> > >>>>> +		voice_call =3D true;
> > >>>>> +	else
> > >>>>> +		voice_call =3D false;
> > >>>>
> > >>>> You only have voice call if only rx slot0 is in use?
> > >>>
> > >>> Yeah so it seems. Then there's the modem to wlcore bluetooth path t=
hat
> > >>> I have not looked at. But presumably that's again just configuring =
some
> > >>> tdm slot on the PMIC.
> > >>>
> > >>>> If you record mono on the voice DAI, then rx_mask is also 1, no?
> > >>>
> > >>> It is above :) But maybe I don't follow what you're asking here
> > >>
> > >> If you arecrod -Dvoice_pcm -c1 -fS8 > /dev/null
> > >> then it is reasonable that the machine driver will set rx_mask =3D 1
> > >>
> > >>> and maybe you have some better check in mind.
> > >>
> > >> Not sure, but relying on set_tdm_slots to decide if we are in a call
> > >> case does not sound right.
> > >=20
> > > OK yeah seems at least bluetooth would need to be also handled
> > > in the set_tdm_slots.
> >=20
> > set_tdm_slots() is for setting how the TDM slots supposed to be used by
> > the component and not really for things to configure different operating
> > modes.
> >=20
> > If you hardwire things in set_tdm_slots() for the droid4 then how the
> > codec driver can be reused in other setups?
>=20
> Right, I'm all go for better solutions :)
>=20
> > >>>> You will also set the sampling rate for voice in
> > >>>> cpcap_voice_hw_params(), but that is for normal playback/capture, =
right?
> > >>>
> > >>> Yeah so normal playback/capture is already working with cpcap codec=
 driver
> > >>> with mainline Linux. The voice call needs to set rate to 8000.
> > >>
> > >> But if you have a voice call initiated should not the rate be set by=
 the
> > >> set_sysclk()?
> > >=20
> > > Hmm does set_sysclk called from modem codec know that cpcap codec
> > > is the clock master based on bitclock-master and set the rate
> > > for cpcap codec?
> >=20
> > Neither component should call set_sysclk, set_tdm_slots. The machine
> > driver should as it is the only one who know how things are wired...
>=20
> OK, but so what's the machine driver part in this case?

simple-graph-card is the current machine driver. We might have to
introduce a Droid 4 specific driver instead. I used simple(-graph)-card
instead of introducing a new driver, since the setup was simple enough
without modem and bluetooth. The simple card was perfect to test the CPCAP
codec driver. The TDM things might be complex enough to create
a new machine driver (as I mentioned in the original patchset
adding CPCAP codec support).

Note: Don't use Motorola's tree to learn about ASoC. Their soundcard
and cpcap codec drivers are full of weird hacks. I'm pretty sure the
author(s) did not really understand how ASoC works. From my
experience you should only use their code to understand the
hardware wiring. You might also want to look into the MC13783
datasheet for the keyword "network mode".

-- Sebastian

--e4xhqf4ckenfagk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5MGZEACgkQ2O7X88g7
+pqn5A/7Bby/ClGFYeyupbA+sYRaZu0ngXwFHcjCe/kXviBzAt/Yx8Hm2Bu65KNA
occazqTddxw4EHMvS3PbDjnxokZtyZZGHf8ZK8yXE9EeUJc8GW0OX/YjMgCKtKgk
NzaPGkeWkwn29T/0+0p0Ld7j/LGg3qRirxyIfkeFTR5IN+sOGL7DdHCgCu8C/JEm
fYFt0tNbLV+0sINzhLVNj6nu22204LxNpF/ZFwxVcStna8EdQR1osDlt9fe46LkF
CuYsKahKTRS3hTGC3iJGwr1YRzxIc3myiCxQGnw2R0cYuqX+Yo0iNuqjlFL+Kzqu
d43H6838ld18/xqIDRVh2NVaeeRuAwaa81YHoYFK0K80zx/tDkfjY9fbl34AXJzh
KjsI3bedxewJtgtL1SIg9PD66fzcL8R0NHr6VE40OiiQZ0Gs+CnnDGZYHsiAgeJy
hmc3NWk5nrxkcNHIVCWYnmvJ1zylvufSaCx2Ry5/ZL+S1opgo1P9UM4TCCfRl346
9r09CrFbf/WYYhq9n1Oit8WpgoC6jZC/wU15/LCFA/dc8lMGc/Grt/Eiuz7eXdu8
EO/sDKFRNCxlEUY5Tn/DMAc1d3T0lge19f3AN8+N3cHjti+NZicnoOsT+wfpAGh9
kSbALPnfqw1Qk3B2pl88+WuGf8da2FDghRmG1PxovpsHEC9wtyo=
=aBy/
-----END PGP SIGNATURE-----

--e4xhqf4ckenfagk5--
