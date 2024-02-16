Return-Path: <linux-omap+bounces-655-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3E857C51
	for <lists+linux-omap@lfdr.de>; Fri, 16 Feb 2024 13:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904D028487A
	for <lists+linux-omap@lfdr.de>; Fri, 16 Feb 2024 12:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A85D7868B;
	Fri, 16 Feb 2024 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="otUg713n"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9FC78670
	for <linux-omap@vger.kernel.org>; Fri, 16 Feb 2024 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708085337; cv=none; b=iN9rMiCqXXOXYxQk0222IFSmxM7xPA5Fj3S9pfeGoLZ+RudhmrnSniTjdlyJoVX0RB8lYn9HdHLGLkavC32lbtN4+tFWYzDte36bexIrTzJeWX8smXZltNhc/TXlilauleGLgJipM3Q6G/Cbt0amiQjTyGJqpjz+fwWKV8ZsdGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708085337; c=relaxed/simple;
	bh=4On4BH2zoZvL0R5dYXgEEJnGNggGESGGiut4fqLW4P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew1/PJIeQTgC2uyZGPCYRnLoyJkV3E/GtqnasUROUP4QqYNkc/jDheaD5hAMNKZb3KOtn+Q3mrqOXVLfwR8wuvcR+2SBV09oF+qR58Xe/fl9iib2WGUVl4PVe3X/WboYg6RgLDrrANc6bWaya7Ug17IBu6d2iyGam603b7KyyZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=otUg713n; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 3C331604D8;
	Fri, 16 Feb 2024 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1708085328;
	bh=4On4BH2zoZvL0R5dYXgEEJnGNggGESGGiut4fqLW4P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otUg713nVWG4jtaUkQ3+wstsIVLHFzItUCxm8N+wFZbqklTLPhvnngQ0Hx94VK+Sw
	 XxFr6sFw1zQlz/t+rVPY4Qb33RsWeiTDhLt0G4p5zSsAi34LGCMv+b155m3xyIzID1
	 Pr4Zq9xg8IIy/BBK3v5KrlxvLPWefEyDlztU/LLSRmpiDjPWQS0B9AdNUWqsbXrSUI
	 g3ALUMuu81dVBrCPI2BcWRy/9lxhDquWUt4hQJL7vv7D9anOYWBef4MBALiQzUKHfN
	 eo1IpLKNhy/IodmPLdlRW8K4KE5/XLgLOnl7kILKljAB9Z/RXfK9N0WS4HKSf4EOhe
	 kZjirriTv2QsA==
Date: Fri, 16 Feb 2024 14:08:33 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Schwab <schwab@suse.de>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
Message-ID: <20240216120833.GT52537@atomide.com>
References: <mvmcyt13idm.fsf@suse.de>
 <c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>
 <20240215094640.GS52537@atomide.com>
 <mvmeddeyqb8.fsf@suse.de>
 <2024021516-stricken-bubble-bf8d@gregkh>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024021516-stricken-bubble-bf8d@gregkh>

* Greg KH <gregkh@linuxfoundation.org> [240215 11:16]:
> On Thu, Feb 15, 2024 at 11:28:27AM +0100, Andreas Schwab wrote:
> > On Feb 15 2024, Tony Lindgren wrote:
> > 
> > > There was a regression recently with the PMIC which would cause NFSroot
> > > on devices to keep working but may have affected MMC. Please check that
> > > commit 7a29fa05aeca ("mfd: twl6030-irq: Revert to use of_match_device()")
> > > is applied.
> > 
> > That commit hasn't hit stable yet.  Maybe it's because it references a
> > non-existant commit id (1e0c866887f4 instead of 830fafce06e6).
> 
> Yeah, our tools can't do about a commit that does not have a cc: stable@
> tag in it AND the only commit it does reference is not one actually in
> the tree at all.
> 
> An impossible task for us here, please ask stable@vger.kernel.org to
> take the commit if this is needed, and let us know how far back it
> should go.

Andreas, did commit 7a29fa05aeca solve the issue? If so please send
and email to the stable list.

Regards,

Tony

