Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B418122814C
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 15:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGUNtF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jul 2020 09:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgGUNtF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jul 2020 09:49:05 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA78FC061794
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 06:49:04 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j18so2909598wmi.3
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eqcpjEIrcsVSFBgsxPpIE2wbXMnlhFiLHo79g30IYmY=;
        b=FcI07BgDIsQZnkKoQ7ZcelTbxx0IA3ghFJ3Jg7OvrTSEL0HsT3x+ya+4TvM3rxzq9S
         hKDrIRS7FLmiJJlrm2pw4emkaM4YwW+5lNnfH2p4H9zbIkt3/rmGr37tE3X+I2Bhw9DP
         EhlJg7hwSeMEL1lgIp7CE9zMkvVgqPhp8ybhtTo7ImQb3ugD/RmY9q00cvjAxoL2UJbR
         7WV3925u7CnPpMJ+eWmdN8bTzR/8FrZhnjEONC8SaaJTwdJHixMAQG5zTZ7ChqVpmm7R
         UJxo6ac0ASf+//JmKtM3O3gdyceW3Dc+eyGAzJTP12A/Q5o4lPKHjDsHBJffLtK+KnUG
         mRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eqcpjEIrcsVSFBgsxPpIE2wbXMnlhFiLHo79g30IYmY=;
        b=P69Y4Cpr2SQRgNDLQXtYpydIUwieKGC5phjX/0W+1tgWlvYQaQ5cmw5sb/UsixgCkM
         UxXCdQ6ONAWTdAI62XeQUKlP3zsEOW+DlHdFsveWx9/yHU/LGWBJdpPOnFBthlhAa6in
         ZG1sG7MxIzWp3LSDpv0cnzpQQe+X9ytUOE9JbvfjBmxEDFVqaOoVOpU6Ve28LBzhV2ox
         4cSoEydT3BZMNN06wUpB1shLegwhPz3MP7ti9aEA+q639GCbUCXD3pY2lGKL8sC6wO2E
         Qc9QB3QW1TWu1q04pZI1OVullWSh8WvWHwS/nTDzauW7ZbiH82nplfsUw3NBZnzQx9J9
         o8bA==
X-Gm-Message-State: AOAM5313ZVgWmzzWdjeAaGJBdMtqHcKySyx4R8RomoDwkRacQbjvkyM4
        O+M6U0S8UUkqbUnfSEkVLXtmpQ==
X-Google-Smtp-Source: ABdhPJy3d+hLbGrGf/sSsPOwfCC1/TSYzvAB67Rw+TgT/X9vHSPS3HJvfRFbLW/K+8t5eo0f5yKlsw==
X-Received: by 2002:a1c:31c6:: with SMTP id x189mr3917750wmx.182.1595339343428;
        Tue, 21 Jul 2020 06:49:03 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c144:5385:c824:85ce? ([2a01:e34:ed2f:f020:c144:5385:c824:85ce])
        by smtp.googlemail.com with ESMTPSA id d18sm40156733wrj.8.2020.07.21.06.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 06:49:02 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
To:     Carlos Hernandez <ceh@ti.com>, Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200713162601.6829-1-tony@atomide.com>
 <1ac1ac81-1335-8ba2-590c-8f57c2df1910@linaro.org>
 <6b5fc12c-4da3-fc67-b9dd-bfca2ae870f2@ti.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <2081a11d-8678-03ec-cde4-b4eaae10e82d@linaro.org>
Date:   Tue, 21 Jul 2020 15:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b5fc12c-4da3-fc67-b9dd-bfca2ae870f2@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/07/2020 15:11, Carlos Hernandez wrote:
> 
> On 7/17/20 6:29 AM, Daniel Lezcano wrote:
>> On 13/07/2020 18:26, Tony Lindgren wrote:
>>> Carlos Hernandez <ceh@ti.com> reported that we now have a suspend and
>>> resume regresssion on am3 and am4 compared to the earlier kernels. While
>>> suspend and resume works with v5.8-rc3, we now get errors with rtcwake:
>>>
>>> pm33xx pm33xx: PM: Could not transition all powerdomains to target state
>>> ...
>>> rtcwake: write error
>>>
>>> This is because we now fail to idle the system timer clocks that the
>>> idle code checks and the error gets propagated to the rtcwake.
>>>
>>> Turns out there are several issues that need to be fixed:
>>>
>>> 1. Ignore no-idle and no-reset configured timers for the ti-sysc
>>>     interconnect target driver as otherwise it will keep the system
>>> timer
>>>     clocks enabled
>>>
>>> 2. Toggle the system timer functional clock for suspend for am3 and am4
>>>     (but not for clocksource on am3)
>>>
>>> 3. Only reconfigure type1 timers in dmtimer_systimer_disable()
>>>
>>> 4. Use of_machine_is_compatible() instead of of_device_is_compatible()
>>>     for checking the SoC type
>>>
>>> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent
>>> and clocksource support")
>>> Reported-by: Carlos Hernandez <ceh@ti.com>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
> 
> Tested-by: Carlos Hernandez <ceh@ti.com>

Thanks

>> Carlos, were you able to test this patch ?
>>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
