Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B16921E200
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jul 2020 23:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgGMVZi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 17:25:38 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:36382 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgGMVZi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jul 2020 17:25:38 -0400
Received: by mail-il1-f194.google.com with SMTP id x9so12512315ila.3;
        Mon, 13 Jul 2020 14:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JdxrLdb/bfPpukrSLDDWbbGDsKt7BSus2zGlZfiUnCY=;
        b=l8Xo/0m8C/9V3vShHaioqp4QTpaXLhC1ntEF8am1MtPuqDj+cmzeyyXAstuFLGokCg
         ySDvjBgjuqpCUL9T9Ij9W7rl/N07n5hf+VGTu2ddyPIwjBe7yXtLM1f/IaQ2cJVdM2B0
         fi+M4mYBGyp/uwL1XPELupVdFushA/piBFl2bCt4g5cvHUe8buPnQM+T6l587fUEyWWe
         4tJBtU00gSSdZAf6gm63Mw39VxNGYHbtE83f4MeMyKIL9sII+I3vQGRWNzKZYr/+N3KW
         QuHPmUl4iiUDkGWzWz5PUoFj/sTclro8zQ4BxEK4rFJHC7H+VRoLh903TOgvjz1IPNGC
         My1A==
X-Gm-Message-State: AOAM532Mzwj9LpfxwjG+ObV2rOJlOQXSs15ci5l4ZqTpg+Lv9IV3N4OV
        sLzcOnV1npI02+ZrkxHclA==
X-Google-Smtp-Source: ABdhPJwGwA/FpZzclo0dd/Xaj7ScU++LeKyQkLIvPOV+Izp2lguNICWiMRbSUKcZdG3OzKyyaJ/vFw==
X-Received: by 2002:a92:2010:: with SMTP id j16mr1779037ile.200.1594675536584;
        Mon, 13 Jul 2020 14:25:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t74sm9250516ild.6.2020.07.13.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 14:25:35 -0700 (PDT)
Received: (nullmailer pid 755568 invoked by uid 1000);
        Mon, 13 Jul 2020 21:25:34 -0000
Date:   Mon, 13 Jul 2020 15:25:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com, lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCHv3 1/6] dt-bindings: irqchip: Add PRU-ICSS interrupt
 controller bindings
Message-ID: <20200713212534.GA742734@bogus>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-2-git-send-email-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593699479-1445-2-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 02, 2020 at 04:17:54PM +0200, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The Programmable Real-Time Unit and Industrial Communication Subsystem
> (PRU-ICSS or simply PRUSS) contains an interrupt controller (INTC) that
> can handle various system input events and post interrupts back to the
> device-level initiators. The INTC can support upto 64 input events on
> most SoCs with individual control configuration and h/w prioritization.
> These events are mapped onto 10 output interrupt lines through two levels
> of many-to-one mapping support. Different interrupt lines are routed to
> the individual PRU cores or to the host CPU or to other PRUSS instances.
> 
> The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
> commonly called ICSSG. The ICSSG interrupt controller on K3 SoCs provide
> a higher number of host interrupts (20 vs 10) and can handle an increased
> number of input events (160 vs 64) from various SoC interrupt sources.
> 
> Add the bindings document for these interrupt controllers on all the
> applicable SoCs. It covers the OMAP architecture SoCs - AM33xx, AM437x
> and AM57xx; the Keystone 2 architecture based 66AK2G SoC; the Davinci
> architecture based OMAPL138 SoCs, and the K3 architecture based AM65x
> and J721E SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Reviewed-by: Lee Jones <lee.jones@linaro.org>
> ---
> v2->v3:
> - Convert dt-binding to YAML
> v1->v2:
> - https://patchwork.kernel.org/patch/11069767/
> ---
>  .../interrupt-controller/ti,pruss-intc.yaml        | 135 +++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> new file mode 100644
> index 0000000..7fe4b95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/ti,pruss-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI PRU-ICSS Local Interrupt Controller
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +
> +description: |
> +  Each PRU-ICSS has a single interrupt controller instance that is common
> +  to all the PRU cores. Most interrupt controllers can route 64 input events
> +  which are then mapped to 10 possible output interrupts through two levels
> +  of mapping. The input events can be triggered by either the PRUs and/or
> +  various other PRUSS internal and external peripherals. The first 2 output
> +  interrupts (0, 1) are fed exclusively to the internal PRU cores, with the
> +  remaining 8 (2 through 9) connected to external interrupt controllers
> +  including the MPU and/or other PRUSS instances, DSPs or devices.
> +
> +  The properties "ti,irqs-reserved" and "ti,irqs-shared" are used for denoting
> +  the connection differences on the output interrupts 2 through 9. If neither
> +  of these properties are defined, it implies that all the PRUSS INTC output
> +  interrupts 2 through 9 (host_intr0 through host_intr7) are connected
> +  exclusively to the Arm interrupt controller.
> +
> +  The K3 family of SoCs can handle 160 input events that can be mapped to 20
> +  different possible output interrupts. The additional output interrupts (10
> +  through 19) are connected to new sub-modules within the ICSSG instances.
> +
> +  This interrupt-controller node should be defined as a child node of the
> +  corresponding PRUSS node. The node should be named "interrupt-controller".
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +  - $ref: /schemas/interrupts.yaml#

Drop these. They already get applied.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,pruss-intc
> +      - ti,icssg-intc
> +    description: |
> +      Use "ti,pruss-intc" for OMAP-L13x/AM18x/DA850 SoCs,
> +                              AM335x family of SoCs,
> +                              AM437x family of SoCs,
> +                              AM57xx family of SoCs
> +                              66AK2G family of SoCs

I guess you can look at the parent if there's differences in features 
and bugs.

> +      Use "ti,icssg-intc" for K3 AM65x & J721E family of SoCs
> +
> +  reg:
> +    items:
> +      - description: base address and size for the PRUSS INTC sub-module

Just: maxItems: 1

Don't need genericish descriptions.

> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 8
> +    description: |
> +      all the interrupts generated towards the main host processor in the SoC.

> +      The format depends on the interrupt specifier for the particular SoC's
> +      Arm parent interrupt controller. A shared interrupt can be skipped if

That's true for all 'interrupts' properties, so not needed here.

> +      the desired destination and usage is by a different processor/device.
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      pattern: host_intr[0-7]

'intr' is redundant.

So we could have?:  host0, host3, host4

> +    description: |
> +      should use one of the above names for each valid host event interrupt
> +      connected to Arm interrupt controller, the name should match the
> +      corresponding host event interrupt number
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +    description: |
> +      Client users shall use the PRU System event number (the interrupt source
> +      that the client is interested in) as the value of the interrupts property
> +      in their node
> +
> +  ti,irqs-reserved:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description: |
> +      an array of 8-bit elements of host interrupts between 0 and 7
> +      (corresponding to PRUSS INTC output interrupts 2 through 9) that are
> +      not connected to the Arm interrupt controller.
> +        Eg: AM437x and 66AK2G SoCs do not have "host_intr5" interrupt connected
> +            to MPU

Seems redundant with interrupt-names.

> +
> +  ti,irqs-shared:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description: |
> +      an array of 8-bit elements of host interrupts between 0 and 7
> +      (corresponding to PRUSS INTC output interrupts 2 through 9) that are
> +      also connected to other devices or processors in the SoC.
> +         Eg: AM65x and J721E SoCs have "host_intr5", "host_intr6" and
> +             "host_intr7" interrupts connected to MPU, and other ICSSG
> +             instances

Wouldn't a bit mask work for both of these?

> +
> +required:
> + - compatible
> + - reg
> + - interrupts
> + - interrupt-names
> + - interrupt-controller
> + - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* AM33xx PRU-ICSS */
> +    pruss: pruss@0 {
> +        compatible = "ti,am3356-pruss";
> +        reg = <0x0 0x80000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        pruss_intc: interrupt-controller@20000 {
> +            compatible = "ti,pruss-intc";
> +            reg = <0x20000 0x2000>;
> +            interrupts = <20 21 22 23 24 25 26 27>;
> +            interrupt-names = "host_intr0", "host_intr1",
> +                              "host_intr2", "host_intr3",
> +                              "host_intr4", "host_intr5",
> +                              "host_intr6", "host_intr7";
> +            interrupt-controller;
> +            #interrupt-cells = <1>;
> +            ti,irqs-shared = /bits/ 8 <0 6 7>;
> +        };
> +    };
> -- 
> 2.7.4
> 
