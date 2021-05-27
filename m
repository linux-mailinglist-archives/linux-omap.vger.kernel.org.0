Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0694D393523
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 19:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbhE0RvW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 13:51:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59928 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhE0RvT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 May 2021 13:51:19 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RHnf5v060411;
        Thu, 27 May 2021 12:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622137781;
        bh=sy+bdMzmRE6ELJAGc0+jRguaGKhobAm0nHlog7cKFhY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Cm/qmHfRoB9xyrzs/vEAk/pV4L1bDRwkB1X6etgxtG8GgxEL24UFAeHLgja+UYcO3
         ajCApWId2+l6HlPq3XtYz4bGVXvY313dIfiUYaZyalJxN5tb0+0IedKf32be8r+8Jv
         EYe/AETFbif+8TykzpKljpz1XRJhX8i9YvEfmrYk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RHnfE1094266
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 May 2021 12:49:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 12:49:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 12:49:40 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RHnbUu058802;
        Thu, 27 May 2021 12:49:38 -0500
Subject: Re: [PATCH] dt-bindings: serial: Move omap-serial.txt to YAML schema
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20210527165636.939-1-vigneshr@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <3760d1e6-2121-323b-d962-60e8291d0bb7@ti.com>
Date:   Thu, 27 May 2021 20:49:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210527165636.939-1-vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/05/2021 19:56, Vignesh Raghavendra wrote:
> Convert serial-omap.txt to YAML schema for better checks and documentation.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>   .../bindings/serial/omap_serial.txt           |  40 ------
>   .../bindings/serial/ti,omap4-uart.yaml        | 116 ++++++++++++++++++
>   2 files changed, 116 insertions(+), 40 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
>   create mode 100644 Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml

Why omap4? Seems ti,omap-uart.yaml is more suitable.

> 
> diff --git a/Documentation/devicetree/bindings/serial/omap_serial.txt b/Documentation/devicetree/bindings/serial/omap_serial.txt
> deleted file mode 100644
> index c2db8cabf2ab..000000000000
> --- a/Documentation/devicetree/bindings/serial/omap_serial.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -OMAP UART controller
> -

[...]

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

Could you add description for interrupts, pls?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: fclk
> +
> +  reg-shift:
> +    const: 2
> +  reg-io-width:
> +    const: 4
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
> +                  compatible = "ti,omap3-uart";
> +                  reg = <0x49042000 0x400>;
> +                  interrupts = <80>;
> +                  clock-frequency = <48000000>;
> +          };
> 

-- 
Best regards,
grygorii
