Return-Path: <linux-omap+bounces-2382-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CF99859E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7E11F24A35
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5A61C3F26;
	Thu, 10 Oct 2024 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvvClW29"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836F18FDBE;
	Thu, 10 Oct 2024 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728562318; cv=none; b=C3S6UB16/F+lS7aWuyfr+4CKL3FAPdLTW4VuYjrDHlT60g0Pp5azkX6ISgVD8dOIzIphImxnst6rfVxfmQ+WNMZFKV24mqVbyMclNcXFI1LNqx+ozasmrwwChYA3U+zrbXYrLnM+OECa2wnDRHJMZk3BeudSi7M9Zp5rP6kd9YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728562318; c=relaxed/simple;
	bh=6Z+sA5oqvb9bTsb1Fge8EGDZDEp6cer73PqJmPEIa0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tl6N/02GHqMEfgrnzBXqCIRiZtK02nCoS80TXhcmmtsUTdupK84yUHwbfAZZhaYH6gBBhzeBlg1EeMIQqLMThoggFOeZG8slUpnozDjuCMyTUfxSk2PU2Zjm1S+WvYfThCWVBp8AX6PJUefCT84X7LSa/VegP4Iw3N7vsQnU8dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvvClW29; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1090BC4CEC5;
	Thu, 10 Oct 2024 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728562318;
	bh=6Z+sA5oqvb9bTsb1Fge8EGDZDEp6cer73PqJmPEIa0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GvvClW29U8SFIB15ixH/IGprdm2KZvHh8rZg9UbcbcLkZF69mt3GrQfElT6sThlp4
	 2wlAopXjvBgP8FLU7KfyWLtNdZMjwSPSTrKmAS8YYkp6hSAfv2yoYBniuhOwdzevMG
	 4rd96RcxXnRKqhdNEPhCGPB6ozznqsQm/KEfdD0bDggOMBidQvqWHRqyH9tERBGPlK
	 CmQFabO++zNiqUcs564F/LWIV+N2tgGpOH6BCP0SbEutmAQdOmkM61paxM2v/uVfqG
	 0+ZphFxmPyQz1uO+eyYqi/81UMsVAzKCZp3q1O1/6K45JgJ5nMGMWssWqSQo6Q4Y34
	 RfVuY5RSYNDKQ==
Message-ID: <8d55458f-53d1-4abb-9f06-5c7ddf7da5d8@kernel.org>
Date: Thu, 10 Oct 2024 15:11:52 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: Use tstats
 instead of open coded version
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, netdev@vger.kernel.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev
References: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
 <20241010-ti-warn-v2-2-9c8304af5544@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010-ti-warn-v2-2-9c8304af5544@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 10/10/2024 14:04, Simon Horman wrote:
> Make use of struct pcpu_sw_netstats and related helpers to handle
> existing per-cpu stats for this driver - the exact same counters
> are maintained.
> 
> A side effect of this change is to address __percpu warnings
> flagged by Sparse:
> 
> .../am65-cpsw-nuss.c:2658:55: warning: incorrect type in initializer (different address spaces)
> .../am65-cpsw-nuss.c:2658:55:    expected struct am65_cpsw_ndev_stats [noderef] __percpu *stats
> .../am65-cpsw-nuss.c:2658:55:    got void *data
> .../am65-cpsw-nuss.c:2781:15: warning: incorrect type in argument 3 (different address spaces)
> .../am65-cpsw-nuss.c:2781:15:    expected void *data
> .../am65-cpsw-nuss.c:2781:15:    got struct am65_cpsw_ndev_stats [noderef] __percpu *stats
> 
> Compile tested only.
> No functional change intended.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Link: https://lore.kernel.org/all/20240911170643.7ecb1bbb@kernel.org/
> Signed-off-by: Simon Horman <horms@kernel.org>

Thanks for this cleanup! I did a quick test and rx/tx stats seem to work fine.

Reviewed-by: Roger Quadros <rogerq@kernel.org>

