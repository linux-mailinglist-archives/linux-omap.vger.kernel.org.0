Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BA032010B
	for <lists+linux-omap@lfdr.de>; Fri, 19 Feb 2021 22:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhBSV7g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Feb 2021 16:59:36 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:53186 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbhBSV6y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Feb 2021 16:58:54 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B64A01C0BC2; Fri, 19 Feb 2021 22:57:53 +0100 (CET)
Date:   Fri, 19 Feb 2021 22:57:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Carl Philipp Klemm <philipp@uvos.xyz>
Subject: Re: Droid 4 charging
Message-ID: <20210219215752.GA31435@amd>
References: <20210206131415.GA4499@amd>
 <YCn5+ZPdPojwCz8g@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <YCn5+ZPdPojwCz8g@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > (I'm using Leste 5.10 kernel here).
> >=20
> > When battery is full, green light is off and 0.00A being drawn from
> > USB.
> >=20
> > But that means that phone is now powered from battery, discharging
> > it... And soon charging starts again. (Pretty much immediately, for me)
> >=20
> > That's bad ... right? It wears the battery out.
>=20
> Well maintenance charging at 4.2V sure is better for the battery than
> what android is doing charging it at 4.31V contantly..

Well, 4.2 is better than 4.3, but I'm not sure about the rest.

> > If I turn off charging with echo 0 > input_current_limit, 0.2 to 0.4A
> > is drawn from USB, and battery is not discharged:
> >=20
> > root@devuan-droid4:/sys/class/power_supply/usb# echo 0 >  input_current=
_limit
> > root@devuan-droid4:/sys/class/power_supply/usb# cat current_now
> > 0
>=20
> Hmm so have you measured that setting the current limit to 0 actually
> draws something from the USB?

Yes, it does, if I do the echo when charge is done. (I have small USB
passthrough with volt and amp meters). It has been behaving weirdly in
other cases.p

> I recall clearing the ichrgr bits stops the vbus draw completely, but
> I could be wrong.
>=20
> > Is that a better way to handle full battery?
>=20
> We could experiment with switching over to usb power when the battery is
> full. Looking at the docs for mc1378 it might be possible that setting
> CPCAP_REG_CRM_FET_OVRD and clearing CPCAP_REG_CRM_FET_CTRL after the
> battery is full disables charging but still keep drawing power from
> the usb. I'd assume the current limit still needs to be nonzero there
> too? Totally untested..

I may be able to test patches...

> And switching back to battery power on usb disconnect will potentially
> only give us very little time based on the different line length for
> vbus and ground pins compared to data pins on the usb connector.. And
> uvos had some concerns about the battery capacity putting it back online,
> so adding him to Cc also.

You mean, we'd have to take interrupt and switch registers in order to
switch back to battery power, and system would crash if we did not
make it in time?

> Maybe just clearing ichrgr does all this already though and is enough.
> It should be measured on the vbus line.

It works for me... measuring current at the usb connector.

> And then we still need to restart the charger at some point, but that
> could happen based on much longer timeouts that what we currently have.

Li-ion batteries are very slow to self-discharge. This could timeout
could be week... or maybe a year.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAwNGAACgkQMOfwapXb+vLZhACggmJ4K5ld7AzSt/1ows58as6s
FKoAn3gFfGas6Mpw6BnpPiX/jRUU1ROZ
=sZv1
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
