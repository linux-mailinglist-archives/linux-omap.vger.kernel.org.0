Return-Path: <linux-omap+bounces-3711-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EEBAB69A9
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 13:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A86B4C0840
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 11:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E48274652;
	Wed, 14 May 2025 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTrZC2+l"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A8426FA46;
	Wed, 14 May 2025 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221510; cv=none; b=a1Lyo5K/7Bgr+xuJFiFZLXzy6Am2ONNhLv1BFIhhrsoANn/nPIeReP+FUq6VorIIsipiGz+0bINYlAO6nJ8GoLAs9pjyBN1JiEw6VWasgBuej5FqAyRniycn6eSmyOppUuhVxzyXmsR/83dLYebTU9qLwHrPolc0+aRIQ+WYzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221510; c=relaxed/simple;
	bh=/QK4PCAGhr3iUKdJkSIAbmO9/EGD6CtY5awmN8eZRzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR8pTQ06uD/Y7Sp3jZ93EnFcozbGZZvi+CVjRMwgzozUbus1JnSy2VBqbTEOcTfmbG/mOWnp7taN8QDH+qwlhdwiKyBu65uHUfeZaVsX+y54u0djp+lBxNmUQQkjeH9jDB880/jpMAw5lhwJWQO1MKQC8eNdc2+e/gwwXkfKfT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTrZC2+l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DBAC4CEE9;
	Wed, 14 May 2025 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747221510;
	bh=/QK4PCAGhr3iUKdJkSIAbmO9/EGD6CtY5awmN8eZRzk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lTrZC2+l3/YLjOibXtN4OPm1LLwHM5zZ7VLgJVMPu1pBtTaprIHuzpX/chs51P7Kx
	 klZB2vaNmyE02vKnfzOJCJNSZ9KVNH38RP814zijsLS73LC/hIc9ruPBcQeD2XnmPW
	 UyJdF2f8EiOZvOwLPbgk0bQ2yw7t66+kZF01a79iEl/VmMEyvD2MuL2saA/v+HbATs
	 W/wXXc2FLvx+gqltGrz9niOWxXEzuhsinzoXxOVQ9b+JsNEygFyMrwzS2R43l81R2A
	 vpaSOxhR+lignG90j9mdDZaPyJ8Nu+wZgAIVpfQ3kQh9wz3BjPAapjnTBsv1lKxZwl
	 MV3/Gyvai3gUg==
Message-ID: <5dd61d36-14a7-481f-8da8-43d501163ef1@kernel.org>
Date: Wed, 14 May 2025 14:18:25 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
To: Jakub Kicinski <kuba@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 danishanwar@ti.com, srk@ti.com, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
 <20250513-am65-cpsw-rx-class-v3-8-492d9a2586b6@kernel.org>
 <20250513102954.2e537e99@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250513102954.2e537e99@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/05/2025 20:29, Jakub Kicinski wrote:
> On Tue, 13 May 2025 15:13:12 +0300 Roger Quadros wrote:
>> +	mutex_lock(&port->rxnfc_lock);
>> +	loc = am65_cpsw_policer_find_match(port, &cfg);
>> +	if (loc >= 0 && loc != fs->location) {
>> +		netdev_info(port->ndev,
>> +			    "rule already exists in location %d. not adding\n",
>> +			    loc);
>> +		mutex_unlock(&port->rxnfc_lock);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* delete exisiting rule */
>> +	if (loc >= 0) {
>> +		rule = am65_cpsw_get_rule(port, loc);
>> +		if (rule)
>> +			am65_cpsw_del_rule(port, rule);
>> +	}
>> +
>> +	rule = devm_kzalloc(port->common->dev, sizeof(*rule), GFP_KERNEL);
> 
> please don't use devm_ for objects you must support explicitly freeing

OK.

> 
>> +	if (!rule)
>> +		return -ENOMEM;
> 
> missing unlock

Ah, will fix.
> 
>> +
>> +	INIT_LIST_HEAD(&rule->list);
>> +	memcpy(&rule->cfg, &cfg, sizeof(cfg));
>> +	rule->location = fs->location;
>> +	ret = am65_cpsw_add_rule(port, rule);

And then here on error we need to kfree(rule)

>> +	mutex_unlock(&port->rxnfc_lock);

-- 
cheers,
-roger


