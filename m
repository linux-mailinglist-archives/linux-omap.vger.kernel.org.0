Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B171785F8
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgCCWxm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:53:42 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44405 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbgCCWxm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Mar 2020 17:53:42 -0500
Received: by mail-pf1-f194.google.com with SMTP id y26so862252pfn.11
        for <linux-omap@vger.kernel.org>; Tue, 03 Mar 2020 14:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SvxL76OkKxx/CITQQ//NKETlacz4QbQGNu1eK0rJXHM=;
        b=AiLnYiOYYfS7E/nZJ4/KXjGk/VpZwWWz2pYEjXt0wK1oX4nBIPTMybTolnogsCkiD9
         nbSFUuHzpqOJHSeUSWefq6uWqmpe86d30bh9wJnPBzaWwUiigs2XqKLnub0VIrGzduw7
         idfy+pd0Ea/HYg79rCE5cLtx3z8DYEhqKCdLLcuho4IU9kvFIWDJ4nPZ+iB4G0py0dnB
         AKgDTlL1Vu/BNtVmCxpPLSZvx7hL9uGx+wfQsvAOqTLbqj24LOwvnCjWjjYE81juD1ud
         v9HJT3yPmCplfEopLVEptksU594BB6Q6Ohpc3KJgMUh3JIAeE7oAe2yuTgVQh2DLkAc2
         +TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SvxL76OkKxx/CITQQ//NKETlacz4QbQGNu1eK0rJXHM=;
        b=gR7zWEJMUqJ8OA89PqGB4I3h2gxGhnP/muAxa/YKzh7pT05vi7O0VXtJ7lEyyFtA4z
         aVw/n82WF4H1ot9UjD6dD0zWJKoD5CaB7w5reM9pBoQuV/+Wgc4ypXDspTc7qjZeennk
         hI4TYHh6SOBdjs15H0scBtxZsYuMp24whQGkb3c0Z99iLEy+3ZRi+3REuw1hzLEdMg9a
         sNK4H8NkORMLokMueVkrstNozOKG9QQDA+1sYruSh+JWsUaPGtFibUmm25gu/uFdQUgy
         Bn6cZ4iYIuR1cN1qLmYCHCxoLq6LaKrRXEPeotmXbs1ZM5Pv0/W5K1otBhVDVe1eCZtD
         Rfkw==
X-Gm-Message-State: ANhLgQ1sKA2hsv9x3aOuzNtcEAawfSPPZu/dUg0E1o0saGsMuiK/oSao
        q3U0mDak7Vk2zQImxtvHGbblaw==
X-Google-Smtp-Source: ADFU+vtGIz0aFnODJ6lgCG5v83AqUBLU0HpOEsNtO3HCBvd8tjwGUlW5EKTAKHVDpwGprnZAt24mEg==
X-Received: by 2002:a63:c00a:: with SMTP id h10mr5914350pgg.31.1583276021045;
        Tue, 03 Mar 2020 14:53:41 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m128sm26421170pfm.183.2020.03.03.14.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:53:40 -0800 (PST)
Date:   Tue, 3 Mar 2020 15:53:38 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv7 02/15] remoteproc/omap: Add device tree support
Message-ID: <20200303225338.GA8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-3-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-3-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:23PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> OMAP4+ SoCs support device tree boot only. The OMAP remoteproc
> driver is enhanced to support remoteproc devices created through
> Device Tree, support for legacy platform devices has been
> deprecated. The current DT support handles the IPU and DSP
> processor subsystems on OMAP4 and OMAP5 SoCs.
> 
> The OMAP remoteproc driver relies on the ti-sysc, reset, and
> syscon layers for performing clock, reset and boot vector
> management (DSP remoteprocs only) of the devices, but some of
> these are limited only to the machine-specific layers
> in arch/arm. The dependency against control module API for boot
> vector management of the DSP remoteprocs has now been removed
> with added logic to parse the boot register from the DT node
> and program it appropriately directly within the driver.
> 
> The OMAP remoteproc driver expects the firmware names to be
> provided via device tree entries (firmware-name.) These are used
> to load the proper firmware during boot of the remote processor.
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: converted to use ti-sysc framework]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v7:
>   - some minor kerneldoc updates
> 
>  drivers/remoteproc/omap_remoteproc.c | 177 ++++++++++++++++++++++++---
>  1 file changed, 160 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 6398194075aa..d47d5ded651a 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -2,7 +2,7 @@
>  /*
>   * OMAP Remote Processor driver
>   *
> - * Copyright (C) 2011 Texas Instruments, Inc.
> + * Copyright (C) 2011-2020 Texas Instruments Incorporated - http://www.ti.com/
>   * Copyright (C) 2011 Google, Inc.
>   *
>   * Ohad Ben-Cohen <ohad@wizery.com>
> @@ -16,27 +16,51 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/err.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/remoteproc.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/omap-mailbox.h>
> -
> -#include <linux/platform_data/remoteproc-omap.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/reset.h>
>  
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
>  
> +/**
> + * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
> + * @syscon: regmap handle for the system control configuration module
> + * @boot_reg: boot register offset within the @syscon regmap
> + */
> +struct omap_rproc_boot_data {
> +	struct regmap *syscon;
> +	unsigned int boot_reg;
> +};
> +
>  /**
>   * struct omap_rproc - omap remote processor state
>   * @mbox: mailbox channel handle
>   * @client: mailbox client to request the mailbox channel
> + * @boot_data: boot data structure for setting processor boot address
>   * @rproc: rproc handle
> + * @reset: reset handle
>   */
>  struct omap_rproc {
>  	struct mbox_chan *mbox;
>  	struct mbox_client client;
> +	struct omap_rproc_boot_data *boot_data;
>  	struct rproc *rproc;
> +	struct reset_control *reset;
> +};
> +
> +/**
> + * struct omap_rproc_dev_data - device data for the omap remote processor
> + * @device_name: device name of the remote processor
> + */
> +struct omap_rproc_dev_data {
> +	const char *device_name;
>  };
>  
>  /**
> @@ -92,6 +116,21 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>  			ret);
>  }
>  
> +/**
> + * omap_rproc_write_dsp_boot_addr() - set boot address for DSP remote processor
> + * @rproc: handle of a remote processor
> + *
> + * Set boot address for a supported DSP remote processor.
> + */
> +static void omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
> +{
> +	struct omap_rproc *oproc = rproc->priv;
> +	struct omap_rproc_boot_data *bdata = oproc->boot_data;
> +	u32 offset = bdata->boot_reg;
> +
> +	regmap_write(bdata->syscon, offset, rproc->bootaddr);

I always get wary when a return code is ignored but it's being added in the next
patch.  As such:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +}
> +
>  /*
>   * Power up the remote processor.
>   *
> @@ -103,13 +142,11 @@ static int omap_rproc_start(struct rproc *rproc)
>  {
>  	struct omap_rproc *oproc = rproc->priv;
>  	struct device *dev = rproc->dev.parent;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct omap_rproc_pdata *pdata = pdev->dev.platform_data;
>  	int ret;
>  	struct mbox_client *client = &oproc->client;
>  
> -	if (pdata->set_bootaddr)
> -		pdata->set_bootaddr(rproc->bootaddr);
> +	if (oproc->boot_data)
> +		omap_rproc_write_dsp_boot_addr(rproc);
>  
>  	client->dev = dev;
>  	client->tx_done = NULL;
> @@ -117,7 +154,7 @@ static int omap_rproc_start(struct rproc *rproc)
>  	client->tx_block = false;
>  	client->knows_txdone = false;
>  
> -	oproc->mbox = omap_mbox_request_channel(client, pdata->mbox_name);
> +	oproc->mbox = mbox_request_channel(client, 0);
>  	if (IS_ERR(oproc->mbox)) {
>  		ret = -EBUSY;
>  		dev_err(dev, "mbox_request_channel failed: %ld\n",
> @@ -138,9 +175,9 @@ static int omap_rproc_start(struct rproc *rproc)
>  		goto put_mbox;
>  	}
>  
> -	ret = pdata->device_enable(pdev);
> +	ret = reset_control_deassert(oproc->reset);
>  	if (ret) {
> -		dev_err(dev, "omap_device_enable failed: %d\n", ret);
> +		dev_err(dev, "reset control deassert failed: %d\n", ret);
>  		goto put_mbox;
>  	}
>  
> @@ -154,13 +191,10 @@ static int omap_rproc_start(struct rproc *rproc)
>  /* power off the remote processor */
>  static int omap_rproc_stop(struct rproc *rproc)
>  {
> -	struct device *dev = rproc->dev.parent;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct omap_rproc_pdata *pdata = pdev->dev.platform_data;
>  	struct omap_rproc *oproc = rproc->priv;
>  	int ret;
>  
> -	ret = pdata->device_shutdown(pdev);
> +	ret = reset_control_assert(oproc->reset);
>  	if (ret)
>  		return ret;
>  
> @@ -175,12 +209,115 @@ static const struct rproc_ops omap_rproc_ops = {
>  	.kick		= omap_rproc_kick,
>  };
>  
> +static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
> +	.device_name	= "dsp",
> +};
> +
> +static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
> +	.device_name	= "ipu",
> +};
> +
> +static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
> +	.device_name	= "dsp",
> +};
> +
> +static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
> +	.device_name	= "ipu",
> +};
> +
> +static const struct of_device_id omap_rproc_of_match[] = {
> +	{
> +		.compatible     = "ti,omap4-dsp",
> +		.data           = &omap4_dsp_dev_data,
> +	},
> +	{
> +		.compatible     = "ti,omap4-ipu",
> +		.data           = &omap4_ipu_dev_data,
> +	},
> +	{
> +		.compatible     = "ti,omap5-dsp",
> +		.data           = &omap5_dsp_dev_data,
> +	},
> +	{
> +		.compatible     = "ti,omap5-ipu",
> +		.data           = &omap5_ipu_dev_data,
> +	},
> +	{
> +		/* end */
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, omap_rproc_of_match);
> +
> +static const char *omap_rproc_get_firmware(struct platform_device *pdev)
> +{
> +	const char *fw_name;
> +	int ret;
> +
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return fw_name;
> +}
> +
> +static int omap_rproc_get_boot_data(struct platform_device *pdev,
> +				    struct rproc *rproc)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct omap_rproc *oproc = rproc->priv;
> +	const struct omap_rproc_dev_data *data;
> +	int ret;
> +
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	if (!of_property_read_bool(np, "ti,bootreg"))
> +		return 0;
> +
> +	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
> +					GFP_KERNEL);
> +	if (!oproc->boot_data)
> +		return -ENOMEM;
> +
> +	oproc->boot_data->syscon =
> +			syscon_regmap_lookup_by_phandle(np, "ti,bootreg");
> +	if (IS_ERR(oproc->boot_data->syscon)) {
> +		ret = PTR_ERR(oproc->boot_data->syscon);
> +		return ret;
> +	}
> +
> +	if (of_property_read_u32_index(np, "ti,bootreg", 1,
> +				       &oproc->boot_data->boot_reg)) {
> +		dev_err(&pdev->dev, "couldn't get the boot register\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int omap_rproc_probe(struct platform_device *pdev)
>  {
> -	struct omap_rproc_pdata *pdata = pdev->dev.platform_data;
> +	struct device_node *np = pdev->dev.of_node;
>  	struct omap_rproc *oproc;
>  	struct rproc *rproc;
> +	const char *firmware;
>  	int ret;
> +	struct reset_control *reset;
> +
> +	if (!np) {
> +		dev_err(&pdev->dev, "only DT-based devices are supported\n");
> +		return -ENODEV;
> +	}
> +
> +	reset = devm_reset_control_array_get_exclusive(&pdev->dev);
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	firmware = omap_rproc_get_firmware(pdev);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
>  
>  	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret) {
> @@ -188,16 +325,21 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	rproc = rproc_alloc(&pdev->dev, pdata->name, &omap_rproc_ops,
> -			    pdata->firmware, sizeof(*oproc));
> +	rproc = rproc_alloc(&pdev->dev, dev_name(&pdev->dev), &omap_rproc_ops,
> +			    firmware, sizeof(*oproc));
>  	if (!rproc)
>  		return -ENOMEM;
>  
>  	oproc = rproc->priv;
>  	oproc->rproc = rproc;
> +	oproc->reset = reset;
>  	/* All existing OMAP IPU and DSP processors have an MMU */
>  	rproc->has_iommu = true;
>  
> +	ret = omap_rproc_get_boot_data(pdev, rproc);
> +	if (ret)
> +		goto free_rproc;
> +
>  	platform_set_drvdata(pdev, rproc);
>  
>  	ret = rproc_add(rproc);
> @@ -226,6 +368,7 @@ static struct platform_driver omap_rproc_driver = {
>  	.remove = omap_rproc_remove,
>  	.driver = {
>  		.name = "omap-rproc",
> +		.of_match_table = omap_rproc_of_match,
>  	},
>  };
>  
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
