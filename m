Return-Path: <linux-omap+bounces-2187-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB13975DD0
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 02:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3375285422
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 00:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6B280B;
	Thu, 12 Sep 2024 00:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="choyyDBE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2EC36C;
	Thu, 12 Sep 2024 00:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726099605; cv=none; b=mO4+r5pTfNWycOPIeTanZwHRq2xLZ2Jinpgt/7imHX3NrE7SBzBuV6EyCRyRZp/q3C/gb94aba4PVvn2BMrkyHCY5UmosyUDEeFgACWJd8dCHhbN70QpVJ0pnzdZt4FpI/KPK9rZHZpx/KTJ4GaHXx3j2IFPWHT+NKINwvZKNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726099605; c=relaxed/simple;
	bh=XjWRtI+IRMDQdK2wQCaYxO/xEhfu7igFdrNudaY7Tx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QclaK8YBV3XJNXrMTvUeYMguReplZSkiRmUOP+vN5xIjI3Ed145f8HhRtebCg3Kcq9UkWigNDHVMLu2MwMlwgpaWUAlnul12mZCvRu3h0uv9Bb81ugJQwkfyWqRhs9uP4QpjfxKWbYsa/j3gAzqLdZqUYzIS8hO243ROx/biQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=choyyDBE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA33C4CEC0;
	Thu, 12 Sep 2024 00:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726099604;
	bh=XjWRtI+IRMDQdK2wQCaYxO/xEhfu7igFdrNudaY7Tx4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=choyyDBEdArWZaLLOSFdPW33VF7rFeZsPQpU94U3PvGvdiW0r2G6jc7gLauiEF9J6
	 ZZtfqXqAdcIrWAFJzMo7ivamEqon3y3oTbsvOwgfjwQquVF8cybE7m3aHxrqzLpcJ0
	 uApWamhPnUSKBvvys1sOBjbVg9Tzn0dKP4qm7PUMfLBSO7hnCaMcWmrRxr1l1oxZZf
	 B4vQs39HXMyCN7yInBuG0mKRTfMlfAgPWYehr4dhJMy2PZqD/gBFabwecQy2+5+Ozj
	 PjSy0EFtifdRZdsqXviDnSJXlBf9nEF4JfE7svNXYe0nryIAqY3oIpqhwFlIcmf3lO
	 PCUBB9ECcNoSQ==
Date: Wed, 11 Sep 2024 17:06:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next 1/3] net: ethernet: ti: am65-cpsw: Address
 __percpu Sparse warnings
Message-ID: <20240911170643.7ecb1bbb@kernel.org>
In-Reply-To: <20240910-ti-warn-v1-1-afd1e404abbe@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
	<20240910-ti-warn-v1-1-afd1e404abbe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Sep 2024 08:17:56 +0100 Simon Horman wrote:
> An alternate, approach would be to create a variant of
> devm_add_action_or_reset() which expects __percpu data.  This would
> avoid discarding the __percpu annotation, and any value it may have
> between the casts added by this patch.  However, doing so appears to
> require a significant amount of plumbing.  And, as far as I can see, the
> code updated by this patch would be the only user of it.  So this patch
> takes a simpler approach.

Sorry if this was already discussed, but struct am65_cpsw_ndev_stats
appears to be identical to struct pcpu_sw_netstats but for ordering.
Can we let the core allocate the stats by setting
netdev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS?

