Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765603BC137
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 17:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbhGEPxl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 11:53:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231721AbhGEPxk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 5 Jul 2021 11:53:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0181161968;
        Mon,  5 Jul 2021 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625500263;
        bh=glhegRlbhTXXlkziDdj/aqJGW6U/IEMbgXbZb5HXqko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IvDyVcbxBreYf+AJ2hJivcLrpH4d5zsbB2N2UpZPPjpKnqaXUQAkR0bOMj49s/FR+
         fBt59drojMHynuSXfkb1tjHz6t74uxDO+RA1MQZGOnofF6Hd5C6iGdzuQVEt5946mt
         lGUsyb8AJEZUPRt18VOt3hE3ofHcmiytZi6mA/kRxYF+C/6FnQcaGX2AWHVXDSxgRj
         J7lUMIf4sDD9maESYX0AaglVz04LUHJWCBjsazwxf/VFRqtfLXRJd+kOSui4kednbM
         +v4B8Knpz0V4/L/cIyreYoLuIv6ZqF9YXU6FZGvTs/7+/Sp2F/1Bs30F1ktSBkuB6O
         v5Q8uEuKpyCVQ==
Date:   Mon, 5 Jul 2021 16:50:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc:     tony@atomide.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: Re: [PATCH 1/5] ASoC: ti: davinci-mcasp: Fix DIT mode support
Message-ID: <20210705155032.GB4574@sirena.org.uk>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
 <20210704150450.20106-2-peter.ujfalusi@gmail.com>
 <4b530480-bcd6-08cc-b8d6-7e57d0a823ce@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <4b530480-bcd6-08cc-b8d6-7e57d0a823ce@gmail.com>
X-Cookie: Star Trek Lives!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 05:58:04PM +0300, P=E9ter Ujfalusi wrote:
> On 04/07/2021 18:04, Peter Ujfalusi wrote:

> > +	u8 slots =3D mcasp->op_mode =3D=3D DAVINCI_MCASP_DIT_MODE ? 384 : mca=
sp->tdm_slots;

> This is wrong.
> 384 will not fit to u8...
> I wonder why I don't saw this...

Or the compiler for that matter...

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDjKkcACgkQJNaLcl1U
h9DcDAgAgMKsrDYJYnXxsZ8DtK7RFf44t36R6GVLc5F5txpjuo8sfqRO5wUMblKK
ctbXxhjWqKUY8giWyDjuA+F7UE0eOYvA5HAQz/7cGdexXuy+eACm42+ps4FXMqTz
5Dpjd01WdVs+Tdatq0om/uxWOatNoGUVbB2fKdvTw63FFDkCKa6REjBVikBcWd0G
/Afi5p7U62RKkCtQUB6yvnwrmH7BN9IKgS/Z9ki/zyBaKlCcjwo1AV7/0QSmS41a
ncCmla2vAwoyeZ4e4h56runprOdodekEq5U6RA504z8pH8wr3ck0yRLHiZ7ira8N
zkWUqd32rHveHN64+epaCbC4n6MGLg==
=HKQh
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
