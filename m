Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF495123A6F
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 00:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfLQXBp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 18:01:45 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34476 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLQXBp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 18:01:45 -0500
Received: by mail-pl1-f196.google.com with SMTP id x17so69611pln.1
        for <linux-omap@vger.kernel.org>; Tue, 17 Dec 2019 15:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9/bxN0bRFRR/QTP2svMUw13wA1wgJhDJ8iPExzbFY3Y=;
        b=xRJJ0KW16PuQrCf5NDKl43Q9ox4draKweBzzmBiN2ATz/+PsMjqObM10AuxbcgYESL
         QOHgCQjmjQoNN9P5bSp8cOPWbmssD+JkmEM7+hvuYR1NYplo+1c0FvnKj4iFGoDGh0Z0
         Z5HIVOT+jq4eZj9H6GuFnPCnY/eWqBoaoWJ/XLf+WIkvXV4MzVxKoZWf3BlbzSJlDzdb
         U3Do4QwrfhlgAA0XIZ6meO3zJzYHyhd66uLfn9/kp9OY8tlIXmBFDc4+Ful48f1yleFM
         g+vZGD/KXQgrEssga4SLUaXVSHZrXbHWFrbEZDEWodrxaq7VylEWczUmZg1DRbMdxbEf
         r2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9/bxN0bRFRR/QTP2svMUw13wA1wgJhDJ8iPExzbFY3Y=;
        b=JECiPLQV4RoaScoBW2hT4t3a9/jytVRt4T8ALCkkNPCgYRiDjjPUuXGhGOwDFiLUNg
         3MmuZ2mlrv2bu/wPRj3Ppxe2W0FH6HzeZHoejn9nXWrFg8QltsoRSG/ZiBqaZCjlEXuv
         E/gH3PraEpMe97MnBI5rnjUy28aWte2M3EGa6wqGoveC+KDUfBZcWOMG277/nNMlWYF7
         rTzxse4S3YIik1Q8kZ/yhG4q3J7cMiu9RplUiU9He3gcc2ZBnMWySOuVtX08W1LmH3xK
         ad1g8ulsvqd/wnTgvt4S3rGAoLsHdhNwFI/MiJ8Ctj7yLo9Bh8GtM2aYYG/o+GuQ1UXh
         aa6g==
X-Gm-Message-State: APjAAAVZjvT3BNVZ9rErGcjTew5MvlM5jdf7Y3cWrgUa1tPXw/7y4JWs
        kLu9udsG/fjLWzwItm26HezM5g==
X-Google-Smtp-Source: APXvYqxTyA4ZmFXWBanDuFIaCUVKJHO7d4y5NcO/12xWXcRI/u3c/4xK4400qt3A4qgDMtlAgY0yKg==
X-Received: by 2002:a17:90a:30a4:: with SMTP id h33mr9357963pjb.50.1576623704711;
        Tue, 17 Dec 2019 15:01:44 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id f7sm56977pfk.183.2019.12.17.15.01.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 15:01:44 -0800 (PST)
Date:   Tue, 17 Dec 2019 16:01:41 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv3 02/15] remoteproc/omap: Add device tree support
Message-ID: <20191217230141.GA16271@xps15>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-3-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213125537.11509-3-t-kristo@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On Fri, Dec 13, 2019 at 02:55:24PM +0200, Tero Kristo wrote:
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
>  drivers/remoteproc/omap_remoteproc.c | 191 +++++++++++++++++++++++----
>  1 file changed, 168 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 6398194075aa..558634624590 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -2,7 +2,7 @@
>  /*
>   * OMAP Remote Processor driver
>   *
> - * Copyright (C) 2011 Texas Instruments, Inc.
> + * Copyright (C) 2011-2019 Texas Instruments Incorporated - http://www.ti.com/
>   * Copyright (C) 2011 Google, Inc.
>   *
>   * Ohad Ben-Cohen <ohad@wizery.com>
> @@ -16,27 +16,53 @@
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
> + * @has_bootreg: true if this remote processor has boot register
> + */
> +struct omap_rproc_dev_data {
> +	const char *device_name;
> +	bool has_bootreg;
>  };
>  
>  /**
> @@ -92,6 +118,21 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>  			ret);
>  }
>  
> +/**
> + * omap_rproc_write_dsp_boot_addr - set boot address for a DSP remote processor
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
> +}
> +
>  /*
>   * Power up the remote processor.
>   *
> @@ -103,13 +144,11 @@ static int omap_rproc_start(struct rproc *rproc)
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
> @@ -117,7 +156,7 @@ static int omap_rproc_start(struct rproc *rproc)
>  	client->tx_block = false;
>  	client->knows_txdone = false;
>  
> -	oproc->mbox = omap_mbox_request_channel(client, pdata->mbox_name);
> +	oproc->mbox = mbox_request_channel(client, 0);
>  	if (IS_ERR(oproc->mbox)) {
>  		ret = -EBUSY;
>  		dev_err(dev, "mbox_request_channel failed: %ld\n",
> @@ -138,11 +177,7 @@ static int omap_rproc_start(struct rproc *rproc)
>  		goto put_mbox;
>  	}
>  
> -	ret = pdata->device_enable(pdev);
> -	if (ret) {
> -		dev_err(dev, "omap_device_enable failed: %d\n", ret);
> -		goto put_mbox;
> -	}
> +	reset_control_deassert(oproc->reset);
>  
>  	return 0;
>  
> @@ -154,15 +189,9 @@ static int omap_rproc_start(struct rproc *rproc)
>  /* power off the remote processor */
>  static int omap_rproc_stop(struct rproc *rproc)
>  {
> -	struct device *dev = rproc->dev.parent;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct omap_rproc_pdata *pdata = pdev->dev.platform_data;
>  	struct omap_rproc *oproc = rproc->priv;
> -	int ret;
>  
> -	ret = pdata->device_shutdown(pdev);
> -	if (ret)
> -		return ret;
> +	reset_control_assert(oproc->reset);
>  
>  	mbox_free_channel(oproc->mbox);
>  
> @@ -175,12 +204,122 @@ static const struct rproc_ops omap_rproc_ops = {
>  	.kick		= omap_rproc_kick,
>  };
>  
> +static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
> +	.device_name	= "dsp",
> +	.has_bootreg	= true,
> +};
> +
> +static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
> +	.device_name	= "ipu",
> +};
> +
> +static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
> +	.device_name	= "dsp",
> +	.has_bootreg	= true,
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
> +	if (!data->has_bootreg)
> +		return 0;
> +
> +	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
> +					GFP_KERNEL);
> +	if (!oproc->boot_data)
> +		return -ENOMEM;
> +
> +	if (!of_property_read_bool(np, "ti,bootreg")) {
> +		dev_err(&pdev->dev, "ti,bootreg property is missing\n");
> +		return -EINVAL;
> +	}
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
> +	reset = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);

Definition of a reset is listed as "required" in the bindings but here it is
optional.  If this is really what you want then adding a comment to exlain your
choice is probably a good idea.

> +
> +	firmware = omap_rproc_get_firmware(pdev);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
>  
>  	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret) {
> @@ -188,16 +327,21 @@ static int omap_rproc_probe(struct platform_device *pdev)
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
> @@ -226,6 +370,7 @@ static struct platform_driver omap_rproc_driver = {
>  	.remove = omap_rproc_remove,
>  	.driver = {
>  		.name = "omap-rproc",
> +		.of_match_table = omap_rproc_of_match,

                .of_match_table = of_match_ptr(omap_rproc_of_match),

Thanks,
Mathieu

>  	},
>  };
>  
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
