Return-Path: <linux-omap+bounces-3696-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA53AB5334
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 12:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 321AA984EBE
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294C326A0BA;
	Tue, 13 May 2025 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRgerTlX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEFA26A0AB;
	Tue, 13 May 2025 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133125; cv=none; b=pQmA8nju9OPTygIWnQJr+iE/ennRGB5HpoNYcW+YZ/qw34QLgB/g5Zp4UgAffC5VxJhHVc44wy3Wrtz/EB62HtGQ7kSNTYRaWvCiK3TeXg2VpR89yKo+l9HLK3Md04mukjV5Wg0z7wWbvZ5amqO+bkS5E3E11MM13IOZfny3Pjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133125; c=relaxed/simple;
	bh=RMQ7ZCjLQA58uFPOiVcRhZ8jWoIyDLQdUyejKHq/oLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deWWnLEM9AJelgOpZcjQ3E+0qzoIbXBrgqzygU6cocJyHtJfppRlhrErpIO+JjQxCtEqlY3RRJ+YMMrraX0DTdxxvjO9tQT0Dh6nZVADmB2+SNYhOWCnGU6MyZqYYwyNV3kDuQyFFN5uuuCYc8NAal5/f1uyOPUJ8jsLlRL5xmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRgerTlX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D93EC4CEE4;
	Tue, 13 May 2025 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747133125;
	bh=RMQ7ZCjLQA58uFPOiVcRhZ8jWoIyDLQdUyejKHq/oLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRgerTlX12UssOGSsjz5GKp5UhPGuhgmlgmXGLQFPD1D2szoqPrjMnGmn4jOru6Ej
	 xwy6xsnjk0pkM9NlcXXPeAzNm/PsK2oo+LPAeGwD1EZRzwXdsTfzPEgf4sHBq0lpSQ
	 qFv1fc4NNzMpfD5uD7bxs3vFp2hA10DkI2JaOChJH1sLf1gCArsUjSYTgBoiY7oJbp
	 +ALSlu4XCBEAUthz2gs3AUtk+QxR2GaVbRcNQ6OgsIAOxdmTGV5tACkU02GRU0P6p6
	 EeRySsOmB2iykc5Wh0hZ4jakpeLAPhDKjcL/DW3su4P/jdofHMtPKNdCM7n/u+HUjA
	 g7ipteTMEigkg==
Date: Tue, 13 May 2025 12:45:18 +0200
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
Message-ID: <20250513104518.GA2811486@ax162>
References: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
 <20250513094726.GG2936510@google.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513094726.GG2936510@google.com>

On Tue, May 13, 2025 at 10:47:26AM +0100, Lee Jones wrote:
> On Thu, 08 May 2025, Nathan Chancellor wrote:
> 
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
> > 
> > Use the value of these variables as the argument to of_fwnode_handle()
> > directly, clearing up the warnings.
> > 
> > Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/mfd/88pm860x-core.c | 5 ++---
> >  drivers/mfd/max8925-core.c  | 5 ++---
> >  drivers/mfd/twl4030-irq.c   | 5 ++---
> >  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> Doesn't apply.  Which base commit / repo / branch are you using?

-tip's irq/cleanups branch:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=irq/cleanups

This change has both a base commit and a Fixes tag and you were on Cc,
not To. Is there anything else I can do (aside from a note in the
scissor area) to signal that you don't need to handle this change?

Cheers,
Nathan

