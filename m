Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7195F4B8CE6
	for <lists+linux-omap@lfdr.de>; Wed, 16 Feb 2022 16:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbiBPPwI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Feb 2022 10:52:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiBPPwI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Feb 2022 10:52:08 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228349FB5B
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 07:51:54 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o34so1492194wms.1
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 07:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oBxCCgM0lrbhINEl74Cy2jNM7deMR7Vt3YT8Bi6x5nQ=;
        b=o/y2KdeO+51BmrtqMG2y5NSn58ACKwcHCrCLR+ydr/NTKw3GILkHJhqLtECTi5XfNV
         ASaSgeCM16l522c/IvKdbP4qBDm0AZvpJmT0azfsKbAFLHO+n2CnzrZtWoxgjTi9wbCb
         QagPR9TrtX1j5tqb3LxLzU64YUj+J7R+qq/Nlw1K2tCbiI9dzIv0N1pkm5JUeb81jU6k
         Bo6dLPWx/SMdYcM8x4RFeBQfZMVqes4zF7al4yLdoaL2PbL89P3kGVy2MHLkBTu6Ievy
         PwWiieYBJEl74DJ3jd2eAP6XY7pSWvDHfJKumzxAAKvqqwoF8+V82R889F3hOjDtq82X
         3tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oBxCCgM0lrbhINEl74Cy2jNM7deMR7Vt3YT8Bi6x5nQ=;
        b=UToqNMPf4QfIQWS7cRG7n1YnIxmKHZj+PhjUnWhu8mb18yuo/VCFuXM8LJ+ErLu/jn
         jINCeDoY0HSqK4cji5Wsqk+HyXZORK+YOXEk1sXBwnaT/pxdmgU2VqUG75DOrvgCo49Z
         X5EXrbSIGwfWmmRWfxVWBDEgZo6W6tLwWqGfbhF1SRCCiNUHv7cktHQm9O5UDSXZ9uy0
         50zNNcscCVPuidMv9zWZDrVvIQgw6gVNxHaX+5o+pJnYvmWUJjtMUv00tgQ9ehwnT9ok
         VvGdu+XpcepSjQz6VWN5pdlEo0cHIjfmUL+zDlwVnT1Nelwf0flAB9BaC62J7E+wxmSv
         Z/8w==
X-Gm-Message-State: AOAM533RDPCoza6U7jGOnHHdCScN5Fx+9X8l/RVtHlFZUFSaSYIapL7g
        zuygQmr6u9Okk4NzqHBRUsHzRyE8Vjcfaw==
X-Google-Smtp-Source: ABdhPJxpRuwDxPS2UyqCgUOYRfp45Zc8ccTr2lvmaHb0Ay2cx67Pk5k1cOgb6uVn7/+rQm6OYbVo5Q==
X-Received: by 2002:a1c:26c3:0:b0:37b:b566:4c46 with SMTP id m186-20020a1c26c3000000b0037bb5664c46mr2251704wmm.42.1645026712628;
        Wed, 16 Feb 2022 07:51:52 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id b16sm21811301wmj.32.2022.02.16.07.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 07:51:52 -0800 (PST)
Message-ID: <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
Date:   Wed, 16 Feb 2022 16:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: AM5749: tty serial 8250 omap driver crash
Content-Language: fr
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com> <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <YgzkLjWwIlm9/SiK@atomide.com>
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

Le 16/02/2022 à 12:46, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [220216 09:04]:
>> Hello,
>>
>> Le 14/02/2022 à 14:08, Tony Lindgren a écrit :
>>> * Tony Lindgren <tony@atomide.com> [220214 07:43]:
>>>> Looks like the following script to just toggle the module state locks
>>>> up things for me on beagle-x15 very fast. So yeah now I'm able to
>>>> reproduce the issue. Seems like the module is not ready right after
>>>> enabling it live we've seen for dra7 iva for example.
>>>
>>> Looks like the following patch is also needed for uarts to avoid unbind
>>> clock_unprepare warnings. But even with this patch dra7 uarts won't behave.
>>> On unbind, there will be a clock "l4per-clkctrl:0128:0: failed to disable"
>>> warning. Looks like after that any following clock enable does not seem to
>>> work and that will cause the register access errors.
>>>
>>> Looks like this is a dra7 specific issue as a similar test script on omap4
>>> duovero keeps on going instead.
>>
>> Thanks for the help and the patch!
>>
>> I removed my patch removing the quirk and applied you patch but I can still
>> reproduce the issue.
> 
> Yeah issues still exists for sure, looks like also omap4 fails but it just
> takes a while to produce the clkctrl disable error. And remove for 8250_omap
> is incomplete..

Ok.
> 
> Below is a patch that makes the rebind of kernel serial console behave for me
> together with the ti-sysc patch.
> 
> Additionally I also need to disable dma for now with:
> 
> &uart3 {
> 	/delete-property/ dma-names;
> };

On my side I'm using uart4 but I don't think it makes a difference.

> 
>> Do you need some info about the kernel configuration?
> 
> Not really but if you can please test again with the ti-sysc patch,
> 8250_omap patch and with your serdev uart dma disabled with
> delete-property?

I had a crash but on close path:

[<c06af3b0>] (omap8250_set_mctrl) from [<c069fd38>] (uart_update_mctrl+0x3c/0x48)
[<c069fd38>] (uart_update_mctrl) from [<c06a2ac8>] (uart_dtr_rts+0x54/0x9c)
[<c06a2ac8>] (uart_dtr_rts) from [<c068b0d0>] (tty_port_shutdown+0x78/0x9c)
[<c068b0d0>] (tty_port_shutdown) from [<c068b8ec>] (tty_port_close+0x3c/0x74)
[<c068b8ec>] (tty_port_close) from [<c06b3b4c>] (ttyport_close+0x40/0x58)
[<c06b3b4c>] (ttyport_close) from [<c092aca4>] (gnss_serial_close+0x14/0x24)
[<c092aca4>] (gnss_serial_close) from [<c092a4a0>] (gnss_release+0x44/0x64)
[<c092a4a0>] (gnss_release) from [<c036b7f4>] (__fput+0x78/0x23c)
[<c036b7f4>] (__fput) from [<c0246308>] (task_work_run+0x90/0xbc)
[<c0246308>] (task_work_run) from [<c0209c0c>] (do_work_pending+0x558/0x560)
[<c0209c0c>] (do_work_pending) from [<c02000cc>] (slow_work_pending+0xc/0x20)

My test is starting gpsmon /dev/gnss0 several time.

I hope it help.

Best regards,
Romain


> 
> Regards,
> 
> Tony
> 
> 8< -----------------
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -1475,10 +1475,15 @@ static int omap8250_probe(struct platform_device *pdev)
>  static int omap8250_remove(struct platform_device *pdev)
>  {
>  	struct omap8250_priv *priv = platform_get_drvdata(pdev);
> +	struct uart_8250_port *up = serial8250_get_port(priv->line);
>  
> +	pm_runtime_resume_and_get(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	cancel_work_sync(&priv->qos_work);
> +	cancel_delayed_work(&up->overrun_backoff);
>  	serial8250_unregister_port(priv->line);
>  	cpu_latency_qos_remove_request(&priv->pm_qos_request);
>  	device_init_wakeup(&pdev->dev, false);

