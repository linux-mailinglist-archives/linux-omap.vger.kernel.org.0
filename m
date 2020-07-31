Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BE62344D8
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jul 2020 13:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732915AbgGaLtK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 Jul 2020 07:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732512AbgGaLtK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 Jul 2020 07:49:10 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92060C061574
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 04:49:09 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id u64so28392681qka.12
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CuIdXtx7e4fSbuE9HECHWehSLQrsOJCaWGB4UimYksg=;
        b=S9tVUhcginRwxwIhissv2rBirmltdED+fTpfgJdsNqJu2RpOmwEQDPcCqI7R2qK4pC
         +G6yqiOL3j7VTv5zMTNfKgIHJfFokUkVO1NBHTFJWcHaid7pQoRNEYd3RRdILHbnMtHd
         PSJfTrJFts1UlYUq8FYg1y12w8r65kCFEjNEBsRQV9DB37thWBBvohyRVE/udmKM2hm+
         h6LdRetoz6ttxjvXmNNW9hqDrkJr58bMW0qiBIZ0/1IDyZq5Kc4wZvwmvXNMk5KHFQf7
         jJu1qvEDGMZca00ZW4211JHmyEd2Ac9Ei4yyBp9/njjOqVVc+6p/KJjCg9QpS4FV5LGY
         yoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CuIdXtx7e4fSbuE9HECHWehSLQrsOJCaWGB4UimYksg=;
        b=rlGJ8rYKIZQH+yOeJCH393a4g47H1n4OUkC+ViBBdkrJAs5ni0m/afnnbBrOgtMx+/
         /FpmpRRlDzcMVdbR185q8MbxK9OY//CohewlMnsalAvHzU9DjkXPGltKtArmGzPvsfvr
         54ltxYKO3b5MHrqWiu7Fb2z7fLRqhHP10v6qOVb+0enDBS0HnnWV483bVr02umrIjjBV
         HRV3qqjU63T6PVxGUxW+w8ibQiwAPkf2rPjk2rDxcuK8EwMtmjgyC0w61abUG8TSjt9A
         NdA9VwuXhlrMcf7Nh98AgjAQusVKRDrsbXEELbp6ZrqjjzAp0pMfwa3JPJk7GP5fpiUA
         D2dQ==
X-Gm-Message-State: AOAM532xJnf4x9FnLEi56DwKMovu3/C6kggdYcWfrTtBvgZFSQF2jxQo
        2UoTiG1qMnGDGEhssOqTsmhKjCHq7i4WNL9qAPb5rw==
X-Google-Smtp-Source: ABdhPJy9/mMR5IcmFhxbx/A5+0iaoAxZBte9RhBfKoLXf1fenYSpel3e7j0DX4VV2qI5BhbTus0aDReIRiRo33d5KEQ=
X-Received: by 2002:a37:6193:: with SMTP id v141mr3614765qkb.94.1596196148619;
 Fri, 31 Jul 2020 04:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-2-git-send-email-grzegorz.jaszczyk@linaro.org> <01bac597-c1a0-1851-b630-a79929777a16@lechnology.com>
In-Reply-To: <01bac597-c1a0-1851-b630-a79929777a16@lechnology.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 31 Jul 2020 13:48:57 +0200
Message-ID: <CAMxfBF6Ru1Fm1oWDyrSM=kBdCUe+eUDChqDgoYo4ziVr-8c50Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: irqchip: Add PRU-ICSS interrupt
 controller bindings
To:     David Lechner <david@lechnology.com>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>, "Anna, Suman" <s-anna@ti.com>,
        robh+dt@kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Mills, William" <wmills@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 29 Jul 2020 at 19:34, David Lechner <david@lechnology.com> wrote:
>
> On 7/28/20 4:18 AM, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The Programmable Real-Time Unit and Industrial Communication Subsystem
> > (PRU-ICSS or simply PRUSS) contains an interrupt controller (INTC) that
> > can handle various system input events and post interrupts back to the
> > device-level initiators. The INTC can support upto 64 input events on
>
> nit: "up to" is two separate words

Ok.

>
> > most SoCs with individual control configuration and h/w prioritization.
> > These events are mapped onto 10 output interrupt lines through two levels
> > of many-to-one mapping support. Different interrupt lines are routed to
> > the individual PRU cores or to the host CPU or to other PRUSS instances.
> >
> > The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
> > commonly called ICSSG. The ICSSG interrupt controller on K3 SoCs provide
> > a higher number of host interrupts (20 vs 10) and can handle an increased
> > number of input events (160 vs 64) from various SoC interrupt sources.
> >
> > Add the bindings document for these interrupt controllers on all the
> > applicable SoCs. It covers the OMAP architecture SoCs - AM33xx, AM437x
> > and AM57xx; the Keystone 2 architecture based 66AK2G SoC; the Davinci
> > architecture based OMAPL138 SoCs, and the K3 architecture based AM65x
> > and J721E SoCs.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Andrew F. Davis <afd@ti.com>
> > Signed-off-by: Roger Quadros <rogerq@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> > v3->v4:
> > - Drop allOf references to interrupt-controller.yaml and
> >    interrupts.yaml.
> > - Drop items descriptions and use only maxItems: 1 as suggested by Rob.
> > - Convert irqs-reserved property from uint8-array to bitmask.
> > - Minor descriptions updates.
> > - Change interrupt-cells to 3 in order to provide 2-level mapping
> >    description for interrupts routed to the main CPU (as Marc requested).
> > - Merge the irqs-reserved and irqs-shared to one property since they
> >    can be handled by one logic.
> > - Drop reviewed-by due to introduced changes.
> > - Add another example illustrating irqs-reserved property usage.
> > v2->v3:
> > - Convert dt-binding to YAML
> > v1->v2:
> > - https://patchwork.kernel.org/patch/11069767/
> > ---
> >   .../interrupt-controller/ti,pruss-intc.yaml        | 157 +++++++++++++++++++++
> >   1 file changed, 157 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> > new file mode 100644
> > index 0000000..7336b11
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> > @@ -0,0 +1,157 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/ti,pruss-intc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI PRU-ICSS Local Interrupt Controller
> > +
> > +maintainers:
> > +  - Suman Anna <s-anna@ti.com>
> > +
> > +description: |
> > +  Each PRU-ICSS has a single interrupt controller instance that is common
> > +  to all the PRU cores. Most interrupt controllers can route 64 input events
> > +  which are then mapped to 10 possible output interrupts through two levels
> > +  of mapping. The input events can be triggered by either the PRUs and/or
> > +  various other PRUSS internal and external peripherals. The first 2 output
> > +  interrupts (0, 1) are fed exclusively to the internal PRU cores, with the
> > +  remaining 8 (2 through 9) connected to external interrupt controllers
> > +  including the MPU and/or other PRUSS instances, DSPs or devices.
> > +
> > +  The property "ti,irqs-reserved" is used for denoting the connection
> > +  differences on the output interrupts 2 through 9. If this property is not
> > +  defined, it implies that all the PRUSS INTC output interrupts 2 through 9
> > +  (host_intr0 through host_intr7) are connected exclusively to the Arm interrupt
> > +  controller.
> > +
> > +  The K3 family of SoCs can handle 160 input events that can be mapped to 20
> > +  different possible output interrupts. The additional output interrupts (10
> > +  through 19) are connected to new sub-modules within the ICSSG instances.
> > +
> > +  This interrupt-controller node should be defined as a child node of the
> > +  corresponding PRUSS node. The node should be named "interrupt-controller".
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,pruss-intc
> > +      - ti,icssg-intc
> > +    description: |
> > +      Use "ti,pruss-intc" for OMAP-L13x/AM18x/DA850 SoCs,
> > +                              AM335x family of SoCs,
> > +                              AM437x family of SoCs,
> > +                              AM57xx family of SoCs
> > +                              66AK2G family of SoCs
> > +      Use "ti,icssg-intc" for K3 AM65x & J721E family of SoCs
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 8
> > +    description: |
> > +      All the interrupts generated towards the main host processor in the SoC.
> > +      A shared interrupt can be skipped if the desired destination and usage is
> > +      by a different processor/device.
>
> This sounds like using device tree for configuration. Also, isn't this what the
> ti,irqs-reserved property is for?

Yes this is what ti,irqs-reserved is also used for. The intention was
to keep both in sync, so it would be less confusing: if some
interrupts are on irqs-reserved list, they shouldn't be present here.
In terms of shared interrupt usage I will not call it configuration
via device-tree, rather design description (for single device tree
description given shared interrupt is used or as MCPU one or as
different processor/device one).

>
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    maxItems: 8
> > +    items:
> > +      pattern: host_intr[0-7]
> > +    description: |
> > +      Should use one of the above names for each valid host event interrupt
> > +      connected to Arm interrupt controller, the name should match the
> > +      corresponding host event interrupt number.
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 3
> > +    description: |
> > +      Client users shall use the PRU System event number (the interrupt source
> > +      that the client is interested in), PRU channel and PRU host_intr (target)
> > +      as the value of the interrupts property in their node.  The system events
> > +      can be mapped to some output host interrupts through 2 levels of
> > +      many-to-one mapping i.e. events to channel mapping and channels to host
> > +      interrupts so through this property entire mapping is provided.
>
> It is not clear what the meaning of each cell is. Looking at later patches, it
> looks like the first cell is the PRU system event number, the second cell is the
> channel and the third cell is the host event number.

Ok, how about updating above description like this:
Client users shall use the PRU System event number (the interrupt source
that the client is interested in) [cell 1], PRU channel [cell 2] and PRU
host_intr (target) [cell 3] as the value of the interrupts property in their
node.  The system events can be mapped to some output host interrupts through 2
levels of many-to-one mapping i.e. events to channel mapping and channels to
host interrupts so through this property entire mapping is provided.

>
> > +
> > +  ti,irqs-reserved:
> > +    $ref: /schemas/types.yaml#definitions/uint8
>
> Is 8 bits enough for any possible future devices? It is written above that there are
> already up to 20 host events on some devices even if only 8 are connected to the MCU.

We've already discussed this with Suman: it is unlikely that HW with
more than 8 host interrupts connected to the MCU will arrive.

>
> > +    description: |
> > +      Bitmask of host interrupts between 0 and 7 (corresponding to PRUSS INTC
> > +      output interrupts 2 through 9) that are not connected to the Arm interrupt
> > +      controller or are shared and used by other devices or processors in the
> > +      SoC. Define this property when any of 8 interrupts should not be handled
> > +      by Arm interrupt controller.
> > +        Eg: - AM437x and 66AK2G SoCs do not have "host_intr5" interrupt
> > +              connected to MPU
> > +            - AM65x and J721E SoCs have "host_intr5", "host_intr6" and
> > +              "host_intr7" interrupts connected to MPU, and other ICSSG
> > +              instances.
> > +
> > +required:
> > + - compatible
> > + - reg
> > + - interrupts
> > + - interrupt-names
> > + - interrupt-controller
> > + - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* AM33xx PRU-ICSS */
> > +    pruss: pruss@0 {
> > +        compatible = "ti,am3356-pruss";
> > +        reg = <0x0 0x80000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        pruss_intc: interrupt-controller@20000 {
> > +            compatible = "ti,pruss-intc";
> > +            reg = <0x20000 0x2000>;
> > +            interrupts = <20 21 22 23 24 25 26 27>;
> > +            interrupt-names = "host_intr0", "host_intr1",
> > +                              "host_intr2", "host_intr3",
> > +                              "host_intr4", "host_intr5",
> > +                              "host_intr6", "host_intr7";
> > +            interrupt-controller;
> > +            #interrupt-cells = <3>;
> > +        };
> > +    };
> > +
> > +  - |
> > +
> > +    /* AM4376 PRU-ICSS */
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    pruss@0 {
> > +        compatible = "ti,am4376-pruss";
> > +        reg = <0x0 0x40000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        interrupt-controller@20000 {
> > +            compatible = "ti,pruss-intc";
> > +            reg = <0x20000 0x2000>;
> > +            interrupt-controller;
> > +            #interrupt-cells = <3>;
> > +            interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "host_intr0", "host_intr1",
> > +                              "host_intr2", "host_intr3",
> > +                              "host_intr4",
> > +                              "host_intr6", "host_intr7";
> > +            ti,irqs-reserved = /bits/ 8 <0x20>; /* BIT(5) */
>
> Is 0b00100000 valid syntax in device tree (instead of 0x20 + comment)?

Actually I think more readable will be to define and use BIT()
directly. Similar to what is done for one of the omap dtsi:
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/omap3-gta04.dtsi#L648

Thank you for your review,
Grzegorz
