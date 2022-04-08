Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F7F4F90E0
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 10:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiDHIer (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 04:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbiDHIem (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 04:34:42 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2867E13BAF4
        for <linux-omap@vger.kernel.org>; Fri,  8 Apr 2022 01:32:39 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id p15so15825136ejc.7
        for <linux-omap@vger.kernel.org>; Fri, 08 Apr 2022 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=txV/NfQNrP1uyaZw5luTkUIuG9UIe6T8laPnVtE+ou4=;
        b=vGnmC+4yvuJ5/2224lsny3kyYz8KUeTaMBgGe9emI8XWejQGVyxSZmL74JDm5FkTSc
         alnaihX67FdoQeEJPb8zR9H6krAT9lDs8CwysnzMJYd3+yk7Nkf99+qFnYHYiGx720RU
         z5BPLeurEmsfvnIwXFRQr4FdvbaA2VJUxsmF8UJNmVjaf7E0hLlvKMQUBRhQzLJOHhLU
         4QGlDLX1IpfPjLLVZKbWbNkyk1VGwjxqb5r23yNzgTjBC9NworXQkDbnLl1qmPy84TTJ
         9Cc+0IeOrv9/gIn4vn9s/WHSedoITzb/jMvV3ECTjD/z3puyNbDEzMrqZVcqXTt7R43q
         jR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=txV/NfQNrP1uyaZw5luTkUIuG9UIe6T8laPnVtE+ou4=;
        b=jsLVBU571mp3ouFDAWv4h5eBwFhoMOMaIpODcoOP/2DUq6K1JbNs5q+DOKy3EQBlLV
         aq3ErE1oS7cu2TzRXa0oyTs+jsR7NRKY2+turAhbCeyCm5KE6tDahZMUJy+DW5zQPvNA
         lt41mNWEyVDUlI4sNHL4od1oIP6bMOwCNpgg8JzwZhnYeDFxESavfBDIax1fUfSNmNxZ
         oLJWlVu/2qKP7iPv7LWoj0OfBojEL1RzbdiyRAJJHsnhk5JduBvrzaQhd02P9itC7vn+
         SbftjBWtZVxW4Zuf0I/TS4QsXiFsERjoWWEuDIOqFT3VeexRW8EYW5RlHI/bU6L8dTmk
         erGw==
X-Gm-Message-State: AOAM531NBvMxXQiod7AYhfVcH0OXFMNIyOGZnL0LimiuQc0gxuCKjhzA
        sCkhBJJ4klPU7d/7bhTCdov2WF7kCr25vVEc
X-Google-Smtp-Source: ABdhPJwZqu/QbjMioxqrbCZrGYiCjtPl8hsIJUcyjWkxJCYybU12PCpgfeASpt7aoTgJqVxtALQkVg==
X-Received: by 2002:a17:907:160a:b0:6e8:3c5d:9ce5 with SMTP id hb10-20020a170907160a00b006e83c5d9ce5mr6389834ejc.606.1649406757678;
        Fri, 08 Apr 2022 01:32:37 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090600d600b006dfbc46efabsm8494563eji.126.2022.04.08.01.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 01:32:37 -0700 (PDT)
Message-ID: <d8ad6a2b-0982-a7f2-c331-cced4e321c7c@linaro.org>
Date:   Fri, 8 Apr 2022 10:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: timer: Update TI timer to yaml and add
 compatible for am6
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220408081258.57213-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408081258.57213-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/04/2022 10:12, Tony Lindgren wrote:
> Let's update the TI timer binding to use yaml. And add compatible for
> ti,am654-timer for TI am64, am65 and j72 SoCs. As the timer hardware is
> the same between am64, am65 and j72 we use the compatible name for the
> earliest SoC with this timer.
> 
> As this binding is specific to the TI dual-mode timers also known
> as dm-timers, let's use ti,timer-dm.yaml naming for the new file.

Thank you for your patch. There is something to discuss/improve.

> ---
>  .../bindings/timer/ti,timer-dm.yaml           | 105 ++++++++++++++++++
>  .../devicetree/bindings/timer/ti,timer.txt    |  44 --------

pwm-omap-dmtimer.txt references old path.


>  2 files changed, 105 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/ti,timer-dm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for TI dual-mode timer

"TI dual-mode timer"

> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description: |
> +  The TI dual-mode timer is a general purpose timer with PWM capabilities.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,omap2420-timer
> +      - ti,omap3430-timer
> +      - ti,omap4430-timer
> +      - ti,omap5430-timer
> +      - ti,am335x-timer
> +      - ti,am335x-timer-1ms
> +      - ti,am654-timer

How about ordering the entries by name (so amxxx before omapxxx)?

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: Timer IO register range

This was maxItems:1 in old binding, so please mention briefly in commit
msg why the change is needed. If only some versions need it, then add
allOf:if:then: constraints.

> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]

The same. Are these changes to the binding an effect of new compatible?
If yes, better to split it into two patches. One for old binding
(passing dtbs_check on old compatibles) and one for new compatible with
new properties.

> +
> +  clocks:
> +    description:
> +      The functional clock for the timer. Some SoCs like omap24xx also have a
> +      separate interface clock, and some clocks may be only defined for the
> +      interconnect target module parent.
> +    minItems: 1
> +    maxItems: 2

The same - not mentioned in commit msg.

> +
> +  clock-names:
> +    description:
> +      Timer clock names like "fck", "timer_sys_ck".
> +    oneOf:
> +      - enum: [ ick, fck ]
> +      - items:
> +          - const: fck
> +          - enum: [ ick, timer_sys_ck ]

Are the combinations depending on compatible? If so, you need allOf:if:then:

> +
> +  interrupts:
> +    description:
> +      Interrupt if available. The timer PWM features may be usable
> +      in a limited way even without interrupts.
> +    maxItems: 1
> +
> +  ti,timer-alwon:
> +    description:
> +      Timer is always enabled when the SoC is powered. Note that some SoCs like
> +      am335x can suspend to PM coprocessor RTC only mode and in that case the
> +      SoC power is cut including timers.
> +    type: boolean
> +
> +  ti,timer-dsp:
> +    description:
> +      Timer is routable to the DSP in addition to the operating system.
> +    type: boolean
> +
> +  ti,timer-pwm:
> +    description:
> +      Timer has been wired for PWM capability.
> +    type: boolean
> +
> +  ti,timer-secure:
> +    description:
> +      Timer access has been limited to secure mode only.
> +    type: boolean
> +
> +  ti,hwmods:
> +    description:
> +      Name of the HWMOD associated with timer. This is for legacy
> +      omap2/3 platforms only.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - reg

Missing interrupts - they were required. Aren't anymore?

> +
> +additionalProperties: false
> +


Best regards,
Krzysztof
