Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C334B520EDE
	for <lists+linux-omap@lfdr.de>; Tue, 10 May 2022 09:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiEJHrP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 May 2022 03:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbiEJHpw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 May 2022 03:45:52 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59386F29CD
        for <linux-omap@vger.kernel.org>; Tue, 10 May 2022 00:37:00 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d6so18927425ede.8
        for <linux-omap@vger.kernel.org>; Tue, 10 May 2022 00:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6RZWCbAFEodD2+2XSMEoagvUogOze2cw3QzyxFw/BDQ=;
        b=tgeEd74zRUA5aO1Do8LwMzp/J1ozn+9YH1LrXvTSv/C+z7ex3kM0d2ODIFPoyr17PP
         nrH1NlExLYf0J6IkMJUpZzAXHDjo3dbx2UIzk3LVeQxQUiLKXnBmD24avQgq7JIUpUNv
         BvQASI3UfasFBVTdby7HX4OHej8bHtsCSM0BxXvZsmj6d008CgdRuHFVAh2yqvIoOsnz
         Q+Y2qy0IokBsZRt75QRHC/eb84dCwkozQd1A9z3ZjPOxDw86e8NyvVmr2f/tkvTOKyyC
         nLQw9fD75PV/1fIdAgXHIJ5xinRE5+m4Mm10+dc29VSAuRdTXGA9cap1t7tqu9j61Mgm
         5TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6RZWCbAFEodD2+2XSMEoagvUogOze2cw3QzyxFw/BDQ=;
        b=7d/HpBiScJIm7z+1CbIe3T9YGHe4EIcPhaacUaq/A8AygtMnLVRfaMd2O4lfGL4kLl
         Dal5OEfaNnNfIzGxo3EtJ1KUZgOd4S8r0PauliOCYks9c/sTK+1tP2UloBtEdaMc5kpm
         9DlAm6egeYWU4MtitepJExp6VTrk28zUxaaLjDXabjFxtF3+1teFR3TTD4TP+DHzjaDw
         mEuRT7R3rzUnRuphsYfuubq944qSs6veggVfqKJdJbf5f2/wYXLiGi1JpYK7XmcW2rJf
         P2P7oNNQAxUy0AWpJahnxHYskpagapP1o1T34/MVmzAMTS33H5vI4jSFs6/FDZHNtiHd
         aE2Q==
X-Gm-Message-State: AOAM530Veb5L4hExOW9ADS5lzIuo1yzhdneB0Wj7/h7zMREmlyiE0N28
        EOfujoacVnUDtl4m/6Uk1iyl9A==
X-Google-Smtp-Source: ABdhPJxyax1mRAPGS5sipxq+bFV0bICt1+ObVB9C2oSv1/7OuFLXOtOyvd1HWcYDvgkfQYZMYcAY8g==
X-Received: by 2002:a05:6402:4301:b0:427:c8e4:4acd with SMTP id m1-20020a056402430100b00427c8e44acdmr21961658edc.230.1652168218886;
        Tue, 10 May 2022 00:36:58 -0700 (PDT)
Received: from [192.168.0.250] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hx15-20020a170906846f00b006f3ef214e4csm5964412ejc.178.2022.05.10.00.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 00:36:58 -0700 (PDT)
Message-ID: <b8983ff3-7dca-0556-1bcc-05897aef212c@linaro.org>
Date:   Tue, 10 May 2022 09:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] memory: OMAP_GPMC should depend on ARCH_OMAP2PLUS ||
 ARCH_K3
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Roger Quadros <rogerq@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <2b7d411b4a7913335082c858cb0d63b9e4bf7c5b.1652103920.git.geert+renesas@glider.be>
 <20fd1a74-c0f5-d8e9-4903-b74c185d5aa3@kernel.org>
 <CAMuHMdVXHSnOOnn3jchezQc+bsPYTnSPuw_rOe+pyskAVaQGnQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVXHSnOOnn3jchezQc+bsPYTnSPuw_rOe+pyskAVaQGnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/05/2022 09:30, Geert Uytterhoeven wrote:
> Hi Roger,
> 
> On Tue, May 10, 2022 at 9:22 AM Roger Quadros <rogerq@kernel.org> wrote:
>> On 09/05/2022 16:48, Geert Uytterhoeven wrote:
>>> The Texas Instruments OMAP General Purpose Memory Controller (GPMC) is
>>> only present on TI OMAP2/3/4/5, AM33xx, AM43x, DRA7xx, TI81xx, and K3
>>> SoCs.  Hence add a dependency on ARCH_OMAP2PLUS || ARCH_K3, to prevent
>>> asking the user about this driver when configuring a kernel without
>>> OMAP2+ or K3 SoC family support.
>>>
>>> Fixes: be34f45f0d4aa91c ("memory: omap-gpmc: Make OMAP_GPMC config visible and selectable")
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>>> --- a/drivers/memory/Kconfig
>>> +++ b/drivers/memory/Kconfig
>>> @@ -105,6 +105,7 @@ config TI_EMIF
>>>  config OMAP_GPMC
>>>       tristate "Texas Instruments OMAP SoC GPMC driver"
>>>       depends on OF_ADDRESS
>>> +     depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
>>>       select GPIOLIB
>>>       help
>>>         This driver is for the General Purpose Memory Controller (GPMC)
>>
>> Is there any possibility that CONFIG_IRQ_DOMAIN is not set while both
>> OF_ADDRESS and COMPILE_TEST are set?
>>
>> That particular case will lead to build failures.
>>
>> e.g.
>> https://krzk.eu/#/builders/63/builds/162
> 
> So it needs an additional dependency on IRQ_DOMAIN.
> That is a pre-existing problem, not caused by my patch (which adds
> more dependencies, and doesn't remove any).

Is this really a case here? The failure reported above was for earlier
version of Roger's patch which was changing to:
	depends on OF_ADDRESS || COMPILE_TEST

Here, OF_ADDRESS will be always a dependency. If it builds in current
configuration (having only OF_ADDRESS), then adding dependencies should
not cause more issues.... It only restricts the config, not widens it.

Therefore the patch looks actually correct, but some testing would be
nice that we don't hit the same issues as before.

Best regards,
Krzysztof
