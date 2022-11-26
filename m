Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A132E639663
	for <lists+linux-omap@lfdr.de>; Sat, 26 Nov 2022 15:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiKZOVQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Nov 2022 09:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKZOVO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 26 Nov 2022 09:21:14 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AEA1C41D
        for <linux-omap@vger.kernel.org>; Sat, 26 Nov 2022 06:21:13 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id t10so8193936ljj.0
        for <linux-omap@vger.kernel.org>; Sat, 26 Nov 2022 06:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5obQ3Ide4RB5uMggELDmXO7on4t90viFaYZeOWgeis=;
        b=xDaofYnuaJyO78Hc8HYNKOmUVRE36UYO39p/25fxrQUjLylFFza4lyIL/VL/N2w5ax
         NVCbTs4lNfoPeJRg0gB12mv5wbR8bXAFeevIvB+wBVFNjEfqwGA3ptIH3YsaY3lUj7mG
         BXyQ8r1RBLnub5TgYIPLKAPlixa+Uq7mP72virSVaW5QCWAinWrP2esKFJcpZeWmDMeN
         dWLljEPMRR/5pyOS7yJ3GFI5AD/+1bFCjbWzek06ViyloFpAuPXGdBb57Bw44jM4TL21
         SvQO6pv8BWAo9A+kfp9mpv+sJWsmCvBUl8/qOLrt7cYW1W/I0bBimAKZh+fVpejVoIhO
         kZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5obQ3Ide4RB5uMggELDmXO7on4t90viFaYZeOWgeis=;
        b=m3JBrRX0kmBGC3OjXtTj1ygiuRN4KpoRkAkYpE8uQDc5vrPIyvCR6dv3Rzz2QJnByU
         dCWhtcwQBMNNbVOmKLJU2M1pJuXwKRow/YkCN1XJlrOFUBX/6ZoQ1H3DtLsRRkOZ79xe
         fJ9RyBC32QBg+lwBNO4ccqR1Tp6OuFUTuQFg7OqQ2Lx3xaMjeq+zXnSLgp04ScXe45tQ
         WOeq6Kf+m9k/zpkYY7AeoPIf4Z1LZAhwJ5rHoTCW0PIrZv0YEb9+Z9/0YOJFOLkRERzH
         snXQ9YhoO4vffZBc6zoikWLqAYRktH900gUfvPEK6ewGOw0ZxRExsz5tP3FK2djyBOH9
         +TqQ==
X-Gm-Message-State: ANoB5plpENrZSQObKWg6kEtL3K3AOvO79KKYhl1J3IZjrcSlknBi4uPU
        39X4JuueVmM0hhcAFy7aTry9v0BVbVfXYQ1Q
X-Google-Smtp-Source: AA0mqf7KWWyGM9ADbqhoCL+LhoE2koMz2gHfpRe4+x32tgMaFnPDjyY6BCQ52wUBAJXACbJhaazX0Q==
X-Received: by 2002:a05:651c:3dc:b0:279:80f6:70d8 with SMTP id f28-20020a05651c03dc00b0027980f670d8mr5062528ljp.360.1669472471751;
        Sat, 26 Nov 2022 06:21:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b004978e51b691sm941373lfb.266.2022.11.26.06.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:21:11 -0800 (PST)
Message-ID: <bdfa865b-ce2c-ad8a-375f-9e3114ef9597@linaro.org>
Date:   Sat, 26 Nov 2022 15:21:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] ARM: dts: omap: n900: drop enable-gpios from LED
 nodes
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221125144150.477290-1-krzysztof.kozlowski@linaro.org>
 <20221125144150.477290-2-krzysztof.kozlowski@linaro.org>
 <20221125173602.cnipos5oo4ncxsac@mercury.elektranox.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125173602.cnipos5oo4ncxsac@mercury.elektranox.org>
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

On 25/11/2022 18:36, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Nov 25, 2022 at 03:41:50PM +0100, Krzysztof Kozlowski wrote:
>> LP5523 LED controller does not take enable-gpios property:
>>
>>   omap3-n900.dtb: lp5523@32: 'enable-gpios' does not match any of the regexes: '^led@[0-8]$', '^multi-led@[0-8]$', 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> The drivers uses it via devm_gpiod_get_optional() and the binding has this:
> 
> grep -A3 enable-gpio Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
>   enable-gpio:
>     maxItems: 1
>     description: |
>       GPIO attached to the chip's enable pin
> 
> -- Sebastian

Oh, thanks, I am pretty sure i was checking it but maybe I looked at
wrong driver :(.

I'll fix it in different way.


Best regards,
Krzysztof

