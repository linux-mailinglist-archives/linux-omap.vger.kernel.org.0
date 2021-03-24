Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68052347CD4
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 16:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236581AbhCXPmw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 11:42:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236520AbhCXPmW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 11:42:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C49E960240;
        Wed, 24 Mar 2021 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616600541;
        bh=C3CE8848+YiYGz5Xm7USW9W7xH+y0vUp3QE+4rjZ2Ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ukpQl/fGlOKL39x8EukhhVtK+MSYqIImAroMgzeY/6fZusD3ly5JHWmigYzLTmVQq
         a72P/gLfZlkvJOCRsgIFiN8hOIEMfM1s6yr8ZrTgxE4D32S9Ary5JGZ5cdBtGkLWHg
         zBAztvWyo9NeeVwYGKBWrpBe1Zq5b1RXBekDqFemMB8BuRrgE3EQ2SNP9oZ/+WW4Cj
         1daW5wcX8bjsInnwmYWorRWBVnp3rsjSPs9CXdO/wdQ+Yb1dsgCxPbuVW8NWyriFUZ
         1E/YsdzLr++SBv99xHMpt0bHPfK0Dfgc8Jt6QZYUdeBwhVafIErGzhB91wr+t1kVFn
         zFpoUZvpheoJA==
Received: by earth.universe (Postfix, from userid 1000)
        id C46BE3C0C96; Wed, 24 Mar 2021 16:42:19 +0100 (CET)
Date:   Wed, 24 Mar 2021 16:42:19 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/5] ARM: dts: add battery phandle to cpcap_charger
Message-ID: <20210324154219.m4xwm3bayzlele6e@earth.universe>
References: <20210117224502.0f9a0e80dfd4841ad26a9914@uvos.xyz>
 <YFsoWjUYhhzo5Tdo@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opbgvjqo5takw7y5"
Content-Disposition: inline
In-Reply-To: <YFsoWjUYhhzo5Tdo@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--opbgvjqo5takw7y5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 24, 2021 at 01:54:02PM +0200, Tony Lindgren wrote:
> * Carl Philipp Klemm <philipp@uvos.xyz> [210117 23:45]:
> > --- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> > +++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> > @@ -61,6 +61,7 @@ &cpcap_adc 2 &cpcap_adc 5
> >  			io-channel-names =3D "battdetb", "battp",
> >  					   "vbus", "chg_isense",
> >  					   "batti";
> > +			battery =3D <&cpcap_battery>;
> >  		};
>=20
> This seems like good standard stuff to have, picking up this patch into
> omap-for-v5.13/dt thanks.
>=20
> Tony

This was btw. one of the patches that finally made me convert all
the binding files to YAML. This patch will now result in warning
being printed when you run 'make dtbs_check', since the binding has
not been updated.

I did not yet have time to review the patchset properly, so I have
not yet replied (partely, because of being busy with the YAML
stuff).

I think the patch is also wrong, since the information is already
described in DT - just the other way around: The battery references
the charger. This provides all required information to the kernel
for a 1:1 link.

-- Sebastian

--opbgvjqo5takw7y5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBbXdQACgkQ2O7X88g7
+prodQ/1Hg8cr07xH95ven0iOw3T9xJxX1D3BsbWgaJvCmM/HP2f1VPg/gE3r6iL
3bfmRJdhpY0pzwo1+WtOhh8Sllm+nqcMWd5Arcx9QFVxhDKwo/XldSC0DixAWEDU
3iQODzKBcYBqRC27sbeqsOdfUsPk4e9MYCCT5O1xlgoyKQmd6ZVF/nVP9e9k/ID/
1Geu2HctFs7uV3R95AoxfzLHsBc15WW8byfb64qDCw4D8p46brvnv7I00ZRzCXoJ
1eFeZ9HyDibHxOG2kw1X+n7sD14hy72xVansqkIPgv6BjYKyoxi+nYGk1vgzcnd/
kTjVEx2Hf+pVD0zS4LhuLUgqeToXwSXFYA9IRdg9urA0DcacZfAyPnw1/bbn31Xr
rfMqb10TdEJ0tJs4JKesQoPEwtk8vUu00kIZLrbC67zEGmKHrAf50e3wEPwiFzaY
XkbSbI+KZ/VFPfWFDHGheb+KG88Jb442cxoCvVTAEe4OQ74T3oy1S8T//OTFqwc5
W6V+t148jKKfpKKfNyjYFucPkx42Fzqfn0rf5RFhzLzDKqH0pIRREOY5TkoRsCSZ
pqxheBb4rAsC9gEPrPSg8+YPU4WyoPSKexKJBS7qdVhD/1H1RkZIvp6HRpd8np1P
CL+o23Bm65CDKBPBGh7VjVv7Cm/VOStectIsvfrj84ATB5JdGA==
=Lu5T
-----END PGP SIGNATURE-----

--opbgvjqo5takw7y5--
