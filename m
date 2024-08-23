Return-Path: <linux-omap+bounces-1987-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DC95CBB3
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90E5283E4A
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7102518757C;
	Fri, 23 Aug 2024 11:52:02 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35018754D;
	Fri, 23 Aug 2024 11:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413922; cv=none; b=Yld7YnQt5bzRivVsAjS0S82j1Hg2d59Hi5F79KZoapKABjI5qcv2FYDy22j3J6fpwlb8gh4VOne4R61HUqQ41VlGLqjUadvFiG5yp7nIllz3e+MdnUgPNzjVyv0WDDQGd6zTSZnE7xV1DGCJGmPXSI4n/DU8lc/kTjE7oFOBxKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413922; c=relaxed/simple;
	bh=fQjVBYKgSCd8iY8Lx6pyip9noalVfc6ZYkB0ogjPo9w=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bs5WeOFtoo5E5rxpctH/UO2CqjEEHPTlg//LfXSQMhs2WN3Q3Pz1oBoBxidYEp5Jg1+2iacC6jUAuNpuIKCcNH+qCTTZl8R1z2mZefaI9cAGl9DQ8IrGnhwUFGrF/AYR8UjsCykCVvlCksYh3OvyuGBVy4mXhIb3+MbNtcEY0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WqyyX47W5z6K9Pw;
	Fri, 23 Aug 2024 19:48:52 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 0439F1400D4;
	Fri, 23 Aug 2024 19:51:57 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 12:51:56 +0100
Date: Fri, 23 Aug 2024 12:51:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/7] memory: pl172: simplify with devm_clk_get_enabled()
Message-ID: <20240823125155.00002c2f@Huawei.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-5-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-5-01668915bd55@linaro.org>
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

On Fri, 23 Aug 2024 12:16:00 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
> make code simpler.  Change to dev_err_probe() in handling clk_get_rate()
> error to make it even simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Follow up suggestion inline + I'd use dev_err_probe() one more
time.

Anyhow fine either way
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/memory/pl172.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/memory/pl172.c b/drivers/memory/pl172.c
> index 390012401f64..db5fbee34077 100644
> --- a/drivers/memory/pl172.c
> +++ b/drivers/memory/pl172.c
> @@ -216,28 +216,20 @@ static int pl172_probe(struct amba_device *adev, const struct amba_id *id)
>  	if (!pl172)
>  		return -ENOMEM;
>  
> -	pl172->clk = devm_clk_get(dev, "mpmcclk");
> +	pl172->clk = devm_clk_get_enabled(dev, "mpmcclk");
>  	if (IS_ERR(pl172->clk))
>  		return dev_err_probe(dev, PTR_ERR(pl172->clk),
>  				     "no mpmcclk provided clock\n");
>  
> -	ret = clk_prepare_enable(pl172->clk);
> -	if (ret) {
> -		dev_err(dev, "unable to mpmcclk enable clock\n");
> -		return ret;
> -	}
> -
>  	pl172->rate = clk_get_rate(pl172->clk) / MSEC_PER_SEC;
> -	if (!pl172->rate) {
> -		dev_err(dev, "unable to get mpmcclk clock rate\n");
> -		ret = -EINVAL;
> -		goto err_clk_enable;
> -	}
> +	if (!pl172->rate)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "unable to get mpmcclk clock rate\n");
>  
>  	ret = amba_request_regions(adev, NULL);
Seeing as you are here an obvious follow up...

Use a devm_add_action_or_reset() and a local cleanup callback
or spin up a devm_amba_request_regions() and apply that here
and probably in other similar locations (a quick look suggested
this would be generally useful).

Then can drop remove entirely which is always nice to see + return
directly in the remaining error path.

>  	if (ret) {
>  		dev_err(dev, "unable to request AMBA regions\n");
> -		goto err_clk_enable;
> +		return ret;
I'd make this a return dev_err_probe() as well.

>  	}
>  
>  	pl172->base = devm_ioremap(dev, adev->res.start,
> @@ -267,16 +259,11 @@ static int pl172_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  err_no_ioremap:
>  	amba_release_regions(adev);
> -err_clk_enable:
> -	clk_disable_unprepare(pl172->clk);
>  	return ret;
>  }
>  
>  static void pl172_remove(struct amba_device *adev)
>  {
> -	struct pl172_data *pl172 = amba_get_drvdata(adev);
> -
> -	clk_disable_unprepare(pl172->clk);
>  	amba_release_regions(adev);
>  }
>  
> 


