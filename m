Return-Path: <linux-omap+bounces-3874-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40317AD927F
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 18:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9396D7A7948
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 16:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BAE1FC0FE;
	Fri, 13 Jun 2025 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhOx/8jZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420151E834C;
	Fri, 13 Jun 2025 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830767; cv=none; b=d0DR8BauGabxXEc7kRkAaccIDrYEJ32c886+6h33HPwPPqRfRnv/VytxyYIn6jmDYgfcPLEpnjVlgvLdN3NDTLTMn0+KdWYzSLmbs3GhM2HIMMLFXhUVz449EDpIv2PxHogCgdyXqk5ohDwbyKs82MUl7bjltJFkEMVuWdtLB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830767; c=relaxed/simple;
	bh=LbTFGrRlyBuEb/Q0Nmcf3Gn8qywV37ze+AzMh87bn6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReCUztvXDluYVDWrOwo9d3C1SH1L6vQOhYkijT2LeWZ/7sW9IxAkiuHEjmdwGa8baSgEd4QBBIjIA5Wp8DQh6GNbc8TbRQfH6jYiSthLM53V5YxLPkxw7p7veodJ/vxhElKlheBZyQYc3M4DdZ4eLArDSA0Fj2VZsHttAjRu7JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhOx/8jZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAD9C4CEE3;
	Fri, 13 Jun 2025 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830765;
	bh=LbTFGrRlyBuEb/Q0Nmcf3Gn8qywV37ze+AzMh87bn6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhOx/8jZm9mtTdJ503kl2WxEIZb75vVUQvDfBYwLKYgsTrEIFUziMriujJUz6ThZ5
	 IT2d3zNVSunaBjr6SJl92a5XlMfaBDWJqpjt/L9VS0zgk9ID9LZSzVlDu++VrbuW2h
	 TwIsDIFOLIbDqO9QHHTyUK71FIShhbCbO8tcsWn227NVvAnjUzmKBmysiq4gVox2la
	 lMOngixMGdZPjnBwZ0dPFXwn6HFuBXoUz6zvnQeGi4NK59t3JiF3KUO04EZoqoM1ZY
	 h3l9wNyofVIWzKGMFijhLnrvvvpH1HLv6epd5nMEsTqIz9Uz6ITu0edDHemwJ1LSMk
	 /ctHC01D39GIg==
Date: Fri, 13 Jun 2025 09:06:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: Remove node variables that are unused with
 CONFIG_OF=n
Message-ID: <20250613160600.GA228083@ax162>
References: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
 <20250528160603.GA1172935@ax162>
 <20250613133905.GA897353@google.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613133905.GA897353@google.com>

On Fri, Jun 13, 2025 at 02:39:05PM +0100, Lee Jones wrote:
> On Wed, 28 May 2025, Nathan Chancellor wrote:
> 
> > Hi Thomas,
> > 
> > On Thu, May 08, 2025 at 04:57:24PM +0100, Nathan Chancellor wrote:
> > > A recent cleanup introduced a few instances of -Wunused-variable in
> > > configurations without CONFIG_OF because of_fwnode_handle() does not
> > > reference its argument in that case:
> > > 
> > >   drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
> > >   drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
> > >     679 |         struct                  device_node *node = dev->of_node;
> > >         |                                              ^~~~
> > >   drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
> > >   drivers/mfd/max8925-core.c:659:29: warning: unused variable 'node' [-Wunused-variable]
> > >     659 |         struct device_node *node = chip->dev->of_node;
> > >         |                             ^~~~
> > >   drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
> > >   drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
> > >     576 |         struct device_node *node = i2c->dev.of_node;
> > >         |                             ^~~~
> > 
> > These warnings are now present in mainline after the merge of the
> > irq/cleanups branch...
> > 
> > > Use the value of these variables as the argument to of_fwnode_handle()
> > > directly, clearing up the warnings.
> > > 
> > > Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
> > 
> > but this hash has changed, so this should be
> > 
> > Fixes: a36aa0f7226a ("mfd: Switch to irq_domain_create_*()")
> > 
> > but the rest of the change is still applicable. Would you like a new
> > change or can you adjust that when applying?
> 
> Okay, please rebase and resubmit.
> 
> I suspect at least one of these has been fixed by Arnd already.

All of these are addressed by commit fc5f017a71d0 ("mfd: Fix building
without CONFIG_OF") in your tree. Is that going to be merged into 6.16?

Cheers,
Nathan

