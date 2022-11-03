Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8C4617CC6
	for <lists+linux-omap@lfdr.de>; Thu,  3 Nov 2022 13:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbiKCMh4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Nov 2022 08:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiKCMhQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Nov 2022 08:37:16 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE9B14D3F
        for <linux-omap@vger.kernel.org>; Thu,  3 Nov 2022 05:37:13 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id cg5so1053148qtb.12
        for <linux-omap@vger.kernel.org>; Thu, 03 Nov 2022 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLG01xuzkl0xodwDLAu36WoQsSaHKq4o1Mky6mwfR2I=;
        b=dSCYhv40lbvonPzw6rR7ErUo35vEt96iWhQdtv5TFq8O7OlUK5lZ2DRMoqecIr3+D9
         qLkfiSDMzM/H6UXur+8hvegmFzchTXnQAzMJzxxjke4H84eu+UpBbNDlCUN5FjjAS2ZV
         Wh5lcf8lFqG7B8t+SB+/9ILxLUKapuj27McHF61EpBoXRcnXWZziCpTay5cKpNdhiEEa
         +53vlqZxcOIJaeePxEnWJ/j66MZf4su3EOs2tbG3QctphrhE8xHBfQ7303Lj4+JWjBBX
         QmyLmv1c7jcctNUQldhiALKUsqO/NvF3vVvr67ZMEOKQjZpps5CBQs27/JZqGV0FIaFy
         5C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLG01xuzkl0xodwDLAu36WoQsSaHKq4o1Mky6mwfR2I=;
        b=s09Q5v9aazN5/uN1uSraG+a6VwzYq9VBExIgvWuO7AYfybHmRhzGbYjgG0maB+4PLW
         IdkSZsJOnzojxaodtqvS2gcM35807Ls4OkvkriY+LE1Ir0kDqMihVIPH7rz+XZ20GLmw
         C098h/o9CjYOuZKwwwE552wTqQhZmp7pTyzv7AiQVW2JXn8wDK95Z3PA+zozUwiH6Brk
         AJLxeCbwLV+PfEZwXaru6kqMVQizYP5jIzELK/8BrWgZjHOpbvCV8AakP0W8MNkf5ZAz
         5HcOZddei7aL5d5TwzpWlNLXMZIeprrUeXlywkslWyZYskQfQvVFwlopo06f/6RcTyFm
         eDBg==
X-Gm-Message-State: ACrzQf3Pql8iw8kML4XdSM2Ezabrd9Vnuxwhcuzo21fDS4lO5IzBhoWt
        +i8hjKbJ8P63IEq6CPISOkBGxw==
X-Google-Smtp-Source: AMsMyM4GUnTircemkIRH9aYYUynvdRniDY3f9fYBskcCFu1IqZO6WCnFMSiVH5QUM3HsoPKql6ytDQ==
X-Received: by 2002:a05:622a:17cf:b0:3a5:1f74:959b with SMTP id u15-20020a05622a17cf00b003a51f74959bmr19493248qtk.684.1667479032860;
        Thu, 03 Nov 2022 05:37:12 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id cd5-20020a05622a418500b0035d08c1da35sm453102qtb.45.2022.11.03.05.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 05:37:12 -0700 (PDT)
Message-ID: <09a7de3e-6431-1815-5ea0-072cbda81875@linaro.org>
Date:   Thu, 3 Nov 2022 08:37:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v9 0/2] gpmc wait pin additions
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
 <4582c561-bcdf-a880-cfe5-6813e1c66555@linaro.org>
 <3d067d7ce32abd6a78ee9a914e81393f48f46a37.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3d067d7ce32abd6a78ee9a914e81393f48f46a37.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/11/2022 04:13, Niedermayr, BENEDIKT wrote:
> On Wed, 2022-11-02 at 10:02 -0400, Krzysztof Kozlowski wrote:
>> On 02/11/2022 09:30, B. Niedermayr wrote:
>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>
>>> Currently it is not possible to configure the WAIT0PINPOLARITY and
>>> WAIT1PINPOLARITY bits of the GPMC_CONFIG register directly via
>>> device tree properties.
>>>
>>> It is also not possible to use the same wait-pin for different
>>> cs-regions.
>>>
>>> While the current implementation may fullfill most usecases, it may not
>>> be sufficient for more complex setups (e.g. FPGA/ASIC interfaces), where
>>> more complex interfacing options where possible.
>>>
>>> For example interfacing an ASIC which offers multiple cs-regions but
>>> only one waitpin the current driver and dt-bindings are not sufficient.
>>>
>>> While using the same waitpin for different cs-regions worked for older
>>> kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY) with
>>> newer kernels (>5.10).
>>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
> 
> Thanks for the hint.
> 
> Was everything OK with v9 (except that I resendet the tagged patch)? Until v8 I wasn't aware of that. I thought I added the tag for v9. 

You did not add the tag you received.

Best regards,
Krzysztof

