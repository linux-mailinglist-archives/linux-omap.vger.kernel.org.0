Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F32715CF11
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 01:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbgBNAe5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 19:34:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:34626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727594AbgBNAe5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Feb 2020 19:34:57 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61CD820873;
        Fri, 14 Feb 2020 00:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581640495;
        bh=7Ucwpom7nejYprJrTk/lskdiaCd9vzuIiREJr+RLFL0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aSxM6iG15i+KSUTx8xCRJxznRX20gwDubtdfo8Y9oHftkFnWHuIVoIccPRxTE8M5n
         vzJmqYjUGoGNv/rP4ritFpp4yeqHC9g6A7aOKQBUiAyNTwvf8iYxUvnP/C3y8CmFCL
         4f4HenKI/HZkTSp21/l/60uD6aCUnK4QVVc2Xm0o=
Received: by earth.universe (Postfix, from userid 1000)
        id 5B5F63C0C83; Fri, 14 Feb 2020 01:34:52 +0100 (CET)
Date:   Fri, 14 Feb 2020 01:34:52 +0100
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
Message-ID: <20200214003452.xuadnylj2udqyljs@earth.universe>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="haklec7v7ewvdazo"
Content-Disposition: inline
In-Reply-To: <20200212143543.GI64767@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--haklec7v7ewvdazo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 12, 2020 at 06:35:43AM -0800, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 08:02]:
> > On 11/02/2020 19.16, Tony Lindgren wrote:
> > > We can have multiple connections on a single McBSP instance configured
> > > with audio graph card when using TDM (Time Division Multiplexing). Le=
t's
> > > allow that by configuring dais dynamically.
> >=20
> > It is still one DAI...
> > If you have multiple codec connected to the same I2S lines, but the
> > codecs communicate within different time slots, you still have one DAI
> > on the CPU side, but multiple codecs (codec DAIs) with different TDM sl=
ot.
>=20
> OK so subject should say "dodec DAIs" then I guess?
>=20
> > > See Documentation/devicetree/bindings/sound/audio-graph-card.txt and
> > > Documentation/devicetree/bindings/graph.txt for more details for
> > > multiple endpoints.
> >=20
> > See the example for 'Multi DAI with DPCM' in audio-graph-card.txt
> > The PCM3168a have 2 DAIs: playback and capture, but you can have
> > multiple endpoints within a DAI.
>=20
> Yes this should follow the audio-graph-card.txt example. We end up with
> mcbsp3 dts node as below on droid4:
>=20
> &mcbsp3 {
>         #sound-dai-cells =3D <0>;
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&mcbsp3_pins>;
>         status =3D "okay";
>=20
>         ports {
>                 mcbsp3_port: port@0 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>=20
>                         cpu_dai3: endpoint@0 {

cpu_dai3_cpcap

>                                 reg =3D <0>;
>                                 dai-format =3D "dsp_a";
>                                 frame-master =3D <&cpcap_audio_codec1>;
>                                 bitclock-master =3D <&cpcap_audio_codec1>;
>                                 remote-endpoint =3D <&cpcap_audio_codec1>;
>                         };
>=20
>                         cpu_dai_mdm: endpoint@1 {

cpu_dai3_mdm

>                                 reg =3D <1>;
>                                 dai-format =3D "dsp_a";
>                                 frame-master =3D <&cpcap_audio_codec1>;
>                                 bitclock-master =3D <&cpcap_audio_codec1>;
>                                 remote-endpoint =3D <&mot_mdm6600_audio_c=
odec0>;
>                         };
>                 };
>         };
> };
>=20
> That is pretty much the same as the 'Multi DAI with DPCM' example, with
> dne dai, and multiple endpoints. I think we still have just one port
> for one i2s transport on the mcbsp :)
>=20
> Does the above look as what you would expect based on the binding?

I haven't had a look at this for quite some time. I suppose the
cpcap voice DAI and the modem will also have two endpoints? So
once the BT support is added it will looks like this [simplified]?

&mcbsp3 {
    ports {
        port@0 {
            cpu_dai3_cpcap: endpoint@0 {};
            cpu_dai3_modem: endpoint@1 {};
            cpu_dai3_bt: endpoint@2 {};
        };
    };
};

&cpcap {
    ports {
        voice: port@1 {
            cpcap_voice_cpu: endpoint@0 {};
            cpcap_voice_modem: endpoint@1 {};
            cpcap_voice_bt: endpoint@2 {};
        };
    };
};

&modem {
    ports {
        port@0 {
            modem_voice_cpu: endpoint@0 {};
            modem_voice_cpcap: endpoint@1 {};
            modem_voice_bt: endpoint@2 {};
        };
    };
};

&bluetooth {
    ports {
        port@0 {
            bt_dai_cpu: endpoint@0 {};
            bt_dai_modem: endpoint@1 {};
            bt_dai_cpcap: endpoint@2 {};
        };
    };
};

> > > I've tested this with droid4 where cpcap pmic and modem voice are both
> > > both wired to mcbsp3. I've also tested this on droid4 both with and
> > > without the pending modem audio codec driver that is waiting for n_gsm
> > > serdev dependencies to clear.
> >=20
> > What this patch you effectively just creating dummy-dais on top of the
> > real McBSP DAI.
>=20
> Yes I think this is needed for snd-soc-audio-graph-card, and this allows
> configuring whatever is needed for the i2s slot. But maybe you have some
> better way of doing it in mind?
>=20
> > You also rename the DAIs, which might break ams-delta.
>=20
> Oops, that's not good. So should we just keep the old naming if there's
> only one endpoint?
>=20
> > We still have legacy support in
> > omap-twl4030.c
> > omap3pandora.c
> > osk5912.c
> > rx51.c

also n810.c

> > which will break with the renamed DAI. On the other hand I think the
> > legacy support can be dropped from them.
>=20
> I'm not sure what all that would take.

rx51 and omap-twl4030 override the hardcoded paths with DT
information when DT is available (=3D always), so hardcoded paths
do not matter at all and could simply be removed (the patch
should also make DT mandatory).

For omap3pandora, n810 and osk5912 the hardcoded information seems
to be used and there does not seem to be any soundcard DT node for
them. I suppose it's a bit of work for those devices. n810
looks simple enough to just use simple-card.

> > I know it was discussed, but can not find the mail:
> > Can you brief again on the audio connection?
>=20
> Below is a link to a mailing list thread where Sebastian describes
> the audio connection:
>=20
> https://lkml.org/lkml/2018/3/28/881
>=20
> > Do you have branch with working code?
>=20
> Yeah I have slightly older set of the patches in my droid4-pending-v5.5
> kernel.org git branch with voice calls working.

-- Sebastian

--haklec7v7ewvdazo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5F6ywACgkQ2O7X88g7
+pqB4g//YNf74GRM1TIBaHnJNFzV5FcTtI7CDzgdDh5yDML4z+5nqzOM8bAcXMB3
WLOrZm6E+7AjzKc6kWoHoFn+saTvE/DltlXcp5p67enDwzKK3mfT29L8ZPzLj4Lk
5NOmNTOiK35HvVue8oG/g2EQAocDYXk8KIiPhOHH7txJbwWCkxsDiv2itS5JbdX6
2nOkgnRioZjpAy/a+pAxuZuluSifbTdlRQjiK4XoK8EsWjKEzRBGB3D1ur8iUIfW
nQScr3UbJRmFkeFwZyLq7fmYey5YH3pnL8lg4AY0zXg6QoTRquUujsw50Q3yiZTC
JO0MvOKaYmmKMXOVhQpN7dF90XLLYpqSV5F2u99rL3MKf6RhI19EZq0U8I9MbylZ
YGoCt0qXnLMIymPATpV0V2HAD9Xpv4Pi+XNa1wWOrveAFa7zxo7TKFEfcOsVKAWv
U9JLld4Rm9pfW8aXIFuyvw2qKjF2Gz1hDp7CpthiTUuMMk4WU0AQlCJvr1JxT86W
bm7raVqkIZ0y6ehq63LCx1+YvHNh6xtjomT+/8cRTPGQZHMcrOB0AgTw18ZXYnhz
+mPQm/SKnXWBqCPnSB1sSC+WmK9MhrLWyQtHWdynk/X5oJqtPBNZLogCnExohYJj
poLwD7FfCmKYPbrKy6ohzJpgBhFWbvl6I+CvuIHEJJZiLqy5mu8=
=gusE
-----END PGP SIGNATURE-----

--haklec7v7ewvdazo--
