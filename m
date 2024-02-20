Return-Path: <linux-omap+bounces-684-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0985BEEB
	for <lists+linux-omap@lfdr.de>; Tue, 20 Feb 2024 15:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 902911C21CC3
	for <lists+linux-omap@lfdr.de>; Tue, 20 Feb 2024 14:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990D669E0D;
	Tue, 20 Feb 2024 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZxuY8J1h"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3E32C1B4;
	Tue, 20 Feb 2024 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708439757; cv=none; b=tUJuMvohDZgZiKHmtCTKXuq5XYjnHKqVpxclMNJLjoCndtusGc0aFWDqTveLnR5WVZpKrIVMLVhNrUTDsynKY5h0DyEwucjYJ2QqLFQNm3O4O6uG1G12qD6C0jQ/fpRix5gb+Zsr6tnL5e6ja2aoK+MJxNLT75NdMYayEpo4vmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708439757; c=relaxed/simple;
	bh=YvT0MofwUncJLLsALhxER2p5o67FyIoyFgQv131Mwbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCWE+l6kl4WmnngTe+uu1w43BzpStNd66jwB3pq7XJqsACYP7uBuuUl6k81RfKS/wYwIY/QoqFETdHKVZ94J/n6HXeI2VOXAAMoT1G+QF0qhj4TlQxewSg5d50emAiPRwSksUKjTtLHr5VoH78Vi0cYMxdBsCsr2oJxDN0xaBR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZxuY8J1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E5DC43390;
	Tue, 20 Feb 2024 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708439756;
	bh=YvT0MofwUncJLLsALhxER2p5o67FyIoyFgQv131Mwbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxuY8J1hTUs7tvn6yxfPiI4+TAC4d3HeiChVA6cTMzIx7NB6ERu/Dl0kRwJl0k1m+
	 2vG4/V9qAt+03uszSkIEpVL8uVx82Am4bX87zoMtdMlk+B7aeFhBl1AuMiEOLE6QBb
	 eB1XR9YkNRUBLb9JINpxfi0qEJX2PYWM5HayMCaU=
Date: Tue, 20 Feb 2024 15:35:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Tony Lindgren <tony@atomide.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
Message-ID: <2024022022-happiest-affirm-60cf@gregkh>
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

On Thu, Feb 15, 2024 at 12:16:34PM +0100, Greg KH wrote:
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

To be explicit, does this need to be applied to the stable tree(s)?  If
so, please email stable@vger.kernel.org with the git id to do so.

thanks,

greg k-h

