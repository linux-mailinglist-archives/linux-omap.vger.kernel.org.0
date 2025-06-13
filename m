Return-Path: <linux-omap+bounces-3858-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77DAD8D40
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96067171E65
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B507A1624D5;
	Fri, 13 Jun 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/qZk5dE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5410C1487F6;
	Fri, 13 Jun 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821950; cv=none; b=kCnBKUf42swrT/cKCAGKyD+5SRL4MGMVOktR9oNSpryWV87bgI1bLUR3/scI1hxNloH2SsvBJuQWEwmhc7q6Lk1t0siZ4PWdEbtkz8/fq25PqoOnnpg2RW/kfpE/E+STMHQRm25CD/wg8dFeC0NMbZnS0fpfHghKb2Vz0k1dTfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821950; c=relaxed/simple;
	bh=tv0qelqtNz6A1VNaJr9dPmZmZ3/5a9wk1n07oPAIAbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4J3R0SfEp4IX3rW0pnb0r82iIsm7sd/GYooIqQ7hZ15f4ggrv0q7IZ+F0shKj0sh19inTxaUfQ/bLaytGhagabxii2UG71J5MDF8Zlt3VA1nyCUttfNhtzWtXpGqFOaX/iGbc/GOfwaanr6N82kvvvoub9GgYhqtlHpoGeJxMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/qZk5dE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C61C4CEE3;
	Fri, 13 Jun 2025 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821949;
	bh=tv0qelqtNz6A1VNaJr9dPmZmZ3/5a9wk1n07oPAIAbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/qZk5dEIYWkTkNTdU20vhnNav7QaKfLPRvY4HV9QM8kIviX5g8z7MK9xQLLjsz6f
	 G90pwbfpRygug/jMAf1sUBIidsIAwSDjSXrMXcTCSPZio0ZDb1U4r0ZD5q073Um7H4
	 74VzZJPwm0d3QYzVkhjelyRu3D4yr0bjpi4BfSWC1I96H8IvHQ7iJ+wQotSit/Usu5
	 ZuCrrCvYKU76Gbh6psHswjqlTbHSC8h/wWW06B7de4RIodj7YRkrQqVrd+fIEzoqtA
	 4DARAJTM5Kd2uIcNM18K2Ld5G80RVt90psPvD7Jf/uG7PjwRIQ/nxF0OmpDJ4nZfR4
	 K3M7iTQGIDtfw==
Date: Fri, 13 Jun 2025 14:39:05 +0100
From: Lee Jones <lee@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: Remove node variables that are unused with
 CONFIG_OF=n
Message-ID: <20250613133905.GA897353@google.com>
References: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
 <20250528160603.GA1172935@ax162>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528160603.GA1172935@ax162>

On Wed, 28 May 2025, Nathan Chancellor wrote:

> Hi Thomas,
> 
> On Thu, May 08, 2025 at 04:57:24PM +0100, Nathan Chancellor wrote:
> > A recent cleanup introduced a few instances of -Wunused-variable in
> > configurations without CONFIG_OF because of_fwnode_handle() does not
> > reference its argument in that case:
> > 
> >   drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
> >   drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
> >     679 |         struct                  device_node *node = dev->of_node;
> >         |                                              ^~~~
> >   drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
> >   drivers/mfd/max8925-core.c:659:29: warning: unused variable 'node' [-Wunused-variable]
> >     659 |         struct device_node *node = chip->dev->of_node;
> >         |                             ^~~~
> >   drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
> >   drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
> >     576 |         struct device_node *node = i2c->dev.of_node;
> >         |                             ^~~~
> 
> These warnings are now present in mainline after the merge of the
> irq/cleanups branch...
> 
> > Use the value of these variables as the argument to of_fwnode_handle()
> > directly, clearing up the warnings.
> > 
> > Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
> 
> but this hash has changed, so this should be
> 
> Fixes: a36aa0f7226a ("mfd: Switch to irq_domain_create_*()")
> 
> but the rest of the change is still applicable. Would you like a new
> change or can you adjust that when applying?

Okay, please rebase and resubmit.

I suspect at least one of these has been fixed by Arnd already.

-- 
Lee Jones [李琼斯]

