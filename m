Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCFFD923B5
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 14:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfHSMo0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 08:44:26 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56523 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfHSMoZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 08:44:25 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id C39978163D; Mon, 19 Aug 2019 14:44:09 +0200 (CEST)
Date:   Mon, 19 Aug 2019 14:44:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190819124422.GI21072@amd>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
 <20190818183459.GA29779@amd>
 <20190819114609.GL52127@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/GPgYEyhnw15BExa"
Content-Disposition: inline
In-Reply-To: <20190819114609.GL52127@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--/GPgYEyhnw15BExa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Recently my Droid4 battery seems to be swelling up quite a bit. It co=
uld
> > > be of old age, but bencoh (CC) suggested that he changed the driver c=
ode
> > > in his kernel to charge until 4.2v, instead of the 4.35v that mainline
> > > currently seems to use. (After one of his batteries started to swell =
up too)
> > >=20
> > > I assume the 4.35v value was taken from Android?
>=20
> Yes the values we have been using are the values dumped from Android.
>=20
> So far I have not seen anything changing the values when left connected
> to a charger, so I was assuming/hoping that the charger hardware might
> drop the voltage automatically.. But it seems that's not the case.
>=20
> I too have seen at least two swollen batteries and at least one that
> seemed to happen with Cyanogenmod or LineageOS few years ago. I suspect
> it happens if left connected to a charger for a longer period of time
> like several weeks at a time.
>=20
> > You can let stock android charge the battery, then read voltage from
> > mainline kernel. It seems stock uses 4.35V:
> >=20
> > https://forums.lenovo.com/t5/Moto-Z/MOTO-Z-EXTREME-BATTERY-DRAIN/m-p/44=
35636
> >=20
> > ...but maybe we should not.
>=20
> OK so sounds like Motorola always keeps the voltage at 4.35V
> and there's no need to try to dump out any more charger related
> values from Android.
>=20
> > https://batteryuniversity.com/learn/article/how_to_prolong_lithium_base=
d_batteries
>=20
> Pavel, care to send out a minimal fix to lower the charge
> voltage to 4.2V since you have the related changes already?

Hmm. Related changes make it harder, not easier but.. here you
go... But... while this is simple... you are applying it at your own
risk. Untested. One potential problem is that while mainline will charge
to 4.2V, "power off charging" and Adroid will still charge to 4.35V,
leading to charge/discharge cycles even while charging is connected.

> Then later on we may want to optionally consider implementing
> support for 4.35V charge voltages assuming we scale down the
> charge voltage to 4.2V after reaching full charge.

Not sure how that would work / why we'd want to do that / what do you
consider to be full charge.

https://secondlifestorage.com/t-Li-ion-4-35V-How-much-do-we-lose-by-chargin=
g-it-at-4-20V
https://batteryuniversity.com/learn/article/confusion_with_voltages

Best regards,
								Pavel



Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cp=
cap-charger.c
index cc546bc..3a82f30 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -440,7 +440,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 			max_current =3D CPCAP_REG_CRM_ICHRG_0A532;
=20
 		error =3D cpcap_charger_set_state(ddata,
-						CPCAP_REG_CRM_VCHRG_4V35,
+						CPCAP_REG_CRM_VCHRG_4V20,
 						max_current, 0);
 		if (error)
 			goto out_err;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/GPgYEyhnw15BExa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1amaYACgkQMOfwapXb+vJHHwCdGWAGDpoLSvjjGAST89zlr+8v
s9MAnjvgCVXRc7P37IBiYO3k0njJH5IH
=J09s
-----END PGP SIGNATURE-----

--/GPgYEyhnw15BExa--
