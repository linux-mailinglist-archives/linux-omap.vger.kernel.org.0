Return-Path: <linux-omap+bounces-3784-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA06FAD2799
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 22:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2CF3B1D9E
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 20:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F13221726;
	Mon,  9 Jun 2025 20:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YrK78fOZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D021D3EE;
	Mon,  9 Jun 2025 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501325; cv=none; b=N3Q2GwTo5KnjL1yUsy7CC40XRw3+aHiV3JPTL+H3IerGCE4knaspJmLWLSaG4FdUfZG3/PSIY92cabeGjs4smcrvWB5YZGiOxkAuzbm7BcU8nzukUwtb2tliq15vgD0lz1yyW8F/dQmwK1x7XCYTeS55yFCuikIR6rG5QaRK3xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501325; c=relaxed/simple;
	bh=Fs6P0u7FSsyMJlOZbjCW9SUJIuR6W5jHyZmibIaJAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZX1VwXXM+RguEFxbRNjtrVcScQHm0XdqjofAKO5XgbyvGk2fFIZbbzKsgjUkPVsnGAxnKl8U3Ed4Ao2dXWQc/lh+5cRtoEC7hQjRGvvQQQ6iMLKuq2IUfUYmTu9D2zSB1k8lN4IXamBUGJj3rUPLJyc+acxrM/3JBXVj9EU7ork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YrK78fOZ; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9510442C7;
	Mon,  9 Jun 2025 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749501320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZOonTfrv64GIV5+rDFu+eH6vhEGsf8KKT5JpDnAQ04=;
	b=YrK78fOZJDmLOg1RDpxGMfVw6vaSzXByQyQaykHVH/1X5NOCYhIm4g1T8qzTHme003x90b
	VnwtXQG6E3xFyRfYrU7hSlHzRD162lYU64kTsqLgoLLmF6jKimBGtw0wQ91RimxpOgxvsz
	Fjj6+uSdffdgYJ+k6BDdyyHCA0P9A3+uFbcPcaUY6npbyjb+aGuqFx/8Od5QMD/FKV1MmY
	DdoYGs4QkA4O7Yg7S87xmuutd6w0GyjsDlaTg8FTDDAAq9u4NSW60dKjHpuatxw/rkIStT
	O4SWy0Zii9SUoCuFoSZrOkqHZDjkJZBGQOpTz2H74DBpOE4YfnzSVDBIFBy26w==
Date: Mon, 9 Jun 2025 22:35:16 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250609223516.32ec18be@kmaincent-XPS-13-7390>
In-Reply-To: <20250609220809.3a488972@akair>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-1-5278026b7498@bootlin.com>
	<20250609220809.3a488972@akair>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeljeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeelhegvvgemrggvugdvmeeitgeksgemudgsfegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemleehvggvmegrvgguvdemiegtkegsmedusgefsgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

Le Mon, 9 Jun 2025 22:08:09 +0200,
Andreas Kemnade <andreas@kemnade.info> a =C3=A9crit :

> Am Mon, 09 Jun 2025 17:43:51 +0200
> schrieb Kory Maincent <kory.maincent@bootlin.com>:
>=20
> > Several device trees incorrectly included ti,am335x-bone-black or
> > ti,am335x-bone in their compatible lists without including the
> > corresponding bone-black-common or bone-common device tree files.
> > Remove these incompatible strings to fix the inconsistency.
> >  =20
> thanks for cleaning up some mess.
>=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Change in v2:
> > - New patch
> > ---
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts          | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts     | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts       | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-shc.dts                | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts index
> > a4f5b5262645..fb88eebb8c5d 100644 ---
> > a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts +++
> > b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts @@ -11,7 +11,=
7 @@
> > =20
> >  / {
> >  	model =3D "TI AM335x BeagleBone Green Wireless";
> > -	compatible =3D "ti,am335x-bone-green-wireless",
> > "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone",
> > "ti,am33xx";
> > +	compatible =3D "ti,am335x-bone-green-wireless", "ti,am335x-bone",
> > "ti,am33xx";=20
> this looks like too much cleanup, also according your omap.yaml stuff,
> ti,am335x-bone-green should still be included.

Oh indeed! Thanks.

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

