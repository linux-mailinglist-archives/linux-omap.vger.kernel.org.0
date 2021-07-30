Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878D93DB76A
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 12:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238563AbhG3Kvj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Jul 2021 06:51:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:56594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238551AbhG3Kvc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Jul 2021 06:51:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34AED60F01;
        Fri, 30 Jul 2021 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627642288;
        bh=PAsvyDUJ7oXu+H+0ddRKT0jY1zLYdfOIU4gnmdpz9g8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ec8lBfEuqb60hZ0JgDC3UoZqK9+uzaWyfL5SwBvTWxt/Cm7nNjiYoxkbwIxqawKZK
         /1Da6H2GJ5A43mzGblsrxbxcddL7X9430Q3Gy0IVDgOwFGKMHAw87Hr8mRRbKwoek2
         rdfzs4+jXUbinQOG1MEd4FvVv7No59Gr030sWeNpbgD1r1A6+uJk+2YxTXdIuLV4EZ
         INAT1WCAirlc1ft+EtY/cy8kn4kZUQK4NDgT5XrhuQazXSWa0P/h4MLxbANAjTw7Iq
         jwFyNkHvOfG26e6W2JWcNAkof1+y2BQDoTk/YJdSOhUFdM1vjwPoPP6XB6y57RNhNc
         D20cble7FwH+Q==
Subject: Re: [PATCH 2/2] memory: omap-gpmc: Drop custom PM calls with cpu_pm
 notifier
To:     Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20210727101034.32148-1-tony@atomide.com>
 <20210727101034.32148-2-tony@atomide.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <18b8eb6f-0628-5202-b37c-c8ea665d3522@kernel.org>
Date:   Fri, 30 Jul 2021 13:51:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727101034.32148-2-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/07/2021 13:10, Tony Lindgren wrote:
> We can now switch over to using cpu_pm instead of custom calls and make
> the context save and restore functions static.
> 
> Let's also move the save and restore functions to avoid adding forward
> declarations for them. And get rid of the static data pointer while at it.
> 
> Cc: Roger Quadros <rogerq@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Roger Quadros <rogerq@kernel.org>

cheers,
-roger

> ---
>  arch/arm/mach-omap2/pm34xx.c |   5 -
>  drivers/memory/omap-gpmc.c   | 193 +++++++++++++++++++++--------------
>  include/linux/omap-gpmc.h    |   3 -
>  3 files changed, 118 insertions(+), 83 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/pm34xx.c b/arch/arm/mach-omap2/pm34xx.c
> --- a/arch/arm/mach-omap2/pm34xx.c
> +++ b/arch/arm/mach-omap2/pm34xx.c
> @@ -26,7 +26,6 @@
>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/omap-gpmc.h>
>  
>  #include <trace/events/power.h>
>  
> @@ -81,8 +80,6 @@ static void omap3_core_save_context(void)
>  
>  	/* Save the Interrupt controller context */
>  	omap_intc_save_context();
> -	/* Save the GPMC context */
> -	omap3_gpmc_save_context();
>  	/* Save the system control module context, padconf already save above*/
>  	omap3_control_save_context();
>  }
> @@ -91,8 +88,6 @@ static void omap3_core_restore_context(void)
>  {
>  	/* Restore the control module context, padconf restored by h/w */
>  	omap3_control_restore_context();
> -	/* Restore the GPMC context */
> -	omap3_gpmc_restore_context();
>  	/* Restore the interrupt controller context */
>  	omap_intc_restore_context();
>  }
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -9,6 +9,7 @@
>   * Copyright (C) 2009 Texas Instruments
>   * Added OMAP4 support - Santosh Shilimkar <santosh.shilimkar@ti.com>
>   */
> +#include <linux/cpu_pm.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> @@ -232,7 +233,10 @@ struct gpmc_device {
>  	int irq;
>  	struct irq_chip irq_chip;
>  	struct gpio_chip gpio_chip;
> +	struct notifier_block nb;
> +	struct omap3_gpmc_regs context;
>  	int nirqs;
> +	unsigned int is_suspended:1;
>  };
>  
>  static struct irq_domain *gpmc_irq_domain;
> @@ -2384,6 +2388,106 @@ static int gpmc_gpio_init(struct gpmc_device *gpmc)
>  	return 0;
>  }
>  
> +static void omap3_gpmc_save_context(struct gpmc_device *gpmc)
> +{
> +	struct omap3_gpmc_regs *gpmc_context;
> +	int i;
> +
> +	if (!gpmc || !gpmc_base)
> +		return;
> +
> +	gpmc_context = &gpmc->context;
> +
> +	gpmc_context->sysconfig = gpmc_read_reg(GPMC_SYSCONFIG);
> +	gpmc_context->irqenable = gpmc_read_reg(GPMC_IRQENABLE);
> +	gpmc_context->timeout_ctrl = gpmc_read_reg(GPMC_TIMEOUT_CONTROL);
> +	gpmc_context->config = gpmc_read_reg(GPMC_CONFIG);
> +	gpmc_context->prefetch_config1 = gpmc_read_reg(GPMC_PREFETCH_CONFIG1);
> +	gpmc_context->prefetch_config2 = gpmc_read_reg(GPMC_PREFETCH_CONFIG2);
> +	gpmc_context->prefetch_control = gpmc_read_reg(GPMC_PREFETCH_CONTROL);
> +	for (i = 0; i < gpmc_cs_num; i++) {
> +		gpmc_context->cs_context[i].is_valid = gpmc_cs_mem_enabled(i);
> +		if (gpmc_context->cs_context[i].is_valid) {
> +			gpmc_context->cs_context[i].config1 =
> +				gpmc_cs_read_reg(i, GPMC_CS_CONFIG1);
> +			gpmc_context->cs_context[i].config2 =
> +				gpmc_cs_read_reg(i, GPMC_CS_CONFIG2);
> +			gpmc_context->cs_context[i].config3 =
> +				gpmc_cs_read_reg(i, GPMC_CS_CONFIG3);
> +			gpmc_context->cs_context[i].config4 =
> +				gpmc_cs_read_reg(i, GPMC_CS_CONFIG4);
> +			gpmc_context->cs_context[i].config5 =
> +				gpmc_cs_read_reg(i, GPMC_CS_CONFIG5);
> +			gpmc_context->cs_context[i].config6 =
> +				gpmc_cs_read_reg(i, GPMC_CS_CONFIG6);
> +			gpmc_context->cs_context[i].config7 =
> +				gpmc_cs_read_reg(i, GPMC_CS_CONFIG7);
> +		}
> +	}
> +}
> +
> +static void omap3_gpmc_restore_context(struct gpmc_device *gpmc)
> +{
> +	struct omap3_gpmc_regs *gpmc_context;
> +	int i;
> +
> +	if (!gpmc || !gpmc_base)
> +		return;
> +
> +	gpmc_context = &gpmc->context;
> +
> +	gpmc_write_reg(GPMC_SYSCONFIG, gpmc_context->sysconfig);
> +	gpmc_write_reg(GPMC_IRQENABLE, gpmc_context->irqenable);
> +	gpmc_write_reg(GPMC_TIMEOUT_CONTROL, gpmc_context->timeout_ctrl);
> +	gpmc_write_reg(GPMC_CONFIG, gpmc_context->config);
> +	gpmc_write_reg(GPMC_PREFETCH_CONFIG1, gpmc_context->prefetch_config1);
> +	gpmc_write_reg(GPMC_PREFETCH_CONFIG2, gpmc_context->prefetch_config2);
> +	gpmc_write_reg(GPMC_PREFETCH_CONTROL, gpmc_context->prefetch_control);
> +	for (i = 0; i < gpmc_cs_num; i++) {
> +		if (gpmc_context->cs_context[i].is_valid) {
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG1,
> +					  gpmc_context->cs_context[i].config1);
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG2,
> +					  gpmc_context->cs_context[i].config2);
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG3,
> +					  gpmc_context->cs_context[i].config3);
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG4,
> +					  gpmc_context->cs_context[i].config4);
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG5,
> +					  gpmc_context->cs_context[i].config5);
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG6,
> +					  gpmc_context->cs_context[i].config6);
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7,
> +					  gpmc_context->cs_context[i].config7);
> +		} else {
> +			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7, 0);
> +		}
> +	}
> +}
> +
> +static int omap_gpmc_context_notifier(struct notifier_block *nb,
> +				      unsigned long cmd, void *v)
> +{
> +	struct gpmc_device *gpmc;
> +
> +	gpmc = container_of(nb, struct gpmc_device, nb);
> +	if (gpmc->is_suspended || pm_runtime_suspended(gpmc->dev))
> +		return NOTIFY_OK;
> +
> +	switch (cmd) {
> +	case CPU_CLUSTER_PM_ENTER:
> +		omap3_gpmc_save_context(gpmc);
> +		break;
> +	case CPU_CLUSTER_PM_ENTER_FAILED:	/* No need to restore context */
> +		break;
> +	case CPU_CLUSTER_PM_EXIT:
> +		omap3_gpmc_restore_context(gpmc);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  static int gpmc_probe(struct platform_device *pdev)
>  {
>  	int rc;
> @@ -2472,6 +2576,9 @@ static int gpmc_probe(struct platform_device *pdev)
>  
>  	gpmc_probe_dt_children(pdev);
>  
> +	gpmc->nb.notifier_call = omap_gpmc_context_notifier;
> +	cpu_pm_register_notifier(&gpmc->nb);
> +
>  	return 0;
>  
>  gpio_init_failed:
> @@ -2486,6 +2593,7 @@ static int gpmc_remove(struct platform_device *pdev)
>  {
>  	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
>  
> +	cpu_pm_unregister_notifier(&gpmc->nb);
>  	gpmc_free_irq(gpmc);
>  	gpmc_mem_exit();
>  	pm_runtime_put_sync(&pdev->dev);
> @@ -2497,15 +2605,23 @@ static int gpmc_remove(struct platform_device *pdev)
>  #ifdef CONFIG_PM_SLEEP
>  static int gpmc_suspend(struct device *dev)
>  {
> -	omap3_gpmc_save_context();
> +	struct gpmc_device *gpmc = dev_get_drvdata(dev);
> +
> +	omap3_gpmc_save_context(gpmc);
>  	pm_runtime_put_sync(dev);
> +	gpmc->is_suspended = 1;
> +
>  	return 0;
>  }
>  
>  static int gpmc_resume(struct device *dev)
>  {
> +	struct gpmc_device *gpmc = dev_get_drvdata(dev);
> +
>  	pm_runtime_get_sync(dev);
> -	omap3_gpmc_restore_context();
> +	omap3_gpmc_restore_context(gpmc);
> +	gpmc->is_suspended = 0;
> +
>  	return 0;
>  }
>  #endif
> @@ -2527,76 +2643,3 @@ static __init int gpmc_init(void)
>  	return platform_driver_register(&gpmc_driver);
>  }
>  postcore_initcall(gpmc_init);
> -
> -static struct omap3_gpmc_regs gpmc_context;
> -
> -void omap3_gpmc_save_context(void)
> -{
> -	int i;
> -
> -	if (!gpmc_base)
> -		return;
> -
> -	gpmc_context.sysconfig = gpmc_read_reg(GPMC_SYSCONFIG);
> -	gpmc_context.irqenable = gpmc_read_reg(GPMC_IRQENABLE);
> -	gpmc_context.timeout_ctrl = gpmc_read_reg(GPMC_TIMEOUT_CONTROL);
> -	gpmc_context.config = gpmc_read_reg(GPMC_CONFIG);
> -	gpmc_context.prefetch_config1 = gpmc_read_reg(GPMC_PREFETCH_CONFIG1);
> -	gpmc_context.prefetch_config2 = gpmc_read_reg(GPMC_PREFETCH_CONFIG2);
> -	gpmc_context.prefetch_control = gpmc_read_reg(GPMC_PREFETCH_CONTROL);
> -	for (i = 0; i < gpmc_cs_num; i++) {
> -		gpmc_context.cs_context[i].is_valid = gpmc_cs_mem_enabled(i);
> -		if (gpmc_context.cs_context[i].is_valid) {
> -			gpmc_context.cs_context[i].config1 =
> -				gpmc_cs_read_reg(i, GPMC_CS_CONFIG1);
> -			gpmc_context.cs_context[i].config2 =
> -				gpmc_cs_read_reg(i, GPMC_CS_CONFIG2);
> -			gpmc_context.cs_context[i].config3 =
> -				gpmc_cs_read_reg(i, GPMC_CS_CONFIG3);
> -			gpmc_context.cs_context[i].config4 =
> -				gpmc_cs_read_reg(i, GPMC_CS_CONFIG4);
> -			gpmc_context.cs_context[i].config5 =
> -				gpmc_cs_read_reg(i, GPMC_CS_CONFIG5);
> -			gpmc_context.cs_context[i].config6 =
> -				gpmc_cs_read_reg(i, GPMC_CS_CONFIG6);
> -			gpmc_context.cs_context[i].config7 =
> -				gpmc_cs_read_reg(i, GPMC_CS_CONFIG7);
> -		}
> -	}
> -}
> -
> -void omap3_gpmc_restore_context(void)
> -{
> -	int i;
> -
> -	if (!gpmc_base)
> -		return;
> -
> -	gpmc_write_reg(GPMC_SYSCONFIG, gpmc_context.sysconfig);
> -	gpmc_write_reg(GPMC_IRQENABLE, gpmc_context.irqenable);
> -	gpmc_write_reg(GPMC_TIMEOUT_CONTROL, gpmc_context.timeout_ctrl);
> -	gpmc_write_reg(GPMC_CONFIG, gpmc_context.config);
> -	gpmc_write_reg(GPMC_PREFETCH_CONFIG1, gpmc_context.prefetch_config1);
> -	gpmc_write_reg(GPMC_PREFETCH_CONFIG2, gpmc_context.prefetch_config2);
> -	gpmc_write_reg(GPMC_PREFETCH_CONTROL, gpmc_context.prefetch_control);
> -	for (i = 0; i < gpmc_cs_num; i++) {
> -		if (gpmc_context.cs_context[i].is_valid) {
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG1,
> -				gpmc_context.cs_context[i].config1);
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG2,
> -				gpmc_context.cs_context[i].config2);
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG3,
> -				gpmc_context.cs_context[i].config3);
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG4,
> -				gpmc_context.cs_context[i].config4);
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG5,
> -				gpmc_context.cs_context[i].config5);
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG6,
> -				gpmc_context.cs_context[i].config6);
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7,
> -				gpmc_context.cs_context[i].config7);
> -		} else {
> -			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7, 0);
> -		}
> -	}
> -}
> diff --git a/include/linux/omap-gpmc.h b/include/linux/omap-gpmc.h
> --- a/include/linux/omap-gpmc.h
> +++ b/include/linux/omap-gpmc.h
> @@ -81,9 +81,6 @@ extern int gpmc_configure(int cmd, int wval);
>  extern void gpmc_read_settings_dt(struct device_node *np,
>  				  struct gpmc_settings *p);
>  
> -extern void omap3_gpmc_save_context(void);
> -extern void omap3_gpmc_restore_context(void);
> -
>  struct gpmc_timings;
>  struct omap_nand_platform_data;
>  struct omap_onenand_platform_data;
> 
