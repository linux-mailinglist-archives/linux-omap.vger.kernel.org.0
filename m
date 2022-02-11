Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E87C4B22D5
	for <lists+linux-omap@lfdr.de>; Fri, 11 Feb 2022 11:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345234AbiBKKLR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Feb 2022 05:11:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242917AbiBKKLQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Feb 2022 05:11:16 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8782E93
        for <linux-omap@vger.kernel.org>; Fri, 11 Feb 2022 02:11:13 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o34so1356747wms.1
        for <linux-omap@vger.kernel.org>; Fri, 11 Feb 2022 02:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R9SHkGVCcbQA/7qjsir4Xc8LMt5uiOwUMIv0Rj3E3lY=;
        b=eQom3ACIcGPjR3XkZHLhQF3mgCwr5h2+IrNSrqJgeDbBAWpOP7CvvzQBLhFequz4l6
         ANrz9Ql+/8CbViVORE56CTvQGza+3kaS1ogLonDph67BwDV2CjqnMbg2fwJeG+Mcgi9D
         1IKUrkg3M3KA1mDT2YSRQW/gQ++wMkE6xjfBk2Wq0ys9SQfv8BW4FKB7655VBAElfiA8
         5rrrKMoS7VyB2n/ZAKgBTPUwzTFX5nECergwTaBbupio0/t9iCeX/VvnmsXhxc4W7LkN
         Ob8xvqSkGQjFnYGQk4Qeq9Ha3BB8rD9GyHx801t1cp50WESiI4ICuWpcU0etDD0sodlL
         XPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R9SHkGVCcbQA/7qjsir4Xc8LMt5uiOwUMIv0Rj3E3lY=;
        b=i9oxpTbiBsV+X9m2KXmeowMTDNokdwbCLqommGsWb30z3qpaJ03JYocEPIOoB04ORy
         cdefSjzQXDp2bUfkIaAmhfT/YYixqZFe3v67Nir3M0z/6GrFShaXGoRFicgib6byAKSj
         mSa1zXovlsi6i31St/z4sA+hxeMW1oZMCc9omKVCAqbkbhQEaWCsPWPJjLWUp9pNKD/x
         39EvPP5hw2By0YFRT2JPjXhCr9u0WIj0thvw2UijyOOSL01OOw56OUsoYh4yshvsmQil
         iU6atsGiwK7fiU/0fRFHfFdlYtBRbs3H9pbsPOM/RoUFAuUEkyUSaszjLFnrZ0eEzFzX
         QBmg==
X-Gm-Message-State: AOAM532dO3EFrMe01Ln5a/slov1N0FkmV8bhoB4hJhg+HUxv8NYaWZ8G
        VITo4AdNCANe7SE7kbbEsM+9KIHNkq/GHw==
X-Google-Smtp-Source: ABdhPJxxNjpC96itpT6SvsQn01dSm7QRblofTVSYhb+BOLTxsTvxugtIDL54kUL2dMBumBbYPXCqbQ==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id l11mr1584109wmq.126.1644574272034;
        Fri, 11 Feb 2022 02:11:12 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id u11sm17344277wrt.108.2022.02.11.02.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 02:11:11 -0800 (PST)
Message-ID: <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
Date:   Fri, 11 Feb 2022 11:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: AM5749: tty serial 8250 omap driver crash
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <YgT/fhpFQfkj1b0j@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 10/02/2022 à 13:05, Tony Lindgren a écrit :
> Hi,
> 
> * Romain Naour <romain.naour@smile.fr> [220209 09:13]:
>> Le 07/02/2022 à 09:04, Tony Lindgren a écrit :
>>> Interesting, what's the exception you get with the -rt kernel? Is it an
>>> unhandled external abort or something else?
>>
>> "asynchronous external abort"
> 
> OK
> 
>> Maybe there is something wrong with the smart-standby or smart-idle feature in
>> the UART IP ? I'm not sure.
> 
> Could be that too, but maybe it's as simple as the patch below. Care to
> give it a try?

The serial console stop working during the kernel boot with this patch applied.

> 
>> Are you able to reproduce it ?
>> Maybe on a IDK574 or a Beaglebone-AI board ?
> 
> Not sure why I'm not seeing this one with my test systems.. Have not tried
> with the RT patches for a while though.

The RT patches really makes a difference here.

> 
> Regards,
> 
> Tony
> 
> 8< -------
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -163,6 +163,8 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  	struct omap8250_priv *priv = up->port.private_data;
>  	u8 lcr;
>  
> +	pm_runtime_get_sync(port->dev);
> +
>  	serial8250_do_set_mctrl(port, mctrl);
>  
>  	if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
> @@ -179,6 +181,9 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  		serial_out(up, UART_EFR, priv->efr);
>  		serial_out(up, UART_LCR, lcr);
>  	}
> +
> +	pm_runtime_mark_last_busy(port->dev);
> +	pm_runtime_put_autosuspend(port->dev);

This suspend the serial debug console on uart3.

Best regards,
Romain


>  }
>  
>  /*

