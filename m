Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0AE36335EE
	for <lists+linux-omap@lfdr.de>; Tue, 22 Nov 2022 08:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiKVHg5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Nov 2022 02:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiKVHg4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Nov 2022 02:36:56 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE4D317CA
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 23:36:54 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p8so22294629lfu.11
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 23:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uq8x1FvZ2uEwbe4/V8DB199OoK2b/lP8Y41BLE+I0bE=;
        b=rWNPRBGm0URXEZopa+8WDX7Rzx3US+ec+m0iz0TUVLUMgGzIThatBejp6Of5HUXhzy
         hb/7UK7kXUWEF9EHhhdFi/2znLv9U+0cDDgAT08JYGMiTDJ8hmjqexIqp5mP4jud549L
         l/LaZPbh9qEj1govo14ortA/dskPiDBU18XEkqWzO7qh14JisJ1tNgrNaAXPxEL88Bot
         NW+JTASnFtumH4ysbb7YIHArDfbvkR10hyLmn2YWBeCQm6i5YLevAnLokL4Uv1jmhoHG
         gmkXgvoOYR/8EuCQgfromM/cmVsT7D3YIu0WFa8GHgpldxjh8MkdIUsIHeupDM1LkKl9
         Br7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uq8x1FvZ2uEwbe4/V8DB199OoK2b/lP8Y41BLE+I0bE=;
        b=NLvEJ7wGh+eDUrAMFyE73ohOufacmLLZ4pOckvY5GtfKZ2YQHLsdyo9QqhpEHYt2I4
         7aTjtI3MF3iytbqbXt++qL8uAxjg/nrykNbeMJI0Fsf6h1nsjKuaf/bpB1x2yU5GWRjP
         R6VzFVpLxVOB0VlCCYnU6/PS0MmuQeh70brMKZ+RxFBQq9kGb2l4fn96ffJ1rEyxK0H7
         KoxtiWkpxMuXwk378Zrv9dBqnGnxPYgEN+Go8XBLg/1yVD750bG1uSSi9E8hHJkHBWDw
         kEK4zIfybe46wt6Yu0+tesDkBiVM6Q/bsS2p7ZG8hnusaBGZqNtOI2eHxmTwr+KofV3S
         V7TQ==
X-Gm-Message-State: ANoB5pktrDXdU5rJaS076F3eiR4jLybjV+awc36LUXrOx5Pj9UN5Yrmg
        gnjOhqP14XtrXuazEFmK3zGZxg==
X-Google-Smtp-Source: AA0mqf6qifS0NcmndAPQz1+KIS+X+ObkeNCRNEe103YGGN3fVlWaUC/huvesOr+xfSGNOTYdcBDKhg==
X-Received: by 2002:a19:f010:0:b0:4a2:2e81:9be5 with SMTP id p16-20020a19f010000000b004a22e819be5mr7786612lfc.486.1669102613104;
        Mon, 21 Nov 2022 23:36:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f28-20020a05651c03dc00b0026fa9e19197sm1729259ljp.36.2022.11.21.23.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:36:52 -0800 (PST)
Message-ID: <8c37d6a6-497c-f761-1e27-1ef5b3e64250@linaro.org>
Date:   Tue, 22 Nov 2022 08:36:51 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3xTi5JeLPSWchT7@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/11/2022 05:43, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221121 16:05]:
>> On 21/11/2022 15:48, Tony Lindgren wrote:
>>> * Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [221121 14:30]:
>>>> On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
>>>>> Let's allow node numbering in decimal format too.
>>>>>
>>>>> Simple human-readable increments/IDs are usually decimal, hex is only for
>>>>> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>.
>>>>>
>>>>> Cc: Thierry Reding <thierry.reding@gmail.com>
>>>>> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
>>>>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
>>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
>>>>> @@ -13,7 +13,7 @@ select: false
>>>>>  
>>>>>  properties:
>>>>>    $nodename:
>>>>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
>>>>> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"
>>>>
>>>> I wonder why you don't make this:
>>>>
>>>> +    pattern: "^pwm(@.*|-[0-9a-f]*)$"
>>
>> Yes, the '*' should be within ().
> 
> Sorry I guess I don't follow. So for what type of naming is the second '*'
> actually needed here, or is it needed at all?
> 
> We only want to match the following:
> 
> pwm@1234
> 
> pwm-0
> ...
> pwm-f
> 
> And now also:
> 
> pwm-0
> ...
> pwm-15
> 
> Is there yet another format I'm missing?
> 
>>> Hmm but I think this would also pass for node names like pwm-a-foo?
>>>
>>
>> No, how?
> 
> Because of the second extra '*' there :)

It cannot multiple dashes...

> 
> Regards,
> 
> Tony

Best regards,
Krzysztof

