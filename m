Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAEAB2ADE
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 11:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfINJxy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 05:53:54 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38056 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbfINJxx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Sep 2019 05:53:53 -0400
Received: by mail-wm1-f66.google.com with SMTP id o184so5145083wme.3
        for <linux-omap@vger.kernel.org>; Sat, 14 Sep 2019 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pNp4HRnH8LauXw36MlEHyntC6rJWJRXDy9OYuB0DD6A=;
        b=pXrIGRZVCQXP/pZJ2SCbWHN71Lj/izr55YPO6ML8ydoxl0chUeMS9yWh/g+POxzoFq
         dviapQmRrAHXfozcl8/JMCnv4DNGYc0dxuJ0LThqV7kciyxElH/94rhUwCDNW61UcnBa
         gJ7xQQTwcvNHt2yMfHtGuiQngwPoYWnxZtJmW0avd1v5nRjYtq1CO9S/DxrSOyU8NQ5N
         aTDokYyc6VicwlWu37guun6NrU9mpydcxcNVp67g60gsbPr3OaNBnPxXPA4wNeL1aLe7
         XwqrhQT59LDDXgFVs8kE757Qi40cCc0zlsOzQCgC1XEPS9UGcImZl6kbbVkavL5qG1So
         nZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pNp4HRnH8LauXw36MlEHyntC6rJWJRXDy9OYuB0DD6A=;
        b=qV7qAc3u7DmVylAFJRifcYpQN3mzBu2VlqJwd3THudLMsoIhxQTHtqWG60HzTuKThr
         AeoQOK/ehol2klAKFLOaalluIn5ITFFZikP46wIoUYVq+0kuTV2rk4zWlWq7Nx9Wq2Rv
         XzF93WaAM4+6tMMBSDQCy9s9bzeVkZpAGCUiIol6WVrmRfZYrJ2c3qEG1F2o+1X4FS93
         lnKpgZSyU6Jz3lk5npiQNsgdVUtqBKX2aP6hRrhpCPF58A8gjSLk3KUoslEKS8ZOL63a
         P9lANqrUY5LO9DX8EIBqMN3I1xS5CTO6NULisRYRPtc1CAK/NK7+f99kWIyKtJvToQLB
         J/3g==
X-Gm-Message-State: APjAAAWs8AA19sp7bEYgPRRuLXY0vguJGaOwSN+Xj607yuOvv7D2TrVZ
        1PO5slx8VC/Z9zyPM3R1I6c3Ag==
X-Google-Smtp-Source: APXvYqysEKRXnto253Lar5weIIvCNBZo/zO3EjaRdSEEi21VxQpnnpafcNJt0LN9C/Y2LOX/8oNDWg==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr6796311wmh.29.1568454830326;
        Sat, 14 Sep 2019 02:53:50 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:1071:7577:6038:b6fe? ([2a01:e34:ed2f:f020:1071:7577:6038:b6fe])
        by smtp.googlemail.com with ESMTPSA id z1sm55541572wre.40.2019.09.14.02.53.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2019 02:53:49 -0700 (PDT)
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=c3=a9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>,
        kernel@pyra-handheld.com
References: <20190912183037.18449-1-aford173@gmail.com>
 <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
 <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com>
 <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
 <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com>
 <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
 <7C9393BD-B23B-41A6-BF96-E53CD707AAC7@goldelico.com>
 <CAHCN7x+_f_jrttUGyKHBOUyYjkOx0mJxba1Yb3tPm9ee7+21og@mail.gmail.com>
 <CAHCN7xLODa114M77-rX9WHT+uJtsH3yOmbFG2KdEjZpTSECs2w@mail.gmail.com>
 <D3AF2868-F9A4-4176-A851-5DCF029B65A9@goldelico.com>
 <81d6cd33-4930-6753-d5ed-678cb1d2038d@linaro.org>
 <CAHCN7xLcCO-QrYTm0jzS64P6o5t8cfudJfYELDSz-_OPV5JO5w@mail.gmail.com>
 <7ebe4c56-1b89-d90d-eeb4-25adaa58dd17@linaro.org>
 <42A53316-100E-4899-9D77-CD9F5129179E@goldelico.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c9bb9c0b-0327-4fc6-afd9-56f016b9a3b3@linaro.org>
Date:   Sat, 14 Sep 2019 11:53:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <42A53316-100E-4899-9D77-CD9F5129179E@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



Hi Nikolauss,

On 13/
09/2019 22:34, H. Nikolaus Schaller wrote:

[ ... ]

>> The governor continues to read the temperature and see the temperature
>> decrease, it does nothing.
> 
> Ah, I think our misunderstanding is that the govenor "enables" and
> "disables" a set of OPPs. Rather it goes down or up in the list if
> above or below a trip point.

Right.

>> The governor continues to read the temperature, see the temperature
>> decreases and is below 75°C, it decrease the state (state=>1), the OPP
>> change to 2.36GHz.
>>
>> The temperature then increases, etc ...
>>
>> Actually the governors do more than that but it is for the example.
>>
>> So it is a bad idea to set boundaries for the cooling device state as
>> that may prevent the governor to take the right decision for the cooling
>> effect. Imagine in the example above, we set the max state to 1 for the
>> cooling device, that would mean the governor won't be able to stop the
>> temperature increasing, thus ending up to a hard reboot.
> 
> Well, the data sheet only requires that the high speed OPPs are only
> used below 90°C. If I understand correctly if we set the trip point to
> 90°C it will simply go down through the full list of OPPs. This will
> clearly avoid the high speed OPPs (and potentially some low-speed
> ones, but that does not harm).

Yes, right.

> So our approach "how to make it disable these two OPPs" seems to be
> wrong. Rather, we have to think "make sure the temperature
> stays below 90°C".

Your approach is not wrong, it proves there is a limitation in the
thermal/cpufreq framework.

There is the 'turbo mode' [1] which describes exactly what you want but
I'm not sure it is fully implemented.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/opp/opp.txt#n138

> And is it true that we do not have to define mapping for the "critical"
> trip points?

Right, you don't have to, it is optional. But the critical trip point
will make your system to shutdown in case something is going wrong, for
example an external heating source, like the sun or whatever. It is good
to set a high temperature to force the shutdown .
Usually it is below the hardware reset temperature.


>>>> Now the different combinations:
>>>>
>>>> <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT> the governor will use the state
>>>> 0 to 7.
>>>>
>>>> <&cpu THERMAL_NO_LIMIT 2> the governor will use the state 0 to 2
>>>
>>> What would be the difference between  <&cpu THERMAL_NO_LIMIT 2>  and
>>> <&cpu 0 2> ?
>>> (if there is any)
>>
>> There is no difference.
>>
>>
>>>> <&cpu 1 2> the governor will use the state 1 and 2. That means there is
>>>> always the cooling effect as the governor won't set it to zero thus
>>>> stopping the mitigation.
>>>
>>> For the purposes of the board in question, we have 4 operating points,
>>> 300MHz, 600MHz, 800MHz and 1GHz.  Once the board reaches 90C, we need
>>> them to cease operation at 800MHz and 1GHz and only permit operation
>>> at 300MHz and 600MHz.  I am going under the assumption that the cpu
>>> index[0] would be for 300MHz, index[1] = 600MHz, etc.
>>>
>>> If I am interpreting your comment correctly, I should set <&cpu
>>> THERMAL_NO_LIMIT 2> which would allow it to either not cool and run up
>>> to 600MHz and not exceed, is that correct?
>>
>> Nope, it will mean the cooling device can only reduce to 800MHz and to
>> 600MHz to mitigate.
>>
>> Actually the thermal framework neither the kernel are designed to handle
>> this case. They assume the OPPs are stable whatever the thermal situation.
>>
>> That is the reason why I think it is a very interesting use case because
>> it introduces a temperature constraint in addition to a duration for a
>> certain OPP. IMO, that could be an extension of the turbo-mode.
>>
>> With what we have now, I doubt it is feasible.
>>
>> The best we can do is preventing to reach the 90°C, so we remove the OPP
>> temperature constraint. I suppose 85°C is a safe temperature to stick on.
>>
>> And in order to let the governor have free hand.
>>
>> <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>
>>
>> I don't think that will have a significant impact on performances
>> compared to be able to run at a higher temperature with less OPPs.
>>
>>
>>>> Does it clarify the DT spec?
>>>>
>>>
>>> I think your reply to my inquiry might.  If possible, it would be nice
>>> to get this documented into the bindings doc for others in the future.
>>> I can do it, but someone with a better understanding of the concept
>>> maybe more qualified.  I can totally understand why some may want to
>>> integrate this into their SoC device trees to slow the processor when
>>> hot.
>>>
>>> Thank you for taking the time to review this.  I appreciate it.
>>>
>>> adam
> 
> BR,
> Nikolaus
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

