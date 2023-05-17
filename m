Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C45707428
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 23:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjEQVYX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 17:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjEQVYX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 17:24:23 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699117ABF
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:24:04 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi [85.76.146.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QM5hJ4mJCz49Q3D;
        Thu, 18 May 2023 00:24:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1684358641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NvZS6YFcVrJw+fZX3QXj1KijDFwI8O7eFbW6/m22f+8=;
        b=dVNcFAXak1RbgrkbRxJyIn6uUQw0fG+gP7yBeDHl62FbdhkFE7KHDBHQhSIA//DC0dZ5sX
        IRpWlaEyMn4io/iBHt16tOtHziYLlgtLbyt2UOeANYvyHfXhh6zgEw/qUXL5pEaWJRI5f5
        C74SQmpw8iMu3ePYZ8RB/FZBVK674OAqYIvvcfMIfsJAg3k8pSlypiLXuedKqKIq61vKeO
        Al0ctsZUGPmT3ORLt4jdEvFpiqftHn7qLP0PgCmM8zRavY8tNmYqPM3uFZ3j0uWkRBYeUn
        Z3i949DS8DapZJtqzE/eDVL0H1AUvCxqoAmlQJCcV0qOUsMzTCE3A/yzJCcjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1684358641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NvZS6YFcVrJw+fZX3QXj1KijDFwI8O7eFbW6/m22f+8=;
        b=UIyn/Sbmtb4Q83FwPISm/EHEhNtv4ne0VLC505S7fd58ZiLVqute8FdDUcuXM4cQAbYqig
        XWI7slUqyeDNduiSK3Owo5FkZNowMrgxYgYRRwz5TXiNcK5938+I1MxpT3im4fkGEku16y
        vPvgrEy9KRT30mjE0CKNR1WNugNClDCWxgoLC0Q5cyd05LOy+s7W5tmbqSnxCBi70CB4s0
        AhSosLDnWlMcHMtMqcyunFagCiRWh1AVjVeA+CeHg2gNhebFF12rEvVCe361rkFSYHtIBl
        Lrcvi1zUlxC/+D/caY8ehTMjWLe91ILNFs9zUY15U869aGSnzucRSSo8JnRYEw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684358641; a=rsa-sha256;
        cv=none;
        b=su1/WkwO9p1/XIdqFqoob5sHzlHKQRVK6DmbFmbCBQiuzd8ZCdDt6gtL3C3oNelrcjXby3
        VyVNc8bjfGAMST6qnfKGj8b2Hi0zd3Bbjmmx1z728mDftw0vKqDU02DPCeQ8YBO8ZhTqs9
        XLK6HYomETZNgeNpeosgO12OQeiGr8rOxcjIGMQgf132YeWBaKHhUpfhWCxkp+hrP63Z1/
        3F3PJ6KUYsojwW7zBQP/NqOzZxqbI2ju82GX6nwwAgiNESxvtAvZUujLdywS5zxPqzRsvf
        CccbFJjf85VTm36iBH6KEO4zdXQwyGwwUaPVDyKB80BXxHKMjHuzenX/iDX+sA==
Date:   Thu, 18 May 2023 00:23:58 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] ARM: omap1: Make serial wakeup GPIOs use descriptors
Message-ID: <20230517212358.GK271152@darkstar.musicnaut.iki.fi>
References: <20230517210135.2138388-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517210135.2138388-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, May 17, 2023 at 11:01:35PM +0200, Linus Walleij wrote:
> The code in serial.c looks up GPIOs corresponding to a line
> on the UART when muxed in as GPIO to use this as a wakeup
> on serial activity for OMAP1.
> 
> Utilize the NULL device to define some board-specific
> GPIO lookups and use these to immediately look up the
> same GPIOs, set as input and convert to IRQ numbers,
> then set these to wakeup IRQs. This is ugly but should work.
> 
> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix missing comma
> - Push descriptors down to each boardfile NULL device GPIO
>   table
> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 14 +++++++++++++
>  arch/arm/mach-omap1/board-nokia770.c  |  7 +++++++
>  arch/arm/mach-omap1/board-osk.c       |  7 +++++++
>  arch/arm/mach-omap1/board-palmte.c    |  7 +++++++
>  arch/arm/mach-omap1/board-sx1.c       |  6 ++++++

This is omap16xx specific, so only 770 and osk need this.

A.

>  arch/arm/mach-omap1/serial.c          | 30 +++++++++++++--------------
>  6 files changed, 56 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index ac47ab9fe096..31c04ef78412 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -541,6 +541,19 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
>  	},
>  };
>  
> +static struct gpiod_lookup_table ams_delta_serial_wakeup_gpio_table = {
> +	.dev_id = NULL,
> +	.table = {
> +		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
> +			    GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
> +
>  static struct platform_device *ams_delta_devices[] __initdata = {
>  	&latch1_gpio_device,
>  	&latch2_gpio_device,
> @@ -558,6 +571,7 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
>  	&keybrd_pwr_gpio_table,
>  	&ams_delta_lcd_gpio_table,
>  	&ams_delta_nand_gpio_table,
> +	&ams_delta_serial_wakeup_gpio_table,
>  };
>  
>  /*
> diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
> index 9cca594d97c7..417861a25856 100644
> --- a/arch/arm/mach-omap1/board-nokia770.c
> +++ b/arch/arm/mach-omap1/board-nokia770.c
> @@ -293,6 +293,13 @@ static struct gpiod_lookup_table nokia770_irq_gpio_table = {
>  		/* GPIO used for tahvo IRQ */
>  		GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
>  			    GPIO_ACTIVE_HIGH),
> +		/* GPIOs used by serial wakeup IRQs */
> +		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
> +			    GPIO_ACTIVE_HIGH),
>  		{ }
>  	},
>  };
> diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
> index a8ca8d427182..463687b9ca52 100644
> --- a/arch/arm/mach-omap1/board-osk.c
> +++ b/arch/arm/mach-omap1/board-osk.c
> @@ -364,6 +364,13 @@ static struct gpiod_lookup_table osk_irq_gpio_table = {
>  		/* GPIO used by the TPS65010 chip */
>  		GPIO_LOOKUP("mpuio", 1, "tps65010",
>  			    GPIO_ACTIVE_HIGH),
> +		/* GPIOs used for serial wakeup IRQs */
> +		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
> +			    GPIO_ACTIVE_HIGH),
>  		{ }
>  	},
>  };
> diff --git a/arch/arm/mach-omap1/board-palmte.c b/arch/arm/mach-omap1/board-palmte.c
> index 49b7757cb2fd..b8ca63b9117e 100644
> --- a/arch/arm/mach-omap1/board-palmte.c
> +++ b/arch/arm/mach-omap1/board-palmte.c
> @@ -224,6 +224,13 @@ static struct gpiod_lookup_table palmte_irq_gpio_table = {
>  		/* GPIO used for USB or DC input detection */
>  		GPIO_LOOKUP("gpio-0-15", PALMTE_USB_OR_DC_GPIO, "usb_dc_irq",
>  			    GPIO_ACTIVE_HIGH),
> +		/* GPIOs used for serial wakeup IRQs */
> +		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
> +			    GPIO_ACTIVE_HIGH),
>  		{ }
>  	},
>  };
> diff --git a/arch/arm/mach-omap1/board-sx1.c b/arch/arm/mach-omap1/board-sx1.c
> index a13c630be7b7..2f03e1662815 100644
> --- a/arch/arm/mach-omap1/board-sx1.c
> +++ b/arch/arm/mach-omap1/board-sx1.c
> @@ -314,6 +314,12 @@ static struct gpiod_lookup_table sx1_gpio_table = {
>  			    GPIO_ACTIVE_HIGH),
>  		GPIO_LOOKUP("gpio-0-15", 15, "usb_on",
>  			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
> +			    GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
> +			    GPIO_ACTIVE_HIGH),
>  		{ }
>  	},
>  };
> diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
> index c7f590645774..3adceb97138f 100644
> --- a/arch/arm/mach-omap1/serial.c
> +++ b/arch/arm/mach-omap1/serial.c
> @@ -4,7 +4,8 @@
>   *
>   * OMAP1 serial support.
>   */
> -#include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> @@ -196,39 +197,38 @@ void omap_serial_wake_trigger(int enable)
>  	}
>  }
>  
> -static void __init omap_serial_set_port_wakeup(int gpio_nr)
> +static void __init omap_serial_set_port_wakeup(int idx)
>  {
> +	struct gpio_desc *d;
>  	int ret;
>  
> -	ret = gpio_request(gpio_nr, "UART wake");
> -	if (ret < 0) {
> -		printk(KERN_ERR "Could not request UART wake GPIO: %i\n",
> -		       gpio_nr);
> +	d = gpiod_get_index(NULL, "wakeup", idx, GPIOD_IN);
> +	if (IS_ERR(d)) {
> +		pr_err("Unable to get UART wakeup GPIO descriptor\n");
>  		return;
>  	}
> -	gpio_direction_input(gpio_nr);
> -	ret = request_irq(gpio_to_irq(gpio_nr), &omap_serial_wake_interrupt,
> +	ret = request_irq(gpiod_to_irq(d), &omap_serial_wake_interrupt,
>  			  IRQF_TRIGGER_RISING, "serial wakeup", NULL);
>  	if (ret) {
> -		gpio_free(gpio_nr);
> -		printk(KERN_ERR "No interrupt for UART wake GPIO: %i\n",
> -		       gpio_nr);
> +		gpiod_put(d);
> +		pr_err("No interrupt for UART%d wake GPIO\n", idx + 1);
>  		return;
>  	}
> -	enable_irq_wake(gpio_to_irq(gpio_nr));
> +	enable_irq_wake(gpiod_to_irq(d));
>  }
>  
> +
>  int __init omap_serial_wakeup_init(void)
>  {
>  	if (!cpu_is_omap16xx())
>  		return 0;
>  
>  	if (uart1_ck != NULL)
> -		omap_serial_set_port_wakeup(37);
> +		omap_serial_set_port_wakeup(0);
>  	if (uart2_ck != NULL)
> -		omap_serial_set_port_wakeup(18);
> +		omap_serial_set_port_wakeup(1);
>  	if (uart3_ck != NULL)
> -		omap_serial_set_port_wakeup(49);
> +		omap_serial_set_port_wakeup(2);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
