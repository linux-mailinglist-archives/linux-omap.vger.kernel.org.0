Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971A13E8A2D
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 08:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234674AbhHKGW4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Aug 2021 02:22:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33384 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234609AbhHKGW4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Aug 2021 02:22:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BAF201C0B76; Wed, 11 Aug 2021 08:22:31 +0200 (CEST)
Date:   Wed, 11 Aug 2021 08:22:31 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@denx.de>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix error handling for
 sysc_check_active_timer()
Message-ID: <20210811062231.GA16241@duo.ucw.cz>
References: <20210811061053.32081-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <20210811061053.32081-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-08-11 09:10:53, Tony Lindgren wrote:
> We have changed the return type for sysc_check_active_timer() from -EBUSY
> to -ENXIO, but the gpt12 system timer fix still checks for -EBUSY. We are
> also not returning on other errors like we did earlier as noted by
> Pavel Machek <pavel@denx.de>.
>=20
> Commit 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with
> reserved status") should have been updated for commit 65fb73676112
> ("bus: ti-sysc: suppress err msg for timers used as clockevent/source").
>=20
> Let's fix the issue by checking for -ENXIO and returning on any other
> errors as suggested by Pavel Machek <pavel@denx.de>.
>=20
> Fixes: 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with res=
erved status")
> Depends-on: 65fb73676112 ("bus: ti-sysc: suppress err msg for timers used=
 as clockevent/source")
> Reported-by: Pavel Machek <pavel@denx.de>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Pavel Machek (CIP) <pavel@denx.de>

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYRNspwAKCRAw5/Bqldv6
8s23AJ9BjLJOmtII04M5RH+LmjUDyQSyogCeJrgFXvRYcUo8RUS9OXm9t6cmozA=
=WWdc
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
