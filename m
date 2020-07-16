Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430CA221FA6
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jul 2020 11:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgGPJ0D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jul 2020 05:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgGPJ0C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jul 2020 05:26:02 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B91BC08C5C0
        for <linux-omap@vger.kernel.org>; Thu, 16 Jul 2020 02:26:01 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id k18so4314684qtm.10
        for <linux-omap@vger.kernel.org>; Thu, 16 Jul 2020 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oZgJatqnmCksA5XOZI2wml9ctaRhyij9S6QhCqQOdQ0=;
        b=jdaFxBQB42rrH2WNPSR+xGK2Vj+uZXV4E8XIyxZE7NzEgRQEz6pfwuylmQ3FZQYN3K
         chN9q01ki6MQS9Ew4B9w9lQ1s5RGYd2VdUM8gjhB50U2rBWjUBkGjnCKO2+/lT1k1BNY
         oFaCJGZNiE93a/5SRumpyQxjh0Nw4l5sw1ITNlXP/6FDytrROn+Uv0b6Ag8iKYsDplyt
         tgYm+zBq3BGGlbqz4kjuYlwrB0uvGLLHZBN0fFa/OEdnOnD6oQ90XZQGXh5zncDr9DWj
         xssnUdU2GlSciJUZhyrp8vbpYJcKWkpJGonFDDh6Vm61ZWpPwpqOHvMFWo+glY5Wo0c+
         BVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oZgJatqnmCksA5XOZI2wml9ctaRhyij9S6QhCqQOdQ0=;
        b=sWv6oN9oaTL5xgEnucqj/Lj6oAkKJrSROoaVIHBL9t9ZYwyT4uRSAPleGxarxrH6N3
         KlGju5U17VXPFixR7dtGzL7K0T208IJ2usoxWJkLV6wk1lr2Sxh4Bj184AdcpbG+wx/b
         7NaFwAihYb++vQoZMe/W4RecTxYA8WjXjDKjkhCDTyixxtVu26ceZwSB1UBxhXB5DMNp
         lmOz5w3pabtIpa7BFB9Ty5UY+hCSqc+CmvgtBdQI3Oslyh47n/XOkoWn3Nt/i1Lxklbt
         Qj1nK5Y39GyGeg5ov8MqltSAfaKS5tCyvuM2x0fp4Y9g9lUkwfMK5DLSIAkFl+iCe8ck
         pHLg==
X-Gm-Message-State: AOAM530/9FP8Bw6U62MVAY1xpK31erZdMlBWEhZlKhRoxzgFxS+FyyI4
        MimR5DgJZn2mTo/WrI1BCpOcI8fR7r8Fh5Sp4EkHmg==
X-Google-Smtp-Source: ABdhPJxX9zpFHt41pKxK6FcW8o05ZoDTzb+MJBq3REeRO9+D71zDpXwxuBvyU9FGFLgZeTS4MZHrE5si5O0eTNCmlGw=
X-Received: by 2002:ac8:66d1:: with SMTP id m17mr4141174qtp.88.1594891560020;
 Thu, 16 Jul 2020 02:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-2-git-send-email-grzegorz.jaszczyk@linaro.org> <20200713212534.GA742734@bogus>
In-Reply-To: <20200713212534.GA742734@bogus>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Thu, 16 Jul 2020 11:25:48 +0200
Message-ID: <CAMxfBF46X99H+oRXD-dtUkn0YhRi7f7AdbzCO0GZRds6F0wK9g@mail.gmail.com>
Subject: Re: [PATCHv3 1/6] dt-bindings: irqchip: Add PRU-ICSS interrupt
 controller bindings
To:     Rob Herring <robh@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>, "Anna, Suman" <s-anna@ti.com>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 13 Jul 2020 at 23:25, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jul 02, 2020 at 04:17:54PM +0200, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The Programmable Real-Time Unit and Industrial Communication Subsystem
> > (PRU-ICSS or simply PRUSS) contains an interrupt controller (INTC) that
> > can handle various system input events and post interrupts back to the
> > device-level initiators. The INTC can support upto 64 input events on
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
> > Reviewed-by: Lee Jones <lee.jones@linaro.org>
> > ---
> > v2->v3:
> > - Convert dt-binding to YAML
> > v1->v2:
> > - https://patchwork.kernel.org/patch/11069767/
> > ---
> >  .../interrupt-controller/ti,pruss-intc.yaml        | 135 +++++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> > new file mode 100644
> > index 0000000..7fe4b95
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> > @@ -0,0 +1,135 @@
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
> > +  The properties "ti,irqs-reserved" and "ti,irqs-shared" are used for denoting
> > +  the connection differences on the output interrupts 2 through 9. If neither
> > +  of these properties are defined, it implies that all the PRUSS INTC output
> > +  interrupts 2 through 9 (host_intr0 through host_intr7) are connected
> > +  exclusively to the Arm interrupt controller.
> > +
> > +  The K3 family of SoCs can handle 160 input events that can be mapped to 20
> > +  different possible output interrupts. The additional output interrupts (10
> > +  through 19) are connected to new sub-modules within the ICSSG instances.
> > +
> > +  This interrupt-controller node should be defined as a child node of the
> > +  corresponding PRUSS node. The node should be named "interrupt-controller".
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +  - $ref: /schemas/interrupts.yaml#
>
> Drop these. They already get applied.

Ok.

>
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
>
> I guess you can look at the parent if there's differences in features
> and bugs.

Currently we are using of_device_id data in the driver to store the
number of system events and number of host interrupts which are
different for pruss-intc and icssg-intc. I prefer to keep it for
clarity if you don't mind.

>
> > +      Use "ti,icssg-intc" for K3 AM65x & J721E family of SoCs
> > +
> > +  reg:
> > +    items:
> > +      - description: base address and size for the PRUSS INTC sub-module
>
> Just: maxItems: 1
>
> Don't need genericish descriptions.

Ok.

>
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 8
> > +    description: |
> > +      all the interrupts generated towards the main host processor in the SoC.
>
> > +      The format depends on the interrupt specifier for the particular SoC's
> > +      Arm parent interrupt controller. A shared interrupt can be skipped if
>
> That's true for all 'interrupts' properties, so not needed here.

Ok.

>
> > +      the desired destination and usage is by a different processor/device.
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    maxItems: 8
> > +    items:
> > +      pattern: host_intr[0-7]
>
> 'intr' is redundant.

Those names are also used in TRM so I prefer to keep it as is. IMO it
will be less confusing.

>
> So we could have?:  host0, host3, host4

Currently most of the SoCs have 8 valid host interrupts wired to the
main CPU. But there are some exceptions e.g. in AM437x the host_intr5
is not wired to the main CPU. Additionally e.g. AM335x has host
interrupt 0 shared between MPU and TSC_ADC and host interrupts 6 & 7
shared between MPU and  a DMA controller. Therefore valid example are
e.g.:
1) host_intr[0-4], host_intr[6-7] (without host_intr5)
2) host_intr[1-5] (without host_intr0 and hostr_intr[6-7].

>
> > +    description: |
> > +      should use one of the above names for each valid host event interrupt
> > +      connected to Arm interrupt controller, the name should match the
> > +      corresponding host event interrupt number
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 1
> > +    description: |
> > +      Client users shall use the PRU System event number (the interrupt source
> > +      that the client is interested in) as the value of the interrupts property
> > +      in their node
> > +
> > +  ti,irqs-reserved:
> > +    $ref: /schemas/types.yaml#definitions/uint8-array
> > +    description: |
> > +      an array of 8-bit elements of host interrupts between 0 and 7
> > +      (corresponding to PRUSS INTC output interrupts 2 through 9) that are
> > +      not connected to the Arm interrupt controller.
> > +        Eg: AM437x and 66AK2G SoCs do not have "host_intr5" interrupt connected
> > +            to MPU
>
> Seems redundant with interrupt-names.

It can be seen as redundant but it describes the hardware more
precisely and emphasizes that some irqs are not available for the main
CPU in some SoC's, even if they are mentioned in several places in
TRM. If you don't mind I will prefer to keep it as is.

>
> > +
> > +  ti,irqs-shared:
> > +    $ref: /schemas/types.yaml#definitions/uint8-array
> > +    description: |
> > +      an array of 8-bit elements of host interrupts between 0 and 7
> > +      (corresponding to PRUSS INTC output interrupts 2 through 9) that are
> > +      also connected to other devices or processors in the SoC.
> > +         Eg: AM65x and J721E SoCs have "host_intr5", "host_intr6" and
> > +             "host_intr7" interrupts connected to MPU, and other ICSSG
> > +             instances
>
> Wouldn't a bit mask work for both of these?

Yes - I will convert it as you suggested.

Thank you for your review.
Grzegorz
