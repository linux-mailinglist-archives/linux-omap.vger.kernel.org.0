Return-Path: <linux-omap+bounces-2381-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 526EE99852A
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 13:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0654E1F223A3
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 11:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348231C32FF;
	Thu, 10 Oct 2024 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCkGCi4y"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D551C244C;
	Thu, 10 Oct 2024 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728560223; cv=none; b=HX5Ff2nxVnoTLeMSLX0mcnwdOWt0gL6L8cgxF4ZU1b5q8id/Y526yAKq6p5AA0f8HKcT1pj9R1PVzN1008Q9MtRX42EnEWMwqKzeCV1dataVNJUTGQfVe8E3QULu/vrOUZThTwaV1aEM31E1wPKMsgIjJ1XeVHIZT3JsyCEJ95c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728560223; c=relaxed/simple;
	bh=6sN9NiVMs+mNbF82/Dl7byU7N6CfksVb4qD0SmT0wN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=phukXKZP6+BZqgNKreWCjw9Lz6Ccv1qISQ9UWlM7UNQVejrFbMbm1qrV8M+QMLMjIQ0gEZpujjgBiBLMGerr0JZMTlsxvLWssEXcP1hVn07RFlud+bWRw8Bl65uglO5nJNfLCryKWLphMf6zKKa9s1VIgEPy0v5MY4peNIVxxCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCkGCi4y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E47CC4CEC5;
	Thu, 10 Oct 2024 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728560223;
	bh=6sN9NiVMs+mNbF82/Dl7byU7N6CfksVb4qD0SmT0wN0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UCkGCi4yx9jq6b+kP6jVEX/OMs8lBRB7FvmSkNCDc5MViRJZ9/6m43+Y/63alG7Yl
	 A0QAxMaFaRugaG/+5jXKBaNlX3tmWXvWEfy4A6uRsBtMYWnrg3rZVW6p52S/PdOras
	 neydh9dN90RkDsbWqCHR1/U9QfIDTdjN9d2cnWxy4qWiV+bFSF5CgzRMTNqj7jT9+E
	 wBjAqk8i3fef3tsi8vP0GKO/PVEoMC5cYoTmG+G6E6TwRtppt6DE8VeF9NN2SGakY3
	 hZQA8Jg0tgUht5mXdxzHuN5nmEVJOqOrpK+vbxRguN+C/dYhy3EBMwiQaYeXudXIeG
	 ncoXB24qndzRw==
Message-ID: <901ab11e-bfe3-487c-9867-53289c848792@kernel.org>
Date: Thu, 10 Oct 2024 14:36:58 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] clk: twl: add TWL6030 support
To: Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-omap@vger.kernel.org
References: <20241010074355.58161-1-andreas@kemnade.info>
 <20241010074355.58161-4-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010074355.58161-4-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 10/10/2024 10:43, Andreas Kemnade wrote:
> The TWL6030 has similar clocks, so add support for it. Take care of the
> resource grouping handling needed.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/clk/Kconfig   |  2 +-
>  drivers/clk/clk-twl.c | 52 +++++++++++++++++++++++++++++++++++--------
>  2 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 299bc678ed1b..82ec12f9b82c 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -291,7 +291,7 @@ config CLK_TWL
>  	help
>  	  Enable support for controlling the clock resources on TWL family
>  	  PMICs. These devices have some 32K clock outputs which can be
> -	  controlled by software. For now, only the TWL6032 clocks are
> +	  controlled by software. For now, the TWL6032 and TWL6030 clocks are
>  	  supported.
>  
>  config CLK_TWL6040
> diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c
> index 1d684b358401..c04bcb61e260 100644
> --- a/drivers/clk/clk-twl.c
> +++ b/drivers/clk/clk-twl.c
> @@ -11,13 +11,29 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> -#define VREG_STATE              2
> +#define VREG_STATE		2
> +#define VREG_GRP		0
>  #define TWL6030_CFG_STATE_OFF   0x00
>  #define TWL6030_CFG_STATE_ON    0x01
>  #define TWL6030_CFG_STATE_MASK  0x03
> +#define TWL6030_CFG_STATE_GRP_SHIFT	5
> +#define TWL6030_CFG_STATE_APP_SHIFT	2
> +#define TWL6030_CFG_STATE_APP_MASK	(0x03 << TWL6030_CFG_STATE_APP_SHIFT)
> +#define TWL6030_CFG_STATE_APP(v)	(((v) & TWL6030_CFG_STATE_APP_MASK) >>\
> +						TWL6030_CFG_STATE_APP_SHIFT)
> +#define P1_GRP BIT(0) /* processor power group */
> +#define P2_GRP BIT(1)
> +#define P3_GRP BIT(2)
> +#define ALL_GRP (P1_GRP | P2_GRP | P3_GRP)
> +
> +enum twl_type {
> +	TWL_TYPE_6030,
> +	TWL_TYPE_6032,
> +};
>  
>  struct twl_clock_info {
>  	struct device *dev;
> +	enum twl_type type;
>  	u8 base;
>  	struct clk_hw hw;
>  };
> @@ -56,14 +72,21 @@ static unsigned long twl_clks_recalc_rate(struct clk_hw *hw,
>  static int twl6032_clks_prepare(struct clk_hw *hw)
>  {
>  	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> -	int ret;
>  
> -	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> -			   TWL6030_CFG_STATE_ON);
> -	if (ret < 0)
> -		dev_err(cinfo->dev, "clk prepare failed\n");
> +	if (cinfo->type == TWL_TYPE_6030) {
> +		int grp;
> +
> +		grp = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
> +		if (grp < 0)
> +			return grp;
>  
> -	return ret;
> +		return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +				    grp << TWL6030_CFG_STATE_GRP_SHIFT |
> +				    TWL6030_CFG_STATE_ON);
> +	}
> +
> +	return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +			    TWL6030_CFG_STATE_ON);
>  }
>  
>  static void twl6032_clks_unprepare(struct clk_hw *hw)
> @@ -71,8 +94,14 @@ static void twl6032_clks_unprepare(struct clk_hw *hw)
>  	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
>  	int ret;
>  
> -	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> -			   TWL6030_CFG_STATE_OFF);
> +	if (cinfo->type == TWL_TYPE_6032)

Shouldn't this be done for TWL_TYPE_6030?

> +		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +				   ALL_GRP << TWL6030_CFG_STATE_GRP_SHIFT |
> +				   TWL6030_CFG_STATE_OFF);
> +	else> +		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +				   TWL6030_CFG_STATE_OFF);
> +
>  	if (ret < 0)
>  		dev_err(cinfo->dev, "clk unprepare failed\n");
>  }
> @@ -138,6 +167,7 @@ static int twl_clks_probe(struct platform_device *pdev)
>  	for (i = 0; i < count; i++) {
>  		cinfo[i].base = hw_data[i].base;
>  		cinfo[i].dev = &pdev->dev;
> +		cinfo[i].type = platform_get_device_id(pdev)->driver_data;
>  		cinfo[i].hw.init = &hw_data[i].init;
>  		ret = devm_clk_hw_register(&pdev->dev, &cinfo[i].hw);
>  		if (ret) {
> @@ -159,7 +189,11 @@ static int twl_clks_probe(struct platform_device *pdev)
>  
>  static const struct platform_device_id twl_clks_id[] = {
>  	{
> +		.name = "twl6030-clk",
> +		.driver_data = TWL_TYPE_6030,
> +	}, {
>  		.name = "twl6032-clk",
> +		.driver_data = TWL_TYPE_6032,
>  	}, {
>  		/* sentinel */
>  	}

-- 
cheers,
-roger

