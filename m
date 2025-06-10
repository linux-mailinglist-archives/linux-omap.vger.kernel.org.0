Return-Path: <linux-omap+bounces-3788-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3247AD2F7D
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 10:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2D9188696E
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 08:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C76280005;
	Tue, 10 Jun 2025 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AMYHv+YB"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13E21FF25;
	Tue, 10 Jun 2025 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542752; cv=none; b=OdHR5uNtzAbHfTGMVAstZH9FhMBY2IudJWZEf7WjHkViRHkGr8Ls4wIxyNcmdM+NmnsBcVprYTLLtqJLEKhEvPXZjk97CqU7MfJWsjHwDPdmizHygSex+SuGisdKSnN6cTNb3F/gd/xkaaYVyN7tjmTwvlRKE3BYD8wbWY06rk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542752; c=relaxed/simple;
	bh=R0LZ4WPp+OZg/a0tufPN45j+fi9t2hD3NjBIp0M9uzM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cD875/VCiDHO63N8Qb2pjqzWK4zVedylTlKkTtXZoFDAG19kAy99BMnCry9A89vYiDQV2m7SQW//ca+67061wh7DOgkxD2P9EniSuA61AqIX5xHa/b7qZXs726dlKm4jk/cPjbzvGBECUaqjmEbhvf/DPPdF9cMFaux21kg2PCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AMYHv+YB; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3485B43B18;
	Tue, 10 Jun 2025 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749542747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbFv7luxCC5IISk2uJse1688WeTghFStrZlFWtawY5I=;
	b=AMYHv+YB2V7GGqx349LfS0wy7zrqWUk+OUwn0m+foMWfBSDDu5wpy+lDYu019KHki8B4YE
	BQBxd6TlDpxQWsejIBbs9J7RWu+BCJRDcHfjvRbRLm68MKlhzst1Nq7pyacfC2PpiF4Ei5
	NsQwQzU/SxuxZ8pKvZJBdVYU4H8/S7MLDs1R7stTtZAJUAExVtevtUrZ1sTAfTpLcvPMKZ
	wly9lvCjL7kqqmPRMUjTCYWpbpwIqZDEZAXCWlZf1EBndFl7S4yKOvtBImE4kpmJUPDno6
	bcXXcjnnNaW/x66rz/2j0xZCVbaY5Ps8BS4gADOgWkEwBPuEHvEtBuoKsXUMKw==
Date: Tue, 10 Jun 2025 10:05:44 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250610100544.4beb07e2@kmaincent-XPS-13-7390>
In-Reply-To: <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-2-5278026b7498@bootlin.com>
	<53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Le Mon, 9 Jun 2025 18:34:10 -0500,
Andrew Davis <afd@ti.com> a =C3=A9crit :

> On 6/9/25 10:43 AM, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation. Add description for Bone, BoneBlack and BoneGreen
> > variants.
> >=20
> > Add several compatible that were missing from the binding.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Change in v2:
> > - New patch
> > ---
> >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38
> > ++++++++++++++++++++++ 1 file changed, 38 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > 3603edd7361d..c43fa4f4af81 100644 ---
> > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -104,12 +104,50=
 @@
> > properties:
> >         - description: TI AM33 based platform
> >           items:
> >             - enum:
> > +              - bosch,am335x-guardian
> >                 - compulab,cm-t335
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - moxa,uc-2101
> >                 - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                 - novatech,am335x-lxm
> > +              - oct,osd3358-sm-refdesign
> > +              - tcl,am335x-sl50
> >                 - ti,am335x-bone
> >                 - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-pocketbeagle
> > +              - ti,am335x-shc
> >                 - ti,am3359-icev2
> > +              - vscom,onrisc
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone variants based on TI AM335 =20
>=20
> Do we really need these "bone variants" split out from the above
> list of TI AM33 based boards? We don't do that for any of the other
> boards, you get a SoC and a Board compatible, every classification
> in-between is just unneeded.

As omap maintainers prefer. I did that to have the least amount of change in
the devicetree. We could have U-boot using these compatible but after a qui=
ck
check it seems not.

Regards,
--
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

