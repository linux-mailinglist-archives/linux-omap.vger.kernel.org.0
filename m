Return-Path: <linux-omap+bounces-3887-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF7ADB09C
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 14:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35B9C7A8330
	for <lists+linux-omap@lfdr.de>; Mon, 16 Jun 2025 12:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43AD292B25;
	Mon, 16 Jun 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PE8qN9cr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D51ABEC5;
	Mon, 16 Jun 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078268; cv=none; b=d3ylVaYaVqaX6r2F1ipToIoEqXoFLfwVH57NEodjgkn908mjwq+X4PR1pfOXDdBUVE1BMw3jjINDa29Eqe6hRa58xT2xYr4TsQUDFwbPZAk5iMMYU4496vbt7ifZNO+Ja/Q2IobAu+ZplC4tVOhzVXIttYiUdbhSrg6DZ0TdNhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078268; c=relaxed/simple;
	bh=ob5g0+4JbmSONLghaJGyWFg+GyfiXEdGuasTfAQVUhk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRWrYS2c/QPHmfTKHGEnfD0rqYZps3f1opvQgQ6RipN3EFNUAmBZvxu1dgAZCM6WyIWoqlIBhKqO6cqQGs/5wuCad7DXWiS6cNj4l81IIIH/s46cTxxK6xupMYotpvb9S9NP+1bF6lmgHhVej/vHVqLMfhj9UM9j750g4hmdeXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PE8qN9cr; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id B3C455820CB;
	Mon, 16 Jun 2025 12:29:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1EF243896;
	Mon, 16 Jun 2025 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750076957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9e0ar1sgFXhVsoTqepigfauoukIlQ93Op70pYJgpDmk=;
	b=PE8qN9crPUfVsmmKX1QwY80baPPMNqjFlfFPzpM5Eq0j5MuzDvPUVMJpKUpg6WV/76Cyw0
	d7iRil/yVoRQNmsCfRQv+rsi/o5Xa7H9KKAnpaPoMBX94B4lAkPcEj0rL6uorWEet1Cgpt
	vmDQXP8/yafePzzRl1VVgmiMEqXaF1Mvgpa+AcpEi0yHtzgrNPJAdcnRUTjC9fOcw+kaFT
	8CVbyEHQYK9g2DwNs8JiLHR/MtnP8AqquUzEaOtd+yih2pO2DsxOQLY7gwYpyiRxdqDXkg
	FDjcd97wb0m0vlbTllM9Y6+wt/Q17I0PvXaQ6jPcYSCGnUjrx4I0jmliYaeJ/g==
Date: Mon, 16 Jun 2025 14:29:13 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Josua Mayer <josua.mayer@jm0.eu>
Cc: Jason Kridner <jkridner@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, Marc
 Murphy <marc.murphy@sancloud.com>, Andrew Davis <afd@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250616142913.1afad458@kmaincent-XPS-13-7390>
In-Reply-To: <7e854232-f02f-4ad6-b65e-22c18d1d9fe5@jm0.eu>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-2-514cdc768448@bootlin.com>
	<CA+T6QPnaCFZyRsv9q3bcOrTc22nA0AOXy0tR_SpAkGVVPQqfLg@mail.gmail.com>
	<20250616103919.2d678c1a@kmaincent-XPS-13-7390>
	<7e854232-f02f-4ad6-b65e-22c18d1d9fe5@jm0.eu>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehuddtveeigfevgeegfefghefgkeeigfefgefhvdeufeejledtledvgfffieekveenucffohhmrghinhepuggvsghirghnrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtohepjhhoshhurgdrmhgrhigvrhesjhhmtddrvghupdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhho
X-GND-Sasl: kory.maincent@bootlin.com

Le Mon, 16 Jun 2025 14:39:03 +0300,
Josua Mayer <josua.mayer@jm0.eu> a =C3=A9crit :

> Hi Kory,
>=20
> Am 16.06.25 um 11:39 schrieb Kory Maincent:
> > Le Fri, 13 Jun 2025 13:52:23 -0500,
> > Jason Kridner <jkridner@gmail.com> a =C3=A9crit :
> > =20
> >> On Fri, Jun 13, 2025 at 10:49=E2=80=AFAM Kory Maincent <kory.maincent@=
bootlin.com>
> >> wrote:
> >> =20
>  [...] =20
> >>
> >> We have software that looks at these in running systems, so I=E2=80=99=
d be ok not
> >> to change. If changing, why not =E2=80=9CBeagleBoard.org BeagleBone=E2=
=80=9D? Not sure of
> >> the convention to mention the SoC, but AM335x is not part of the produ=
ct
> >> name. =20
> > Is it ok to change it or not then? Ok to move on to BeagleBoard.org. =20
> The Debian project most notably uses the "model" string:
>=20
> https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all=
.db?ref_type=3Dheads#L2191
>=20
> When that changes inside a dtb by kernel update, users may be unable to=20
> boot.
> Therefore I would recommend against changing "model" values.

Maybe they will have to follow the change.
Don't know if this should not be changed over time even if they are wrong f=
rom
the beginning.

It would be nice to have a devicetree maintainer's opinion on this but I do=
n't
think they will reach this message.

I think I will keep old model values for this series then, I don't want to
block this series on this topic.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

