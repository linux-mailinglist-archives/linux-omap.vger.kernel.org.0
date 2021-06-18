Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91BF3ACE2B
	for <lists+linux-omap@lfdr.de>; Fri, 18 Jun 2021 16:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhFRPAz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Jun 2021 11:00:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:47992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234850AbhFRPAt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Jun 2021 11:00:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D986E613E2;
        Fri, 18 Jun 2021 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624028319;
        bh=gvrE5ecmlT4/FJKe+nQLJWvVfWI7v2fx8UJbL88CJ6c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=svMQTztnr9GKpMNR9Y/NwF8epArs/6gpDgjNvAHOwxcwN43nSKdwNZ5E2KLpl47IS
         g9B0ZsU4NMePu8tYu+5aUXUIO4qBODIBU0vQn49jzDM1m93Xta40Zro/KzYoQO0M9l
         b3dWG0wuUFAYO7/AQKKJBMnCvQQgMIF9JWETDJNbZdvp2QeGu3tKCY4DgHIG+BVktL
         TLSQDIyz4hVPO/zKt9628GmUtQKGQJo7/j0Es9CeK/nBt+C531F83f/eWNROPrLzAQ
         omtgg8VQDMVogAFa2F6/mdqWctbO2q/xdrvL2D4CgmCG1kzm+DG835djNimxyJXkW9
         OW7nKhnkWliGA==
Received: by mail-ed1-f41.google.com with SMTP id z12so9093116edc.1;
        Fri, 18 Jun 2021 07:58:39 -0700 (PDT)
X-Gm-Message-State: AOAM531dsyGeZWDr98BHWVLaezI06X65W+TH0RcqmlaFDrMHIQGELmzY
        ImcMLb17ladRfR58j4ZUh4/KE2lSW3UEZE0NuQ==
X-Google-Smtp-Source: ABdhPJzjuPtUFgRoKPpwhgygmJo+XsY1mLgW7cvQlyXBImHd5SJrSyJAg5MMSnN+gKu8gb6MezHJJaAsCFWdWGhbg3E=
X-Received: by 2002:aa7:cac9:: with SMTP id l9mr5414748edt.373.1624028318425;
 Fri, 18 Jun 2021 07:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210610182227.2480-1-vigneshr@ti.com>
In-Reply-To: <20210610182227.2480-1-vigneshr@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 18 Jun 2021 08:58:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLjqtUapkr6ARyaeTduhSghJL-q7hBWGFPm7ubbvqCmJw@mail.gmail.com>
Message-ID: <CAL_JsqLjqtUapkr6ARyaeTduhSghJL-q7hBWGFPm7ubbvqCmJw@mail.gmail.com>
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

On Thu, Jun 10, 2021 at 12:22 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Convert serial-omap.txt to YAML schema for better checks and documentation.
>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>
> v2:
> *Drop reg-io-width and reg-shift as they are constant and documented in
>  txt bindings (also not used by driver).
> *Drop unused label in example.
> *Rename file to 8250_omap.yaml to be more generic as IP is present in
> varies families of TI SoCs.
> *Add description for interrupt entries
>
>  .../devicetree/bindings/serial/8250_omap.yaml | 118 ++++++++++++++++++
>  .../bindings/serial/omap_serial.txt           |  40 ------
>  2 files changed, 118 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/8250_omap.yaml
>  delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
>
> diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
> new file mode 100644
> index 000000000000..1c826fcf5828
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for 8250 compliant UARTs on TI's OMAP2+ and K3 SoCs
> +
> +maintainers:
> +  - Vignesh Raghavendra <vigneshr@ti.com>
> +
> +allOf:
> +  - $ref: /schemas/serial/serial.yaml#
> +  - $ref: /schemas/serial/rs485.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - ti,am3352-uart
> +          - ti,am4372-uart
> +          - ti,am654-uart
> +          - ti,dra742-uart
> +          - ti,omap2-uart
> +          - ti,omap3-uart
> +          - ti,omap4-uart
> +      - items:
> +          - enum:
> +              - ti,am64-uart
> +              - ti,j721e-uart
> +          - const: ti,am654-uart
> +
> +  ti,hwmods:
> +    description:
> +      Must be "uart<n>", n being the instance number (1-based)
> +      This property is applicable only on legacy platforms mainly omap2/3
> +      and ti81xx and should not be used on other platforms.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    deprecated: true
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      First entry is module IRQ required for normal IO operation.
> +      Second entry is optional and corresponds to system wakeup IRQ
> +      where supported.

interrupts:
  minItems: 1
  items:
    - description: module IRQ required for normal IO operation
    - description: system wakeup IRQ

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: fclk
> +
> +  rts-gpios: true
> +  cts-gpios: true
> +  dtr-gpios: true
> +  dsr-gpios: true
> +  rng-gpios: true
> +  dcd-gpios: true
> +  rs485-rts-delay: true
> +  rs485-rts-active-low: true
> +  rs485-rx-during-tx: true
> +  rs485-rts-active-high: true
> +  linux,rs485-enabled-at-boot-time: true
> +  rts-gpio: true
> +  power-domains: true
> +  clock-frequency: true
> +  current-speed: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false

Do you want to support serial attached devices? If so, you need:

unevaluatedProperties: false

You can also drop listing all the inherited properties from the
included schemas.

> +
> +if:
> +  properties:
> +    compatible:
> +      oneOf:
> +        - const: ti,omap2-uart
> +        - const: ti,omap3-uart
> +        - const: ti,omap4-uart
> +
> +then:
> +  properties:
> +    ti,hwmods:
> +      items:
> +        - pattern: "^uart([1-9])$"
> +
> +else:
> +  properties:
> +    ti,hwmods: false
> +
> +examples:
> +  - |
> +          serial@49042000 {
> +            compatible = "ti,omap3-uart";
> +            reg = <0x49042000 0x400>;
> +            interrupts = <80>;
> +            dmas = <&sdma 81 &sdma 82>;
> +            dma-names = "tx", "rx";
> +            ti,hwmods = "uart4";
> +            clock-frequency = <48000000>;
> +          };
> diff --git a/Documentation/devicetree/bindings/serial/omap_serial.txt b/Documentation/devicetree/bindings/serial/omap_serial.txt
> deleted file mode 100644
> index c2db8cabf2ab..000000000000
> --- a/Documentation/devicetree/bindings/serial/omap_serial.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -OMAP UART controller
> -
> -Required properties:
> -- compatible : should be "ti,am64-uart", "ti,am654-uart" for AM64 controllers
> -- compatible : should be "ti,j721e-uart", "ti,am654-uart" for J721E controllers
> -- compatible : should be "ti,am654-uart" for AM654 controllers
> -- compatible : should be "ti,omap2-uart" for OMAP2 controllers
> -- compatible : should be "ti,omap3-uart" for OMAP3 controllers
> -- compatible : should be "ti,omap4-uart" for OMAP4 controllers
> -- compatible : should be "ti,am4372-uart" for AM437x controllers
> -- compatible : should be "ti,am3352-uart" for AM335x controllers
> -- compatible : should be "ti,dra742-uart" for DRA7x controllers
> -- reg : address and length of the register space
> -- interrupts or interrupts-extended : Should contain the uart interrupt
> -                                      specifier or both the interrupt
> -                                      controller phandle and interrupt
> -                                      specifier.
> -- ti,hwmods : Must be "uart<n>", n being the instance number (1-based)
> -
> -Optional properties:
> -- clock-frequency : frequency of the clock input to the UART
> -- dmas : DMA specifier, consisting of a phandle to the DMA controller
> -         node and a DMA channel number.
> -- dma-names : "rx" for receive channel, "tx" for transmit channel.
> -- rs485-rts-delay, rs485-rx-during-tx, linux,rs485-enabled-at-boot-time: see rs485.txt
> -- rs485-rts-active-high: drive RTS high when sending (default is low).
> -- clocks: phandle to the functional clock as per
> -  Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -Example:
> -
> -                uart4: serial@49042000 {
> -                        compatible = "ti,omap3-uart";
> -                        reg = <0x49042000 0x400>;
> -                        interrupts = <80>;
> -                        dmas = <&sdma 81 &sdma 82>;
> -                        dma-names = "tx", "rx";
> -                        ti,hwmods = "uart4";
> -                        clock-frequency = <48000000>;
> -                };
> --
> 2.32.0
>
