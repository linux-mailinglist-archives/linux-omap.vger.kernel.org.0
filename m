Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFC1A1B56
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2019 15:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfH2NZS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Aug 2019 09:25:18 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49647 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2NZS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Aug 2019 09:25:18 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i3KQN-0004VF-23; Thu, 29 Aug 2019 15:25:15 +0200
Message-ID: <1567085114.5345.12.camel@pengutronix.de>
Subject: Re: [PATCHv2 05/11] soc: ti: omap-prm: sync func clock status with
 resets
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tero Kristo <t-kristo@ti.com>, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        robh+dt@kernel.org
Cc:     tony@atomide.com, s-anna@ti.com, devicetree@vger.kernel.org
Date:   Thu, 29 Aug 2019 15:25:14 +0200
In-Reply-To: <20190828071941.32378-6-t-kristo@ti.com>
References: <20190828071941.32378-1-t-kristo@ti.com>
         <20190828071941.32378-6-t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 2019-08-28 at 10:19 +0300, Tero Kristo wrote:
> Hardware reset signals are tightly coupled with associated clocks, and
> basically de-asserting a reset won't succeed properly if the clock is
> not enabled, and vice-versa. Also, disabling a clock won't fully succeed
> if the associated hardware resets are not asserted. Add status sync
> functionality between these two for TI drivers so that the situations
> can be handled properly without generating any timeouts.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/soc/ti/omap_prm.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> index 38998ce19c71..e876bad8f8d5 100644
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -15,6 +15,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/clk/ti.h>
>  
>  #include <linux/platform_data/ti-prm.h>
>  
> @@ -42,7 +44,9 @@ struct omap_reset_data {
>  	struct reset_controller_dev rcdev;
>  	struct omap_prm *prm;
>  	struct clockdomain *clkdm;
> +	struct clk *clk;
>  	struct device *dev;
> +	u32 mask;
>  };
>  
>  #define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
> @@ -102,6 +106,8 @@ static int omap_reset_assert(struct reset_controller_dev *rcdev,
>  	v |= 1 << id;
>  	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>  
> +	ti_clk_notify_resets(reset->clk, v == reset->mask);
> +
>  	return 0;
>  }
>  
> @@ -163,9 +169,19 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>  	v &= ~(1 << id);
>  	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>  
> +	ti_clk_notify_resets(reset->clk, v == reset->mask);
> +
>  	if (!has_rstst)
>  		goto exit;
>  
> +	/* If associated clock is disabled, we can't poll completion status */
> +	if (reset->clk) {
> +		struct clk_hw *hw = __clk_get_hw(reset->clk);
> +
> +		if (!clk_hw_is_enabled(hw))
> +			return ret;
> +	}
> +
>  	/* wait for the status to be set */
>  	while (1) {
>  		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
> @@ -199,8 +215,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>  			       struct omap_prm *prm)
>  {
>  	struct omap_reset_data *reset;
> +	const struct omap_rst_map *map;
>  	struct ti_prm_platform_data *pdata = dev_get_platdata(&pdev->dev);
>  	char buf[32];
> +	u32 v;
>  
>  	/*
>  	 * Check if we have controllable resets. If either rstctrl is non-zero
> @@ -215,6 +233,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>  	    !pdata->clkdm_allow_idle)
>  		return -EINVAL;
>  
> +	map = prm->data->rstmap;
> +	if (!map)
> +		return -EINVAL;

Can this actually happen?

> +
>  	reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
>  	if (!reset)
>  		return -ENOMEM;
> @@ -224,6 +246,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>  	reset->rcdev.of_node = pdev->dev.of_node;
>  	reset->rcdev.nr_resets = OMAP_MAX_RESETS;
>  	reset->dev = &pdev->dev;
> +	reset->clk = of_clk_get(pdev->dev.of_node, 0);
> +
> +	if (IS_ERR(reset->clk))
> +		reset->clk = NULL;

Maybe only ignore -ENOENT?

>  	reset->prm = prm;
>  
> @@ -234,6 +260,16 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>  	if (!reset->clkdm)
>  		return -EINVAL;
>  
> +	while (map->rst >= 0) {
> +		reset->mask |= BIT(map->rst);
> +		map++;
> +	}

With this, you could use reset->mask to simplify _is_valid_reset.

regards
Philipp
