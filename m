Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A943652C9
	for <lists+linux-omap@lfdr.de>; Tue, 20 Apr 2021 09:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhDTHDj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Apr 2021 03:03:39 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59931 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhDTHDj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Apr 2021 03:03:39 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYkPb-00063N-Py
        for linux-omap@vger.kernel.org; Tue, 20 Apr 2021 07:03:07 +0000
Received: by mail-ej1-f70.google.com with SMTP id i10-20020a1709067a4ab029037c5dba8400so4434682ejo.8
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 00:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+vF0KMe3QpB0Xi+B5gK5lpQVIB9Jaks3cx/F2luyNe4=;
        b=Jaf6biamLwXymz7xsxv7aeEqDVWclDgYTdNx7MNJU9j3AD+HVhq4xKDWG1rcJnYI82
         OgSjbE4xt7GyYrCnbMSokukn1NeVtP/1o7N/cgInTSMXGTepC3wioh7ZfGhTypV6M5mh
         w2tL2moJV2ZebqjllsL1k7FHzDUCkBNgzR3NxeS+Exze64cLORz0SfXghwIFDOUVZ28V
         JDO9Sw6CJlHEHKBmnmoHBA2MjUNr8vOwNN8Xce+1+OyMKol6QuTjfYLVh+SAy5xmmMDx
         qenTURGuHxkaNg62+Yl9cK1fPd9eA196lCPM9MAzIhZfCura8329zztAASSNNEEEoLMG
         LOTA==
X-Gm-Message-State: AOAM530T2zBrN15xq1/FXLBmJuco5M9Qus6v4HVpswxfcwbhKu4jOj8p
        zHrwJIrGeNmZZhK7XW+/LsJ0lfSHG+LB1C8pxRAxh/l8U4w/QRC6y4ila92Ta5UItq0jtGypaIv
        S8pEWOTzNkLtMae16n4UYSI1DewI0ejxxnmGfWoM=
X-Received: by 2002:a17:906:b118:: with SMTP id u24mr26032612ejy.331.1618902187417;
        Tue, 20 Apr 2021 00:03:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7JDxbo9Pv1X6zFkKyXBs1akihteUXUJX7v7Lo6wVceYKwdXjZHEu7LyuxSHPp24+F8ynZoQ==
X-Received: by 2002:a17:906:b118:: with SMTP id u24mr26032590ejy.331.1618902187211;
        Tue, 20 Apr 2021 00:03:07 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id ku8sm11906848ejc.111.2021.04.20.00.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 00:03:06 -0700 (PDT)
Subject: Re: [PATCH 5/7] mfd: sec: Simplify getting of_device_id match data
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
 <CGME20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d@eucas1p2.samsung.com>
 <20210419081726.67867-5-krzysztof.kozlowski@canonical.com>
 <64fb91ae-c754-fb25-0ef7-17b2f1b8a1e4@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4a5e80c0-653e-a4d6-630e-0d75e3779f6d@canonical.com>
Date:   Tue, 20 Apr 2021 09:03:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <64fb91ae-c754-fb25-0ef7-17b2f1b8a1e4@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/04/2021 07:25, Marek Szyprowski wrote:
> 
> On 19.04.2021 10:17, Krzysztof Kozlowski wrote:
>> Use of_device_get_match_data() to make the code slightly smaller.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>   drivers/mfd/sec-core.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
>> index 8d55992da19e..3126c39f3203 100644
>> --- a/drivers/mfd/sec-core.c
>> +++ b/drivers/mfd/sec-core.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/i2c.h>
>>   #include <linux/of.h>
>> +#include <linux/of_device.h>
>>   #include <linux/of_irq.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/pm_runtime.h>
>> @@ -324,12 +325,8 @@ static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
>>   						const struct i2c_device_id *id)
>>   {
>>   #ifdef CONFIG_OF
>> -	if (i2c->dev.of_node) {
>> -		const struct of_device_id *match;
>> -
>> -		match = of_match_node(sec_dt_match, i2c->dev.of_node);
>> -		return (unsigned long)match->data;
>> -	}
>> +	if (i2c->dev.of_node)
>> +		return (unsigned long)of_device_get_match_data(&i2c->dev);
>>   #endif
> 
> Does it make any sense to keep the #ifdef CONFIG_OF after this change?

Good point, it was only to hide usage of of_device_id table.

> I would also skip (i2c->dev.of_node) check, because 
> of_device_get_match_data() already does that (although indirectly).

First, the enum sec_device_type would need to be changed so it starts
from 1, not 0. It's because the value returned by this function is later
assigned to that enum and there is no way currently to differentiate
between NULL and S5M8767X.

Second, it wouldn't make the code smaller;

unsigned long data;
data = of_device_get_match_data(&i2c->dev);
if (data)
	return data;

Best regards,
Krzysztof
