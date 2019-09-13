Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D8BB267B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 22:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388622AbfIMULT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 16:11:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50930 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388418AbfIMULT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 16:11:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id c10so3983234wmc.0
        for <linux-omap@vger.kernel.org>; Fri, 13 Sep 2019 13:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zNVxNz3mg2mFN00qDZJTfKjqrppRjdElAR6WRxV8i5s=;
        b=Nca5dpbg8KWPsdFGVUvrLYgxncEdzK582cO45m88EtKGYmQLX/o8965ZurUD/0ml6j
         n7cJewG+i6EmT49po/Q4JPEqqErdm6fTV3SYNafapWuovY9QBoccztbv4Rx30t8GxpGt
         hCKyg4VckBJ+fJWI2jGdRilLf/1mr9xnJ35IuTLtMvzRwnGtewchwQWkL0XHqeUezk2B
         H5kGDGqAhAdvYyX0lLGgCPbQAKbZGAWFRxngbvZrroD92lnSUTwWhMIZo19GRsVz5KRS
         8pr8plRd1G+mqOd3QA7emWfwykNEDUvChG+CqCZTM/B37LgvJcV8hHsUHzOxzk34k/0d
         42zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zNVxNz3mg2mFN00qDZJTfKjqrppRjdElAR6WRxV8i5s=;
        b=PE0Cc9iFpweKjwkRZ9UTfFkEGRkUp+TZ5qWOpdeZhs3mYCMwa8wKPGPVm6lhP84fdz
         cUGVm/bNQ/Vvv03knguSFumQTDz6hbLcvn1nygJPwHGGSLfZBAFKEn4mbM7eQChhErkA
         ZDOJtH4UX/JpinN+I41ps0vjZRYmFrG9+LstmG2I4bnwn/9UhLfNPnjoljmTGjIlewbH
         yvEtEaXXly8XmQNso4T9Y4+XqwHj9JoMSM/h4jPKCDvs7C8ocmP0bFnIgoKNJ9ODO1kt
         153y46UOrcBUNc3728O811Y2OgwKFnDs5hAmqNsNUwOFUY5Lf5PAIEpjvj13Y7xGCizC
         GoXA==
X-Gm-Message-State: APjAAAXbi9HjFpGOlB6rcmWxDVlCB1cDWCZNglAJa2Pfj3zmWu8ZMejk
        eSYIhKq/M3OQUHgKIJ95rMVRNQ==
X-Google-Smtp-Source: APXvYqyWTzXdy49xxrxkK7UAjUzcYxRnovSXronlcnLxWCE4YFF9AUy1Xx8MLhpucr5WzMWHDQ1EPw==
X-Received: by 2002:a1c:ca0f:: with SMTP id a15mr4792106wmg.102.1568405475350;
        Fri, 13 Sep 2019 13:11:15 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:1071:7577:6038:b6fe? ([2a01:e34:ed2f:f020:1071:7577:6038:b6fe])
        by smtp.googlemail.com with ESMTPSA id d4sm2567802wrq.22.2019.09.13.13.11.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 13:11:14 -0700 (PDT)
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     Adam Ford <aford173@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
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
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7ebe4c56-1b89-d90d-eeb4-25adaa58dd17@linaro.org>
Date:   Fri, 13 Sep 2019 22:11:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLcCO-QrYTm0jzS64P6o5t8cfudJfYELDSz-_OPV5JO5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13/09/2019 20:46, Adam Ford wrote:
> On Fri, Sep 13, 2019 at 12:18 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> On 13/09/2019 18:51, H. Nikolaus Schaller wrote:
>>
>> [ ... ]
>>
>>>> Good news (I think)
>>>>
>>>> With cooling-device = <&cpu 1 2> setup, I was able to ask the max
>>>> frequency and it returned 600MHz.
>>>>
>>>> # cat /sys/devices/virtual/thermal/thermal_zone0/temp
>>>> 58500
>>>> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
>>>> 300000 600000 800000
>>>> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_m
>>>> scaling_max_freq  scaling_min_freq
>>>> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
>>>> 600000
>>>
>>> looks good!
>>> But we have to understand what the <&cpu 1 2> exactly means...
>>>
>>> Hopefully someone reading your RFCv2 can answer...
>>
> Daniel,
> 
> Thank you for replying.
> 
>> I may have missed the question :)
>>
>> These are the states allowed for the cooling device (the one you can see
>> in the /sys/class/thermal/cooling_device0/max_state. As the logic is
>> inverted for cpufreq, that can be confusing.
> 
> I think that's what has be confused.
> 
>>
>> If it was a fan with, let's say 5 speeds, you would use <&fan 0 5>, so
>> when the mitigation begins the cooling device state is 0 and then the
>> thermal governor increase the state until it sees a cooling effect.
>>
>> If <&fan 0 2> is set, the governor won't set a state above 2 even if the
>> temperature increases.
> 
> I am not sure I know what you mean by 'state' in this context.

A thermal zone is managed by the thermal framework as the following:
 - a sensor
 - a governor
 - a cooling device

The governor gets the temperature via the sensor and depending on the
temperature it will increase or decrease the cooling effect of the
cooling device. With a fan, that means it will increase or decrease its
speed. With cpufreq, it will decrease or increase the OPP.

These are discrete values the governor will use to set the cooling
effect. The state is one of these value (the current speed or the
current OPP index).

Depending on the cooling device, the number of states are different.

In the context above, the fan cooling device can be stopped (state=0),
running (state=1), running faster (state=2).

As the node tells to use no more than 2, then the governor will never go
to running much faster (state=3). (That's an example).

>> When the cooling driver is able to return the number of states it
>> supports, it is safe to set the states to THERMAL_NO_LIMIT and let the
>> governor to find the balance point.
> 
> If the cooling driver is using cpufreq, is the number of supported
> states equal to the number of operating points given to cpufreq?

Yes, absolutely if THERMAL_NO_LIMIT is set [1] (which is what is done
most of the cases). Otherwise it will use the boundaries set in <&cpu
limit_low limit_high>

When changing the limits, a state=1 has a different meaning.

For example: 7 OPPs available

<&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT> : state=[0..7]

<&cpu 0 2> : state=[0..2] (1, 2)

<&cpu 5 7> : state=[0..3] (5, 6, 7)

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thermal/cpu_cooling.c#n334

>> Now if the cooling device is cpufreq, the state order is inverted,
>> because the cooling effects happens when decreasing the OPP.
>>
>> If the boards support 7 OPPs, the state 0 is 7 - 0, so no mitigation, if
>> the state is 1, the cpufreq is throttle to the 6th OPP, 2 to the 5th OPP
>> etc.
> 
> I am not sure how the state would be set to 2.

That is a governor decision. Let me give an example with a hikey960
board which has very fast temperature transitions, so it is simpler to
illustrate the behavior. The trip point is 75°C.

Imagine the CPU gets loaded 100%, the cpufreq sets the OPP to the max
(2.36GHz), as the temperature is still under 75°C, there is no
mitigation yet, so the cooling device state is 0.

In a very few seconds the temperature reaches 75°C, that trigger the
monitoring of the thermal zone and the mitigation begins, then the
temperature continues to increase very quickly to 78°C, the governor see
we are above the trip point and increment the cooling device state
(state=>1). That leads to an OPP change from 2.36GHz to 2.11GHz.

The governor continues to read the temperature and see the temperature
is still increasing (even if it is that happens more slowly), so it
increases the state again (state=>2). That leads to an OPP change from
2.11GHz to 1.8GHz.

The governor continues to read the temperature and see the temperature
decrease, it does nothing.

The governor continues to read the temperature, see the temperature
decreases and is below 75°C, it decrease the state (state=>1), the OPP
change to 2.36GHz.

The temperature then increases, etc ...

Actually the governors do more than that but it is for the example.

So it is a bad idea to set boundaries for the cooling device state as
that may prevent the governor to take the right decision for the cooling
effect. Imagine in the example above, we set the max state to 1 for the
cooling device, that would mean the governor won't be able to stop the
temperature increasing, thus ending up to a hard reboot.

>> Now the different combinations:
>>
>> <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT> the governor will use the state
>> 0 to 7.
>>
>> <&cpu THERMAL_NO_LIMIT 2> the governor will use the state 0 to 2
> 
> What would be the difference between  <&cpu THERMAL_NO_LIMIT 2>  and
> <&cpu 0 2> ?
> (if there is any)

There is no difference.


>> <&cpu 1 2> the governor will use the state 1 and 2. That means there is
>> always the cooling effect as the governor won't set it to zero thus
>> stopping the mitigation.
> 
> For the purposes of the board in question, we have 4 operating points,
> 300MHz, 600MHz, 800MHz and 1GHz.  Once the board reaches 90C, we need
> them to cease operation at 800MHz and 1GHz and only permit operation
> at 300MHz and 600MHz.  I am going under the assumption that the cpu
> index[0] would be for 300MHz, index[1] = 600MHz, etc.
> 
> If I am interpreting your comment correctly, I should set <&cpu
> THERMAL_NO_LIMIT 2> which would allow it to either not cool and run up
> to 600MHz and not exceed, is that correct?

Nope, it will mean the cooling device can only reduce to 800MHz and to
600MHz to mitigate.

Actually the thermal framework neither the kernel are designed to handle
this case. They assume the OPPs are stable whatever the thermal situation.

That is the reason why I think it is a very interesting use case because
it introduces a temperature constraint in addition to a duration for a
certain OPP. IMO, that could be an extension of the turbo-mode.

With what we have now, I doubt it is feasible.

The best we can do is preventing to reach the 90°C, so we remove the OPP
temperature constraint. I suppose 85°C is a safe temperature to stick on.

And in order to let the governor have free hand.

<&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>

I don't think that will have a significant impact on performances
compared to be able to run at a higher temperature with less OPPs.


>> Does it clarify the DT spec?
>>
> 
> I think your reply to my inquiry might.  If possible, it would be nice
> to get this documented into the bindings doc for others in the future.
> I can do it, but someone with a better understanding of the concept
> maybe more qualified.  I can totally understand why some may want to
> integrate this into their SoC device trees to slow the processor when
> hot.
> 
> Thank you for taking the time to review this.  I appreciate it.
> 
> adam
> 
>>
>>
>>
>>> What happens with trip point 60000?
>>> (unfortunately one has to reboot in between or can you kexec between two kernel/dtb versions?)
>>>
>>> BR,
>>> Nikolaus
>>>
>>
>>
>> --
>>  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>>
>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>> <http://twitter.com/#!/linaroorg> Twitter |
>> <http://www.linaro.org/linaro-blog/> Blog
>>


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

