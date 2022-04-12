Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCF24FDC24
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 13:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbiDLKOw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 06:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389711AbiDLJYE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 05:24:04 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F5E55BE4;
        Tue, 12 Apr 2022 01:38:32 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23C8cKLA033737;
        Tue, 12 Apr 2022 03:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1649752700;
        bh=3cgJHTrJ/Ay8fSICxpnkf6VlfCoouI0seJUsShk8vzY=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=vGzUt+CfcZXyZJx8fD05dxxMmq/WebFCWxPjOFr7S0g4am+EYh28sEVS1VhyLsGdA
         OP+YADI+dRsQ2p7qnx2zXt6d1R8nVAruSezMzQoUErr7LELRWyTqA2WTNdkj+rNcjE
         B3/jrds39yG7wqBVg25wVpxdJ6/AXD2yDWrjCdWQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23C8cK6n100120
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Apr 2022 03:38:20 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Apr 2022 03:38:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Apr 2022 03:38:20 -0500
Received: from [10.249.96.184] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23C8cHoJ027295;
        Tue, 12 Apr 2022 03:38:18 -0500
Message-ID: <173629f2-b37e-75ad-7601-4f24b8561f8a@ti.com>
Date:   Tue, 12 Apr 2022 11:38:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: timer: Update TI timer to yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220411111858.16814-1-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <20220411111858.16814-1-tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 11/04/2022 14:18, Tony Lindgren wrote:
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
>   .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
>   .../bindings/timer/ti,timer-dm.yaml           | 128 ++++++++++++++++++
>   .../devicetree/bindings/timer/ti,timer.txt    |  44 ------
>   3 files changed, 129 insertions(+), 45 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
>   delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt b/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
> --- a/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-omap-dmtimer.txt
> @@ -2,7 +2,7 @@
>   
>   Required properties:
>   - compatible: Shall contain "ti,omap-dmtimer-pwm".
> -- ti,timers: phandle to PWM capable OMAP timer. See timer/ti,timer.txt for info
> +- ti,timers: phandle to PWM capable OMAP timer. See timer/ti,timer-dm.yaml for info
>     about these timers.
>   - #pwm-cells: Should be 3. See pwm.yaml in this directory for a description of
>     the cells format.
> diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> @@ -0,0 +1,128 @@
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
> +    description: Timer IO register range

if i'm not mistaken - you need to provide description for every item unless it's obviously determined by "-names" properties

> +
> +  clocks:
> +    description:
> +      The functional clock for the timer. Some SoCs like omap24xx also have a
> +      separate interface clock, and some clocks may be only defined for the
> +      interconnect target module parent.

ditto


> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    description:
> +      Timer clock names like "fck", "timer_sys_ck".

and description here make no sense

> +    oneOf:
> +      - enum: [ ick, fck ]
> +      - items:
> +          - const: fck
> +          - enum: [ ick, timer_sys_ck ]
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
> +              - ti,dm814-timer
> +              - ti,dm816-timer
> +              - ti,omap2420-timer
> +              - ti,omap3430-timer
> +    then:
> +      properties:
> +        ti,hwmods:
> +          items:
> +            - pattern: "^timer([1-9]|1[0-2])$"
> +    else:
> +      properties:
> +        ti,hwmods: false
> +
> +examples:
> +  - |
> +    timer1: timer@0 {
> +      compatible = "ti,am335x-timer-1ms";
> +      reg = <0x0 0x400>;
> +      interrupts = <67>;
> +      ti,timer-alwon;
> +      clocks = <&timer1_fck>;
> +      clock-names = "fck";
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/timer/ti,timer.txt b/Documentation/devicetree/bindings/timer/ti,timer.txt
> deleted file mode 100644
> --- a/Documentation/devicetree/bindings/timer/ti,timer.txt
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -OMAP Timer bindings
> -
> -Required properties:
> -- compatible:		Should be set to one of the below. Please note that
> -			OMAP44xx devices have timer instances that are 100%
> -			register compatible with OMAP3xxx devices as well as
> -			newer timers that are not 100% register compatible.
> -			So for OMAP44xx devices timer instances may use
> -			different compatible strings.
> -
> -			ti,omap2420-timer (applicable to OMAP24xx devices)
> -			ti,omap3430-timer (applicable to OMAP3xxx/44xx devices)
> -			ti,omap4430-timer (applicable to OMAP44xx devices)
> -			ti,omap5430-timer (applicable to OMAP543x devices)
> -			ti,am335x-timer	(applicable to AM335x devices)
> -			ti,am335x-timer-1ms (applicable to AM335x devices)
> -
> -- reg:			Contains timer register address range (base address and
> -			length).
> -- interrupts: 		Contains the interrupt information for the timer. The
> -			format is being dependent on which interrupt controller
> -			the OMAP device uses.
> -- ti,hwmods:		Name of the hwmod associated to the timer, "timer<X>",
> -			where <X> is the instance number of the timer from the
> -			HW spec.
> -
> -Optional properties:
> -- ti,timer-alwon:	Indicates the timer is in an alway-on power domain.
> -- ti,timer-dsp:		Indicates the timer can interrupt the on-chip DSP in
> -			addition to the ARM CPU.
> -- ti,timer-pwm: 	Indicates the timer can generate a PWM output.
> -- ti,timer-secure: 	Indicates the timer is reserved on a secure OMAP device
> -			and therefore cannot be used by the kernel.
> -
> -Example:
> -
> -timer12: timer@48304000 {
> -	compatible = "ti,omap3430-timer";
> -	reg = <0x48304000 0x400>;
> -	interrupts = <95>;
> -	ti,hwmods = "timer12"
> -	ti,timer-alwon;
> -	ti,timer-secure;
> -};

-- 
Best regards,
Grygorii, Ukraine
