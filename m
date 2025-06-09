Return-Path: <linux-omap+bounces-3786-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2945AD28AF
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 23:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95F163B1A74
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 21:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0515D22422C;
	Mon,  9 Jun 2025 21:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="p0yoodfA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520E2222C7;
	Mon,  9 Jun 2025 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504228; cv=none; b=ZuJRahPjxcsOrzm6Ma9c3fRL8sNVc7Df3OqaF9pe8ZPzsDzno+wj9G94LbSbDWmW7/3kdVsZ2HMFerEtWs5wBxQMivyEygtNBciyh/bf1ItmJF3q96I+2/Bd4lzRG2GbJBmYfckq3wm7kE6Pxh7HSYIXKHazLPYNm01WFIKLaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504228; c=relaxed/simple;
	bh=76Ka+ZBredfdZxuJJcNCb9q/uc7C11w8RRjQThBKfpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jU3WAeLfd/3Aca2seP3CzoAJjfxRKz0/de2jvr9FBGmtRofoKlqPwtkWbXyRji2o9NGESC1gR5CtNBP4U6jRFph7x/Q9asSFwu83tGgvrDjTharka/LKtX6FsqrbV1oo61a624Ozv65jUeX370qP9NBPnONEXGUoD+5Xx21+HzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=p0yoodfA; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/sNO39ldE4EsdxaOOD/yrGux2vj7yQ8VzqrbnmDWO7A=; b=p0yoodfAQz2AWV/pMoXJIWAzuG
	oIrj5e62g5SxqfDEpy8FWJ+Yp+OEu8ekoRHxUIghTwIPRIbfwrsPgBEwYtWadNw95cEZkSQblh9gp
	HWprtnKDKPQMmNT88fGsCA1dOTmRcaAthrXwvlE9FSxJZXWzoUROX7FIszvAoZUOool2BNt0bn4h1
	N/z7AewE42WPUfXM2aNH5NgWo7Q97f/Pv6CyeTSjFsm+nG2nFPmTVbjjC70BGEo+xwViuqmOOSRwg
	pcCQ0GxE81cqC/rJQtlXiBDfbNvX9cR3ETFDzn/v6xGbTYC8Kd0rXfkFL6MOt9bi+i/dkG+NfkvTB
	v8kUrGfg==;
Date: Mon, 9 Jun 2025 23:23:37 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250609232337.34cef4c7@akair>
In-Reply-To: <20250609224502.1fce742c@kmaincent-XPS-13-7390>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-4-5278026b7498@bootlin.com>
	<20250609-helpful-immodest-0f195cdbcbf2@spud>
	<20250609224502.1fce742c@kmaincent-XPS-13-7390>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 9 Jun 2025 22:45:02 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> Le Mon, 9 Jun 2025 18:04:01 +0100,
> Conor Dooley <conor@kernel.org> a =C3=A9crit :
>=20
> > On Mon, Jun 09, 2025 at 05:43:54PM +0200, Kory Maincent wrote: =20
> > > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone =
Green
> > > (BBG). It has minor differences from the BBG, such as a different PMI=
C,
> > > a different Ethernet PHY, and a larger eMMC.
> > >=20
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > > ---
> > >=20
> > > Changes in v2:
> > > - Used generic pmic node name.
> > > - Add regulator prefix to fixed regulator node name.
> > > - Add the compatible to omap.yaml binding
> > > ---
> > >  Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
> > >  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
> > >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170
> > > +++++++++++++++++++++ 3 files changed, 172 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > c43fa4f4af81..774c13157caa 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -145,6 +145,7=
 @@
> > > properties:
> > >        - description: TI bone green variants based on TI AM335
> > >          items:
> > >            - enum:
> > > +              - ti,am335x-bone-green-eco
> > >                - ti,am335x-bone-green-wireless
> > >            - const: ti,am335x-bone-green
> > >            - const: ti,am335x-bone   =20
> >=20
> > Why is this hunk here? =20
>=20
> Do you mean that the binding change should be in another patch?
>=20
Usually binding changes are in a separate patch. Maybe you can merge it
with Patch 2. The lonely enum looks a bit strange there, so if these
things are merged, it will look more natural.

Regards,
Andreas

