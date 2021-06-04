Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA0939C1A6
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 22:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbhFDUyM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 16:54:12 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:43571 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhFDUyM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 16:54:12 -0400
Received: by mail-oi1-f170.google.com with SMTP id x196so10613766oif.10;
        Fri, 04 Jun 2021 13:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dCbBPCnkqh8Drs+wvzuQjooL3M/Ka+1PXP7SXhSYbME=;
        b=g3W7J9Z7lyQl2J7nHGxzvwDa+TJgthHE+xhXfpKR5sx6cDtK8NK/gaE50YlOgovJc4
         qrhwjFRdQITgvuWHYm97it5Qyyet3g/OmWqjnDYDNNRMy+VaaqABk8K+mutVB0Bj+wac
         nNl2mHWeL6F/8eTMnbn0ckkEjXXeD2oHMh3OHWo7RKGK2FB2VDmBuXfs32oOHNL4X4SJ
         9267peaLcpQ6EL9JmwPmsTtz3hrieMOYlnzz5PtW2hAgl7HbPqGYO1zsoq8bl5TLVHx4
         mJeIoEmpY3eQri0Yelo6z1FKDTylxTEoQ7EXqPfHJ/dOXwn3qE4r20A0k9Gtr16l8rnE
         DoNQ==
X-Gm-Message-State: AOAM531SoTRxSigKWBuvY6BQZXR733afie3MvzGfhAQisJ0OrBxwbLqV
        ZHuO4S3kXN4drbqxsS4Wmw==
X-Google-Smtp-Source: ABdhPJyJwckPBpX8reCPy0nYAhTu9MAYthQi8nlQw+pMLWQNCXQ9h3Khxkk0+OAbNHw0w4RG8oeoEg==
X-Received: by 2002:aca:4a82:: with SMTP id x124mr3659326oia.43.1622839928655;
        Fri, 04 Jun 2021 13:52:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m189sm683532oif.45.2021.06.04.13.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:52:07 -0700 (PDT)
Received: (nullmailer pid 3894844 invoked by uid 1000);
        Fri, 04 Jun 2021 20:52:06 -0000
Date:   Fri, 4 Jun 2021 15:52:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: serial: Move omap-serial.txt to YAML schema
Message-ID: <20210604205206.GB3885095@robh.at.kernel.org>
References: <20210527165636.939-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527165636.939-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 27, 2021 at 10:26:36PM +0530, Vignesh Raghavendra wrote:
> Convert serial-omap.txt to YAML schema for better checks and documentation.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../bindings/serial/omap_serial.txt           |  40 ------
>  .../bindings/serial/ti,omap4-uart.yaml        | 116 ++++++++++++++++++
>  2 files changed, 116 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
> 
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
> diff --git a/Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml b/Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
> new file mode 100644
> index 000000000000..b3e426c24a9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/ti,omap4-uart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for 8250 compliant UARTs on TI's OMAP and K3 SoCs
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
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: fclk
> +
> +  reg-shift:
> +    const: 2

blank line

> +  reg-io-width:
> +    const: 4

How are these 2 optional?

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
> +          uart4: serial@49042000 {

Drop unused label.

> +                  compatible = "ti,omap3-uart";
> +                  reg = <0x49042000 0x400>;
> +                  interrupts = <80>;
> +                  clock-frequency = <48000000>;
> +          };
> -- 
> 2.31.1
