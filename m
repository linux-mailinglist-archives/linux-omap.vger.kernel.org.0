Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF05963292B
	for <lists+linux-omap@lfdr.de>; Mon, 21 Nov 2022 17:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiKUQPg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Nov 2022 11:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiKUQPf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Nov 2022 11:15:35 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35073D28BF
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 08:15:34 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id x21so15003354ljg.10
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 08:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8EDKzp4/2MlyjbQH60EmRijgtPP7Kp6u82PuoEfyTc=;
        b=HOTwvBNX0aQ3XOcpqMtXVnNSIYKQz3Sk4VswjLF5xVcKCH8IAujSSc9D2cNlzYEzV6
         SulaqkXMsZcqkqoq9nAP3S6QiVUczmb7JcWrXLL7IETZLh+xMyfIHpmcTTuCKbENqeq5
         dYD88mbikroeOCIHnBc8E+d7jzngb9LUYmeCF7AVKYH/cRNMxhVZ/xpc2o6kShicmE3g
         lM0UXXOLQ02vZLZfqXTuhEqXjb2zCbXJN8BF1wwPA50u1X4bTI5zsMPtpG9OONaRpR6o
         1/6YT38pQdzNRXkrC+VQqxdWXvFDfyQe/XSfQV6pZwSV5icZs4KrVVUi47iZF5CufIu/
         RJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8EDKzp4/2MlyjbQH60EmRijgtPP7Kp6u82PuoEfyTc=;
        b=2n+SVfBuA5mNLcTiENs+EzbgMJP41ZB2twyxfMLHF2w9RNkLLyk9PIPZYm5L+n7GaL
         0XXl4cCjhUxEDXuyNmJQy5JADubkrFZ/deUNRqHpxYLtb+9zasMUwrDArq3DmS8NdM1Q
         w8hcHdP57RHNGSpw1pZsrASaElFS2d4/NH47VeYs4YmUDV6RMND+u3zU2tNlIi6cdQtf
         t87kfodpHprc9mtf/OyCnIr8GnleAdYPalVyo4aOw1PU2Xq7t++duvohwERrMg4xZFvR
         k26nsvJAsM2N23ZP8yb5rqmzNLpvKdWy9GMe++yGvWdTWwHNV94PZAsaqikLe4CqW6Fb
         AYVg==
X-Gm-Message-State: ANoB5pkMledojCSuPnHWyY1EISTQ4j5QQQJg6kalOeooPq4gzcHCUxbt
        fsnEQyRZY5VrBDup6VB7wXf7YA==
X-Google-Smtp-Source: AA0mqf6g5wsdeH0+r5ugnw0UKndTE3cNRaZGjMyU+Nrq+xDSsE/4aYAwal62Pwo72W2DMPSrQU6vzQ==
X-Received: by 2002:a05:651c:98c:b0:277:6f7e:bfeb with SMTP id b12-20020a05651c098c00b002776f7ebfebmr6411639ljq.274.1669047332498;
        Mon, 21 Nov 2022 08:15:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 19-20020ac25f53000000b0049d83646ce7sm2061010lfz.110.2022.11.21.08.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 08:15:31 -0800 (PST)
Message-ID: <bb5ac0cf-84eb-165f-40bb-0f3c9afe084f@linaro.org>
Date:   Mon, 21 Nov 2022 17:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Allow decimal format in addition
 to hex format
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
 <Y3uPvYqaILNiYW8K@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3uPvYqaILNiYW8K@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/11/2022 15:48, Tony Lindgren wrote:
> * Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [221121 14:30]:
>> On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
>>> Let's allow node numbering in decimal format too.
>>>
>>> Simple human-readable increments/IDs are usually decimal, hex is only for
>>> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>.
>>>
>>> Cc: Thierry Reding <thierry.reding@gmail.com>
>>> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
>>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
>>> @@ -13,7 +13,7 @@ select: false
>>>  
>>>  properties:
>>>    $nodename:
>>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
>>> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"
>>
>> I wonder why you don't make this:
>>
>> +    pattern: "^pwm(@.*|-[0-9a-f]*)$"

Yes, the '*' should be within ().

> 
> Hmm but I think this would also pass for node names like pwm-a-foo?
> 

No, how?


Best regards,
Krzysztof

