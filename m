Return-Path: <linux-omap+bounces-562-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFC85312A
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 14:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27399B26136
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 13:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B699482EE;
	Tue, 13 Feb 2024 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="tE8B0o6o"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B410D4F1EF;
	Tue, 13 Feb 2024 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829352; cv=none; b=KunrzKl6bVfdwiR9c3kPQqwwcfXCY9EeCOZzM/F4xypFC1uRZyoqFxHgnTsl92agcM51uCGagh/hBwguQM5mdCmE1OmJmgndF5p5vg1DfQFYciuD220NVLjfvSbTPQHjk61OulhUCoq99mzlzpj7NJRcwfSi1NwbzuAlB+PAbMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829352; c=relaxed/simple;
	bh=dlM175U+C8aayNuvUs0Vo/+s/Ov3qYpSkK3PAw6G+Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qv+j5Ygg6Uc85U3FNnCBGtTtF480Hifo1uDJb/kCHvMGkQSXczUaGpmGprX5pXlCFTAvxIGPLuulMCZ4SpqAsmWXkIMIYBcaq8Tzrjv1pIvLsCjUcdFzcNgv2o7VrttyWoV8MSzElgOnbqtogAqI5Lo03jjLbvTd0RIunxLlues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=tE8B0o6o; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id D1C636033F;
	Tue, 13 Feb 2024 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707829349;
	bh=dlM175U+C8aayNuvUs0Vo/+s/Ov3qYpSkK3PAw6G+Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tE8B0o6o5jHRphzAzKu8FMc0/MbVtbhFI8+pdHsrMCON3bbMzKlg1Fpp4yxQ7exFG
	 09NUYOa7d+9EcirZ+2WtO/yCpbKtSTXnVCx0n6NjHHI0wdK5e2rhdXdu+983nrwqcx
	 KDMYSS9wOjCCJHrP5HwQQBUfb2LSoQ9unp0xGsTzFgAqcRCdsKUqSQ8baK4kyqgvNE
	 ZpENHNmThNIjFVE+6o165hRFhJV919ZZ/DY79mYrO6pq2plO5oK0zBDT8CbV3Rd0kk
	 3eQD/5EsHQUxTtrCmoT7uVhciKQ3PydeQ5gACFw7HX2jPal8HrWAZxtuoayJK0JXjp
	 Nd9sC7eoVTVfw==
Date: Tue, 13 Feb 2024 15:02:08 +0200
From: Tony Lindgren <tony@atomide.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-omap@vger.kernel.org, aford@beaconembedded.com,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: omap3:  Migrate hsmmc driver to sdhci driver
Message-ID: <20240213130208.GI52537@atomide.com>
References: <20240213124146.202391-1-aford173@gmail.com>
 <20240213125618.GG52537@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213125618.GG52537@atomide.com>

* Tony Lindgren <tony@atomide.com> [240213 12:56]:
> * Adam Ford <aford173@gmail.com> [240213 12:41]:
> > The sdhci driver has been around for several years, and it supports
> > the OMAP3 family.  Instead of using the older driver, let's finally
> > migrate to the newer one.
> 
> I think we also should do these to avoid incomplete conversion:
> 
> - ti,dual-volt property can be dropped
> 
> - ti,non-removable should become non-removable
> 
> - ti,omap3-pre-es3-hsmmc probably should not be needed with sdhci

Hmm actually we may need to set SDHCI_QUIRK_NO_MULTIBLOCK for
compatible ti,omap3-pre-es3-hsmmc.

Regards,

Tony

