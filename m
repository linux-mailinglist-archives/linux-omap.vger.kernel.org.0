Return-Path: <linux-omap+bounces-3987-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4CAEBFFE
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 21:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CC6F16BE2E
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 19:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8BD2E9743;
	Fri, 27 Jun 2025 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pDQSiQ1+"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048572EBBA3;
	Fri, 27 Jun 2025 19:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052726; cv=none; b=i4tQ7nZSXvRS1Pb0f0XDwpzK626rTUIGUfTRt0CDMcfHNnhjdy91R0aOB8PSkYr+Uc8m+xhjJkx4KuzH4TqIDA8OPkLc/vS4SGXPoYbGYm0nlDJgNo6g3/pfTbXTJtkkTWPHEl9C4o9AhJnrbF3/OjBB1G86UvYL5F0FgytyW/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052726; c=relaxed/simple;
	bh=OmkwvJTCg9uftU+D1x+MegluB/qmhXQnYLMchcdtboI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU0BKuQFnq0/7SkhM01MVT8TAQOzX7qlp0g3JKGPHg6bJ8VB6wpcq89k7iBDcKuNgTExwXWFshkUQS3oaTTZ6vTznoNCvzCB/n/q17RHUndPTm2DAUi8V0LEKecd8wF9j/5E6NJbWSyQtDFJ+LlK+MZKmMwA1SekYVt+QSnnXb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pDQSiQ1+; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJVppO2496974;
	Fri, 27 Jun 2025 14:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751052711;
	bh=IsmC7YBYLmO/IpP84oFzjb88vBYm7nSf6TjgsuwpSqY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pDQSiQ1+cQqO547LwgYMRGy+oMhly/INy1eCQ2edPoQus286hjCKMwI10wdtSzA+7
	 6YbgIMShghzvNO+fsMnfbyJZ3SKFQigpgnEnZFKgY50j92rAfsEkDjcRZTce1PMulu
	 QAnM12CWoI83aCJ6KhpGBSuayRO47Rc90f4kpVjA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJVp4Q3531647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:31:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:31:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:31:50 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJVo3k3598018;
	Fri, 27 Jun 2025 14:31:50 -0500
Date: Fri, 27 Jun 2025 14:31:50 -0500
From: Nishanth Menon <nm@ti.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <d-gole@ti.com>, <robertcnelson@gmail.com>, <jkridner@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m-leonard@ti.com>, <praneeth@ti.com>, <afd@ti.com>
Subject: Re: [PATCH v2] regulator: tps65219: Fix devm_kmalloc size allocation
Message-ID: <20250627193150.nxer4zuowaejzp4v@unarmored>
References: <20250620154541.2713036-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620154541.2713036-1-s-ramamoorthy@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10:45-20250620, Shree Ramamoorthy wrote:
> In probe(), two arrays of structs are allocated with the devm_kmalloc()
> function, but the memory size of the allocations were given as the arrays'
> length (pmic->common_irq_size for the first call and pmic->dev_irq_size for
> the second devm_kmalloc call). The memory size should have been the total
> memory needed.
> 
> This led to a heap overflow when the struct array was used. The issue was
> first discovered with the PocketBeagle2 and BeaglePlay. The common and
> device-specific structs are now allocated one at a time within the loop.
> 
> Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
> Reported-by: Dhruva Gole <d-gole@ti.com>
> Closes: https://lore.kernel.org/all/20250619153526.297398-1-d-gole@ti.com/
> Tested-by: Robert Nelson <robertcnelson@gmail.com>
> Acked-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
> v2: Update commit message explanation & tags.
> ---

Kasan also reports the same on latest next :(
https://gist.github.com/nmenon/a0a020e8417c198d2f366fa00b900e12

Could this be routed to master please?

Reviewed-by: Nishanth Menon <nm@ti.com>

>  drivers/regulator/tps65219-regulator.c | 28 +++++++++++++-------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index b16b300d7f45..5e67fdc88f49 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -436,46 +436,46 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>  					     pmic->rdesc[i].name);
>  	}
>  
> -	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
> -	if (!irq_data)
> -		return -ENOMEM;
> -
>  	for (i = 0; i < pmic->common_irq_size; ++i) {
>  		irq_type = &pmic->common_irq_types[i];
>  		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>  		if (irq < 0)
>  			return -EINVAL;
>  
> -		irq_data[i].dev = tps->dev;
> -		irq_data[i].type = irq_type;
> +		irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data), GFP_KERNEL);
> +		if (!irq_data)
> +			return -ENOMEM;
> +
> +		irq_data->dev = tps->dev;
> +		irq_data->type = irq_type;
>  		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>  						  tps65219_regulator_irq_handler,
>  						  IRQF_ONESHOT,
>  						  irq_type->irq_name,
> -						  &irq_data[i]);
> +						  irq_data);
>  		if (error)
>  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
>  					     "Failed to request %s IRQ %d: %d\n",
>  					     irq_type->irq_name, irq, error);
>  	}
>  
> -	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
> -	if (!irq_data)
> -		return -ENOMEM;
> -
>  	for (i = 0; i < pmic->dev_irq_size; ++i) {
>  		irq_type = &pmic->irq_types[i];
>  		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>  		if (irq < 0)
>  			return -EINVAL;
>  
> -		irq_data[i].dev = tps->dev;
> -		irq_data[i].type = irq_type;
> +		irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data), GFP_KERNEL);
> +		if (!irq_data)
> +			return -ENOMEM;
> +
> +		irq_data->dev = tps->dev;
> +		irq_data->type = irq_type;
>  		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>  						  tps65219_regulator_irq_handler,
>  						  IRQF_ONESHOT,
>  						  irq_type->irq_name,
> -						  &irq_data[i]);
> +						  irq_data);
>  		if (error)
>  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
>  					     "Failed to request %s IRQ %d: %d\n",
> 
> base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
> -- 
> 2.43.0
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

