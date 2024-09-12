Return-Path: <linux-omap+bounces-2192-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3449976630
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 11:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA85428563E
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 09:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B8F19F10D;
	Thu, 12 Sep 2024 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJXGwV+G"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809A1917CD;
	Thu, 12 Sep 2024 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135099; cv=none; b=Fd66n2BpPqA8nlKBuoGlYAM5aCIwd9+yKrJ89KV3+KImJa2rIXJt/4T4bjBMQGIACWQDXYKZXjuAoHO63VIIIXV3Wylvh8+TTNGjG6fchTfnCS9aXAFwGVAfWxT2CVuzLtyKsQsZ6ib4AtrWEgIUlsOaVf/QHFICQFHiGj2N8PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135099; c=relaxed/simple;
	bh=pGm77ANVkT4UjIg+7YwlFpf9b4RnE1vwLMkeVsZ5LT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8CZp9frp7RSo3qbDJMSgYU13kKs4D6WDLYkwcSJ5RAB9lbuB4nL56IYFKW+kZAqmg/AxjBG7zNmzbvjray6isNGzpR9lG+PrCWngA3MI62a8O46tPrv85mXczcNsxfDS33ZMH594m47b2ZPSpR6iZRZPzRruFGZBQ16Z1521cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJXGwV+G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D29C4CEC3;
	Thu, 12 Sep 2024 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726135098;
	bh=pGm77ANVkT4UjIg+7YwlFpf9b4RnE1vwLMkeVsZ5LT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJXGwV+GUsUXJln3GGPb2TSZeK6y9o46kL0BfYxpsR+1MnVUHiIhGJxXw5KcWarC3
	 A9lpz0XIXoHTY5VcpwtZ7ewZatzF1irI0r+x2htLa2omKKxgyGaeJQayxuRhoaqrRN
	 vBm8EtV7NEExljZvEwg0ZKhg9hoeO8ItpUcLDdPrah1Y4Nzf/X2i1LESXmzVVDQbDs
	 Xw7PKttgrOE+X489oCesAqu7GbABbpKP3Ab2ZxjdapAjHZzMHZ+CnUWpL5N0V2OV4C
	 DT8HjK5LsDemovhLx32hmTdjqPJYmyJh0RU76r5lsqbi6MQ263ym24Zph3Q2qK0pDt
	 9NRcPrSBRZq+w==
Date: Thu, 12 Sep 2024 10:58:13 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next 1/3] net: ethernet: ti: am65-cpsw: Address
 __percpu Sparse warnings
Message-ID: <20240912095813.GG572255@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-1-afd1e404abbe@kernel.org>
 <20240911170643.7ecb1bbb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911170643.7ecb1bbb@kernel.org>

On Wed, Sep 11, 2024 at 05:06:43PM -0700, Jakub Kicinski wrote:
> On Tue, 10 Sep 2024 08:17:56 +0100 Simon Horman wrote:
> > An alternate, approach would be to create a variant of
> > devm_add_action_or_reset() which expects __percpu data.  This would
> > avoid discarding the __percpu annotation, and any value it may have
> > between the casts added by this patch.  However, doing so appears to
> > require a significant amount of plumbing.  And, as far as I can see, the
> > code updated by this patch would be the only user of it.  So this patch
> > takes a simpler approach.
> 
> Sorry if this was already discussed, but struct am65_cpsw_ndev_stats
> appears to be identical to struct pcpu_sw_netstats but for ordering.
> Can we let the core allocate the stats by setting
> netdev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS?

Hi Jakub,

Thanks for pointing that out, and sorry for not thinking of it myself.

Looking over the code, and taking a first pass at implementing this,
I believe the answer is yes :)

I also think that, as a second step, by using dev_core_stats,
the custom ndo_get_stats64() implementation can be removed.
LMKWYT.

