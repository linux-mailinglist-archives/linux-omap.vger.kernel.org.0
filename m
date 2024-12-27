Return-Path: <linux-omap+bounces-2908-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FBA9FD6BF
	for <lists+linux-omap@lfdr.de>; Fri, 27 Dec 2024 18:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654AA188622B
	for <lists+linux-omap@lfdr.de>; Fri, 27 Dec 2024 17:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E401F8900;
	Fri, 27 Dec 2024 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfQvaPln"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B227080D;
	Fri, 27 Dec 2024 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321562; cv=none; b=grQtDrw370vTiaopz2zf9mguS+j5eWD2XhAR8geb/msH3AM9jaaLR8t85YpJGNRYSvxElLSGBYZWn2vtnZCdnWrj9FssZ18VZDEnhXJLn8BIuYrKII2n7KtanqaPT8idVpCq9iGY32JiZKBdLSukmxhXe5GuMLX2hzYhTYfgLHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321562; c=relaxed/simple;
	bh=BZgJZq9crfNdSQUwDInYAwlrinjpAZFkmmbL3dHquAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otZYSCaitGCGjFK+xY1XBZQ+GEdH0ZtoASLHggAI7T5qE0GO7+aKxpmsgxCLMUmhzF8+ajeqAln9rBqyRfG6scK/W6+ju/965IaYdejCcjF4gfjANrT2HRrbKb54ljc3ZQa6n3aVBtcQ1KffZMPzzkIikBz0p/lbcrjNjSpqNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfQvaPln; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DE2C4CED0;
	Fri, 27 Dec 2024 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321562;
	bh=BZgJZq9crfNdSQUwDInYAwlrinjpAZFkmmbL3dHquAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfQvaPln2tzZ28IzEdFWFVnOi8QmVoJiQH84XOiHeq9AjvmEeI9eXmt0eznaNUru0
	 kHTPBD8FMZ9gE0KvEuikXtPaxlTCtfsAYwBY2p7hG9UL1SBKmYLGlfFLDUK0DOsKYT
	 DZ9BOrEoidkyNaUvnlT+tcbewL7Mswh00sAgFWU4tP9CPb2Vi3MyRrAxeeoYXjBRCc
	 Yq3zecR76cjtUexp7iEKMcZaLYa6NGaMna89jYCe0SDaLi/RQD2EVmK95H9/2KAeaZ
	 3y69jaYDFPojUBkAsOOOX3JkDKYrAE9ujdySukHVkNiicXvg5pWexEpitfeHefoEYt
	 mTANhjfSivEYA==
Date: Fri, 27 Dec 2024 17:45:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, jerome.neanne@baylibre.com,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com
Subject: Re: [PATCH v1 1/7] regulator: dt-bindings: Add TI TPS65215 PMIC
 bindings
Message-ID: <20241227-gratitude-clunky-7999fdeb2656@spud>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-2-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIsoAqEd3k145ye7"
Content-Disposition: inline
In-Reply-To: <20241226215412.395822-2-s-ramamoorthy@ti.com>


--WIsoAqEd3k145ye7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 03:54:06PM -0600, Shree Ramamoorthy wrote:
> TPS65215 is a Power Management IC with 3 Buck regulators and 2 LDOs.
>=20
> TPS65215 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs. The
> remaining features for both devices are the same.
>=20
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--WIsoAqEd3k145ye7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27n1AAKCRB4tDGHoIJi
0lXLAP9iViZ404ojAwKUz/chhC1KlU76CmxQ93n/qX3P8pFZxAEA7Q0gF3SJbymJ
E8YPWNZJBk7RyfZrBKZpt+cvoUnXAgg=
=9RgM
-----END PGP SIGNATURE-----

--WIsoAqEd3k145ye7--

