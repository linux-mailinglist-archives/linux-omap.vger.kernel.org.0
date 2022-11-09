Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4814D623012
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 17:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbiKIQW4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 11:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiKIQWz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 11:22:55 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E065F17050
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 08:22:53 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id c25so26428968ljr.8
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 08:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9DBQc/5dKXa1ET93Qb1zudE+cWUtfpHl+fK7TF/wvw=;
        b=PQrgsPzBm+nt4QIlMLQU9lO/Z/BDI0u6uh/lyA7xqgxRyEeS/K4w24CNwl0QxbSvxK
         LGjSlsX2N/boaup9pnwpB8aSQQ+JSWT6P6uNxJ8hlVkIeK4g9uzodJFOCyzrlZfdSrAc
         V66jj5FhfLEPUJUInS7u2MuR2CsdHUKM19JML+sWGRHpOvjWZ93+CZvxaN0wh5KjhYSb
         VIq0P4uBipcQ8KzXrtfbRNuAVI3fc+z4iVdQOovoW1irjfxPaas85LA4KBuWFRqcUgg2
         r/V6/DyA0uYfqPqmfY7MCNF8nPT67RlF33ZGE8qm2to+fm7ZDj3LHBHdCnsKtwwCmKfF
         tRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9DBQc/5dKXa1ET93Qb1zudE+cWUtfpHl+fK7TF/wvw=;
        b=GStx3YnToWbQmvBWT16E6DeyrsY9olX/DytSu2FzTiOx45X4HrQCXeQSgYz6aLE2cg
         tSM4moeCkoSkjwkxX4uctBFfejy1cfEceT+ZRbF1SYbdmnLq99844qiP5beKaiEf/08e
         pwqF+eTd8/P/cRc2Z9DFnhTW7sbjmqLq3Vk5/Ojlmfb5slj41RS6LL6QL2t/whs7+zuO
         1GZH1z8uVp/byo+FdHFnCRW60Hcp1mivRObwP+JTlC86SR7EsHDo/B1Bo+eMzMOZ4DHp
         nFy6Y81q0tXbPGv0VEyTK1zGWzC0CKmaq6fAbsmupzp1qBKZQwrGKyfxHQAEojwV6rN3
         4H1g==
X-Gm-Message-State: ACrzQf3LU2C7t+tJdmdNcfPWQYfrOovYtIyABx1X3+S4tLk4JZLOx4oj
        e5kR8WXW4rqb3iNqsUqdmv1Btg==
X-Google-Smtp-Source: AMsMyM4DA0Ra3IxLTRyHXuTQH71WtL/K0WEIrqvQjgKE7xUNK58r/sBTPFIrPd/VCXQl5AAnj0I49g==
X-Received: by 2002:a2e:b98d:0:b0:277:2f7f:a14c with SMTP id p13-20020a2eb98d000000b002772f7fa14cmr7539098ljp.96.1668010972253;
        Wed, 09 Nov 2022 08:22:52 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id k19-20020a2ea273000000b00277522fc29bsm2227353ljm.3.2022.11.09.08.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 08:22:51 -0800 (PST)
Message-ID: <3c530543-6d89-bf63-8734-7ccb02aede84@linaro.org>
Date:   Wed, 9 Nov 2022 17:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] ARM: dts: nanobone: Fix GPIO settings for RTS/CTS
 pins on UART3 & 4
Content-Language: en-US
To:     Mark Jackson <mpfj@newflow.co.uk>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221109160904.183147-1-mpfj@newflow.co.uk>
 <20221109160904.183147-2-mpfj@newflow.co.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109160904.183147-2-mpfj@newflow.co.uk>
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

On 09/11/2022 17:09, Mark Jackson wrote:
> The NanoBone platform uses GPIO pins for RTS/CTS control.
> The DTS still uses the hardware RTS/CTS pins so this needs fixing.
> 
> Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
> ---
>  arch/arm/boot/dts/am335x-nano.dts | 8 ++++----

You still use a bit odd subject prefixes. What did the log tell you for
am335x files?

Best regards,
Krzysztof

