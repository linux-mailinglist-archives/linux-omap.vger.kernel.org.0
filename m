Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38AC04F90E9
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 10:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbiDHIfm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 04:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbiDHIfl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 04:35:41 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5862FF537
        for <linux-omap@vger.kernel.org>; Fri,  8 Apr 2022 01:33:38 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l26so15892522ejx.1
        for <linux-omap@vger.kernel.org>; Fri, 08 Apr 2022 01:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1tLDrUPKRkIXyzv97WaBlx0K1UkjnroCJEsBF1CTx90=;
        b=PEv4ls0jHLQr0ZRamzbOZcTBu1HJesG/YECnIrHNosqYG1gy+/M6mr1ojOf+kyf1f1
         dWSK80zIHPM4Rq+n0SpuZDl10SxNFHeem7JTUHGEo47O+Ht/ptOUmWukEdyyGKj0l3vf
         jJx9ZFi/rPRjwROimmI2Cp3CPwrIf8OUm3HyNl58AchQYRUdDXbJA5L3o3IwSFCG3PmH
         TsUKduwU5Ghhm04I139CNhJbzUjV840voI0lksCgi6HopNGRHwl122GDZti7miI45Cnh
         48aHw/SqpqjtF/uUVnFv2Y9z1+QwdIncwmdFx4h3jCtqcP7SAzMT/AS1Xu160rTjSASp
         1lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1tLDrUPKRkIXyzv97WaBlx0K1UkjnroCJEsBF1CTx90=;
        b=6+ly3qydrSDu7sIBOsLs2ThGVUIy2gAdJ0RSlN9mw0tUfZsSBGOtMCBuAWbowVW/2O
         aE/A7MkUWN3HhH6aOXFYbztNhAq+r/F9asfqp7WBzHibqJdODVJEFYXIEn1wsRM6x9kx
         E+zgMwhNOXujshyYftIkDD7fBXr3Lc057BN1bXPiWlO5mjbToJBuFpiGB5oacT5dsQ9I
         nac7SNqo6qd/RJKM10uv5Hkznpcu+b3+gpTpaTgwmDuIUZ8e2ixqgC88O560Y6rhM8/v
         OF26oRDBbbJKZ30uSzZJZF65ieYFKqOnq/v9mDSuQpXeuEXe4DVGQdJcNVJz5OWEhHiC
         2RDA==
X-Gm-Message-State: AOAM530GS9L1zLyev9itmGa1yLNP0rdZzVG1ZCsN8IRkB2U8Hw8y2uUG
        TNtbiAJAWgqeeq7yx0tz3fuoSg==
X-Google-Smtp-Source: ABdhPJzG+mcSLyWl7jt3XQN151DWpiwvI6KiP9b87KeVeXcufqlQGDTTWqM1O/ioChsREh8Rqysk1w==
X-Received: by 2002:a17:907:6e87:b0:6e7:f655:3b41 with SMTP id sh7-20020a1709076e8700b006e7f6553b41mr16895331ejc.704.1649406816836;
        Fri, 08 Apr 2022 01:33:36 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906521000b006d58773e992sm8472563ejm.188.2022.04.08.01.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 01:33:36 -0700 (PDT)
Message-ID: <f7e83ba9-32b6-bb13-3b0e-a1f82bf0ae02@linaro.org>
Date:   Fri, 8 Apr 2022 10:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: dts: Drop unused ti,am4372-timer compatible
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-omap@vger.kernel.org,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220408081216.57146-1-tony@atomide.com>
 <3a4b5e26-e770-d778-5ae5-f46ba00066ce@linaro.org>
 <Yk/yaqWHSpaO2eRe@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yk/yaqWHSpaO2eRe@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/04/2022 10:29, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [220408 08:22]:
>> On 08/04/2022 10:12, Tony Lindgren wrote:
>>> Drop unused (and undocumented) ti,am4372-timer related compatible
>>> properties to avoid dtb warnings when updating the binding to yaml.
>>>
>>> The dual-mode timer instances on am43 are compatible with the am3
>>> timers.
>>
>> Are you sure this is correct approach? Maybe some other user of DTS
>> references the am43 compatible, so instead it should be documented in
>> the bindings?
> 
> No users. 

You sure you check all operating systems and all out-of-tree users? I
did not talk about in-kernel DTS...

> The driver does not parse these. The am4 SoCs boot using
> the am3 related compatible properties.
> 
>> See also recommendation "DO use fallback compatibles...":
>> Documentation/devicetree/bindings/writing-bindings.rst
>> which maybe applies here?
> 
> Yes I'd agree if there were users for this, or if this was already
> documented :) But I don't see a need to keep these am4 specific
> properties.


Best regards,
Krzysztof
