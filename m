Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8494F1E46CA
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 17:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389277AbgE0PDb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 11:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389202AbgE0PDb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 May 2020 11:03:31 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18A6C05BD1E;
        Wed, 27 May 2020 08:03:30 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w15so14610534lfe.11;
        Wed, 27 May 2020 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5PEZQYwxj5Q5G0STX9V14FASvHWKnh/kX+D4eRBfroI=;
        b=legZUfT07G44e584tiKggypvslg3wNxeX6VtiW1C2ZskXQCVTi5kisjdmPC4A4ZN73
         aS1yx4o5GG2fPSSCeJRjjAlZ13a1x4BFPgFzx2GTpGeGOtxk9YhOCcl8K/tGwU6H2fhq
         xVjca0WJC2oboSoODihKPDbvYC3l8M5dG5zuwDkk412XEnFJUzs9vVrpR0SZcPhjD4in
         AnVbL2sI9pUaaNZ46zf2ZLsN3zbsCKj9Rgvjf/Q2GQBfO796tEE0mx9t5yEyJW87W5g4
         hy5OvsAPQfRNUJuRkrEugEPs+dpps5Bexq7gCEVya4NFROXbxJihxI4CFAXfLTXbAwih
         ybqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5PEZQYwxj5Q5G0STX9V14FASvHWKnh/kX+D4eRBfroI=;
        b=PZvNEwuE92SpB5TEjumPi0BEjF9tQ6iKZwd+H0BHP5+xCgRkXtU1tbGcI+D3X14Hev
         QHFf/w95YzoFaDD1XXd4awwga1xWk8MlX704uR4dMjXe4aTXIHiEni56wxHykl1KF6F9
         /XVyAvMZyxmznE7Kwy3v+jPK5NhGMpXkMvmRQLidtezbVIUOIYC7BpHmBatuGE2HBcvW
         oJZohjttknfrD8OZANg2qm/EqvOT5nOUONhKKD935/d438TLYVx1I82aeyLYgNDzaFrz
         uo/v7DC0nYd3v3tY5tBdJF/Wd2dSpGKPJP+liVvLdqyRf0vxvpGvGYV5mAVXpSBUR737
         KhxQ==
X-Gm-Message-State: AOAM530ciRsZSQguww93sZyOkmo0L+iCuNen2lbiAoYZPxBDZcPyTVak
        6AI5N07ZoHYU8D6ttYqv2gDLZwIr
X-Google-Smtp-Source: ABdhPJwURfk8KquHUrvcKNLx4TIbo+P1L6YDAA/aTf2+iuE0weUg10TBsNSw8yCXrSM6aKw6sS179Q==
X-Received: by 2002:a19:c8cb:: with SMTP id y194mr3434658lff.89.1590591808925;
        Wed, 27 May 2020 08:03:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-173-94.dynamic.spd-mgts.ru. [109.252.173.94])
        by smtp.googlemail.com with ESMTPSA id g142sm860072lfd.59.2020.05.27.08.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 08:03:28 -0700 (PDT)
Subject: Re: [PATCH v2] mfd: tps65910: Correct power-off programming sequence
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200524192643.18207-1-digetx@gmail.com>
 <20200526145952.GA2517@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <90055b31-22ea-d427-42cb-79bcc0a350bd@gmail.com>
Date:   Wed, 27 May 2020 18:03:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526145952.GA2517@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

26.05.2020 18:01, Michał Mirosław пишет:
> On Sun, May 24, 2020 at 10:26:43PM +0300, Dmitry Osipenko wrote:
>> This patch fixes system shutdown on a devices that use TPS65910 as a
>> system's power controller. In accordance to the TPS65910 datasheet, the
>> PMIC's state-machine transitions into the OFF state only when DEV_OFF
>> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
>> otherwise PMIC won't get into a proper state on shutdown. Devices like
>> Nexus 7 tablet and Ouya game console are now shutting down properly.
> 
> The datasheets of 65910 and 65911 say that ON and SLP bits are cleared
> during OFF state. But I guess the hardware might work differently.

Indeed, sounds like we can remove the SLP bit-clearing safely. IIUC,
both tps65910 and tps65911 are nearly the same in regards to the
power-off programming, tps65911 only supports an additional (sequential)
power-off mode.

I'm not sure whether we've tried to remove the SLP bit-clearing before,
will be interesting to try.

> [...]
>> --- a/drivers/mfd/tps65910.c
>> +++ b/drivers/mfd/tps65910.c
>> @@ -440,8 +440,13 @@ static void tps65910_power_off(void)
>>  			DEVCTRL_PWR_OFF_MASK) < 0)
>>  		return;
>>  
>> -	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>> -			DEVCTRL_DEV_ON_MASK);
>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>> +			DEVCTRL_DEV_SLP_MASK) < 0)
>> +		return;
>> +
>> +	tps65910_reg_update_bits(tps65910, TPS65910_DEVCTRL,
>> +				 DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
>> +				 DEVCTRL_DEV_OFF_MASK);
>>  }
> 
> There is tps65910_reg_set_bits() at the start of function. I guess it
> doesn't work if your changes are needed. Maybe you can remove it?

It enables the "sequential power-off, reverse of power-on sequence",
like datasheet says. I think it works and we actually need that PWR_OFF
bit to be set separately, before setting the DEV_OFF bit.

> I would also include your observations about the chip's behaviour in the
> commit message so it doesn't get "fixed" later.

I'll add a clarifying comment about it in v3, thank you for the suggestions.
