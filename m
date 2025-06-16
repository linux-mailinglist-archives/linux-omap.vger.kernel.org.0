Return-Path: <linux-omap+bounces-3888-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81DADB481
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 16:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BBB97A846A
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 14:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B6820DD49;
	Mon, 16 Jun 2025 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AviViFz8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712881FDE31;
	Mon, 16 Jun 2025 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085547; cv=none; b=ELyQPh7rf9jhjAwBWAPOocFeyacBDGjcWN4P2YOtW+90cvH4jmDy1hH6j3FUEKIU6rqfYsKc7PRcMICY8KHVen87dkTfMCHmyo8vDQgMVDQgUHTs+ft9MIYhmLCAhm82aznfbjpA/JEzKKSswYNKWiFkBIfCP9l1cVOx5UzpdxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085547; c=relaxed/simple;
	bh=bPuvx70ZOohoMirTtBhIdmAQVlAZJUxM/oDnk3mWn5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZD3VQuQ1PtFq6rDQjJeQivSApq6HtshFe6wuz8Rr7ekx9YlE0yo7nvePDLOqOeYJUh6j3AzWvr4gLbbVhD1oaWE4csIflI5btlCB9uJJRbgagZ+1+6owQ9yzJw6zj/4bdYKGRKSq7afx5l7WOtESJGyqewBqW6NZLUiWJOLg64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AviViFz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A616C4CEEA;
	Mon, 16 Jun 2025 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085547;
	bh=bPuvx70ZOohoMirTtBhIdmAQVlAZJUxM/oDnk3mWn5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AviViFz8EDSu4pci4/s35SA1EqiENbj+hMVxRmOPRm70Az5musdKvmu9A76JmREBN
	 lqQVDakjXqlhAIkWJp9ABAW4/s5Led2bkjbdMB4FEDiYrdTH/U6abDbfSI6xaLtwhz
	 V762DmpOqOrEs9gpSu8bLgLPnCqRXf67JzcKF7EwByyiSrBE2Ixn6TZ0zkVRmiPzlu
	 cBTXzeuatxpRD+D/ljoBdyEmczJe0grP7mkQHUkRIw+5Tjs5XpNjpmmgh2T+5P79Y1
	 x6UZbY/qPahUUjKXdMSQv/lP2nTTHYIAjTulak70ZXln6pW/68GWC1HxrAy4PmCMBd
	 98szxgsNLrYUQ==
Date: Mon, 16 Jun 2025 15:52:20 +0100
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
Subject: Re: [PATCH v3 4/7] dt-bindings: omap: Add Seeed BeagleBone Green Eco
Message-ID: <20250616-scientist-displease-7fba3321aa8f@spud>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
 <20250613-bbg-v3-4-514cdc768448@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NffML9ZiH2lsh2fO"
Content-Disposition: inline
In-Reply-To: <20250613-bbg-v3-4-514cdc768448@bootlin.com>


--NffML9ZiH2lsh2fO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 05:49:47PM +0200, Kory Maincent wrote:
> Document the seed,am335x-bone-green-eco compatible string in the
> appropriate place within the omap family binding file.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NffML9ZiH2lsh2fO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFAvpAAKCRB4tDGHoIJi
0nSjAP0QTnkfbkMNtybseo1N8W/Zu0dXYmt/Zvr8lhBp4dvehAD7BpcL4CUzvHX9
ruQ7cqsF7o2eAFOxPej8RZ+ayyl54gU=
=zZQH
-----END PGP SIGNATURE-----

--NffML9ZiH2lsh2fO--

