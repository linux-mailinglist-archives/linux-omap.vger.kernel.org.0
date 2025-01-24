Return-Path: <linux-omap+bounces-3218-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDEA1BABC
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 17:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588993A1A64
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 16:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0732192B94;
	Fri, 24 Jan 2025 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n72B981p"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EEE1946CD;
	Fri, 24 Jan 2025 16:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737736796; cv=none; b=jQ59uzrf/2DZ32td+bPlFGfo/TnQxs+RbKLFIwEPVPJPJMR7OZ6qdp8vPU5L/+MyXnIBV7cBCQoVvmxjB+wH4udjSyZKjK+h/jcTx8SrzAEbze+3JJje0aHMnJUMs//WV18c123GLkXHckqMdgq7pKlXu9N836DZna1pSu6O3wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737736796; c=relaxed/simple;
	bh=gxAjU9tvE1jlETOZTp5Bcxsm8BQQcCyXUg5i4sr/H00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSzx44WyUSvEwEfwJJnsP4nPwdRErvpbRXQ22AmbChv/B9vzzTo8zH5NOgHPbm7RNkcku5g5ElN45NdKSK96fn938FhLTB97YgH34OK50YcW/nY0mTRR6nqdbvWbI31H4a6L4TzWSIprXro63oNBxrNYIDTZj3gcTNwFvvLAPR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n72B981p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87234C4CEE2;
	Fri, 24 Jan 2025 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737736795;
	bh=gxAjU9tvE1jlETOZTp5Bcxsm8BQQcCyXUg5i4sr/H00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n72B981pD+jYNl8Kb2ezStcA2V0kQBf7LL/8o20dInsX1yPEHO6gbECDqo0YEdDpP
	 fIb7o6L1vkdrzK6VsCeSv5BzEeCyYXl8ont9ZqQpcgs2zYQzFQGVNrBZCe7kEBgzGt
	 UpR5Cn7cfuIs9FGpcCQ8iikpIfg3EcVFVAyY/tYXEKarqN5meNOmdQv0CNgpnitiVT
	 SInM3+aQlGcdB2wo5xmBug/IIHlmDDTZlZcGZq/mb3QAIa2C8xO6ogaRjvfLzm270S
	 OakiWOj0A1eJpgao5I6CQtEdqXo3u2TZlSzwMytDHDMWRVhgmoHYqphQ6mXu1jjemK
	 xtctvOQcNxsrg==
Date: Fri, 24 Jan 2025 16:39:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode
 support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250124-reoccupy-music-3803c753f8af@spud>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-2-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cskVUvouOv9G4JC6"
Content-Disposition: inline
In-Reply-To: <20250124122353.1457174-2-basharath@couthit.com>


--cskVUvouOv9G4JC6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 05:53:44PM +0530, Basharath Hussain Khaja wrote:
> From: Parvathi Pudi <parvathi@couthit.com>
>=20
> Documentation update for the newly added "pruss2_eth" device tree
> node and its dependencies along with compatibility for PRU-ICSS
> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
>=20
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

I find this hard to believe. If all these people handled the patch, the
signoff from Parvathi would be first, no? Should some of these people be
co-developers?

> ---
>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   5 +
>  .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>  4 files changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth=
=2Eyaml
>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Doc=
umentation/devicetree/bindings/net/ti,icss-iep.yaml
> index e36e3a622904..aad7d37fb47e 100644
> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> @@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Periphe=
ral (IEP) module
> =20
>  maintainers:
>    - Md Danish Anwar <danishanwar@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> =20
>  properties:
>    compatible:
> @@ -20,6 +22,9 @@ properties:
> =20
>        - const: ti,am654-icss-iep
> =20
> +      - items:
> +          - enum:
> +              - ti,am5728-icss-iep

"items: - enum: <one item>" is the same as const.

> =20
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b=
/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> new file mode 100644
> index 000000000000..51e99beb5f5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments ICSSM PRUSS Ethernet
> +
> +maintainers:
> +  - Roger Quadros <rogerq@ti.com>
> +  - Andrew F. Davis <afd@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> +
> +description:
> +  Ethernet based on the Programmable Real-Time Unit and Industrial
> +  Communication Subsystem.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am57-prueth     # for AM57x SoC family
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to OCMC SRAM node
> +
> +  ti,mii-rt:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to MII_RT module's syscon regmap
> +
> +  ti,iep:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
> +
> +  ecap:

Why's this one not got a ti prefix?

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Enhanced Capture (eCAP) event for ICSS

Why do you need phandles for these things, can they not be looked up by
compatible? (e.g. multiple devices on one SoC).

> +
> +  interrupts:
> +    items:
> +      - description: High priority Rx Interrupt specifier.
> +      - description: Low priority Rx Interrupt specifier.


--cskVUvouOv9G4JC6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5PCUgAKCRB4tDGHoIJi
0uJFAP9ZxreR5UcuqvEpcbnYm2L4r5oA/Kscp36IjeTqNO8CoQD8Cf+6H7qjtg1s
NCLjqaOagU1YyP0Z2/RmSeGOuFnEfwg=
=GEG4
-----END PGP SIGNATURE-----

--cskVUvouOv9G4JC6--

