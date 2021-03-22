Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D7E3449EE
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 16:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhCVPz6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 11:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhCVPzf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Mar 2021 11:55:35 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B619C061756
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 08:55:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so9264750wmi.3
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 08:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N70P1Fv2IBxK4ZquldWYilx1VEi3AUb2VlVmZR63sTo=;
        b=zLNjUSngfbuLk40AkFOm0Q21v63/nm8pheW4TD9Z4ThOhAtKi1I10n56YpWu3koPfJ
         3f4sCT1VO4SK8UYsjLD6avAulBxAWe0EVQbVqb3h1+O3NHsMLA3D4MTvCgO0iCURsjwl
         t12czLy5mgKaMfaCA+bLTryBti8a1m0m/ucoWgQYIw7M0JotHZulalCabJFB23rbhS+Z
         K2LvhSvjYcDYMENaczrp6zVBkksqJtJvLyTxFLwYVVna0jCZ2Qak5600Iz4Xy2pMBj/L
         1LegYlQonll16R6hzGNPa/7QI6eKMFOgSuogxvq64n1PRBZTWVVAQ7qyLujYGREvum2B
         dySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N70P1Fv2IBxK4ZquldWYilx1VEi3AUb2VlVmZR63sTo=;
        b=AhPJaulr8HYW3TI81HHI1X/oO7VCSBP83x29Z8/bgyK56oncSrQ5LeQv7N7WWYqlMr
         uK+py8LNIjxoPp1USSx+fSfLt+4lu488y2SFWy7nMTxb8vA7yD6qXTj8X+3dQnF0IAsE
         Zu1pyRM3zv9hW1z7vQ9+nSRy2F2JmzhVR7PdEr4tzyGYMw38WsCaYTiyUqo7OrZ3OURE
         PVWdzCfQ6CK151Y02QZZHlNH+VR3GjMRwzKvopxaqHpmefkUnHp4Ft7BbGjx/8v3hu9H
         HSY3yW90guyOdswIV1KXxip74ZNHvcekGkKXBpi5s3vc/7qv7VjOBwW+OfvKdZUIoUpZ
         LXoA==
X-Gm-Message-State: AOAM533hZOvUk/GOae1EFZsr8kJMAddoFtwX+gN2GSIOo3bQwKzt9DWF
        bHwNKRkqBcel9eXoHJii1jx/6A==
X-Google-Smtp-Source: ABdhPJwhrBA1PH1wFRcOMG8NB/r5aJoIfErXREF/rZUXctaKeXrTXYz71Ltn3UvLIg5V1x6wZ0rJUw==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr459851wmf.3.1616428532777;
        Mon, 22 Mar 2021 08:55:32 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:2091:71d6:3ab2:37f2? ([2a01:e34:ed2f:f020:2091:71d6:3ab2:37f2])
        by smtp.googlemail.com with ESMTPSA id l9sm15936903wmq.2.2021.03.22.08.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 08:55:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-ti-dm: Prepare to handle
 dra7 timer wrap issue
To:     Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
References: <20210304073737.15810-1-tony@atomide.com>
 <20210304073737.15810-2-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <556d55af-0b30-8751-6aef-2e1bb9db1a76@linaro.org>
Date:   Mon, 22 Mar 2021 16:55:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304073737.15810-2-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 04/03/2021 08:37, Tony Lindgren wrote:
> There is a timer wrap issue on dra7 for the ARM architected timer.
> In a typical clock configuration the timer fails to wrap after 388 days.
> 
> To work around the issue, we need to use timer-ti-dm timers instead.
> 
> Let's prepare for adding support for percpu timers by adding a common
> dmtimer_clkevt_init_common() and call it from dmtimer_clockevent_init().
> This patch makes no intentional functional changes.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

[ ... ]

> @@ -575,33 +574,60 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
>  	 */
>  	writel_relaxed(OMAP_TIMER_CTRL_POSTED, t->base + t->ifctrl);
>  
> +	if (dev->cpumask == cpu_possible_mask)
> +		irqflags = IRQF_TIMER;
> +	else
> +		irqflags = IRQF_TIMER | IRQF_NOBALANCING;

Can you explain the reasoning behind the test above ?

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
