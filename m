Return-Path: <linux-omap+bounces-3909-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14165AE025C
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 12:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B170A1BC33C9
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 10:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51046221DBA;
	Thu, 19 Jun 2025 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBHTkQgI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584D221D98;
	Thu, 19 Jun 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327592; cv=none; b=TPWYVn9AfmdOjic4pe/OaMhz66Alg0FGuK6mnDWRVEKPCHsPImliU5Q9q5hzAxzJXkeim7WV1ELlW43GIW4vqZYOtIcjXUEtNCQJA/CTcBp+cNPW0I//gofkt1Tff/CPy/Ih2mIsMq/gL8FtbSjyxjqtEpPUtG3QX2fPHKrMWsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327592; c=relaxed/simple;
	bh=eHBabgud4h7n4U/gvQWHnR21l+Nyew7nA8ITwD65mdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4IIIZqpIW0mzxgaN5bjkOfV0zKHy+IVU7Eb5NNUOR3tIiU+YUtIHIEE4GYaJ0hMg08aq8/5WIKKtqUu5L7FUsw6UypvqO1K/xkNWTjc6xGq/8t/R6Uw85YoccKOAJH07NDqSOqzrxW0uHPthYPwcTyMtldzIuHKjLoCewTv+ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBHTkQgI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51B7C4CEEA;
	Thu, 19 Jun 2025 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750327592;
	bh=eHBabgud4h7n4U/gvQWHnR21l+Nyew7nA8ITwD65mdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBHTkQgIJUfkkvcvS/typalQ2hrDJHxujqjNkKEVVlo+ahirNzZkWr436D/26zx+y
	 Y5QFerO+yPdzNOJnpLwomOfrXWY/Eb4afFT7AJ/cDcfnjxARmodtEuooby7XLd8VmJ
	 W8vZh01QglTaWVEMvqlH6IYtUJfvXkZ4txgGjbMK+1hjVbkBPCuyKMrF2bK8+UuZUW
	 cA12DruHqYENZV7JuCmE3VeP34qlRBklb+vUnMoxcgM+TDA0mdh9YxT83fgg7p22Nf
	 Z504H2eZcnW4Qfcgl3sawLtp/Iz3bUswN1ctsWbK/Cxk6YsY8LRVryoWbV0+nxMf1f
	 eVV77ETNE6zLA==
Date: Thu, 19 Jun 2025 11:06:27 +0100
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
Message-ID: <20250619100627.GD587864@google.com>
References: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
 <20250528160603.GA1172935@ax162>
 <20250613133905.GA897353@google.com>
 <20250613160600.GA228083@ax162>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613160600.GA228083@ax162>

On Fri, 13 Jun 2025, Nathan Chancellor wrote:

> On Fri, Jun 13, 2025 at 02:39:05PM +0100, Lee Jones wrote:
> > On Wed, 28 May 2025, Nathan Chancellor wrote:
> > 
> > > Hi Thomas,
> > > 
> > > On Thu, May 08, 2025 at 04:57:24PM +0100, Nathan Chancellor wrote:
> > > > A recent cleanup introduced a few instances of -Wunused-variable in
> > > > configurations without CONFIG_OF because of_fwnode_handle() does not
> > > > reference its argument in that case:
> > > > 
> > > >   drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
> > > >   drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
> > > >     679 |         struct                  device_node *node = dev->of_node;
> > > >         |                                              ^~~~
> > > >   drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
> > > >   drivers/mfd/max8925-core.c:659:29: warning: unused variable 'node' [-Wunused-variable]
> > > >     659 |         struct device_node *node = chip->dev->of_node;
> > > >         |                             ^~~~
> > > >   drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
> > > >   drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
> > > >     576 |         struct device_node *node = i2c->dev.of_node;
> > > >         |                             ^~~~
> > > 
> > > These warnings are now present in mainline after the merge of the
> > > irq/cleanups branch...
> > > 
> > > > Use the value of these variables as the argument to of_fwnode_handle()
> > > > directly, clearing up the warnings.
> > > > 
> > > > Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
> > > 
> > > but this hash has changed, so this should be
> > > 
> > > Fixes: a36aa0f7226a ("mfd: Switch to irq_domain_create_*()")
> > > 
> > > but the rest of the change is still applicable. Would you like a new
> > > change or can you adjust that when applying?
> > 
> > Okay, please rebase and resubmit.
> > 
> > I suspect at least one of these has been fixed by Arnd already.
> 
> All of these are addressed by commit fc5f017a71d0 ("mfd: Fix building
> without CONFIG_OF") in your tree. Is that going to be merged into 6.16?

Yes, I can make that happen.

-- 
Lee Jones [李琼斯]

