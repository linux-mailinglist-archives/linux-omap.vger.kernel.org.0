Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B5B89EBD
	for <lists+linux-omap@lfdr.de>; Mon, 12 Aug 2019 14:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfHLMtq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Aug 2019 08:49:46 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40781 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727525AbfHLMtq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Aug 2019 08:49:46 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x9lahQu9gur8Tx9ldhiP6e; Mon, 12 Aug 2019 14:49:44 +0200
Subject: Re: [PATCH] mach-omap2/devices.c: set dma mask
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <7d079362-3881-6890-3e1f-71aeee06f4fc@xs4all.nl>
Message-ID: <3c9077dc-3092-43b6-d58f-de9983da6c44@xs4all.nl>
Date:   Mon, 12 Aug 2019 14:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7d079362-3881-6890-3e1f-71aeee06f4fc@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOZwr9xgY8cbLVzGQixFGOEpEN8oid09AhcdqnqRfaUxtmzali71uD0QmgvKweJx/yOP7wt6tNRmJXKgKc6Vqt/rd6plL3dqSK8A/geLLPcVdsCLQWSM
 Fa+3jgUuVZGxfCYzneXbZaaHkaEmNB+NQXuGoiM0Dr7KZiI1L/+LpfmYDGKd5LKtgcEJ27aRzgUatgQKqUPRQ/tdeNGSMHtPV9oEHPZolK8dcqFZZ3BTWRGv
 NxVABAkfxC4KGgIeg9WxGq10D0wgeH9KArLNBbNT4ME8/1VedICDMbl9YDW5E6fC
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/30/19 8:17 AM, Hans Verkuil wrote:
> The dma_mask and coherent_dma_mask values were never set.
> 
> This prevented the media omap_vout driver from loading successfully.
> 
> Tested on a Pandaboard and Beagle XM board.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tony, can you pick this up? Or give an Ack so that it can be merged via
the media subsystem if you prefer?

Regards,

	Hans

> ---
>  arch/arm/mach-omap2/devices.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
> index cc0d08dad141..5a2e198e7db1 100644
> --- a/arch/arm/mach-omap2/devices.c
> +++ b/arch/arm/mach-omap2/devices.c
> @@ -10,6 +10,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/clk.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> @@ -43,11 +44,17 @@ static struct resource omap_vout_resource[2] = {
>  };
>  #endif
> 
> +static u64 omap_vout_dma_mask = DMA_BIT_MASK(32);
> +
>  static struct platform_device omap_vout_device = {
>  	.name		= "omap_vout",
>  	.num_resources	= ARRAY_SIZE(omap_vout_resource),
>  	.resource 	= &omap_vout_resource[0],
>  	.id		= -1,
> +	.dev		= {
> +		.dma_mask		= &omap_vout_dma_mask,
> +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> +	},
>  };
> 
>  int __init omap_init_vout(void)
> 

