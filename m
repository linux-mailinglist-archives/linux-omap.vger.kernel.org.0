Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FBD3ACECA
	for <lists+linux-omap@lfdr.de>; Fri, 18 Jun 2021 17:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbhFRP0w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Jun 2021 11:26:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbhFRPYq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Jun 2021 11:24:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15IFMVIS104643;
        Fri, 18 Jun 2021 10:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624029751;
        bh=LJeWp9ecNco3an3cJzx2tQNMcRP7TVNUhvlcf24+KVM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dWG9X/Cd2o9hP1recwShzxzCDJAdaznv30T/L/j/R7n+Q2Le7RUimmAcN/ymOnXlz
         xaOlAS2WW5lqag/2PZeP5Xuwbbpino/rTj5hyW1wjVjQp0PiDfhUeJMw78mXiFN1Ca
         6bS0XF2wAP0XzkkAhDCfImU3GqaKS00NrU5rR7qo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15IFMUCq029401
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Jun 2021 10:22:30 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 10:22:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 18 Jun 2021 10:22:30 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15IFMRVK027988;
        Fri, 18 Jun 2021 10:22:27 -0500
Subject: Re: [PATCH v2] dt-bindings: serial: Move omap-serial.txt to YAML
 schema
To:     Rob Herring <robh+dt@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
References: <20210610182227.2480-1-vigneshr@ti.com>
 <CAL_JsqLjqtUapkr6ARyaeTduhSghJL-q7hBWGFPm7ubbvqCmJw@mail.gmail.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5ef04ae5-e07e-5162-7dad-ace3e2fdeb0d@ti.com>
Date:   Fri, 18 Jun 2021 20:52:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLjqtUapkr6ARyaeTduhSghJL-q7hBWGFPm7ubbvqCmJw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6/18/21 8:28 PM, Rob Herring wrote:
> On Thu, Jun 10, 2021 at 12:22 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>>
>> Convert serial-omap.txt to YAML schema for better checks and documentation.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>
>> v2:
>> *Drop reg-io-width and reg-shift as they are constant and documented in
>>  txt bindings (also not used by driver).
>> *Drop unused label in example.
>> *Rename file to 8250_omap.yaml to be more generic as IP is present in
>> varies families of TI SoCs.
>> *Add description for interrupt entries
>>
>>  .../devicetree/bindings/serial/8250_omap.yaml | 118 ++++++++++++++++++
>>  .../bindings/serial/omap_serial.txt           |  40 ------
>>  2 files changed, 118 insertions(+), 40 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/serial/8250_omap.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
>>
>> diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
>> new file mode 100644
>> index 000000000000..1c826fcf5828
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
>> @@ -0,0 +1,118 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for 8250 compliant UARTs on TI's OMAP2+ and K3 SoCs
>> +
>> +maintainers:
>> +  - Vignesh Raghavendra <vigneshr@ti.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/serial/serial.yaml#
>> +  - $ref: /schemas/serial/rs485.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - ti,am3352-uart
>> +          - ti,am4372-uart
>> +          - ti,am654-uart
>> +          - ti,dra742-uart
>> +          - ti,omap2-uart
>> +          - ti,omap3-uart
>> +          - ti,omap4-uart
>> +      - items:
>> +          - enum:
>> +              - ti,am64-uart
>> +              - ti,j721e-uart
>> +          - const: ti,am654-uart
>> +
>> +  ti,hwmods:
>> +    description:
>> +      Must be "uart<n>", n being the instance number (1-based)
>> +      This property is applicable only on legacy platforms mainly omap2/3
>> +      and ti81xx and should not be used on other platforms.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    deprecated: true
>> +
>> +  dmas:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    maxItems: 2
>> +    description:
>> +      First entry is module IRQ required for normal IO operation.
>> +      Second entry is optional and corresponds to system wakeup IRQ
>> +      where supported.
> 
> interrupts:
>   minItems: 1
>   items:
>     - description: module IRQ required for normal IO operation
>     - description: system wakeup IRQ
> 

OK, will send a follow up fix as the patch is already queued.

>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: fclk
>> +
>> +  rts-gpios: true
>> +  cts-gpios: true
>> +  dtr-gpios: true
>> +  dsr-gpios: true
>> +  rng-gpios: true
>> +  dcd-gpios: true
>> +  rs485-rts-delay: true
>> +  rs485-rts-active-low: true
>> +  rs485-rx-during-tx: true
>> +  rs485-rts-active-high: true
>> +  linux,rs485-enabled-at-boot-time: true
>> +  rts-gpio: true
>> +  power-domains: true
>> +  clock-frequency: true
>> +  current-speed: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
> 
> Do you want to support serial attached devices? If so, you need:
> 
> unevaluatedProperties: false
> 

Yes, support for serial client devices is desired, but I see that with
"unevaluatedProperties: false" there are no warnings if DT has a
property not documented in the schema? Did I miss something?

> You can also drop listing all the inherited properties from the
> included schemas.

Yes, this can be done with "unevaluatedProperties: false".

Regards
Vignesh
