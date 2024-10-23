Return-Path: <linux-omap+bounces-2470-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E89AC74F
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2024 12:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08A08B23615
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2024 10:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03AF19F437;
	Wed, 23 Oct 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="nEEP2dHS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CBA174EFC;
	Wed, 23 Oct 2024 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677881; cv=none; b=H/bvdnucYt0FLU3zHHPt8uTUMmSmWGZmvbLxn5LIxqlHo4PkRJ3vOlfz8YakIrf7dBCpAfouOvtQHtW3rVIgZ5os80fuU3LCGQnkkErS/6Svgmt0xKufwQH2eS3YKco+wXw6AMmoD8QqdaL7Bjliyi3v66IF853FR07aB2bRokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677881; c=relaxed/simple;
	bh=gzv8bann7+Se+ba1n9YAGAhokw17+u/eKLBLeefk7vU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z1UphcLks6FUzG3UP1qALhVl6btzXTOjTn4By9LR80TdhJHioVqk0cmNqJgogGH92LZHakJIkgp1qSox9iUtNioxAYdJYAPDD1PwjeYKVa39JnJgxhnapfSDsSyZbaLKsjBIn5lzGaTJ+IsVkn13dhM3/o71oQI7y5hlPTwxfrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=nEEP2dHS; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=z8Zo0r/CO2uJGr3JQ8P0kx6Iw/EWo1oK42XquqAcXYY=; b=nEEP2dHSFoJMCoYKrY16iwxW8o
	yBfv8agQrSGBLbilIxWdUjvYvivmu4E+KG9I+4XXRnS52NVq5T6g+ldVfdKlP79eg23vuodSsbpt2
	HkZU82xEZOvallkyuUe/El9toz6h3Y2mdZKlwOiuizhTNoprIn9Y43H87RUDI+nW/lCpoTZCVktKt
	5jLm6rQvXqedRBAK7M9UfwjxM+mAAip7VdKDTC4gWD2ILurzI236OIXtoVKh7C9tr8qfH8UInVLIK
	8p9kGIez8GsO7Vno3ScYWEE3ROfeFpN2jur/heOZWqSbv9MoySQL2tmBeziaJxU+wH2OX3PjmyZbU
	6wZs0GfQ==;
Date: Wed, 23 Oct 2024 12:04:32 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH v5 1/3] mfd: twl-core: Add a clock subdevice
 for the TWL6030
Message-ID: <20241023120432.59cedd0b@akair>
In-Reply-To: <172898119013.384451.4986094816910935104.b4-ty@kernel.org>
References: <20241014161109.2222-1-andreas@kemnade.info>
	<20241014161109.2222-2-andreas@kemnade.info>
	<172898119013.384451.4986094816910935104.b4-ty@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 15 Oct 2024 09:33:10 +0100
schrieb Lee Jones <lee@kernel.org>:

> On Mon, 14 Oct 2024 18:11:07 +0200, Andreas Kemnade wrote:
> > Also the TWL6030 has some clocks, so add a subdevice for that.
> > 
> >   
> 
> Applied, thanks!
> 
> [1/3] mfd: twl-core: Add a clock subdevice for the TWL6030
>       commit: 5ebc60259a0fdd13aef077726b1773f1ae091efc
> 
hmm, this does not appear in linux-next. Did anything went wrong?

Regards,
Andreas

