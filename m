Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3875821E696
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 05:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGNDyN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 23:54:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgGNDyM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jul 2020 23:54:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5RTY0LPfz9sRR;
        Tue, 14 Jul 2020 13:54:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594698849;
        bh=3B84NJPSJ3aCDVa/eUO1Ar7r+qMlInL+yp7oVPhgKDQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kiyCts7uI9biVlsodhX8PvD+tlBUJMqUywoXAsXM8coW6k4ay1rwMDmTNv0V9PkJ0
         6eP8WkEMbg7izxzfe0+J7oS2GohHswBQbeXrMtWM57YCvDarMXKzJZjkuPYckt43/p
         dJhYrz6SyYNepcWVeQnjek7bpSIzNx6LwIAytGvSrIGinn57dSK9sQCbL3DCknLXix
         LhR9aO3BcQuOFOV1UXaCTFGMPxjdrkGPfvii26xZ4p1/J0/nnFTklEvL4myH52VSpp
         IqFM2C6ncVCaxCJkrqK0AooGRupwAVnOOeHaUZPTrYkt6lVPS9F1eX0LqXOgvEwAf+
         czRZaUgkde/tg==
Date:   Tue, 14 Jul 2020 13:54:07 +1000
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
Message-ID: <20200714135407.35992389@canb.auug.org.au>
In-Reply-To: <CAL9mu0JurdBoXbSxvHUmNFSBOa=RneNyYtzT=C1MvJs10Y-Geg@mail.gmail.com>
References: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
        <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com>
        <20200714133835.3b03b8af@canb.auug.org.au>
        <CAL9mu0JurdBoXbSxvHUmNFSBOa=RneNyYtzT=C1MvJs10Y-Geg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ysRfC1yFZY8=z2G12/rynj_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/ysRfC1yFZY8=z2G12/rynj_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Dillon,

On Tue, 14 Jul 2020 11:43:31 +0800 dillon min <dillon.minfei@gmail.com> wro=
te:
>
> On Tue, Jul 14, 2020 at 11:38 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > On Tue, 14 Jul 2020 11:23:18 +0800 dillon.minfei@gmail.com wrote: =20
> > >
> > > From: dillon min <dillon.minfei@gmail.com>
> > >
> > > Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during=
 init to read revision")
> > >
> > > [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> > > Integration
> > > [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> > > Integration
> > > [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on=
 am335x")
> > >
> > > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > > ---
> > >
> > > Hi Stephen,
> > >
> > > This changes correct commit messages based on your reviewing.
> > > make Fixes tags to oneline.
> > > make all commit message tags at the end of commit message =20
> >
> > But the Fixes: line should be down with the Signed-off-by: line ...
> > =20
> Ok, should it be like this=EF=BC=8Ci will resubmit it.
>=20
> Subject: [PATCH v2] Since am437x have the same clock structure with am335x
>  [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan
>  probe failed on the am437x platform.

You should have a shorter subject and maybe the above could be the
first paragraph of the commit message.

>=20
> [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> Integration
> [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> Integration
> [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am3=
35x")
>=20
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during
> init to read revision")

No wrapping the the Fixes line, please and it would usually go before
your Signed=3Doff-by line
--=20
Cheers,
Stephen Rothwell

--Sig_/ysRfC1yFZY8=z2G12/rynj_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NLF8ACgkQAVBC80lX
0GyneAf/Vz8N3OEDTkT89DgJLYH6tp0quCfVnAO7ZCwvo2ORCaJLnoz3f9PwlYRX
HV7I5F02PmnsNvByTy+1oO5yruYKgABTbl1LViGu45JCzoUmqA8P4haX9wEGo2X9
VTNwDJxipYdvkhIQ/+V6CGlUnanfbeo4pEGr9+b95rKMBdf90ELo6WFw9a/NxAyi
Tg+89BFIp1BLfLYC/zGqjGP/P7sE6gUV/luxtcJGLnNrd9ENBfne9bNAwP61zsAZ
So5f/a+msvHuIRM38X6Qr9g97+hBIPjyilrXVx7jX0sT9J3wADZwsUoQQ4EJCLtU
G1bxSK72+YNX6ZgVcmZjPbR+u+FcBQ==
=KYmx
-----END PGP SIGNATURE-----

--Sig_/ysRfC1yFZY8=z2G12/rynj_--
