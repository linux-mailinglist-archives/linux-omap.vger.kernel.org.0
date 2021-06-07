Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2437C39DB42
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jun 2021 13:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhFGL3o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Jun 2021 07:29:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39138 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhFGL3n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Jun 2021 07:29:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 0A9E21F421AD
Received: by earth.universe (Postfix, from userid 1000)
        id 173B83C0C95; Mon,  7 Jun 2021 13:27:49 +0200 (CEST)
Date:   Mon, 7 Jun 2021 13:27:49 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] power: supply: cpcap-battery: kconfig: depend on
 ( NVMEM || !NVMEM )
Message-ID: <20210607112749.fybn34mahaf4w5te@earth.universe>
References: <20210423145702.e31dd7be8843d97195f98bd3@uvos.xyz>
 <20210604125540.zfhpffdxft3ug46d@earth.universe>
 <20210607130137.0df783dce66301510894a7cc@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g45xdaklu4bz455q"
Content-Disposition: inline
In-Reply-To: <20210607130137.0df783dce66301510894a7cc@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--g45xdaklu4bz455q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 07, 2021 at 01:01:37PM +0200, Carl Philipp Klemm wrote:
> > This is missing a long patch description, but needs to be squashed
> > into PATCH 1/2 anyways.
> >=20
> > Thanks,
> >=20
> > -- Sebastian
>=20
> Im thinking I would rather just drop this entirely, since at least I
> and one other user use cpcap-battery with a 3rd party battery with no
> nvmem, and Tony and Merlijn use it with a lab power supply.
>=20
> In these cases requireing NVMEM makes no sense and the code in=20
> "power: supply: cpcap-battery: Add battery type auto detection
> for mapphone devices" works fine without.

"depends (NVMEM || !NVMEM)" does not add a NVMEM dependency. It just
disallows the configuration of built-in cpcap-battery and modular NVMEM,
which does not work:

NVMEM=3Dy CPCAP_BATTERY=3Dy =3D> valid
NVMEM=3Dy CPCAP_BATTERY=3Dm =3D> valid
NVMEM=3Dy CPCAP_BATTERY=3Dn =3D> valid
NVMEM=3Dn CPCAP_BATTERY=3Dy =3D> valid
NVMEM=3Dn CPCAP_BATTERY=3Dm =3D> valid
NVMEM=3Dn CPCAP_BATTERY=3Dn =3D> valid
NVMEM=3Dm CPCAP_BATTERY=3Dy =3D> invalid
NVMEM=3Dm CPCAP_BATTERY=3Dm =3D> valid
NVMEM=3Dm CPCAP_BATTERY=3Dn =3D> valid

But checking the NVMEM config option it's bool instead of tristate
and cannot be modular anyways. Thus its fine to drop this, since
it's useless.

-- Sebastian

--g45xdaklu4bz455q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmC+AqYACgkQ2O7X88g7
+prNRg/+Kx8Bj0o15Jiqnl89qwtacTqihlNEBbXeu2zjiIZobm2AVrsF8IEsI6nZ
OlmkaZakUW17yAxdrxiog7SFEBWGsHc+Uvf2+mQNSQ6ECGdO3CKd3fxt3zidlGA5
Rr1TVVFNUf6Bc7MfcqLXg8z/NypQ0gxEb+nCs4RB1dWQyZ+5ILGsGn/cQ0lZ10ZQ
9MCEk8qhkvBydhzikbvf1qJ+iY0tygPeuTU8Vtz9jyvsTgwx9yKmrPU0zW5sC/Cb
KaQejNUGRnA7dti0bQfVXvrXiFtUC2oXX7XARkXJ813rnKaSBC8PWTcThxI+BWEs
6M3HK3o8KSSg7TQoES3f9+In36wkNb/L8zVbEMdlozjKzWyYY93zJV/riigdtn2u
JZiT4TpsNzTWpSKU4mjQmV6Y8XgYbfW8QsWseMBDuuWY/1XGyN46RC4vYWbkQ3rG
ziri68w9xiu2njGQyJOTkD2hqaOSq1HDmnW5VjR56t4+IAJrNxFC5bynLk/swZqO
CpEg/rRIh9UfepwsuteLyoq6SLlnkRmRVRCdtKabfdZL9WuXVWnkbLbeX0q7kpdu
ok7XEYPsiB/ZteRtX0GmMCmNVyXEnPNGu/1ZUnxGK2XqY2Q9HIPYPxpNfo1pVln0
3K57qf84SvDCZC/0BluLODuFnG47f/765Fs/wawTvvO1kRKGbW8=
=dZSy
-----END PGP SIGNATURE-----

--g45xdaklu4bz455q--
