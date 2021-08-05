Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC003E108B
	for <lists+linux-omap@lfdr.de>; Thu,  5 Aug 2021 10:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhHEIsY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Aug 2021 04:48:24 -0400
Received: from muru.com ([72.249.23.125]:35994 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232009AbhHEIsY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Aug 2021 04:48:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 036C68061;
        Thu,  5 Aug 2021 08:48:29 +0000 (UTC)
Date:   Thu, 5 Aug 2021 11:48:08 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Paul Barker <paul.barker@sancloud.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add support for the SanCloud BBE Lite
Message-ID: <YQulyGLNNkyYcBSY@atomide.com>
References: <20210720083928.10404-1-paul.barker@sancloud.com>
 <YP/J+YC6GFeH+I5j@atomide.com>
 <20210804115221.5650e440.paul.barker@sancloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LM9XEI8L+5xUn6r5"
Content-Disposition: inline
In-Reply-To: <20210804115221.5650e440.paul.barker@sancloud.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--LM9XEI8L+5xUn6r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Paul Barker <paul.barker@sancloud.com> [210804 10:52]:
> On Tue, 27 Jul 2021 11:55:21 +0300
> Tony Lindgren <tony@atomide.com> wrote:
>=20
> > * Paul Barker <paul.barker@sancloud.com> [210720 11:40]:
> > > The Lite variant of the SanCloud BeagleBone Enhanced (BBE) removes the
> > > HDMI encoder, barometer and accelerometer chips and adds a Micron
> > > Authenta SPI flash chip. =20
> >=20
> > Thanks applying all for v5.15 merge window.
>=20
> I tested the for-next branch of linux-omap to confirm that things
> worked with these patches applied. There was a NULL pointer
> dereference in ptp_clock_register() during boot. The fix appears to be
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D55eac20617ca84129273ab248f4d7bfe456967de
> which went into 5.14-rc2.

Yeah so it seems, too bad it was not there for -rc1 already.

> Merging for-next with 5.14-rc4 resulted in things working as expected.

OK thanks for checking.

Regards,

Tony



--LM9XEI8L+5xUn6r5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkgNvrZJU/QSQYIcQG9Q+yVyrpXMFAmELpcgACgkQG9Q+yVyr
pXNH8RAAyABpBrVjH86mulZbiTQVaChUTMxQhcUcDPDYfNQAvqd6nfO3EFv4YoW7
gCbDD1EBqarwd5/7KWg7MNChtUZ/tjnrFjqjpGo0UD/bjUjYdepAChHYpvuyk4ac
v6+jSdFjIV70iraoPGGRy1qR1DEO1IsO0dMLsBsf9t8VU60a9IBdT4gEh8d84SdS
dNIBDHb+pPbrlSoKwWE/THh9xIVA5byZtbTn97NXaPNnmIG3OMw1Ndj1hoWh5lOs
6oHUyfadvRM8oB8WQlRjIYjnNRzMBI+8Tu5qqDD1wjS3NLTn06cHkRtCHUvklhoq
BY+9vaTl8Zl6PTZIpMc+nVDpuwmfRZaFUte98e+0n2P2MOT/8osRVl67+6hIog+T
OpI4ONHa8QX/i83GypviXH1LNj5UqXE8wyyVxmEpM1RG5EofDh/LxopU4PzTCDfE
h6HW2PEFttt3RE/gvUldpx/GGxjnnleHj1nBCITv7PMi5z7dxl4I+azKzPATjDHQ
+0l32nd26yooKCp1F9FpgwU71Q+7jyl5c9zzk3Glxv/m0CdDyzaDadN67IGclXNx
eeGe4LRNq9ETCc8hTuGepdpgk5581BzvPd8qguBKotnYoQGV0rQOERFwXAt1TPAw
tBQ422Y3aOGHLpEPFCelXZrtCdLlmvvDdDTF+jybOj9hmrDWroI=
=KlWf
-----END PGP SIGNATURE-----

--LM9XEI8L+5xUn6r5--
