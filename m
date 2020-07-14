Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEDB21E668
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 05:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGNDij (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 23:38:39 -0400
Received: from ozlabs.org ([203.11.71.1]:41395 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgGNDij (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jul 2020 23:38:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5R7c1n5lz9sRf;
        Tue, 14 Jul 2020 13:38:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594697917;
        bh=utKdEPCFFOb8Q1Yxk4/KLx+BAJ8D2GFKAuYxXohCvG8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YhNyqPH34KDJC8jEG9M/eVuyt9cp7GboLqIlNbnCksVZV0jDSD5tcjZ3qamCB2BTW
         77nJg9JkOSDaEQYDHE5qSYLdALc9cAixTzF6wwWdelNfgZJEOXuRtsb5OmM/Ryndal
         Fi7cu7PRJ8g836mWmZbDvPevVHabbZo9dUzYQEMix9rzzA15BBiwJbcWsnkxmMvgFo
         An/EbFyasd8sLsnaqw9HAYxY8ljonIpWhWzeKGjMXwdb46oLK/X7pPGwYDZ0MzgzeH
         Ydu7j+da1KVtcIwii1oA/6ogGp2YLXf8fHv6gX+PbS/4lujDnGNdPiqpeYR18fLRVl
         SW2JhvfMsQzpw==
Date:   Tue, 14 Jul 2020 13:38:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     dillon.minfei@gmail.com
Cc:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Since am437x have the same clock structure with
 am335x [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan
 probe failed on am437x platform.
Message-ID: <20200714133835.3b03b8af@canb.auug.org.au>
In-Reply-To: <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com>
References: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
        <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k1XeJEgdCmFTZKkg66haG0l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/k1XeJEgdCmFTZKkg66haG0l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 14 Jul 2020 11:23:18 +0800 dillon.minfei@gmail.com wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>=20
> Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during ini=
t to read revision")
>=20
> [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> Integration
> [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> Integration
> [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am3=
35x")
>=20
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>=20
> Hi Stephen,
>=20
> This changes correct commit messages based on your reviewing.
> make Fixes tags to oneline.
> make all commit message tags at the end of commit message

But the Fixes: line should be down with the Signed-off-by: line ...

--=20
Cheers,
Stephen Rothwell

--Sig_/k1XeJEgdCmFTZKkg66haG0l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NKLsACgkQAVBC80lX
0Gxd/gf/XDaMTcgnoIkuJHOcd/X609x4hkBiINhaOmMBdPYVD/PQndttJiqXeUPM
NTBl0H06S0BFUyeLAMiw2eA0gfzcCoz81NKhgTiKFl1uh3n+3MHM4Uw1ZkC2aj+o
XW46IYvBt9Kf4IFd07cs/JGz8S25/LXhlU1tUQlujk5nBk52afUguIpIPLMq66QS
3K4BlmGIYFvJhATTndQEkT4nGKfLXm0J00Pg8Ajq+y0kcErMGRgrGOgySdB9v0Ij
wyZlDlZpLcSF8kfr+3Fk31ZGZmxkNAEvKrvdbsZjmV48PYedlgXYrQ8vk1924nAE
lT4RqY7Bbs2VdqKaTY1WHYppHlCAOQ==
=Y4xQ
-----END PGP SIGNATURE-----

--Sig_/k1XeJEgdCmFTZKkg66haG0l--
