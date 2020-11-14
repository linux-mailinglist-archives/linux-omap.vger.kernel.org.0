Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3622B30D6
	for <lists+linux-omap@lfdr.de>; Sat, 14 Nov 2020 21:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgKNU5r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Nov 2020 15:57:47 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:56874 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgKNU5r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Nov 2020 15:57:47 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 76D6B1C0B7A; Sat, 14 Nov 2020 21:57:44 +0100 (CET)
Date:   Sat, 14 Nov 2020 21:57:44 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: v5.10-rc3 vs. Droid 4
Message-ID: <20201114205744.GA7436@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Does anyone have Droid 4 working with 5.10-rc3?

I tried it with the original config; I got message about culomb
counter calibration done scrolling (and boot progressing very slowly
or not at all) . So ... I disabled cpcap battery & charger
support. But init still drops me to emergency shell.

I may try some more, but if someone know what is going on, let me
know.

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX7BEyAAKCRAw5/Bqldv6
8nU0AKCUr1S/ighczyl1ewXmZrdJuaNQaACfbDktonMBsc/0K45ZiNiAc5ptzB8=
=FJiT
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
