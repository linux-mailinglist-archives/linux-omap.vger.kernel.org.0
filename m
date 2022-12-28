Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17842657556
	for <lists+linux-omap@lfdr.de>; Wed, 28 Dec 2022 11:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbiL1KdR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Dec 2022 05:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbiL1KdQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Dec 2022 05:33:16 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1BC810063
        for <linux-omap@vger.kernel.org>; Wed, 28 Dec 2022 02:33:14 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id q2so16162322ljp.6
        for <linux-omap@vger.kernel.org>; Wed, 28 Dec 2022 02:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEp9IYyED8X7OHNpRld99usILEl7zmdiLWyW6VCAt3I=;
        b=ODEssGuGzUu2tk/wxbHi7TxffhnKCPYfPWJ3mabLByvOf8Tcih8kc/cn/9SDvv/lmr
         eB+4z7yOBh+vO6BWBk4wcbF/QNYPc5F2136iRDmk6gdj1E+HaYJUD1JGhY5V7hy2FU7K
         q/J+t//VVttb1T1KVyW/qz7fwtjulFEfIPkVa27Fwe/Pw8TIlk41PM0pPuarmzAv3R2n
         7QENWp2h3kGRe6/Sbe1xqfd2v27E6ejkBy6o7jJATZRRoTzk7oM0fDQNWpa+6QhrDvvN
         CIIchKYn47eAODcOKAATngruhSfYPMMjP/jNnxxlOp0qMCMWA/bTpCJJWYZnSzjOTC4L
         J/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEp9IYyED8X7OHNpRld99usILEl7zmdiLWyW6VCAt3I=;
        b=p2A0wCLImBVvjQnZE2Wij4YA0sRvUOqzwx40g4hayYeVWGr0rImDEWKok+LK9xhGNq
         wLs9fzdArM962rsIMSziNmd0f7JAPAHXbWAqSsmAn1uAalE4Euaz8aGLQANhb2X5xDoT
         /O7T3baGvUb5c95Mx/WDheY19MaRll/GTvHe0lCWR6UCqcMH1CkK6uw5zK41ujyE3Iw/
         Qh/Vi7YtYuJSsRz7/Su/nCVmcaW6CVVg9WjROC0DiY8yoTJwZnHsjAakLqIsjT8ZSxZi
         QSvlLpF2SwVJMpTUhIy1JCf44Exrynn973EzWq2JUmRRsAXWAxpl82Qh/+OfEJx26i0H
         MLPw==
X-Gm-Message-State: AFqh2kpvP7MQiTZqEUlPxAxBu4/3juzPYFpXGfTEdrB9ep9xB8QQ8GXW
        N5xfOXMWX7Ssmo4JEz7l4HWiTN6NCFBroxbU
X-Google-Smtp-Source: AMrXdXuQCDuEPsW6x3RcMopuQYPmt30y+od2VlW/CIl6y/KTfTnBNt28UrsHU9ln8ZXUut8+xGwPyw==
X-Received: by 2002:a05:651c:505:b0:279:bddb:6c8e with SMTP id o5-20020a05651c050500b00279bddb6c8emr8977955ljp.25.1672223593192;
        Wed, 28 Dec 2022 02:33:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c031200b0026bf0d71b1esm1887465ljp.93.2022.12.28.02.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 02:33:12 -0800 (PST)
Message-ID: <958b6c4e-02f8-1289-42f7-212edbcd80ee@linaro.org>
Date:   Wed, 28 Dec 2022 11:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ARM: dts: n900: switch accelerometer to iio driver
Content-Language: en-US
To:     Sicelo <absicsz@gmail.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tony@atomide.com, devicetree@vger.kernel.org
References: <20221227223841.2990847-1-absicsz@gmail.com>
 <20221227223841.2990847-2-absicsz@gmail.com>
 <73599d25-cd2c-e89a-20b4-d34471583a6b@linaro.org>
 <Y6waVkobLCGqRHm7@tp440p.steeds.sam>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y6waVkobLCGqRHm7@tp440p.steeds.sam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/12/2022 11:28, Sicelo wrote:
> Thank you for the review.
> 
>>> +	lis302dl: lis302dl@1d {
>>
>> That's not really explained in commit msg and does not look related to
>> your goal. If changing - in separate patch - make the node name generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>  
> Now I understand that it should just be `accelerometer@1d`. To be clear,
> are you saying this change should have a separate patch, i.e. not part
> of the switch to iio driver?

Yes, such cleanup is not related to changing compatible.

> 
>>> -		Vdd-supply = <&vaux1>;
>>> -		Vdd_IO-supply = <&vio>;
>>> +		vdd-supply = <&vaux1>;
>>> +		vddio-supply = <&vio>;
>>
>> Does not look related/explained in commit msg.
> 
> This is from Documentation/devicetree/bindings/iio/st,st-sensors.yaml,
> i.e. lowercase. I will look for a way to explain it in v2.

Ah, ok, then maybe mention in commit msg that you are changing
properties to match bindings of new compatible.

Best regards,
Krzysztof

