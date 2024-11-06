Return-Path: <linux-omap+bounces-2592-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD09BE150
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 09:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DBBAB21BA1
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 08:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81401D54E9;
	Wed,  6 Nov 2024 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5rcLeh1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF811D271D;
	Wed,  6 Nov 2024 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883075; cv=none; b=Y9JddIZMA8/YY2WQYakLIxGRu6u/5+jda3FBvupTke98zraueueSLEHAG2LUWw0rTDWZA8QawNt/ACtBQU0Z4mZYOIv6Ws4NRuSoDwNrRdeb/WLE3qfsWMC5I1SVKilLVXnHqC25IgeC1Ld5mSUs4Up1otPnVHCDzH3VVB6GsXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883075; c=relaxed/simple;
	bh=AmMnKMNVvrLd+CzlEWfi3Ve0O5gy3tXs+i6qPVfwU4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbFnSPb+utTT4GVnr+lZcULEdjfN3PLaef/qKcJwzpJfG8FXKcAj5s+cDPGsNSin+N9p62YpDeAuFDlIED7KBEaEtsS7UjLHAH+LrbyFlgssJFr3rV2W+KAr8jVrDTA4UTSGYZ3EZ0X+78edIfoN/XLuSa6elUoDvGK7QEWg3vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5rcLeh1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5188EC4CECD;
	Wed,  6 Nov 2024 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730883075;
	bh=AmMnKMNVvrLd+CzlEWfi3Ve0O5gy3tXs+i6qPVfwU4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y5rcLeh1v+Ab3TX2T/lgTWn35m5g4EBjrA4T9QVCzMs7xAQIc92+m+G5CEJ/+OfBx
	 hG5z8fXKNbhNPAN9OCjU2s+zWnoKq+2pTze+kDBiwOXbmEqACgH7NnIrhwA2WDZ0pG
	 mspeFCaGkH8P6DY75PeVuFViL99gU4dszy0CZMABMSCvBvu4UAcvj06OfABLkKiTfv
	 qB5GiwddMfQ5opv7UkD/oE+jZlqbLF2a7xI7ynrGUJK6TbFk/udzS1jqi8VJKBdHcu
	 eiWAJVUN7rFvRIVryjvEUtpdls5JgsAAIe4HOewCC6EllPIEb7Vaa8Yl02ich5fSbC
	 8L6p4Zxbvzd6A==
Message-ID: <80df24bf-961e-49ea-845c-e824d0b6e0ff@kernel.org>
Date: Wed, 6 Nov 2024 10:51:09 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2004
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
 Pekka Varis <p-varis@ti.com>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
 <20241105-am65-cpsw-multi-rx-dscp-v1-1-38db85333c88@kernel.org>
 <35a2550e-a422-4938-af3c-a1fb4682ac56@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <35a2550e-a422-4938-af3c-a1fb4682ac56@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/11/2024 07:22, Siddharth Vadapalli wrote:
> On Tue, Nov 05, 2024 at 04:18:10PM +0200, Roger Quadros wrote:
> 
> Hello Roger,
> 
>> IEEE802.1Q-2004 superseeds IEEE802.1D-2004. Now Priority Code Point (PCP)
> 
> nitpick: s/superseeds/supersedes
ok

> 
> Also, according to:
> https://standards.ieee.org/ieee/802.1D/3387/
> IEEE 802.1D-2004 is superseded by 802.1Q-2014, so:
> s/IEEE802.1Q-2004/IEEE802.1Q-2014/g
> 
>> 2 is no longer at a lower priority than PCP 0. PCP 1 (Background) is still
>> at a lower priority than PCP 0 (Best Effort).
>>
>> Reference:
>> IEEE802.1Q-2004, Standard for Local and metropolitan area networks
>>   Table G-2 - Traffic type acronyms
>>   Table G-3 - Defining traffic types
> 
> In IEEE802.1Q-2014, the tables are:
> Table I-2—Traffic type acronyms
> Table I-3—Defining traffic types

Thanks!

> 
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/net/ethernet/ti/cpsw_ale.c | 25 ++++++++++++++-----------
>>  1 file changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
>> index 8d02d2b21429..7dadd95cadc5 100644
>> --- a/drivers/net/ethernet/ti/cpsw_ale.c
>> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
>> @@ -1692,26 +1692,29 @@ static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
>>  void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
>>  {
>>  	int pri, idx;
>> -	/* IEEE802.1D-2004, Standard for Local and metropolitan area networks
>> +	/* IEEE802.1Q-2004, Standard for Local and metropolitan area networks
>>  	 *    Table G-2 - Traffic type acronyms
>>  	 *    Table G-3 - Defining traffic types
>> -	 * User priority values 1 and 2 effectively communicate a lower
>> -	 * priority than 0. In the below table 0 is assigned to higher priority
>> -	 * thread than 1 and 2 wherever possible.
>> +	 * Also: https://en.wikipedia.org/wiki/IEEE_P802.1p#Priority_levels
> 
> Since links might change, it might be better to drop this and quote section
> I.4 Traffic types and priority values of IEEE802.1Q-2014 which states:
> 
> "0 is thus used both for default priority and for Best Effort, and
> Background is associated with a priority value of 1. This means that the
> value 1 effectively communicates a lower priority than 0."

I agree. Will update in v2. Thanks for review.

> 
>> +	 * Priority Code Point (PCP) value 1 (Background) communicates a lower
>> +	 * priority than 0 (Best Effort). In the below table PCP 0 is assigned
>> +	 * to a higher priority thread than PCP 1 wherever possible.
>>  	 * The below table maps which thread the user priority needs to be
>>  	 * sent to for a given number of threads (RX channels). Upper threads
>>  	 * have higher priority.
>>  	 * e.g. if number of threads is 8 then user priority 0 will map to
>> -	 * pri_thread_map[8-1][0] i.e. thread 2
>> +	 * pri_thread_map[8-1][0] i.e. thread 1
>>  	 */
>> -	int pri_thread_map[8][8] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
>> +
>> +	int pri_thread_map[8][8] = {   /* BK,BE,EE,CA,VI,VO,IC,NC */
>> +					{ 0, 0, 0, 0, 0, 0, 0, 0, },
>>  					{ 0, 0, 0, 0, 1, 1, 1, 1, },
>>  					{ 0, 0, 0, 0, 1, 1, 2, 2, },
>> -					{ 1, 0, 0, 1, 2, 2, 3, 3, },
>> -					{ 1, 0, 0, 1, 2, 3, 4, 4, },
>> -					{ 1, 0, 0, 2, 3, 4, 5, 5, },
>> -					{ 1, 0, 0, 2, 3, 4, 5, 6, },
>> -					{ 2, 0, 1, 3, 4, 5, 6, 7, } };
>> +					{ 0, 0, 1, 1, 2, 2, 3, 3, },
>> +					{ 0, 0, 1, 1, 2, 2, 3, 4, },
>> +					{ 1, 0, 2, 2, 3, 3, 4, 5, },
>> +					{ 1, 0, 2, 3, 4, 4, 5, 6, },
>> +					{ 1, 0, 2, 3, 4, 5, 6, 7 } };
>>  
>>  	cpsw_ale_policer_reset(ale);
> 
> Regards,
> Siddharth.

-- 
cheers,
-roger

