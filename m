Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEAE1CA7CE
	for <lists+linux-omap@lfdr.de>; Fri,  8 May 2020 12:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgEHKCP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 May 2020 06:02:15 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39366 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgEHKCO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 May 2020 06:02:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B78641C0257; Fri,  8 May 2020 12:02:12 +0200 (CEST)
Date:   Fri, 8 May 2020 12:02:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: ofono for d4: less hcked and more working version was Re: USB
 networking news, ofono for d4: less hacked version
Message-ID: <20200508100211.GA19646@amd>
References: <20200506101125.GA7490@amd>
 <20200506144338.GT37466@atomide.com>
 <20200506230525.GA22354@amd>
 <20200507140732.GU37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20200507140732.GU37466@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > But I might be confused. I recall some audio patches were needed for
> > basic phone calls (setting up mixers to connect gsm<->audio), but
> > those worked before gsmux support was enabled. (Maybe some hardcoded
> > commands were needed to be sent to gsmmux somewhere).
>=20
> We're currently reconfiguring the TDM transport that based on the
> unsolicited messages on dlci1. I still need to figure out how to add
> that back while keeping the serdev-ngsm driver generic.

Is it really neccessary? I believe I was simply configuring codecs for
voice call and left them like that.

> > I assume neither gsmmux audio parts nor mixer parts are available in
> > -next at the moment?
>=20
> Sorry not yet, will post as soon as I have the audio notifiers part
> working, so it will be some days away still with time permitting.

Thanks... feel free to cc me.

I pushed new version of ofono: I'm still not sure about those incoming
sms (but _some_ sms are received). Rest should be better.

Best regards,
								Pavel

user@devuan:/my/ofono$ git push
Counting objects: 5, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 479 bytes | 0 bytes/s, done.
Total 5 (delta 4), reused 0 (delta 0)
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
To github.com:pavelmachek/ofono.git
   606faf92..f6f43041  mux-v1.29-3 -> mux-v1.29-3


commit f6f43041ab33e2b811b73d4009ecfa0692d192aa
Author: Pavel <pavel@ucw.cz>
Date:   Fri May 8 11:57:04 2020 +0200

    Trivial fix for incoming calls. Now basic functionality should
    work.

commit 606faf92c289166a5577963f1f987bc321edd226
Author: Pavel <pavel@ucw.cz>
Date:   Fri May 8 11:45:32 2020 +0200

    Got enough of netreg to work for ofone to talk to us.

    Incoming calls do NOT seem to work.

    Outgoing calls seem ok.

    Incoming SMS seem ok.

    Outgoing SMS seem ok.
   =20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl61LiMACgkQMOfwapXb+vLIZQCfTkdEtzhMK9+vPZc7yt/nH1EU
WJkAoKMnCPPHidDjAa969bgYAVkr7rSo
=qz9P
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
