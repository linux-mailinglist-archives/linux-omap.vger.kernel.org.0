Return-Path: <linux-omap+bounces-2673-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0A9C8558
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 09:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7031F2259B
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 08:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D60E1F76D5;
	Thu, 14 Nov 2024 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5KCiEAM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC01F76BE;
	Thu, 14 Nov 2024 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574550; cv=none; b=CSmR7xTzmVrGrpYInsKIhZcnznPiSisp82vvazsaZRv+G/ltUsKEOssZeFCEnVqYH3Ke4xm31iFhLtmB5liVCg+aj7YtWLouz1SOMLFjZSqn2Bl9vMRldHGhWjIbA8nQX6CzXrHFdRmgx8wm8JJZ3i9EAhJU2qrMqYgQis09lH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574550; c=relaxed/simple;
	bh=0KlX2H18ntqJgaqCjiRs6+LhDQC5r/IjDTi2u9Uni/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZyxu2yBGibIQBY3Dm/mCMF02Ga7Ekjtd4hPUd1GgB5eSYckdpUa2eKsx8xqHPWtKqtKbLnKSNFxPa1JPwpipFyfApgHPpWB0J7Lk8jHR37aL6dYEJutC4YCYnZfwOUg5yfc+iVPdF40GJyM+1vibbkVCQMBaR1yCEX6H+VXQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5KCiEAM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5544AC4CECD;
	Thu, 14 Nov 2024 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731574549;
	bh=0KlX2H18ntqJgaqCjiRs6+LhDQC5r/IjDTi2u9Uni/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j5KCiEAMoXlKkCjQtW4ZlTreO8bdQNE9vQEZAdn6IHmS84TxSCf9qQGo1Ikyxleub
	 96xwUhQ/mJtCnhpFD8xArddswIJbJXJi/ZiiWI1RVjk+1/TVJWn9LEs17t4Sifjqfg
	 sCbFZ8TCQnp2OFsIDWZ5N+2gfnRJ4U+qE++hNhqV1S2gA5A1U0nI8UPR7pQpydzo/6
	 NOyrhwJFD7xZtVse/zuWWCdM5WFVdUJp7NKoFg8V/qHPuXNxe+0BR+z/lKW7LM48Yq
	 3rsoInn+OMiU08++U1yjayvKo+LGP5Uv0h/hKo7InyfCojdCXu0m0zeYxZYfeeBue4
	 TN6yCn98PwI4A==
Message-ID: <5b05b09e-197c-40dc-98c3-7d8bfb0975d5@kernel.org>
Date: Thu, 14 Nov 2024 10:55:43 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
To: Guillaume Nault <gnault@redhat.com>, Simon Horman <horms@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, Pekka Varis <p-varis@ti.com>,
 Ido Schimmel <idosch@idosch.org>
References: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
 <20241112140833.GP4507@kernel.org> <ZzVCDZR8a/xchDU6@debian>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <ZzVCDZR8a/xchDU6@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Guillaume,

On 14/11/2024 02:19, Guillaume Nault wrote:
> On Tue, Nov 12, 2024 at 02:08:33PM +0000, Simon Horman wrote:
>> + Ido and Guilliame
>>
>> On Sat, Nov 09, 2024 at 01:00:06PM +0200, Roger Quadros wrote:
>>> Configure DSCP to Priority mapping registers so that IP precedence
>>> field (top 3 bits of DSCP) map it to one of the 8 priority queues
>>> for RX traffic.
>>>     
>>> Also update Priority to Thread maping to be compliant with
>>> IEEE802.1Q-2014. Priority Code Point (PCP) 2 is higher priority than
>>> PCP 0 (Best Effort). PCP 1 (Background) is lower priority than
>>> PCP 0 (Best Effort).
>>>
>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>
>> Hi Ido and Guilliame,
>>
>> I am wondering if you could find time to review this series.
> 
> I don't have the IEEE802.1Q-2014 spec at hand, so I focused on
> patch 2/2.

You can look at an older spec along with this page
https://en.wikipedia.org/wiki/IEEE_P802.1p#Priority_levels

> 
>>> ---
>>> Changes in v3:
>>> - Added Reviewed-by tag to patch 1
>>> - Added macros for DSCP PRI field size and DSCP PRI per register
>>> - Drop unnecessary readl() in am65_cpsw_port_set_dscp_map()
>>> - Link to v2: https://lore.kernel.org/r/20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org
>>>
>>> Changes in v2:
>>> - Updated references to more recent standard IEEE802.1Q-2014.
>>> - Dropped reference to web link which might change in the future.
>>> - Typo fix in commit log.
>>> - Link to v1: https://lore.kernel.org/r/20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org
>>>
>>> ---
>>> Roger Quadros (2):
>>>       net: ethernet: ti: am65-cpsw: update pri_thread_map as per IEEE802.1Q-2014
>>>       net: ethernet: ti: am65-cpsw: enable DSCP to priority map for RX
>>>
>>>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 54 ++++++++++++++++++++++++++++++++
>>>  drivers/net/ethernet/ti/cpsw_ale.c       | 36 ++++++++++++---------
>>>  2 files changed, 76 insertions(+), 14 deletions(-)
>>> ---
>>> base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
>>> change-id: 20241101-am65-cpsw-multi-rx-dscp-000b2c4af6d0
>>>
>>> Best regards,
>>> -- 
>>> Roger Quadros <rogerq@kernel.org>
>>>
>>
> 

-- 
cheers,
-roger


