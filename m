Return-Path: <linux-omap+bounces-4743-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06115C0319F
	for <lists+linux-omap@lfdr.de>; Thu, 23 Oct 2025 20:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B2F73A591E
	for <lists+linux-omap@lfdr.de>; Thu, 23 Oct 2025 18:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC5534C15C;
	Thu, 23 Oct 2025 18:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="GgdLmWVC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA3266B66;
	Thu, 23 Oct 2025 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245830; cv=none; b=MFdGlLT651cMjo28Waw33FNxPuMLOuwNEGNVsYq3H3/T2J1+ddWqY8LuF5etkR3ZiiGB/W8uR2Xe0A67wn+klEvKfdejzvM/5npR/Kgn8QOaQ6LHCuA5wRPKCAGT2/aoX2Q1M8Feq0WSpX0cRLUqGHLqQnZ5PgOS9JrmD97MJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245830; c=relaxed/simple;
	bh=jnOQxpsQebIH933+49osQFSRSIq0tIJzy183oPP0vn0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctyRgot9MU+jxguYaG65jxo8inIWTFjgR7GhCSIqukoVBHk+3k+sP2bD/SJYfAHYFg7MxVArYZm+G9QbVmRVEQa/K0qhKRa+9ys6GoUmsQpWp8fBX1WehvO8wV69Pii8BIxxUmsAJD0YqzSBfwrOYSEOhPPWeY7p1jMjMolq8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=GgdLmWVC; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6XDs6hl23yG6z1nskZIOxrE8zy2rgT0pE2WOlQjJ7gQ=; b=GgdLmWVCZLhU384j5xMX4EArMF
	2zlU3OIYThVaTXqqXuakDob8neqMxGwAis7LnbZxgmNQ0vB599hZ7b5xtYJ2u420EObHRjpEMWk5s
	W5gWj+iDFgVD7J9Kp9GY1xVo5x5a2zpKGE2361dfCNndeIAF08OAQgc+l67hifSt7RD20Zz4I1RST
	dFURq1sGOZJt5t6vZccVUy5fBIwLd+NYRW6teEpzQc36GIACzImcBqldeUPACJhOpZxjOBXwdtFUa
	VSyxHm0UpgdNScS14O4/s6+NrJLB3qcjmNC0dH2qsLf5rqZRLIf+GgXOUeYOoOTIGzKPW7TL3N8qp
	dQZmwlWA==;
Date: Thu, 23 Oct 2025 20:56:53 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: add TWL603x power button
Message-ID: <20251023205653.468e49d2@kemnade.info>
In-Reply-To: <viq7cjqmt7guulqbuliismflq5gxtfqrxj7vzn2goctlcn5zlt@vaht6usiiedt>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
	<20251020-twl6030-button-v1-2-93e4644ac974@kernel.org>
	<aalnnbzeajxgnq33go5b2gi72yjzeeun5f2pkbdulu2hwuz663@b65xssnkse7l>
	<20251022144422.7c17322a@kemnade.info>
	<viq7cjqmt7guulqbuliismflq5gxtfqrxj7vzn2goctlcn5zlt@vaht6usiiedt>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Oct 2025 11:48:59 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Wed, Oct 22, 2025 at 02:44:22PM +0200, Andreas Kemnade wrote:
> > On Tue, 21 Oct 2025 10:58:35 -0700
> > Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >   
> > > On Mon, Oct 20, 2025 at 02:31:59PM +0200, akemnade@kernel.org wrote:  
> > > > From: Andreas Kemnade <andreas@kemnade.info>
> > > > 
> > > > Like the TWL4030, these PMICs also have a power button feature, so add
> > > > a driver for it.    
> > > 
> > > Could it be integrated into twl4030-pwrbutton.c? I think the differences
> > > can be accounted for via a "chip" structure attached to a compatible...
> > >   
> > So what is different:
> > - different register (but same bit)
> > - some custom irq stuff for 603x (so if (is_603x) needed)  
> 
> Right, why do we need to unmask the interrupt by hand for 6030? I'd
> expect this handled in the core, when we request the interrupt, not in
> the button driver..in the core, when we request the interrupt, not in
> the button driver...
> 
Short answer: irqchip ops do not provide mask/unmask for 6030.

Why... Interrupts are merged. There are 3 irq registers for the whole chip
and some of these 24bits are merged to provide one interrupt per submodule.
Apparently these custom calls are there to enable the merged interrupts
individually or multiple together. That is at least my theory I derived
from my archeology session.

The thing is implemented differently for the twl4030, there you have multiple
irqs per module.

But why two calls here? With one of them the interrupt pad of the pmic reacts
to the interrupt, with the other call, the irq status register does.

So can it all be implemented differently? Probably yes, but things
need to be done carefully or with one cross-subsystem patch changing
everything in lockstep. This somehow itches me for several reasons.

Regards,
Andreas

