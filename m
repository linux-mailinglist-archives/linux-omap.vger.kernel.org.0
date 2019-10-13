Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30DE1D568C
	for <lists+linux-omap@lfdr.de>; Sun, 13 Oct 2019 17:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbfJMPH5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Oct 2019 11:07:57 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45486 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729269AbfJMPH5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Oct 2019 11:07:57 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id DB11F80239; Sun, 13 Oct 2019 17:07:39 +0200 (CEST)
Date:   Sun, 13 Oct 2019 17:07:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 2/8] ARM: OMAP2+: Drop bogus wkup domain oswr setting
Message-ID: <20191013150744.GD13278@amd>
References: <20191010001224.41826-1-tony@atomide.com>
 <20191010001224.41826-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline
In-Reply-To: <20191010001224.41826-3-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The wkup domain is always on and does not have logic off setting. This
> got accidentally added by commit f74297dd9354 ("ARM: OMAP2+: Make sure
> LOGICRETSTATE bits are not cleared") but is harmless.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/mach-omap2/pm44xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-omap2/pm44xx.c b/arch/arm/mach-omap2/pm44xx.c
> --- a/arch/arm/mach-omap2/pm44xx.c
> +++ b/arch/arm/mach-omap2/pm44xx.c
> @@ -137,8 +137,7 @@ static int __init pwrdms_setup(struct powerdomain *pw=
rdm, void *unused)
>  	 * smsc911x at least if per hits retention during idle.
>  	 */
>  	if (!strncmp(pwrdm->name, "core", 4) ||
> -	    !strncmp(pwrdm->name, "l4per", 5) ||
> -	    !strncmp(pwrdm->name, "wkup", 4))
> +	    !strncmp(pwrdm->name, "l4per", 5))
>  		pwrdm_set_logic_retst(pwrdm, PWRDM_POWER_RET);

This is rather theoretical, but if the powerdomain is called
"corelation-not-causation", do you still want the if() to trigger?

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jPcAACgkQMOfwapXb+vLvaQCfZphVuGB+26TYrQM9wURB4MpE
ujoAoJwodeejH3c14UMdTuuo+wICdQj0
=FiNP
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
