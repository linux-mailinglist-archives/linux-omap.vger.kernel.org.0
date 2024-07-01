Return-Path: <linux-omap+bounces-1629-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB191DBAB
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 11:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1966E1F23328
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA9E84FDF;
	Mon,  1 Jul 2024 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1F3PEsI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C08B524C9;
	Mon,  1 Jul 2024 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719827093; cv=none; b=R++LjOcUBPS3vNxrFTUZFL9P+pf3W2gze0Wj8KYkKE04n2z1T1BPtDpnG9N0Pgof+UX82FXiglzTzkTAIOSBMYQHBD65zf7cBuV/7v2TuqWCKpGDCHevjTZlXIhFmKAFvy2qRp+3EOo2ICPzuPubleWOpGicKRJF0q5+lckDZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719827093; c=relaxed/simple;
	bh=iNLhes/Q5/D0xIR4HRwSLBC4x+5oo75FbXBcScG/hHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDpZI/2rqU/sz30RFRZPJed6IjwGI2YF3SihT2RFUVk1qIJ9yhwwyHOjKB15c7qxXw/n1xpMpJh7Wqxi8TozCiRnU5yR5h7HQClOUupIwcR78e41j0BoITsAqJRw6nim0x0B5tFEnUvoEe2DL5dCtzdrt/iY1bbt+eoF3mV4xAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1F3PEsI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAD9C116B1;
	Mon,  1 Jul 2024 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719827093;
	bh=iNLhes/Q5/D0xIR4HRwSLBC4x+5oo75FbXBcScG/hHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1F3PEsIUrKZJRW1j/i2GirHba0nmuXsSo9XSC8ad5MI2O53FfrQGVi4LseY5UM5z
	 8IWI2qS+XotnRK9wwz79sl/4ofLwcmU3rlzGIRvGtGBAim9nT2Ks9Sf2VP+eG7z9AN
	 td+zED/wnvlbujDjiOB1JN6uZFyfvstVnrVQ84Ky+bfC4qZAw+GzWf2e5cDmDKKwjk
	 PvNkqyxrWhg0WvyYygvV5F478l0+8d/zP5DafL4zV3b2QlS5/NYrY7sEItjziM0RxO
	 M3STQDsuj2ZSWSJbpo5c7xsGEGOswxcZG0O5DG/XGixbSS+0V9r7ftVOOIUiRm33Dc
	 nhaX/XdOtfSKA==
Message-ID: <06810265-16aa-42a9-b007-2d064cab1eb3@kernel.org>
Date: Mon, 1 Jul 2024 12:44:46 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/7] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, pekka Varis
 <p-varis@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-1-c399cb77db56@kernel.org>
 <20240701073519.GJ17134@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240701073519.GJ17134@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 01/07/2024 10:35, Simon Horman wrote:
> On Fri, Jun 28, 2024 at 03:01:50PM +0300, Roger Quadros wrote:
>> am65-cpsw can support up to 8 queues at Rx.
>> Use a macro AM65_CPSW_MAX_RX_QUEUES to indicate that.
>> As there is only one DMA channel for RX traffic, the
>> 8 queues come as 8 flows in that channel.
>>
>> By default, we will start with 1 flow as defined by the
>> macro AM65_CPSW_DEFAULT_RX_CHN_FLOWS.
>>
>> User can change the number of flows by ethtool like so
>> 'ethtool -L ethx rx <N>'
>>
>> All traffic will still come on flow 0. To get traffic on
>> different flows the Classifiers will need to be set up.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> 
> Hi Roger,
> 
> The nit's below notwithstanding, this looks good to me.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> 
>> ---
>>  drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  59 +++--
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 358 ++++++++++++++++------------
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  35 +--
>>  3 files changed, 272 insertions(+), 180 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
>> index a1d0935d1ebe..3106bf07eb1a 100644
>> --- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
>> +++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
>> @@ -429,7 +429,7 @@ static void am65_cpsw_get_channels(struct net_device *ndev,
>>  
>>  	ch->max_rx = AM65_CPSW_MAX_RX_QUEUES;
>>  	ch->max_tx = AM65_CPSW_MAX_TX_QUEUES;
>> -	ch->rx_count = AM65_CPSW_MAX_RX_QUEUES;
>> +	ch->rx_count = common->rx_ch_num_flows;
>>  	ch->tx_count = common->tx_ch_num;
>>  }
>>  
>> @@ -448,8 +448,9 @@ static int am65_cpsw_set_channels(struct net_device *ndev,
>>  		return -EBUSY;
>>  
>>  	am65_cpsw_nuss_remove_tx_chns(common);
>> +	am65_cpsw_nuss_remove_rx_chns(common);
>>  
>> -	return am65_cpsw_nuss_update_tx_chns(common, chs->tx_count);
>> +	return am65_cpsw_nuss_update_tx_rx_chns(common, chs->tx_count, chs->rx_count);
> 
> nit: This line could be trivially wrapped to be <= 80 columns wide,
>      as is still preferred by networking code. Likewise in a few
>      other places in this patch (set).

will fix.

> 
>      Flagged by checkpatch.pl --max-line-length=80
> 
> 
>>  }
>>  
>>  static void
>> @@ -921,10 +922,12 @@ static int am65_cpsw_get_coalesce(struct net_device *ndev, struct ethtool_coales
>>  {
>>  	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>>  	struct am65_cpsw_tx_chn *tx_chn;
>> +	struct am65_cpsw_rx_flow *rx_flow;
> 
> nit: Please consider arranging local variables in reverse xmas tree order -
>      longest line to shortest - in networking code.

OK.
> 
>      Edward Cree's tool can be helpful here:
>      https://github.com/ecree-solarflare/xmastree

Thanks for this tip. I will use this in my workflow.

> 
>>  
>>  	tx_chn = &common->tx_chns[0];
>> +	rx_flow = &common->rx_chns.flows[0];
>>  
>> -	coal->rx_coalesce_usecs = common->rx_pace_timeout / 1000;
>> +	coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
>>  	coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
>>  
>>  	return 0;
> 
> ...

-- 
cheers,
-roger

