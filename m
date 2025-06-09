Return-Path: <linux-omap+bounces-3783-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F66AD2771
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 22:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0427E170DAC
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 20:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9922126F;
	Mon,  9 Jun 2025 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="MPW2cK/a"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D21CF7AF;
	Mon,  9 Jun 2025 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500101; cv=none; b=cIwM0UFbmy5hw2sJ9f7gO2ZjWPiBc/ydb/m1+2oXsRtnA1optY3LWsq43f4F7Vzp3N9lm9SDCEs44N/xBby2BOlCDmP4iv4j1GXob10nAwkkZMxJi94+jMuCBlGQwtWNS1aGx6W6/GU1PgMW/TWDlfcQXNvHSsErKXJnWLiRpBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500101; c=relaxed/simple;
	bh=kgrnDOGQDmclaNhJePtCHT7yqFnabWOEr9ZX+kemgVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzGha61mJF7Hs+oPsrZ+x9NTofXn3CdGhIT5XPImxLdzjP8+7ppuGQTqyy/17C5F0WBOBNSbwZB8J8qLu5wTVpp8zsS4YSGrV4nLaSSCNlD3Z5Zrg6/Jd9hu4IPEYruE1LrXEkJkfIFPJuYSneEosz2nX64YPiaKbDiyGn9tsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=MPW2cK/a; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=R3yQ0tJ0CBdLt3HO3JHLYhAu43xMtm6smkUOzO9SHfM=; b=MPW2cK/a3Cr/+tQ6wajfTf0PH0
	32PLU9fyua87i8J/ZhOi6jJcfaFRzoWwHFhYBqnQY176/VsX11xPNdq5rOxApMq7gS5oPfRLwfSWa
	DyVwB7nZIsljFHXjFB2m7v3l7K8Hu7f6VkvnxgqQmf76/aU5zDmtJiklVBsA77fUpwzxly1HOo0sY
	NQc6GApVgJfKRHtdYFOo5e2CwLdKPx2PMUN6nKC+sxm4AHRCFcVa5XDbevXUYFsdZ1ojt+odcCVX5
	+ruLuHh2ptiJDRbBhX9n4bLP/L5wtYDgQucPc+lLCgLGSr0TkyEMxJ38j5Ehwni/FLzOcPAbLemio
	XEiFTVHw==;
Date: Mon, 9 Jun 2025 21:50:44 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor@kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth
 <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250609215044.33ef6b52@akair>
In-Reply-To: <20250609-hacking-corporate-d53531577680@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-2-5278026b7498@bootlin.com>
	<20250609-hacking-corporate-d53531577680@spud>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 9 Jun 2025 18:03:05 +0100
schrieb Conor Dooley <conor@kernel.org>:

> > +      - description: TI bone variants based on TI AM335  
> 
> "bone variant" sounds like some shortand or nickname. Are the boards not
> called "beaglebone green" and "beaglebone black"? Whatever about the
> compatible, the description should use the full name I think.
> 
we have an enum below it listing all those variants. So "variants"
makes sense here, but better "TI Beaglebone variants"

> > +        items:
> > +          - enum:
> > +              - ti,am335x-bone-black
> > +              - ti,am335x-bone-green
> > +              - ti,am335x-pocketbeagle
> > +          - const: ti,am335x-bone
> > +          - const: ti,am33xx
> > +

Regards,
Andreas

