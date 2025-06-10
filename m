Return-Path: <linux-omap+bounces-3820-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12453AD3D7B
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 17:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C75CE18869C6
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 15:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90222241103;
	Tue, 10 Jun 2025 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JySKFZu7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E823FC5F;
	Tue, 10 Jun 2025 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569373; cv=none; b=X9Q5I9fmIkA0tdOq9M0m5Ru8GVE6Ye7FYDVpEfuKZ0CfrRHOl2uzDKFS1cZt3UfCwLe4cYg1XL9O9xbTS5ROEfRmdMIR99W6vV7V9N7eKd9WGQ09jJ3jWpap+9Vrn0LIbDFCB5oYuV8towi6EAX/XnTnXTWm7aN5mGIM1ipzSdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569373; c=relaxed/simple;
	bh=qUnJvb2oUe9IlYbfN0wDYHHg76thgwuul6xFyCTVAzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjJj/qilZFOnH8L9wPum8176XgKhFM5jjLxI7lrZhL13UH2rDn+QQ4SKN/dVrfgq5yNcJHMvvwPTnNS/nnaPJOKLBS7Slq8vTV4fNCYgy/F63LWx7iSk5zOmyPbm2VUYedRjaidPLSg7JzguszqeuuhZyesdaIFNrXlA8gISHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JySKFZu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630B3C4CEED;
	Tue, 10 Jun 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569372;
	bh=qUnJvb2oUe9IlYbfN0wDYHHg76thgwuul6xFyCTVAzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JySKFZu7LyDYRY/pSwCbSB+8HoaOzBcXvldD/C+w3dRJGGaX9sPjAnW2ba57VrWGZ
	 dixiMvE/hIIiuhk8q1MOvZJ4bCFRbyT6QX+DzeRfTyZIv+1/ADuQCnH64b9FqSG4j5
	 oeqONBT3lhI/VpLxrelx3ajO8jUG4V7/tDwQuR5jc8Ur4mhEXd4pdv4/RkEAOH25J+
	 tOyfk6Nz59ns7MLiZlT3AXGemRMHD6j1VuoentHGvj2iEliNUpKbwUIZzq2F8W+4E9
	 VOMaQZpwsAd3AuvDd7ONiJ04sopINazrc5y5KH3QGiTQFJk4Tw16m4UPklkv8Hb0ov
	 kdwXB8gop02bw==
Date: Tue, 10 Jun 2025 16:29:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250610-during-unstirred-9e5b3de34467@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
 <20250609-hacking-corporate-d53531577680@spud>
 <20250609215044.33ef6b52@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bq1VQ7xvQiSm4oQx"
Content-Disposition: inline
In-Reply-To: <20250609215044.33ef6b52@akair>


--bq1VQ7xvQiSm4oQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 09:50:44PM +0200, Andreas Kemnade wrote:
> Am Mon, 9 Jun 2025 18:03:05 +0100
> schrieb Conor Dooley <conor@kernel.org>:
>=20
> > > +      - description: TI bone variants based on TI AM335 =20
> >=20
> > "bone variant" sounds like some shortand or nickname. Are the boards not
> > called "beaglebone green" and "beaglebone black"? Whatever about the
> > compatible, the description should use the full name I think.
> >=20
> we have an enum below it listing all those variants. So "variants"
> makes sense here, but better "TI Beaglebone variants"

Yes, this was a comment on calling it a "bone", when that's not what the
boards are called in their marketing material etc, not objecting to the
word variant.

--bq1VQ7xvQiSm4oQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhPVgAKCRB4tDGHoIJi
0kf0AQCBG5FUfKJFQESxkHdprjsOpc1aEZNx782kfcj1wwZEvQD+PYJgZ7einBw4
BiQ/5XM+7HXejbeVK1mMvNsoQFAZPAE=
=agcq
-----END PGP SIGNATURE-----

--bq1VQ7xvQiSm4oQx--

