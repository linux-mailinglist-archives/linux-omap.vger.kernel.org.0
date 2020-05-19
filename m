Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004371D9E25
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 19:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbgESRqA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 13:46:00 -0400
Received: from muru.com ([72.249.23.125]:55104 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbgESRp7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 May 2020 13:45:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4D92980FA;
        Tue, 19 May 2020 17:46:48 +0000 (UTC)
Date:   Tue, 19 May 2020 10:45:55 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ssantosh@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 1/1] soc: ti: omap-prm: use atomic iopoll instead of
 sleeping one
Message-ID: <20200519174555.GX37466@atomide.com>
References: <20200514073718.17690-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514073718.17690-1-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200514 00:38]:
> The reset handling APIs for omap-prm can be invoked PM runtime which
> runs in atomic context. For this to work properly, switch to atomic
> iopoll version instead of the current which can sleep. Otherwise,
> this throws a "BUG: scheduling while atomic" warning. Issue is seen
> rather easily when CONFIG_PREEMPT is enabled.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Santosh do you want me to pick this for fixes?

Regards,

Tony

> ---
>  drivers/soc/ti/omap_prm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> index 96c6f777519c..c9b3f9ebf0bb 100644
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -256,10 +256,10 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>  		goto exit;
>  
>  	/* wait for the status to be set */
> -	ret = readl_relaxed_poll_timeout(reset->prm->base +
> -					 reset->prm->data->rstst,
> -					 v, v & BIT(st_bit), 1,
> -					 OMAP_RESET_MAX_WAIT);
> +	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
> +						 reset->prm->data->rstst,
> +						 v, v & BIT(st_bit), 1,
> +						 OMAP_RESET_MAX_WAIT);
>  	if (ret)
>  		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
>  		       reset->prm->data->name, id);
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
