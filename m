Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D1F5BE25A
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 11:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiITJsa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 05:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbiITJsF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 05:48:05 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F636F269
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 02:48:01 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a2so2844965lfb.6
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=M5WxUofFBoJGfewHDqk33FaOZhqYQWwaYYDWCY1yPeM=;
        b=pkbvSiJnTxNSDnIs0YANOzMkL0jrhfjohngvVNEK4zUhkdlLCdg0OY9QOT24Sq13pp
         QdDar2j7J4TX8RlyDyDwqWSMzBbX8MBry4Spju+CU0UeVF4nGfM3oCUAqorARKpYbZN7
         rUFha05CwNwJD8aqOQqKCQi/phTaGC1qJ9P0hcmFl/TcpoIcbWepXzXoPf8ZqakhMp3m
         x2h2l6uekM3txJvgC9wDe91+Gqm6jpPidoP0PMB4MZKSvCWpXVta+FtpAFeiauxy2p6B
         rcxN23D8lhKnm7+loheKYyWMhCFnujW63kYsZxHzXb+kJy5jfX4+GJ6Re+XZBvcHh51H
         ubbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=M5WxUofFBoJGfewHDqk33FaOZhqYQWwaYYDWCY1yPeM=;
        b=qlCeV5S6jHhsuAaFmSHcZiVuo76Z69kMpVwoVzj1McBMnwF9AGxWDlrYM46tt6LJm/
         bFlYTRQAGntD3rtgFgIeelbpJa0nlTf0pkQ1VVlVnQJ2E8R4ZF+XOmEH724Mk/khlwPW
         ZEXsvFOs3WqKBuYYnHUhP9IOmJX0asieEUm+i/bn+m4mbRDufyQx2mxrh5wxTn0fcK7k
         feIf5/askTllNI/Jfm/dp9U2csTvj3cb2+LiTLqBqHfLbzao+lzfcS3voJFhqCrcLHC+
         JKvToA/ZMGNDGAR59UCVLRC086yj6dENXr8IYqmyfruAba0WuHURkiqrg4CKbeaMwA5v
         OUPQ==
X-Gm-Message-State: ACrzQf3RkK9s+2KS1XOwcgFOo/bFuSe1z4CtSFe52OMJqmQVJlml4qKN
        jp89ObAgh2z1UI95cAzhSvnt7A==
X-Google-Smtp-Source: AMsMyM6qdaOps+CLLadhvSGUjgNrQf17CgzUUetIXjsWF2aZi36wEY0NaE1WEj8RUpjFvTs57ZGLyQ==
X-Received: by 2002:a05:6512:3daa:b0:49f:966f:254a with SMTP id k42-20020a0565123daa00b0049f966f254amr4579474lfv.73.1663667279350;
        Tue, 20 Sep 2022 02:47:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k12-20020a192d0c000000b004984ab5956dsm224516lfj.202.2022.09.20.02.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 02:47:58 -0700 (PDT)
Message-ID: <0afa173f-9f7f-b2c8-7abc-2384ee46429d@linaro.org>
Date:   Tue, 20 Sep 2022 11:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
 <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
 <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
 <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
 <cdc59072-648c-ce53-b9a5-b796d379e575@linaro.org>
 <24e5fa6065f68a25226b4aee02b8f900b630befa.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <24e5fa6065f68a25226b4aee02b8f900b630befa.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/09/2022 11:13, Niedermayr, BENEDIKT wrote:
> Hi Krzysztof,
> 
> On Tue, 2022-09-20 at 09:39 +0200, Krzysztof Kozlowski wrote:
>> On 19/09/2022 15:25, Niedermayr, BENEDIKT wrote:
>>> Hi Krzysztof,
>>>
>>> On Mon, 2022-09-19 at 11:38 +0200, Krzysztof Kozlowski wrote:
>>>> On 16/09/2022 14:07, B. Niedermayr wrote:
>>>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>>>
>>>>> The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
>>>>> in the GPMC_CONFIG register. This is currently not supported by the
>>>>> driver. This patch adds support for setting the required register bits
>>>>> with the "gpmc,wait-pin-polarity" dt-property.
>>>>>
>>>>> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>>> ---
>>>>>  drivers/memory/omap-gpmc.c              | 27 +++++++++++++++++++++++++
>>>>>  include/linux/platform_data/gpmc-omap.h |  6 ++++++
>>>>>  2 files changed, 33 insertions(+)
>>>>>
>>>>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>>>>> index ea495e93766b..2853fc28bccc 100644
>>>>> --- a/drivers/memory/omap-gpmc.c
>>>>> +++ b/drivers/memory/omap-gpmc.c
>>>>> @@ -132,6 +132,7 @@
>>>>>  #define GPMC_CONFIG_DEV_SIZE	0x00000002
>>>>>  #define GPMC_CONFIG_DEV_TYPE	0x00000003
>>>>>  
>>>>> +#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
>>>>>  #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
>>>>>  #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
>>>>>  #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
>>>>> @@ -1882,6 +1883,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
>>>>>  
>>>>>  	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
>>>>>  
>>>>> +	if (p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {
>>>>> +		config1 = gpmc_read_reg(GPMC_CONFIG);
>>>>> +
>>>>> +		if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_LOW)
>>>>> +			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
>>>>> +		else if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_HIGH)
>>>>> +			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
>>>>> +
>>>>> +		gpmc_write_reg(GPMC_CONFIG, config1);
>>>>
>>>> What happens if wait pin is shared and you have different polarities in
>>>> both of devices?
>>> In this case the second one wins and will overwrite the polarity of the first one.
>>> But that would be the result of a misconfiguration in the DT.
>>
>> In many cases drivers do not accept blindly a DT, but perform some basic
>> sanity on it, especially if mistake is easy to make (e.g. with
>> overlays). Such design of DT is just fragile. Schema cannot validate it,
>> driver does not care, mistake is quite possible.
> 
> Ok, that makes sense. I'm going to implement this in v6.
>>
>>> I'm not sure how to proceed here? Does it make sense to add a check for different 
>>> waitpin polarities?
>>
>> I don't know. I would just disallow such sharing entirely or disallow
>> sharing if DT is misconfigured.
>>
>>
>>>
>>>>> +	}
>>>>> +
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> @@ -1981,7 +1993,22 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
>>>>>  				__func__);
>>>>>  	}
>>>>>  
>>>>> +	p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
>>>>> +
>>>>>  	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
>>>>> +		if (!of_property_read_u32(np, "gpmc,wait-pin-polarity",
>>>>> +					  &p->wait_pin_polarity)) {
>>>>> +			if (p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_HIGH &&
>>>>> +			    p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_LOW &&
>>>>> +			    p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {
>>>>
>>>> WAITPINPOLARITY_DEFAULT is not allowed in DT, so you can skip it.
>>> This value is not assigned from the DT. It is only assigned within the GPMC and serves as a init
>>> value (right before the if clause). This helps in case no configuration from DT is done where the 
>>> GPMC registers should stay untouched.
>>
>> I don't see it. Your code is:
>>
>> p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
>> # and DT has WAITPINPOLARITY_DEFAULT
>> if (....) {
>>   pr_err
>>   p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
>> } else {
>>   pr_err
>> }
>>
> Maybe I dont't get what you mean with DT in this context.
> 
> What I meant is that the value WAITPINPOLARITY_DEFAULT is not directly extracted from the DT but is assigned in case
> "gpmc,wait-pin-polarity" is not set or has an invalid value. In any case the p->wait_pin_polarity should have
> at least the init value assigned so we can make proper decisions in gpmc_cs_program_settings().
> 
> Maybe I need some clarification what exatly is forbidden here.

I commented exactly below the line which I question. I don't question
other lines. So let me be a bit more specific:

Why do you need
"p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT"
? Can you write a scenario where this is useful?

Best regards,
Krzysztof
