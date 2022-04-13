Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1DA4FF607
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 13:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbiDMLuV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Apr 2022 07:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbiDMLuU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Apr 2022 07:50:20 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67C755235
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 04:47:57 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u15so3342764ejf.11
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 04:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jjQ3FZFjqfTD+VcguZaZmmSb5AFyfO4JHpKuzAYkDRc=;
        b=smonsKckFHLLyesrgqtRISOQeUkyq2vvw0W0wHsj/jkZq2wR1tvbAV1CYBZ8SJf8SX
         NQe3XfBwwuOFEYEhZGVJ48KSOul2kQp65pwzHWIqlMA1CD9BeNwbXgUxXqiuXJTZHQgi
         svPuKVbgKc4aOGxjdL/wcDYZoVsGlQzAkkPoeG/VOyY6ElHTXlmBI9mGw6I++l2cEKnl
         OnhJUX3GZW2zSwPsjzgUbK7u6K1t1Yajvtv0uA8mmaU27klXr0+/I2yuda2bqyIU6kVe
         4k4HFn0MsibdAhRU3mXTDy2IcB4CaOKyKhu+umRJoTX7gMDRW0izhATV/Yu0o5xJg/ID
         jP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jjQ3FZFjqfTD+VcguZaZmmSb5AFyfO4JHpKuzAYkDRc=;
        b=jSlXBAxdE8ecXjf+Z2TKuyoECw0CtbbtJYllsbNmtiKa6SO+JJD22jBCfjAQ5do2tF
         rROdaCzxlgVjzjJHpgmn3eV3AJRppSy68NbVWbb5wJcWsEaN4vueXru3zwDEPM4BiBz0
         /YrQ0gFW1Cqwld7bOXtNVdAQ3IpcQDA7RJlZo/RsjaT2AvJEwjfXhJLaHI48xMnh8BqZ
         nP91BWLZcWpx5zhSQsTcgX2qwOEWnP52V9hprRKu09/Jx+nd1A36ONVlO5DDYwH3y7qG
         8ITlXUJLJEyBpl6iIImn6Qij1eyHawilGJPp+0L58LhWaEVHuafvIjGZLh/MChF03Xyk
         GfQw==
X-Gm-Message-State: AOAM532qDQDCpKSzPkJZZ49VjvYcRCGYbrvGvYzxYXOP8kRgt7w+uzWX
        18x7qUBAOjM9A26oZ7cUA+vlDjNA0lKbCv31
X-Google-Smtp-Source: ABdhPJyApblQcAcJdPCK6ZBEj71QO5kAJT3zJbnR77XyGsP/tSZCqTKzzQ1fYTsK4ZIiUXyX/TyyXw==
X-Received: by 2002:a17:906:a005:b0:6e8:947b:7530 with SMTP id p5-20020a170906a00500b006e8947b7530mr12643170ejy.320.1649850476500;
        Wed, 13 Apr 2022 04:47:56 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ay17-20020a170906d29100b006e88f246fdbsm3595139ejb.152.2022.04.13.04.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 04:47:56 -0700 (PDT)
Message-ID: <f2b7b48f-906e-3445-3861-dcdd4f6551e3@linaro.org>
Date:   Wed, 13 Apr 2022 13:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/2] memory: omap-gpmc: Allow module build
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-omap@vger.kernel.org, nm@ti.com,
        linux-kernel@vger.kernel.org, kishon@ti.com, tony@atomide.com,
        miquel.raynal@bootlin.com, vigneshr@ti.com
References: <20220411095516.24754-1-rogerq@kernel.org>
 <164984299612.34759.11981181842672620752.b4-ty@linaro.org>
 <20428012-f164-c03b-fcc5-d3d8df812aff@linaro.org>
 <ed2167af-fc9f-1f52-e8e2-c0881f5d53c6@linaro.org>
 <7b38a717-ffce-0f06-1a77-6d2a114c7e11@kernel.org>
 <68d16fbb-4250-73bd-b55e-a14db91abe8f@linaro.org>
 <fdafb49b-9349-087b-f483-4da888193683@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fdafb49b-9349-087b-f483-4da888193683@kernel.org>
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

On 13/04/2022 13:33, Roger Quadros wrote:
>> Previously it was building with COMPILE_TEST on sparc, so what else changed?
>>
> Previously it was like so
> 
> 	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
> 	depends on OF_ADDRESS
> 
> Means it won't build if OF_ADDRESS is not set even if COMPILE_TEST is set.
> 
> And OF_ADDRESS is not set for sparc
> 

Ah, yes, so dropping COMPILE_TEST seems the solution. There are no other
"depends" here.


Best regards,
Krzysztof
