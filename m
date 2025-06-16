Return-Path: <linux-omap+bounces-3884-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3422CADAAF0
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 10:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1181D7A5CED
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 08:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273B826D4DF;
	Mon, 16 Jun 2025 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T/g6uJv0"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF071FFC6D;
	Mon, 16 Jun 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063165; cv=none; b=cY0hFuWF9AEsPQxr+/zM+v3ij0ap5KgLGfdZXaUWLQAWI08ni4cRIkG9yALrUHzA/Y8xaVFHdBGxDh9iDdnLjkzNlhox3pk3Jsgcr0VvRcUjWZgmFN+qgww5GQ4l/C3NXXfU3QPIjPDsk3i5687V6CpgMpj5TIoRcbE+hO9CSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063165; c=relaxed/simple;
	bh=FFhM6VokJ06/I0t25GEFn7UsvK/jGGFQzI0Ory0yLm4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L38r5ikJ2aaXY15/N07UD8PeLMKn/DfOLFALlIfNy8uKoLZVMr8ymtkT7gGSykyVO0YnoFd3+W1tHN6/JNFrJGB02gJZZAXJAzjxMRAqwXdJcaVjBKWyuUfcy7SQ8ZhnXtSTVBQXKav+PTWbs1nAbCTCiMhT1+6Gr7RUhYPo9bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T/g6uJv0; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 015B841D11;
	Mon, 16 Jun 2025 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750063161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxpc53pcs9/ImiGc8WRsxEwJ2C+yK+Q3uRnvwi8vl9Q=;
	b=T/g6uJv0DktbNAIvT3CUgs9nfD/z4ZaAY3tuOQTayPiC0nbFM+l2YdnEbaj/nFUkpWxPhs
	4m4Vy/sV+HEfIXAPoQeAGKuUQD/oQrz9paXLq7+JtdFkhW+RvILvIY9gwSn4mc/N6Fagfe
	vJBxZjnRlTianYyyw503L4LUKI9wnWd4vZr/FeXpnMZ9MaikThEW04EhwklB35zWnFrKyI
	hdPe29pa4tcimfUjhBBQLYvCfLoqgFcvBSQhBSCV2APqaqNCq2tdpQ+8DktqrhzOggczTJ
	9lcsAQ2IsSAF11BQGJdOwjD4RhlSWcZvo9ri1x3oX0yttKz6tTH711SiZOSUvA==
Date: Mon, 16 Jun 2025 10:39:19 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Jason Kridner <jkridner@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>,
 Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250616103919.2d678c1a@kmaincent-XPS-13-7390>
In-Reply-To: <CA+T6QPnaCFZyRsv9q3bcOrTc22nA0AOXy0tR_SpAkGVVPQqfLg@mail.gmail.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-2-514cdc768448@bootlin.com>
	<CA+T6QPnaCFZyRsv9q3bcOrTc22nA0AOXy0tR_SpAkGVVPQqfLg@mail.gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Le Fri, 13 Jun 2025 13:52:23 -0500,
Jason Kridner <jkridner@gmail.com> a =C3=A9crit :

> On Fri, Jun 13, 2025 at 10:49=E2=80=AFAM Kory Maincent <kory.maincent@boo=
tlin.com>
> wrote:
>=20
> > Several device trees incorrectly included extraneous compatible strings
> > in their compatible property lists. The policy is to only describe the
> > specific board name and SoC name to avoid confusion.
> >
> > Remove these incorrect compatible strings to fix the inconsistency.
> >
> > Also fix board vendor prefixes for BeagleBoard variants that were
> > incorrectly using "ti" instead of "beagle" or "seeed".
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >
> > Changes in v3:
> > - Remove extraneous compatible strings.
> > - Replace BeagleBone board name vendor.
> >
> > Changes in v2:
> > - New patch
> > ---
> >  arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
> >  arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +-=
---
> >  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +-=
---
> >  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
> >  15 files changed, 22 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > index 46078af4b7a3..176de29de2a6 100644
> > --- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > +++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > @@ -9,7 +9,7 @@
> >
> >  / {
> >         model =3D "IGEP COM AM335x on AQUILA Expansion";
> > -       compatible =3D "isee,am335x-base0033", "isee,am335x-igep0033",
> > "ti,am33xx";
> > +       compatible =3D "isee,am335x-base0033", "ti,am33xx";
> >
> >         hdmi {
> >                 compatible =3D "ti,tilcdc,slave";
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > index b5d85ef51a02..2790c0c5a473 100644
> > --- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > +++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > @@ -8,8 +8,8 @@
> >  #include "am335x-bone-common.dtsi"
> >
> >  / {
> > -       model =3D "TI AM335x BeagleBone";
> > -       compatible =3D "ti,am335x-bone", "ti,am33xx";
> > +       model =3D "AM335x BeagleBone"; =20
>=20
>=20
> We have software that looks at these in running systems, so I=E2=80=99d b=
e ok not
> to change. If changing, why not =E2=80=9CBeagleBoard.org BeagleBone=E2=80=
=9D? Not sure of
> the convention to mention the SoC, but AM335x is not part of the product
> name.

Is it ok to change it or not then? Ok to move on to BeagleBoard.org.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

