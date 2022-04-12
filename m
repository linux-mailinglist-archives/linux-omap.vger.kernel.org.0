Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415EF4FE68D
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 19:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354692AbiDLRJO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 13:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350498AbiDLRJN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 13:09:13 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E03C60A98
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 10:06:53 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w18so23101775edi.13
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=raAfMnfaujy89EROt6olDuVb61IfOgxmWloOA8zYdSc=;
        b=ELgABCdoXxbB4A1nHTqsqvRAfOeSH2V02z4cWqlIXeTjWlmMPVrzehBo2TS2Oc0blZ
         E9nxqEulOyevAIZEAwD0bvvgVQjxNJwOiZ0FJygqyscuhDM03ZUQG5c7Hyh6aRBaQI69
         FgMcUwT8ohJpIeA4nuMZal2fcI6qJIQysYxpjbSjJUvFnosGA5RgqDh76PZ6PKzQbP+a
         71C+5IC5rUCnQ4VDgFCobr8rlBANbI516HmintavSbcvRbZQtCsfJbGNLN7Oer/p9dig
         OsazMkPoxXtA/zO2Wg5uZhN13ZCVM0pHr/bCD6v9hZUJZVdjZq4TrbS/4Vn0RTLUBjfW
         SnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=raAfMnfaujy89EROt6olDuVb61IfOgxmWloOA8zYdSc=;
        b=yZZxa6Pf++ywnqpJGCzrYQ7VCiQ0Zyb3ruGuJ+qcgvcu9a0D6ZC044Tah1BuxmdJYE
         plWTpGkCvKS31ci2U/i4oc6gfe1yzbV7ionoSc5fZFk2FDpT2qswxTaNUykXARx0Qa9R
         FJ+RqrZZSbkwTblNZABVweSnZsRrS7OSYgWVgGW7SCkfp7xdjrVabdnYB1mK97esD9Xq
         CjuAih1XRI44XzH8f150SHNhWFPPLJJsrYzq+CEWDwQRZR9l84YvZjeo8FlYco41C7Aa
         sWkzea6vOtPjINYPulldXQ2PrZxERwQtv0cQAvJbn/EthdJg9mc8c13Ka14P2EO4ycvg
         Ouhg==
X-Gm-Message-State: AOAM532eBhpkn9mYMQT93h9p1BOeX8IlVaLuqY0o1pccF5DZb11QhONe
        3az3elCitclWzhT24TDPLSLI7EBpFZ+V6Cif
X-Google-Smtp-Source: ABdhPJwHR9sNZxYXaGCKigm/l0SZUbKWRM44zmXJ4Y5xiGe48Qr+Xe62j1kJ/qk4naQMzzPJIpjVQw==
X-Received: by 2002:a50:fb03:0:b0:41d:8d3f:9427 with SMTP id d3-20020a50fb03000000b0041d8d3f9427mr5849088edq.263.1649783211989;
        Tue, 12 Apr 2022 10:06:51 -0700 (PDT)
Received: from [192.168.0.198] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id jt8-20020a170906ca0800b006df9b29eaf1sm13193117ejb.8.2022.04.12.10.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 10:06:51 -0700 (PDT)
Message-ID: <1c455b6e-0009-6f8b-15c8-2a352479c5f2@linaro.org>
Date:   Tue, 12 Apr 2022 19:06:50 +0200
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
References: <20220412131644.59195-1-tony@atomide.com>
 <20220412131644.59195-2-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220412131644.59195-2-tony@atomide.com>
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

On 12/04/2022 15:16, Tony Lindgren wrote:
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
> 
> The timer clocks can be managed by the parent interconnect target module
> with no clocks assigned for the timer node. And in some cases the SoC may
> need to configure additional clocks for the timer in addition to the
> functional clock.
> 
> The clock names are optional and not specific to the comptible property.
> For example, dra7 timers on l3 interconnect do not need clock-names,while
> the timers on dra7 l4 interconnect need them with both being compatible
> with ti,omap5430-timer.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
>  .../bindings/timer/ti,timer-dm.yaml           | 161 ++++++++++++++++++
>  .../devicetree/bindings/timer/ti,timer.txt    |  44 -----
>  3 files changed, 162 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt b/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
> --- a/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
> @@ -2,7 +2,7 @@
>  
>  Required properties:
>  - compatible: Shall contain "ti,omap-dmtimer-pwm".
> -- ti,timers: phandle to PWM capable OMAP timer. See timer/ti,timer.txt for info
> +- ti,timers: phandle to PWM capable OMAP timer. See timer/ti,timer-dm.yaml for info
>    about these timers.
>  - #pwm-cells: Should be 3. See pwm.yaml in this directory for a description of
>    the cells format.
> diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/ti,timer-dm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI dual-mode timer
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description: |
> +  The TI dual-mode timer is a general purpose timer with PWM capabilities.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am335x-timer
> +              - ti,am335x-timer-1ms
> +              - ti,dm814-timer
> +              - ti,dm816-timer
> +              - ti,omap2420-timer
> +              - ti,omap3430-timer
> +              - ti,omap4430-timer
> +              - ti,omap5430-timer
> +      - items:
> +          - const: ti,am4372-timer
> +          - const: ti,am335x-timer
> +      - items:
> +          - const: ti,am4372-timer-1ms
> +          - const: ti,am335x-timer-1ms
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
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
> +  - interrupts
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,omap3430-timer
> +              - ti,omap4430-timer
> +              - ti,omap5430-timer
> +    then:
> +      properties:
> +        reg:
> +          oneOf:
> +            - items:
> +                - description: IO address
> +            - items:
> +                - description: CPU to L4 ABE IO address
> +                - description: L3 to L4 ABE IO address
> +        clocks:
> +          oneOf:
> +            - items:
> +                - description: Functional clock
> +            - items:
> +                - description: Functional clock
> +                - description: System clock

I think this can be made simpler, without oneOf:

  clocks:
    items:
      - description: Functional clock
      - description: System clock
    minItems: 1


and similar for clock-names.

> +        clock-names:
> +          oneOf:
> +            - items:
> +                - const: fck
> +            - items:
> +                - const: fck
> +                - const: timer_sys_ck
> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - description: IO address
> +        clocks:
> +          items:
> +            - description: Functional clock
> +        clock-names:
> +          items:
> +            - const: fck

Hmmm, in your previous version I had impression that first clock is not
the same on every flavor. Now it looks the same, so clocks you could
simplify even more:
1. Define full list in main properties (not in allOf) with minItems:1
2. Use maxItems:1, for this "else:" case.

This could greatly reduce amount of code you need and keep the actual
definition of clocks in main properties (not in allOf; allOf are only to
constrain it).

Best regards,
Krzysztof
