Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCCD21E87C
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 08:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgGNGpK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 02:45:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59597 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbgGNGpJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Jul 2020 02:45:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5WGp4HPBz9s1x;
        Tue, 14 Jul 2020 16:45:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594709107;
        bh=ClduEeAgs47lVi4Z75/vHJ8zjThpPjpSsYlX2EXPZ7E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bN8EsUsxELG1u7TALvBxLWL2r85/raNsB6NeSDJwP8CbQy/fxXZlXQdvSTYv2KxbH
         fmFDt0FmRdU/4vwViuqWGpJCib+mE9RWE3u7CnjwUm570RQiIlpPML2K2emLWNE3JI
         XkV2SN50Xwvh62h1qLywY8UKFr6Ot6S+SUAIs5IwBYCbV98Kg5QufuGrvfGgyjgZRD
         5DZIBtAa+HjwgA8IJYzALpbyljS3wWqmBb+ZBtsx7BE5jfxT0NvPHSR/ZtSexNs3JF
         dONbgqHyBkoyQLoyrS1BuMAUJRkh+t2n2mId3vEXVonwcZeOz1TzXdYhjRMt+6BUuG
         hJw8U06OUu7rQ==
Date:   Tue, 14 Jul 2020 16:45:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     dillon.minfei@gmail.com
Cc:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Fix dcan driver probe failed on am437x platform
Message-ID: <20200714164504.10b23697@canb.auug.org.au>
In-Reply-To: <1594708507-6794-2-git-send-email-dillon.minfei@gmail.com>
References: <1594708507-6794-1-git-send-email-dillon.minfei@gmail.com>
        <1594708507-6794-2-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+.0IClS8DjJjchbmw_qi_zA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/+.0IClS8DjJjchbmw_qi_zA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dillon,

> Hi Stephen,
>=20
> This changes correct commit messages based on your reviewing.
> make Fixes tags to oneline.
> make all commit message tags at the end of commit message
> make Fixes tags before Signed-off-by line.
> add probe failed log to commit message.

Thanks for persisting.  It looks good to me, now.

--=20
Cheers,
Stephen Rothwell

--Sig_/+.0IClS8DjJjchbmw_qi_zA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NVHAACgkQAVBC80lX
0GyuHAgAmwBoMVZJJ41XqErZe0fvVMe9O7xJmHSy+4TlJlzE9R+Aiw3fgWsmzA82
UoVQZo708iuMwvsbnFl56rq8jJipnsgVl4Ajy4qPbtFLZ5eW8aa3ZmiA3DMhmVzi
WXY18QLsb+vdvIi0+CjGu88dOR3+nweWGcsAEN3PQroHFf7Y3VQPCNqEdCd/wf2H
xGt4wyz1YpWOeAEYq89wm45WgnnfjxJ2aUEpTABGlp1NaGoJViMIBFdNgzbCf8li
FDhLuj6Pjgzw7X9Pn9OduA+prLrTCd0Y2lf89moTfFLgWbCY3RSdJeDGEx8AyCzj
TcBnhcCOVlGMSmO6AqTpvNfHxhHmhw==
=mxjk
-----END PGP SIGNATURE-----

--Sig_/+.0IClS8DjJjchbmw_qi_zA--
