Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35788A1B22
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2019 15:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfH2NOc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Aug 2019 09:14:32 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55455 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfH2NOc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Aug 2019 09:14:32 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i3KFv-0003L0-Rd; Thu, 29 Aug 2019 15:14:27 +0200
Message-ID: <1567084467.5345.9.camel@pengutronix.de>
Subject: Re: [PATCHv2 03/11] soc: ti: omap-prm: poll for reset complete
 during de-assert
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tero Kristo <t-kristo@ti.com>, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        robh+dt@kernel.org
Cc:     tony@atomide.com, s-anna@ti.com, devicetree@vger.kernel.org
Date:   Thu, 29 Aug 2019 15:14:27 +0200
In-Reply-To: <20190828071941.32378-4-t-kristo@ti.com>
References: <20190828071941.32378-1-t-kristo@ti.com>
         <20190828071941.32378-4-t-kristo@ti.com>
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

Hi Tero,

On Wed, 2019-08-28 at 10:19 +0300, Tero Kristo wrote:
> Poll for reset completion status during de-assertion of reset, otherwise
> the IP in question might be accessed before it has left reset properly.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> index fd5c431f8736..afeb70761b27 100644
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -127,6 +127,7 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>  	u32 v;
>  	int st_bit;
>  	bool has_rstst;
> +	int timeout = 0;
>  
>  	if (!_is_valid_reset(reset, id))
>  		return -EINVAL;
> @@ -153,6 +154,25 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>  	v &= ~(1 << id);
>  	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>  
> +	if (!has_rstst)
> +		return 0;
> +
> +	/* wait for the status to be set */
> +	while (1) {
> +		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
> +		v &= 1 << st_bit;
> +		if (v)
> +			break;
> +		timeout++;
> +		if (timeout > OMAP_RESET_MAX_WAIT) {
> +			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> +			       dev_name(rcdev->dev), id);
> +			return -EBUSY;
> +		}
> +
> +		udelay(1);
> +	}

This looks like you could use

	readl_relaxed_poll_timeout(_atomic)

regards
Philipp
