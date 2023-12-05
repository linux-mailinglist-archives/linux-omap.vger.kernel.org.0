Return-Path: <linux-omap+bounces-120-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA3804AC6
	for <lists+linux-omap@lfdr.de>; Tue,  5 Dec 2023 07:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D921F21486
	for <lists+linux-omap@lfdr.de>; Tue,  5 Dec 2023 06:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FA715481;
	Tue,  5 Dec 2023 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2nj7Yex"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069D5D302;
	Tue,  5 Dec 2023 06:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66ECC433C8;
	Tue,  5 Dec 2023 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701759481;
	bh=zU7bTrxdpBYUmSDNAlUUH1oAlR/IAxzg27ffUEN0aqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2nj7YexWsNxGq1DW0G+3ScWUIilUHilBq/5ctjgR9pfK+8AbSPMb5Z4AOxi1s4s6
	 j7Qy6xxw9Epswxmbxh6NDRdPu8JKiTg4vB/JdcJ32GWgjPHOOWH7MI4xfqv3RAPWKI
	 Gk9WocRqObcfOlG9R840rGCtyoXnhEqxSPAyBJOcegTZMARz32V8t7M1hvHpR5pqer
	 dv42RHxrXnzHdvuNOYirCcLiJFswHZMlWgLFZvdIYCJi0OxiRKyaq+oH+lQTkxQEX0
	 X2fDC6nUBL+CqpI0Hci+a+Jsr8Nw28iVqoLbdue2UHEbMrc5hXnSJkDwIsVr0mtt+T
	 PRb2rNZzFUnEg==
Date: Tue, 5 Dec 2023 07:57:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Frank Binns <frank.binns@imgtec.com>, 
	Donald Robson <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>, 
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3drixbas2c643fb"
Content-Disposition: inline
In-Reply-To: <20231204182245.33683-2-afd@ti.com>


--y3drixbas2c643fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
> multiple vendors. Describe how the SGX GPU is integrated in these SoC,
> including register space and interrupts. Clocks, reset, and power domain
> information is SoC specific.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++--
>  1 file changed, 63 insertions(+), 6 deletions(-)

I think it would be best to have a separate file for this, img,sgx.yaml
maybe?

Maxime


--y3drixbas2c643fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW7J9gAKCRDj7w1vZxhR
xeU2AP9mvBxXe/cJsKPcYEfxWRhpvRor2SswHRWF6NJUuqagJgEAibpTgY0sHnsx
bw4+3yY5CjgxLG+iw0A7d3xv1r1ZJwI=
=8RNH
-----END PGP SIGNATURE-----

--y3drixbas2c643fb--

