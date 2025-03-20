Return-Path: <linux-omap+bounces-3476-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3687A6A1C2
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 09:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED36417E8B2
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 08:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39991216E05;
	Thu, 20 Mar 2025 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="L4xvqo1r"
X-Original-To: linux-omap@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0552206A9;
	Thu, 20 Mar 2025 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460540; cv=none; b=E769wOLsJzQUxm4Fgr83o/BA3UBuq7IGgFa6x5evt/WrTxpSf4DKwzJLiYvWRYyITb2PBdGPgE1tkSN2xXnUOtzFORGIUm/D4Ssp/ywPS4r27MihVpgaLouAoie88CBMUsedVeikW6Z8RnJpN6CKJFuBnoOgqUK2bz6VIA73/DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460540; c=relaxed/simple;
	bh=P+7/Zp+0R5xx8fr0FSrg9iWCByiTibRgM9OarpQcLtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTsx5qFV4el8pbGZNL71lV6UGuzExvKyKDKI64CK1upGSrHnG8pHNi51TH9f9TTIT+ux0qrjwCO4ak5u570K77hfa9voI36NRLZRr1nxCn5DGBeJceEVt3GUdWDrTy277+kI9lNdPCEKQas92HFg6WG7h5VAUSKj5sILpfWOsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=L4xvqo1r; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 645821C013F; Thu, 20 Mar 2025 09:48:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1742460530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJQK1E3+ihk0OyLfdiHoeojuMQugFJPqvRpJ1SRBxFs=;
	b=L4xvqo1rLLNoWojGPsfHm3JP18cLEx25zcNOUBqLTVbaI86uGbGSgEMvTPDwoXExK8X9QB
	NJ8qgpNCrC3i2ECA3JK2GFfE0DKAvGI/i/7UXa86EFpiJYeg7RXV6peu2MgxPToo6aesGI
	nou6KX4RB+knvCDx9rZSU9mLQ+LzDbY=
Date: Thu, 20 Mar 2025 09:48:49 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nokia n900: remove useless io-channel-cells
 property
Message-ID: <Z9vWca4WfIP7UD1g@duo.ucw.cz>
References: <20250213203208.93316-1-david@ixit.cz>
 <jqvulfqjjscwyjw7yzmnfxlwj6p3qnazfjddlhasof5qbtmu55@mb6om3fbalon>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YSNvZQUFPCCxvbp1"
Content-Disposition: inline
In-Reply-To: <jqvulfqjjscwyjw7yzmnfxlwj6p3qnazfjddlhasof5qbtmu55@mb6om3fbalon>


--YSNvZQUFPCCxvbp1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > This property is irrelevant for the ad5820 DAC,
> > the driver nor the hardware indicate use of channel cells.
> >=20
> > Fixes: d510d12f26f4 ("ARM: dts: nokia n900: update dts with camera supp=
ort")
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
>=20
> I certainly don't think this is a fix and probably just stay, see:
>=20
> https://lore.kernel.org/all/ih3ykzxrnpbwg4bvkmpoo2tashcxidir4r4zofhlvrs7u=
dkp7o@6qtqh6wtmkwd/

The idea is that we can simplify binding document at that
point. Currently we are getting feedback that it is not needed on that
side :-(

Best regards,
								Pavel
> > @@ -816,8 +816,6 @@ ad5820: dac@c {
> >  		reg =3D <0x0c>;
> > =20
> >  		VANA-supply =3D <&vaux4>;
> > -
> > -		#io-channel-cells =3D <0>;
> >  	};
> >  };


--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--YSNvZQUFPCCxvbp1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ9vWcQAKCRAw5/Bqldv6
8pVYAJ4mrUga0sffh7CDOe7cyJ1Ilv8fEQCgnUmu/QBuOUgDYw3NW4/S/VqFtxc=
=3HHQ
-----END PGP SIGNATURE-----

--YSNvZQUFPCCxvbp1--

