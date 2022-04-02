Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F414F0062
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 12:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbiDBKRk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 06:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiDBKRj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 06:17:39 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13E61A8C15
        for <linux-omap@vger.kernel.org>; Sat,  2 Apr 2022 03:15:46 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso2794167wml.5
        for <linux-omap@vger.kernel.org>; Sat, 02 Apr 2022 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XSmrmCqv7JvnAGZF2beI3ID/v9DbpyxJzGmC94Doqcw=;
        b=FVVJdlxeIK/HBqQOhoENiqR0u3W17/mf4JJ/fQx6apWoiwTP5DJiP6zJDWLW2/rTme
         CXWsgIFeSU1xhoDSRGpm97+R2E2pIlmn5TpeK12Fkmy9g3+ykQj2DKOX+nU/JMTXoMb9
         b6hsxj9AY3n/KskEoPsZGsOn/dK+usNp5wqDKilre1Tmbw6sct0LgCBBKgmTXxTyD1ZD
         ZH0GIxJbyqe3MuiB7kscAQbwq8FpwJk2/07hNRsorEfRor0kAZBZJmFQSwSL46qZDnGp
         wMQMdXxSxgsnaxvRxZ70LyKFVUTnAabh4CBshVgySdohAKReGiwi+v88qIRA3/svjY1M
         xv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XSmrmCqv7JvnAGZF2beI3ID/v9DbpyxJzGmC94Doqcw=;
        b=4nQe5GuAajCWmqEcIJ+faLeYBTk7VDl+2OWP5ib91/+33/yjAYgZcIuzv6jBHUX1R2
         oq+b52lChU9e6V4HbvDDz4Mnd1kozknVvOqLo2VyX5l4cLmvmmkEIBpqITXzI92Z34AP
         zbBG5m7wgXkhgzV2OFM0Y5FtsByFHax06J9Q5uY3jU4Pphkdxt3TEp1ZLynbCvYfOzNQ
         c9Nl7XRnw75T1yoaUtq83jLDCLW2haPzk5rdPJn5evsskcFnOPColXuSdr2sw8PtPN68
         4itwsqlzHGXgQomBwmTkepAsVzyAbM6l6F8MzIN53HY0KfXXtFyyNG1Y/hAgdHeS1nFo
         88Zg==
X-Gm-Message-State: AOAM530mlh/DmR2fiDX5MHZPk67bQ40tk0DTa7JWsPrQzVcStY0f+gFf
        Fx6e/9Hjimg6USGS/M2ycAUiwIZ2tDVMvw==
X-Google-Smtp-Source: ABdhPJxCcL0EwciPZGNFzNXbE7w45VSMhNros2F8BOb50DEnIlV5UVda3WrFXgxrqzWTbgvgT1QXGw==
X-Received: by 2002:a05:600c:5108:b0:38e:617d:80b8 with SMTP id o8-20020a05600c510800b0038e617d80b8mr2139998wms.65.1648894545145;
        Sat, 02 Apr 2022 03:15:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id t4-20020adfe104000000b00205b50f04f0sm4223243wrz.86.2022.04.02.03.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 03:15:44 -0700 (PDT)
Message-ID: <2d192056-4977-9e2e-f661-23e05e2a6584@smile.fr>
Date:   Sat, 2 Apr 2022 12:15:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: AM5749: tty serial 8250 omap driver crash
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com> <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
 <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
 <Yg4CZb1Jy2M8wwn/@atomide.com>
 <77a24941-4c46-8d78-391a-d3d1018f311a@smile.fr>
 <Yg5GdIp5Glp9p/G5@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <Yg5GdIp5Glp9p/G5@atomide.com>
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

Hello Tony,

Sorry for the delay.

Le 17/02/2022 à 13:58, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [220217 09:09]:
>> On u-boot devicetree the uart4 node is missing, but we don't plan to use the gps
>> from uboot :)
>> Should I add the uart4 node?
> 
> There should be no need for that, kernel should be able to initialize it
> properly no matter what the state is from the bootloader.

ok

> 
>> Since removing the uart quirk had some other side effect, I did a shameless hack
>> in 8250_omap.c to disable autosuspend.
>>
>> -	pm_runtime_put_autosuspend(port->dev);
>> +	pm_runtime_dont_use_autosuspend(port->dev);
>>
>> With that the uart is always up and running.
> 
> Yes but note that 8250_omap autosuspend does not do anything unless the
> timeouts are manually enabled by the userspace. They are initialized to -1
> during probe.

Actually it's not initialized to -1 on my board, it's initialized to 0. See
commit [1].

I'm starting to think that is an issue when the 8250_omap driver is used with
another driver like the gnss serial driver (using a serdev driver).

Since the commit [1] there is no autosuspend delay at all, I would suggest to
add a default autosuspend delay value. I tested with 200ms based on another example.

diff --git a/drivers/tty/serial/8250/8250_omap.c
b/drivers/tty/serial/8250/8250_omap.c
index ec7304d57f5f..8ba830bd493a 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -108,6 +108,9 @@
 /* RX FIFO occupancy indicator */
 #define UART_OMAP_RX_LVL               0x19

+/* Runtime PM autosuspend timeout: 0ms may trigger wakeup issues */
+#define UART_AUTOSUSPEND_TIMEOUT               200
+
 struct omap8250_priv {
        int line;
        u8 habit;
@@ -1409,6 +1412,8 @@ static int omap8250_probe(struct platform_device *pdev)
         */
        if (!of_get_available_child_count(pdev->dev.of_node))
                pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
+       else
+               pm_runtime_set_autosuspend_delay(&pdev->dev,
UART_AUTOSUSPEND_TIMEOUT);

        pm_runtime_irq_safe(&pdev->dev);


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=627a545c6bb0c7de09208e6546f5111290477261

> 
>>> The test script I posted does that for all the uarts, probably best not
>>> to do that until the other issues are sorted out :) If so, maybe the issue
>>> on close is that the uart has already autoidled.
>>
>> Indeed. But I'm not sure why the autosuspend is enabled by default?
> 
> See above, it's always been initialized to -1 by default so it won't
> do anything. But if you ran the test script I posted, autosuspend timeout
> got enabled for all the uarts. But maybe the issue you posted is yet
> another issue that I don't quite understand yet.
> 
> To me it seems we should always have runtime PM functions enable the
> serial port to usable state and get rid of the conditional enable for
> probe and dma.

I'm not able to reproduce the issue by preventing the device from being power
managed. I tried with both method:

echo "-1" > /sys/bus/platform/devices/4806e000.serial/power/autosuspend_delay_ms

or

echo on > /sys/bus/platform/devices/4806e000.serial/power/control

I also played with your script modified to keep autosuspend_delay_ms to 0
(default on my board), but It doesn't trigger the issue.

Note: /sys/bus/platform/devices/4806e000.serial/power/wakeup doesn't exist here.

If setting autosuspend_delay to 200ms by default is ok, I will send a patch.

Best regards,
Romain

> 
> Regards,
> 
> Tony

