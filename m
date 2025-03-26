Return-Path: <linux-omap+bounces-3501-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A7CA71C17
	for <lists+linux-omap@lfdr.de>; Wed, 26 Mar 2025 17:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE1E3BD69A
	for <lists+linux-omap@lfdr.de>; Wed, 26 Mar 2025 16:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407471F4E2F;
	Wed, 26 Mar 2025 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rq8lWHdp"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8771547E7;
	Wed, 26 Mar 2025 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743007390; cv=none; b=cEUJvQDqhz9sTKsw12JYk0iYAOFqsOeADUC951SVhiSdX/GyokTe7C1xyJZkRdEBNmVPtYmPojIJr0sKP5niGHn7md70K3Z8h/dtvE0S+ahj71Q4N9GSUtgbX9zK7ZKenJRPSS0n3cMpyBlZ9gcDm9sIzPZM6DuwmmIVp8yQIyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743007390; c=relaxed/simple;
	bh=5LaXNLW37E2EEaddRWCUX09i5J874uRaHchU5pVY+P0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAvgQhj7dT0zAx9wj611i/nyWHsAmOPoy1c115HppeaJNw3UzLRBQlaktuPZIyjvMbO3lHj3SPFUjzMnJhJS4oLhaB/YJYVj/VxW3uKRTZ4crDHTctMIN/fizIqzhEUebALqIORBYGWpH728oD21qOONngc6+QBIId9v2bXlVSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rq8lWHdp; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DC0242D46;
	Wed, 26 Mar 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743007381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjKXwDgvk3pdIxFfT6ggKwXmZB2CLaZ9TOBwOFL7yIs=;
	b=Rq8lWHdpvOVWYeg7riGtJTI+acq1/fmtn++wNgbJAqF9lD9bSWUzOBCr0FeszVEQaiQHP8
	4JCexxQJy/DWx0c+J33z8UlwysohKktZUxjSXdApqHOuCzmiGhOOJ3XTzd4FFIJX24cEyV
	qnbV1GboNUyojBkp9j/Y516j7DB/3GZHRcbtsAwn1Nl/VFao5Z00cIvsXqC3RD4YtnqoP1
	NjDfUEgzokjQzCua1f/B6a+Vv54i4rAMz0NzpG9+aiOci4w2MtkgP5tROuXP0ZjgPyIZju
	rTu9N/l0t1GKQNjKy/OpNX6sVzcmP8nu182di4RqMQugdLNC3icGwfY/z0Y2Eg==
Date: Wed, 26 Mar 2025 17:42:57 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, <m-leonard@ti.com>,
 <praneeth@ti.com>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <khilman@baylibre.com>,
 <rogerq@kernel.org>, <lgirdwood@gmail.com>, <linux-omap@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <tony@atomide.com>,
 <andreas@kemnade.info>, <aaro.koskinen@iki.fi>, <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 0/5] Add TI TPS65214 & TPS65215 PMIC MFD Driver
 Support
Message-ID: <20250326174257.33f74e81@kmaincent-XPS-13-7390>
In-Reply-To: <c0f28cb1-d2a8-4583-937d-4908e4b70b4a@ti.com>
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
	<173928615760.2233464.12306998726512431222.b4-ty@kernel.org>
	<7f33b5c7-b1a7-4db9-9e19-e30cbb0066ab@ti.com>
	<471cdd13-3250-46b1-b7a0-a4f236a47773@kernel.org>
	<c0f28cb1-d2a8-4583-937d-4908e4b70b4a@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeitdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeekfeegrgemsggvvddvmegrtdgvugemkeguvdgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemkeefgegrmegsvgdvvdemrgdtvggumeekugdvrgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepshdqrhgrmhgrmhhoohhrthhhhiesthhirdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmqdhlvghon
 hgrrhgusehtihdrtghomhdprhgtphhtthhopehprhgrnhgvvghthhesthhirdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

On Thu, 6 Mar 2025 16:56:56 -0600
Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:

> Hi,
>=20
> On 3/6/2025 1:26 AM, Krzysztof Kozlowski wrote:
> > On 05/03/2025 22:09, Shree Ramamoorthy wrote: =20
> >> Hi Lee,
> >>
> >>
> >> On 2/11/25 9:02 AM, Lee Jones wrote: =20
>  [...] =20
>  [...] =20
>  [...] =20
> >> Would you be able to remove this series from your branch & replace it =
with
> >> this v6 [0], so Mark Brown will be able to apply the dependent regulat=
or
> >> series [1]? Thank you! =20
> > You replied 3 weeks later. If something was applied not as it should,
> > you ought to reply IMMEDIATELY, not 3 weeks after.
> >
> > The trees are mostly immutable after publishing.
> >
> > Best regards,
> > Krzysztof =20
>=20
> Completely understand, sorry for re-sending the first 5 patches that were
> already applied! I'll wait for the next merge window, so there won't be
> dependencies between the MFD and regulator tree then.

Hello Shree,

I think what you should have asked here was a to use an immutable tag to let
Mark uses this tag to merge the regulator part of the series on top of it.
We use immutable tag when work need to be merged thought several Linux
merge tree.

It seems Lee does not remove the MFD support so now that we are in the merge
window, you just need to wait two weeks and repost the regulator part.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

