Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47701BA72D
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 17:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgD0PCO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 11:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728090AbgD0PCL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Apr 2020 11:02:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5CCC03C1A8
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 08:02:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x17so20200339wrt.5
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5am3rYLKN72sDpubB8boCkl41aXLjHfwb4K9gDzXZl4=;
        b=rSd0N9pZhwF+3XY/rPyovLCC5HIGkw9J4bi469iWjJE/eyvVhUukYF0vvSQW+heho9
         30b/2fwtE10ncV3C9PHyg3BzmekTAMfPHdV0H3mmBQfG7qrites/pD+7Qd72bsKyvGPO
         XDnC35aD4gln/Z68HZtr3H8XcrbM7aBHEpE+SXHpINWQ51bav4MPnMmrJx2/kWBFLTme
         PoRtmQUEuLnIWrPWa4IiLvf75QjqT2GM1OKFTITLI/VQRTdt2TFQvaAIMvH9geHsMsGY
         DE6Eb6xZ+RqwMAS+z0TCWwEWr2zAkc+PtWSTIog4eXxEH8DlcSOxpdAH09ho9XxPcdDi
         d7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5am3rYLKN72sDpubB8boCkl41aXLjHfwb4K9gDzXZl4=;
        b=HLM52y/kP0ytBZV3pJbbE2qbsF+YT7RoCcezjLNZiV+BvdVDo7zTb3e9zBHxaXOHKz
         qD5FU3xJ7cXKk1uujRflfDbnUgp1yqNjhefM7/C1Sg3OjwNkkxXZL5F//IQ7Y6T67lIx
         vPH11qy4JblU6k3DnJudcTkdoZdIOyaaHyPXrldZ/RspKZoeSOO/4941/hQDmlvwHyOM
         OE8qkIi8fBieIQUEENoNSeC3CHlk4DatmF0MDd0ktZNOM9xN0p2QEgH66S1OQAC5KWQ7
         AJhEoaaNszAPN6k+iaPWIiowhZ8eqKcA8H74HJx9NsjqHsaksSAWeWzUcICq6sKsQh2H
         XYyQ==
X-Gm-Message-State: AGi0PuZwmPa+0UkL5HbZPkb9j16jz5VEFwqgFIkRnzzIfoUuLTc02ovp
        Z2neuSUhyjqplLCXKWYfPbNBGw==
X-Google-Smtp-Source: APiQypKRH9rdVdNM2v0Jh1dki7ggVnxw1D+G72UX+ta6jz6y6AhXKbGkwfOo+Ez+HlSZUjVbd6p2gQ==
X-Received: by 2002:adf:fcc6:: with SMTP id f6mr25050658wrs.388.1587999728856;
        Mon, 27 Apr 2020 08:02:08 -0700 (PDT)
Received: from [192.168.0.41] (lns-bzn-59-82-252-135-148.adsl.proxad.net. [82.252.135.148])
        by smtp.googlemail.com with ESMTPSA id e11sm20748688wrn.87.2020.04.27.08.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 08:02:08 -0700 (PDT)
Subject: Re: [PATCH 02/14] clocksource/drivers/timer-ti-dm: Add clockevent and
 clocksource support
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20200417165519.4979-1-tony@atomide.com>
 <20200417165519.4979-3-tony@atomide.com>
 <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
 <20200427143144.GQ37466@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <29f39839-b3ed-cac3-1dea-c137286320b1@linaro.org>
Date:   Mon, 27 Apr 2020 17:02:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427143144.GQ37466@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/04/2020 16:31, Tony Lindgren wrote:
> Hi,
> 
> * Daniel Lezcano <daniel.lezcano@linaro.org> [200427 09:19]:
>> On 17/04/2020 18:55, Tony Lindgren wrote:
>>> --- a/Documentation/devicetree/bindings/timer/ti,timer.txt
>>> +++ b/Documentation/devicetree/bindings/timer/ti,timer.txt
>>> @@ -14,6 +14,8 @@ Required properties:
>>>  			ti,omap5430-timer (applicable to OMAP543x devices)
>>>  			ti,am335x-timer	(applicable to AM335x devices)
>>>  			ti,am335x-timer-1ms (applicable to AM335x devices)
>>> +			ti,dmtimer-clockevent (when used as for clockevent)
>>> +			ti,dmtimer-clocksource (when used as for clocksource)
>>
>> Please, submit a separate patch for this.
>>
>> Before you resend as is, this will be nacked as clocksource / clockevent
>> is not a hardware description but a Linux thing.
>>
>> Finding a way to characterize that from the DT is an endless discussion
>> since years, so I suggest to use a single property for the timer eg
>> <ti,dmtimer> and initialize the clocksource and the clockevent in the
>> driver.
> 
> Hmm good point. We still need to specify which timer is a clocksource
> and which one a clockevent somehow.
> 
> Maybe we could have a generic properties like the clock framework such as:
> 
> assigned-system-clocksource
> assigned-system-clockevent

I think that will be the same problem :/

Is it possible to check the interrupt for the clockevent ? A timer node
with the interrrupt is the clockevent, without it is a clocksource.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
