Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D941796E9
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 18:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgCDRmO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 12:42:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40281 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbgCDRmO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 12:42:14 -0500
Received: by mail-pf1-f195.google.com with SMTP id l184so1307717pfl.7
        for <linux-omap@vger.kernel.org>; Wed, 04 Mar 2020 09:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ORwRRRdgoQK5aNU1JwMjXGzWTLkU/TYlQ7H6iaT7pZc=;
        b=PW3BlBZqBwsm7kiZXLa4mMyKvpwjhD5DE4sPZ9h/G96K0ltAZhl2mFH1cHpydDUUl5
         lyq0Klf8iD00Fgc0IDt0kDMRYfPxepDD8gxZxjH8biascUlrw/XOo1UnBLCSponN0jP4
         9DRVFTEgN9t4ONGrbv8qAEW+yzrZGpfaj3kue/5fl6zKhZDJfwKjnem1QMAtAYzJbUrG
         zzqJ0Bz7YDXD4xczhGsChqrlWlZ75DwjaUTP0qSOb+/TIm8VX4LkJbLwNWABbmwDyp+k
         jVjUTqqNhgOHeYJhToLT7QMbNSST6q7T5D3mijWvMayPCHl0GTCVCCjc04FOap2zsZui
         Vo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ORwRRRdgoQK5aNU1JwMjXGzWTLkU/TYlQ7H6iaT7pZc=;
        b=Y+9ldALKpSsuoxU6jD7Bc81uNv7Xh28QYE6gcMQ9UnUsT3LaCM0VNhoX9vLvkdhcsF
         hneHlSV7xqwMKyF90qBMANuU/Yt5enDT2jlhGfBkrlgxLKM4mB37fZ67KHqAlp11MDbr
         RVliK8wZCm+WJ9hNjv7dvHcCeAZ05oW9NqylxcqhzfWrAvpoC/DdZ/reO9gXmgMiyO4T
         piLIz2rEFNjrOjxY7839DDAGSpHT8gLhFUFq1Qdrve/zL+GDCmtBLDs0RIVMMwr+Qw+W
         vjhp/mYsSszJMs1zXUWb/vs5d/trn3NYjUTNahRp5niCNhmuorOGM9rF7dED9hPap0Td
         LlKA==
X-Gm-Message-State: ANhLgQ2QVvCRjGFoM4eLpbLaVx4XKIo8D/o0GuaBYyqoKdnEd5KpPQ/G
        Ijvz+hSEpmIF23S3Vupb5n2MDEW3fjk=
X-Google-Smtp-Source: ADFU+vukPD9ymutUBQQTozGF7SeiJFsz/w5gVeP8LDhN7HoWX/8Xq7QfUuba2HcdgdoylDgOdRqFiw==
X-Received: by 2002:a63:1a50:: with SMTP id a16mr3433267pgm.389.1583343733384;
        Wed, 04 Mar 2020 09:42:13 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b25sm29520654pfo.38.2020.03.04.09.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 09:42:12 -0800 (PST)
Date:   Wed, 4 Mar 2020 10:42:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 06/15] remoteproc/omap: Initialize and assign reserved
 memory node
Message-ID: <20200304174210.GE8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-7-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-7-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:27PM +0200, Tero Kristo wrote:
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
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 89084dd919ba..872cd0df342b 100644
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
> @@ -483,14 +484,23 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	ret = of_reserved_mem_device_init(&pdev->dev);
> +	if (ret) {
> +		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
> +		dev_warn(&pdev->dev, "Typically this should be provided,\n");
> +		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
> +	}


I suppose that if no reserved memory has been specified things will go south
pretty quickly.  I'm fine with the first line being a dev_warn() but would
devinitely move the next two to dev_info().  

Since Bjorn has already agreed to this, with or without the above:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

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
> @@ -502,6 +512,7 @@ static int omap_rproc_remove(struct platform_device *pdev)
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
