Return-Path: <linux-omap+bounces-1623-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45D91D907
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE07A1C20DFF
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 07:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB4275804;
	Mon,  1 Jul 2024 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE7JWIb3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F0376E6;
	Mon,  1 Jul 2024 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819324; cv=none; b=HPJ7t0T46H6ahh6wOMnPL3K+lMGXqHREygf/6iVq0PNdkNFFO373zcByz0MFe0lYSJf7AzxyZ9nq+3ROJz/dYXzvDlI+/ja7kgBGOT76lNS19+VBe3jwN4M/eVP59+v93EpSGgKgVnPYJQxelKaGNy7NMxt4UVRJemTBz9UN80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819324; c=relaxed/simple;
	bh=zAiECrfB+/h58EkLdb+N5knyn3qeEki6fYd9kIBWB6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9EJ4OU/gXudaD1IH1fD96W3bdui9KauAhOiPGOHAd1WSgboV/MzpgpVSOZOMJMoVk77XMMdgmmUYx+8vBoxGcBglzaGDKG3sCWOf29GlDKiMlOk9rMH6txT/hUeNbTXL8mHdwRUatHWQA98evNeXh0lWAPYFQ10iXpHy775ZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VE7JWIb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23994C116B1;
	Mon,  1 Jul 2024 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819323;
	bh=zAiECrfB+/h58EkLdb+N5knyn3qeEki6fYd9kIBWB6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VE7JWIb30aPuFZplTjpLmlgk3Mepu6vCSJEu6Z0BTcpsnMLRW7H2WvY13vo/ftDkB
	 /jCE1MexKJ+F2/wYKS7FVrWxXmvqHPlI7a6AxgWejaQRWC2DWoMKQVBHf7mWg+MZyi
	 pOueRUgcgkD+nPv94wa/Rv/PYmGuJg5WlSBthuPZCQe3+FX3bU3kLlro+lrCjEvT1m
	 lE4euLi2DR/fZS1pO2Ij54DE6hgK+bAFhqs3ZY7fflAxPIj9VuYH1oCHMFE2UiMLdr
	 UlWaltBUbNIAqavDw4METIeqPLuqbwmDP02Gv53mbFs+8dPWtRuYAOUKaetkRv0lFX
	 Brzvu3RQV1WLw==
Date: Mon, 1 Jul 2024 08:35:19 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
	srk@ti.com, vigneshr@ti.com, danishanwar@ti.com,
	pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/7] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
Message-ID: <20240701073519.GJ17134@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-1-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-1-c399cb77db56@kernel.org>

On Fri, Jun 28, 2024 at 03:01:50PM +0300, Roger Quadros wrote:
> am65-cpsw can support up to 8 queues at Rx.
> Use a macro AM65_CPSW_MAX_RX_QUEUES to indicate that.
> As there is only one DMA channel for RX traffic, the
> 8 queues come as 8 flows in that channel.
> 
> By default, we will start with 1 flow as defined by the
> macro AM65_CPSW_DEFAULT_RX_CHN_FLOWS.
> 
> User can change the number of flows by ethtool like so
> 'ethtool -L ethx rx <N>'
> 
> All traffic will still come on flow 0. To get traffic on
> different flows the Classifiers will need to be set up.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Hi Roger,

The nit's below notwithstanding, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>


> ---
>  drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  59 +++--
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 358 ++++++++++++++++------------
>  drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  35 +--
>  3 files changed, 272 insertions(+), 180 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
> index a1d0935d1ebe..3106bf07eb1a 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
> @@ -429,7 +429,7 @@ static void am65_cpsw_get_channels(struct net_device *ndev,
>  
>  	ch->max_rx = AM65_CPSW_MAX_RX_QUEUES;
>  	ch->max_tx = AM65_CPSW_MAX_TX_QUEUES;
> -	ch->rx_count = AM65_CPSW_MAX_RX_QUEUES;
> +	ch->rx_count = common->rx_ch_num_flows;
>  	ch->tx_count = common->tx_ch_num;
>  }
>  
> @@ -448,8 +448,9 @@ static int am65_cpsw_set_channels(struct net_device *ndev,
>  		return -EBUSY;
>  
>  	am65_cpsw_nuss_remove_tx_chns(common);
> +	am65_cpsw_nuss_remove_rx_chns(common);
>  
> -	return am65_cpsw_nuss_update_tx_chns(common, chs->tx_count);
> +	return am65_cpsw_nuss_update_tx_rx_chns(common, chs->tx_count, chs->rx_count);

nit: This line could be trivially wrapped to be <= 80 columns wide,
     as is still preferred by networking code. Likewise in a few
     other places in this patch (set).

     Flagged by checkpatch.pl --max-line-length=80


>  }
>  
>  static void
> @@ -921,10 +922,12 @@ static int am65_cpsw_get_coalesce(struct net_device *ndev, struct ethtool_coales
>  {
>  	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>  	struct am65_cpsw_tx_chn *tx_chn;
> +	struct am65_cpsw_rx_flow *rx_flow;

nit: Please consider arranging local variables in reverse xmas tree order -
     longest line to shortest - in networking code.

     Edward Cree's tool can be helpful here:
     https://github.com/ecree-solarflare/xmastree

>  
>  	tx_chn = &common->tx_chns[0];
> +	rx_flow = &common->rx_chns.flows[0];
>  
> -	coal->rx_coalesce_usecs = common->rx_pace_timeout / 1000;
> +	coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
>  	coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
>  
>  	return 0;

...

