Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B010F14E090
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2020 19:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbgA3SLo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jan 2020 13:11:44 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40990 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbgA3SLo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jan 2020 13:11:44 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00UIBhI8005214;
        Thu, 30 Jan 2020 12:11:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580407903;
        bh=h+G3LYU16aiLuWdXeyIlXaOLzpHdez77njrJFeFbZgc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VB4nECyOLcYrKZ2Lwg0Fj+3Ce9RxR92ut+kqcss4ZGQole0jHQD4F83kbFT3VsQ6e
         Sl6M5vgI7GTndGQmKueITUkH87KvfPbkxq3Yia2UmyDKelAwLP3vAd8ONUdLp5F2fY
         M6sxxx7TfHtNKY9M3WIz+MbuVAq7shX/5O2ABcwk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00UIBhX6046863
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Jan 2020 12:11:43 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 30
 Jan 2020 12:11:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 30 Jan 2020 12:11:43 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00UIBfRd064578;
        Thu, 30 Jan 2020 12:11:42 -0600
Subject: Re: [PATCHv5 06/14] remoteproc/omap: Initialize and assign reserved
 memory node
To:     Tero Kristo <t-kristo@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <linux-omap@vger.kernel.org>
References: <20200116135332.7819-1-t-kristo@ti.com>
 <20200116135332.7819-7-t-kristo@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <249c293c-6a23-165f-1df5-4859ee47658a@ti.com>
Date:   Thu, 30 Jan 2020 13:11:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200116135332.7819-7-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 1/16/20 8:53 AM, Tero Kristo wrote:
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


Same comment as before, this is a firmware issue for only some firmwares
that do not handle being assigned vring locations correctly and instead
hard-code them.

This is not a requirement of the remote processor itself and so it
should not fail to probe if a specific memory carveout isn't given.

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
> v5: no changes
> 
>  drivers/remoteproc/omap_remoteproc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 0846839b2c97..194303b860b2 100644
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
