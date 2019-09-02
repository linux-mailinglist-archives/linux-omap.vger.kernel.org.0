Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD782A532C
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 11:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbfIBJoL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 05:44:11 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55233 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729668AbfIBJoL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 05:44:11 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 010FC8113B; Mon,  2 Sep 2019 11:43:54 +0200 (CEST)
Date:   Mon, 2 Sep 2019 11:44:08 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Pavel Machek <pavel@denx.de>
Cc:     Tony Lindgren <tony@atomide.com>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 0/4] musb host improvments mostly for omap2430 glue
Message-ID: <20190902094408.GB31410@amd>
References: <20190830232058.53414-1-tony@atomide.com>
 <20190902092344.GA31410@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <20190902092344.GA31410@amd>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-09-02 11:23:44, Pavel Machek wrote:
> Hi!
>=20
> > So I ended up cleaning up omap2430 glue layer a bit for host mode with =
the
> > various reproducable errors I was seeing docking droid4 to a lapdock. T=
here
> > are a few fixes, and then we end up removing all the devctl register ti=
nkering
> > for omap2430 glue layer.
>=20
> I should have your recent patches up-to [PATCH] power: supply:
> cpcap-charger: Enable vbus boost voltage applied to linux-next, -0830.
>=20
> So... to get usb host to work even with stock kernel, I need a hub and
> external power... and "right" cable between phone and hub.
>=20
> When I plugged/unplugged it several times, I got
>=20
> ### usb unplug:
> musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
> musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
> ub0: stop stats: rx/tx 0/0, errs 0/0
> l3_init_cm:clk:0040:0: failed to disable
> l3_init_cm:clk:00c0:0: failed to disable
> ### usb plug produces nothing
> ### usb unplug:
> musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
> musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
>=20
> Hmm. I did it two more times, and now machine rebooted, and USB was
> powered from the phone for a while (3.6V).
>=20
> And I reproduced the crash on the next boot.
>=20
> Is there anything I may be missing in .config?

Hmm. I guess CONFIG_USB_MUSB_DUAL_ROLE=3Dy might be useful.

And now... if I unplug/replug the usb after the boot, USB hub and
mouse are recognized. Good!

Less than minute later:

mmusb-hdrc.0.auto: Babble
USB disconnect

I unplug, replug usb (not at the phone, between hub and dongle, and
green LED indincating charging starts blinking rapidly.

cpcap-core spi0.0: EOT timed out.

I try plug/replug, and now green led is on.

I unplug replug at the phone, and get bunch more of messages:

musm _set_peripheral: already in peripheral mode: 99
musm _set_peripheral: already in peripheral mode: 81
musm _set_peripheral: already in peripheral mode: 81

musb_set_host: could not set host: 99
musb_set_host: could not set host: 99
musb_set_host: could not set host: 99
musb_set_host: could not set host: 99
musb_set_host: could not set host: 99
musb_set_host: could not set host: 99
musb_set_host: could not set host: 99
musb_set_host: could not set host: 99

Unplug/replug at host, and again, hub+mouse is detected.

I unplug power connected to one of USB hub's ports... and find out
that phone was _not_ powering it.

Ok... so something somehow works.... sometimes :-).

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1s5GgACgkQMOfwapXb+vLotwCgwkzOUPcVuc3XPrWdjciiSLSI
ab0AoJGKsPcUhCM5OEn1tXBTFdSCO9Ly
=f/tz
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
