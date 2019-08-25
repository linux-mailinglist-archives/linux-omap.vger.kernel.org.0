Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD3C9C2AC
	for <lists+linux-omap@lfdr.de>; Sun, 25 Aug 2019 11:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbfHYJ2S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Aug 2019 05:28:18 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44950 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbfHYJ2S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 25 Aug 2019 05:28:18 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D8B0E80834; Sun, 25 Aug 2019 11:28:01 +0200 (CEST)
Date:   Sun, 25 Aug 2019 11:28:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190825092814.GB1644@amd>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
 <20190818183459.GA29779@amd>
 <20190819114609.GL52127@atomide.com>
 <20190819124422.GI21072@amd>
 <20190821113521.GN52127@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <20190821113521.GN52127@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> * Pavel Machek <pavel@ucw.cz> [190819 12:44]:
> > Hmm. Related changes make it harder, not easier but.. here you
> > go... But... while this is simple... you are applying it at your own
> > risk. Untested. One potential problem is that while mainline will charge
> > to 4.2V, "power off charging" and Adroid will still charge to 4.35V,
> > leading to charge/discharge cycles even while charging is connected.
>=20
> I guess not much we can do about Android charging at 4.35V.

Well, true.=20

> > > Then later on we may want to optionally consider implementing
> > > support for 4.35V charge voltages assuming we scale down the
> > > charge voltage to 4.2V after reaching full charge.
> >=20
> > Not sure how that would work / why we'd want to do that / what do you
> > consider to be full charge.
>=20
> Well that would be if we wanted to make use of the extra capacity..
>=20
> > https://secondlifestorage.com/t-Li-ion-4-35V-How-much-do-we-lose-by-cha=
rging-it-at-4-20V
> > https://batteryuniversity.com/learn/article/confusion_with_voltages
>=20
> .. but yeah I don't know what we should consider full. I guess it's
> a 3.8V/4.35V battery vs 3.7V/4.2V battery.. To me it seems safest
> to set charge voltage to 4.2V and battery full to 4.2V until we
> we have some better ideas.

Well, feel free to apply the one-liner. Plus you can have a full patch
to make current and voltage configurable...

> > +++ b/drivers/power/supply/cpcap-charger.c
> > @@ -440,7 +440,7 @@ static void cpcap_usb_detect(struct work_struct *wo=
rk)
> >  			max_current =3D CPCAP_REG_CRM_ICHRG_0A532;
> > =20
> >  		error =3D cpcap_charger_set_state(ddata,
> > -						CPCAP_REG_CRM_VCHRG_4V35,
> > +						CPCAP_REG_CRM_VCHRG_4V20,
> >  						max_current, 0);
> >  		if (error)
> >  			goto out_err;
> >=20
>=20
> So I think you also need to change the battery full to 4.2V too? Sure
> if Android charged to 4.35V, we show 15 minutes of over 100%..

Umm. I am not sure I need to change anything else _in the kernel_?

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1iVK4ACgkQMOfwapXb+vJkuQCcC8l9+0lIpWaIfM5ivE53a57H
jg8An3VAVF15Fx7YA1qxLOyLVEe+fvbX
=GqCB
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
