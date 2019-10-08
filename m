Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A9ACF8AD
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 13:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730371AbfJHLkK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 07:40:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48929 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730316AbfJHLkK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 07:40:10 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iHnqa-0005id-GD; Tue, 08 Oct 2019 13:40:08 +0200
Message-ID: <1570534808.18914.2.camel@pengutronix.de>
Subject: Re: [PATCHv7 3/9] soc: ti: omap-prm: poll for reset complete during
 de-assert
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        ssantosh@kernel.org
Cc:     tony@atomide.com, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date:   Tue, 08 Oct 2019 13:40:08 +0200
In-Reply-To: <20191008071913.28740-4-t-kristo@ti.com>
References: <20191008071913.28740-1-t-kristo@ti.com>
         <20191008071913.28740-4-t-kristo@ti.com>
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

On Tue, 2019-10-08 at 10:19 +0300, Tero Kristo wrote:
> Poll for reset completion status during de-assertion of reset, otherwise
> the IP in question might be accessed before it has left reset properly.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/soc/ti/omap_prm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> index ab0b66ad715d..96fa2aad9b93 100644
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -153,6 +153,18 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>  	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>  	spin_unlock_irqrestore(&reset->lock, flags);
>  
> +	if (!has_rstst)
> +		return 0;
> +
> +	/* wait for the status to be set */
> +	ret = readl_relaxed_poll_timeout(reset->prm->base +
> +					 reset->prm->data->rstst,
> +					 v, v & BIT(st_bit), 1,
> +					 OMAP_RESET_MAX_WAIT);
> +	if (ret)
> +		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> +		       reset->prm->data->name, id);
> +
>  	return 0;
>  }
>  

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
