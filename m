Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383BE344E70
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 19:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhCVSX7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 14:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbhCVSXk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Mar 2021 14:23:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739DAC061756
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 11:23:39 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so11414722wma.0
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 11:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ySJvyA1Vk+WlWIAVpdaEw/cb8TtbtV3XIc6h1+nRJT4=;
        b=EYEwtse8Tfbhei4D4G24ggUMmPdbnWhNGAn/uaCsHWSGN1xHWkp8XNQsZBlU0rmqPP
         OF5bevWmwR8En6oyPXRetZsPWZS2pqtMWpVZU0rN7Z4CfBTvhLuQBoLRN1KI1SIfpNcu
         i79FSRJldWPSD8A5W8PK9kTpgwuvDKYmEb7SV8ptL+u2AXXZV4TkSCE04HukddGcgQNo
         kF0G3Pu5VkORcwFIlTNVoT9NDMmQp4iip/TgsIeMS8Xe8WXyC4IRrr6pLUTnNWkEBCum
         GZlsN8VzA/eTXih8JSucA3+ld59QNXphmZL2KPaPOwywrrBFjFlgAZYZIVd6KkfzpcNy
         04pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ySJvyA1Vk+WlWIAVpdaEw/cb8TtbtV3XIc6h1+nRJT4=;
        b=H4ausGdMIUa0rmauubSapKLVtyNIRs5HC9JYXAcRSmRTKKYdZqnpaJGlF2VJkoi0ZK
         Ws1r75t9iAjYzWATab7szq+dg43eT2FR4Xg1engJZE9oSvuJY0UBxAA3q5XAS+wvT3As
         QzML2C5eBX/etEQ1ff5//z7QHfmEwHeYJrYn65sKKPA5M2pf1aw3RqhBHCuI+0tcXY5W
         XWsL99KD3uh2pFnlj7doX0sBXfa69a8h0rjnCq9vL61Nj3P9om5k/AcQXNoRipVO7vf0
         AWL0E9IR3ZKqb+z76O4xEDERIX3+poZn3NEbiRQGzUQV8OlNLcctMCVpfd0TmAFhSOWM
         0GtA==
X-Gm-Message-State: AOAM531dkUU19aAAAFbwi1W59aOUEiqL8WOmu+/vKXmrIijinBmzk1qx
        4NUlypAj9Lckien2gnxXbs4Qbw==
X-Google-Smtp-Source: ABdhPJzb0KUsvmwF89Q6JC250XZHI3aXVw0gduj1cm4ArG5yoim7NODhbWWeHGHzQJUQSGKsRhJfBw==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr317022wmi.60.1616437417956;
        Mon, 22 Mar 2021 11:23:37 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:2091:71d6:3ab2:37f2? ([2a01:e34:ed2f:f020:2091:71d6:3ab2:37f2])
        by smtp.googlemail.com with ESMTPSA id v18sm21863898wrf.41.2021.03.22.11.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 11:23:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-ti-dm: Prepare to handle
 dra7 timer wrap issue
To:     Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Keerthy <j-keerthy@ti.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
References: <20210304073737.15810-1-tony@atomide.com>
 <20210304073737.15810-2-tony@atomide.com>
 <556d55af-0b30-8751-6aef-2e1bb9db1a76@linaro.org>
 <YFjG5IsHExuaixN9@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <5c3c2447-3f8c-160c-8761-e43c1b4ebbf9@linaro.org>
Date:   Mon, 22 Mar 2021 19:23:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YFjG5IsHExuaixN9@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/03/2021 17:33, Tony Lindgren wrote:
> Hi,
> 
> * Daniel Lezcano <daniel.lezcano@linaro.org> [210322 15:56]:
>> On 04/03/2021 08:37, Tony Lindgren wrote:
>>> There is a timer wrap issue on dra7 for the ARM architected timer.
>>> In a typical clock configuration the timer fails to wrap after 388 days.
>>>
>>> To work around the issue, we need to use timer-ti-dm timers instead.
>>>
>>> Let's prepare for adding support for percpu timers by adding a common
>>> dmtimer_clkevt_init_common() and call it from dmtimer_clockevent_init().
>>> This patch makes no intentional functional changes.
>>>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>
>> [ ... ]
>>
>>> @@ -575,33 +574,60 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
>>>  	 */
>>>  	writel_relaxed(OMAP_TIMER_CTRL_POSTED, t->base + t->ifctrl);
>>>  
>>> +	if (dev->cpumask == cpu_possible_mask)
>>> +		irqflags = IRQF_TIMER;
>>> +	else
>>> +		irqflags = IRQF_TIMER | IRQF_NOBALANCING;
>>
>> Can you explain the reasoning behind the test above ?
> 
> In the per cpu case we assign one dmtimer per cpu, and we want the
> interrupt handling on the assigned CPU. In the per cpu case we have
> the cpu specified with dev->cpumask unlike for the normal clockevent
> case.
> 
> In the per cpu dmtimer case the interrupt line is not wired per cpu
> though, so I don't think we want to add IRQF_PERCPU here.

If it is per cpu, then the parameter will be cpumask_of(cpu). If there
is one cpu, no balancing can happen and then the IRQF_NOBALANCING is not
needed, neither this test and the irqflags, right?



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
