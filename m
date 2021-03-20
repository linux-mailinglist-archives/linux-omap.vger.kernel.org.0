Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A6C342FCD
	for <lists+linux-omap@lfdr.de>; Sat, 20 Mar 2021 23:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhCTWN3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 20 Mar 2021 18:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhCTWNO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 20 Mar 2021 18:13:14 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847FDC061574
        for <linux-omap@vger.kernel.org>; Sat, 20 Mar 2021 15:13:13 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e9so12727241wrw.10
        for <linux-omap@vger.kernel.org>; Sat, 20 Mar 2021 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+k6slClDpNP9SV+PQNJ75LS2okQYo2MttA9wZhjFk8c=;
        b=vlZgIlC5LmJbiG/QvGeAhR4JUA1FWFlTK3ApXq5EDjmW0uG3G6OgheFnknF18tG1ZZ
         vroKHJOLfENoAaa0ZNeavMc64uubyijyU/rzbMTEgimnMM27owovvbmhGvTTcx3LtVt5
         khRFwi9ScUBKd1V7HbbLUwmLHNecR0XI9WaY9a16SYUJVtxtgFm9ZR6BWsSYMKmy1WzO
         WZljhbtKlCE9zJUKn2ukbH3HdSO4H+gsq2gCRyMd3nUP5x+NeZL3Aim4zj8THzvGnohy
         ksQcy91A1pde/+wH2ObObeg4+7YE9saT0ux9Zbn5DHxDz+Xivh82RDljQGI3mpO+xQKu
         dz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+k6slClDpNP9SV+PQNJ75LS2okQYo2MttA9wZhjFk8c=;
        b=c37x4alsIJ1NBlDJCBaQ2KpqlKfdRq7MH6VMfqhJDOaUf3Q54inA7VzEGKoAnGMYhv
         622yf2x8Gy3FDctf71W2BgTP/TJsluPDHCG5a870gL7gDo7WdOLQngvAByd+3wRlTAZ0
         TUKgfF5tJToABF4Pwir9p4pcmaFJjoAEDJp0Vvzy7klKf3Boa3qfK33yFOJe4kcWR2yh
         bPyVhBI4xWOWaRqmzgBvy/qKsktEHNXLD0djT0TkUBeIVOhWivxSt3QYT0lw6qObnCje
         S0Nj8nrYmo5MEoMppp+JdeQSSn335LHAt71UGfmZdRVPqHcXWirn7x1kLc8mXjIsAVEi
         TQwg==
X-Gm-Message-State: AOAM532V0L0c5ZhYxhAlywhBzxPi/ChoZoS8jPGbORdSOrFrw/Mwtqls
        Pq8uCDPmWd6whkkCQ/RIEta2dg==
X-Google-Smtp-Source: ABdhPJxX7/WCTOFk/0ieWM8Eqh8N2Saf6ltSUbuzPpWDhAoktf5akzEodFrUsRa3VvH4BkQhA37uqQ==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr11032665wrv.194.1616278390691;
        Sat, 20 Mar 2021 15:13:10 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:2452:bc69:af94:a0d8? ([2a01:e34:ed2f:f020:2452:bc69:af94:a0d8])
        by smtp.googlemail.com with ESMTPSA id x23sm12021891wmi.33.2021.03.20.15.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 15:13:10 -0700 (PDT)
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Remove extra
 of_node_put()
To:     Tony Lindgren <tony@atomide.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210304072135.52712-1-tony@atomide.com>
 <20210304072135.52712-3-tony@atomide.com>
 <4c23ce3e-3304-b10d-5054-f421822b5dc2@ti.com> <YEHiojjAj4YLWGxA@atomide.com>
 <YEZCFgFEKTaxJTpG@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ee7cb91f-5fc1-d852-f109-db3c189e45a1@linaro.org>
Date:   Sat, 20 Mar 2021 23:13:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YEZCFgFEKTaxJTpG@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/03/2021 16:26, Tony Lindgren wrote:
> Hi,
> 
> * Tony Lindgren <tony@atomide.com> [210305 07:58]:
>> * Grygorii Strashko <grygorii.strashko@ti.com> [210304 20:56]:
>>>
>>>
>>> On 04/03/2021 09:21, Tony Lindgren wrote:
>>>> We have of_translate_address() already do of_node_put() as needed.
>>>> I probably looked at __of_translate_address() earlier by accident
>>>> that of_translate_address() uses.
>>>
>>> I do not see of_node_put() in of_translate_address() and
>>>  __of_translate_address() is doing of_node_get(dev);
>>> ?
>>
>> Oh right.. this is confusing.. Yeah we can ignore this patch.
>> We should have the use count set for only the system timer(s)
>> we claim.
> 
> Daniel, would you like me to repost this series with this patch dropped?

No, it is ok. I will take care of not picking it.

Thanks
  -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
