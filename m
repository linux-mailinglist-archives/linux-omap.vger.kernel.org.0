Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35721F8362
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 00:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfKKXXf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 18:23:35 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45237 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfKKXXe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Nov 2019 18:23:34 -0500
Received: by mail-pf1-f194.google.com with SMTP id z4so11800764pfn.12
        for <linux-omap@vger.kernel.org>; Mon, 11 Nov 2019 15:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oxtWsgiaO9hHHOVbAZFAfeAu9Vd1us+o4hytJ/76qh8=;
        b=WVIiS1htKtiPT6uonxisyXROD5bdwFNUZa/VU6hfGvdDaLOZHCF0BC9QpZWxCsm8RR
         Cji/2MyjHJeoBE8CgavCUOufGHPQylgTOLFEju+ySNDsUWFHbLW2dFMs9wQbcVG+05L4
         y3rW8HNOnethEc+GdYFOjIAu00B7/vVLwgfq5AYHhWbMCm18wueGFkryCv8OWVhxsW/4
         SPy9MXmkLVAwolCGB2Hnl2RT/UaztknU8OdWpjnCiddO5B85X/DoK2Pa33naS74tVHzU
         YXzCJtzAhn0WGuz3PdgFuOk0a0/IrN174kR2NMbx7QA8Zp8lSALC4vhMSn2XLq1xgv0v
         uwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oxtWsgiaO9hHHOVbAZFAfeAu9Vd1us+o4hytJ/76qh8=;
        b=bd2Wg8IuqYpPwizR+yYlBBj/quMMoktwHHjmIPPFo+kMwy9E6czY+8/kR6JrJ6G3sZ
         jQycgokXB2YD23JpvzylwzXADIXfPJvyixc6cfOLkCfZFcSqhaMXFfuYR1WeHfG3pEej
         +W/qkiLJJyf6R2+dbGruBqLhGhrCO7xkgE0xVPhzprgV6hO3fxyqD7WJmgDJQmWWuKIa
         LnTK88arVfGV4FQqnkXebq0WOA/rxbngBFzs3CROOw7faVMZT56QZLcue1lCk4onvUn5
         6aykh34WP25Uk0HnnYUjBqTuUzR2BAgcqm5tjIpUIxvLE+UI9LWvHvL2zxHoeVLVGehs
         ZCAg==
X-Gm-Message-State: APjAAAW1Z3TNAORP0kPvJX/bIE48bgefR7KiLGzAQZC9t6t84zDEUXKX
        WGBwuZKqGI2Yanror1Br8VTrpQ==
X-Google-Smtp-Source: APXvYqz3B8XfN3Nk5agppRnf//5mkG5LcoEJl4JIWX+jPdh1NoxipVBwsaA0WQ963B99tJZTRos6rg==
X-Received: by 2002:a17:90a:600f:: with SMTP id y15mr2129151pji.82.1573514611994;
        Mon, 11 Nov 2019 15:23:31 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r33sm489545pjb.5.2019.11.11.15.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 15:23:31 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:23:29 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 07/17] remoteproc/omap: Initialize and assign reserved
 memory node
Message-ID: <20191111232329.GI3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-8-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-8-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> The reserved memory nodes are not assigned to platform devices by
> default in the driver core to avoid the lookup for every platform
> device and incur a penalty as the real users are expected to be
> only a few devices.
> 
> OMAP remoteproc devices fall into the above category and the OMAP
> remoteproc driver _requires_ specific CMA pools to be assigned
> for each device at the moment to align on the location of the
> vrings and vring buffers in the RTOS-side firmware images. So,
> use the of_reserved_mem_device_init/release() API appropriately
> to assign the corresponding reserved memory region to the OMAP
> remoteproc device. Note that only one region per device is
> allowed by the framework.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/omap_remoteproc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 0524f7e0ffa4..0b80570effee 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/err.h>
>  #include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/remoteproc.h>
> @@ -454,14 +455,22 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	ret = of_reserved_mem_device_init(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "device does not have specific CMA pool\n");
> +		goto free_rproc;
> +	}
> +
>  	platform_set_drvdata(pdev, rproc);
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> -		goto free_rproc;
> +		goto release_mem;
>  
>  	return 0;
>  
> +release_mem:
> +	of_reserved_mem_device_release(&pdev->dev);
>  free_rproc:
>  	rproc_free(rproc);
>  	return ret;
> @@ -473,6 +482,7 @@ static int omap_rproc_remove(struct platform_device *pdev)
>  
>  	rproc_del(rproc);
>  	rproc_free(rproc);
> +	of_reserved_mem_device_release(&pdev->dev);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
