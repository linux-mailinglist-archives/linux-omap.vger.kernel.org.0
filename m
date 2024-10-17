Return-Path: <linux-omap+bounces-2441-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A445B9A202D
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 12:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1A6528590C
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 10:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC171DB540;
	Thu, 17 Oct 2024 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="KSnU/J+K"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A791DA63D;
	Thu, 17 Oct 2024 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729161491; cv=none; b=gqtoilxabSDg8tO0+Dgy1F6s7JigBIthGYVDqE4EhdX6I+/8P3Yyvvs4Z2byfavQb8Ai1SRymnAVmsvE/xGujZF4q+C8jJXQtJlXna5RUu/3OQKMt4e3KGeQbQi+H1Z4wgkQMY/Tj58W678lkS5BR6L2nnEklZ4YPKAQYnaR6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729161491; c=relaxed/simple;
	bh=RR6bz3XCL62/D4xY5KpvyClNWTpDgWb9zj1D7PAIJA8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSQSIkxVeNV1GhN0j43ZblYUw/7XPBl9JXsXSS3lMwmeUMRQzaMXFTdMJWTdSEGQWTNa52M17AUn5qRMjKzBCleP+IDuOTlLBt+xrRcLBCcLEkVJ1SJcN+hnkKVmeClkrN+beWc1E+KKgPMlPrWr0vWcYJsFyVa5h+HoBXOmMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=KSnU/J+K; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4jISAdD4xM5sRPnE95Fnijjjk3Ui/0+o9PGVY2w2gFY=; b=KSnU/J+Kh+hnJdgGpxOSa/xuLf
	rkuIwFzzzCp9E3iAY0S6CpEm17p3owrbe8P0/1xOTeQHITCZqvC134Kr43oEm2XIiws0MmtqRSi7I
	9mu76khV5nKMkO8LYNoQOjM1Xbq0iLnbExeUL/S9QDq1arKziDESQSe7pub+WwLnLzhE0LgYFvxZa
	hK+3yEOkZfotA0qE1oFe+ZR05ZVgBSzm2xeeVqmAv3qAFMbNk1kMbV+vCVKGmdqmFrOfl3mrOWks/
	NhQdROTXNDaoWVtwd5iXmH6IfN9Xb/lJRuOgcuQt2CeL4Y8xLPoUJXaaTvNtMWwIlQYjKFRzwgD/I
	pjPLpeFQ==;
Date: Thu, 17 Oct 2024 12:38:02 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org, Kevin Hilman
 <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Tero Kristo <kristo@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/2] dt-bindings: clock: ti: Convert divider.txt
 to json-schema
Message-ID: <20241017123802.2a1fff05@akair>
In-Reply-To: <20241010034434.GB1297859-robh@kernel.org>
References: <20241009205619.16250-1-andreas@kemnade.info>
	<20241009205619.16250-3-andreas@kemnade.info>
	<20241010034434.GB1297859-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 9 Oct 2024 22:44:34 -0500
schrieb Rob Herring <robh@kernel.org>:

> > +
> > +  ti,min-div:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      min divisor for dividing the input clock rate, only
> > +      needed if the first divisor is offset from the default value
> > (1)  
> 
> minimum: 1
> maximum: ?
> default: 1

maximum is complex: there is one place in the code where this runs
through a u8 (_get_val). although it it read from the devicetree as a
uint32.
So, if we do not care about a specific implementation, then
in the power-of-two case, the theoretical maximum would be 1 << (1 <<
(32-bitshift) - 1) clipped to UINT32_MAX due to type constraints. And
also the maximum lifetime of electronics and elementary elements and
pieces, probably even with the proposed decay time of protons.
In the index-starts-at-case, we would have (1 << (32-bitshift)) - 1.
otherwise 1 << (32-bitshift).

I would propose not to define a maximum here.

Regards,
Andreas

