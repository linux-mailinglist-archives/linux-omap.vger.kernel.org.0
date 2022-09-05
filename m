Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD4D5AD219
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 14:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237561AbiIEMIj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 08:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237404AbiIEMIc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 08:08:32 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5C15E329
        for <linux-omap@vger.kernel.org>; Mon,  5 Sep 2022 05:08:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id br21so12941151lfb.0
        for <linux-omap@vger.kernel.org>; Mon, 05 Sep 2022 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=38rWvU6XopMTJ4oQa39R5yAPQ792THWQHQIufgs8jRo=;
        b=kCk+jT/Y6OC1X/CVspb0W+QXvG2jgIH7/muQLto4RGerui/rJ2sS3YAvnsjuHtJcT8
         OmE4btSaJ1+2bTlMektObpxKKHitgcdNtx65yoTL8JI+G4sTFCkB4ycieagl5o2ay8ca
         w9XhRWWMurWN6gKO/KtVnihL1vLy9QpknACsvbubYjn5rfgJJr82QF367ePcEsG8CJNC
         qyv5hsQjBWBYdCjk+fI1sRcjQbAdy5BQQLg3Xos6l37Z/HbAeY2X2WgAZNW0edulhezL
         kw+UtBeLnYjl2yBTEgXpI7t20VWYiv76apUvqmVURq5Ze4wF4YXUH23uZBb7TeE4NwLI
         /p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=38rWvU6XopMTJ4oQa39R5yAPQ792THWQHQIufgs8jRo=;
        b=5RB/ZfhKwPEljbPmTQYbudT3HV6Bnj92ZNcNaTYAS0QjXgRw+Wh0mmjAIxH2EQxcFQ
         /MmrlW5tJs/bYcQTvrrb05xsNZdaD7ewRYHxmGo/3dYpRqKh+n9fkpt4xgH8jV7BIS4R
         aLjdqd2Zt6bP6aPvxnB0NvME81EqY7VPaohwvf38hWuTjEDb8mC3wFpf+cG29AJfV89t
         9S7PS5GNehAMY3aV1x5lq9EXotefLb7VRQLViNHLWHDTqj2NvcqyTs57ovMR1r1ly2B6
         I5Vw3aJ4wprZFt2chy3LwdhPquxF8pm6RE40h+MZ0hHjHXZnIJruVUJCtpGkZZHQtluw
         dvtA==
X-Gm-Message-State: ACgBeo2KwNov2jtM5o+BjFrCkPZbDkmVZ5YvrawBM1c6qPl5EMvE7OGF
        p3qGgNdOpnqxk0z2n9Cgopcleg==
X-Google-Smtp-Source: AA6agR6T96FMTEqyhUMCuuODNE3bvXqVmZlyI8nzecjVB5FBZ/ztlBJni6Sc0Mq88uAPWNP0tG4dEg==
X-Received: by 2002:a05:6512:139c:b0:48f:da64:d050 with SMTP id p28-20020a056512139c00b0048fda64d050mr14911091lfa.268.1662379708699;
        Mon, 05 Sep 2022 05:08:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u28-20020ac2519c000000b00492ea54beeasm1164828lfi.306.2022.09.05.05.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 05:08:28 -0700 (PDT)
Message-ID: <7e7a1cf6-8a11-2179-8fe6-c40e7cd8be62@linaro.org>
Date:   Mon, 5 Sep 2022 14:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
 <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
 <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
 <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
 <eedebc54-7817-d61b-f854-09eb11be4ada@kernel.org>
 <0ee691a3-d22e-b685-9d5c-f974ac3afe19@linaro.org>
 <6397b5d11c786ee6194776e096380103976049dd.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6397b5d11c786ee6194776e096380103976049dd.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/09/2022 13:48, Niedermayr, BENEDIKT wrote:
> On Mon, 2022-09-05 at 11:54 +0200, Krzysztof Kozlowski wrote:
>> On 05/09/2022 11:21, Roger Quadros wrote:
>>>
>>> On 05/09/2022 12:14, Niedermayr, BENEDIKT wrote:
>>>> On Mon, 2022-09-05 at 11:56 +0300, Roger Quadros wrote:
>>>>> Hi Benedikt,
>>>>>
>>>>> On 05/09/2022 10:17, B. Niedermayr wrote:
>>>>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>>>>
>>>>>> Add a new dt-binding for the wait-pin-polarity property
>>>>>>
>>>>>> Signed-off-by: Benedikt Niedermayr <
>>>>>> benedikt.niedermayr@siemens.com
>>>>>> ---
>>>>>>  .../bindings/memory-controllers/ti,gpmc-child.yaml         | 
>>>>>> 7
>>>>>> +++++++
>>>>>>  1 file changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/memory-
>>>>>> controllers/ti,gpmc-child.yaml
>>>>>> b/Documentation/devicetree/bindings/memory-
>>>>>> controllers/ti,gpmc-
>>>>>> child.yaml
>>>>>> index 6e3995bb1630..7c721206f10b 100644
>>>>>> --- a/Documentation/devicetree/bindings/memory-
>>>>>> controllers/ti,gpmc-
>>>>>> child.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/memory-
>>>>>> controllers/ti,gpmc-
>>>>>> child.yaml
>>>>>> @@ -230,6 +230,13 @@ properties:
>>>>>>        Wait-pin used by client. Must be less than "gpmc,num-
>>>>>> waitpins".
>>>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>  
>>>>>> +  gpmc,wait-pin-polarity:
>>>>>> +    description: |
>>>>>> +      Wait-pin polarity used by the clien. It relates to the
>>>>>> pin
>>>>>> defined
>>>>>
>>>>> did you mean "client?"
>>>>> Can you please specify what value is for Active Low vs Active
>>>>> High?
>>>>
>>>> Yes, that makes sense. And yes I meant "client". My typo.....
>>>>>> +      with "gpmc,wait-pin".
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>
>>>>> Why can't type be boolean?
>>>>
>>>> Of course we can use the boolean there. In that case I should
>>>> give the
>>>> property a more meaningful name e.g. wait-pin-active-high or
>>>> wait-pin-
>>>> active-low. 
>>>> Since the default behavour of this pin is Active High,
>>>> a bool property "gpmc,wait-pin-active-low" would make more sense
>>>> for
>>>> backwards compatibility. 
>>>> If the property is missing, than the polarity stays on Active
>>>> High like
>>>> before.
>>>>
>>>
>>> OK, in that case you don't have to clarify the polarity in
>>> description.
>>
>> I don't understand (and it is not explained in commit msg), why do
>> you
>> need such property instead of using standard GPIO flags.
>>
>> The driver should use standard GPIO descriptor and standard bindings.
>> If
>> it cannot, this has to be explained.
>>
>> Best regards,
>> Krzysztof
> 
> I think this is beacause the GPMC controller itself is not respecting
> the GPIO flags. Instead the GPMC is reading the Line Level directly
> (high,low) and then evaluates the logic depending how
> the WAIT<x>PINPOLARITY bit is set in the GPMPC_CONFIG register.
> 
> Until now gpiochip_request_own_desc() was hardcorded
> to GPIO_ACTIVE_HIGH. An the GPMC_CONFIG register configuration has no
> relation to the GPIO setting (in the current implementation).
> My first approach was to make this part configurable via a new device
> tree property (wait-pin-polarity).
> 
> IMHO (correct me if I'm wrong) the current implementation also does not
> make ues of standart GPIO bindings and defines the wait pin via a
> separate "gpmc,waitpin" binding.
> 
> E.g. gpmc,watipin = <0> or gpmc,waitpin=<1>
> 
> The best solution would should be when setting the binding this way for
> example: gpmc,wait-pin = <&gpiox y ACTIVE_X>

Yes and I am afraid this will grow instead of adding proper GPIO usage.
Any reason why it cannot be a standard GPIO pin desc?

> 
> But I think the current omap-gpmc.c implementation does not offer such
> a usecase and as roger already mentioned: 
> "GPMC wait_pin polarity logic is hard-wired and doesn't depend on GPIO
> subsystem for its polarity"

This part I don't get. You mean hard-wired in the driver or hard-wired
in the hardware? If the first, please un-wire it. If the latter, your
property makes no sense, right?

Best regards,
Krzysztof
