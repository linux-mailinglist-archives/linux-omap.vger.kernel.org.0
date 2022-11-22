Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3E4633724
	for <lists+linux-omap@lfdr.de>; Tue, 22 Nov 2022 09:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbiKVIav (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Nov 2022 03:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbiKVIa0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Nov 2022 03:30:26 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76A443870
        for <linux-omap@vger.kernel.org>; Tue, 22 Nov 2022 00:29:54 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a29so22442825lfj.9
        for <linux-omap@vger.kernel.org>; Tue, 22 Nov 2022 00:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+WSgTx4cT4ZBlmaUrz5K0AposnIERDeJo73rF4CmUg=;
        b=MEujhAWSk3hCxepZRKacgo6OLEefJMq8GH6DyzqoIAFnTKYZTJ5T57HevAa/WwYegd
         v7rcGgSQURI2WAfSbUs5NXQtMsC1U8e4nmNfbWtnEJlFQ4cO7uWE1DPk41RzgjKls9MD
         f+WouBNFWzgnKKdAtCfJmkUegobLQmCYiG+jAc+TytRGOou0LAZskKb9zTMGI/oQNvvR
         oR6FWQ1lggS8uw73HSbnCu/SWQMOW7aU2Yc+1FTlAVUBhMOvd8aYl3bB0IPzYE3bBwxl
         8e4h+cZBfHU3amogGWDxP2evvFgQ081UqEckgVuasz6746GpVDSZVwQY2ZKD9k9kH/JV
         GxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+WSgTx4cT4ZBlmaUrz5K0AposnIERDeJo73rF4CmUg=;
        b=P5Bdk8KPAOFCJV06Z/3noE/5lajrs9v6hlo6kxx4bV7KOx4Q3irWOj6b7sypvyycnG
         yRVFgcyeOnjoTIS8FHQFce96UKl9gjYyVQFcjArYZ3aPtoc2yoRBN8vlyM8csdlrtGv4
         1uuxZ66zrzFdno75JIOCTFf/KGcMBtR05iguQwgf5kEgzACjajH6DH3R81rjNC121xHb
         uWw+sMUoX+x747+kB3OLx1tYarCbCGjhQIPc59SHsoDSc2AVToSB2ZPXUUZOyAM9EH5R
         krERIe3osI+r0IfLoDnb88E5JNjSXhhNC56B68B/ZTc38xMaRiWUuZitywJBJOwKKBdG
         Cmug==
X-Gm-Message-State: ANoB5pmtPev1VBfJ6/rPiHepGzCtzzqqi0crPH2VlGgMCylm0AYrQX7h
        lfT498pl3SJW1S8SmZ/Tc3QJOw==
X-Google-Smtp-Source: AA0mqf6l2Nkxmg00sfH6f6iPzYskcRM8lk4i/i9M62O3kY7R4ojDl1BjcHnnEzy5oksSLxeO1Hfd9Q==
X-Received: by 2002:a19:6913:0:b0:4a4:4735:c289 with SMTP id e19-20020a196913000000b004a44735c289mr7169278lfc.560.1669105793210;
        Tue, 22 Nov 2022 00:29:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512075000b0049462af8614sm2376542lfs.145.2022.11.22.00.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 00:29:52 -0800 (PST)
Message-ID: <f505b138-16ae-8eef-3123-1cf9180a0a5d@linaro.org>
Date:   Tue, 22 Nov 2022 09:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Allow decimal format in addition
 to hex format
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
 <Y3uPvYqaILNiYW8K@atomide.com>
 <bb5ac0cf-84eb-165f-40bb-0f3c9afe084f@linaro.org>
 <Y3xTi5JeLPSWchT7@atomide.com>
 <8c37d6a6-497c-f761-1e27-1ef5b3e64250@linaro.org>
 <Y3yEIch6IiLwuUZc@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3yEIch6IiLwuUZc@atomide.com>
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

On 22/11/2022 09:11, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221122 07:26]:
>> On 22/11/2022 05:43, Tony Lindgren wrote:
>>> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221121 16:05]:
>>>> On 21/11/2022 15:48, Tony Lindgren wrote:
>>>>> * Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [221121 14:30]:
>>>>>> On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
>>>>>>> Let's allow node numbering in decimal format too.
>>>>>>>
>>>>>>> Simple human-readable increments/IDs are usually decimal, hex is only for
>>>>>>> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>.
>>>>>>>
>>>>>>> Cc: Thierry Reding <thierry.reding@gmail.com>
>>>>>>> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
>>>>>>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
>>>>>>> @@ -13,7 +13,7 @@ select: false
>>>>>>>  
>>>>>>>  properties:
>>>>>>>    $nodename:
>>>>>>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
>>>>>>> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"
>>>>>>
>>>>>> I wonder why you don't make this:
>>>>>>
>>>>>> +    pattern: "^pwm(@.*|-[0-9a-f]*)$"
>>>>
>>>> Yes, the '*' should be within ().
>>>
>>> Sorry I guess I don't follow. So for what type of naming is the second '*'
>>> actually needed here, or is it needed at all?
>>>
>>> We only want to match the following:
>>>
>>> pwm@1234
>>>
>>> pwm-0
>>> ...
>>> pwm-f
>>>
>>> And now also:
>>>
>>> pwm-0
>>> ...
>>> pwm-15
>>>
>>> Is there yet another format I'm missing?
>>>
>>>>> Hmm but I think this would also pass for node names like pwm-a-foo?
>>>>>
>>>>
>>>> No, how?
>>>
>>> Because of the second extra '*' there :)
>>
>> It cannot multiple dashes...

Yeah, it should be - it cannot match multiple dashes...

> 
> Sorry I'm still confused.. Care to specify what match do you want to
> use here and why?

Pattern:
-[0-9a-f]*
cannot match -1-2-3 because it does not cover the dash.

Best regards,
Krzysztof

