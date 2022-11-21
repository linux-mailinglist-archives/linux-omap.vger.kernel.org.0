Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA687631E66
	for <lists+linux-omap@lfdr.de>; Mon, 21 Nov 2022 11:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiKUKdA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Nov 2022 05:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiKUKcz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Nov 2022 05:32:55 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7248114015
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 02:32:53 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so18177880lfv.2
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 02:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtiHEjAIttB7CAn3xJDjqRmiO71yc6P2uSCGvhcaPgQ=;
        b=Ofw8MR2aR6I3oqDUrvg1WNpkJKSdUMRram8Be151ukQ+WTMKwDwGqPfs8kY2MGrPvO
         U7+N/+FpaGf6O0ZmfJ1JX6jkIigIJUqTNAQ/Da8SIuM5Z4DLuiljxGq9Jt3Q6MgLFeLJ
         wGDL7AxBH+e0cYbQNIx0O+h0Ucz53b+QrEg52FqhL0Rn1rmihPwkho0MD7L6nXinjJGA
         1lQbUjb9tWuI1m4VaF2KE3KZH42XuF1GoapyjoUWXSkXEOVjghzI2kYZ/1e5qxE26RT1
         qhC7kT+VkrIpt00ztie7cCJwDKGF7LsfdErAqFVSoSk5YLE1JwAnQD0SDMv/8K9oMRjg
         HadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtiHEjAIttB7CAn3xJDjqRmiO71yc6P2uSCGvhcaPgQ=;
        b=bl7ZEp9rEZ+SrdTtdMt8erD3h24uQ69MXUe0OZhOB5txHQ4Bm//oL1oN+WeBk3ICSt
         UhCA7TrnY4G4y/eDAzMZu164Jl1JVPpr2yn+km0rP8zqKi+umHy6QNs3bgx2dvvstpRf
         FG4PUgce0f+fOxh6YGM3wP/sSyECDSXqioEWljfHdtlOogUrWXKLgo1QP5H0rsb/5vK9
         bGY6HYQWNVZ6fFZaPYIYPyDn+WNByYivoNI8S4vIkyGdT4vsouMqN4R+ER9v8OEcrliY
         V7Uvki3aGcEz+cmsYqtx+CjraW3ornwLaUvUBmQnVYM9SE2M3/Qj92HG2YKjcbIJZS/B
         rA5w==
X-Gm-Message-State: ANoB5pmKpFVKm2SuBQUmKs8TgNILTpECwOX4Qb6Hd2cpvztE4JnqH+of
        GP43B8XkB1fOFuSUfK9vktdp8Miw/Vw+2WQZ
X-Google-Smtp-Source: AA0mqf6iKN7PSXL75uuqu7QQqMYuqJfBl07GRSGM9UAfM8cwfuGCsmBq23v6rCPQVrw0DlKFfCQRJw==
X-Received: by 2002:ac2:46e1:0:b0:4b4:c234:b79d with SMTP id q1-20020ac246e1000000b004b4c234b79dmr1420378lfo.557.1669026771836;
        Mon, 21 Nov 2022 02:32:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i10-20020ac2522a000000b00497a32e2576sm1957021lfl.32.2022.11.21.02.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:32:51 -0800 (PST)
Message-ID: <beb1a813-a1c3-d660-0fa1-ef4c167245e7@linaro.org>
Date:   Mon, 21 Nov 2022 11:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: pwm: ti,pwm-omap-dmtimer: Update binding for
 yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20221118125435.9479-1-tony@atomide.com>
 <debfe50a-7e94-9703-efde-2c805faa3d2b@linaro.org>
 <Y3eXe/S6MMaDGwEt@atomide.com>
 <bedbaebe-d84b-fc0b-9492-4503a6d59a83@linaro.org>
 <Y3tOJZ3LJroyXD6D@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3tOJZ3LJroyXD6D@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/11/2022 11:08, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221118 14:33]:
>> On 18/11/2022 15:32, Tony Lindgren wrote:
>>> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221118 14:12]:
>>>> On 18/11/2022 13:54, Tony Lindgren wrote:
>>>>> +properties:
>>>>> +  $nodename:
>>>>> +    pattern: "^pwm-([1-9]|1[0-2])$"
>>>>
>>>> Drop the nodename, device schemas do not need to enforce it.
>>>
>>> Hmm I think that's needed to avoid warnings if the knob is
>>> tweaked to 11? Right now the max timer value is 12.
>>
>> Which warnings? The pwm.yaml allows up to 15.
> 
> Heh I was using dec instead of hex.. :) Yup pwm.yaml works just fine.

This could be fixed (extended) in pwm.yaml as well, because simple
human-readable increments/IDs are usually decimal. hex is only for
addresses.

Best regards,
Krzysztof

