Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105BD4F7E58
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 13:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238726AbiDGLuL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 07:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237395AbiDGLuJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 07:50:09 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3671226A12
        for <linux-omap@vger.kernel.org>; Thu,  7 Apr 2022 04:48:09 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso5529030wma.0
        for <linux-omap@vger.kernel.org>; Thu, 07 Apr 2022 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WFekK56Gey0nwjwSFnx0O6aDoHsXBZvzYZ5aCHEoU+Q=;
        b=fss10bR3bROT9qAiIjftMdGUyAxbS+hSjahXvNa5oNK2t0r3zNv6qqfpEvqMoMFIIu
         i6dxHsLbYmyBPl+8V3FtoKhIH+Qn7OXwxa1lNCG3cU0t3Bki5wkDHOTqFMOciHPI+W4M
         iN5DDZ3IDi8rkB/V928MqOmRTxXHgGNhiP+X2iIDuBjG36g2gzSR8bze17fdd+LJq15W
         J4MhVSBGJpme302mRdlm90AKGhQ6F/WvPMdPaKdwerzYTDHlR85+NTUdy6VXuHnjg9W9
         Jlwpt3rRR265vssH0rVpHuPgTE2EwEL+ciWi7xErcTTtMzWPYZNLVpZ/SOuxTwOWOr0E
         QGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WFekK56Gey0nwjwSFnx0O6aDoHsXBZvzYZ5aCHEoU+Q=;
        b=dKyKX1Ca3V+xnGWLqBb71MFHf3UTYBgnga9/5n1dtgtNnIgpqiL9N7qr+7vz55hwE1
         2LoPQes40TQIfKkc+GwArnK3wyW9X7oxfgfvsfTt6tbzYfOWJithoVvMMVjgUwtIHT7l
         uaFcKgQfvkdSveV0vm7udmh80Vna9j+8CdiVq3BmYYCLO6r5VP6NWHxa+R7gy23UeLeA
         bsRxIodzRPsakSkclexmKJrSsUOoKi8Qloau8XIYXBQcVpvKwbUYw2Ndg99tFcmCjVCI
         n3TNBLVyuDzMFLyEpizIwnHrRUMzV3jtJ77bpeL6j7pB6aNl4rk9vDDwx+sSZ/BgM0EZ
         oCvg==
X-Gm-Message-State: AOAM533Vsc4HVzM/+x0Fct4bAPp7CXl+l/8yI+aI9EBnQRnN03FdYVfC
        k98CsvW8AvoD+Fi/4PCz6oX8PQ==
X-Google-Smtp-Source: ABdhPJwoMdNeuU1YCgrz1ayp3i5UQaxt1w9dTjtvLwbtPi6o+Kryz3m3ioMA0Tes3nKunn+xCVFdZA==
X-Received: by 2002:a05:600c:1d9b:b0:38c:af70:9998 with SMTP id p27-20020a05600c1d9b00b0038caf709998mr12025660wms.169.1649332088181;
        Thu, 07 Apr 2022 04:48:08 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c? ([2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c])
        by smtp.googlemail.com with ESMTPSA id f8-20020a5d50c8000000b002061622ec88sm9037808wrt.105.2022.04.07.04.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 04:48:07 -0700 (PDT)
Message-ID: <e2a50981-9d11-35ee-c7db-a5796a027099@linaro.org>
Date:   Thu, 7 Apr 2022 13:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] clocksource/drivers/timer-ti-dm: Update defines for
 am6 for inline functions
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220407071006.37031-1-tony@atomide.com>
 <20220407071006.37031-2-tony@atomide.com>
 <9671f0a5-6860-8a75-d65e-345ce890cd88@linaro.org>
 <Yk6drKxwOSVdrKp+@atomide.com>
 <7f3cbdf3-401c-6c30-20fa-b5121bd3f63d@linaro.org>
 <Yk6mb1HjEH4H/b7p@atomide.com> <Yk68U6Kbs/ws42f8@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Yk68U6Kbs/ws42f8@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/04/2022 12:26, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [220407 08:50]:
>> * Daniel Lezcano <daniel.lezcano@linaro.org> [220407 08:23]:
>>> On 07/04/2022 10:15, Tony Lindgren wrote:
>>>> * Daniel Lezcano <daniel.lezcano@linaro.org> [220407 08:01]:
>>>>> On 07/04/2022 09:10, Tony Lindgren wrote:
>>>>>> @@ -251,7 +251,8 @@ int omap_dm_timers_active(void);
>>>>>>      * The below are inlined to optimize code size for system timers. Other code
>>>>>>      * should not need these at all.
>>>>>>      */
>>>>>> -#if defined(CONFIG_ARCH_OMAP1) || defined(CONFIG_ARCH_OMAP2PLUS)
>>>>>> +#if defined(CONFIG_ARCH_OMAP1) || defined(CONFIG_ARCH_OMAP2PLUS) || \
>>>>>> +	defined(CONFIG_ARCH_K3)
>>>>>
>>>>> Why not replace the above by CONFIG_OMAP_DM_TIMER ?
>>>>
>>>> Hmm that's a good question for why it was not that way earlier.
>>>>
>>>> This series changes things for tristate "OMAP dual-mode timer driver" if
>>>> ARCH_K3 || COMPILE_TEST though. So the inline stubs are still needed for
>>>> COMPILE_TEST it seems.
>>>
>>> But if ARCH_K3 or COMPILE_TEST is set, CONFIG_DM_TIMER is also set, no?
>>
>> Right but I suspect that COMPILE_TEST will produce a build error on other
>> architectures. I need to check that though, maybe that is no longer the
>> case.
> 
> We could use IS_ENABLED(CONFIG_OMAP_DM_TIMER), but looks like we can now
> just move the __omap_dm_timer_* inline functions to timer-ti-dm.c instead.
> 
> I'll do that and repost after some testing.

Even better :)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
