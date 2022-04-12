Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A1B4FDC27
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 13:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiDLKO7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 06:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377972AbiDLJ4C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 05:56:02 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E666BDED
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 02:00:53 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bg10so35993375ejb.4
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+RIKl9qWM3M6+J1iZ1YqrZZKm7+7GiKis/oEh6MmLLI=;
        b=iFcddDhU04FA9QotxDH04NLwV+JoUSATF1jdNc6z/JCmb8CxuYAN/5JrdhXmt2pSnP
         iscYA4JVVoP57d5x9Oc0fhNxO4HSIyhMt5VZsP01D7V7qWZhKA4czrWExVUm4AyCSmBc
         fo91qKBj5KbwzfkTA+v2ZVUCMV2FxZOEjaXYvkHVdAxsV1W8x9CmFV+foBcNsrbo/taB
         tuQsDHoVRlrlrm7RqWJE14PmSxHIaV46jZS86Q38v9M8KPzdDgEI6m3dhv+7quoOR+Kf
         /y4nalFFpowbmvtO13KqE+3XritUnU9G7JajxW98uxeD9d+DLbFfZF6C4B4L1rSv2FdX
         cqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+RIKl9qWM3M6+J1iZ1YqrZZKm7+7GiKis/oEh6MmLLI=;
        b=e9YwaM/SukaXrgVgNq33u8h/mcmS0qI5CeXG+sN9bM8acAXTfAQ+wwBkiTbcGaJUgw
         sFr25wbgGephiumtssAM3mouwLceh9i57+4VLWBEvpQkoOI54XbBlVrAUNbnBn45DgW6
         KCY1hgVRDSDDtWMF9FCYdyusuikTOAGiytaSegx6HVw+8g23K/PFyxPopOwfLPwAcI6X
         b5JlvWtqyax6E7qOEFoRXdw6yE1Y3ehDCVHn63sZ1JY3odfYP87C3cSmAan68jW1l0w7
         6QVOVSsS6xxQqg68h00kAa6BcN8Q00+2Eq4WFoy95huAVuENoQXcSWNg/zY3xA8sINUs
         /OvA==
X-Gm-Message-State: AOAM53328nul2kPLWDDel66r6OmPpa786vib8pVqXrSmYUv7bb2cHuri
        C0u3MdiP/dki1wqDh7n05E/0lw==
X-Google-Smtp-Source: ABdhPJw6i3XMkUE2++p+HzcLbPrBel/BYSuUENRohHrLz2IzEC89n5KJaIN+OM8MX1+1ss8Rf20a0Q==
X-Received: by 2002:a17:907:724b:b0:6e8:a44:4691 with SMTP id ds11-20020a170907724b00b006e80a444691mr33583698ejc.453.1649754051940;
        Tue, 12 Apr 2022 02:00:51 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id h7-20020a50cf87000000b0041b7bd52e1fsm16798837edk.78.2022.04.12.02.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:00:51 -0700 (PDT)
Message-ID: <3f3ec103-a7d8-b56d-afff-94a0379dffec@linaro.org>
Date:   Tue, 12 Apr 2022 11:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: timer: Update TI timer to yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220411111858.16814-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411111858.16814-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/04/2022 13:18, Tony Lindgren wrote:
> Let's update the TI timer binding to use yaml. As this binding is specific
> to the TI dual-mode timers also known as dm-timers, let's use file name
> ti,timer-dm.yaml to avoid confusion with other timers.
> 
> We also correct the issue with the old binding that was out of date for
> several properties.
> 
> The am43 related timers are undocumented, but compatible with the am3
> timers. Let's add the am43 timers too.
> 
> The dm814 and dm816 timers are missing, let's add them.
> 
> Some timers on some SoCs are dual mapped, like the ABE timers on omap4
> and 5. The reg property maxItems must be updated to 2.

(...)

> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: Timer IO register range
> +

Apart from what Grygorii said, it would be useful if you add "if:then:"
case constraining it per implementation (as I understood from commit msg
only some use double mapping).

This looks like:
https://elixir.bootlin.com/linux/v5.18-rc2/source/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml#L53

Similarly should be done for clocks, unless it's impossible (same
compatible uses different setups of clocks).

BTW, it's a bit confusing it is not a v2...


Best regards,
Krzysztof
