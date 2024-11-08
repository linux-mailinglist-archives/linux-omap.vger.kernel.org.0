Return-Path: <linux-omap+bounces-2625-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B219C2431
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 18:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B141C25285
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 17:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2529720B7EE;
	Fri,  8 Nov 2024 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="E3Bi/Sjy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47A206E7C;
	Fri,  8 Nov 2024 17:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731087696; cv=none; b=RwH9Hp+Qzt6VAmQhYaE2GtRPQHR5kFO4kA2LhjXSXthpYqWIxYCpr1yJzuQDXhBV+glkiv3DzgrFACKpdj6eajBP6fxs2G1nEICzDDV1nArVV2MwTuGNhTHFXwKbkhASQR4VAshW7pRYEc2d+8LUQXum4owfMEOh8cmcsFHOLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731087696; c=relaxed/simple;
	bh=xTBJQ3DHiqjQGaHvCuOnOqcxQvtxoUV/KnD4Xz/Z1lM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cV0zAVEqcWWaxZSlz97V61G+gKrj2zqHXnzxQKh2SG1rcu9o/VbRrdU+TB0P1tpDpVs5UM0zalRbnpYalb7IG9rEXm8YhqWxrvuqLKk7I9MUXGePFMR9xZUp7ajHWqYLkgYZkRCRRhoMBGxJR7vaJYymHT4hJJ06f6jl3A4K7tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=E3Bi/Sjy; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wBB+8hCTyd2m7Z6GTXu25olXNiRTxVMEW+Jjw45zRYQ=; b=E3Bi/SjyYTGX8PGyP5yMVmcZEi
	Vk14b7t/g8S6znduaPSiyT8TdaF5dglB1h3Cq2qdgdbC+ZK2VTTAyrk7hlltdu6qEq8mgkpzyn2kL
	EsAOmn+ExKStIAXH+GKT+4bb7mQYlGcIq1cnRIpXPrf1XWwf+9hU+fNlRlv2Tot0ZP5RUUpXweMmv
	Uh1/5SZUXcLaVIWKJVD3f0ckM+SAuYPB9ly4UY1r3Db6oLUczjudKiIs1iXEDPgK1BuGfSmwdN1rf
	9uXVYdnaaxTB5lIBYRlu9PuRKdWhr7t5nOfPF8y0DuI7+MT0uoTegyvgRb3T8yxT9OQsJpCu10OjI
	1Hut1v2A==;
Date: Fri, 8 Nov 2024 18:41:18 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241108184118.5ee8114c@akair>
In-Reply-To: <b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
References: <20241107225100.1803943-1-andreas@kemnade.info>
	<b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 8 Nov 2024 14:42:14 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> > diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > index 3661340009e7a..11f8af34498b1 100644
> > --- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > @@ -612,19 +612,23 @@ &i2c3 {
> >  };
> >  
> >  &mcspi1 {
> > -	status = "disabled";  
> 
> But according to commit a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage"),
> these mcspi modules are not used. So it doesn't make sense to enable them even if it
> seems to solve the power management issue?
> 
They are not used, if they are just disabled, kernel does not touch
them, so if it is there, the kernel can handle
pm. At least as long as it is not under ti,sysc.

There are probably cleaner solutions for this, but for a CC: stable I
would prefer something less invasive.

I can try a ti-sysc based fix in parallel.

> Does bootloader leave the mcspi modules in a unwanted state?

Or at least something related to them. 
As said, for the blamed patch I checked only for CM_IDLEST1_CORE
and CM_FCLKEN1_CORE.

> Would it make sense for the bus driver to explicitly turn off all modules?

Hmm, not very clear what you mean. AFAIK everything below ti-sysc gets
turned off if a disable is in the child node. Explicitly disabling such
stuff in the dtsi and enable it in the board dts sound sane
to me at first glance. I think it is a common pattern. The question is
whether that causes confusion with not ti-sysc stuff. Well, having
status=okay everywhere in the dts should not harm.
But as said for a regression fix some overhaul affecting every device 
is out of scope.

Regards,
Andreas

