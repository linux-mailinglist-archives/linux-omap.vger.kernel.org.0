Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFF71327D1
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 14:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgAGNhz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 08:37:55 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47290 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGNhz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 08:37:55 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007DbsqS117064;
        Tue, 7 Jan 2020 07:37:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578404274;
        bh=y7OG/HB4e1SJdhnzrFIBHuFkRinvpiow8MiLLExRC8g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TP0gEdiYlUHzzHL05xw6i7hvM8dCYkjnIA+wuOfaU61jB+GHvaiYMwHcWPuT9kvx8
         8DOslR5vxE4NhgQ7Dj0neNcVqUh7Lk6VEH1VCwKCgVpN5SwHPD+RtfOUQLY1bHZsF0
         t3tu/3PawvBJyBx+XEr7GqvrAeT7cBxgrey56+S4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007Dbsc3000940
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 07:37:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 07:37:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 07:37:53 -0600
Received: from [10.250.65.50] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007Dbrhw047496;
        Tue, 7 Jan 2020 07:37:53 -0600
Subject: Re: [PATCHv4 06/14] remoteproc/omap: Initialize and assign reserved
 memory node
To:     Tero Kristo <t-kristo@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>
References: <20200102131845.12992-1-t-kristo@ti.com>
 <20200102131845.12992-7-t-kristo@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <f380b7a7-cef5-bf56-2344-49b83a15422e@ti.com>
Date:   Tue, 7 Jan 2020 08:37:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102131845.12992-7-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 1/2/20 8:18 AM, Tero Kristo wrote:
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


Requires only at the moment due to firmware..

This sounds like some firmware images hard-coded their vring addresses
instead of getting them dynamically as they should and we are hacking
around that on the kernel side by giving them the addresses they use as
carveouts.

Should we rather make use of the IOMMU attached to the DSP to map any
kernel address to the DSP where the firmware expects it? Or better yet
fixup the firmwares.

DRAM carveouts should be a last resort used only for when hardware
really requires it.

Andrew


> use the of_reserved_mem_device_init/release() API appropriately
> to assign the corresponding reserved memory region to the OMAP
> remoteproc device. Note that only one region per device is
> allowed by the framework.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 9ca337f18ac2..8a6dd742a8b1 100644
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
> @@ -480,14 +481,22 @@ static int omap_rproc_probe(struct platform_device *pdev)
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
> @@ -499,6 +508,7 @@ static int omap_rproc_remove(struct platform_device *pdev)
>  
>  	rproc_del(rproc);
>  	rproc_free(rproc);
> +	of_reserved_mem_device_release(&pdev->dev);
>  
>  	return 0;
>  }
> 
