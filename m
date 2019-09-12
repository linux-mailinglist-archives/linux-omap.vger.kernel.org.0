Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87343B164E
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 00:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfILWdr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 18:33:47 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37728 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfILWdr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 18:33:47 -0400
Received: by mail-wm1-f68.google.com with SMTP id r195so617096wme.2
        for <linux-omap@vger.kernel.org>; Thu, 12 Sep 2019 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZsqN86h5WbPq7Dpp9HUwKTFNGt5lllJGgSB3BnL4nwQ=;
        b=rv4reagk4+PpKDXzvEI+hg8b/IFqQ5M+F6kxd+1pmm1gpAAsJq78Q304rP7hxaUjKS
         Ztpw8iHcYAFtPC/sV07ZffnJP6hBD3QmLwk4OmZ4Sel1jLD547iidq/09knQD55PXh00
         ZT5gS3y4tNoy84yCR8ind6CI2YnGizCQ+zSTDHC6KTP9OoOG2XWxKWAXxlQhKZtwppoa
         7hvQBPq6O3M86s/I3/WAvzCw7FOijUaWH1iVbKO1PTFk3TfywmgPo2wnAqQmo8kokp8g
         YPN1QazFUvMJ0MNhkbVhaWlbb2ChMoMetQTYVWH1ugnyO5oraSb4/gLdXpAfnSWITNDP
         BSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZsqN86h5WbPq7Dpp9HUwKTFNGt5lllJGgSB3BnL4nwQ=;
        b=J3GRhaRRExaNpYvaPv2IpHFQpgQO7Sgfv+qxX0ILMpdW89l9srf1Ql8Ot5tf32qcol
         RqVPdFXSik07qrMewUXzp9jpWKnD7u0B9skF2+9vT8t62/eA0gDY3kpD49koZMulPiCF
         IyvzXxI40ju/TbOPikc60v2ZZGnFfEvwjEbGEcCiK9zvmsp/pFiK26CFKAFi8k9iI6ER
         hsIhjPg+lBJ3kr3cwY/bOB1+YKfgkYoGf59Gsw9KRY52BLXpuj46+EIQgYwYf//qJrxQ
         OqPns6kG5tZTrp3Y6/8HZYu6EPpgoddpNMiiBp88YrZtOnn9tJfhSkZXw0OFfwfV0nma
         Nx2Q==
X-Gm-Message-State: APjAAAXoxqkW/WOko8jKXLeQTbjDg20lDnfx21MLWc09h67OJbj98DSg
        PfXzBIs4B6CO923+MbjGT5JE2V54bHTVtw==
X-Google-Smtp-Source: APXvYqzfZ/CBXMPc8nLV3JFm+7P/Y4k0aLGd7RA/20c6HKWoHSxRXFZyKW4JNXD47PG4GDqX66GEbA==
X-Received: by 2002:a05:600c:20c2:: with SMTP id y2mr689380wmm.68.1568327623253;
        Thu, 12 Sep 2019 15:33:43 -0700 (PDT)
Received: from [192.168.3.203] ([148.69.85.38])
        by smtp.googlemail.com with ESMTPSA id z13sm1796803wrq.51.2019.09.12.15.33.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 15:33:42 -0700 (PDT)
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     Adam Ford <aford173@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=c3=a9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>
References: <20190912183037.18449-1-aford173@gmail.com>
 <51bb8890-bfd7-c241-1ce5-151df3a90513@linaro.org>
 <CAHCN7xKjwkJHysSkNymF=sw6KuS=FqbapuRFZODuj6E_hmRG1A@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2ef812a4-2f2d-b2e2-9fa4-080775e24bc8@linaro.org>
Date:   Fri, 13 Sep 2019 00:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKjwkJHysSkNymF=sw6KuS=FqbapuRFZODuj6E_hmRG1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Adam,

On 12/09/2019 23:19, Adam Ford wrote:
> On Thu, Sep 12, 2019 at 4:12 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> On 12/09/2019 20:30, Adam Ford wrote:
>>> The thermal sensor in the omap3 family isn't accurate, but it's
>>> better than nothing.  The various OPP's enabled for the omap3630
>>> support up to OPP1G, however the datasheet for the DM3730 states
>>> that OPP130 and OPP1G are not available above TJ of 90C.
>>>
>>> This patch configures the thermal throttling to limit the
>>> operating points of the omap3630 to Only OPP50 and OPP100 if
>>> the thermal sensor reads a value above 90C.

Oh, that's a very interesting use case.

AFAICT the thermal framework is not designed to deal with this
situation. I agree this setup may work (even if I'm not convinced about
the stability of the whole).

May be Viresh can help for the cpufreq side?

>> Out of curiosity, what are the OPP50 and OPP100 mentioned above? and
>> what does mean "OPP130 and OPP1G are not available above TJ of 90C"?
>>
> OPP130 is the 800 MHz and OPP1G is 1GHz operating point.
> The 90C is the max junction temperature.  When the temperature exceeds
> 90C, the processor is not designed to operate at 800+ MHz.  The
> statement itself is a direct quote from the public datasheet for the
> dm3730, Table 4-19.

> The datasheet is: http://www.ti.com/lit/ds/symlink/dm3730.pdf

It is ambiguous how it is stated:

"OPP130 and OPP1G are not available above TJ of 90C"

that can be interpreted the OPP is disabled by the hardware, no?

> The operating points were updated in [1], but they haven't yet been
> fully applied yet, but during the discussion, the question came about
> regarding how to limit the speed at high temp, so that's why this
> patch was done.
> 
> [1] - https://patchwork.kernel.org/patch/11141643/

I see, you switched to opp-v2.

Thanks for the detailed answer.



>> I don't see the connection between these OPP names and the definition in
>> the DT.
>>
>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>>
>>> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
>>> index 4bb4f534afe2..58b9d347019f 100644
>>> --- a/arch/arm/boot/dts/omap36xx.dtsi
>>> +++ b/arch/arm/boot/dts/omap36xx.dtsi
>>> @@ -25,6 +25,7 @@
>>>
>>>                       vbb-supply = <&abb_mpu_iva>;
>>>                       clock-latency = <300000>; /* From omap-cpufreq driver */
>>> +                     #cooling-cells = <2>;
>>>               };
>>>       };
>>>
>>> @@ -195,6 +196,31 @@
>>>       };
>>>  };
>>>
>>> +&cpu_thermal {
>>> +     cpu_trips: trips {
>>> +             /* OPP130 and OPP1G are not available above TJ of 90C. */
>>> +             cpu_alert0: cpu_alert {
>>> +                     temperature = <90000>; /* millicelsius */
>>> +                     hysteresis = <2000>; /* millicelsius */
>>> +                     type = "passive";
>>> +             };
>>> +
>>> +             cpu_crit: cpu_crit {
>>> +                     temperature = <125000>; /* millicelsius */
>>> +                     hysteresis = <2000>; /* millicelsius */
>>> +                     type = "critical";
>>> +             };
>>> +     };
>>> +
>>> +     cpu_cooling_maps: cooling-maps {
>>> +             map0 {
>>> +                     trip = <&cpu_alert0>;
>>> +                     /* Only allow OPP50 and OPP100 */
>>> +                     cooling-device = <&cpu 0 1>;
>>> +             };
>>> +     };
>>> +};
>>> +
>>>  /* OMAP3630 needs dss_96m_fck for VENC */
>>>  &venc {
>>>       clocks = <&dss_tv_fck>, <&dss_96m_fck>;
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

