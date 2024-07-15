Return-Path: <linux-omap+bounces-1771-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA0931D2D
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jul 2024 00:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC4551C21069
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jul 2024 22:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B555113CFAD;
	Mon, 15 Jul 2024 22:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KsDdsrfm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63E1CAB3;
	Mon, 15 Jul 2024 22:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721082694; cv=none; b=n80UU7NJOoFFoX6VFeyeNH1THG9gDa2nCj5w8eW3BOq+ejH5cw+7C+5cI1XRSYsr6RQZK9f8TK6NIKAQo2yIwPRi6M+WJdjAX+hlGe0YHftO6cXRBz0MhXOUal3GTz3e5b3RsQCZqZFLeHVCA9geJY4pgiseng9DWp+oQfQjrsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721082694; c=relaxed/simple;
	bh=kfdKJmL7tiu6vLljvhar1M1BCtG5zJjGuRM2/gjJamc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPBO7Eg8GZic78mmbAXpuqdAXjbr0z/4U47jJBPz1lWCjufs+WQTUOJ1XOiYZbHDuAxMR+eHTIwo1Fh19vInEAn+wBhjRrZFnfKN51FeaO6C6eFjDxxyY6EGSUzlpi8XTSEz9EPpEwVCWvYO1h+yXwGda5nRe0c7LNtJC42REEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KsDdsrfm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721082679;
	bh=QhZ0TGST+vEEUeZEnYjO7nKvUrdqTvlh89JcIcjC3j0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KsDdsrfmznhwCtsv8KRMxVPPLi/onjnI05GNE8OkpMLX3Nflh1VB84xcXUVMgAPUX
	 /ofG7zOEhoLckjwU4eYgSPIbj58gp2w2XClKbmePiRCrp7BT+M9C9LaFgrfrWgO/qK
	 x8ywPUPm/MrmMJ3uWinNz/WMU8jbjzd2WBl4hQ2M2AUAf60ijDZMy4+U5r4MV8r6TF
	 BbHNcrT4dDz9ydfNHXbrqd+/lxIi5xpVBOXBvtU1fd6nnXwbK2pMV8TbBI5PCCz+uP
	 7W9Y3MGIWfKGnm85riqBhykD0NWeL1Y1ldrEwkXKQxN+crI3TIJbVttH+OpH7RAIhn
	 8QG+csvA+TnRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNH3p0nPWz4w2N;
	Tue, 16 Jul 2024 08:31:17 +1000 (AEST)
Date: Tue, 16 Jul 2024 08:31:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: update omap branches for linux-next
Message-ID: <20240716083116.27f179bd@canb.auug.org.au>
In-Reply-To: <7h5xt67ewb.fsf@baylibre.com>
References: <7h5xt67ewb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S0BqLXVNGdBGJ7_s08MmirY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S0BqLXVNGdBGJ7_s08MmirY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Mon, 15 Jul 2024 10:18:12 -0700 Kevin Hilman <khilman@baylibre.com> wrot=
e:
>
> I'll be taking over from Tony on maintaining the omap trees for
> linux-next.
>=20
> Could you please update the omap entries for the trees/branches pulled
> into linux-next?  Patch below against next-20240715.

Done.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/S0BqLXVNGdBGJ7_s08MmirY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaVozQACgkQAVBC80lX
0Gw90gf+PIjWsMVy64oFMlScK4xnAkO9JDqPJgOBVmvj+wZ5QDCTGmQ6fnZ8JvjN
idhj3xgSVawQkU3EF8LzzhScAI0/z2z+EtluYtNeQ7WO1zH93z2rkngO1atBb7r6
R6TVkeZFpC9e7CF21RDCdf0nX2VlVzlGn3PiFBTPF8IfoaPUqGU9UQSxVqkX6FZl
z70DAj4lyQcJhNMOhfEqFB5XuI4lGjRoMry00LXLu5luPiLCqI2rFROI6po/YQpX
XFipwEd2c5SJ7bDFhlI9+QlJ0DRapnCpAv77GmHsxAyHBg22ZcD1QfLE0Bcin7+Y
W5T/FZmSJgTBYJQwAo7kdju7is7Sug==
=Gyf6
-----END PGP SIGNATURE-----

--Sig_/S0BqLXVNGdBGJ7_s08MmirY--

