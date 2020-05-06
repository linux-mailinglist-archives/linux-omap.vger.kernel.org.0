Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1661C7DB7
	for <lists+linux-omap@lfdr.de>; Thu,  7 May 2020 01:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgEFXF2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 May 2020 19:05:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48776 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgEFXF1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 May 2020 19:05:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 488E41C0241; Thu,  7 May 2020 01:05:26 +0200 (CEST)
Date:   Thu, 7 May 2020 01:05:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: USB networking news, ofono for d4: less hacked version
Message-ID: <20200506230525.GA22354@amd>
References: <20200506101125.GA7490@amd>
 <20200506144338.GT37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20200506144338.GT37466@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-05-06 07:43:38, Tony Lindgren wrote:
> * Pavel Machek <pavel@ucw.cz> [200506 10:12]:
> > Hi!
> >=20
> > So... I found out that USB networking works way better when I don't
> > attempt to charge the phone at the same. Yes, green light was
> > blinking.
>=20
> OK yes we don't have much of a charger detection currently and the
> charger tries to reconnect with the LED blinking rapidly with an
> empty battery.

Do you have an idea why that causes problems with usb data connection?

I created a script to disable charging -- and that works. I also found
out cable about 5cm long. Not nice to use, but works significantly
better w.r.t. charging.

> > To github.com:pavelmachek/ofono.git
> >    e7b58fdd..1e7e5ce3  mux-v1.19-2 -> mux-v1.19-2
> >=20
> > which creates copy of atchat, so I don't damage existing
> > functionality. It still seems to somehow work. Lot more work is still
> > needed. Designed to work with latest kernel patches from Tony, using
> > gsmmux interfaces.
>=20
> OK, sounds like that should work :)

As I said, still ton of work to do :-(.

> I still need to figure update audio notifications for the current set of
> gsmmux patches. Eventually maybe ofono can just set the voice call audio
> routing using alsa. But let's get the kernel notifications working first
> as we also need to fix up the audio parts for the earlier comments from
> Peter and Sebastian.

Ofono does not normally touch ALSA, so I'd prefer not to do it from
there.

But I might be confused. I recall some audio patches were needed for
basic phone calls (setting up mixers to connect gsm<->audio), but
those worked before gsmux support was enabled. (Maybe some hardcoded
commands were needed to be sent to gsmmux somewhere).

I assume neither gsmmux audio parts nor mixer parts are available in
-next at the moment?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6zQrUACgkQMOfwapXb+vJF1QCgqarLMWC4FO5LgMlW6LlCOlI2
dhkAnRHc+zX0noNocp+CI5Hd0uRb0qFk
=gjFT
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
