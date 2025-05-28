Return-Path: <linux-omap+bounces-3742-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D52AC6D7E
	for <lists+linux-omap@lfdr.de>; Wed, 28 May 2025 18:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1DD1C00895
	for <lists+linux-omap@lfdr.de>; Wed, 28 May 2025 16:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC9D28C011;
	Wed, 28 May 2025 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7sahqms"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34A1D6193;
	Wed, 28 May 2025 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448369; cv=none; b=oNJXJuY3PvcKH8nhr0w8H12kTkLADWQ7syEsvinKXhCPjCGv1pXRj+BdgyOWySnqSGnkWOCu8wVqfhXBvA9jy8oYsL4pZXik4JhFVj82xwYzz7N4Tj1A2xqyIn/qNObZOD4ClwqupNAHen8j4R76p9ZbzFzphkQ6MODY2jcaKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448369; c=relaxed/simple;
	bh=E39xeMDQKZ3ZvVa5E2QtOO0iwP3p31vysrL4F+yxZJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNmMNuiufMVspr/rA84t7FsU5cDTbRUnOvSf/cRFpuhnfgZmAewrY42TLgXl2xTiZsMRrYR4BsKIa1uJ4wsXvaAX8OLRBaS4fZnhgJGgGUqTJY9I3ALByezS5AdMj/R9y0jXQAjoelIhcFWtPVBpkVQDRctkX8f0/BPTliZPKdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7sahqms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CEDC4CEE3;
	Wed, 28 May 2025 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748448368;
	bh=E39xeMDQKZ3ZvVa5E2QtOO0iwP3p31vysrL4F+yxZJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7sahqmsm2qzmR0d9kv2eHlH0yQoF3o8f6VJ8OWutWTiGrLuM4c79VZMXrpZ4OLbU
	 1VNQhGhrk1dSZLC03Z9xy0hFB3ojejIo57HEmZWKtQDJzXQ/1ONdWKgU10UuvdWDJ0
	 voUiyOM4abGfD9FeM504FY83+skEMLnJF0ZMiV9iMIBhIudKTJvaZksd5zwYH4SB/F
	 RnE8t29JTO4LyQ50PbrGBDAjdP3qsDp3DontP84JAET9CF7VPBK4PnYo5mLdX5Ccmg
	 bWTe7joBqst8QJa0npB/NkCWsGaGESGVMciUSEwFb8keLm6dAUgk4oF4taWFLfV47N
	 B/9Ir/0J1XKlw==
Date: Wed, 28 May 2025 09:06:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: Remove node variables that are unused with
 CONFIG_OF=n
Message-ID: <20250528160603.GA1172935@ax162>
References: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>

Hi Thomas,

On Thu, May 08, 2025 at 04:57:24PM +0100, Nathan Chancellor wrote:
> A recent cleanup introduced a few instances of -Wunused-variable in
> configurations without CONFIG_OF because of_fwnode_handle() does not
> reference its argument in that case:
> 
>   drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
>   drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
>     679 |         struct                  device_node *node = dev->of_node;
>         |                                              ^~~~
>   drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
>   drivers/mfd/max8925-core.c:659:29: warning: unused variable 'node' [-Wunused-variable]
>     659 |         struct device_node *node = chip->dev->of_node;
>         |                             ^~~~
>   drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
>   drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
>     576 |         struct device_node *node = i2c->dev.of_node;
>         |                             ^~~~

These warnings are now present in mainline after the merge of the
irq/cleanups branch...

> Use the value of these variables as the argument to of_fwnode_handle()
> directly, clearing up the warnings.
> 
> Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")

but this hash has changed, so this should be

Fixes: a36aa0f7226a ("mfd: Switch to irq_domain_create_*()")

but the rest of the change is still applicable. Would you like a new
change or can you adjust that when applying?

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/mfd/88pm860x-core.c | 5 ++---
>  drivers/mfd/max8925-core.c  | 5 ++---
>  drivers/mfd/twl4030-irq.c   | 5 ++---
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
> index 488e346047c1..25300b53a8ef 100644
> --- a/drivers/mfd/88pm860x-core.c
> +++ b/drivers/mfd/88pm860x-core.c
> @@ -573,7 +573,6 @@ static int device_irq_init(struct pm860x_chip *chip,
>  	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
>  	int data, mask, ret = -EINVAL;
>  	int nr_irqs, irq_base = -1;
> -	struct device_node *node = i2c->dev.of_node;
>  
>  	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
>  		| PM8607_B0_MISC1_INT_MASK;
> @@ -624,8 +623,8 @@ static int device_irq_init(struct pm860x_chip *chip,
>  		ret = -EBUSY;
>  		goto out;
>  	}
> -	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, chip->irq_base, 0,
> -				 &pm860x_irq_domain_ops, chip);
> +	irq_domain_create_legacy(of_fwnode_handle(i2c->dev.of_node), nr_irqs,
> +				 chip->irq_base, 0, &pm860x_irq_domain_ops, chip);
>  	chip->core_irq = i2c->irq;
>  	if (!chip->core_irq)
>  		goto out;
> diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
> index 78b16c67a5fc..91388477ad2b 100644
> --- a/drivers/mfd/max8925-core.c
> +++ b/drivers/mfd/max8925-core.c
> @@ -656,7 +656,6 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
>  {
>  	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
>  	int ret;
> -	struct device_node *node = chip->dev->of_node;
>  
>  	/* clear all interrupts */
>  	max8925_reg_read(chip->i2c, MAX8925_CHG_IRQ1);
> @@ -682,8 +681,8 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
>  		return -EBUSY;
>  	}
>  
> -	irq_domain_create_legacy(of_fwnode_handle(node), MAX8925_NR_IRQS, chip->irq_base, 0,
> -				 &max8925_irq_domain_ops, chip);
> +	irq_domain_create_legacy(of_fwnode_handle(chip->dev->of_node), MAX8925_NR_IRQS,
> +				 chip->irq_base, 0, &max8925_irq_domain_ops, chip);
>  
>  	/* request irq handler for pmic main irq*/
>  	chip->core_irq = irq;
> diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
> index 232c2bfe8c18..c7191d2992a1 100644
> --- a/drivers/mfd/twl4030-irq.c
> +++ b/drivers/mfd/twl4030-irq.c
> @@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
>  	static struct irq_chip	twl4030_irq_chip;
>  	int			status, i;
>  	int			irq_base, irq_end, nr_irqs;
> -	struct			device_node *node = dev->of_node;
>  
>  	/*
>  	 * TWL core and pwr interrupts must be contiguous because
> @@ -691,8 +690,8 @@ int twl4030_init_irq(struct device *dev, int irq_num)
>  		return irq_base;
>  	}
>  
> -	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
> -				 &irq_domain_simple_ops, NULL);
> +	irq_domain_create_legacy(of_fwnode_handle(dev->of_node), nr_irqs,
> +				 irq_base, 0, &irq_domain_simple_ops, NULL);
>  
>  	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
>  
> 
> ---
> base-commit: c63e393a16c9c4cf8c9b70fedf9f27b442874ef2
> change-id: 20250508-mfd-fix-unused-node-variables-14fe4f2cfd6c
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

