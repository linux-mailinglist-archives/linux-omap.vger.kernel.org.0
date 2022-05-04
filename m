Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F34DC519FC5
	for <lists+linux-omap@lfdr.de>; Wed,  4 May 2022 14:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349860AbiEDMpx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 May 2022 08:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349724AbiEDMpw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 May 2022 08:45:52 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AD217E11
        for <linux-omap@vger.kernel.org>; Wed,  4 May 2022 05:42:15 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d5so1848331wrb.6
        for <linux-omap@vger.kernel.org>; Wed, 04 May 2022 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/6TK65pvx9vbwc/zqC7Zf8PzbihCdYtXFY/dOFy82Wo=;
        b=uiad1Cqct28hVbEIpBDfpRjUCGnBwE1UQpTbEj3SNex1z6KgieNeuNReMSvJPV623V
         Ngiib5eutFWmt9TfC5mZxOQ2JnSlP27GDFgSOBRKudyfUM+uhFN0j0FpFYndkrQocuu/
         nvS2FXH9v5+3u2OjJCzgjcOo3P4XojNQnKMwGUUdmKz1qi6ddnAu7L1shxQu9cEpqYAB
         jHIIJK7Y1mJ/n+/QOnSzo1+utKegqprmwhn/IcBG2CiMzCItfAIm/djbecD9fqju7Hb3
         aHxJPqTjziEd9nCb5mmBCmcHKENoodDW88jhl32iiPjv4xYCi4qxLkTuSzDQVOIILlNJ
         C2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/6TK65pvx9vbwc/zqC7Zf8PzbihCdYtXFY/dOFy82Wo=;
        b=gE9TIGTlJxMiTqhnlcug0A+10mkssMZJCEmSfyP8bfjMFk5n9/+ct24Ciu0dDANY8t
         VX0fbCYhK3z77+GQ26vUq/EgkhuafjoT/nFg/ugNHzODZwLBD9gV63HDnfeS439T4zrP
         Vjt0le0zeD220t9KFkaTr5Brm6oZzMftMrIzJ5hNyJB4S+JZv7sSW1WA6mt+53x1ljk7
         OkXAcicWUba34VIauljGh5g3FzTS6fYP6hHoDs/35k4RpvbZpvpivyPVii35/cyozpC7
         TOIRczCiUc55tAziNuWndMZHFCC4O5JKJSo0fSdq+HYlk+ls4MIIlFA7nRad7R2jf44n
         yh2A==
X-Gm-Message-State: AOAM531uITF3ONQdTMIbbjkH0IScwFDeepVEf3+4drbUD0JVIK/P+Jug
        ZQDmFesa6LECUzObX8GQFWEmvlpZUKinjg==
X-Google-Smtp-Source: ABdhPJyxKwHObv9C/nVDWrDoDVmxx2C+Ggw9n4+ygmpaHVQkagEOzBCidWHYe+kdhh47yXguZuLjOA==
X-Received: by 2002:adf:f346:0:b0:20a:c95d:e3cd with SMTP id e6-20020adff346000000b0020ac95de3cdmr16218124wrp.69.1651668133658;
        Wed, 04 May 2022 05:42:13 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id m20-20020adfa3d4000000b0020c5253d8ffsm11670496wrb.75.2022.05.04.05.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 05:42:13 -0700 (PDT)
Message-ID: <fc11fc68-d1f3-8e47-c5ff-c8ba10e8a7b3@smile.fr>
Date:   Wed, 4 May 2022 14:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: AM5749: tty serial 8250 omap driver crash
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com> <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
 <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
 <Yg4CZb1Jy2M8wwn/@atomide.com>
 <77a24941-4c46-8d78-391a-d3d1018f311a@smile.fr>
 <Yg5GdIp5Glp9p/G5@atomide.com>
 <2d192056-4977-9e2e-f661-23e05e2a6584@smile.fr>
 <YnD+brrvs36aL71B@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <YnD+brrvs36aL71B@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 03/05/2022 à 12:05, Tony Lindgren a écrit :
> Hi,
> 
> * Romain Naour <romain.naour@smile.fr> [220402 10:13]:
>> Le 17/02/2022 à 13:58, Tony Lindgren a écrit :
>>> Yes but note that 8250_omap autosuspend does not do anything unless the
>>> timeouts are manually enabled by the userspace. They are initialized to -1
>>> during probe.
>>
>> Actually it's not initialized to -1 on my board, it's initialized to 0. See
>> commit [1].
> 
> Oh you're right. The default should be initialized to 2000ms though, not 0.

How do you know it should use 2000ms by default?

> 
>> I'm starting to think that is an issue when the 8250_omap driver is used with
>> another driver like the gnss serial driver (using a serdev driver).
> 
> Oh yes you are right. We do this conditionally now.
> 
>> Since the commit [1] there is no autosuspend delay at all, I would suggest to
>> add a default autosuspend delay value. I tested with 200ms based on another example.
>>
>> diff --git a/drivers/tty/serial/8250/8250_omap.c
>> b/drivers/tty/serial/8250/8250_omap.c
>> index ec7304d57f5f..8ba830bd493a 100644
>> --- a/drivers/tty/serial/8250/8250_omap.c
>> +++ b/drivers/tty/serial/8250/8250_omap.c
>> @@ -108,6 +108,9 @@
>>  /* RX FIFO occupancy indicator */
>>  #define UART_OMAP_RX_LVL               0x19
>>
>> +/* Runtime PM autosuspend timeout: 0ms may trigger wakeup issues */
>> +#define UART_AUTOSUSPEND_TIMEOUT               200
>> +
>>  struct omap8250_priv {
>>         int line;
>>         u8 habit;
>> @@ -1409,6 +1412,8 @@ static int omap8250_probe(struct platform_device *pdev)
>>          */
>>         if (!of_get_available_child_count(pdev->dev.of_node))
>>                 pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
>> +       else
>> +               pm_runtime_set_autosuspend_delay(&pdev->dev,
>> UART_AUTOSUSPEND_TIMEOUT);
>>
>>         pm_runtime_irq_safe(&pdev->dev);
> 
> Hmm the value should be set to the default 2000ms already. If it's not, then we
> need to find out what is setting it to 0.

I don't see where pm_runtime_set_autosuspend_delay() would be called to set the
autosuspend delay to 0.

2000ms seems to be related to USB_AUTOSUSPEND_DELAY and only relevant for the
usb stack.

Here nothing seems calling pm_runtime_set_autosuspend_delay(), so the
autosuspend delay is still using 0 as default value. I'm not sure that the
serdev driver really handle the autosuspend delay.

Other driver like the omap-sham set the autosuspend delay default value just
after pm_runtime_use_autosuspend(&pdev->dev):

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/crypto/omap-sham.c?h=linux-5.10.y#n2126

> 
> For adjusting the timeout, you may want to check the child serdev driver
> runtime PM autosuspend timeout, adjusting that seems a better place to
> prevent the 8250 idle. Not sure how we should handle the 8250 specific
> timeout though based on the serdev driver requirements.

For now, I'm not sure I need to adjust the timeout.

Best regards,
Romain

> 
> Regards,
> 
> Tony
> 
> 
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=627a545c6bb0c7de09208e6546f5111290477261

