Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C508530F74
	for <lists+linux-omap@lfdr.de>; Mon, 23 May 2022 15:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235645AbiEWMlO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 May 2022 08:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235612AbiEWMlL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 May 2022 08:41:11 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C266463
        for <linux-omap@vger.kernel.org>; Mon, 23 May 2022 05:41:10 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t6so21189553wra.4
        for <linux-omap@vger.kernel.org>; Mon, 23 May 2022 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6cSUWWXj6gaKWAnB/PsCcRkt508mJwVHh+pGp1UtAHc=;
        b=oqe7XdG74nBVB8aXn1h1UFE47C5Z/Z72rrR7uDjkWAtKfdnLLcYn+cefgDoL4BirNE
         uh1AcfRiOGTHJsZjNq/bWYxkZwuL9uqXuvUlq9uOTWYsXMiREvEPUXBYak56xETF/Qxv
         RtntwxjhgNsfrA6kNgqurmimcPBWwbam3e71plhw2j43PfREjYyfe2aA6dXSmckvZD7g
         LvdHx2e5/ksNWlfPxlf0hyvrnojLQKugX/+NeOyMUvUGXHNUrXDJl4zjX93LklpADKzC
         yABDuq3F9VPsbKgT+sCpNYq3oyIAvwliUrolVYCaC0e941H03XnBpmsSnU9eOpMFHHau
         Xbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6cSUWWXj6gaKWAnB/PsCcRkt508mJwVHh+pGp1UtAHc=;
        b=X+czbGfnP/HrRhhJHc5Aoxg/ULYp5CXec7+/0waBuGAG71XG+ylpYP8O9K1c+9Ylm4
         JwO8THS6XMc/xQc25b3iN11rwkd/D7ZuwpyBobGA3EQw0gNQ8by8HVwmQDpwN5wyYstO
         4GU3JjYYywkEc4Jj8X8o3Ts4Qw2j+7nxcEeNM33aq8QPsb5pooRkJ+nQblPb/HxJeBuO
         1mEwN00GsbtVF9E0lXSP1M+kddFAxMLpPg6R1UjOeM/IurjH40+QdL+eIXzPLJELqTIr
         9POvZ9qEpvd8i6xD1gH15c0VljXb6ddV6hzus9APySBLhpsAeYhn8DqQJcPbZV9sIYDD
         bmAA==
X-Gm-Message-State: AOAM531t9idVHJ4ZYl16+mxPaUK0W57wJxNnCRRwEopMuHSYFE4uUcEF
        wY1dYvgyG6Ug8QfCzVWYBO48Bg==
X-Google-Smtp-Source: ABdhPJw317iplIi4CP9kAvbOxy6PKTlEKKOaK3vK9q9iumpFohmUhGLt1hcPS4M9cciYtjIxjarKeA==
X-Received: by 2002:a05:6000:1f16:b0:20f:ca9f:8385 with SMTP id bv22-20020a0560001f1600b0020fca9f8385mr8245027wrb.74.1653309668610;
        Mon, 23 May 2022 05:41:08 -0700 (PDT)
Received: from [192.168.1.41] (176-182-171-101.abo.bbox.fr. [176.182.171.101])
        by smtp.googlemail.com with ESMTPSA id k12-20020adfc70c000000b0020fe9b8b89dsm1017350wrg.43.2022.05.23.05.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 05:41:07 -0700 (PDT)
Message-ID: <5b71f5e8-c3df-46ef-094f-9739dd7a0f5f@linaro.org>
Date:   Mon, 23 May 2022 14:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Make timer
 selectable for ARCH_K3
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220408101715.43697-1-tony@atomide.com>
 <20220408101715.43697-3-tony@atomide.com>
 <156a53a2-c33b-7ec5-3584-41ef25cb9cdd@linaro.org>
 <Yos0IOkCd4R9a9YZ@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Yos0IOkCd4R9a9YZ@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Tony,

On 23/05/2022 09:13, Tony Lindgren wrote:
> Hi,
> 
> * Daniel Lezcano <daniel.lezcano@linaro.org> [220520 15:24]:
>> On 08/04/2022 12:17, Tony Lindgren wrote:
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -22,7 +22,7 @@ config CLKEVT_I8253
>>>    config I8253_LOCK
>>>    	bool
>>> -config OMAP_DM_TIMER
>>> +config OMAP_DM_SYSTIMER
>>>    	bool
>>>    	select TIMER_OF
>>> @@ -56,6 +56,12 @@ config DIGICOLOR_TIMER
>>>    	help
>>>    	  Enables the support for the digicolor timer driver.
>>> +config OMAP_DM_TIMER
>>> +	tristate "OMAP dual-mode timer driver" if ARCH_K3 || COMPILE_TEST
>>
>> Actually, I missed this. Could you convert to a 'bool' there is no module in
>> the timer drivers ATM.
> 
> OK sure will do.
> 
> Did you notice some loadable module usage issues for timers that are not
> system timers? Just wondering if there are some issues that I did not
> notice.

I think the removal won't be supported. We already had a proposal to 
move one of the timer as a module but I wanted to have more insights 
about the changes, not just do that because of a GKI Android.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
