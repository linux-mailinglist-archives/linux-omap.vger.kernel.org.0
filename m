Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE122E27D4
	for <lists+linux-omap@lfdr.de>; Thu, 24 Dec 2020 16:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbgLXO7p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Dec 2020 09:59:45 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35460 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgLXO7p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Dec 2020 09:59:45 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 141511C0B96; Thu, 24 Dec 2020 15:59:02 +0100 (CET)
Date:   Thu, 24 Dec 2020 15:59:01 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>, phone-devel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20201224145901.GA13643@duo.ucw.cz>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200423153756.GE37466@atomide.com>
 <20200528082420.GA10358@localhost>
 <20201220224816.GA28213@duo.ucw.cz>
 <20201224080239.GF26857@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20201224080239.GF26857@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > My notes say:
> >=20
> > /dev/motmdm1 -- basic support, calls, on/off                           =
        =20
> > /dev/motmdm3 -- send sms interface                                     =
        =20
> > /dev/motmdm9 -- receive sms interface                                  =
        =20
> >
> > (and gsmtty numbering is same)
>=20
> Yes I have not had a chance to look at these for several months now,
> but have the latest set in droid4-pending-v5.10 branch in my github
> tree.
>=20
> The gnss device is at /dev/gsmtty6, see the current droid4-agps tool
> to upload the almanac also on github. That's has turned out to be a
> pretty good gsm serdev test too :)

Thanks a lot for the info! Is it this one?
https://github.com/tmlind/droid4-agps . GPS worked for me even w/o
AGPS support, but I broke even that, so I need to fix that first.

> > For now I converted gnss driver to use serdev interface, and n_gsm to
> > provide it... Not yet finished but I believe I'm walking in the right
> > direction.
>=20
> Great, sounds good to me if you got things working with just serdev
> calls :) I'll try to take a look at this stuff again after I have
> the other pending droid4 issues out of the way like v5.12 charger
> and keyboard stuff.

Just ask for latest code :-). I still believe I'm going right
direction, but now I understand why you did it the way you did. Sound
code needs to listen on gsmtty1, with the data still being provided
for userspace.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+SstQAKCRAw5/Bqldv6
8q2XAKC32dUkwQADDsKasbqBoLCsPuZZWACeMPhDNUkIk389F+IIFLew3RD5ScE=
=CsTh
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
