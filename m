Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E0F1D9C86
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 18:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgESQ0h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 12:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729219AbgESQ0g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 May 2020 12:26:36 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA04C08C5C0
        for <linux-omap@vger.kernel.org>; Tue, 19 May 2020 09:26:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id v12so37824wrp.12
        for <linux-omap@vger.kernel.org>; Tue, 19 May 2020 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K6T9ygmhh8EhbslL3sJRcc4x716+9VUP4WUa0BI/g7k=;
        b=KyS2adH6J20IkVkDzWeskLntpio/aiFWAT54p7fge0aGwq3syL00BvBetJl0+S1Gnw
         GXiik1Xnty5KjvC6I1Vav4WpmOS/PB7uow2Fow8lo/ak63ln61UKwoJO7dUjyRTuBvQj
         iqtvoW2rtsrfYUcOjK6uAiQl78R/CjYrHy7zZmAu3PafwnKivwYvG99IgImSE7twVEpv
         tNPInTEymxi7rKYnrKdyfChxrF6eDnUB0Q5HEoi1jdAzWmIpLSBXQQXraFWjPc+v50W2
         bNFNzqRChTJfsBt+A6gsbE4+bqe4jx+RIQxQb49wiOalqqwsK9LQYmQTy6stJrsAhD/z
         b83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K6T9ygmhh8EhbslL3sJRcc4x716+9VUP4WUa0BI/g7k=;
        b=mOAACpWm9u1lNCAOuNk0gtznXNr054wOiIrZogWd9I6N5V3uNSR2os6PYcwcnQ1aym
         zbDfV/QyTawVdBQEyd9/Lyc4qE8+2yFB892HnCi96sXhUrQtqBT8GanNR70wE2VJ4VNs
         sJRG7IxbWMWh3zdLk1jgOBFjAWZ1YEo043ddd6dsupJEhEty8833wx7+6uT0Lst98wTi
         7iqgPxKJGxAvBpM0Yy9yMkBrkcuWCAPwBrCKkES6RP6RCvhVerNKj6k+PnwZcRHvCOOH
         cg+nypDv9cciIjWFTuigUGjG837uP6E5/yq8xSgwujT625yIRBcCFNW86f8DmeNvQlKW
         yFYw==
X-Gm-Message-State: AOAM532T4MNvQysEkfDGCoqqMtWG+c4JDkcAQ5TKV59xWi5qvaGywvkv
        mWuHt/HYmdIgi660ZJjDMMzGdgPOiD0=
X-Google-Smtp-Source: ABdhPJwRjXPCt4dLaDXXZQvKwEnH3bzcKxN3nJxJp0U7JlJ1qTXlZcQj1Ebi+46WU21NIvSpo2QqKQ==
X-Received: by 2002:a5d:4806:: with SMTP id l6mr27114609wrq.121.1589905593900;
        Tue, 19 May 2020 09:26:33 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e504:4297:986:ffb0? ([2a01:e34:ed2f:f020:e504:4297:986:ffb0])
        by smtp.googlemail.com with ESMTPSA id x22sm203518wmi.32.2020.05.19.09.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:26:33 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix warning for set but
 not used
To:     Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kbuild test robot <lkp@intel.com>
References: <20200519155157.12804-1-tony@atomide.com>
 <2f67a110-e52f-94fc-fae2-c3171a67bb8a@linaro.org>
 <20200519160630.GV37466@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <552325fe-e759-6b22-ceee-2d0a4b3b4b2f@linaro.org>
Date:   Tue, 19 May 2020 18:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519160630.GV37466@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/05/2020 18:06, Tony Lindgren wrote:
> * Daniel Lezcano <daniel.lezcano@linaro.org> [200519 16:01]:
>> On 19/05/2020 17:51, Tony Lindgren wrote:
>>> We can get a warning for dmtimer_clocksource_init() with 'pa' set but
>>> not used. This was used in the earlier revisions of the code but no
>>> longer needed, so let's remove the unused pa and of_translate_address().
>>> Let's also do it for dmtimer_clockevent_init() that has a similar issue.
>>>
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>
>> Applied, thanks
> 
> Thanks! Do you already have some immutable commit I can use
> as the base for the SoC and dts changes? Or do you want to
> wait a bit for that?

Hi Tony,

https://git.linaro.org/people/daniel.lezcano/linux.git/log/?h=timers/drivers/timer-ti

it contains the two patches + the warning fix

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
