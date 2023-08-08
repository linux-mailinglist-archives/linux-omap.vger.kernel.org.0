Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95FC77403D
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 19:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbjHHRAy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 13:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjHHRAH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 13:00:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D7747E8
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 09:00:29 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99357737980so849873866b.2
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510399; x=1692115199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6MY1hiBmbwXLoucjEj2Xi2SFMUgMZzIdibN/5/2L+I=;
        b=aFySu5tLzj5pfn9DmIh/A2nWaZDusHC78TY6Evs8ZgdaijhStYTfW5KRQ+0M3KIseH
         EGKgh0PNPz/00RqL+AOExsw9wlFWq6FaAE6IbVQggeAF4NTYrijqBaypfPVhyYeORzDW
         TqgoUWyVwv3P6qvXxorj3oy47phkX+1GxsoDLd5wzwvnvFNaIES1CYE+qCIn0seEOWgc
         oEnkzyC7hTDj3JK+XqvjjDLK1BCKwwzm8qdFDk/jah1AQ+7FEvvlz656Lq25uyIRhI9N
         OVEKU28k4QVXVKJFmH6A7xhsQdH8X++mFymdXH6A5n5Woehc7PjEnL5ZjS3VZiPXcJM6
         JAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510399; x=1692115199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6MY1hiBmbwXLoucjEj2Xi2SFMUgMZzIdibN/5/2L+I=;
        b=Kn8cA2WyEtkWyaaQTjLKEHw5M8sBo92bt6XcHEt7bvX3AFuVXOADOzp/CQf6wBvrsu
         5fGRVSd9/tKmnbrCxsJmkTi7C0510dxfTIqLErxKzGcvSbiv7QJIiqmrRt5vwUiGhBIe
         VxCGu5jMbdok2HqFv+QQYitod5aqGVFQgoWUIiNZP1K9XDMwCeZ1XKV8nCpqQxjM+RuG
         XG621yT1PDO9TovI/Z7QogWyZJkkiSXI9l74lFsE2HLiLH7QH3bRkzbRzp8sXIcvo9PF
         OmZXUCnhI9WhiPA6gRZvKZz3fUGa4e5LZDURsi3cE+/LvGTqpFquNZmPGMsJ+jIdfcAw
         CcNw==
X-Gm-Message-State: AOJu0YwP8AzJdaguyF7cEWpnYD7KTYNfBAiUJW6xmP7BLYdYTzKmujIp
        tV2JBPvlhjgilx0ohah7Zn3DmqS4xq7VptKKUlk=
X-Google-Smtp-Source: AGHT+IEFM3DwvG4gSvRW8WGApgoleljA2c2Cr/zQIjyrhjF0UV2hAUM2hKy+et7OFD1S77hBApF2qg==
X-Received: by 2002:a17:906:54:b0:999:26d3:b815 with SMTP id 20-20020a170906005400b0099926d3b815mr13144104ejg.64.1691506434441;
        Tue, 08 Aug 2023 07:53:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id rk22-20020a170907215600b00982a92a849asm6796311ejb.91.2023.08.08.07.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 07:53:53 -0700 (PDT)
Message-ID: <8e7cf088-e206-746d-0360-16479b1a33c3@linaro.org>
Date:   Tue, 8 Aug 2023 16:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: remoteproc: pru: Add Interrupt property
Content-Language: en-US
To:     Md Danish Anwar <a0501179@ti.com>, Conor Dooley <conor@kernel.org>,
        MD Danish Anwar <danishanwar@ti.com>
Cc:     Suman Anna <s-anna@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, srk@ti.com,
        nm@ti.com
References: <20230807110836.2612730-1-danishanwar@ti.com>
 <20230807-euphemism-trailing-ef4130dc7437@spud>
 <910a4a98-712a-5517-5a5b-ffb962f83463@ti.com>
 <1ade44f5-b3d1-dcde-6819-9e944f3b115d@linaro.org>
 <5ca41ad1-4f42-f71a-4b5f-f2b6def42cb1@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5ca41ad1-4f42-f71a-4b5f-f2b6def42cb1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2023 12:57, Md Danish Anwar wrote:
> On 08/08/23 3:48 pm, Krzysztof Kozlowski wrote:
>> On 08/08/2023 11:44, Md Danish Anwar wrote:
>>>>>    properties:
>>>>>      compatible:
>>>>> @@ -171,6 +181,9 @@ examples:
>>>>>                <0x22400 0x100>;
>>>>>          reg-names = "iram", "control", "debug";
>>>>>          firmware-name = "am65x-pru0_0-fw";
>>>>> +        interrupt-parent = <&icssg0_intc>;
>>>>> +        interrupts = <16 2 2>;
>>>>> +        interrupt-names = "vring";
>>>>>        };
>>>>
>>>> These examples would probably be more helpful if they used the
>>>> appropriate defines, no?
>>>>
>>>
>>> PRUSS Interrupt controller doesn't have any appropriate defines. This doesn't
>>> use GIC so defines from arm-gic.h can not be used here. These are specific to
>>> PRUSS INTC.
>>>
>>> I think these example are OK. Please let me know if this is OK to you.
>>
>> But isn't "2" type of the interrupt?
>>
>> Best regards,
>> Krzysztof
>>
> 
> As per the description of interrupts property in ti,pruss-intc.yaml [1]
> 
> Cell 1 is PRU System event number, cell 2 is PRU channel and cell 3 is PRU
> host_event (target). None of them is type of interrupt. So that's why they all
> are hardcoded. I don't think we can use IRQ_TYPE macros here.

OK, thanks for clarifying this.

Best regards,
Krzysztof

