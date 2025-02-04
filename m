Return-Path: <linux-omap+bounces-3261-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4033A2798C
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2025 19:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0BA1658D8
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2025 18:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6508D216E2A;
	Tue,  4 Feb 2025 18:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2rbyC2b"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E653C78F4A;
	Tue,  4 Feb 2025 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692987; cv=none; b=GOBZze1WZI3PIzEbFbFM/DYs5wS918Ag0bphjsUIegPU2cRWGXF7QZLYA16T0OOvVdijAIqVAg9TXogc24RSrloiAJPdvX5yuJZHIZtUEiZqVda9waJSj3SpnvwQJosn0FhWIPq/4eEedUmmbNJ3ioMlSD8YjWREMJZQAAjO/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692987; c=relaxed/simple;
	bh=dmGkjt2zNEiAgl6N9re2M4LE4xSbtASeqzfY0ChaYqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUQK+nUX6aEnjMMY4J51O8TOFIYacoo+TEOPWIyD0q9bIZ2g25L9Gpv//iP2MKZwhVaERF5hpfx9ktfbq/MYrmrfhVzIddEB+MhBRkB0pbSUJAzsDxnKce1buonurc8f1bVQRWgZdHa7k84C4jZiZuyOwlQlY4YINQRVf2QxP98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2rbyC2b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F21C4CEDF;
	Tue,  4 Feb 2025 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738692986;
	bh=dmGkjt2zNEiAgl6N9re2M4LE4xSbtASeqzfY0ChaYqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2rbyC2bZq476y9HKzgTYiM2Xc1LS8wT5IY0iDXZoAcPwDZPvoNEugkvA6mcOCNB8
	 RJ4fLX4BkO4ZhXkOnsLWZHSLB0yjPddBnC9mywKlMKda6THJ8ZdKfZi/oM++vwZVnL
	 VaWoSxz4foT3b68sy1qtAGjpHbIQ5SvKXVCF7DaTj/lse75FmzkkpeTvevyfIQUxE0
	 LNQ3hxtMUS+OBadhM+AAsSQlmOSexS0z5ykGzKQ+ryp1F2bdWVJVlS2+gZcfTr7Z+1
	 24MRpJZw0YgOCJh25zJ9zH0Ya2wtFhzIqaLkuDAX6wXjCcCN6jVaC7IUod/8hn8ZyK
	 5JoNKYf4VU/cQ==
Date: Tue, 4 Feb 2025 18:16:17 +0000
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
Message-ID: <20250204-mutilated-throwing-59cabf18f187@spud>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-2-basharath@couthit.com>
 <20250124-reoccupy-music-3803c753f8af@spud>
 <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local>
 <20250129-vowed-dingbat-cfb5c5b8ede4@spud>
 <2028988664.494856.1738585795471.JavaMail.zimbra@couthit.local>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K8COnd4nDaIlA8yU"
Content-Disposition: inline
In-Reply-To: <2028988664.494856.1738585795471.JavaMail.zimbra@couthit.local>


--K8COnd4nDaIlA8yU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 05:59:55PM +0530, Basharath Hussain Khaja wrote:
> >> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> >> +    description:
> >> >> +      phandle to Enhanced Capture (eCAP) event for ICSS
> >> >=20
> >> > Why do you need phandles for these things, can they not be looked up=
 by
> >> > compatible? (e.g. multiple devices on one SoC).
> >> >=20
> >>=20
> >> ecap is another peripheral similar to IEP in ICSSM/ICSSG. We have crea=
ted a
> >> separate driver for possible reuse with ICSSG in future.
> >=20
> > That's not an answer to my question.
> >=20
>=20
> We can use compatible if we have only one instance of a peripheral in the=
 SOC.=20
> On the AM57x SOC we have two identical ICSS instances(ICSS1 and ICSS2). S=
o we=20
> use phandles to differentiate between the two instances. Currently this p=
atch=20
> series adds support for ICSS2 instance on the AM57x SOC. Support for ICSS=
1 instance=20
> will be added in subsequent patches.

Cool, that's an acceptance answer, thanks.

--K8COnd4nDaIlA8yU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JZcQAKCRB4tDGHoIJi
0gnAAQC1oGfhZbnFSM/mPgMlsOYSL9Jy1uxEojT2QLRGkF15CQEA9H2GXROw3Fk2
eXUwUknLlmzd/8uguMbvTucbVOMokgs=
=3zMy
-----END PGP SIGNATURE-----

--K8COnd4nDaIlA8yU--

