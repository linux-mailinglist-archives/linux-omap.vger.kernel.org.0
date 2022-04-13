Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171EB4FF56B
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 13:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbiDMLH4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Apr 2022 07:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiDMLHy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Apr 2022 07:07:54 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB14A58E50
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 04:05:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r13so3180819ejd.5
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PS3VhaFtyBO9DatsV/CyvDlQh5hYtTRi+Z+F+oPBZHc=;
        b=aas+peqOgXfaDQtFGQ6PkUFndDFJ/bQN8deYk7uucLlWOQJY6St7o+wM/OMwlm8uMP
         iWI1BEYVY+4OFhXZ/hlyzNT7NBDbJJj4/ymrICSzMeaO/XTfcIIOzJp4ZDe+GmAXzNf3
         1+ljJRUBh8/C2Tj4bqZMwMfH6FYMTxaJC/2qL6KC7Xlhdj/MfJ+Ddzk6zysQpqTyTxHO
         n3qrIZMmGB3paCJZ8rpat4mGdtHncgcCJbpLPEdBbbt7G1W6PHMQM+MA7oUI3ITmIvSG
         4SfNuMxmrkQmFG9zPPbcvhXJrZJ5AUQFezhe8DhRw6dti5qCRPXWUg1K9OELvHrNpd6Q
         aiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PS3VhaFtyBO9DatsV/CyvDlQh5hYtTRi+Z+F+oPBZHc=;
        b=h+RogF3290d4VHIHg6es8Esrug7ABEuih/NFcye4j+POST2iZh2/ZkUb4j7kN40J/y
         meatPCymeUFuxRDVeWlYw/wvv2R/wU/Cek9RQyNjQzwfi4G2e4Fo55vY0naNAo9XCFyk
         6E+tSX253gGODN3lYtfkKDbXVOUUm7VPSfBQED6q2iJitGfL4x8VYqp+KZaG9FV4gAVd
         9LCieIh5t/LOlpwnC9N2uvqimYcfF4ExjlGOHcfCTL9ifrH+FiK7dxXbLG2BGpjJIKDj
         UysRYLoeT2k6DxHjeddt/GwtGNXXcybEGhPgTMcvAzPVUiYAcrxsPJhjCxMyZcGctqhL
         HDTg==
X-Gm-Message-State: AOAM5312z2n2BJMRDHx7FPM2InJ6ENLpHZ1gMinWfv32I9AjBXYk+L15
        iFF4jpPwWlK9jOXGeJnSeGgqow==
X-Google-Smtp-Source: ABdhPJwK89+NCQ4gDvarGQBiLdX8MSJa2HxKL1uMkTJNddkeBUFdOy0KEsAj7r8eBxU+9poR0zRrEA==
X-Received: by 2002:a17:907:8a0e:b0:6e8:c5df:d9e with SMTP id sc14-20020a1709078a0e00b006e8c5df0d9emr2841387ejc.142.1649847931499;
        Wed, 13 Apr 2022 04:05:31 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm13972528ejc.197.2022.04.13.04.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 04:05:31 -0700 (PDT)
Message-ID: <68d16fbb-4250-73bd-b55e-a14db91abe8f@linaro.org>
Date:   Wed, 13 Apr 2022 13:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/2] memory: omap-gpmc: Allow module build
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>, krzk@kernel.org
Cc:     linux-omap@vger.kernel.org, nm@ti.com,
        linux-kernel@vger.kernel.org, kishon@ti.com, tony@atomide.com,
        miquel.raynal@bootlin.com, vigneshr@ti.com
References: <20220411095516.24754-1-rogerq@kernel.org>
 <164984299612.34759.11981181842672620752.b4-ty@linaro.org>
 <20428012-f164-c03b-fcc5-d3d8df812aff@linaro.org>
 <ed2167af-fc9f-1f52-e8e2-c0881f5d53c6@linaro.org>
 <7b38a717-ffce-0f06-1a77-6d2a114c7e11@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7b38a717-ffce-0f06-1a77-6d2a114c7e11@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13/04/2022 13:01, Roger Quadros wrote:
>> https://krzk.eu/#/builders/63/builds/162
>>
>>
>>>  config OMAP_GPMC
>>> -	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
>>> -	depends on OF_ADDRESS
>>> +	bool "Texas Instruments OMAP SoC GPMC driver"
>>> +	depends on OF_ADDRESS || COMPILE_TEST
> 
> 
> Looks like include/linux/irqdomain.h does not have fallbacks if
> CONFIG_IRQ_DOMAIN is not enabled.
> 
> I'll have to drop COMPILE_TEST and add depends on IRQ_DOMAIN.
> Is that OK?

Previously it was building with COMPILE_TEST on sparc, so what else changed?


Best regards,
Krzysztof
