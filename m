Return-Path: <linux-omap+bounces-2708-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 152139D26D1
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 14:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B7F2B248BA
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 13:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB6F1CCB27;
	Tue, 19 Nov 2024 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mj0GY3VV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4F1C1F2A;
	Tue, 19 Nov 2024 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021829; cv=none; b=JGvZ5ojoCMxVAufJXS5ZmAvQLFFQ/MKP5en8Ag4nmxZo/isiVZnuTYKDblWxjOdDVlGxOgb0V2nYh6ELKJMRdx5LcE8PPZnt6scosLjoLSFoJiw9e9guao25Ukgo8wccGV4R5iP1N4WDZQThNme6ZdeyRcCXzpn6kdnTAjSRHjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021829; c=relaxed/simple;
	bh=jHtbwHjRYW5n1tFny3q7PX7aQBPP6aaxSjaFLlAFOb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUjS5osBd998e48ixSJTb8G1RGY2OPE9cTIsDgwhxtoG+uFkTYvitSsWOea7D4dJ/E2Z1HvolsxneqtJ5eTWWxxDGyY/Su6jo0XTk8csYBqJyx/AZgd9Xr2yVdnPbXgnUW47Ha53/8mQrd+ODKkM4BNo3pzVlCqcJ7AiyqDSFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mj0GY3VV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0F7C4CECF;
	Tue, 19 Nov 2024 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732021828;
	bh=jHtbwHjRYW5n1tFny3q7PX7aQBPP6aaxSjaFLlAFOb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mj0GY3VVMgVE+r+8BuD2Uxil+06CzEMOa+aylCeNqcxkRo6N973nIJtVZ9NY5XcU+
	 PttwBwX40Ah8EnaCCCBI+EXgrSXSDK6iKDKWwj2k5ydNWJqMadTzJfBEdRrrd0z+Se
	 E71WakDqJfA2waNbgTIQHXdZRqKHE7yu75VACJ2o0x7xJL1yP/ssX+GDAZxt81BwfZ
	 YZ3kxVNqadoCvWpb2bDq9keWfVEVmTVd4AFCNVP7j/BpjEZcl4ieohmdof27A5kvQ2
	 RcyHmvYzLcrYeWyTIlheoyp/mWMjUqi/PMJff2XyMbrA9oqJcOJljHCfkeic7ZsGAP
	 C0+rC0pgrptvA==
Message-ID: <486d5734-aa02-4a5e-b2ee-fdbba65179a3@kernel.org>
Date: Tue, 19 Nov 2024 15:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: omap-usb-tll: check clk_prepare return code
To: Karol Przybylski <karprzy7@gmail.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, tony@atomide.com, lee@kernel.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20241113211614.518439-1-karprzy7@gmail.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241113211614.518439-1-karprzy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13/11/2024 23:16, Karol Przybylski wrote:
> clk_prepare() is called in usbtll_omap_probe to fill clk array.
> Return code is not checked, leaving possible error condition unhandled.
> 
> Added variable to hold return value from clk_prepare() and dev_dbg statement
> when it's not successful.
> 
> Found in coverity scan, CID 1594680
> 
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/mfd/omap-usb-tll.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> index 0f7fdb99c809..2e9319ee1b74 100644
> --- a/drivers/mfd/omap-usb-tll.c
> +++ b/drivers/mfd/omap-usb-tll.c
> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>  	struct device				*dev =  &pdev->dev;
>  	struct usbtll_omap			*tll;
>  	void __iomem				*base;
> -	int					i, nch, ver;
> +	int					i, nch, ver, err;
>  
>  	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
>  
> @@ -248,10 +248,13 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>  					"usb_tll_hs_usb_ch%d_clk", i);
>  		tll->ch_clk[i] = clk_get(dev, clkname);
>  
> -		if (IS_ERR(tll->ch_clk[i]))
> +		if (IS_ERR(tll->ch_clk[i])) {
>  			dev_dbg(dev, "can't get clock : %s\n", clkname);
> -		else
> -			clk_prepare(tll->ch_clk[i]);
> +		} else {
> +			err = clk_prepare(tll->ch_clk[i]);
> +			if (err)
> +				dev_dbg(dev, "clock prepare error for: %s\n", clkname);

dev_err()?

I think we should return the error in this case.
(after unpreparing the prepared clocks and clk_put())

> +		}
>  	}
>  
>  	pm_runtime_put_sync(dev);

-- 
cheers,
-roger


