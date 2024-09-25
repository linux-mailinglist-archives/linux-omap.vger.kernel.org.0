Return-Path: <linux-omap+bounces-2244-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A4985364
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 09:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D3E1C2312B
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 07:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8595155300;
	Wed, 25 Sep 2024 07:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhoaE7dH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4545B132103;
	Wed, 25 Sep 2024 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248055; cv=none; b=BEvtdqYqsuBx1YODrHV0VWxoqLSiku3Vrrnm14evmFAP7cwxh/JJWXrOqNA6opWi91qaMNuhqwC31oBmZzC0o1y4TJGu6NuWr6tL2C58UVd1CAAUt1q1Q2j+pFPRrkCx+ym0b5h+8jSD4aemswudHbzrthNfYzrGCOVM+b5/zqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248055; c=relaxed/simple;
	bh=TSGsyKlj+xheK0shDTdEtR6NWfwiOu5gzzjKjqLIDq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bzp3ewMha1z91oz8j7520s7C/S98Nr5aXwmOCsGyT6+acX0vZ1VU/6W1AnkWNHle3joCJeWbjXXIRgS1nLJD7eHxYgmt8XYOSG1o2hhSdO3Er+ibgzr9ulyqda9z1nexxstFrE9Q+QDnePY7anlSS0KA/0PxQBGV27AiCZ37wt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhoaE7dH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82503C4CEC3;
	Wed, 25 Sep 2024 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727248054;
	bh=TSGsyKlj+xheK0shDTdEtR6NWfwiOu5gzzjKjqLIDq4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MhoaE7dHCC8Z6cTvhQs5+k94wwc6uUXKBjIN4m7/3krr04wN2sYI8vZPlTsSdKQta
	 qnuijkRBQQuhF9dB9cRHPHzVFYQwOPzPbQS89HI37qV6fyo0uRN+76Jb5VXl8tLlKM
	 VPgMXf48yUeJLJ3ux4djRaCdAkWapQkzZ936X2P/2aBTTBDr3kmOoeuXF1vHb9su7I
	 dUzx1oJdVrZ+NKXWe2mLqVK+//zI4gHZNFq4kzRTLxxxpzESR3F0Vn/cV9vywqaaqe
	 uhRGnwbA+JuRljL/yOLaODHfJD/b52kQ0Kfjy24l/iV4JQkTW3NBIxpNiBLqFpxnjY
	 OXHDIy31b8xXw==
Message-ID: <9b7f6995-586e-44ee-a73b-9baf1bf23a69@kernel.org>
Date: Wed, 25 Sep 2024 10:07:29 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: twl: add TWL6030 support
To: Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-clk@vger.kernel.org
References: <20240924103609.12513-1-andreas@kemnade.info>
 <20240924103609.12513-3-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240924103609.12513-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 24/09/2024 13:36, Andreas Kemnade wrote:
> The TWL6030 has similar clocks, so add support for it. Take care of the
> resource grouping handling needed.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/clk/clk-twl.c | 97 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c

You will have to add information about TWL6030 to Kconfig.

"config CLK_TWL
        tristate "Clock driver for the TWL PMIC family"
        depends on TWL4030_CORE
        help
          Enable support for controlling the clock resources on TWL family
          PMICs. These devices have some 32K clock outputs which can be
          controlled by software. For now, only the TWL6032 clocks are
          supported."

> index eab9d3c8ed8a..194f11ac5e14 100644
> --- a/drivers/clk/clk-twl.c
> +++ b/drivers/clk/clk-twl.c
> @@ -11,10 +11,22 @@
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
> +#define TWL6030_CFG_STATE_MASK		0x03

unnecessary change?
let's leave TWL6030_CFG_STATE_MASK before TWL6030_CFG_STATE_GRP_SHIFT.

> +#define TWL6030_CFG_STATE_APP_MASK	(0x03 << TWL6030_CFG_STATE_APP_SHIFT)
> +#define TWL6030_CFG_STATE_APP(v)	(((v) & TWL6030_CFG_STATE_APP_MASK) >>\
> +						TWL6030_CFG_STATE_APP_SHIFT)
> +#define P1_GRP BIT(0) /* processor power group */
What are the other power groups? Looks like there are 2 more from below code.

> +#define ALL_GRP (BIT(0) | BIT(1) | BIT(2))
Please use earlier defined groups (P1_GRP, etc) instead of re-defining with BIT().

> +
> +#define DRIVER_DATA_TWL6030 0
> +#define DRIVER_DATA_TWL6032 1
>  
>  struct twl_clock_info {
>  	struct device *dev;
> @@ -53,6 +65,49 @@ static unsigned long twl_clks_recalc_rate(struct clk_hw *hw,
>  	return 32768;
>  }
>  
> +static int twl6030_clks_prepare(struct clk_hw *hw)
> +{
> +	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> +	int grp;
> +
> +	grp = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
> +	if (grp < 0)
> +		return grp;
> +
> +	return twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +			    grp << TWL6030_CFG_STATE_GRP_SHIFT |
> +			    TWL6030_CFG_STATE_ON);
> +}
> +
> +static void twl6030_clks_unprepare(struct clk_hw *hw)
> +{
> +	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> +
> +	twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> +		     ALL_GRP << TWL6030_CFG_STATE_GRP_SHIFT |

Why are you unpreparing ALL_GRP? In prepare you only used VREG_GRP.

> +		     TWL6030_CFG_STATE_OFF);
> +}
> +
> +static int twl6030_clks_is_prepared(struct clk_hw *hw)
> +{
> +	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> +	int val;
> +
> +	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
> +	if (val < 0)
> +		return val;
> +
> +	if (!(val & P1_GRP))
> +		return 0;
> +
> +	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE);
> +	if (val < 0)
> +		return val;
> +
> +	val = TWL6030_CFG_STATE_APP(val);
> +	return val == TWL6030_CFG_STATE_ON

Is there a possibility that after calling twl6030_clks_prepare()
the clock can still remain OFF?
If not then we could just use a private flag to indicate clock
prepared status and return that instead of reading the registers again.


> +}
> +
>  static int twl6032_clks_prepare(struct clk_hw *hw)
>  {
>  	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> @@ -93,6 +148,13 @@ static int twl6032_clks_is_prepared(struct clk_hw *hw)
>  	return val == TWL6030_CFG_STATE_ON;
>  }
>  
> +static const struct clk_ops twl6030_clks_ops = {
> +	.prepare	= twl6030_clks_prepare,
> +	.unprepare	= twl6030_clks_unprepare,
> +	.is_prepared	= twl6030_clks_is_prepared,
> +	.recalc_rate	= twl_clks_recalc_rate,
> +};

Instead of re-defining all the clock ops can't we just reuse the
existing twl6032 clock ops?

We just need to tackle the twl6030 specific stuff inside the ops based on
some platform driver data flag.

> +
>  static const struct clk_ops twl6032_clks_ops = {
>  	.prepare	= twl6032_clks_prepare,
>  	.unprepare	= twl6032_clks_unprepare,
> @@ -105,6 +167,28 @@ struct twl_clks_data {
>  	u8 base;
>  };
>  
> +static const struct twl_clks_data twl6030_clks[] = {
> +	{
> +		.init = {
> +			.name = "clk32kg",
> +			.ops = &twl6030_clks_ops,
> +			.flags = CLK_IGNORE_UNUSED,
> +		},
> +		.base = 0x8C,
> +	},
> +	{
> +		.init = {
> +			.name = "clk32kaudio",
> +			.ops = &twl6030_clks_ops,
> +			.flags = CLK_IGNORE_UNUSED,
> +		},
> +		.base = 0x8F,
> +	},
> +	{
> +		/* sentinel */
> +	}
> +};
> +

This clock data is identical to twl6032.
We could implement the same feature with a lot less code if we just
reuse the data and clock ops.

>  static const struct twl_clks_data twl6032_clks[] = {
>  	{
>  		.init = {
> @@ -127,6 +211,11 @@ static const struct twl_clks_data twl6032_clks[] = {
>  	}
>  };
>  
> +static const struct twl_clks_data *const twl_clks[] = {
> +	[DRIVER_DATA_TWL6030] = twl6030_clks,
> +	[DRIVER_DATA_TWL6032] = twl6032_clks,
> +};
> +
>  static int twl_clks_probe(struct platform_device *pdev)
>  {
>  	struct clk_hw_onecell_data *clk_data;
> @@ -137,7 +226,7 @@ static int twl_clks_probe(struct platform_device *pdev)
>  	int i;
>  	int count;
>  
> -	hw_data = twl6032_clks;
> +	hw_data = twl_clks[platform_get_device_id(pdev)->driver_data];
>  	for (count = 0; hw_data[count].init.name; count++)
>  		;
>  
> @@ -176,7 +265,11 @@ static int twl_clks_probe(struct platform_device *pdev)
>  
>  static const struct platform_device_id twl_clks_id[] = {
>  	{
> +		.name = "twl6030-clk",
> +		.driver_data = DRIVER_DATA_TWL6030,
> +	}, {
>  		.name = "twl6032-clk",
> +		.driver_data = DRIVER_DATA_TWL6032,
>  	}, {
>  		/* sentinel */
>  	}

-- 
cheers,
-roger

