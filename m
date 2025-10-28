Return-Path: <linux-omap+bounces-4807-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B876C16A94
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 20:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 403F81B27FBE
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 19:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C475625784A;
	Tue, 28 Oct 2025 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph8sVaf5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDA711713;
	Tue, 28 Oct 2025 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761680952; cv=none; b=kXsJec9tRtbt3ADRlInr4hYtujlp6O1SJMf4cOsD7/98TxXifBjEL5tm04iDy+myUSjPZioLDvRAKEL0MJ13jFXycDO/aTqSw2xunW4tSM5y/piFdS9er/2UVVVqvEb7Ggw53fGGbXgMga0rWqweQmj8KkcWn9qQscCigGmP0VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761680952; c=relaxed/simple;
	bh=CKEsyC7pw4d0z7ZyuFMSd7YgtnsZCVl+k1LMpg2/quw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnO7FDqb8J4lBlG7XkX9CeFDYb3wO6LsBIYTZ3FJ2le0rZbDILEj8c8dGfZrkg4PeBwdY96yX8glqbkiAPIB6uDWcj719gEM3ZP+B3zdpHsBQ+LsYjN/Td7JSSbTxbctKhNDBQ34G/gRKGXMUSXkIR5y1wgWmwKF+Eyqqd4EyPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph8sVaf5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56113C4CEE7;
	Tue, 28 Oct 2025 19:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761680951;
	bh=CKEsyC7pw4d0z7ZyuFMSd7YgtnsZCVl+k1LMpg2/quw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ph8sVaf5Rtft1OeMIpzBp8XXE9J6AI73lJKLRRaYivAP68Bpc2gF40KapFg2+cIyT
	 ppgm6rBqaFhCfpCjKvQ3gBfLwDFtOgjzTjmqnyOMomU8gs8dzoxVhxJHIBMuV5fP0H
	 u1MQYtat+9F2bJHeS8NUskDn/cF8b5n9WHbvGKQXhfIgMesZXpkBLw8K+m4JCA+mha
	 A/W8wzotRgYGNsaP6/gnaQUw6dMVU1/l+7AVW/9o31oX06sWDte6d7NWzpR/xWjYCv
	 2c/Mhfw2KFu1hpm+kwVs7iW9Qi5wrmH+0DQOb3v95RBUyExK40+IOp4BXbRDUEzgk9
	 vKiRzDgx7q7PQ==
Date: Tue, 28 Oct 2025 19:49:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: input: elan: Introduce Elan
 eKTP1059 Touchpad
Message-ID: <20251028-unlocking-designing-efbdc8ca49df@spud>
References: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
 <20250825-ektp-submit-v1-1-1dd476c1277b@kemnade.info>
 <20250825-decal-purchase-8cfe0003a3f2@spud>
 <20251028204149.325506f6@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jvj0xhg5VQhOffjA"
Content-Disposition: inline
In-Reply-To: <20251028204149.325506f6@kemnade.info>


--Jvj0xhg5VQhOffjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 08:41:49PM +0100, Andreas Kemnade wrote:
> On Mon, 25 Aug 2025 17:40:56 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Mon, Aug 25, 2025 at 12:07:28AM +0200, Andreas Kemnade wrote:
> > > The Elan eKTP1059 Touchpad is seen in the Epson Moverio BT-200
> > > attached via SPI. Add a binding for this chip. Little is known.
> > >=20
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > >  .../devicetree/bindings/input/elan,ektp1059.yaml   | 45 ++++++++++++=
++++++++++
> > >  1 file changed, 45 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/input/elan,ektp1059.ya=
ml b/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
> > > new file mode 100644
> > > index 000000000000..a10256a271e0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
> > > @@ -0,0 +1,45 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/elan,ektp1059.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Elantech SPI Touchpad
> > > +
> > > +maintainers:
> > > +  - Andreas Kemnade <andreas@kemnade.info>
> > > +
> > > +allOf:
> > > +  - $ref: touchscreen/touchscreen.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: elan,ektp1059
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +
> > > +additionalProperties: false =20

btw, there's two spaces at EOL here. Is that in the patch itself, or
just a mail artefact?

> >=20
> > Shouldn't this be unevalutedProperties: false, since you want to make
> > use of what's in touchscreen.yaml?
> >
> did not do too much thought about this yet. But am I allowed to use this
> in a touchpad? BTW: who defines whether the chip is a touchpad? T*P* in
> its part number might be a hint, the device where I am using it, uses it
> as a touchpad. But who says it cannot be glued onto some screen?

I've got no idea what you're talking about here, I don't know anything
about the mechanics of touchpad chips. All I am commenting on is that
you're including touchscreen.yaml but do not permit any properties
defined in that binding to be used for this device.

--Jvj0xhg5VQhOffjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEeMwAKCRB4tDGHoIJi
0l5+AP4m7nww0iHVAtMhmQQmWIi5aQT1bVrqcjpi0pSyREAxmQD+Olwl99HkT547
+YKrVSEzoLpdnnCeg8IDDotNDmhOmwc=
=mLkH
-----END PGP SIGNATURE-----

--Jvj0xhg5VQhOffjA--

