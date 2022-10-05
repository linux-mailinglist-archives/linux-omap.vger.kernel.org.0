Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82FED5F5307
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 13:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiJELBY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 07:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiJELBX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 07:01:23 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC8F6BCEA
        for <linux-omap@vger.kernel.org>; Wed,  5 Oct 2022 04:01:22 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o7so17750006lfk.7
        for <linux-omap@vger.kernel.org>; Wed, 05 Oct 2022 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RGW48JmC1FQs8IXXJC5fTwrGBZH1RPvPAR6uI8c2PFs=;
        b=nMDI92mm9RJWd0a7pYWp6UTinFXngFHSe6u3LCjS4d+Lp0jF3ODHYZEYoul1msRhXC
         RZRBfvUVEAx1stgsMa1skdfbhhk0LeTr8vjlrsyNgaZw/PwPdS+qorD19rMIX+UYrZU5
         Oywux02+bDcf+KeXxQpym3ahOccbZBWjYbFIibGnLVwOMN6rYNHh5EgcPzidrBiy60ME
         lsOUc8+y2HlBx6JIIqkstHQy914xT5jiZmZRvCZpIuGDuZh5G/uWelxXRZCrF7728JKw
         tvGmGYDhUET+H80qFhR5dzhAVGUjOzJEMSO8rzFS+MTwTgQWxcGunPa2EuFyKg+GyP4m
         i8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RGW48JmC1FQs8IXXJC5fTwrGBZH1RPvPAR6uI8c2PFs=;
        b=2roEvDcdKtjX45N7nL9K/SvFMRCBzBx8qXqnTlCAUJ1avn5kJillDemrSAmpgPT5Ic
         Xl3DLI/fro27ZEL+9OL23N5ko1gzZo5L+ESF3iRBN/1BO1eXC47DSC/TVf3H2F01B2VS
         sKWtQYFTTGtxUIcG9BzcjjjRNj2mU9OPXxRRQ4C8cQHRK//81l97HQpNW+ry0dcMjT/1
         FlcLF/ZNEHxVQInN4zRslkVdrthjugeGDai2TDX5Ic4Gi5hu+uB8FF1TPymbxh+seaKS
         ld3PkKzAtLiD8ZFgFvC+sCtjQq9LITFUk5EjGxhpNz58azK1zsY0w7VHPiZDr+nEu1tv
         /w4Q==
X-Gm-Message-State: ACrzQf3DEvBXKortFJ//DlGexVEt4DVg6EUz1kueZ+yoY8kme3QSAfKC
        JBsJBoSezMaONwAH3JTm5emNeA==
X-Google-Smtp-Source: AMsMyM7L3AuvpLzdIoErsDQMYqrbMPApTEJKq1yDEGoJcKZJzulUpjdKdXf/kll8SLq41BEgrClMVA==
X-Received: by 2002:a05:6512:1282:b0:4a2:3c42:c844 with SMTP id u2-20020a056512128200b004a23c42c844mr4835700lfs.658.1664967680463;
        Wed, 05 Oct 2022 04:01:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k15-20020a2ea28f000000b0026dced9840dsm1202438lja.61.2022.10.05.04.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 04:01:20 -0700 (PDT)
Message-ID: <abff4ee9-2661-e707-0a60-aa03748860b4@linaro.org>
Date:   Wed, 5 Oct 2022 13:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "robh@kernel.org" <robh@kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
 <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
 <20220930194257.GA756240-robh@kernel.org>
 <1c14b73b-46fb-29e8-0fd6-1fd4d8706cbd@linaro.org>
 <bb0a16e0c2b4e7b93dce58c030264cd2c0cc6230.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bb0a16e0c2b4e7b93dce58c030264cd2c0cc6230.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/10/2022 12:05, Niedermayr, BENEDIKT wrote:
> On Fri, 2022-09-30 at 22:01 +0200, Krzysztof Kozlowski wrote:
>> On 30/09/2022 21:42, Rob Herring wrote:
>>> On Thu, Sep 29, 2022 at 02:56:39PM +0200, B. Niedermayr wrote:
>>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>>
>>>> The GPMC controller has the ability to configure the polarity for the
>>>> wait pin. The current properties do not allow this configuration.
>>>> This binding directly configures the WAITPIN<X>POLARITY bit
>>>> in the GPMC_CONFIG register by setting the gpmc,wait-pin-polarity
>>>> dt-property.
>>>>
>>>> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>> ---
>>>>  .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>>> child.yaml
>>>> index 6e3995bb1630..477189973334 100644
>>>> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
>>>> @@ -230,6 +230,13 @@ properties:
>>>>        Wait-pin used by client. Must be less than "gpmc,num-waitpins".
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>  
>>>> +  gpmc,wait-pin-polarity:
>>>
>>> 'gpmc' is not a vendor. Don't continue this bad pattern, use 'ti'.
>>>
>>>> +    description: |
>>>> +      Set the desired polarity for the selected wait pin.
>>>> +      1 for active low, 0 for active high.
>>>
>>> Well that looks backwards. I assume from the commit msg above, it's the 
>>> register value, but that's not what the description says. Please go with 
>>> the logical state here and do the inversion in the driver.
>>
>> This was actually my suggestion to keep the same value as
>> ACTIVE_HIGH/LOW in standard GPIO flags. The DTS could reuse the defines.
>>
> Ok, but how to proceed know? IMHO it makes more sense to use the value which actually lands in the register since most 
> people will use the value found in the Datasheet. 
> 
> We already had a discussion with Roger about the GPIO bindings vs. wait-pin binding. The point was that we do not use GPIO bindings
> in this case, or? 

Go with Rob's suggestion, so back to previous version.

Best regards,
Krzysztof

