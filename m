Return-Path: <linux-omap+bounces-4222-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F4B26804
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 15:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1A571891FAF
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BDD2FE054;
	Thu, 14 Aug 2025 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1lOc6Ki"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB583AC22;
	Thu, 14 Aug 2025 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179096; cv=none; b=VVF+FWJsjq7RkxBbWRDAiPOh542u66vCkaK5mV68/EQvOGFpAkMWWk/3+B0db1fR+pFZj0BuekeiyXYn+oyQQ240s3Ww1sC0oIRMu0dRmrxHlsDYj33O3ojB3iZ0YptcVKH8n/IFjJkQFAdBzRwPHaY+DG+Qqcsy1twH9okbvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179096; c=relaxed/simple;
	bh=eZxSUhPR9dmQ4lFwMM6GT4qCLe9UaSmB4btAA1xP9Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdMlzrNAJLDqU2LCCBv/E4GBXQIEBeb03KCrJqJhDbFubcG0/jVvunOIFAlv2JUgBC3FLz9GzmhWegMa1fY8vXUdWuIEsGJSf0DGoTtYv3jDUVj+optKfezv0wi0kRYudIY+v1RMVYmZKPeJH0q01/v3e5F/is+gwfO+JNAKrNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1lOc6Ki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082CAC4CEED;
	Thu, 14 Aug 2025 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755179094;
	bh=eZxSUhPR9dmQ4lFwMM6GT4qCLe9UaSmB4btAA1xP9Vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T1lOc6Ki9/E/Igz7aECcF7MMg5BHBfKmAKnQpbBY37170RnJHYJVS6vkN+AIuNmv/
	 flRScqDVYrQ31aVX5ya2G9B94+XhkSuwE90a7MUJ4zhxq6X2ZOxamdaYpOyYZGeNKl
	 3bJlveXXJDAUJFzSE2Wq74SiIMzDkVUIxjb7jfn7zS8ORhE18U9HkjSFiiN2Z3UhGl
	 ckKroI07jWO3moDNy5tOJC7xMh4StnxzjApV56Ichf9J/hH9QOZj0cotmz3pXoiUR5
	 dC9igsF3GptCcl7A/6E+bbTohtEL95WBrhYsl2Lec9OJ5ZHesJBT1RDRV4NMqsqjMW
	 oeUiWxqmBb3BA==
Message-ID: <32e6bb4b-711c-455e-bfa4-2c0b2011e1ec@kernel.org>
Date: Thu, 14 Aug 2025 16:44:49 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
To: Jakub Kicinski <kuba@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 danishanwar@ti.com, srk@ti.com, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
 <20250514-am65-cpsw-rx-class-v4-8-5202d8119241@kernel.org>
 <20250516182902.5a5bfd98@kernel.org>
 <d787ca03-a54e-46ae-828b-68fbd7b0b3a8@kernel.org>
 <20250813074803.06db304a@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250813074803.06db304a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/08/2025 17:48, Jakub Kicinski wrote:
> On Wed, 13 Aug 2025 16:49:27 +0300 Roger Quadros wrote:
>> On 17/05/2025 04:29, Jakub Kicinski wrote:
>>> On Wed, 14 May 2025 15:04:28 +0300 Roger Quadros wrote:  
>>>> The TRM doesn't mention anything about order of evaluation of the
>>>> classifier rules however it does mention in [1]
>>>> "if multiple classifier matches occur, the highest match
>>>> with thread enable bit set will be used."  
>>>
>>> So we're not sure how to maintain the user requested ordering?  
>>
>> Currently we are using the user/ethtool provided location as is.
>>
>>> Am I reading this correctly? If so then ..
>>>   
>>>> +	if (fs->location == RX_CLS_LOC_ANY ||  
>>>
>>> .. why are we rejecting LOC_ANY?   
>>
>> Because driver doesn't have logic to decide the location and relies on ethtool to
>> decide it if user doesn't supply it.
> 
> The location supplied by the user may have semantic significance.
> IOW locations may be interpreted as priorities.

OK. Is there any convention on location vs priority for user or it is driver dependent?
i.e. Does higher location mean higher priority?

> It's better to support LOC_ANY and add the 10 lines of code to
> allocate the id in the driver..

OK.

I did more tests and it seems that higher locations in the classifier override the lower locations.

With this new information, what is the best approach?

I can add support for LOC_ANY with logic to find first available free location.
If driver supports LOC_ANY, does driver also need to support explicit location supplied by user? In this case I think user convention and driver convention of location vs priority must match.

-- 
cheers,
-roger


