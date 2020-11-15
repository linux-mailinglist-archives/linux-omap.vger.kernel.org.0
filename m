Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14432B3769
	for <lists+linux-omap@lfdr.de>; Sun, 15 Nov 2020 18:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgKORtN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Nov 2020 12:49:13 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35972 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgKORtM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Nov 2020 12:49:12 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3B28F1C0B9E; Sun, 15 Nov 2020 18:49:10 +0100 (CET)
Date:   Sun, 15 Nov 2020 18:49:09 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: v5.10-rc3 vs. Droid 4
Message-ID: <20201115174909.GB32085@duo.ucw.cz>
References: <20201114205744.GA7436@duo.ucw.cz>
 <20201115083126.GX26857@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <20201115083126.GX26857@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
> >=20
> > Does anyone have Droid 4 working with 5.10-rc3?
> >=20
> > I tried it with the original config; I got message about culomb
> > counter calibration done scrolling (and boot progressing very slowly
> > or not at all) . So ... I disabled cpcap battery & charger
> > support. But init still drops me to emergency shell.
> >=20
> > I may try some more, but if someone know what is going on, let me
> > know.
>=20
> I ran into this too, sorry I thought I added you to Cc but looks like not.
> See the fix here:
>=20
> https://lore.kernel.org/lkml/20201111170613.46057-1-tony@atomide.com/

You did (thank you!) but I failed to realize importance of that
email. I have tested it and the culomb counter messages are gone.

Good.

But it looks like my mmcblk interfaces got re-numbered, from mmcblk0 &
mmcblk1 to mmcblk0 & mmcblk2. ... which breaks my startup. If someone
knows what is going on there, please tell me :-).

Best regards,=20
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX7FqFQAKCRAw5/Bqldv6
8rq5AJsGb6vcyG0RSDM1QcZXNk5OHU9QJQCfVK/qDU8HJWmiKDsY42Mnau1/1G0=
=guwv
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
