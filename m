Return-Path: <linux-omap+bounces-3238-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE1A22356
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2025 18:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5512618827EE
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2025 17:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0128D1E0DCC;
	Wed, 29 Jan 2025 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmkrBs4t"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A69D19066B;
	Wed, 29 Jan 2025 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738172934; cv=none; b=MK1+I/QoBhl27EfBmvDx3qICOgfBckdHy++lopZiN1NFEoYBq0K0Wqy+o0fI0x5H+WJQ4u3F+ietLv9WwKUvulsZFcGfD/xFwjSrFIKeLyUTh9INntfZE3S0ogbaNlIyAAhCRE7Agi/bWkLeZzxydPDPndoZncPC2XTbqRGQUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738172934; c=relaxed/simple;
	bh=0mZICetq1ltZupJqnsMYF9aRp1+EuIM+7AJJ0xhWLcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUB3FWtaB0/Nkj39pZUHsIdoDAj2VGoKfKRbnO+OqnDpmOfI1UAqAbHavEfH4e8zoI5JUriG/IJT4OVWah8oRsiyGFXLoVSKu7xpSeRzOiyIRHlDOmExhWXOyFvCQASILENbADSX/UohauRazdT/tJfBAyeZEJTXiEi3Mlxkmnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmkrBs4t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042FFC4CED1;
	Wed, 29 Jan 2025 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738172933;
	bh=0mZICetq1ltZupJqnsMYF9aRp1+EuIM+7AJJ0xhWLcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmkrBs4tG5uJa6hwyPpvaVotnf8N0VRhPwtJ3ohE52yAXNMk2Iw5JzfpenDYEFMe7
	 ISsnDpGGu8V8ATfjwqdrXYuj/ZZvjgZy7GEiuM6ZmeOrcmWUQpyv2ozQ+S9JP7EDmA
	 OE9N4rcRKwqwT3HJZo0ITJeGoSUucA1nh3Cj2WBJ/BQZiWQAD66ftYNsspaiDSXlTZ
	 qPjhCgBcZQQcGC47W4PkjxSqhA1PrQzxJTitJ5yuLSioUS5pmMKRvzvyuKGFbCFEnG
	 ThmlHwpv2MhArFedU7xHyMFQf7NrZw1uZ5Y/zoblJvGfxemZmypCIY++mLxBi1NZGz
	 wU2AC3qoaiosA==
Date: Wed, 29 Jan 2025 17:48:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>,
	andrew+netdev <andrew+netdev@lunn.ch>, davem <davem@davemloft.net>,
	edumazet <edumazet@google.com>, kuba <kuba@kernel.org>,
	pabeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	nm <nm@ti.com>, ssantosh <ssantosh@kernel.org>,
	tony <tony@atomide.com>, richardcochran <richardcochran@gmail.com>,
	parvathi <parvathi@couthit.com>, schnelle <schnelle@linux.ibm.com>,
	rdunlap <rdunlap@infradead.org>, diogo ivo <diogo.ivo@siemens.com>,
	m-karicheri2 <m-karicheri2@ti.com>, horms <horms@kernel.org>,
	jacob e keller <jacob.e.keller@intel.com>,
	m-malladi <m-malladi@ti.com>,
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>,
	afd <afd@ti.com>, s-anna <s-anna@ti.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-omap <linux-omap@vger.kernel.org>,
	pratheesh <pratheesh@ti.com>, prajith <prajith@ti.com>,
	vigneshr <vigneshr@ti.com>, praneeth <praneeth@ti.com>,
	srk <srk@ti.com>, rogerq <rogerq@ti.com>,
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>,
	mohan <mohan@couthit.com>
Subject: Re: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode
 support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250129-vowed-dingbat-cfb5c5b8ede4@spud>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-2-basharath@couthit.com>
 <20250124-reoccupy-music-3803c753f8af@spud>
 <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A1ip/677/ZYHkwQO"
Content-Disposition: inline
In-Reply-To: <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local>


--A1ip/677/ZYHkwQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 10:46:52AM +0530, Basharath Hussain Khaja wrote:
> > On Fri, Jan 24, 2025 at 05:53:44PM +0530, Basharath Hussain Khaja wrote:
> >> From: Parvathi Pudi <parvathi@couthit.com>
> >>=20
> >> Documentation update for the newly added "pruss2_eth" device tree
> >> node and its dependencies along with compatibility for PRU-ICSS
> >> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> >> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> >>=20
> >> Signed-off-by: Roger Quadros <rogerq@ti.com>
> >> Signed-off-by: Andrew F. Davis <afd@ti.com>
> >> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> >> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> >=20
> > I find this hard to believe. If all these people handled the patch, the
> > signoff from Parvathi would be first, no? Should some of these people be
> > co-developers?
> >=20
>=20
> Changes are about multiple modules. We have added our sign-off followed b=
y original module authors.

I think what you're trying to say is that these people are
co-developers? Anyone that contributed to the content of this patch
needs to get a co-developed-by. If they're not co-developers, and you
just want to put them in the maintainers section, they don't get
sign-offs.

> >> ---
> >>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   5 +
> >>  .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
> >>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
> >>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
> >>  4 files changed, 193 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-pru=
eth.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-eca=
p.yaml
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> index e36e3a622904..aad7d37fb47e 100644
> >> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> @@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Peri=
pheral
> >> (IEP) module
> >> =20
> >>  maintainers:
> >>    - Md Danish Anwar <danishanwar@ti.com>
> >> +  - Parvathi Pudi <parvathi@couthit.com>
> >> +  - Basharath Hussain Khaja <basharath@couthit.com>
> >> =20
> >>  properties:
> >>    compatible:
> >> @@ -20,6 +22,9 @@ properties:
> >> =20
> >>        - const: ti,am654-icss-iep
> >> =20
> >> +      - items:
> >> +          - enum:
> >> +              - ti,am5728-icss-iep
> >=20
> > "items: - enum: <one item>" is the same as const.
> >=20
>=20
> Sure, we will modify as below.
>=20
>       - const: ti,am5728-icss-iep
>=20
> >> =20
> >>    reg:
> >>      maxItems: 1
> >> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> >> b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> >> new file mode 100644
> >> index 000000000000..51e99beb5f5f
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> >> @@ -0,0 +1,147 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Texas Instruments ICSSM PRUSS Ethernet
> >> +
> >> +maintainers:
> >> +  - Roger Quadros <rogerq@ti.com>
> >> +  - Andrew F. Davis <afd@ti.com>
> >> +  - Parvathi Pudi <parvathi@couthit.com>
> >> +  - Basharath Hussain Khaja <basharath@couthit.com>
> >> +
> >> +description:
> >> +  Ethernet based on the Programmable Real-Time Unit and Industrial
> >> +  Communication Subsystem.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - ti,am57-prueth     # for AM57x SoC family
> >> +
> >> +  sram:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to OCMC SRAM node
> >> +
> >> +  ti,mii-rt:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to MII_RT module's syscon regmap
> >> +
> >> +  ti,iep:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
> >> +
> >> +  ecap:
> >=20
> > Why's this one not got a ti prefix?
> >=20
>=20
> We will add "ti" prefix to ecap as "ti,ecap" in the next version.
>=20
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to Enhanced Capture (eCAP) event for ICSS
> >=20
> > Why do you need phandles for these things, can they not be looked up by
> > compatible? (e.g. multiple devices on one SoC).
> >=20
>=20
> ecap is another peripheral similar to IEP in ICSSM/ICSSG. We have created=
 a separate driver for possible reuse with ICSSG in future.

That's not an answer to my question.

>=20
> >> +
> >> +  interrupts:
> >> +    items:
> >> +      - description: High priority Rx Interrupt specifier.
> > > +      - description: Low priority Rx Interrupt specifier.
>=20
>=20
> Thanks & Best Regards,
> Basharath

--A1ip/677/ZYHkwQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5pp/AAKCRB4tDGHoIJi
0j1XAQDUL9qTPiwK0zX2laAS1VtLc/BPBORTGaY0J9aaaWzQzQEA3B7TIVYm6bzB
4hBCMr4G0YOuHuOpH2AJFTavyt3K/ws=
=od+I
-----END PGP SIGNATURE-----

--A1ip/677/ZYHkwQO--

