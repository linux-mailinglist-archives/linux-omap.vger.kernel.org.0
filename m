Return-Path: <linux-omap+bounces-3316-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37DEA4A5C5
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2025 23:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1CBE7A4DB2
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2025 22:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA2F1DE3C0;
	Fri, 28 Feb 2025 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIP8wc4q"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CD1C54AF;
	Fri, 28 Feb 2025 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740781041; cv=none; b=nEQ7F23Gh5UrNvVrkns659eiwgjCyfeBn4f/BDkQe6PlbsU3JHlcDTzh/k2l9DiYI3zKhYjFi4aozMQskcWFjJk6iEXFmyT4zM10tpQeoVscxy0cRzMEwW9/BS/p3rCnSx2tUKnNO+lWjtiE3IOn1f3Q481z5FjkuK4OeJd/ZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740781041; c=relaxed/simple;
	bh=4EFoB0CA+7vj+2I0DEsWtzV0UBQGS9nt5xC07FC5Zv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hb0N866+H9w2kUBuE9wAvva1ClQefA8TJwc/EFtNADT52iCd85JTWyjQ4AysRew2CCKjT71ziUjy6fAPaHmXHDY4swdXj3Mpu59JxjeFvTQU7jvbbJnphH0BDJvEZSrB6TGvDvpZW9ETvZQfy9gDMYq7I+AQ7kHwK41idQ6h13k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIP8wc4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0DBC4CED6;
	Fri, 28 Feb 2025 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740781041;
	bh=4EFoB0CA+7vj+2I0DEsWtzV0UBQGS9nt5xC07FC5Zv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIP8wc4qAsPbKgzrVI0afqnf2lypdyAp7w8gU1T3Xn0vxzNSnfYpnPE8ugL88cTDc
	 /eyQEVQhmUpEkeGJZ6+FrOl/ziQaofpMttIYlieW/bEk4XUjfHYBgWbJ1MaqB1rGNx
	 yFCldMvFXxG2HXDIdRgZ291fgeWxk2IFaIWP5PLAZpxATYGFgy2eACpYqjmsEx/X/D
	 9mXC8GmqUUCmLloLIPVXONUcZyJw4nYpg8rR80QqwFmSnGTFkRSEuklT0dYPL7lTae
	 /wicJz34gwb6vug1iDqGcC+YzsZRrER8YAT8n5rKlMKAHvdZ5WPCds/LYmpbqe4aAy
	 MnXp2WiN5FWNg==
Date: Fri, 28 Feb 2025 22:17:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: lgirdwood@gmail.com, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	m-leonard@ti.com, praneeth@ti.com
Subject: Re: [PATCH v4 0/4] Add TI TPS65214 & TPS65215 Regulator Support
Message-ID: <9051f3af-525b-4b97-be9a-b8f3e2af659b@sirena.org.uk>
References: <20250212191129.467728-1-s-ramamoorthy@ti.com>
 <131466cc-dc54-4251-82f7-5ec9e9c20f26@sirena.org.uk>
 <40bd4297-ad4f-41e2-8bd3-e6c11dc40a17@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e/kUc2pMpBR1K8Nw"
Content-Disposition: inline
In-Reply-To: <40bd4297-ad4f-41e2-8bd3-e6c11dc40a17@ti.com>
X-Cookie: Avoid gunfire in the bathroom tonight.


--e/kUc2pMpBR1K8Nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2025 at 11:30:43AM -0600, Shree Ramamoorthy wrote:
> On 2/26/2025 4:40 PM, Mark Brown wrote:

> > These all appear to be in the MFD tree without a tag to pull from or
> > anything so I can't apply any of this stuff until after the merge
> > window.  I'm not clear why they weren't sent as part of the MFD series?
> > You should probably resend copying Lee.

> I wasn't sure if the MFD + entire regulator patches could be sent in the same series, so this is good to know!

In general if there's a build dependency it's OK to send things
together, if the patches are just for the same board or something but
don't actually interact at all then that's the time to split them up.

> I will resend a v5 Regulator series with Lee cc'd asking if he can take the series if you give the patches an ACK when ready.

OK.

--e/kUc2pMpBR1K8Nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfCNesACgkQJNaLcl1U
h9C4WAf+KiHDSh+rwFSoFt83Sc3h2xFurY2TyCAH1ceRd6RckjQyiB5MCUoHg9+m
yUaGy0DlRI6OUU76wtaUX3qUWypNY7Qp9JOj8k+fiYy1MSJGj1Y5ghBcqJ9fxBe6
+XVVGvVt49yEyBeKrsdsezaWZ9pf0EnheJLRvRHZSGu9I5ua25jXcyHMZy754lz3
NahaHf+hU0h6E4I/l9se1J+mOIS7APaYaOggPE1AtPqIwe/YMwmuBFBsJcXIKzpA
89IIozfcCdlGZOXD5OWV0bobvsk0Rh6pPslki/PhPFxLJKgFsx8pEF0/hRQd7Vdh
KOx1eYzvz6eVIUtPJrdUrRL5crrRPA==
=Zbyv
-----END PGP SIGNATURE-----

--e/kUc2pMpBR1K8Nw--

