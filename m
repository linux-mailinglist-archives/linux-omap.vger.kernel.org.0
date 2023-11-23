Return-Path: <linux-omap+bounces-2-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277F7F5C80
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 11:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2B002819DB
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 10:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A701A582;
	Thu, 23 Nov 2023 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsF3kppG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1A71773A
	for <linux-omap@vger.kernel.org>; Thu, 23 Nov 2023 10:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55ADC433C8;
	Thu, 23 Nov 2023 10:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700735881;
	bh=jNCvrYLWqFSMORBcd4VCK5iJmMYxeQ+pIicJZR1QdZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsF3kppGdYawW3i9ssq3ugB1MO1LBA6OQUjLWRF1guLmmJ8TOW3t9LMwbxsKBcJ+g
	 zzIs1OOwIEY6MOFArp1AUt9Adt6vg4BoV4ercW4rwPUzVqgGJQCgz40Jjh4klDaQjo
	 qANSsF44mdfTn2CJ7p9i8B958N8pVMxUtnaUyDsG0/sy2oQG+ab5ra8r5y0Bj399SR
	 zeF1c5mqStT3VIkAAO/m3o97UyJ8KD/q4hpOcoaQRV5O7zeH0VpTkLx4Q+goDh/2RU
	 C/kdUqnuNeDdxOqAvQjAivOxiBTqXwsND2WHyDoMdov7wn7UFHIDtk3bcaK9ObUAFB
	 orjusgieYHYOA==
Date: Thu, 23 Nov 2023 10:37:56 +0000
From: Lee Jones <lee@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: tony@atomide.com, robh@kernel.org, wens@csie.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl6030-irq: Revert to use of_match_device()
Message-ID: <20231123103756.GD1184245@google.com>
References: <20231029114843.15553-1-peter.ujfalusi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231029114843.15553-1-peter.ujfalusi@gmail.com>

On Sun, 29 Oct 2023, Peter Ujfalusi wrote:

> The core twl chip is probed via i2c and the dev->driver->of_match_table is
> NULL, causing the driver to fail to probe.
> 
> This partially reverts commit 1e0c866887f4.
> 
> Fixes: 1e0c866887f4 ("mfd: Use device_get_match_data() in a bunch of drivers")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  drivers/mfd/twl6030-irq.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
> index f9fce8408c2c..3c03681c124c 100644
> --- a/drivers/mfd/twl6030-irq.c
> +++ b/drivers/mfd/twl6030-irq.c
> @@ -24,10 +24,10 @@
>  #include <linux/kthread.h>
>  #include <linux/mfd/twl.h>
>  #include <linux/platform_device.h>
> -#include <linux/property.h>
>  #include <linux/suspend.h>
>  #include <linux/of.h>
>  #include <linux/irqdomain.h>
> +#include <linux/of_device.h>
>  
>  #include "twl-core.h"
>  
> @@ -368,10 +368,10 @@ int twl6030_init_irq(struct device *dev, int irq_num)
>  	int			nr_irqs;
>  	int			status;
>  	u8			mask[3];
> -	const int		*irq_tbl;
> +	const struct of_device_id *of_id;
>  
> -	irq_tbl = device_get_match_data(dev);
> -	if (!irq_tbl) {
> +	of_id = of_match_device(twl6030_of_match, dev);

I think you just dropped support for ACPI.

Rob, care to follow-up?

> +	if (!of_id || !of_id->data) {
>  		dev_err(dev, "Unknown TWL device model\n");
>  		return -EINVAL;
>  	}
> @@ -409,7 +409,7 @@ int twl6030_init_irq(struct device *dev, int irq_num)
>  
>  	twl6030_irq->pm_nb.notifier_call = twl6030_irq_pm_notifier;
>  	atomic_set(&twl6030_irq->wakeirqs, 0);
> -	twl6030_irq->irq_mapping_tbl = irq_tbl;
> +	twl6030_irq->irq_mapping_tbl = of_id->data;
>  
>  	twl6030_irq->irq_domain =
>  		irq_domain_add_linear(node, nr_irqs,
> -- 
> 2.42.0
> 

-- 
Lee Jones [李琼斯]

