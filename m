Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C301D57F0
	for <lists+linux-omap@lfdr.de>; Fri, 15 May 2020 19:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgEORaw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 May 2020 13:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726494AbgEORav (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 May 2020 13:30:51 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC59DC061A0C;
        Fri, 15 May 2020 10:30:49 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h188so2493887lfd.7;
        Fri, 15 May 2020 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h/F90YLQpUp0HHTIQUShz3e2nnAFVjUCmhXhEdzbwnY=;
        b=KibfLZUk0ftdUq5UDaH2o15irQFHqyz8gi8IqEMsrfk7C4YJfNpMj1v3aDGFgUiDl+
         Ei/Kt5/khtVtNkdg/aICAD6wcWLCfORTzMRxOmigg+/vPxaELL+8f1WC/9y11fbjbHfc
         GkSWrvrsVc/rgXn+5qNqg/TRJrPdhUTl+jp0IwbwXhNHIeTopMkk3ImSd+kEUIvFqBr+
         Yqg6bF92+Qyql0MoOeSdMxXGCb9h+vlV3qey2xv/lkRFsB9TtIqHzC7xJlYRvN6c3ydT
         twT6Vi7ldFq7ZGduwpM5To/mB8XIFwT2UhuzlXRkcydEWl9zsgVqe5PPOOGegc1+g2vc
         B3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h/F90YLQpUp0HHTIQUShz3e2nnAFVjUCmhXhEdzbwnY=;
        b=sEraOlyV+/B5BCM5fiPv4vnBkb/Xjerwg0gBuMwzgN1kTq5BEwxomuko6Dbk0nEhEi
         /P7r56yrQmZvrsSjA+GhAOOPzvouDGVPy5MTEbRopvFU9Fh/OkXEGLtya5ILdLQow9v1
         gm29tlcZCgVAnVtuGcigFqm5iEQ6ceJ8Aw1j9+b3+2f3+4oBiZTB1Whs7m8vX1e+zEQL
         6MojS8lWiV4L/sbhcL2OJ2hbNrBOFdp4KmHp/bdI0Dyv5UHbg6n/KHMBgLmbxnl93UYq
         eB/oSHgsiNAdykavktFI7pTwtaUGvVy6cGieDja844eSJaFt/oSvLRucR0m3hhw1CxgG
         2m2A==
X-Gm-Message-State: AOAM531H78aLFnwD4Natz1e6xv29Qd4AAoSNr9kXz3W2zcyixZjKeGRw
        RwwKmMh32NnMukg4thTjJ+A+F+1L
X-Google-Smtp-Source: ABdhPJzLU8VsfwD5/Dk7DrFX5XwnW81Mi8DgWZ+Ksz9fXlo1zTYn5GD+V6GGX8UA5KK8Mn9lMX5Wug==
X-Received: by 2002:ac2:5ccf:: with SMTP id f15mr3073677lfq.216.1589563847942;
        Fri, 15 May 2020 10:30:47 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j24sm1471099ljg.60.2020.05.15.10.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 10:30:45 -0700 (PDT)
Subject: Re: [PATCH v1] mfd: tps65910: Correct power-off programming sequence
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200514205022.7024-1-digetx@gmail.com>
 <20200515110754.GB20564@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7e1eaac5-34d1-f76e-e4c5-bc36f56a7064@gmail.com>
Date:   Fri, 15 May 2020 20:30:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515110754.GB20564@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

15.05.2020 16:30, Michał Mirosław пишет:
> On Thu, May 14, 2020 at 11:50:21PM +0300, Dmitry Osipenko wrote:
>> This patch fixes system shutdown on a devices that use TPS65910 as a
>> system's power controller. In accordance to the TPS65910 datasheet, the
>> PMIC's state-machine transitions into the OFF state only when DEV_OFF
>> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
>> otherwise PMIC won't get into a proper state on shutdown. Devices like
>> Nexus 7 tablet and Ouya game console are now shutting down properly.
>>
>> Tested-by: Zack Pearsall <zpearsall@yahoo.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/mfd/tps65910.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
>> index 11959021b50a..22116cee411d 100644
>> --- a/drivers/mfd/tps65910.c
>> +++ b/drivers/mfd/tps65910.c
>> @@ -440,8 +440,16 @@ static void tps65910_power_off(void)
>>  			DEVCTRL_PWR_OFF_MASK) < 0)
>>  		return;
>>  
>> -	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>> -			DEVCTRL_DEV_ON_MASK);
>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>> +			DEVCTRL_DEV_SLP_MASK) < 0)
>> +		return;
>> +
>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>> +			DEVCTRL_DEV_ON_MASK) < 0)
>> +		return;
>> +
>> +	tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
>> +			DEVCTRL_DEV_OFF_MASK);
>>  }
> 
> Isn't it enough to update the DEVCTRL with just one
> tps65910_reg_update_bits()?

IIRC, we've tried that variant and it didn't work. Although, maybe it
was affected by some other changes that we were trying simultaneously,
so could be worthwhile to re-check it. Thank you for the comment!
