Return-Path: <linux-omap+bounces-3785-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA5AD2804
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 22:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425667A6D37
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 20:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0A7221F21;
	Mon,  9 Jun 2025 20:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O9dUXnOD"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B9A220F5C;
	Mon,  9 Jun 2025 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501909; cv=none; b=UYckLEFi3dfDAEVfU/Q6RAOQeZ4PUz9HgJTTrru1xFBwMKuOgnFrqcH7x9Z8Zom01FYKX0uwheGVaWCSgJr2ZDo9/oYOQDGNqyrWBwh8GDiybPcnsOwCI27vWKNDPddaUgJpcdCnnsd/pzsiT8OWPGVlbpbONadF0RcWRw2H0SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501909; c=relaxed/simple;
	bh=jPj7Sjc0AlG78SlEVxbzLFkY+icJgot4jPJU8v9Hg64=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0yLLSg5h0RoJ5I/o/OHmr6NNKVJhX8/Q1kdBAVNu8cbnGTByVzwGLt2Ku0uqTdGVXxDrhmu2FLucysZdM8VEp/0Bn9tcUo6cxCsFi5t/FccYIAVsY2Ysok9wBh606pI4J4nPaZdMeuyaa+E5YvT+RHDM6NhPNmj6EunOlmlhxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O9dUXnOD; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B88CA44400;
	Mon,  9 Jun 2025 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749501905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SR2d9reP8TqJ3UfMOktGuMwu95S3n7zGli3lgi0UUmg=;
	b=O9dUXnOD9YyA/wh8TMe9VcmiIPn+5MMmKcqUtv7n/HXwVsZBlk8SEbbuTTSsBHNVEpfTtQ
	xPvkA94UOJJF6p6nYPgYx1gA7Ljdv7dZF1EuGP84P8VWRcQ2HHPpUQovBHzlBxY+NUI7jZ
	S2+BVfM0x79jDSSnmEiHQJejDJBS2DU7VUBe+wJyYMCJ1lEkhN5xDkSLZwx5bbTHnYHCSi
	Og85IJQ/z4rlELNony9HQr16gr726jcdlG6Rqat8y+fkfbFVP4ynbMPmQyzRphxRc0jTbh
	L0wXVdAB0ebiFjq+SI3QQJetH5fkAO7u/A3EfNir102f4FvaUp2RoRDVFxeIKQ==
Date: Mon, 9 Jun 2025 22:45:02 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250609224502.1fce742c@kmaincent-XPS-13-7390>
In-Reply-To: <20250609-helpful-immodest-0f195cdbcbf2@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-4-5278026b7498@bootlin.com>
	<20250609-helpful-immodest-0f195cdbcbf2@spud>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeljeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeelhegvvgemrggvugdvmeeitgeksgemudgsfegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemleehvggvmegrvgguvdemiegtkegsmedusgefsgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com

Le Mon, 9 Jun 2025 18:04:01 +0100,
Conor Dooley <conor@kernel.org> a =C3=A9crit :

> On Mon, Jun 09, 2025 at 05:43:54PM +0200, Kory Maincent wrote:
> > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Gr=
een
> > (BBG). It has minor differences from the BBG, such as a different PMIC,
> > a different Ethernet PHY, and a larger eMMC.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Changes in v2:
> > - Used generic pmic node name.
> > - Add regulator prefix to fixed regulator node name.
> > - Add the compatible to omap.yaml binding
> > ---
> >  Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
> >  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170
> > +++++++++++++++++++++ 3 files changed, 172 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > c43fa4f4af81..774c13157caa 100644 ---
> > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -145,6 +145,7 @@
> > properties:
> >        - description: TI bone green variants based on TI AM335
> >          items:
> >            - enum:
> > +              - ti,am335x-bone-green-eco
> >                - ti,am335x-bone-green-wireless
> >            - const: ti,am335x-bone-green
> >            - const: ti,am335x-bone =20
>=20
> Why is this hunk here?

Do you mean that the binding change should be in another patch?

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

