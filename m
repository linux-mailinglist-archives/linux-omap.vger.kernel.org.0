Return-Path: <linux-omap+bounces-1789-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C444193DD83
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 08:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1201F223FB
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 06:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FAC208DA;
	Sat, 27 Jul 2024 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9uypvYp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA881D6AA;
	Sat, 27 Jul 2024 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722061752; cv=none; b=nV/vHJ+szgH73ZJ56q2Kpmx5HytbgWGpFTXI6/y9rafkiVxuNq7sxmiWdZ483IXcjRJyB8Kz6+H1YbMP2w7v8H/Q3a1hbJSph4Msra3ZPrBMftz1NyjyzFtoVtQEhcDpCBnyarKdZoXYhvJwVPF4aqz62N6PKtdJPcMMfqWJhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722061752; c=relaxed/simple;
	bh=dHuNgoc9rCCaFNCfcmeMFW/cFrgGm9rsTMaxS2WMQyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sCDv6/DnrSKut9e0WlMHgg22gx70mpHWnSc5WIHe0diaJPcCjFE089IrkGTnHLHj7NqYYmbgdUCX/mSJJuBczrLaU0dL6SjgDJ6XokVWeqUmwCIdLdugySX8R+gXxUWd18Ug8pwJj7Yx2pnGChBIdf85EF69mXJdQghwb30h+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9uypvYp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9072EC32781;
	Sat, 27 Jul 2024 06:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722061752;
	bh=dHuNgoc9rCCaFNCfcmeMFW/cFrgGm9rsTMaxS2WMQyI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z9uypvYph7phvnG/SQAz1zgQ9+mgbTA5QKrKiqB54p1eg/JFX0q2x83d75MttmJdN
	 EFdrAVSXqzgsD3iwLJqD0agpznsckxJZlVQBB07pIEABc25NJMESVyB6ucCkrPIs4w
	 WjAlPXArC+ilv9R6tqv8m1ZIXgX+yXl6ykw/DZlICGybuogeiMYKW9JYU0JkkbE8lk
	 b+pmQgobLGl1zz7yjiEEOngASg0BDxEBlZkpbNpqb6pv2ISrmxkA2t6ZGLf06QiRiq
	 JG928TrXKix16bXEu/Wn9d8MqmdXmOOFRbpn2d+uXef79d8SCimlPzXRkjGt6Fm2F7
	 YgXAglTok3S1A==
Message-ID: <78ba8419-8d4c-4bc0-9d76-77b1fa00be84@kernel.org>
Date: Sat, 27 Jul 2024 09:29:05 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/6] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
To: Joe Damato <jdamato@fastly.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Julien Panis <jpanis@baylibre.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com,
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
 <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
 <Zp_kQX3dj3J1_u6o@LQ3V64L9R2>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <Zp_kQX3dj3J1_u6o@LQ3V64L9R2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23/07/2024 20:11, Joe Damato wrote:
> On Wed, Jul 03, 2024 at 04:51:32PM +0300, Roger Quadros wrote:
> 
> [...]
> 
>> @@ -699,6 +727,14 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
>>  		goto fail_rx;
>>  	}
>>  
>> +	for (i = 0; i < common->rx_ch_num_flows ; i++) {
>> +		napi_enable(&common->rx_chns.flows[i].napi_rx);
>> +		if (common->rx_chns.flows[i].irq_disabled) {
>> +			common->rx_chns.flows[i].irq_disabled = false;
> 
> Just a minor nit (not a reason to hold this back): I've been
> encouraging folks to use the new netdev-genl APIs in their drivers
> to map NAPIs to queues and IRQs if possible because it allows for
> more expressive and interesting userland applications.
> 
> You may consider in the future using something vaguely like (this is
> untested psuedo-code I just typed out):
> 
>    netif_napi_set_irq(&common->rx_chns.flows[i].napi_rx,
>                       common->rx_chns.flows[i].irq);
> 
> and 
> 
>    netif_queue_set_napi(common->dev, i, NETDEV_QUEUE_TYPE_RX,
>                         &common->rx_chns.flows[i].napi_rx);
> 
> To link everything together (note that RTNL must be held while doing
> this -- I haven't checked your code path to see if that is true here).
> 
> For an example, see 64b62146ba9e ("net/mlx4: link NAPI instances to
> queues and IRQs). 
> 
> Doing this would allow userland to get data via netlink, which you
> can examine yourself by using cli.py like this:
> 
> python3 tools/net/ynl/cli.py \
>   --spec Documentation/netlink/specs/netdev.yaml \
>   --dump queue-get
> 
> python3 tools/net/ynl/cli.py \
>   --spec Documentation/netlink/specs/netdev.yaml \
>   --dump napi-get
> 

Thanks for the pionters. I will check and see if I can incorportate
this in the next spin.

>> +			enable_irq(common->rx_chns.flows[i].irq);
>> +		}
>> +	}
>> +
>>  	for (tx = 0; tx < common->tx_ch_num; tx++) {
>>  		ret = k3_udma_glue_enable_tx_chn(tx_chn[tx].tx_chn);
>>  		if (ret) {
>> @@ -710,12 +746,6 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
>>  		napi_enable(&tx_chn[tx].napi_tx);
>>  	}
>>  
>> -	napi_enable(&common->napi_rx);
>> -	if (common->rx_irq_disabled) {
>> -		common->rx_irq_disabled = false;
>> -		enable_irq(rx_chn->irq);
>> -	}
>> -
>>  	dev_dbg(common->dev, "cpsw_nuss started\n");
>>  	return 0;
>>  
>> @@ -726,11 +756,24 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
>>  		tx--;
>>  	}
>>  
>> +	for (flow_idx = 0; i < common->rx_ch_num_flows; flow_idx++) {
>> +		flow = &rx_chn->flows[flow_idx];
>> +		if (!flow->irq_disabled) {
>> +			disable_irq(flow->irq);
>> +			flow->irq_disabled = true;
>> +		}
>> +		napi_disable(&flow->napi_rx);
>> +	}
>> +
>>  	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
>>  
>>  fail_rx:
>> -	k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, 0, rx_chn,
>> -				  am65_cpsw_nuss_rx_cleanup, 0);
>> +	for (i = 0; i < common->rx_ch_num_flows; i--)
>> +		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, &rx_chn->flows[i],
>> +					  am65_cpsw_nuss_rx_cleanup, !!i);
>> +
>> +	am65_cpsw_destroy_xdp_rxqs(common);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -779,12 +822,12 @@ static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
>>  			dev_err(common->dev, "rx teardown timeout\n");
>>  	}
>>  
>> -	napi_disable(&common->napi_rx);
>> -	hrtimer_cancel(&common->rx_hrtimer);
>> -
>> -	for (i = 0; i < AM65_CPSW_MAX_RX_FLOWS; i++)
>> -		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, rx_chn,
>> +	for (i = 0; i < common->rx_ch_num_flows; i++) {
>> +		napi_disable(&common->rx_chns.flows[i].napi_rx);
> 
> The inverse of the above is probably true somewhere around here;
> again a small piece of psuedo code for illustrative purposes:
> 
>    netif_queue_set_napi(common->dev, i, NETDEV_QUEUE_TYPE_RX, NULL);
> 
>> +		hrtimer_cancel(&common->rx_chns.flows[i].rx_hrtimer);
>> +		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, &rx_chn->flows[i],
>>  					  am65_cpsw_nuss_rx_cleanup, !!i);
>> +	}
>>  
>>  	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
>>  

-- 
cheers,
-roger

