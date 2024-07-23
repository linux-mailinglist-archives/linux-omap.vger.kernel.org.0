Return-Path: <linux-omap+bounces-1779-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F31193A4BB
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2024 19:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 081B5283099
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2024 17:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8141581F8;
	Tue, 23 Jul 2024 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="qCTatXom"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB414D431
	for <linux-omap@vger.kernel.org>; Tue, 23 Jul 2024 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721754695; cv=none; b=SDAEVLXpz23br7KLeM063LqTP2tHD1jG/JHqU+QsMT0w+0YVYnGzDiDwRjcdGGcAtKSV9iNeq+gV7cnpis/ZMAZ2O3sBCtUo6ugR2HFIlxRYX1nAl17D39rQJ+nlf4vJuRM/xLaMo37kltLHZzeX1it91AjfFhQKrLk3XvIRoK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721754695; c=relaxed/simple;
	bh=isWGflkoO86SgZH3nmLkfFtT7g7nJqjcDjS/VDDroJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npVmHbyOGekVB1KHCPadNoom0HZOz+HDej1mYNIx1GIu2TtTb6dDidiN/K/ciJTuJNa6UfLUenGOiAhdR0TKLTKjhBojKOw7wt4iwpRbmlFmy/1QMEWb3+mDPpUsdh2ct5HDTu4MUCPj6IIkgiFWjwsg0RuurnTcr3fh8cme1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=qCTatXom; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7928d2abe0aso41881a12.0
        for <linux-omap@vger.kernel.org>; Tue, 23 Jul 2024 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1721754693; x=1722359493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lbPE0UM3Jrs4ydCsNHNwpK7/1H6fvrGuUR3T5aqgjQ=;
        b=qCTatXomcWrhT71d+Ag2BbyduM46bOfs3X/QLugKUL+34Ye9cIKxq3ni5dOtlvf+PD
         pezzWmKLAtJ8Tu6uhuUkAhhckj6d3CDoSMOZS5K3VxOuc9h4vq6t3dI8LKmCUmrmbu5i
         d2W6yCzY6A9NDfcNbmt4qFixwpg47YeL7b4+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721754693; x=1722359493;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lbPE0UM3Jrs4ydCsNHNwpK7/1H6fvrGuUR3T5aqgjQ=;
        b=idaWIj6GLnk02I3jOYDT/WwXWHbA3jfiXN3wlQglrJYuV2GAunIDbc8Pqgo+5pDA7b
         hJWqOwTGCYKKVn71RY3wONJRgniEZkXOOqNcFDLFx5Q+VxLJsBPJqyXSJ/kEPH3y+DuP
         JsIdgnszuF81LsPlTMOWbpICGwWophsxmzjp8DyNtB0zOlUCKlf/etssnZFnog8kucKv
         lggcrP2NYcuXATkRWBozzJcwMyNOTXSL0nvBc5DO9aTC7ybX3rEXsdx2ePR99z0mqZb5
         t0xJXw8gcKMW4xomxDkB4RWHl1aR1Ng2rH2vAHnOxSI/BRk77R0YsPGCrVd7q0EsivCR
         I0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8AHG3+eEWzj9695Mf+16NZAWWWvZs4KlYF++Rll5a/DyQrreOXEw4gs3J/UEnUVieldUsB6nNsLWp0l6II5wIjxVxosk/jGxYGw==
X-Gm-Message-State: AOJu0YwC/FM+zaEmTV9q9lLk7SPk+yYk2PIvLl3V5rQooWsx6Yf/n9LW
	V1gwC+j+Doc+RAUPDIU0Up29k3G2StIqTN0Jdt0mbf09fEl0ydPY47xNfklsH/8=
X-Google-Smtp-Source: AGHT+IERjQE12AVH/9qhh0rA29w4YYdzDBuRUtXQS1+HbTSvKLuxlXY1F1l06HpgRZuGpGjZgC3M/w==
X-Received: by 2002:a17:90b:4b8e:b0:2c2:d6ca:3960 with SMTP id 98e67ed59e1d1-2cd8d10997dmr4384702a91.17.1721754693040;
        Tue, 23 Jul 2024 10:11:33 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb773045ebsm10516402a91.16.2024.07.23.10.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 10:11:32 -0700 (PDT)
Date: Tue, 23 Jul 2024 10:11:29 -0700
From: Joe Damato <jdamato@fastly.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Julien Panis <jpanis@baylibre.com>, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com,
	danishanwar@ti.com, pekka Varis <p-varis@ti.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/6] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
Message-ID: <Zp_kQX3dj3J1_u6o@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Julien Panis <jpanis@baylibre.com>, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com,
	danishanwar@ti.com, pekka Varis <p-varis@ti.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
 <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>

On Wed, Jul 03, 2024 at 04:51:32PM +0300, Roger Quadros wrote:

[...]

> @@ -699,6 +727,14 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
>  		goto fail_rx;
>  	}
>  
> +	for (i = 0; i < common->rx_ch_num_flows ; i++) {
> +		napi_enable(&common->rx_chns.flows[i].napi_rx);
> +		if (common->rx_chns.flows[i].irq_disabled) {
> +			common->rx_chns.flows[i].irq_disabled = false;

Just a minor nit (not a reason to hold this back): I've been
encouraging folks to use the new netdev-genl APIs in their drivers
to map NAPIs to queues and IRQs if possible because it allows for
more expressive and interesting userland applications.

You may consider in the future using something vaguely like (this is
untested psuedo-code I just typed out):

   netif_napi_set_irq(&common->rx_chns.flows[i].napi_rx,
                      common->rx_chns.flows[i].irq);

and 

   netif_queue_set_napi(common->dev, i, NETDEV_QUEUE_TYPE_RX,
                        &common->rx_chns.flows[i].napi_rx);

To link everything together (note that RTNL must be held while doing
this -- I haven't checked your code path to see if that is true here).

For an example, see 64b62146ba9e ("net/mlx4: link NAPI instances to
queues and IRQs). 

Doing this would allow userland to get data via netlink, which you
can examine yourself by using cli.py like this:

python3 tools/net/ynl/cli.py \
  --spec Documentation/netlink/specs/netdev.yaml \
  --dump queue-get

python3 tools/net/ynl/cli.py \
  --spec Documentation/netlink/specs/netdev.yaml \
  --dump napi-get

> +			enable_irq(common->rx_chns.flows[i].irq);
> +		}
> +	}
> +
>  	for (tx = 0; tx < common->tx_ch_num; tx++) {
>  		ret = k3_udma_glue_enable_tx_chn(tx_chn[tx].tx_chn);
>  		if (ret) {
> @@ -710,12 +746,6 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
>  		napi_enable(&tx_chn[tx].napi_tx);
>  	}
>  
> -	napi_enable(&common->napi_rx);
> -	if (common->rx_irq_disabled) {
> -		common->rx_irq_disabled = false;
> -		enable_irq(rx_chn->irq);
> -	}
> -
>  	dev_dbg(common->dev, "cpsw_nuss started\n");
>  	return 0;
>  
> @@ -726,11 +756,24 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
>  		tx--;
>  	}
>  
> +	for (flow_idx = 0; i < common->rx_ch_num_flows; flow_idx++) {
> +		flow = &rx_chn->flows[flow_idx];
> +		if (!flow->irq_disabled) {
> +			disable_irq(flow->irq);
> +			flow->irq_disabled = true;
> +		}
> +		napi_disable(&flow->napi_rx);
> +	}
> +
>  	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
>  
>  fail_rx:
> -	k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, 0, rx_chn,
> -				  am65_cpsw_nuss_rx_cleanup, 0);
> +	for (i = 0; i < common->rx_ch_num_flows; i--)
> +		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, &rx_chn->flows[i],
> +					  am65_cpsw_nuss_rx_cleanup, !!i);
> +
> +	am65_cpsw_destroy_xdp_rxqs(common);
> +
>  	return ret;
>  }
>  
> @@ -779,12 +822,12 @@ static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
>  			dev_err(common->dev, "rx teardown timeout\n");
>  	}
>  
> -	napi_disable(&common->napi_rx);
> -	hrtimer_cancel(&common->rx_hrtimer);
> -
> -	for (i = 0; i < AM65_CPSW_MAX_RX_FLOWS; i++)
> -		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, rx_chn,
> +	for (i = 0; i < common->rx_ch_num_flows; i++) {
> +		napi_disable(&common->rx_chns.flows[i].napi_rx);

The inverse of the above is probably true somewhere around here;
again a small piece of psuedo code for illustrative purposes:

   netif_queue_set_napi(common->dev, i, NETDEV_QUEUE_TYPE_RX, NULL);

> +		hrtimer_cancel(&common->rx_chns.flows[i].rx_hrtimer);
> +		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, &rx_chn->flows[i],
>  					  am65_cpsw_nuss_rx_cleanup, !!i);
> +	}
>  
>  	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
>  

