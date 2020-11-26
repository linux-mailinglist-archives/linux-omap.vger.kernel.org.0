Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB2F2C5DFD
	for <lists+linux-omap@lfdr.de>; Thu, 26 Nov 2020 23:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388303AbgKZW4u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Nov 2020 17:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388299AbgKZW4u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Nov 2020 17:56:50 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562D6C061A04
        for <linux-omap@vger.kernel.org>; Thu, 26 Nov 2020 14:56:50 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id n137so2805470pfd.3
        for <linux-omap@vger.kernel.org>; Thu, 26 Nov 2020 14:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KivtPfxR+vLpQVUyPc6p5f+5FGXcViNdHdMf/M3HDLo=;
        b=P1ayCxyeLlfeq2jtT8unukIoa/x5V+eBQ9HFPJ+lmZ2ulyXRUwUUb30OX22s9pX6zy
         9voFEKAlhRcDDwM12cr5Rh0v0D7AHePVdT24Z6JILZcZY4hTmQPR5uh23Lr+sxoloTPV
         hzR3+4bLPavJ/yi1Bzn/2MLeSU8noDH2xO7qfDzTS2vSgkikvUGdV8w2FdiCXfjDmkqX
         37GfIQQcmNsoL2c0+0pQ92WET3KlCS+rQbJiST8kLyuIok6PaIu2VpZxkhVxHlMpwr1n
         OQ5bd9kD4/VvERdSSLsAFte5Wm45xSynAWIhWWb7L69TBxkbSJIC5Pz5U8ORZmr7FaTT
         risQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KivtPfxR+vLpQVUyPc6p5f+5FGXcViNdHdMf/M3HDLo=;
        b=AfN02RTIqAqb/rBmzsFmCNHw0qlRLzcbozCNzMF9wrEngbnToRXZdFKhmeHrRjDCIs
         jioiZAhj1S+bGS7GtbjVosHYF9ie2xpHypS8ikfqM8+qZD3DTpCC3dgjNqVtUvU5VUD5
         4TvYO1l/LDxf408dFaGsQGd4jNwdVBkUjiZLrHuKTW8rB6mho4L2Qbnw7CODjIol+BOc
         kMBwZtZi/1Iz4Wt1ydZ9j4IsPPhPecSJ79arRplEC38jLE6PPCZbppptPRsyfxO6vYOg
         pz+ePlhWJhToUL2cJLGydvNN2JypCKwF6aToOYvW2wC99yJj0OhgiVb9y5wMTafXSeaC
         Yong==
X-Gm-Message-State: AOAM5301K1pfPHxN6tOptc0FIUeJ4G/0PJchuIB34vfwGDkv7JrNMkH9
        2JKobYIki0k79EBuweXXnDH+gw==
X-Google-Smtp-Source: ABdhPJx1pRdJAT515fZRKK0/t8X2xrDUY8ngaa9AQcU1gnMDad/n0oQXBiO5k0gVg2DGD83RO/sHTQ==
X-Received: by 2002:aa7:9434:0:b029:18c:1c6a:2e0a with SMTP id y20-20020aa794340000b029018c1c6a2e0amr4439182pfo.8.1606431409634;
        Thu, 26 Nov 2020 14:56:49 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e5sm3685409pjl.51.2020.11.26.14.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 14:56:48 -0800 (PST)
Date:   Thu, 26 Nov 2020 15:56:47 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Add a rproc_set_firmware() API
Message-ID: <20201126225647.GB897651@xps15>
References: <20201121032042.6195-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121032042.6195-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 20, 2020 at 09:20:42PM -0600, Suman Anna wrote:
> A new API, rproc_set_firmware() is added to allow the remoteproc platform
> drivers and remoteproc client drivers to be able to configure a custom
> firmware name that is different from the default name used during
> remoteproc registration. This function is being introduced to provide
> a kernel-level equivalent of the current sysfs interface to remoteproc
> client drivers, and can only change firmwares when the remoteproc is
> offline. This allows some remoteproc drivers to choose different firmwares
> at runtime based on the functionality the remote processor is providing.
> The TI PRU Ethernet driver will be an example of such usage as it
> requires to use different firmwares for different supported protocols.
> 
> Also, update the firmware_store() function used by the sysfs interface
> to reuse this function to avoid code duplication.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_core.c  | 63 +++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_sysfs.c | 33 +-------------
>  include/linux/remoteproc.h            |  1 +
>  3 files changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dab2c0f5caf0..46c2937ebea9 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1934,6 +1934,69 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  #endif
>  EXPORT_SYMBOL(rproc_get_by_phandle);
>  
> +/**
> + * rproc_set_firmware() - assign a new firmware
> + * @rproc: rproc handle to which the new firmware is being assigned
> + * @fw_name: new firmware name to be assigned
> + *
> + * This function allows remoteproc drivers or clients to configure a custom
> + * firmware name that is different from the default name used during remoteproc
> + * registration. The function does not trigger a remote processor boot,
> + * only sets the firmware name used for a subsequent boot. This function
> + * should also be called only when the remote processor is offline.
> + *
> + * This allows either the userspace to configure a different name through
> + * sysfs or a kernel-level remoteproc or a remoteproc client driver to set
> + * a specific firmware when it is controlling the boot and shutdown of the
> + * remote processor.
> + *
> + * Return: 0 on success or a negative value upon failure
> + */
> +int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
> +{
> +	struct device *dev;
> +	int ret, len;
> +	char *p;
> +
> +	if (!rproc || !fw_name)
> +		return -EINVAL;
> +
> +	dev = rproc->dev.parent;

Since rproc->dev is available might as well use it.  This is what the current
implementation does.  The side effect are only cosmetic though so with or
without the change:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +
> +	ret = mutex_lock_interruptible(&rproc->lock);
> +	if (ret) {
> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> +		return -EINVAL;
> +	}
> +
> +	if (rproc->state != RPROC_OFFLINE) {
> +		dev_err(dev, "can't change firmware while running\n");
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	len = strcspn(fw_name, "\n");
> +	if (!len) {
> +		dev_err(dev, "can't provide empty string for firmware name\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	p = kstrndup(fw_name, len, GFP_KERNEL);
> +	if (!p) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	kfree(rproc->firmware);
> +	rproc->firmware = p;
> +
> +out:
> +	mutex_unlock(&rproc->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(rproc_set_firmware);
> +
>  static int rproc_validate(struct rproc *rproc)
>  {
>  	switch (rproc->state) {
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 3fd18a71c188..cf846caf2e1a 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -159,42 +159,13 @@ static ssize_t firmware_store(struct device *dev,
>  			      const char *buf, size_t count)
>  {
>  	struct rproc *rproc = to_rproc(dev);
> -	char *p;
> -	int err, len = count;
> +	int err;
>  
>  	/* restrict sysfs operations if not allowed by remoteproc drivers */
>  	if (rproc->deny_sysfs_ops)
>  		return -EPERM;
>  
> -	err = mutex_lock_interruptible(&rproc->lock);
> -	if (err) {
> -		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
> -		return -EINVAL;
> -	}
> -
> -	if (rproc->state != RPROC_OFFLINE) {
> -		dev_err(dev, "can't change firmware while running\n");
> -		err = -EBUSY;
> -		goto out;
> -	}
> -
> -	len = strcspn(buf, "\n");
> -	if (!len) {
> -		dev_err(dev, "can't provide a NULL firmware\n");
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
> -	p = kstrndup(buf, len, GFP_KERNEL);
> -	if (!p) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> -
> -	kfree(rproc->firmware);
> -	rproc->firmware = p;
> -out:
> -	mutex_unlock(&rproc->lock);
> +	err = rproc_set_firmware(rproc, buf);
>  
>  	return err ? err : count;
>  }
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index dbc3767f7d0e..6e04b99413f8 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -655,6 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
> +int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> -- 
> 2.28.0
> 
