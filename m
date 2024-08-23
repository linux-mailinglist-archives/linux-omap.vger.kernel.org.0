Return-Path: <linux-omap+bounces-1986-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E78095CBAA
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 13:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 618431C22517
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 11:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC12185E65;
	Fri, 23 Aug 2024 11:46:54 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26214B966;
	Fri, 23 Aug 2024 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413613; cv=none; b=szj1Q5pjxCcnSz8SwXVtbhZwAGoJW413Wh6CRXMoO8TkFZMmZF8LtPwC+wwwxUeeeicHkvt0j5HtwW9xKRZiZ/XcDtXZCcAil7dTjv8M0R78GTUMRSTZjs2woFJ9jasyuB1HGvJUyNuNRu7mT4GhhqkDlwArHydq7dPctiSx/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413613; c=relaxed/simple;
	bh=iJlN9K48qYni8tklOF06ihKPxJPZBO0rnUYJL9exxBo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbmlpPGdhNZs9kuWCN5/er2/nzsS/DHPjFow1GF9rVZTUX4LQHB5K3PwFyiUCQqfRNJT/TG3YRXnKGexBYIIvXNvZt3WO46P1qu6Ze1jCuzS/4k7Ueik5RIjL1//hdfyfSBt80Ha7WvaFjxD6+M161+7dQ7pki2HLzHrYaT5APo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqyrd0b16z6K9Nk;
	Fri, 23 Aug 2024 19:43:45 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B5F8140A70;
	Fri, 23 Aug 2024 19:46:49 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 12:46:49 +0100
Date: Fri, 23 Aug 2024 12:46:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/7] memory: pl172: simplify with dev_err_probe()
Message-ID: <20240823124648.0000692b@Huawei.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-4-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
	<20240823-b4-cleanup-h-guard-v1-4-01668915bd55@linaro.org>
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

On Fri, 23 Aug 2024 12:15:59 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
> the code also simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huwei.com>
> ---
>  drivers/memory/pl172.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/memory/pl172.c b/drivers/memory/pl172.c
> index 9eb8cc7de494..390012401f64 100644
> --- a/drivers/memory/pl172.c
> +++ b/drivers/memory/pl172.c
> @@ -217,10 +217,9 @@ static int pl172_probe(struct amba_device *adev, const struct amba_id *id)
>  		return -ENOMEM;
>  
>  	pl172->clk = devm_clk_get(dev, "mpmcclk");
> -	if (IS_ERR(pl172->clk)) {
> -		dev_err(dev, "no mpmcclk provided clock\n");
> -		return PTR_ERR(pl172->clk);
> -	}
> +	if (IS_ERR(pl172->clk))
> +		return dev_err_probe(dev, PTR_ERR(pl172->clk),
> +				     "no mpmcclk provided clock\n");
>  
>  	ret = clk_prepare_enable(pl172->clk);
>  	if (ret) {
> 


