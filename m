Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE3125423D
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 11:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgH0J1V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 05:27:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49576 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgH0J1U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Aug 2020 05:27:20 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R9R3Es027540;
        Thu, 27 Aug 2020 04:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598520423;
        bh=IiVjgGh9n9U/mfxR2yJpQg4PuQcUL6DOGNbNr5tYBPQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rYi9Y+8Oe41k4u2hYSMIzGCdo03SZuJ5RJ4qwoQcJ5u4oBFSDu2FzW3xNzBSfzEOk
         HjYDiK3nsoEXtcUv9T/WgRpNxnVi2paggq6q9E7WT8Hwlgt6uBsHMFeYVh6aQoxHj8
         476K3eKqX276tUwwu6yvCt5o6KtqhORAlX+IscpA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R9R2UV020528
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 04:27:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 04:27:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 04:27:02 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R9R0O8043489;
        Thu, 27 Aug 2020 04:27:01 -0500
Subject: Re: [PATCH v2] memory: omap-gpmc: Fix build error without CONFIG_OF
To:     YueHaibing <yuehaibing@huawei.com>, <tony@atomide.com>,
        <krzk@kernel.org>, <ladis@linux-mips.org>, <bbrezillon@kernel.org>,
        <peter.ujfalusi@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200818125338.58148-1-yuehaibing@huawei.com>
 <20200826125919.22172-1-yuehaibing@huawei.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <c4d64ed6-2bd6-9b6e-63e1-59eb50157b87@ti.com>
Date:   Thu, 27 Aug 2020 12:27:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826125919.22172-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 26/08/2020 15:59, YueHaibing wrote:
> If CONFIG_OF is n, gcc fails:
> 
> drivers/memory/omap-gpmc.o: In function `gpmc_omap_onenand_set_timings':
> omap-gpmc.c:(.text+0x2a88): undefined reference to `gpmc_read_settings_dt'
> 
> Add gpmc_read_settings_dt() helper function to fix this.
> 
> Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: add gpmc_read_settings_dt() stub
> ---
>   drivers/memory/omap-gpmc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index cd9e80748591..02c0c694ecaf 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -2310,6 +2310,9 @@ static void gpmc_probe_dt_children(struct platform_device *pdev)
>   	}
>   }
>   #else
> +void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
> +{

I will suggest to set gpmc_settings data structure to zero here so that
the caller doesn't proceed with random/invalid settings.

> +}
>   static int gpmc_probe_dt(struct platform_device *pdev)
>   {
>   	return 0;
> 

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
