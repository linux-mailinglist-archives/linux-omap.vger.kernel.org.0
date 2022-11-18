Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C3A62F739
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 15:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242292AbiKROWf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 09:22:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242395AbiKROW3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 09:22:29 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EDC786E3
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 06:22:27 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id s8so8424979lfc.8
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 06:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaam7Rwpep2aPOzsoJKOhuI5H5q95ZEKsBuX54/RkA0=;
        b=LYUEDUuxlj0DTXL+fqITK6FJC1hTD370PBv9ogvxbnJAWFja2FM/7aVNHtwhHHTfyj
         uK4f0bJP1jwsjevvdi5D+WEy9e5SmvuZ+CNBwCLdu8WfgrhWYMDCRGV0nNzoJk8thp5R
         b8MyNClVFoqZYON3xTbRcJgprpwzNo76mpx0JDsTFSLdhUFhMpw2vaJjIzjZKMSCXcgc
         aKIAr4wXJUG5Ccjx14QkWuLmnt6AKpWGChddEn9wV1qmD6rV44wMN8LA6WARvxQ5BPk9
         gBFX7zhxvt9IKYyiwYeTIe+6NskI1gEs/od8GhZisTkqufzx+xUMP42ebeNcytVrH30e
         2JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaam7Rwpep2aPOzsoJKOhuI5H5q95ZEKsBuX54/RkA0=;
        b=eOiFjZO7spnYhWqLt80KAr3oynZqnTAIHvv8LBVJtNiYIZhg+L4t6HryuCa3u+u7F1
         b27GWr1Uq++TwA1kxq93/POKVItu2RTuFcNoBixLVMgRM0yt0jooAG45O3oPFxfc+a9G
         Sqle5Jd9GfACD/H2rLiEnFExVrrWuVNad8acnm0oP43h1eaNKQ4mwyZdGhUkdFwZiUZ6
         t2kPwlz7vDoHEEPU2rjt4cMaHiystelGrXyeRlDD7gbPKHQ/FupLdMynCyLiflcEvKjV
         9LQu7rlKfq8xzFHubyHI5UKMAjO9wyz2IiII7Z0+UEuHoxb1+AwaT835aM13RVkQMlki
         d2qw==
X-Gm-Message-State: ANoB5pnox82y+oR2Mg+NHS64hjlIXoLOGzFBec/+t6eRPkXM3S4B3shS
        gydc2wTvR9HhkDS7pxkvZJRIGw==
X-Google-Smtp-Source: AA0mqf51HJl/xsmP40ZEmRXj9Mv6ATcQou5uaRKEZUbj2VWNgmg8eJV3LNSeHUe57wXceFqn4S4gXQ==
X-Received: by 2002:ac2:5f41:0:b0:4b3:cc01:102b with SMTP id 1-20020ac25f41000000b004b3cc01102bmr2639277lfz.133.1668781346170;
        Fri, 18 Nov 2022 06:22:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b0049e9122bd1bsm678121lfb.164.2022.11.18.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:22:25 -0800 (PST)
Message-ID: <debfe50a-7e94-9703-efde-2c805faa3d2b@linaro.org>
Date:   Fri, 18 Nov 2022 15:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: pwm: ti,pwm-omap-dmtimer: Update binding for
 yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20221118125435.9479-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118125435.9479-1-tony@atomide.com>
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

On 18/11/2022 13:54, Tony Lindgren wrote:
> Update for yaml and remove the old txt binding.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Thank you for your patch. There is something to discuss/improve.

> -Example:
> -	pwm9: dmtimer-pwm@9 {
> -		compatible = "ti,omap-dmtimer-pwm";
> -		ti,timers = <&timer9>;
> -		#pwm-cells = <3>;
> -	};
> diff --git a/Documentation/devicetree/bindings/pwm/ti,pwm-omap-dmtimer.yaml b/Documentation/devicetree/bindings/pwm/ti,pwm-omap-dmtimer.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/ti,pwm-omap-dmtimer.yaml

Use filename matching the compatible, so ti,omap-dmtimer-pwm.yaml

> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/ti,pwm-omap-dmtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI dual mode timer PWM controller
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description:
> +  TI dual mode timer instances have an IO pin for PWM capability
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^pwm-([1-9]|1[0-2])$"

Drop the nodename, device schemas do not need to enforce it.

> +
> +  compatible:
> +    const: ti,omap-dmtimer-pwm
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  ti,timers:
> +    description: phandle to the timer instance used for PWM
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ti,prescaler:
> +    description: legacy clock prescaled for timer
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> +    deprecated: true

This was not deprecated before and your commit msg does not mention it.

> +
> +  ti,clock-source:
> +    description: legacy clock for timer, use assigned-clocks instead
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2 ]

You miss here explanation of constants.

> +    deprecated: true

This was not deprecated before and your commit msg does not mention it.

> +
> +required:
> +  - compatible
> +  - ti,timers
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwm9: pwm-9 {

Node name: pwm

> +      compatible = "ti,omap-dmtimer-pwm";
> +      ti,timers = <&timer9>;
> +      #pwm-cells = <3>;
> +    };

Best regards,
Krzysztof

