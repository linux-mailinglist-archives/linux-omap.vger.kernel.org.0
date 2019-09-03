Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C601A638A
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 10:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfICIH3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 04:07:29 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50908 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfICIH3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 04:07:29 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 42A1381CAE; Tue,  3 Sep 2019 10:07:12 +0200 (CEST)
Date:   Tue, 3 Sep 2019 10:07:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@denx.de>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 0/4] musb host improvments mostly for omap2430 glue
Message-ID: <20190903080725.GA26076@amd>
References: <20190830232058.53414-1-tony@atomide.com>
 <20190902092344.GA31410@amd>
 <20190902094408.GB31410@amd>
 <20190902160651.GI52127@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20190902160651.GI52127@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon 2019-09-02 09:06:51, Tony Lindgren wrote:
> * Pavel Machek <pavel@denx.de> [190902 09:44]:
> > On Mon 2019-09-02 11:23:44, Pavel Machek wrote:
> > Hmm. I guess CONFIG_USB_MUSB_DUAL_ROLE=3Dy might be useful.
> >=20
> > And now... if I unplug/replug the usb after the boot, USB hub and
> > mouse are recognized. Good!
> >=20
> > Less than minute later:
> >=20
> > mmusb-hdrc.0.auto: Babble
> > USB disconnect
>=20
> The babble is most likely caused by some kind of signaling issue.
>=20
> > I unplug, replug usb (not at the phone, between hub and dongle, and
> > green LED indincating charging starts blinking rapidly.
> >=20
> > cpcap-core spi0.0: EOT timed out.
> >=20
> > I try plug/replug, and now green led is on.
> >=20
> > I unplug replug at the phone, and get bunch more of messages:
> >=20
> > musm _set_peripheral: already in peripheral mode: 99
> > musm _set_peripheral: already in peripheral mode: 81
> > musm _set_peripheral: already in peripheral mode: 81
> >=20
> > musb_set_host: could not set host: 99
> > musb_set_host: could not set host: 99
> > musb_set_host: could not set host: 99
> > musb_set_host: could not set host: 99
> > musb_set_host: could not set host: 99
> > musb_set_host: could not set host: 99
> > musb_set_host: could not set host: 99
> > musb_set_host: could not set host: 99
> >=20
> > Unplug/replug at host, and again, hub+mouse is detected.
> >=20
> > I unplug power connected to one of USB hub's ports... and find out
> > that phone was _not_ powering it.
> >=20
> > Ok... so something somehow works.... sometimes :-).
>=20
> My guess is you're missing a USB micro-B cable with ID pin
> grounded, with that things should just work automagically.
>=20
> So no need for hubs feeding back VBUS and no need to
> try to force host mode via sysfs unlike on n900.

I don't think so... I got it to run in the end (and I have to
apologize, it seems to work at least as long as it is plugged it an
boot and not touched).

So... I actually have two cables.

#1 definitely does not have ID pin grounded. That does not work, not
 even in original android.

#2 definitely has _something_, because it does work in original
 android. But not even original android provides VBUS (5V on USB) in
 that configuration. It also looks like hardware _can_ provide at
 least VBAT on VBUS, because I seen that during some of the crashes.

Thanks for the patches, BTW.

Best regards,
							Pavel

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1uHz0ACgkQMOfwapXb+vI8kQCfWjqHD6BViWkC1q4L9fI15UAQ
Qh4An13nqS6ckdJuwgGnVBBNs7BsTTwI
=WbNt
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
