Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A24F5ACF3F
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 11:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236246AbiIEJyS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 05:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbiIEJyS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 05:54:18 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F6140E3B
        for <linux-omap@vger.kernel.org>; Mon,  5 Sep 2022 02:54:16 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z23so8703923ljk.1
        for <linux-omap@vger.kernel.org>; Mon, 05 Sep 2022 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=r+dy657YMkCJ/gfS/fhRH4XzHfRep4eVxD4DnOZEHT8=;
        b=lWot3i8SLnSrIlJAp4JCB91xVjCTgfMa4zcCUiu2aEHGY94lSVKDwAjQYQVz9biqB7
         elRS4sIPdxnSy7dNQlmHc9J17++uC0tq4051lArAvOtX7dspfO9rY//k0MRb3wC+J37b
         pTuH2zZP6eyvIIklmXCozIFMEXPWfli6036TbijXSF4x3OPgixy7LuiX+RugbqGokh+0
         oq3lHOML5Gbc2Gjedkdz7NslxP/SQJjY4yNRAOxe9+a+nIMe8wxvUJnlrlDg7NFx+N0T
         Cm5eLitJVM7ee2S/KBNn5sMz2oEm5xUf9NXaHauwB5squpnnPddXOaBT9WDwo5GfRfoa
         2zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=r+dy657YMkCJ/gfS/fhRH4XzHfRep4eVxD4DnOZEHT8=;
        b=e8i6A+SVr9xXnCEx30vpAUuf0LiRTa1zHqEqmn1/H5VD7XPeo+N1Yn/jsrk9QsD7EK
         d33w/vXyk4LfH0NEOGjI9faWCZxFJ6MRdTugroD0JO/PoDDf4EoeHB/CtWLu7R4EBZe8
         mCXHjGFo5PCpftElLXcUu3TyZ6YuEcTXtedSOILlKE4zJPx+aV06McHXsJXoE8KvGOBK
         2GneknkFoBxnc/988greywtx9z2XtTfgVszel3BRZGkE6XSaYMwKLgBkyS0fgSu5j6Gw
         VDgha0Yb36Tsbcq8yUbPMQ8yQ2T6DGUjhdWtbbgDJZurdP0juN0EF06l0sUpMtUE9QJW
         qcAw==
X-Gm-Message-State: ACgBeo1owEmMaS9yA9BhOHnO06CgVd3LbrGYIrHk9QxjOOfF0aMR94PJ
        uag6R2DOHaKLXELbKGlfygqzZ4kZJDj8vh/r
X-Google-Smtp-Source: AA6agR7/HEG/A+ngmRd9nq7AHcU1Im92QOkITw927mfLYdhJ2XKYIjA7ht3DAUJ0Iw6mHd+PD5UHDg==
X-Received: by 2002:a2e:9084:0:b0:268:f7cd:f753 with SMTP id l4-20020a2e9084000000b00268f7cdf753mr4184365ljg.297.1662371654891;
        Mon, 05 Sep 2022 02:54:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f4-20020a05651c02c400b00261d66b22a3sm1347863ljo.29.2022.09.05.02.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 02:54:14 -0700 (PDT)
Message-ID: <0ee691a3-d22e-b685-9d5c-f974ac3afe19@linaro.org>
Date:   Mon, 5 Sep 2022 11:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] dt-bindings: memory-controllers: gpmc-child: Add
 binding for wait-pin-polarity
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>,
        "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
 <20220905071717.1500568-4-benedikt.niedermayr@siemens.com>
 <d75ff1cf-64a6-e794-87a2-204e93c852cf@kernel.org>
 <e284855271a3fdf6bb2cd304629c2aa3bb8401f3.camel@siemens.com>
 <eedebc54-7817-d61b-f854-09eb11be4ada@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eedebc54-7817-d61b-f854-09eb11be4ada@kernel.org>
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

On 05/09/2022 11:21, Roger Quadros wrote:
> 
> 
> On 05/09/2022 12:14, Niedermayr, BENEDIKT wrote:
>> On Mon, 2022-09-05 at 11:56 +0300, Roger Quadros wrote:
>>> Hi Benedikt,
>>>
>>> On 05/09/2022 10:17, B. Niedermayr wrote:
>>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>>
>>>> Add a new dt-binding for the wait-pin-polarity property
>>>>
>>>> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com
>>>>>
>>>> ---
>>>>  .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7
>>>> +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/memory-
>>>> controllers/ti,gpmc-child.yaml
>>>> b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>>> child.yaml
>>>> index 6e3995bb1630..7c721206f10b 100644
>>>> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>>> child.yaml
>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>>> child.yaml
>>>> @@ -230,6 +230,13 @@ properties:
>>>>        Wait-pin used by client. Must be less than "gpmc,num-
>>>> waitpins".
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>  
>>>> +  gpmc,wait-pin-polarity:
>>>> +    description: |
>>>> +      Wait-pin polarity used by the clien. It relates to the pin
>>>> defined
>>>
>>> did you mean "client?"
>>> Can you please specify what value is for Active Low vs Active High?
>>
>> Yes, that makes sense. And yes I meant "client". My typo.....
>>>
>>>> +      with "gpmc,wait-pin".
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>
>>> Why can't type be boolean?
>>
>> Of course we can use the boolean there. In that case I should give the
>> property a more meaningful name e.g. wait-pin-active-high or wait-pin-
>> active-low. 
>> Since the default behavour of this pin is Active High,
>> a bool property "gpmc,wait-pin-active-low" would make more sense for
>> backwards compatibility. 
>> If the property is missing, than the polarity stays on Active High like
>> before.
>>
> 
> OK, in that case you don't have to clarify the polarity in description.

I don't understand (and it is not explained in commit msg), why do you
need such property instead of using standard GPIO flags.

The driver should use standard GPIO descriptor and standard bindings. If
it cannot, this has to be explained.

Best regards,
Krzysztof
