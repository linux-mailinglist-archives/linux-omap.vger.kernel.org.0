Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3F35F5405
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 13:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiJELvH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 07:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbiJELuu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 07:50:50 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329FD7C31D
        for <linux-omap@vger.kernel.org>; Wed,  5 Oct 2022 04:48:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q17so18410128lji.11
        for <linux-omap@vger.kernel.org>; Wed, 05 Oct 2022 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OjaIFXk+WQHSl86U9o21WzF2QtQNwYjjD834VFUBTn8=;
        b=nLdk8dMBlw6MOm9yGPZ3KDUtktkbxxJ8Ns5q0qExDPKvA3B7r+LLGKx+fxQ1gSDr36
         twQCLXYP9Xd+eFMmaFiE3Ng4Daon9iSFlefcQ2Z4E92whUuumQpe8iAB8zaFMzLH+r3/
         nrzdSjiz+gSqoVAN4h9wo+dVq0aRnHv/Vrf42XLxQmQ8wDi85KKYaUv66mCRFe0JkwKB
         RLYXt739P8WJxkiSDr0iOlp1+/oMGF/98+yy+JxSZ/3ygGfBqontT4hdtF4XMy87uaMj
         H0Wu0AamZUQlhV715cPaN8NLyB2Vx32tMNFdpyZ/I3gck1wKACkzRBUt+MMwDEE1F3mo
         1bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OjaIFXk+WQHSl86U9o21WzF2QtQNwYjjD834VFUBTn8=;
        b=XrBJCoZftD4EI/AkRJgDjlpnNasg5z2zJBnb5dkegrjSi0EOe2otP7Ab9pF2T7/RrK
         RjUZx35I4mOf6QEPEXCKEq3XS2GJiaiwnShqmuZ42zvZL8T6jSy7yyenWZcJCqekSCRZ
         Vpn/xw6uSTqehjpx8wEMFk61z6Qd57pO3qHH5opjWsEWXWgA7+XycSH5ODa4K08m2a48
         ZdwFQWqDcr5+skSxZ+C2eWOkov9mt2Aks8VnOraRkTEWZr7v+wV5VGWfE10ziCB+miFD
         Xo5NXs6U3E+60M5GO2xebpfQHlvYEON41/KDu5hMvCPyCwMPEl67WbBOXBG62itWNGzs
         WK2w==
X-Gm-Message-State: ACrzQf2+6/WuWMt6SWMgP6+eIJNQQNwJM9Tv7+Lrzduzc4tLY256SrqY
        t0sHtcYTL3HGm5D9ht+xx8xiSw==
X-Google-Smtp-Source: AMsMyM5kiaWHmTkdKpMUpg26BD7/GxOdta2rHlxydwaHv04d409KowZs0sTktcuzHE2EFOuJVo95xA==
X-Received: by 2002:a2e:a98f:0:b0:26c:4f1b:e997 with SMTP id x15-20020a2ea98f000000b0026c4f1be997mr9301100ljq.27.1664970506879;
        Wed, 05 Oct 2022 04:48:26 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k10-20020a2eb74a000000b0026c40bfe926sm1579755ljo.76.2022.10.05.04.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 04:48:26 -0700 (PDT)
Message-ID: <fdbfac11-2e84-0e3d-7397-21b62c1afc56@linaro.org>
Date:   Wed, 5 Oct 2022 13:48:25 +0200
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
 <fc1d354d307487de2dc8e715c202affd76f96866.camel@siemens.com>
 <c97db3d3-ccb2-fef5-070c-901053e6e353@linaro.org>
 <e027fca3934232f9f6f569fcccdad0f9a07f0c3a.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e027fca3934232f9f6f569fcccdad0f9a07f0c3a.camel@siemens.com>
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

On 05/10/2022 13:15, Niedermayr, BENEDIKT wrote:
> On Wed, 2022-10-05 at 13:00 +0200, Krzysztof Kozlowski wrote:
>> On 05/10/2022 12:13, Niedermayr, BENEDIKT wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>>>> child.yaml
>>>>> index 6e3995bb1630..477189973334 100644
>>>>> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
>>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
>>>>> @@ -230,6 +230,13 @@ properties:
>>>>>        Wait-pin used by client. Must be less than "gpmc,num-waitpins".
>>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>>  
>>>>> +  gpmc,wait-pin-polarity:
>>>>
>>>> 'gpmc' is not a vendor. Don't continue this bad pattern, use 'ti'.
>>>
>>> You are right. But nevertheless I can't agree with that in this patch series.
>>> I don't want to break consistency, since all bindings currently use 'gpmc'. At least this applies
>>> to the "ti,gpmc-child.yaml".
>>>
>>> I think it makes more sense to create a complete new patch series for that specific change? This change
>>> wouldn't fit thematically the current patch series. 
>>>
>>
>> So you want to add new property incorrectly named and immediately new
>> patch which fixes the name? No, please squash this new patch into this.
>>
> No that's not what I meant. Currently all bindings in "ti,gpmc-child.yaml" start with "gpmc," and introducing 
> a single binding in this file with "ti," feels like breaking consistency.
> 
> The "new" patch series should address **all** bindings in this file and all device trees currently using "gpmc,"
> bindings. So finally we have the current patch series introducing the wait pin handling in a consisten way and then another 
> patch series which changes all "gpmc," to "ti,". 

Isn't this exactly what I said? First add gpmc (so incorrectly named
property) and then fix it to proper name (TI)? So squash that part of
second patch which relates to this one, into this patch.

Please do not commit incorrect properties, just because they are consistent.

> If it makes more sense to directly introduce the "ti,wait-pin-polarity" instead of "gpmc,wait-pin-polarity" then I will do. Just
> give me a short feedback.
>   

You got it already:

  'gpmc' is not a vendor. Don't continue this bad pattern, use 'ti'.

Best regards,
Krzysztof

