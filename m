Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3973AD26A
	for <lists+linux-omap@lfdr.de>; Fri, 18 Jun 2021 20:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbhFRS6L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Jun 2021 14:58:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:57414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231689AbhFRS6K (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Jun 2021 14:58:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECD70613EB;
        Fri, 18 Jun 2021 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624042561;
        bh=st9b12JBENqiX+a8te7tLLnIXjIRfZAzKGsk5TdJ8rY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OK2sUuTpphRQmphw5VkJtDhXJi3NHwx6K81SyieMCDDBr29W/pPkwJHZjVRP3aqYI
         qQ5XQxOCh8iooJSOTfsXStpAJ7GhstR/V7/D70JKxsy+CmSLn2uhX8BJsqwShKbHmd
         oxIzriIzHA5858ljqfaBuwxdTDAwbMi17gyn1f53NzkiaI5UZ8+KL6lvafCwzT2jQc
         IKdr7VFzhuL8F+Scvik900p2W2b/XtEkjnMJsA2FpbmWYhjqILkR52xwk/ncb6Nk7h
         jJQvjs7OY6D0rERRbqxyxfRMKxgAgV79+n3oxXXF1POMVmXZh/38QBbYwdchNBAkBl
         oP551iDe5tw9w==
Received: by mail-ed1-f50.google.com with SMTP id n20so9940971edv.8;
        Fri, 18 Jun 2021 11:56:00 -0700 (PDT)
X-Gm-Message-State: AOAM531Rj+LtVjErwQJdtkHp54IIwKksaYB4ema8BzrSeFW/m2a7/tr/
        00t6rtWG5WYHgOt8Sgerm26JxqdX52bK9K2jyg==
X-Google-Smtp-Source: ABdhPJzJhJxPv0paE3gyxs+QdMRMKXMVSjp8AvuY/6uOx5ZySev/db+4nTeO8uz6kRV3cMj6klMM+lpdfE7UBFVe520=
X-Received: by 2002:a05:6402:cb0:: with SMTP id cn16mr6944016edb.165.1624042559515;
 Fri, 18 Jun 2021 11:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210610182227.2480-1-vigneshr@ti.com> <CAL_JsqLjqtUapkr6ARyaeTduhSghJL-q7hBWGFPm7ubbvqCmJw@mail.gmail.com>
 <5ef04ae5-e07e-5162-7dad-ace3e2fdeb0d@ti.com>
In-Reply-To: <5ef04ae5-e07e-5162-7dad-ace3e2fdeb0d@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 18 Jun 2021 12:55:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKiKCZn_bHceuH7o8=4_Yj-hhNGQs876_x7ETKvCjbALQ@mail.gmail.com>
Message-ID: <CAL_JsqKiKCZn_bHceuH7o8=4_Yj-hhNGQs876_x7ETKvCjbALQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: serial: Move omap-serial.txt to YAML schema
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 18, 2021 at 9:22 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
>
>
> On 6/18/21 8:28 PM, Rob Herring wrote:
> > On Thu, Jun 10, 2021 at 12:22 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> >>
> >> Convert serial-omap.txt to YAML schema for better checks and documentation.
> >>
> >> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> >> ---
> >>
> >> v2:
> >> *Drop reg-io-width and reg-shift as they are constant and documented in
> >>  txt bindings (also not used by driver).
> >> *Drop unused label in example.
> >> *Rename file to 8250_omap.yaml to be more generic as IP is present in
> >> varies families of TI SoCs.
> >> *Add description for interrupt entries
> >>
> >>  .../devicetree/bindings/serial/8250_omap.yaml | 118 ++++++++++++++++++
> >>  .../bindings/serial/omap_serial.txt           |  40 ------
> >>  2 files changed, 118 insertions(+), 40 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/serial/8250_omap.yaml
> >>  delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
> >> new file mode 100644
> >> index 000000000000..1c826fcf5828
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
> >> @@ -0,0 +1,118 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Bindings for 8250 compliant UARTs on TI's OMAP2+ and K3 SoCs
> >> +
> >> +maintainers:
> >> +  - Vignesh Raghavendra <vigneshr@ti.com>
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/serial/serial.yaml#
> >> +  - $ref: /schemas/serial/rs485.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - enum:
> >> +          - ti,am3352-uart
> >> +          - ti,am4372-uart
> >> +          - ti,am654-uart
> >> +          - ti,dra742-uart
> >> +          - ti,omap2-uart
> >> +          - ti,omap3-uart
> >> +          - ti,omap4-uart
> >> +      - items:
> >> +          - enum:
> >> +              - ti,am64-uart
> >> +              - ti,j721e-uart
> >> +          - const: ti,am654-uart
> >> +
> >> +  ti,hwmods:
> >> +    description:
> >> +      Must be "uart<n>", n being the instance number (1-based)
> >> +      This property is applicable only on legacy platforms mainly omap2/3
> >> +      and ti81xx and should not be used on other platforms.
> >> +    $ref: /schemas/types.yaml#/definitions/string
> >> +    deprecated: true
> >> +
> >> +  dmas:
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  dma-names:
> >> +    items:
> >> +      - const: tx
> >> +      - const: rx
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +    description:
> >> +      First entry is module IRQ required for normal IO operation.
> >> +      Second entry is optional and corresponds to system wakeup IRQ
> >> +      where supported.
> >
> > interrupts:
> >   minItems: 1
> >   items:
> >     - description: module IRQ required for normal IO operation
> >     - description: system wakeup IRQ
> >
>
> OK, will send a follow up fix as the patch is already queued.
>
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    const: fclk
> >> +
> >> +  rts-gpios: true
> >> +  cts-gpios: true
> >> +  dtr-gpios: true
> >> +  dsr-gpios: true
> >> +  rng-gpios: true
> >> +  dcd-gpios: true
> >> +  rs485-rts-delay: true
> >> +  rs485-rts-active-low: true
> >> +  rs485-rx-during-tx: true
> >> +  rs485-rts-active-high: true
> >> +  linux,rs485-enabled-at-boot-time: true
> >> +  rts-gpio: true
> >> +  power-domains: true
> >> +  clock-frequency: true
> >> +  current-speed: true
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +
> >> +additionalProperties: false
> >
> > Do you want to support serial attached devices? If so, you need:
> >
> > unevaluatedProperties: false
> >
>
> Yes, support for serial client devices is desired, but I see that with
> "unevaluatedProperties: false" there are no warnings if DT has a
> property not documented in the schema? Did I miss something?

Support for unevaluatedProperties is not yet implemented in the
underlying jsonschema package. So we get the default behavior for
unknown keywords which is a nop.

Rob
