Return-Path: <linux-omap+bounces-3900-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8AEADD36D
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 17:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148B21942618
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 15:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C5A2F2355;
	Tue, 17 Jun 2025 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wui6XRS8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47912F2343;
	Tue, 17 Jun 2025 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175328; cv=none; b=W/DDghCtVcIAGIlv3xV3EVfT88ZCfKBF7v1+SsnRoyMPIC870oJ1aNXrxjmFo7dCSwwPeqzJOMDfn+RlHuhDaH71+xq8KpDt7Fj4bChRRtUUIPSZSysqRMDuEYdpVDs0dHth0IjtDs82PkgXM7WOrr0rJLz/MoIxZ27o/7DgqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175328; c=relaxed/simple;
	bh=gmTRd7cG1P44Mw4Qdx6fGexr/qg2QQsm2Eiwg7qSOlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwW6SwKBHuUrXJi2wbgaqwNYKAcTmRo9cmlsnNFFw77tbdMfbz7z2MlWsHqRqEUNMEsTPyTMVeeMWB182tQvpP1xTJxEfBy57kyUKYNxfbiiHlWvLlW8El52ceDdMmfsg0BGKEtjfNT8l5/zEOefEADAATN6ig1bqeJA/Czn8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wui6XRS8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458E9C4CEE3;
	Tue, 17 Jun 2025 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750175328;
	bh=gmTRd7cG1P44Mw4Qdx6fGexr/qg2QQsm2Eiwg7qSOlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wui6XRS836ZHKlYutz44rbTY/RJ4ZwZePbS7hdtApYSsmdfJf31pJXkpEiQjjFKbv
	 ojum6YEE15KIv9z2zryztQSUhgEwUbCJYBIlT8VWp11UPwT9cE204mFKzuU5+tbxPA
	 kZiT3jWLlogU5+0UwNIuGG9MhimxBHkphXwQH9u8mT1dubCofXhTYNG+DaeNfLXdjV
	 17UgA603VyB9FcQ6H78F+Aylgrhlupb1J8pg+MVKwwQzfIu5ZMYbyy8lk2DDFupiiz
	 ZSdNT8XO4DhY7j2c7Xk0wF/wSXXGluCEYmcwt5uHu13w0uIm0SdEsDpB8/iYrlza6O
	 qF5CvsZsNIvow==
Date: Tue, 17 Jun 2025 16:48:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Paul Barker <paul.barker@sancloud.com>,
	Marc Murphy <marc.murphy@sancloud.com>,
	Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
Message-ID: <20250617-flaring-thesaurus-1847aac1a580@spud>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
 <20250617-bbg-v4-1-827cbd606db6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dwcojE+WiyTAewaF"
Content-Disposition: inline
In-Reply-To: <20250617-bbg-v4-1-827cbd606db6@bootlin.com>


--dwcojE+WiyTAewaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 01:59:24PM +0200, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation for AM33xx-based boards. Update vendor prefix from
> "ti" to "beagle" for BeagleBone to match actual hardware vendors.
>=20
> Reviewed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dwcojE+WiyTAewaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFGOWgAKCRB4tDGHoIJi
0giYAQDfl18/v+0Cb4uHY3q4Td70JepYf/uzfRt3FvTGFIwxkwD/bKzTGC5ixBGY
fb7Oo9bjWcM2vvew+15LVJUJm89gAgU=
=3fUN
-----END PGP SIGNATURE-----

--dwcojE+WiyTAewaF--

