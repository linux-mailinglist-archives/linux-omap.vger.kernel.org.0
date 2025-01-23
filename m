Return-Path: <linux-omap+bounces-3201-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70EA1A9C0
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 19:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73E713AE5AD
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 18:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABD117085C;
	Thu, 23 Jan 2025 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mle9lWV4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36389155742;
	Thu, 23 Jan 2025 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737657784; cv=none; b=miaW3Thd2zSF+tPIs09F/Pb8rfe0jlZmuYrmlQ/Dkdq0GMAZxTVIFzP54IJdBgAadfzs82wv4RCkdMbNezB6A/YFDjaMRg+FzoOe0n0P6jHVLrEoxEkiAjj5GTwYCwTY3zpVOFlr1vbpvt6dN827KwrP+RxePiDFmbQZRNOg9C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737657784; c=relaxed/simple;
	bh=ajDAQvGl3Kq/VTkP8JLL6spOgXk8Q6dqBlIkfhJc0PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr2PzL7L14Xyr2BeLbDfmS3X0sshfwvrDfEr7/uDflftcIMIdZyyVgAkSEqrnmS5UpBL2xioCdKd3bFoPLnbfs3RK+ah1ARGHPvy2TkN+GXtn8Wgb7bncqQqxRzw7INWwNUvjnTboGzB6hsZMKsmjHQ1jFoqhuglkPZ6td1tjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mle9lWV4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B33FC4CED3;
	Thu, 23 Jan 2025 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737657783;
	bh=ajDAQvGl3Kq/VTkP8JLL6spOgXk8Q6dqBlIkfhJc0PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mle9lWV4yl7T744NLRf8xKq0NxGVJrBjUQS+m13LH4RizsImRQJdvcnsTy38gjHEU
	 wtd78Ngdyow1uIoT7QVEBKNs2MAxnkk4h7kTcq70Nc4o/x82SDOIQTjDPIdrQy7q9A
	 OSx9rmt84JwpVVgJCWnslOKFANA8Wzieq0Snpp9ZE/smlabdGSxlhNlBEsnlsgR6Oq
	 RmOqkgaPflzM1JeOUiQo9N8c2ncJrvFkyBmqhKY4viw9m9tAHMSJf22ae4lnd/1sVJ
	 y6eT1t/jOR92FQvTTYq55EBe80YzdG6gDIqbMjJDccDNNS6mwmLjeUm3XuweuUb8+W
	 u+G/XcGVsI7eQ==
Date: Thu, 23 Jan 2025 18:42:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Tom Rini <trini@konsulko.com>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-ID: <20250123-proved-celtic-938893d9baa3@spud>
References: <20250123174901.1182176-1-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+NkPFfDh+nX1vEWC"
Content-Disposition: inline
In-Reply-To: <20250123174901.1182176-1-trini@konsulko.com>


--+NkPFfDh+nX1vEWC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 11:49:00AM -0600, Tom Rini wrote:
> Document the ti,omap4-panda-a4 compatible string in the appropriate
> place within the omap family binding file.
>=20
> Signed-off-by: Tom Rini <trini@konsulko.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> Changes in v2:
> - Include as part of the series with binding addition, make this be
>   first.
> - Rework as suggested by Andreas Kemnade (slight rewording after Robert
>   reminded me A4 a production rev and not "alpha" rev.
>=20
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documen=
tation/devicetree/bindings/arm/ti/omap.yaml
> index 93e04a109a12..3603edd7361d 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -141,6 +141,13 @@ properties:
>            - const: ti,omap4430
>            - const: ti,omap4
> =20
> +      - description: OMAP4 PandaBoard Revision A4 and later
> +        items:
> +          - const: ti,omap4-panda-a4
> +          - const: ti,omap4-panda
> +          - const: ti,omap4430
> +          - const: ti,omap4
> +
>        - description: OMAP4 DuoVero with Parlor expansion board/daughter =
board
>          items:
>            - const: gumstix,omap4-duovero-parlor
> --=20
> 2.43.0
>=20

--+NkPFfDh+nX1vEWC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5KNsgAKCRB4tDGHoIJi
0r/QAQCv1miGZOK7Q9vZcktMU3WyWKs3QXduJlTTch/I7guAVQD/Y+AzWwVJKbBZ
5stFtQUSFusmTCe35NNRWNT7mm5icQI=
=Nv5Z
-----END PGP SIGNATURE-----

--+NkPFfDh+nX1vEWC--

