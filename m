Return-Path: <linux-omap+bounces-4324-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9FB347BF
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 18:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDA61B250EA
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 16:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D7F30102E;
	Mon, 25 Aug 2025 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgWjVu8x"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC22F361C;
	Mon, 25 Aug 2025 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756140061; cv=none; b=XB/p7+NZ+1y76Nv1FrNMGfxlxF+k1r/6X92fLXkKzmLlZdOdmU4jlPNxw9RnzANu/S4i2tGj5FEjIHLOEvGzj34QBHTo1MGHM4dLbcN8JL+1CZ9wqkc6aUdGohHPom6+Jsnf7KSCLu93G8tk+6/0ztNQCZ2tmG4+wi41zRIgO88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756140061; c=relaxed/simple;
	bh=MtnAzMyeqMezeXleaox5Uha9RtDkMAqaifY8puJkv4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXrNfrE0e+lHkGhGAeENvMDKHXruE9gkR5IR4iwMsIUzgpXDo9sRNytLob4IaUi9k5Bu3mAlAzm6pt2GBsQgpN1F1NI5Mw7UdD6LWgEoMVIIlUziPEovqC4Kh2i11nZGbpIY6qqYZJTw5P9wFTxr4w1y38wak8N7gr9l2OJrTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgWjVu8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36988C4CEED;
	Mon, 25 Aug 2025 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756140060;
	bh=MtnAzMyeqMezeXleaox5Uha9RtDkMAqaifY8puJkv4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgWjVu8x9dh7PCUnYifr7XDROSQZBXuQZo4sQrtoAM2Wxc4IFOLALfhu6PzdUkL8l
	 2RBh5zQeCqIJ9I67EqBTt0Yg7PJ1fKwMXrUqTnJgU7QRCM/5VnMc/vQXGWXCbIcc+q
	 F6Q/iQGGCgTebUrpkqV9gL4xJiijsuymMh+eRge2dkascIxmTN7ToiEYXXzPsP2zAu
	 TAhHCmaGUDJjBaEjSNB2dqprbU8oxnKLeRoQAh8VQI9QHxin7R92fdcx33raFpOpl+
	 7fQa7wCUsMn21mSyOlvtCjdEUOFz6igtSMfjpQxeUBbLg7S5T8gb8pl5be3giv6f1r
	 NB1+4r/nVigwQ==
Date: Mon, 25 Aug 2025 17:40:56 +0100
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
Message-ID: <20250825-decal-purchase-8cfe0003a3f2@spud>
References: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
 <20250825-ektp-submit-v1-1-1dd476c1277b@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mT/SPNPuakV8wKy"
Content-Disposition: inline
In-Reply-To: <20250825-ektp-submit-v1-1-1dd476c1277b@kemnade.info>


--4mT/SPNPuakV8wKy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 12:07:28AM +0200, Andreas Kemnade wrote:
> The Elan eKTP1059 Touchpad is seen in the Epson Moverio BT-200
> attached via SPI. Add a binding for this chip. Little is known.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../devicetree/bindings/input/elan,ektp1059.yaml   | 45 ++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/elan,ektp1059.yaml b=
/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
> new file mode 100644
> index 000000000000..a10256a271e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/elan,ektp1059.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/elan,ektp1059.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Elantech SPI Touchpad
> +
> +maintainers:
> +  - Andreas Kemnade <andreas@kemnade.info>
> +
> +allOf:
> +  - $ref: touchscreen/touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: elan,ektp1059
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false

Shouldn't this be unevalutedProperties: false, since you want to make
use of what's in touchscreen.yaml?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        touchpad@0 {
> +            compatible =3D "elan,ektp1059";
> +            reg =3D <0x0>;
> +            interrupt-parent =3D <&gpio4>;
> +            interrupts =3D <0x0 IRQ_TYPE_LEVEL_LOW>;
> +        };
> +    };
>=20
> --=20
> 2.39.5
>=20

--4mT/SPNPuakV8wKy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKySFwAKCRB4tDGHoIJi
0ivmAP9aLyX6wgSdK7ePmGFlpdO/wNM0i1TE9us5VY86/cjQHwEAhqqLXW5cxIX0
WECdhEEmH2EPEGDahNg4JKVSTC9TAAY=
=KaSE
-----END PGP SIGNATURE-----

--4mT/SPNPuakV8wKy--

