Return-Path: <linux-omap+bounces-3875-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D28BEAD92AF
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 18:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8C7189A443
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 16:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C65F205AD7;
	Fri, 13 Jun 2025 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WVhVRpEl"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD53BB48;
	Fri, 13 Jun 2025 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831340; cv=none; b=QEY8eDUaBMJzTsuCwOkqtkiI877g7iNK8AaW4mXpNQ44pBSAgd3pPZIzVGp14C77N+cMjqtPabdqU9U7XKBxXIktqLnSgX2FsCU04ksPaJOaFJmeGJrWzT/7/Oz3E0sYeRn1XdZJo582ETQprFNVNVRFVhHxU1cP7TvKLv06wQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831340; c=relaxed/simple;
	bh=S66j4cNoBBobZ3vYdXPunl2os+VRKRTdf1bjs/vbBFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qcwOQ/4GRODJYqDPrgJjp4KOvYlSSw62iOOyvIZHkQp3Cm5f1YZRxaBvJxoNjm/y0Zx8wZwfGm84EY5hMh8Qf71deLUFXTciOgjSld59l9nvICvk1Oc7cDeFsqbacjb9s87UGGbXKCxNnFwE7EcuKJzL5Z4agJKAt4ZQobrBBOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WVhVRpEl; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B73B6444EB;
	Fri, 13 Jun 2025 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749831335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tpOiw9HTh3F7o64zfMx0Qc5zC0DCSTyoEwE9klBg6Qo=;
	b=WVhVRpElprwLdHmTsCy0bRkfNh/5pyGIVrCGXz8pWrlo+uOsmMVhDs4SLc4HMzMGtcif09
	vVbtg6yu2dDpEP0+YuToXiOW/FLRnlbVMcVIBIHbRPgnB8sSl8UNAqnCydUJ1xPI9FwngQ
	lhnGaovs3mbQFeB44p3DAlvdrdZcKyiyLy2njZAC2oV5w3M9GJrDDehD8BTpr+NghshLAJ
	kSz/2RRn9UqamBhD5lKaU2qC1aJTMKp8zMCNFFKP6VwbcBS5kIxs5Dej8dAKXf59sbwmKu
	Fwpr0ExY6BGszXDgca45ZIDnBaect7M0E67/h2pGLiMktEdeF9Hf1gDwUXIa3w==
Date: Fri, 13 Jun 2025 18:15:32 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>,
 Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/7] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250613181532.7756d3e2@kmaincent-XPS-13-7390>
In-Reply-To: <CAOCHtYj8QsnzEKV8qG2_8CDuYzN-fUCdoN=YEE_EZ37yvEQ0yw@mail.gmail.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-5-514cdc768448@bootlin.com>
	<CAOCHtYj8QsnzEKV8qG2_8CDuYzN-fUCdoN=YEE_EZ37yvEQ0yw@mail.gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegspdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhos
 ghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com

Le Fri, 13 Jun 2025 11:03:34 -0500,
Robert Nelson <robertcnelson@gmail.com> a =C3=A9crit :

> On Fri, Jun 13, 2025 at 10:50=E2=80=AFAM Kory Maincent
> <kory.maincent@bootlin.com> wrote:
> >
> > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Gr=
een
> > (BBG). It has minor differences from the BBG, such as a different PMIC,
> > a different Ethernet PHY, and a larger eMMC.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >
> > Changes in v3:
> > - Move the omap.yaml binding change in another patch.
> >
> > Changes in v2:
> > - Used generic pmic node name.
> > - Add regulator prefix to fixed regulator node name.
> > - Add the compatible to omap.yaml binding
> > ---
> >  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169
> > +++++++++++++++++++++ 2 files changed, 170 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/Makefile
> > b/arch/arm/boot/dts/ti/omap/Makefile index 95c68135dd0c..1aef60eef671 1=
00644
> > --- a/arch/arm/boot/dts/ti/omap/Makefile
> > +++ b/arch/arm/boot/dts/ti/omap/Makefile
> > @@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
> >         am335x-boneblue.dtb \
> >         am335x-bonegreen.dtb \
> >         am335x-bonegreen-wireless.dtb \
> > +       am335x-bonegreen-eco.dtb \
> >         am335x-chiliboard.dtb \
> >         am335x-cm-t335.dtb \
> >         am335x-evm.dtb \
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts new file mode 1006=
44
> > index 000000000000..2e6050bd2da1
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> > @@ -0,0 +1,169 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 Bootlin
> > + */
> > +/dts-v1/;
> > +
> > +#include "am33xx.dtsi"
> > +#include "am335x-bone-common.dtsi"
> > +#include "am335x-bonegreen-common.dtsi"
> > +#include <dt-bindings/net/ti-dp83867.h>
> > +
> > +/ {
> > +       model =3D "TI AM335x BeagleBone Green Eco";
> > +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx"; =20
>=20
> Based on [2/7] ARM: dts: omap: Remove incorrect compatible strings
> from device trees  this should be???
>=20
> > +       model =3D "Seeed AM335x BeagleBone Green Eco";
> > +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx"; =20

Oh right, forgot to change the model. Thanks!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

