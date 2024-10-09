Return-Path: <linux-omap+bounces-2364-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71856996BC2
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 15:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B931F26DEF
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 13:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A1C197A97;
	Wed,  9 Oct 2024 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1513Eko"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BEC192D80;
	Wed,  9 Oct 2024 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728480175; cv=none; b=Eq5VZPkU4Z3u/c0WoVOaLU2rvCFsbT+Jzgsz9Z/Q1XTJo37ac7pGjxzLi1RhdNL2KmUNabmKQnLpjBephTTzDIGPOiG3u0bi7T2+n5BQBA8KlTHaFNo6jfvHvkDt2Ttqojzo4YMi+MwVmohAmB8DCxhZM845DAopNb2h0zOzohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728480175; c=relaxed/simple;
	bh=zhhK3FaUkQMbNK2hkbHPY3f2BUJsOzxajZKqhWPK0nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFJTfd3N3dhtRp4hb7433RHohh8u+qZ/mtRd/4Ggyx7nLVOBLUxckT4U+xIr8NiYpIanGn5fKOjcbspmJTxs0f8Ed9opSk4S2UMPmODvd7kiXgSXrUsRa+dvu4EaloCksd3XSs+smLOkP3w7Wa2wYFrW0HWWt87J3wPi8le91oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1513Eko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CB6C4CEC5;
	Wed,  9 Oct 2024 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728480174;
	bh=zhhK3FaUkQMbNK2hkbHPY3f2BUJsOzxajZKqhWPK0nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1513EkoFkmorAganPoIWaBGs1W8UFS54B1MdFmh+bqNHOsD/edUMJxfIKwGIjrD1
	 NABHlp/FLvt5HxMMCOt6GBuCxnNh7x5UGeYI3GNdE4I/Lzm3M936H2zYdqKSyhKfnl
	 dhD2fIMEMtjMoobXJ/MfF7JBpIfqNctjxfYWXIJt9NpTZ0Iut611G6494XtsWkNio+
	 f/gTBywqYBNqfVxh/SE/34H4kPBI8o0aNwho/tDE4Li16CGq9/NJJuqwlXjLpPOXSs
	 NUvVUK3IUkKgTB2hxjuEJoe6eUIHz2YAZ7UY9N6+wiLxT9rqt2RxFEtI+fzfm+rLt0
	 Tr1NFhuLPXPWg==
Date: Wed, 9 Oct 2024 14:22:49 +0100
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: twl-core: Add a clock subdevice for the TWL6030
Message-ID: <20241009132249.GH276481@google.com>
References: <20240924103609.12513-1-andreas@kemnade.info>
 <20240924103609.12513-2-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924103609.12513-2-andreas@kemnade.info>

On Tue, 24 Sep 2024, Andreas Kemnade wrote:

> Also the TWL6030 has some clocks, so add a subdevice for that.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/mfd/twl-core.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index c130ffef182f..c981922f62d5 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -711,6 +711,10 @@ static struct of_dev_auxdata twl_auxdata_lookup[] = {
>  	{ /* sentinel */ },
>  };
>  
> +static const struct mfd_cell twl6030_cells[] = {
> +	{ .name = "twl6030-clk" },
> +};
> +
>  static const struct mfd_cell twl6032_cells[] = {
>  	{ .name = "twl6032-clk" },
>  };
> @@ -861,17 +865,25 @@ twl_probe(struct i2c_client *client)
>  				 TWL4030_DCDC_GLOBAL_CFG);
>  	}
>  
> -	if (id->driver_data == (TWL6030_CLASS | TWL6032_SUBCLASS)) {
> -		status = devm_mfd_add_devices(&client->dev,
> -					      PLATFORM_DEVID_NONE,
> -					      twl6032_cells,
> -					      ARRAY_SIZE(twl6032_cells),
> -					      NULL, 0, NULL);
> -		if (status < 0)
> -			goto free;
> -	}
> -
>  	if (twl_class_is_6030()) {
> +		if (id->driver_data & TWL6032_SUBCLASS) {
> +			status = devm_mfd_add_devices(&client->dev,
> +						      PLATFORM_DEVID_NONE,
> +						      twl6032_cells,
> +						      ARRAY_SIZE(twl6032_cells),
> +						      NULL, 0, NULL);
> +			if (status < 0)
> +				goto free;
> +		} else {
> +			status = devm_mfd_add_devices(&client->dev,
> +						      PLATFORM_DEVID_NONE,
> +						      twl6030_cells,
> +						      ARRAY_SIZE(twl6030_cells),
> +						      NULL, 0, NULL);
> +			if (status < 0)
> +				goto free;
> +		}
> +

Before this gets too crazy, how about:

> +		if (id->driver_data & TWL6032_SUBCLASS) {
> +			cells = twl6032_cells;
> +			num_cells = ARRAY_SIZE(twl6032_cells);
> +		} else {
> +			cells = twl6030_cells;
> +			num_cells = ARRAY_SIZE(twl6030_cells);
> +		}
> +
> +		status = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +					      cells, num_cells, NULL, 0, NULL);
> +		if (status < 0)
> +			goto free;


>  		if (of_device_is_system_power_controller(node)) {
>  			if (!pm_power_off)
>  				pm_power_off = twl6030_power_off;
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

