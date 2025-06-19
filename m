Return-Path: <linux-omap+bounces-3908-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98217ADFF7A
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 10:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4825E3A455E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 08:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E462609FC;
	Thu, 19 Jun 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Eue6Ooen"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3705215766;
	Thu, 19 Jun 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320823; cv=none; b=g2uUGUr5NiLtj/Dm1Un1JuGJ89x/ZaZyv/a472RW/sciyJu4Gbc8dczDuRN8h5jbz1CHmat0Y7FT7CrGp5HGUXkL9GM3g5r3KqjMMIS9+bpVR6OuAy+dNqbfUgjjP5M+1Vzcdg6bdIun5w5vxPt86utI6ilsszfEEaJTkQPiWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320823; c=relaxed/simple;
	bh=TOnvNAFh5loptubbVx+ifrw8+CaOXeq3Jklun6ffQ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pU7zHpmzWKlq498dl1g9ClsCuqM+haNHkzZOoHFepFL1Fm+aLAd1z9DP2NdiIhv6wxs3iny4zWWXs78SNDlcxqcwXNBaMmUDQFUmJEk9SFczV4xxihNVFBa0f2CH7Trd349e4PCwmZldj6UAOkAwSmU1UnIzOr68qEqZOuULFME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Eue6Ooen; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AF2C433B5;
	Thu, 19 Jun 2025 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750320818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yX6a2kX+avN/Me66IK4ZdJGprGWZ34+Ag3m54z+SpxI=;
	b=Eue6OoenItyJlrcTK8NqgxPTI37swvCJGgAJnJELLfqV+fYQW8Ef/A/4O+hUj/Fs9GmeKs
	1YinOFWt6yZ6GN+aca9mfFx3psV6E0SPYS7N0rdzu7OMDQMdAUHg5K08EIBWvQvVOT9bDS
	ttk4rJxeh5JZto5P6K5u5VVYaHE/amvOT/jBSqTCvRAJ+Fwlkq3cIyh8CPEg0+SxiNBY3U
	ROtfmJYWC659jVw5L2J3nlpXGdwZlB+mJ4+ZCxELo6quZVZKzP0fLtGZE9R4ZO2gRbDzBD
	2zOjaJpWPmj+vQBeoaAKdQMKWTuevNg8edK5uTNGLn3lGNMAbfPgBC2JAW45Aw==
Date: Thu, 19 Jun 2025 10:13:34 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, Marc
 Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>,
 Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/7] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250619101334.5b67741c@kmaincent-XPS-13-7390>
In-Reply-To: <7hzfe4ok9c.fsf@baylibre.com>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
	<20250617-bbg-v4-2-827cbd606db6@bootlin.com>
	<7hzfe4ok9c.fsf@baylibre.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

Le Wed, 18 Jun 2025 13:41:19 -0700,
Kevin Hilman <khilman@baylibre.com> a =C3=A9crit :

> Kory Maincent <kory.maincent@bootlin.com> writes:
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
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com> =20
>=20
> While I agree with adding the new compatibles for clarity, I question
> removing the old ones after so much time in the kernel.=20
>=20
> As mentioned in earlier reviews, there is other tooling outside the
> kernel that has been built around these strings.  The one that I have in
> mind is KernelCI based tooling that tracks boards based on compatible
> strings.
>=20
> While the KernelCI tooling does evolve with these kinds of kernel
> changes, it also still builds and tests older kernels.  So if we want
> these tools to know that "beagle,am335x-bone" on a new kernel and
> "ti,am335x-bone" on an older stable kernel are actually the same board,
> the tools will need to keep track of that mapping as these change.
>=20
> So instead of removing them, can't we just make the new ones higher prio
> than the old ones?  That way the tools can see both, and also see which
> one is higher prio.

But we can't add something like what you describe to the bindings. I don't =
think
they will accept this. And if we don't align the bindings the dtbs check wi=
ll
complain forever.

> I fully realize this is not necessarily the best technical argument to
> keeping the old and wrong names, so I will defer to DT maintainers on
> this one.  But since it's been wrong for a long time, I'm a bit
> reluctant to remove them completely knowing there will be external tools
> breakage.

Yes, still waiting DT maintainers point of vue on this. :/

I am wondering if I will separate my patch series, the cleaning part raises
lots of push back.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

