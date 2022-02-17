Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E63F4B9BC0
	for <lists+linux-omap@lfdr.de>; Thu, 17 Feb 2022 10:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237015AbiBQJKK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Feb 2022 04:10:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbiBQJKK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Feb 2022 04:10:10 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D7426A2E6
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 01:09:55 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d27so7771291wrc.6
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 01:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zoJLI55kaCsTwF7YsIHfwxds8VRhQWNth+sVLeft3Mo=;
        b=dgmQhcNY8mxOd6c3zM9YekWpYLkAiJ6aDW4ll5nqWtrnRCZe4jV06EgKLpl8HJnWaQ
         +INT3HbCqQAg+mByuLAM3ASe30orPXciP3Ilwda2NuLCsZjddZtQYFs1mD54ol0yCo++
         Bizo8zKC985TVDGu/JIrqIxSsGRa4lyGEal1immdhFAxoSfea9fI907lhQEZQk7P55Rj
         HNMBnET7QE2E23ESNPaIbjXUVqFlhf9fDYFwQA+f5JQQBTxH7lFYluR+/rPlWvjYvlUz
         IsFtRTacz188NCw82TWsBNuSQlwDfO+eL2JxyPSZn5M31vtUDQyigb4fs3w5qq/KEsXb
         veWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zoJLI55kaCsTwF7YsIHfwxds8VRhQWNth+sVLeft3Mo=;
        b=w0PTPDX5n6eSnbSNO6mTroTvmZP3Yq/z8brTJ6PQTZeNbpvjbB6Z4edLp+I0HylkNY
         byCw2nQJpPbvlBB7fNKVCMltOCxwMzUuL163hr9i6Sys72BL2m1Zeiki3oORSmUEVpUb
         58nu2EverYeIn820+vibEGAkLZHDIKL1n12KrTN0uTi9WjxCF3q/qNybgK5sS0cFPGjN
         GJnRDkTq3a6UXCdFvfMDnvznv0/rR8vyMUSjwBXRXBOOSjjb0qsPy/VM+K6IQnyXfpTX
         DN9fkC7nQi1pI2bnJcCnqK6+dkL+UHJlIAHWKzlKSc+5e58FkvwDC0o2T54it5oLRHQT
         vDUg==
X-Gm-Message-State: AOAM530uBdwqtq+SUFj4HgKSvfZepmFDN1zXA8MvcExzqG7+IVZjWrmg
        4pxM0noc9oMb6K6V2B9YK67egQ==
X-Google-Smtp-Source: ABdhPJwWveiGdeyvSuy/h/VPv9tpAuXRq4AfIdCtgeYSledJktExt93I70GNSu9Qcs1ZLbPC6PY7QQ==
X-Received: by 2002:adf:f2cb:0:b0:1e4:bd07:ed68 with SMTP id d11-20020adff2cb000000b001e4bd07ed68mr1492770wrp.306.1645088993656;
        Thu, 17 Feb 2022 01:09:53 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id l31sm711207wms.0.2022.02.17.01.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 01:09:53 -0800 (PST)
Message-ID: <77a24941-4c46-8d78-391a-d3d1018f311a@smile.fr>
Date:   Thu, 17 Feb 2022 10:09:52 +0100
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
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com> <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
 <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
 <Yg4CZb1Jy2M8wwn/@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <Yg4CZb1Jy2M8wwn/@atomide.com>
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

Le 17/02/2022 à 09:08, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [220216 15:51]:
>> Le 16/02/2022 à 12:46, Tony Lindgren a écrit :
>>> Not really but if you can please test again with the ti-sysc patch,
>>> 8250_omap patch and with your serdev uart dma disabled with
>>> delete-property?
>>
>> I had a crash but on close path:
>>
>> [<c06af3b0>] (omap8250_set_mctrl) from [<c069fd38>] (uart_update_mctrl+0x3c/0x48)
>> [<c069fd38>] (uart_update_mctrl) from [<c06a2ac8>] (uart_dtr_rts+0x54/0x9c)
>> [<c06a2ac8>] (uart_dtr_rts) from [<c068b0d0>] (tty_port_shutdown+0x78/0x9c)
>> [<c068b0d0>] (tty_port_shutdown) from [<c068b8ec>] (tty_port_close+0x3c/0x74)
>> [<c068b8ec>] (tty_port_close) from [<c06b3b4c>] (ttyport_close+0x40/0x58)
>> [<c06b3b4c>] (ttyport_close) from [<c092aca4>] (gnss_serial_close+0x14/0x24)
>> [<c092aca4>] (gnss_serial_close) from [<c092a4a0>] (gnss_release+0x44/0x64)
>> [<c092a4a0>] (gnss_release) from [<c036b7f4>] (__fput+0x78/0x23c)
>> [<c036b7f4>] (__fput) from [<c0246308>] (task_work_run+0x90/0xbc)
>> [<c0246308>] (task_work_run) from [<c0209c0c>] (do_work_pending+0x558/0x560)
>> [<c0209c0c>] (do_work_pending) from [<c02000cc>] (slow_work_pending+0xc/0x20)
>>
>> My test is starting gpsmon /dev/gnss0 several time.
> 
> OK sounds like a good test.
> 
> We can have two kind of issues, either runtime PM is not enabled, or
> runtime PM is enabled but the uart registers have not been yet inialized.

I'm using ARCH_OMAP2PLUS_TYPICAL, so at least CONFIG_PM is selected.

> 
> On probe, omap8250_set_mctrl() can get called with runtime PM enabled, but
> without omap8250_restore_regs() having been called yet. It seems we rely
> on a bootloader initialized uart register state here currently.

On u-boot devicetree the uart4 node is missing, but we don't plan to use the gps
from uboot :)
Should I add the uart4 node?

> 
> We don't have omap8250_restore_regs() called on probe until at
> omap_8250_set_termios(). But before we alread have this:
> 
> uart_add_one_port()
>   uart_configure_port()
>     omap8250_set_mctrl()
> 
> So that explains at least some issues. I'll take a look at what's the best
> way to fix this.
> 
> I'm not quite sure why enabling dma on dra7 causes the clk disable errors,
> maybe it's related to priv->delayed_restore set in some cases. Or some
> different uart register init for dma.
> 
> For your issue with close, I wonder if it's related to autoidling the uarts?

Since removing the uart quirk had some other side effect, I did a shameless hack
in 8250_omap.c to disable autosuspend.

-	pm_runtime_put_autosuspend(port->dev);
+	pm_runtime_dont_use_autosuspend(port->dev);

With that the uart is always up and running.

> The test script I posted does that for all the uarts, probably best not
> to do that until the other issues are sorted out :) If so, maybe the issue
> on close is that the uart has already autoidled.

Indeed. But I'm not sure why the autosuspend is enabled by default?

Best regards,
Romain

> 
> Regards,
> 
> Tony

