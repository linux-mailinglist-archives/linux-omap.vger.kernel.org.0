Return-Path: <linux-omap+bounces-2295-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9998D309
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 14:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 188F3B23C3D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 12:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE211CF7DF;
	Wed,  2 Oct 2024 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmLCADiJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C91CF7B0;
	Wed,  2 Oct 2024 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727871773; cv=none; b=nXpTud34qytsEZo3v2aybrlU0REj1g77srZ3ixwLgpv/LzfgPGhtPWs+qUaDgfzm6D/tlwp5srFkSdEF8pcLOvE6C6dwErHQsMGgBzmfBhfbvJbf+WOUY/Z9C18KExZtCJN2zStYb3Md0bTI+Nol9wyt4Ow7lEg04gsfO4YoSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727871773; c=relaxed/simple;
	bh=HMp6UCA2+2rs9ipOXglOqAq6fYeDW0qtY7kh2N9Wki0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ivn555wh7eK69heyHdQ67MzFpxlj9EKAjYqiUemNBQNp4uq6vRTueGgVi031ZUjyu7L66BsaRXwFfQVfIFXzt1L503tleViH85HbhGnYd64Onq0QXlXxJVI+BBcU8V+NBothgbQVSlsqrveAJCXcGU+74B4RcfuYn3hmxrRl4I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmLCADiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F359C4CEF1;
	Wed,  2 Oct 2024 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727871772;
	bh=HMp6UCA2+2rs9ipOXglOqAq6fYeDW0qtY7kh2N9Wki0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tmLCADiJpeYwmu+I5EEtR0vVmlRb896l0qiaN82bwKhfzZA+cKIhSsNfBmTUvYxQM
	 UUH38M6SYGOuOzAU677LFZ3ShCnNGMBnejf6KePcHdycysAT51dIJAXOIr4xPD4+vm
	 Zb4q2nvE1z9vj0k7BGyZF4Okd6hvXtpgJNz4hXRC4XBtNb/ityfTEeZgW+lRkPBQdz
	 YpKv+am+bi9dRcluaAP04utIGRh2SeExmCS9tM5XRo17YVMTr0huc8RVUbSQciCEWY
	 nw2G9gP9VOKb5EcEW3DMihfsmb4oYkuPVUWOXi31bdfxadT0GDy14/1EwEXPwKLmdu
	 dsU/fA4LsSFyg==
Message-ID: <92a3bdfd-7b40-4524-aecf-cd3c3b54be67@kernel.org>
Date: Wed, 2 Oct 2024 15:22:47 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: twl: add TWL6030 support
To: Andreas Kemnade <andreas@kemnade.info>, Stephen Boyd <sboyd@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-omap@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
References: <20241002110718.528337-1-andreas@kemnade.info>
 <20241002110718.528337-4-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241002110718.528337-4-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/10/2024 14:07, Andreas Kemnade wrote:
> The TWL6030 has similar clocks, so add support for it. Take care of the
> resource grouping handling needed.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/clk/Kconfig   |  2 +-
>  drivers/clk/clk-twl.c | 54 +++++++++++++++++++++++++++++++++----------
>  2 files changed, 43 insertions(+), 13 deletions(-)
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
> index 1d684b358401..f3a52f568887 100644
> --- a/drivers/clk/clk-twl.c
> +++ b/drivers/clk/clk-twl.c
> @@ -11,13 +11,26 @@
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
> +#define DRIVER_DATA_TWL6030 0
> +#define DRIVER_DATA_TWL6032 1

how about using enum here?

enum twl_type {
	TWL_TYPE_6030,
	TWL_TYPE_6032,
};

>  
>  struct twl_clock_info {
> -	struct device *dev;
> +	struct platform_device *pdev;

I wouldn't change this.
Instead, you can add twl_type member here and initialize it in probe.
	enum twl_type type;

>  	u8 base;
>  	struct clk_hw hw;
>  };
> @@ -56,14 +69,21 @@ static unsigned long twl_clks_recalc_rate(struct clk_hw *hw,
>  static int twl6032_clks_prepare(struct clk_hw *hw)
>  {
>  	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> -	int ret;
>  
> -	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> -			   TWL6030_CFG_STATE_ON);
> -	if (ret < 0)
> -		dev_err(cinfo->dev, "clk prepare failed\n");
> +	if (platform_get_device_id(cinfo->pdev)->driver_data == DRIVER_DATA_TWL6030) {

this changes to
	if (cinfo->type == TWL_TYPE_6030)

> +		int grp;
>  
> -	return ret;
> +		grp = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
> +		if (grp < 0)
> +			return grp;
> +
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
> @@ -71,10 +91,16 @@ static void twl6032_clks_unprepare(struct clk_hw *hw)
>  	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
>  	int ret;
>  
> -	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> -			   TWL6030_CFG_STATE_OFF);
> +	if (platform_get_device_id(cinfo->pdev)->driver_data == DRIVER_DATA_TWL6030)

here too.

> +		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +				   ALL_GRP << TWL6030_CFG_STATE_GRP_SHIFT |
> +				   TWL6030_CFG_STATE_OFF);
> +	else
> +		ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +				   TWL6030_CFG_STATE_OFF);
> +
>  	if (ret < 0)
> -		dev_err(cinfo->dev, "clk unprepare failed\n");
> +		dev_err(&cinfo->pdev->dev, "clk unprepare failed\n");
>  }
>  
>  static const struct clk_ops twl6032_clks_ops = {
> @@ -137,7 +163,7 @@ static int twl_clks_probe(struct platform_device *pdev)
>  
>  	for (i = 0; i < count; i++) {
>  		cinfo[i].base = hw_data[i].base;
> -		cinfo[i].dev = &pdev->dev;
> +		cinfo[i].pdev = pdev;

here we can initialize twl type like so.

		cinfo[i].type = platform_get_device_id(pdev)->driver_data;

>  		cinfo[i].hw.init = &hw_data[i].init;
>  		ret = devm_clk_hw_register(&pdev->dev, &cinfo[i].hw);
>  		if (ret) {
> @@ -159,7 +185,11 @@ static int twl_clks_probe(struct platform_device *pdev)
>  
>  static const struct platform_device_id twl_clks_id[] = {
>  	{
> +		.name = "twl6030-clk",
> +		.driver_data = DRIVER_DATA_TWL6030,
TWL_TYPE_6030

> +	}, {
>  		.name = "twl6032-clk",
> +		.driver_data = DRIVER_DATA_TWL6032,
TWL_TYPE_6032

>  	}, {
>  		/* sentinel */
>  	}

-- 
cheers,
-roger

