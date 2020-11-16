Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B859D2B4D14
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 18:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732776AbgKPRc3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 12:32:29 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40310 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732063AbgKPRc2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Nov 2020 12:32:28 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AGHW5QX043074;
        Mon, 16 Nov 2020 11:32:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605547925;
        bh=vCnDwyaJf44VQ68LKlbL9c2SguuePq5/+K5tM/7dJ9c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X/BeZKk2WW8xnXXPNmfU86VbOdd5JbWGHWefJw1pbATm1681/yvTRqWAxyquuEAzR
         Dur6pFQEtm4NkX/6YRKAIWG6R7yn5Tlo3jc3O8QXboimGWnkeNl3cON9MHmco+E6iq
         jww9nj5QZGoUR8SJRDOKQyTjKThn61Ij4YJ3ISn8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AGHW4ua002051
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Nov 2020 11:32:05 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 16
 Nov 2020 11:32:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 16 Nov 2020 11:32:03 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AGHW3pw031264;
        Mon, 16 Nov 2020 11:32:03 -0600
Subject: Re: [PATCH v2] soc: ti: pruss: Fix wrong check against
 *get_match_data return value
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <ssantosh@kernel.org>
CC:     <santosh.shilimkar@oracle.com>, <lee.jones@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <tony@atomide.com>, Wei Yongjun <weiyongjun1@huawei.com>
References: <20201116172233.18459-1-grzegorz.jaszczyk@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <7a18452c-8c9c-df7d-b175-529ab690623f@ti.com>
Date:   Mon, 16 Nov 2020 11:31:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116172233.18459-1-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Santosh,

On 11/16/20 11:22 AM, Grzegorz Jaszczyk wrote:
> Since the of_device_get_match_data() doesn't return error code, remove
> wrong IS_ERR test. Proper check against NULL pointer is already done
> later before usage: if (data && data->...).
> 
> Additionally, proceeding with empty device data is valid (e.g. in case
> of "ti,am3356-pruss").
> 
> Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
> Reported-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Acked-by: Suman Anna <s-anna@ti.com>

Can you please pick this up for 5.10-rc's?

Thanks,
Suman

> ---
> v1->v2:
> - Add the appropriate Fixes: tag.
> - %s/Remove/Fix/ in patch title.
> - Add Suman's Acked-by.
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

