Return-Path: <linux-omap+bounces-3469-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A52A69C50
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 23:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86455466A78
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 22:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAC3221D96;
	Wed, 19 Mar 2025 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWL0GXQv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EAF1E0DF5;
	Wed, 19 Mar 2025 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742424992; cv=none; b=mPKS6DvHYy1BobY+C2zP4430jfedV6JAPrQ0NF2LkCS+SMmTpHSGiga7Y0RQaLhcApkPBUz3bLOnB9lehuKLHRrJj5AisKpF2D/oxaDNu4RObiY5tMe/GK9X7okLJNZmNrx4apTenwj5tQJZOw8DZlW11FAHT+dVcz0BdpuxTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742424992; c=relaxed/simple;
	bh=nZjKrmCappanOfvpwKpaclZemTsfgNW3g/v993e+RrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp3J+g5ldedUAm58RzynLCq1aeQrZ22JCNf9YDo9FsGmT/rfgCOlQcPXrAYpDpLGhWRrfTld9NLpd8p28BJOFUExGWdh799EcD4K/0kLtjEIPXsvxtJFdd0d13vu13fEVZ0lt9q5ZFhx52oJSx0Ra/URE3ni8i+QWQzkCxzZLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWL0GXQv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B611EC4CEE4;
	Wed, 19 Mar 2025 22:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742424991;
	bh=nZjKrmCappanOfvpwKpaclZemTsfgNW3g/v993e+RrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWL0GXQv0fI/t6WT4BwI4vK5/R1A9fJ3MX7IsfZYy1BHMBB9eNNSQJSMZIwHAAyz1
	 Hjft4jiwBGEuTYQi+Cv1ls1swlxbJslWECnjyuLk6x+Afsti67srtAqXfqa8lFvppP
	 4rnghiB7WQjwN8wOVGtRBaQaD01EUalRzyoV/fQT9GnGcUvDohbK2XKLbT2Oitq+4Z
	 4xnIzlOLiR1gKpgeFBzLEB8M2e+Jf5u+9eKRzeqt0zASlfJCOA8FUDlg7jMGF9na8x
	 LeEYNQe/uWLWZZcNMfKklzAUn1efmLPcWMOX5mgajgC9IVLQa367l6za7hTSXejC1I
	 SqT22UFe9tSyg==
Received: by venus (Postfix, from userid 1000)
	id A82171819B6; Wed, 19 Mar 2025 23:56:29 +0100 (CET)
Date: Wed, 19 Mar 2025 23:56:29 +0100
From: Sebastian Reichel <sre@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nokia n900: remove useless io-channel-cells
 property
Message-ID: <jqvulfqjjscwyjw7yzmnfxlwj6p3qnazfjddlhasof5qbtmu55@mb6om3fbalon>
References: <20250213203208.93316-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="etw5w4xj6hl4ulcd"
Content-Disposition: inline
In-Reply-To: <20250213203208.93316-1-david@ixit.cz>


--etw5w4xj6hl4ulcd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: dts: nokia n900: remove useless io-channel-cells
 property
MIME-Version: 1.0

Hi,

On Thu, Feb 13, 2025 at 09:32:03PM +0100, David Heidelberg wrote:
> This property is irrelevant for the ad5820 DAC,
> the driver nor the hardware indicate use of channel cells.
>=20
> Fixes: d510d12f26f4 ("ARM: dts: nokia n900: update dts with camera suppor=
t")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I certainly don't think this is a fix and probably just stay, see:

https://lore.kernel.org/all/ih3ykzxrnpbwg4bvkmpoo2tashcxidir4r4zofhlvrs7udk=
p7o@6qtqh6wtmkwd/

-- Sebastian

>  arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git ./arch/arm/boot/dts/ti/omap/omap3-n900.dts ./arch/arm/boot/dts=
/ti/omap/omap3-n900.dts
> index 4bde3342bb959..c50ca572d1b9b 100644
> --- ./arch/arm/boot/dts/ti/omap/omap3-n900.dts
> +++ ./arch/arm/boot/dts/ti/omap/omap3-n900.dts
> @@ -816,8 +816,6 @@ ad5820: dac@c {
>  		reg =3D <0x0c>;
> =20
>  		VANA-supply =3D <&vaux4>;
> -
> -		#io-channel-cells =3D <0>;
>  	};
>  };
> =20
> --=20
> 2.47.2
>=20
>=20

--etw5w4xj6hl4ulcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfbS5YACgkQ2O7X88g7
+prn3Q/9HylYSVPY87c9Dxb1AIEh5S2L6Zz0ciJBajF+8+/565TXkKbKl6LeklaE
P/9rpb3rDUpAP+qjSOMue2d0QejYKvSuqszeSAZCTJEZunpjXm3PVTsL6veJ2zzw
g2PUGgtcA5ZqsxWnPwG4230+whLZCG1gpcn2Dr2pUUbatC7tfLKPEabzKsb2ddy3
qPMsmz49gN+v98q5IWB7g7bcrV5E7fOOFQ2ouN/Xz4BPJXu5sR1uoYTb3ckdAtrk
jC498dToUp24yxX1hBS9XI7HJEuX85FCHVCrtBH/sjvokAeyVpYYBYZ3f7rR1Ryz
TC2xSiUd3cfSOqO4UQsXQ1xlTtuEXtij+MVXaXTGsbH0xM2zixNk3ihwzeIWyTNX
KtR2PzR02kJk0cTB+RBMDDzogI26cVPWZbWsquX75yK4+AJG+VprzCN4Kh2dpUcr
l9XJNROFCBVzOeA8uHLb4eG8JkJ26WMtYby+sC8lbL5bS2mRIIzcksGfG7jbH2XA
/E9jQuT6wOyGN6fLCfm6DgKoCz17N8YUna8P56RjmGPB4xarXXN0P+NeGH8NAHrj
eT84R3yjAQyW/8sXxHXG6ILtzm+zmcVOCRrBzQXQZrau7jsmI49w0NubJQY6O71R
Rdgi2keBOomp2DBz/Za4k5Nab+dZwR9qJOtx6sbOFYsizk3iBBg=
=f8q2
-----END PGP SIGNATURE-----

--etw5w4xj6hl4ulcd--

