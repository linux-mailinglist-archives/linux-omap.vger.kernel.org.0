Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC3E2AE0DA
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 21:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgKJUnY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 15:43:24 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46128 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJUnX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Nov 2020 15:43:23 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAKgu3r061518;
        Tue, 10 Nov 2020 14:42:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605040976;
        bh=sifttbW0k5Lxcp2E71JaLXQzbHbeoqMjZBnpIupizDw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LmrO7Q7Dlq6pUHsh8dqUlGvFLlSoLm74P/l8Cq/t1BTBUQGrpcEcPXonujHXvweye
         tqRp6oyq2fnpIGQj5266vsEM13zx1p556lUWq39/CA74cl/jJnK0VE0P4jb6weD7tu
         x23b+PvFD1x2sNVHla8AJHhSb8BhRHqBIyF9q+cQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAKguLi130035
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Nov 2020 14:42:56 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 14:42:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 14:42:56 -0600
Received: from [10.250.64.205] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAKgtB2063474;
        Tue, 10 Nov 2020 14:42:55 -0600
Subject: Re: [PATCH] soc: ti: pruss: Remove wrong check against
 *get_match_data return value
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <ssantosh@kernel.org>
CC:     <santosh.shilimkar@oracle.com>, <lee.jones@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <tony@atomide.com>, Wei Yongjun <weiyongjun1@huawei.com>
References: <20201026144943.30821-1-grzegorz.jaszczyk@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <a1a787b2-efac-3baf-2a3c-ba135b8b32d0@ti.com>
Date:   Tue, 10 Nov 2020 14:42:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026144943.30821-1-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Greg,

On 10/26/20 9:49 AM, Grzegorz Jaszczyk wrote:
> Since the of_device_get_match_data() doesn't return error code, remove
> wrong IS_ERR test. Proper check against NULL pointer is already done
> later before usage: if (data && data->...).
> 
> Additionally, proceeding with empty device data is valid (e.g. in case
> of "ti,am3356-pruss").
> 
> Reported-by: Wei Yongjun <weiyongjun1@huawei.com>

Please add the appropriate Fixes: tag.

And prefer %s/Remove/Fix/ in patch title.

With that,
Acked-by: Suman Anna <s-anna@ti.com>

regards
Suman

> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
>  drivers/soc/ti/pruss.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
> index cc0b4ad7a3d3..5d6e7132a5c4 100644
> --- a/drivers/soc/ti/pruss.c
> +++ b/drivers/soc/ti/pruss.c
> @@ -126,8 +126,6 @@ static int pruss_clk_init(struct pruss *pruss, struct device_node *cfg_node)
>  	int ret = 0;
>  
>  	data = of_device_get_match_data(dev);
> -	if (IS_ERR(data))
> -		return -ENODEV;
>  
>  	clks_np = of_get_child_by_name(cfg_node, "clocks");
>  	if (!clks_np) {
> @@ -175,10 +173,6 @@ static int pruss_probe(struct platform_device *pdev)
>  	const char *mem_names[PRUSS_MEM_MAX] = { "dram0", "dram1", "shrdram2" };
>  
>  	data = of_device_get_match_data(&pdev->dev);
> -	if (IS_ERR(data)) {
> -		dev_err(dev, "missing private data\n");
> -		return -ENODEV;
> -	}
>  
>  	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
>  	if (ret) {
> 

