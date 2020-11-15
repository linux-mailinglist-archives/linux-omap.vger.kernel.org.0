Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3BF2B37FD
	for <lists+linux-omap@lfdr.de>; Sun, 15 Nov 2020 19:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgKOSry (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Nov 2020 13:47:54 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40454 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbgKOSry (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Nov 2020 13:47:54 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BA5111C0B9E; Sun, 15 Nov 2020 19:47:52 +0100 (CET)
Date:   Sun, 15 Nov 2020 19:47:52 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: v5.10-rc3 vs. Droid 4
Message-ID: <20201115184752.GC32085@duo.ucw.cz>
References: <20201114205744.GA7436@duo.ucw.cz>
 <20201115083126.GX26857@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline
In-Reply-To: <20201115083126.GX26857@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Does anyone have Droid 4 working with 5.10-rc3?
> >=20
> > I tried it with the original config; I got message about culomb
> > counter calibration done scrolling (and boot progressing very slowly
> > or not at all) . So ... I disabled cpcap battery & charger
> > support. But init still drops me to emergency shell.
> >=20
> > I may try some more, but if someone know what is going on, let me
> > know.

I get at least three backtraces in dmesg... hmm. Four.

regmap/regmap.c: 3024 regmap_update_bits.
regulator/core.c put_part.2
regmap.c: 3024 again.

The last one is "WARNING: CPU: 1 PID: 55 at
drivers/net/...wlcore/sdio.c... raw_read+0x88.

I'm in emergency shell ... I don't even have "|" in the keymap, so
reading dmesg is ... not fun.

Hmm.. And now I'm getting backtraces once per second... "Framedone not
received for 250ms".

It seems something is detecting mmc1 at 480ad000, pushing my root to
mmcblk2 and breaking stuff...?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX7F32AAKCRAw5/Bqldv6
8ttSAJ40gvsCvqRINUpBgfb/z7OYXu8HBACgjY7QvqmaGV14IC2IWHJSd79Yo7w=
=9GM9
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
