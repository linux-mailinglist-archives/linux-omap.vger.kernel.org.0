Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82966321CA
	for <lists+linux-omap@lfdr.de>; Mon, 21 Nov 2022 13:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKUMUk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Nov 2022 07:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiKUMUj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Nov 2022 07:20:39 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B79C2F016
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 04:20:38 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so18526520lfb.13
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 04:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCyXfQuEuirL8Qat4QCrDKqiG+jMF9mAN8ntfMfIQKU=;
        b=FRavdvgI4Yi3r0FF37+rio0I/sCoK7LUY1T6CQHvQ10Q1cfnFkKk4P6bIgQ85ZyWfs
         7U39AGix419TFwrAXD5Y59lMMXHSAIf+aYfqY3AS9pjFJX/c1hTdziPReGS6rdKQqMEw
         JjKrP0XDcIuskd25UkaAi9dSQ7/c3uLDMlK7ZBw5yHQZ/H2INPkCid7HGCs3ac0XyiHl
         bPIrHH09nGXHdGdBLIcPYJEU6xgWNKIH6uG5umY2vW0PLLDXo9gXCLFvlDuTBFEyKWbH
         etqQVzoeTxUz+rDKK+v+EdMMuB+55CL7+Xs7NplZOUhmJb+CA+doLpKGiFhx60ttyjMp
         nv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCyXfQuEuirL8Qat4QCrDKqiG+jMF9mAN8ntfMfIQKU=;
        b=6VYsMIvQVvBuhjYHmgF5dBkbedvPdrqK0k6GqcDtWfLHUxCH0OKZu9nN6NEQsjtxNL
         ItM207YOOpqfG58G6OypZjFC9s/5elfNxE4jbvKBZ8SZ3vzKj0vI2/oNkyf0vLl2qgtL
         ucg82uxkJX58YfOtkNNI0dLpSWtRv5gd3RfR7kh648gUCqw8r9iXk+ayD1VVO+wxhzHI
         4xVIWJlDleCPuzb0FivjC4ZlyjEg16wNnFHdSRhacXJ7QhPu4sWvlRPqbfHs8rob/SR8
         M0T0MpS8e/sPcIbYnU2Y+FLgi//Vs0DYHR3qq5WvH0MF2l1KEjGJnrefOjHeuoKVMBFb
         BDUg==
X-Gm-Message-State: ANoB5pmiUuIVN45jp+qYq67d/Nd8fS04f8myht+LoWhGgMO6N3hU3NGK
        DoyPyuJSm8IaWn8IyID9T9yIWQ==
X-Google-Smtp-Source: AA0mqf6Hc3eK13XM29FEs9ow09soZkej0ZHrDMZzwf9pL09aYfUNoWv/9r91isJ/jnKJvaxlD4y7VQ==
X-Received: by 2002:ac2:4e8c:0:b0:4ac:d6e4:41cf with SMTP id o12-20020ac24e8c000000b004acd6e441cfmr2569826lfr.102.1669033236831;
        Mon, 21 Nov 2022 04:20:36 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 26-20020ac25f5a000000b004ac393ecc34sm1997092lfz.302.2022.11.21.04.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:20:36 -0800 (PST)
Message-ID: <af247970-7eec-b070-282b-2e84a90d4eb6@linaro.org>
Date:   Mon, 21 Nov 2022 13:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] dt-bindings: pwm: ti,pwm-omap-dmtimer: Update
 binding for yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121115525.36362-2-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121115525.36362-2-tony@atomide.com>
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

On 21/11/2022 12:55, Tony Lindgren wrote:
> Update for yaml and remove the old txt binding.
> 
> As we can replace most of the custom timer API with standard Linux
> frameworks such as clock framework, let's tag the properties for
> ti,prescaler and ti,clock-source as deprecated.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

