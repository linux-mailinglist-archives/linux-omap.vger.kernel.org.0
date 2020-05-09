Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820A31CC426
	for <lists+linux-omap@lfdr.de>; Sat,  9 May 2020 21:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgEITgR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 May 2020 15:36:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53810 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgEITgR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 May 2020 15:36:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5742B1C025E; Sat,  9 May 2020 21:36:15 +0200 (CEST)
Date:   Sat, 9 May 2020 21:36:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: ofono for d4: less hcked and more working version was Re: USB
 networking news, ofono for d4: less hacked version
Message-ID: <20200509193614.GA16530@amd>
References: <20200506101125.GA7490@amd>
 <20200506144338.GT37466@atomide.com>
 <20200506230525.GA22354@amd>
 <20200507140732.GU37466@atomide.com>
 <20200508100211.GA19646@amd>
 <20200509143111.GC37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <20200509143111.GC37466@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-05-09 07:31:11, Tony Lindgren wrote:
> * Pavel Machek <pavel@ucw.cz> [200508 10:03]:
> > I pushed new version of ofono: I'm still not sure about those incoming
> > sms (but _some_ sms are received). Rest should be better.
>=20
> Please check that you have applied commit 738b150ecefb ("ARM: dts:
> omap4-droid4: Fix occasional lost wakeirq for uart1"), otherwise incoming
> SMS may not always show up, and GPS can stop producing data.

Thanks for support. But problem is not that SMS fails to come. Problem
is that it comes over and over and over again. It takes few minutes.

Now it is 20:40, and I got:

{MessageManager} [/motmdm_1] IncomingMessage Vazeny zakazniku, bylo
Vam vygenerovane nasledujici jednorazove heslo pro pristup do
samoobsluhy: 947xxx ({ LocalSentTime =3D 2020-05-09T20:38:38+0200,
SentTime =3D 2020-05-09T20:38:38+0200, Sender =3D Tescomobile })

I believe that I'll get it again in half an hour or something. Then I
reboot to stock rom, and will receive it for one final time. (Unless
my last hack worked.).

Hmm, hour has passed, and no message. Interesting. Maybe I finally got
it right?

> Hmm for ofono motchat, why not handle the U0000 part directly in motchat
> and use just a timestamp based ID there?

Yes, that's possible future improvement :-). I plan to get it to work,
first...

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl63Bi4ACgkQMOfwapXb+vKuFwCfeeq2Ghuj7d8OiS8QCGIebVTC
vTYAoI+iKMGp3mq4s+0qmVdMIR3m2vd2
=FKO9
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
