Return-Path: <linux-omap+bounces-3697-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C691BAB537F
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 13:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADFD6163B0F
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 11:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C7928CF41;
	Tue, 13 May 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feK7OW7F"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C01C28C863;
	Tue, 13 May 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134590; cv=none; b=gK2bGnraBx4/ECbI9DOGcIJNEQd25vOG2O5eSHhlKrtbog3VC70O17HSrHYmhQb93159/BnK0VYlewKzwIYdXNX54sr+lbwhwwyAZUJn5wb9MCGmBus+TPPWhIFAXRuSEYH/+nVhGrwoXHZD1gsth9ptWsq30aPEVAYmQe9hzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134590; c=relaxed/simple;
	bh=PCcbjUrOFmJlpnhODLBlzDB5IxuULw8I8RG6eT+YV44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsflIVxD7EKltnmPv2i/bRC9v4qsB4kmlYAibt1Ac/re450s33HPzgVibQ8U//3CmtM6xRSLOVGDYRzSXZzrb96QNRc8eoaQrGYw1RZZeX0xXnt9voZyWQ1MUSSyHfLKafty/CEjxkTgU+k4SeEqkSCkzaRBvRv190nfh55VGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feK7OW7F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3148C4CEEB;
	Tue, 13 May 2025 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747134589;
	bh=PCcbjUrOFmJlpnhODLBlzDB5IxuULw8I8RG6eT+YV44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feK7OW7FwHoi4OhtOu7F98KEGSctnjGS5nj6laZjAI4seK3EA+Vk+37j637GNRrNO
	 ha7EBfFVqEiY17ZwWFFXce9yEwagN33CWkm5HMyYzGYAv38YSjAavo0+akYOGlrq5l
	 VuCogM2TiYIbSy1mpWZXvGIRipPNTXYAJh5y5vZw0wqgh4hLrznnkN30JIJDXM0PCr
	 4U6qOGiv2NkU5lGdOb+iWATP0QALNZLKipmqLWCjDiaPFtCtRb5RcLSgG/jUXc0TD4
	 QMFcfTmxJus5+H4KWoHIXGnkjXAj6g0jie/+a2X/QjiMTAQj59MM0YsNXQ9vuPptbl
	 3nU0UTzAF6NUg==
Date: Tue, 13 May 2025 12:09:45 +0100
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
Message-ID: <20250513110945.GK2936510@google.com>
References: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
 <20250513094726.GG2936510@google.com>
 <20250513104518.GA2811486@ax162>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513104518.GA2811486@ax162>

On Tue, 13 May 2025, Nathan Chancellor wrote:

> On Tue, May 13, 2025 at 10:47:26AM +0100, Lee Jones wrote:
> > On Thu, 08 May 2025, Nathan Chancellor wrote:
> > 
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
> > > 
> > > Use the value of these variables as the argument to of_fwnode_handle()
> > > directly, clearing up the warnings.
> > > 
> > > Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > >  drivers/mfd/88pm860x-core.c | 5 ++---
> > >  drivers/mfd/max8925-core.c  | 5 ++---
> > >  drivers/mfd/twl4030-irq.c   | 5 ++---
> > >  3 files changed, 6 insertions(+), 9 deletions(-)
> > 
> > Doesn't apply.  Which base commit / repo / branch are you using?
> 
> -tip's irq/cleanups branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=irq/cleanups
> 
> This change has both a base commit and a Fixes tag and you were on Cc,
> not To. Is there anything else I can do (aside from a note in the
> scissor area) to signal that you don't need to handle this change?

Wait what!  This is not okay.

e3d44f11da04 ("mfd: Switch to irq_domain_create_*()") should not have
been applied without at least an MFD Ack.  Preferably it would have been
applied to an MFD based immutable branch where it could have been shared
from (if required).

It was missed because the submitted patch had an "irqdomain" prefix.
And now we're in a position where conflicts are likely to occur.

-- 
Lee Jones [李琼斯]

