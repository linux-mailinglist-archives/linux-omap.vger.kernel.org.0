Return-Path: <linux-omap+bounces-2532-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C679B6DCB
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E02C282EFA
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B661FEFA1;
	Wed, 30 Oct 2024 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="sQv71v5s"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CD1DE3BD;
	Wed, 30 Oct 2024 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730320651; cv=none; b=NZ+xEhcsbiapItsJPPOprmGCD5G10FYOm8t0DvKWH210OK0bhSNZldm9yiKN/2iXVSDQ1q3GfRIbVumhkDOqpunXkAx8Mcod7K5GYg+mHSZRLFTzez0U4vmgN0IoZXIltK9c+rBIvAk5FSKLL6Z5bP48H+tt+r2u7ArNwJOyO7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730320651; c=relaxed/simple;
	bh=2/1ioMZjr5MSZefM6ixUjSp6domEpY+fUhQGJH2J0VU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e64scmFtZdp/lPA1G6W1cLwxd4bGyeloynz+Wo2aJaFLqwPm2UNBX9FqpMUjKMfiz1f5s9ZUGmmrUehcvGOyN4VHllBrdmfsrVu8HSkZUKRzzcv1apfQpng8NlKngpx3f7nJZweLWjMtj7m0L9vfH1MJQycMBfq51CuhRa9ZD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=sQv71v5s; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DpNcxLmfCPp/1kR/oU+eyuV4/OGMKcYGghtRFeKEkdI=; b=sQv71v5sC8eeEUXCosVVVskwYk
	oWLhHYAXgXJ1NGT/tsIxFxT/r+93g1VmGgC2ubey1jk/n/iUbYJ3C5LdybY5Yn8OdKyyF2+mCqpVO
	3Fddtz4RVRmiha8GXMY2/j5RIUMj/OSpnjdTP9pBHNnBEAXaMEkXK10vES/na5KJFrU0XLcVrzg0X
	7afL85pjxYQjRsckFqqszJJOytKCwG7PvO7lFjmJUX3q5bGXIzPrj42eOg5rLAOz3oFzqbodlOxs/
	f85VPIGrAtW5goaxqmDYXkIWBszy6XfgQuAcWdm0r2K5Rw9tJQJKZyVqvfC2xfiVpeAWRQIU6S3Fs
	CahACanw==;
Date: Wed, 30 Oct 2024 21:37:13 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v1 4/6] arm/dts: Add initial support for Galaxy Tab 2
 7.0
Message-ID: <20241030213713.45223f64@akair>
In-Reply-To: <20241030194136.297648-5-bavishimithil@gmail.com>
References: <20241030194136.297648-1-bavishimithil@gmail.com>
	<20241030194136.297648-5-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 30 Oct 2024 19:41:34 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> Create a device tree for the 3 inch variants (P3100, P3110, P3113)
>=20
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  arch/arm/boot/dts/ti/omap/Makefile            |  1 +
>  .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70
> +++++++++++++++++++ 2 files changed, 71 insertions(+)
>  create mode 100644
> arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
>=20
  DTC     arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb
arch/arm/boot/dts/ti/omap/twl6032.dtsi:67.37-70.4: ERROR
(phandle_references):
/ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-c=
omparator:
Reference to non-existent node or label "ldosb"

  also defined at arch/arm/boot/dts/ti/omap/twl6030.dtsi:83.37-86.4
  also defined at
  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi:616.21-618.3
  ERROR: Input tree has errors, aborting (use -f to force output)

I think you accidently submitted a wrong/outdated version. You had
removed the twl6030.dtsi include in pmOS after I pointed that out to
you in an issue there. Any further review is futile.

From:
https://gitlab.com/postmarketOS/pmaports/-/issues/2825:
>Mighty
>@MightyM17
>=C2=B7 4 months ago
>Reporter
>Oh, there's a hanging include "twl6030.dtsi" thats causing us trouble,
>I'll port the usb regs and comparator to twl6032.dtsi and it should
>work fine.

that is a clear sign that somehow an old version seems to pop up.

Regards,
Andreas

