Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D84C223943
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jul 2020 12:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgGQK3j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jul 2020 06:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgGQK3i (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jul 2020 06:29:38 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBD4C061755
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 03:29:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f139so16320521wmf.5
        for <linux-omap@vger.kernel.org>; Fri, 17 Jul 2020 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fMOiiumjQ/fG2ARKn+kEmSFoCfRvfCoyPOdi6El2piw=;
        b=JGuZZ5jdnINF6UiQriZUL+OAPTn7cNB7sakFSFNIeaC6seST9VfxKOeGnaCUkRnFvV
         PHnwWZn9JXzKN/KTaL7dSZ49XCDosHTy43rMjVo8QktHk6LvFH6b/NvKNHt8mqXEIwVh
         AM3BO/HEwBozVBmKiFWxHTz4P4+Kh8ovA3UbAK9xrambEynYfTxkV7gY8WPS7ZEv5jIO
         epGOIwFbsmq4gftFSFZ7vbhWqVlBbeFDwv9HC5QGdS/H49EWiRDqrWm+1QuSI6h8Ub69
         Ty1KnAQvo9B08OarjqMmIwwPaj0gba4u7bZPdMurkPRa0yDyiXO+IfliDDNsfauf+NSW
         ymaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fMOiiumjQ/fG2ARKn+kEmSFoCfRvfCoyPOdi6El2piw=;
        b=QwzJbiO2848NIM7ApHF0X6BgnkbgRJUVsRYGGSr0u0W+ZuQ0kjlkdNI6eICbIk1AdI
         peh/BoOXAAzr3TLuaSOcZlNExHggFuZ08lgKPMqEgqQLfyp9kSKPKIfztocdmE4JIdOl
         HpzkC74rt/Og52oF61wywhJ9XN/su6OmQ5lUuIwaCeTB4mh4Me4lQ5usQp7ExwbMvyOh
         +w53QUjVsED8BmdYB7bekUn0zEqE9lha6i+q7WiXGEbl/tJEP06bl9IvkHVTANl09HmV
         pzd9nq3Am6SNYkkLqlYVKaX+pc++6VIh9OzufaeH0wiBVutwmDb2sERfV2LqFUi+wMqG
         m/lw==
X-Gm-Message-State: AOAM530nTxEq1MGN7tQI8rzdoDEKFMuYpjzu4AjyxJSmF8d0pxOmrpIr
        M5txALM6Dj1A0clrzaiupPcUQg==
X-Google-Smtp-Source: ABdhPJySUI1BgkrK4qDXvYidHGvdo6Xw53TzQZ17/jE+sFu5rp+BlXxZp6ZwYOessXptzBVThMMczQ==
X-Received: by 2002:a1c:2041:: with SMTP id g62mr8540340wmg.172.1594981776846;
        Fri, 17 Jul 2020 03:29:36 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9880:a643:3e69:6393? ([2a01:e34:ed2f:f020:9880:a643:3e69:6393])
        by smtp.googlemail.com with ESMTPSA id y7sm13897178wrt.11.2020.07.17.03.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 03:29:36 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
To:     Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Carlos Hernandez <ceh@ti.com>
References: <20200713162601.6829-1-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1ac1ac81-1335-8ba2-590c-8f57c2df1910@linaro.org>
Date:   Fri, 17 Jul 2020 12:29:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713162601.6829-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13/07/2020 18:26, Tony Lindgren wrote:
> Carlos Hernandez <ceh@ti.com> reported that we now have a suspend and
> resume regresssion on am3 and am4 compared to the earlier kernels. While
> suspend and resume works with v5.8-rc3, we now get errors with rtcwake:
> 
> pm33xx pm33xx: PM: Could not transition all powerdomains to target state
> ...
> rtcwake: write error
> 
> This is because we now fail to idle the system timer clocks that the
> idle code checks and the error gets propagated to the rtcwake.
> 
> Turns out there are several issues that need to be fixed:
> 
> 1. Ignore no-idle and no-reset configured timers for the ti-sysc
>    interconnect target driver as otherwise it will keep the system timer
>    clocks enabled
> 
> 2. Toggle the system timer functional clock for suspend for am3 and am4
>    (but not for clocksource on am3)
> 
> 3. Only reconfigure type1 timers in dmtimer_systimer_disable()
> 
> 4. Use of_machine_is_compatible() instead of of_device_is_compatible()
>    for checking the SoC type
> 
> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
> Reported-by: Carlos Hernandez <ceh@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Carlos, were you able to test this patch ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
