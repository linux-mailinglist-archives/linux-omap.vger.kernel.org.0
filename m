Return-Path: <linux-omap+bounces-1989-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C66495CBC8
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94DB028560D
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8816018785B;
	Fri, 23 Aug 2024 11:56:44 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343ED143C5F;
	Fri, 23 Aug 2024 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414204; cv=none; b=o43RRT5Vxdljc7LREcr/Y/z1ZqDpZmuWfORSpeg03rDdP5sUl7B2mTka/3cp5Ds7lNc9L8gCQxZ1Gr3noQZJnPs9CVnnwX5RN70QDThvLRjYF/pNDSJm1EzBL0NxoJhL1Quz7dIFjonhePa3ZJjKNQJIx/tOTHgYp4HzbisGkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414204; c=relaxed/simple;
	bh=MBf7otlcpTgpp7tPlJUEgl08qH3djO0uuaYTsvCnv/I=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hGCbJErM8Ky1gzGD2AGpJoAs6sZSSWe+gsfi2q0UxqMgF0d573cdF+MjrnDEyMerGN+zlWb+MjBgCl660s2qutbSGtYSTiR/PymfF1ASp25aA8pRmq1uYVZLaLa0L+z4Ph/eubHorLmXIDZAq6QwOioY+ASdKFv8E+AoHt1l6DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqz3y4sQ8z6K9Pw;
	Fri, 23 Aug 2024 19:53:34 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F602140B18;
	Fri, 23 Aug 2024 19:56:39 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 12:56:38 +0100
Date: Fri, 23 Aug 2024 12:56:37 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 7/7] memory: pl353-smc: simplify with
 devm_clk_get_enabled()
Message-ID: <20240823125637.00007fe4@Huawei.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-7-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-7-01668915bd55@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Fri, 23 Aug 2024 12:16:02 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
> make code simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
LGTM.
Follow up suggestion inline.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/memory/pl353-smc.c | 36 +++---------------------------------
>  1 file changed, 3 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
> index c75b99e49970..994c7a792e34 100644
> --- a/drivers/memory/pl353-smc.c
> +++ b/drivers/memory/pl353-smc.c
> @@ -75,34 +75,21 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
>  	const struct of_device_id *match = NULL;
>  	struct pl353_smc_data *pl353_smc;
>  	struct device_node *child;
> -	int err;
>  
>  	pl353_smc = devm_kzalloc(&adev->dev, sizeof(*pl353_smc), GFP_KERNEL);
>  	if (!pl353_smc)
>  		return -ENOMEM;
>  
> -	pl353_smc->aclk = devm_clk_get(&adev->dev, "apb_pclk");
> +	pl353_smc->aclk = devm_clk_get_enabled(&adev->dev, "apb_pclk");
>  	if (IS_ERR(pl353_smc->aclk))
>  		return dev_err_probe(&adev->dev, PTR_ERR(pl353_smc->aclk),
>  				     "aclk clock not found.\n");
>  
> -	pl353_smc->memclk = devm_clk_get(&adev->dev, "memclk");
> +	pl353_smc->memclk = devm_clk_get_enabled(&adev->dev, "memclk");
>  	if (IS_ERR(pl353_smc->memclk))
>  		return dev_err_probe(&adev->dev, PTR_ERR(pl353_smc->memclk),
>  				     "memclk clock not found.\n");
>  
> -	err = clk_prepare_enable(pl353_smc->aclk);
> -	if (err) {
> -		dev_err(&adev->dev, "Unable to enable AXI clock.\n");
> -		return err;
> -	}
> -
> -	err = clk_prepare_enable(pl353_smc->memclk);
> -	if (err) {
> -		dev_err(&adev->dev, "Unable to enable memory clock.\n");
> -		goto disable_axi_clk;
> -	}
> -
>  	amba_set_drvdata(adev, pl353_smc);
>  
>  	/* Find compatible children. Only a single child is supported */
> @@ -115,30 +102,14 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
>  		break;
>  	}
>  	if (!match) {
With change below this becomes unconditional as we'll have already
returned in the loop for the good path.

Might as well use dev_err_probe() here as well to save a few lines.

> -		err = -ENODEV;
>  		dev_err(&adev->dev, "no matching children\n");
> -		goto disable_mem_clk;
> +		return -ENODEV;
>  	}
>  
>  	of_platform_device_create(child, NULL, &adev->dev);
>  	of_node_put(child);

An additional cleanup looks sensible here.

Push this last bit into the loop and use 

for_each_available_child_of_node_scoped()

Assuming you don't already have a patch doing that :)

>  
>  	return 0;
> -
> -disable_mem_clk:
> -	clk_disable_unprepare(pl353_smc->memclk);
> -disable_axi_clk:
> -	clk_disable_unprepare(pl353_smc->aclk);
> -
> -	return err;
> -}
> -
> -static void pl353_smc_remove(struct amba_device *adev)
> -{
> -	struct pl353_smc_data *pl353_smc = amba_get_drvdata(adev);
> -
> -	clk_disable_unprepare(pl353_smc->memclk);
> -	clk_disable_unprepare(pl353_smc->aclk);
>  }
>  
>  static const struct amba_id pl353_ids[] = {
> @@ -157,7 +128,6 @@ static struct amba_driver pl353_smc_driver = {
>  	},
>  	.id_table = pl353_ids,
>  	.probe = pl353_smc_probe,
> -	.remove = pl353_smc_remove,
>  };
>  
>  module_amba_driver(pl353_smc_driver);
> 


