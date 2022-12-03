Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541DD64177A
	for <lists+linux-omap@lfdr.de>; Sat,  3 Dec 2022 16:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiLCPRs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 3 Dec 2022 10:17:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiLCPRr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 3 Dec 2022 10:17:47 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0537C626A
        for <linux-omap@vger.kernel.org>; Sat,  3 Dec 2022 07:17:44 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id ay27-20020a05600c1e1b00b003d070f4060bso6603200wmb.2
        for <linux-omap@vger.kernel.org>; Sat, 03 Dec 2022 07:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tC4AheAOygD5Q+8OaSRfrmV/Z8V9M2yBmfT77mic4IA=;
        b=2uXNojJDIOyZcRSv4GU2d1wtFAm4dTj02+YaQewJI82Iu4F5soQahgOVbCFagTM0dH
         E0qRODpK/X44WTXmgtr1vljGIccJOdpewRedtzh5UPnMVrj4NcHIN3EzWG4WFtPIknMg
         VQblmEAahw5G6wWcPu5tOH9Mc3CQxo0HGpxwb1QN4LqYuP475bK6/vRZUUp3PxiOY9D9
         oc16MsJyhIFpnCYKrJ+X71if5PxTUPAe2Pm5khukhWdKbPfoel6s+dcoVA7YyWHkPPP/
         03H9A3KYQC+rvg62WoTpTjHZIyb/DqCwevwcfkqGnsKjSJ/RX5VSdwPpCrrMhgsgMFfZ
         HTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tC4AheAOygD5Q+8OaSRfrmV/Z8V9M2yBmfT77mic4IA=;
        b=s37NKiC5oPsE9rCEZSj9hwtom6Q+RYuVU0CNw9Om83o6quR1jI0uGpTCtSbk1k4+lJ
         qUC3CpF/LAQIcU2T8ZfR5dWZgV8Ewz+W9Bk3pMDQySU8Wdh7+LVE33K/4OEcMupJKHu2
         bJai6gUvn+vi5cYXNPUp/cJOYlJLCKcu74y2WlSmu5jUnv5IhPyPfHbukRyc85oeoDW0
         YEnaBfgzgm0T4ze+aHMiMCoadabj8TyVMHxtCby738/zo0IfVUDeaix76GULQbRYkNHE
         ShPlAcGJgLbUfg3aW6UqMVBz8oFz4+O7mwBHpBHUJ+sPAShcRCeHNSu4SNQzge7M3xaq
         8j3g==
X-Gm-Message-State: ANoB5plCejo8cZOYHHpkbOPpEmodVS+ClmgBpAK8jqswKd4cTfuV+JDP
        FPtPh3COk/Ms/htl5JrxVGt2WCbL0NBsFfeg
X-Google-Smtp-Source: AA0mqf4ifsFZORfnBS5P9rWVGjWkrrUc+jpAlb3Y/L7t3lfpxZuKSVdzEPhk75h65dtPe8H3tAWhng==
X-Received: by 2002:a05:600c:1e89:b0:3cf:774b:ce6f with SMTP id be9-20020a05600c1e8900b003cf774bce6fmr11445571wmb.133.1670080662078;
        Sat, 03 Dec 2022 07:17:42 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b003b50428cf66sm13364063wms.33.2022.12.03.07.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 07:17:41 -0800 (PST)
Message-ID: <a9466cd9-2a75-6b53-3d57-6a6cdabd1b05@smile.fr>
Date:   Sat, 3 Dec 2022 16:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] serial: 8250: omap: Fix missing PM runtime calls for
 omap8250_set_mctrl()
Content-Language: fr
To:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
References: <20221024063613.25943-1-tony@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20221024063613.25943-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 24/10/2022 à 08:36, Tony Lindgren a écrit :
> There are cases where omap8250_set_mctrl() may get called after the
> UART has already autoidled causing an asynchronous external abort.
> 
> This can happen on ttyport_open():
> 
> mem_serial_in from omap8250_set_mctrl+0x38/0xa0
> omap8250_set_mctrl from uart_update_mctrl+0x4c/0x58
> uart_update_mctrl from uart_dtr_rts+0x60/0xa8
> uart_dtr_rts from tty_port_block_til_ready+0xd0/0x2a8
> tty_port_block_til_ready from uart_open+0x14/0x1c
> uart_open from ttyport_open+0x64/0x148
> 
> And on ttyport_close():
> 
> omap8250_set_mctrl from uart_update_mctrl+0x3c/0x48
> uart_update_mctrl from uart_dtr_rts+0x54/0x9c
> uart_dtr_rts from tty_port_shutdown+0x78/0x9c
> tty_port_shutdown from tty_port_close+0x3c/0x74
> tty_port_close from ttyport_close+0x40/0x58
> 
> It can also happen on disassociate_ctty() calling uart_shutdown()
> that ends up calling omap8250_set_mctrl().
> 
> Let's fix the issue by adding missing PM runtime calls to
> omap8250_set_mctrl(). To do this, we need to add __omap8250_set_mctrl()
> that can be called from both omap8250_set_mctrl(), and from runtime PM
> resume path when restoring the registers.

Sorry, I'm late but I confirm that this patch fixes my issue [1].

I checked without this patch applied with the 5.10.153-rt76+ kernel and I can
reproduce the issue.

Tested-by: Romain Naour <romain.naour@smile.fr>

[1] https://marc.info/?l=linux-omap&m=164398186306233&w=2

Best regards,
Romain


> 
> Fixes: 61929cf0169d ("tty: serial: Add 8250-core based omap driver")
> Depends-on: dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> Reported-by: Merlijn Wajer <merlijn@wizzup.org>
> Reported-by: Romain Naour <romain.naour@smile.fr>
> Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/tty/serial/8250/8250_omap.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -157,7 +157,11 @@ static u32 uart_read(struct uart_8250_port *up, u32 reg)
>  	return readl(up->port.membase + (reg << up->port.regshift));
>  }
>  
> -static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
> +/*
> + * Called on runtime PM resume path from omap8250_restore_regs(), and
> + * omap8250_set_mctrl().
> + */
> +static void __omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  {
>  	struct uart_8250_port *up = up_to_u8250p(port);
>  	struct omap8250_priv *priv = up->port.private_data;
> @@ -181,6 +185,20 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  	}
>  }
>  
> +static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
> +{
> +	int err;
> +
> +	err = pm_runtime_resume_and_get(port->dev);
> +	if (err)
> +		return;
> +
> +	__omap8250_set_mctrl(port, mctrl);
> +
> +	pm_runtime_mark_last_busy(port->dev);
> +	pm_runtime_put_autosuspend(port->dev);
> +}
> +
>  /*
>   * Work Around for Errata i202 (2430, 3430, 3630, 4430 and 4460)
>   * The access to uart register after MDR1 Access
> @@ -341,7 +359,7 @@ static void omap8250_restore_regs(struct uart_8250_port *up)
>  
>  	omap8250_update_mdr1(up, priv);
>  
> -	up->port.ops->set_mctrl(&up->port, up->port.mctrl);
> +	__omap8250_set_mctrl(&up->port, up->port.mctrl);
>  
>  	if (up->port.rs485.flags & SER_RS485_ENABLED)
>  		serial8250_em485_stop_tx(up);

