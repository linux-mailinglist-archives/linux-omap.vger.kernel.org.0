Return-Path: <linux-omap+bounces-3595-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CAA93BAD
	for <lists+linux-omap@lfdr.de>; Fri, 18 Apr 2025 19:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F6197AD61F
	for <lists+linux-omap@lfdr.de>; Fri, 18 Apr 2025 17:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDC7219E8C;
	Fri, 18 Apr 2025 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="D/5dyZLX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E53613C9B3;
	Fri, 18 Apr 2025 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996040; cv=none; b=Wixn5F6SMFI8GVAAJQmonMUekZTMAN3xDAqa1ePuYKNdEyaTjBDBuXRfzkwZT0cGoL+f+dmKhKpy/LvJ62f/JbMdoEGhXEnSAKe6BPuDTg22rdVGxVclClwKYhdvxtYT725FTFRlW2YkU2ygxQeTT/Qj0TW1tmG6l9n/wXEON5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996040; c=relaxed/simple;
	bh=nFFn7I+g/tnnYz6luw61kYvkvMc5y4MmqUN2RfOy298=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPfpRsdP+vl2W6GH7Pxr4KFVLRPaWAd6OV/igI4MjS4rNz1eOQeocLV1oBbX2WalsbpQTlBMfbnkD3b3p0lI8GxwjUw5zdjOWeX5t2blZy8k1vsHuXCyYByov4GfpWEmjjvzJm4BtAYMPOfvALk2tUleVlUyW0HMON20RI+njgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=D/5dyZLX; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69D3610273DBF;
	Fri, 18 Apr 2025 19:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744996036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=CY3ybeEvZswn7mTzJEo870uU1YtFroIwRrSUBzp5+v0=;
	b=D/5dyZLXHPrXzHpWT4ABFOWkh6sluYURfX7f2u8rkqFUrONd5tplGzJ+DMlLx+3LbBctVT
	BHu5lKRc+CEFJ345J9lnXrregcz5YxGZlqh1p2FyVhyCKSDPV3HsWUlqzn3xNf7YFAhbxo
	YEhu8w2fVyeazJmWW+F/GK+AKA/BhPGNYj/A9rIE/K8LcCAHS1qxD4zDmdTDs3uzU6iOFW
	8/YPNQD93G1kSUzwmSkl0UWJX7mnDS5PQDGot/iqnjYO1dDmRC31Rg/Jz2P0YM+XUTySgZ
	FJyhU0C8ql8OHN4VsI3KE4oT4bZlZySOCUbaom+Ult6gxc4N8z4P90ozoUF2Vg==
Date: Fri, 18 Apr 2025 19:07:10 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Leonid Arapov <arapovl839@gmail.com>, Helge Deller <deller@gmx.de>,
	krzysztof.kozlowski@linaro.org, u.kleine-koenig@baylibre.com,
	linux@treblig.org, linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 5.10 8/8] fbdev: omapfb: Add 'plane' value check
Message-ID: <aAKGvh0fdMZPT9Jd@duo.ucw.cz>
References: <20250403192031.2682315-1-sashal@kernel.org>
 <20250403192031.2682315-8-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZBo/N4CwvGP6QfRI"
Content-Disposition: inline
In-Reply-To: <20250403192031.2682315-8-sashal@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3


--ZBo/N4CwvGP6QfRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Function dispc_ovl_setup is not intended to work with the value OMAP_DSS_=
WB
> of the enum parameter plane.
>=20
> The value of this parameter is initialized in dss_init_overlays and in the
> current state of the code it cannot take this value so it's not a real
> problem.
>=20
> For the purposes of defensive coding it wouldn't be superfluous to check
> the parameter value, because some functions down the call stack process
> this value correctly and some not.
>=20
> For example, in dispc_ovl_setup_global_alpha it may lead to buffer
> overflow.
>=20
> Add check for this value.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE static
> analysis tool.

As changelog explains, this is robustness, not really a bug fix. We
should not need it in -stable. (Or maybe rules file should be updated,
because noone seems to be following this rule).

Best regards,
								Pavel
							=09
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -2751,9 +2751,13 @@ int dispc_ovl_setup(enum omap_plane plane, const s=
truct omap_overlay_info *oi,
>  		bool mem_to_mem)
>  {
>  	int r;
> -	enum omap_overlay_caps caps =3D dss_feat_get_overlay_caps(plane);
> +	enum omap_overlay_caps caps;
>  	enum omap_channel channel;
> =20
> +	if (plane =3D=3D OMAP_DSS_WB)
> +		return -EINVAL;
> +
> +	caps =3D dss_feat_get_overlay_caps(plane);
>  	channel =3D dispc_ovl_get_channel_out(plane);
> =20
>  	DSSDBG("dispc_ovl_setup %d, pa %pad, pa_uv %pad, sw %d, %d,%d, %dx%d ->"

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--ZBo/N4CwvGP6QfRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAKGvgAKCRAw5/Bqldv6
8k5AAKCQX8B0UtiYfqSSUIgj9Cciyl+X/ACgtg4ARUVHHH5jlNdHfPqoc3tE+/Y=
=SFK+
-----END PGP SIGNATURE-----

--ZBo/N4CwvGP6QfRI--

