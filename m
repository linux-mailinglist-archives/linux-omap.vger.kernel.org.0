Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70D77F835C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 00:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfKKXV2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 18:21:28 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43906 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKXV1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Nov 2019 18:21:27 -0500
Received: by mail-pf1-f194.google.com with SMTP id 3so11812383pfb.10
        for <linux-omap@vger.kernel.org>; Mon, 11 Nov 2019 15:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xFbcrfryJboon4EFsR1gKhk/54JkFinZpTdb3doF/Cg=;
        b=hVcvMlC1KXZYOjT42j036j8kHAgl8HjrYsx0jKMzPOdsRPuQXRqSoL50FWJ51jMLIi
         kr6+Fj+nhqent001BacK0jaoZhFin/CpCJO0TRcqRWSx0cLTp3/UioP6LiNpiTXkigPR
         TqdFPJGRiUQ3ZwTvY0qGyu0kDIYBbFMOYQYiYsb1DU+MN7URLYtgUMx5pnh8O8Ztf4BF
         cN+YwFPAbrGc/UwOQBNSS6FHkyJCTzfRr36nKERhC2usdGEx4VaPczcnrXOE8PsO1Xvq
         yqfNZZCODoYDwNCd1bSdV/tvsI+9+1SHkSq6Gxvkk1dnvQ4zJQnhvjlNrDBmKDTQndy5
         HiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xFbcrfryJboon4EFsR1gKhk/54JkFinZpTdb3doF/Cg=;
        b=ULfSLSU7YLVLfy/5qlrv0ytpvozgabxK+eEsTLWlRGbSh6FBjmqlhGm9dUnZ1X0hnz
         IhgBlAR17qBXDAyh2dIY467xx49zuMD9fUPR9DykUR96JN13wFLX8vIB4N7A3rUURb15
         IAiPRCJGEOZPT+zwtmjHB6ZP9lAMJVI/dBCZqY0b35wYM1GBoiiWZi0b0xvS3JefEy3j
         b4+56lpUgHLfNGATpti3Q5l3ZHKtIu6iUeKJdAnyfCCqO8NZPDubZDJNv6OXYMCTjzHf
         6YgWIXluiF1wdynjtepMTw6eHUm8Kzizf3vQfNHpcEScFn0AABVCtPneBh3RUb2VZJCx
         Q7Tw==
X-Gm-Message-State: APjAAAX2dvhu11mlP5ooxAnwf83BGZpt8EkMYeTsxcelS+Zham9BqR0W
        WaT2bSPBYV1HfiquzmpcC86ObA==
X-Google-Smtp-Source: APXvYqwBvTGHRUIPuHyNr1uRChFqzthcXpiT9GIIQMLYAoVRmsJM4oerOsHL9xiffTrk3o0luLlUQw==
X-Received: by 2002:a63:c804:: with SMTP id z4mr14611551pgg.440.1573514484890;
        Mon, 11 Nov 2019 15:21:24 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d23sm16121748pfo.140.2019.11.11.15.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 15:21:24 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:21:22 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 05/17] remoteproc/omap: Add support to parse internal
 memories from DT
Message-ID: <20191111232122.GG3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-6-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-6-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> The OMAP remoteproc driver has been enhanced to parse and store
> the kernel mappings for different internal RAM memories that may
> be present within each remote processor IP subsystem. Different
> devices have varying memories present on current SoCs. The current
> support handles the L2RAM for all IPU devices on OMAP4+ SoCs. The
> DSPs on OMAP4/OMAP5 only have Unicaches and do not have any L1 or
> L2 RAM memories.
> 
> IPUs are expected to have the L2RAM at a fixed device address of
> 0x20000000, based on the current limitations on Attribute MMU
> configurations.
> 
> NOTE:
> The current logic doesn't handle the parsing of memories for DRA7
> remoteproc devices, and will be added alongside the DRA7 support.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index a10377547533..bbd6ff360e10 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -29,6 +29,8 @@
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
>  
> +#define OMAP_RPROC_IPU_L2RAM_DEV_ADDR		(0x20000000)
> +
>  /**
>   * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
>   * @syscon: regmap handle for the system control configuration module
> @@ -39,11 +41,27 @@ struct omap_rproc_boot_data {
>  	unsigned int boot_reg;
>  };
>  
> +/*
> + * struct omap_rproc_mem - internal memory structure
> + * @cpu_addr: MPU virtual address of the memory region
> + * @bus_addr: bus address used to access the memory region
> + * @dev_addr: device address of the memory region from DSP view
> + * @size: size of the memory region
> + */
> +struct omap_rproc_mem {
> +	void __iomem *cpu_addr;
> +	phys_addr_t bus_addr;
> +	u32 dev_addr;
> +	size_t size;
> +};
> +
>  /**
>   * struct omap_rproc - omap remote processor state
>   * @mbox: mailbox channel handle
>   * @client: mailbox client to request the mailbox channel
>   * @boot_data: boot data structure for setting processor boot address
> + * @mem: internal memory regions data
> + * @num_mems: number of internal memory regions
>   * @rproc: rproc handle
>   * @reset: reset handle
>   */
> @@ -51,6 +69,8 @@ struct omap_rproc {
>  	struct mbox_chan *mbox;
>  	struct mbox_client client;
>  	struct omap_rproc_boot_data *boot_data;
> +	struct omap_rproc_mem *mem;
> +	int num_mems;
>  	struct rproc *rproc;
>  	struct reset_control *reset;
>  };
> @@ -307,6 +327,51 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
> +					       struct rproc *rproc)
> +{
> +	static const char * const mem_names[] = {"l2ram"};
> +	struct device_node *np = pdev->dev.of_node;
> +	struct omap_rproc *oproc = rproc->priv;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int num_mems;
> +	int i;
> +
> +	/* OMAP4 and OMAP5 DSPs do not have support for flat SRAM */
> +	if (of_device_is_compatible(np, "ti,omap4-dsp") ||
> +	    of_device_is_compatible(np, "ti,omap5-dsp"))
> +		return 0;
> +
> +	num_mems = ARRAY_SIZE(mem_names);
> +	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
> +				  GFP_KERNEL);
> +	if (!oproc->mem)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_mems; i++) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   mem_names[i]);
> +		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(oproc->mem[i].cpu_addr)) {
> +			dev_err(dev, "failed to parse and map %s memory\n",
> +				mem_names[i]);
> +			return PTR_ERR(oproc->mem[i].cpu_addr);
> +		}
> +		oproc->mem[i].bus_addr = res->start;
> +		oproc->mem[i].dev_addr = OMAP_RPROC_IPU_L2RAM_DEV_ADDR;

Presumably this means that mem_names[] will only ever be {"l2ram"} ?

This would imply that you can either remove the loop or you should
generalize this for dev_addr as well.


Apart from that, this looks good.

Regards,
Bjorn

> +		oproc->mem[i].size = resource_size(res);
> +
> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
> +			mem_names[i], &oproc->mem[i].bus_addr,
> +			oproc->mem[i].size, oproc->mem[i].cpu_addr,
> +			oproc->mem[i].dev_addr);
> +	}
> +	oproc->num_mems = num_mems;
> +
> +	return 0;
> +}
> +
>  static int omap_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -346,6 +411,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	/* All existing OMAP IPU and DSP processors have an MMU */
>  	rproc->has_iommu = true;
>  
> +	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
> +	if (ret)
> +		goto free_rproc;
> +
>  	ret = omap_rproc_get_boot_data(pdev, rproc);
>  	if (ret)
>  		goto free_rproc;
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
