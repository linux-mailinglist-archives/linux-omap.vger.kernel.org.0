Return-Path: <linux-omap+bounces-1739-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6392A9F6
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2024 21:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E01228487C
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2024 19:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AB214BFB4;
	Mon,  8 Jul 2024 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Srwz8/bk"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465C10953;
	Mon,  8 Jul 2024 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720467734; cv=none; b=i+vIgPBVBOth2d/DDliOGmpWz5ae7AbNHOK9UaTM6wrJlmlbg7vlVEWp6NbTSNTK8XRTIUnXt3uDYQ4JOpVaXeTYv8mqt+t3M64NeSG46tLBzXIOZKq6nYDYwp/+yklxFxP9t/pxSlbTDH78gEi4gZRTvZKqVH1Mq7CxOY0Xefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720467734; c=relaxed/simple;
	bh=Zaeqe9YcdV6AbL26jg2M0CXgIkCa1m7pJ0j+84zhThE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRYggpikLvAkVRwiDCBTkZzPQwfuvaQ5ROms8fm7TCvl6Z0f4eCWDZifszUh2ESK5TCAuGhFLdCnQ2m2dDnTEkTk0W0S9rFRO2Bh2Hg7z3i8laAQqDfrzXujQOZKv0b4705GJkAajXiDRjGxZDBCxlXYvGDAcOabDgcR7WRIVQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Srwz8/bk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9B9C116B1;
	Mon,  8 Jul 2024 19:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720467734;
	bh=Zaeqe9YcdV6AbL26jg2M0CXgIkCa1m7pJ0j+84zhThE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Srwz8/bkE6ouu8XOlmuwDBnx/5ytuiJcVEelpJzUVejAgUQ+E+9duYv3UGlVYd6Qc
	 r4zqmvsbWKdA0cJajv2SPxgVKcb0hijhaOklOVQlSBDVsoP9dL05EhvTl84inR0XV2
	 SOhmg7oP7OTOnFbIRzEeCNf98/k5Kb+G8EL06x0tHIbr/ZVoc7Zxgt8CwqmF7jRC6F
	 3dNkPwwFKbSZQeFd5N8obJRtfeSvW32wkDbjeh5Wn5IDPOkWN816USvFQOr8EafbJZ
	 lkS0pd5oNTjeKR7fK/XaxFHAzBmgdhhESv/yj4IbEt7uSuqL4v2EsJhltUGJRUs1Aa
	 9/6G86k2kaRvg==
Message-ID: <3ae005d8-b2e3-4a71-af0b-d57f00727b30@kernel.org>
Date: Mon, 8 Jul 2024 22:42:08 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/6] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Julien Panis
 <jpanis@baylibre.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com,
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
 <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
 <20240705181509.1437b12e@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240705181509.1437b12e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/07/2024 04:15, Jakub Kicinski wrote:
> On Wed, 03 Jul 2024 16:51:32 +0300 Roger Quadros wrote:
>>  
>> -	if (queue >= AM65_CPSW_MAX_TX_QUEUES)
>> +	if (queue >= AM65_CPSW_MAX_TX_QUEUES &&
>> +	    queue >= AM65_CPSW_MAX_RX_QUEUES)
>>  		return -EINVAL;
> 
> both MAXes are 8, the else conditions below are dead code
> Same for set

yes. Maybe I should just use one define for both? e.g. AM65_CPSW_MAX_QUEUES.

> 
>> -	tx_chn = &common->tx_chns[queue];
>> +	if (queue < AM65_CPSW_MAX_TX_QUEUES) {
>> +		tx_chn = &common->tx_chns[queue];
>> +		coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
>> +	} else {
>> +		coal->tx_coalesce_usecs = ~0;
>> +	}
>>  
>> -	coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
>> +	if (queue < AM65_CPSW_MAX_RX_QUEUES) {
>> +		rx_flow = &common->rx_chns.flows[queue];
>> +		coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
>> +	} else {
>> +		coal->rx_coalesce_usecs = ~0;
>> +	}
> 
> +	for (flow_idx = 0; flow_idx < common->rx_ch_num_flows; flow_idx++) {
> +		flow = &rx_chn->flows[flow_idx];
> +		for (i = 0; i < AM65_CPSW_MAX_RX_DESC; i++) {
> +			page = page_pool_dev_alloc_pages(flow->page_pool);
> +			if (!page) {
> +				dev_err(common->dev, "cannot allocate page in flow %d\n",
> +					flow_idx);
> +				ret = -ENOMEM;
> +				if (i)
> +					goto fail_rx;
>  
> -			return ret;
> -		}
> -		rx_chn->pages[i] = page;
> +				return ret;
> 
> the direct returns now that it's a double-nested loop seem questionable,
> don't you have to goto fail_rx?

Good catch. I should just drop the "if (i)" and goto fail_rx regardless.

-- 
cheers,
-roger

