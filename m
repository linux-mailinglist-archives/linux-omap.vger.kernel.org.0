Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE39521E799
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 07:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgGNFhA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 01:37:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgGNFhA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Jul 2020 01:37:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5Tm90d2cz9sQt;
        Tue, 14 Jul 2020 15:36:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594705017;
        bh=43nxw++z+R/eGBwxjSsH/v1ykHEiSFEa3zq/PArVSjc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GcTUbvetIM+JVD5zLxQVUtDNJJ5lAyUxnX/+nWmXWmgZxOnlqY0w5OVDeLTyTQLn/
         as7EspbnqP2R3ks1Iwhm1b36R/4isGNY6bnszC3tOoVZvcf5c/GzqYhonFUYniDnG3
         GUVEPHqz7rG7m43cP0W+rz4Q95bWcwDnOsHkQ/LNviehpyzhoaV2vgIY6dO4ifP7CD
         MkI46vU8blnc+NbZ9N29XQQrZVqkFtp/VmSVVyq3wK1dk3ZtGomfVNdEAMbdfTG5WF
         e9c5bebZl59VCTz0j9sMosGX5C73wjK19GrDirGFPCgLUd6fG2M/dcq2seIHEml8yn
         YZZmdKE8rGJBg==
Date:   Tue, 14 Jul 2020 15:36:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     dillon min <dillon.minfei@gmail.com>
Cc:     Benoit Cousson <bcousson@baylibre.com>, tony@atomide.com,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Since am437x have the same clock structure with
 am335x [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan
 probe failed on am437x platform.
Message-ID: <20200714153656.4a044437@canb.auug.org.au>
In-Reply-To: <CAL9mu0L5=khi2oXaei=EhTmRJC5mC1hj5gZVBHJgowi_3vxk=Q@mail.gmail.com>
References: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
        <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com>
        <20200714133835.3b03b8af@canb.auug.org.au>
        <CAL9mu0JurdBoXbSxvHUmNFSBOa=RneNyYtzT=C1MvJs10Y-Geg@mail.gmail.com>
        <20200714135407.35992389@canb.auug.org.au>
        <CAL9mu0L5=khi2oXaei=EhTmRJC5mC1hj5gZVBHJgowi_3vxk=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7TYKA9b/DQM.BAfDBPF3OqB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/7TYKA9b/DQM.BAfDBPF3OqB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dillon,

On Tue, 14 Jul 2020 13:21:07 +0800 dillon min <dillon.minfei@gmail.com> wro=
te:
>
> Thanks, how about the below commit message.
>=20
> Subject: [PATCH v4] Fix dcan driver probe failed on am437x platform
>=20
> Got following d_can probe errors with kernel 5.8-rc1 on am437x
>=20
> [   10.730822] CAN device driver interface
> Starting Wait for Network to be Configured...
> [  OK  ] Reached target Network.
> [   10.787363] c_can_platform 481cc000.can: probe failed
> [   10.792484] c_can_platform: probe of 481cc000.can failed with
> error -2
> [   10.799457] c_can_platform 481d0000.can: probe failed
> [   10.804617] c_can_platform: probe of 481d0000.can failed with
> error -2
>=20
> actually, Tony has fixed this issue on am335x with the patch [3]
>=20
> Since am437x has the same clock structure with am335x
> [1][2], so reuse the code from Tony Lindgren's patch [3] to fix it.
>=20
>=20
> [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> Integration
> [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> Integration
> [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am3=
35x")
>=20
> Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during
> init to read revision")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>=20
> Hi Stephen,
>=20
> This changes correct commit messages based on your reviewing.
> make Fixes tags to oneline.
> make all commit message tags at the end of commit message
> make Fixes tags before Signed-off-by line.
> add probe failed log to commit message.

Apart from the line wrapping, that looks better.  I assume that your
email client (looks like Gmail web gui) is wrapping the lines, please
see if you can stop it doing that (see the section on Gmail in
Documentation/process/email-clients.rst).

--=20
Cheers,
Stephen Rothwell

--Sig_/7TYKA9b/DQM.BAfDBPF3OqB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NRHgACgkQAVBC80lX
0GySgwf/Yr1H4JVT2M35sJmXj3dh+kgV5K11+Sq9znWqt2N8qaUtvyXY6xgMuAId
Q9r+oLg32uebA5vAjTKL65r9pZ4Nvu0IytgnCu9CNHOqFkM5LNzORHo+ZjfceOah
kpXY6O/RC12BUtLFVawkaztw5XiONcpqh1rsGVpFOWDNRuvipBJBm67S6vCO0hkv
bap4g+BrWPyoZPSv0vZsuMMfrP6ZAusb0q+bX6F8yA0a/C2MZUIDIa2gvuIITreH
eLGJ+ZM3ObPyI8dJJzc7FCbzCnKh3MDPpYL8IZDZjubhS+qY0qqoyYarl/Wz4Uxn
ZUrGJqo1QK93pVkCQKMx8V0WBjiDZA==
=5Bzu
-----END PGP SIGNATURE-----

--Sig_/7TYKA9b/DQM.BAfDBPF3OqB--
