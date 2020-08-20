Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B1024AF81
	for <lists+linux-omap@lfdr.de>; Thu, 20 Aug 2020 09:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgHTHAu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Aug 2020 03:00:50 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42922 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgHTHAt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Aug 2020 03:00:49 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BBF1C1C0BD5; Thu, 20 Aug 2020 09:00:46 +0200 (CEST)
Date:   Thu, 20 Aug 2020 09:00:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     maemo-leste@lists.dyne.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: GPS fun on Droid 4 and leste
Message-ID: <20200820070045.GB9738@amd>
References: <20200712092726.GC13495@amd>
 <20200820042431.GI2994@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <20200820042431.GI2994@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > GPS on the droid 4 does not really work out of the box.
> >=20
> > gpsd is not in default installation, maybe it should be?
> >=20
> > What is worse, there's something broken with gpsd. Try:
> >=20
> > /usr/sbin/gpsd -N -D 5 /dev/gnss0
> > gpspipe -w
> > # this seems to work, but do ^C and restart
> > gpspipe -w
> > ...and it hangs.
>=20
> Some earlier versions of gpsd I think had issues where you could
> only connect one client. Or it was a bug in the kernel drivers..
> Anyways, multiple gpspipe instances have been working for me for
> a while now with gpsd-3.21.
>=20
> I also found some issues in gnss-motmdm driver for closing the
> gnss device, see:
>=20
> https://github.com/tmlind/linux/commits/droid4-pending-v5.8
>=20
> And I think the xtra2.bin data for agps is now working too :)
>=20
> https://github.com/tmlind/droid4-agps/commits/master
>=20
> At least I now get a fix in about two minutes after running the
> update.sh, going outside, and starting cgps.

Ok, let me play. But you should be getting fix in two minutes
_without_ AGPS support, if GPS is any good...

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8+H50ACgkQMOfwapXb+vIqogCgmdMbsFL3VMG8vdt7AwZd+YGs
/l0AoIORJDoZjrNtjT4mv0rLTzaQnZuI
=drNP
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
