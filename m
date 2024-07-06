Return-Path: <linux-omap+bounces-1734-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D5928FEF
	for <lists+linux-omap@lfdr.de>; Sat,  6 Jul 2024 03:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EEEDB22F05
	for <lists+linux-omap@lfdr.de>; Sat,  6 Jul 2024 01:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A246A95B;
	Sat,  6 Jul 2024 01:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdDecK+P"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA426FC2;
	Sat,  6 Jul 2024 01:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720228511; cv=none; b=Mm8EyJpd6gjb4tNQ2dEfz5Z5b10UbXtaaMGxzn4/9RxfBb0zSXJD4GeVdlXq9l63RtmslNfpIxGzBWO03Hjt+g8CiKpYpy9XrFaLX6CKvUbhoPpCOXWJ9iA2xcUkue+CrMYykhiWkXdbQucO+0yRJwOqxeChcm/JgMICSkZaD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720228511; c=relaxed/simple;
	bh=PAaZD1M7e9sIxFScmdr1WJTZAFf2RfyaoOLdehXK6i0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJqrTLuLl4gtMWuv2ErlAZ5pVSO2ByEuanG8+MIuD2z1driLq05w3ssVS45AP28TO+7SkWmRsMVVBmkabR736QMpbZ2cwk6j8PeCuoiylkEM7cyLcfhi+myi/1cc1qNe1n2UssazeNFWwXYa2oQ5Y+xt1B5sHX8sX+F+ZjS0T9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdDecK+P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2810C32781;
	Sat,  6 Jul 2024 01:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720228511;
	bh=PAaZD1M7e9sIxFScmdr1WJTZAFf2RfyaoOLdehXK6i0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tdDecK+PGicM3lkQueAE/603HJc8tfzepIx69meYL4OctZLn5p/s7y+JbqoVTBVb0
	 JE4BpWIIpdbCtPdgkzbktMMYCBZD1IumBzVA/6sWsHP2r1UR52i8pDYdsKUcK2Y/+s
	 JwKYh+vQWblgzis9fg5Q85+ZO8fZ/tMQU0ZKL8+N1TGZKBK/N6qyXoKMBMn6ZmyWpv
	 xmYoWkt9NMleO5C9IGnWR15U5fzEfACf3Tpupy3FYBp25+80nPJGxmUH0wqVsWMUZv
	 GO/UnK3PMPAQ2W2+9mE1n79WWc9jkul0X44RRAZnqSt/hRCJGd5p+oH1K8tWUF4xd+
	 4tASO6btqkSAQ==
Date: Fri, 5 Jul 2024 18:15:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Julien Panis <jpanis@baylibre.com>, Simon Horman
 <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, srk@ti.com,
 vigneshr@ti.com, danishanwar@ti.com, pekka Varis <p-varis@ti.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/6] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
Message-ID: <20240705181509.1437b12e@kernel.org>
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
	<20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 03 Jul 2024 16:51:32 +0300 Roger Quadros wrote:
>  
> -	if (queue >= AM65_CPSW_MAX_TX_QUEUES)
> +	if (queue >= AM65_CPSW_MAX_TX_QUEUES &&
> +	    queue >= AM65_CPSW_MAX_RX_QUEUES)
>  		return -EINVAL;

both MAXes are 8, the else conditions below are dead code
Same for set

> -	tx_chn = &common->tx_chns[queue];
> +	if (queue < AM65_CPSW_MAX_TX_QUEUES) {
> +		tx_chn = &common->tx_chns[queue];
> +		coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
> +	} else {
> +		coal->tx_coalesce_usecs = ~0;
> +	}
>  
> -	coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
> +	if (queue < AM65_CPSW_MAX_RX_QUEUES) {
> +		rx_flow = &common->rx_chns.flows[queue];
> +		coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
> +	} else {
> +		coal->rx_coalesce_usecs = ~0;
> +	}

+	for (flow_idx = 0; flow_idx < common->rx_ch_num_flows; flow_idx++) {
+		flow = &rx_chn->flows[flow_idx];
+		for (i = 0; i < AM65_CPSW_MAX_RX_DESC; i++) {
+			page = page_pool_dev_alloc_pages(flow->page_pool);
+			if (!page) {
+				dev_err(common->dev, "cannot allocate page in flow %d\n",
+					flow_idx);
+				ret = -ENOMEM;
+				if (i)
+					goto fail_rx;
 
-			return ret;
-		}
-		rx_chn->pages[i] = page;
+				return ret;

the direct returns now that it's a double-nested loop seem questionable,
don't you have to goto fail_rx?

