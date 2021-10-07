Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFD7424E84
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 10:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236997AbhJGIFs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 04:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:56686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232587AbhJGIFs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 04:05:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B34C161076;
        Thu,  7 Oct 2021 08:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633593835;
        bh=Q+2hBhnWOcbhRE8sVLCBOk4CBbSWDNJOtWkQ2IGbLIM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NxWVs4WbZn8uOK+1OC7+DqHgN5N8uHemC6Ydf0g2pP1X1HZT5qjVkoksonEjImT+Y
         ZEwJOwv7akRPZqsoa1K9jT4ShGKXNG1MbZGUh6KzGYNlCozWKywAJANEmGwF+h2Jmm
         4YfmxefTgFoe4bChV6mp/ziTx9e2UpNKJxER4HV0fglOhSXbK5w/AgxXvBk2Gb2uw4
         /G5NiCutFKKR6UpKUK2SOKBkpl3jlG8UADIN+jWeWdHcARy2fwm/gubqKpQcoiMQqg
         eCssDJEZO6ngFs1Yql1Hhqkt/hDsj5dnSqjiie2+04vkUrWqlVYb7Ar2dVA01q8p9r
         eGNHrdHPOZS0w==
Subject: Re: [PATCH v4 7/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-8-rogerq@kernel.org>
 <654bb29d-5580-3035-fc43-546a7e88e224@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <8c1568e8-8b88-05c3-12ac-46dd77404163@kernel.org>
Date:   Thu, 7 Oct 2021 11:03:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <654bb29d-5580-3035-fc43-546a7e88e224@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

On 15/09/2021 10:20, Krzysztof Kozlowski wrote:
> On 14/09/2021 14:27, Roger Quadros wrote:
>> Convert omap-gpmc.txt to ti,gpmc.yaml.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../bindings/memory-controllers/omap-gpmc.txt | 157 ----------------
>>  .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++++++++
>>  2 files changed, 172 insertions(+), 157 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>> deleted file mode 100644
>> index c1359f4d48d7..000000000000
>> --- a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>> +++ /dev/null
>> @@ -1,157 +0,0 @@
>> -Device tree bindings for OMAP general purpose memory controllers (GPMC)
>> -
>> -The actual devices are instantiated from the child nodes of a GPMC node.
>> -
>> -Required properties:
>> -
>> - - compatible:		Should be set to one of the following:
>> -
>> -			ti,omap2420-gpmc (omap2420)
>> -			ti,omap2430-gpmc (omap2430)
>> -			ti,omap3430-gpmc (omap3430 & omap3630)
>> -			ti,omap4430-gpmc (omap4430 & omap4460 & omap543x)
>> -			ti,am3352-gpmc   (am335x devices)
>> -
>> - - reg:			A resource specifier for the register space
>> -			(see the example below)
>> - - ti,hwmods:		Should be set to "ti,gpmc" until the DT transition is
>> -			completed.
>> - - #address-cells:	Must be set to 2 to allow memory address translation
>> - - #size-cells:		Must be set to 1 to allow CS address passing
>> - - gpmc,num-cs:		The maximum number of chip-select lines that controller
>> -			can support.
>> - - gpmc,num-waitpins:	The maximum number of wait pins that controller can
>> -			support.
>> - - ranges:		Must be set up to reflect the memory layout with four
>> -			integer values for each chip-select line in use:
>> -
>> -			   <cs-number> 0 <physical address of mapping> <size>
>> -
>> -			Currently, calculated values derived from the contents
>> -			of the per-CS register GPMC_CONFIG7 (as set up by the
>> -			bootloader) are used for the physical address decoding.
>> -			As this will change in the future, filling correct
>> -			values here is a requirement.
>> - - interrupt-controller: The GPMC driver implements and interrupt controller for
>> -			the NAND events "fifoevent" and "termcount" plus the
>> -			rising/falling edges on the GPMC_WAIT pins.
>> -			The interrupt number mapping is as follows
>> -			0 - NAND_fifoevent
>> -			1 - NAND_termcount
>> -			2 - GPMC_WAIT0 pin edge
>> -			3 - GPMC_WAIT1 pin edge, and so on.
>> - - interrupt-cells:	Must be set to 2
>> - - gpio-controller:	The GPMC driver implements a GPIO controller for the
>> -			GPMC WAIT pins that can be used as general purpose inputs.
>> -			0 maps to GPMC_WAIT0 pin.
>> - - gpio-cells:		Must be set to 2
>> -
>> -Required properties when using NAND prefetch dma:
>> - - dmas			GPMC NAND prefetch dma channel
>> - - dma-names		Must be set to "rxtx"
>> -
>> -Timing properties for child nodes. All are optional and default to 0.
>> -
>> - - gpmc,sync-clk-ps:	Minimum clock period for synchronous mode, in picoseconds
>> -
>> - Chip-select signal timings (in nanoseconds) corresponding to GPMC_CONFIG2:
>> - - gpmc,cs-on-ns:	Assertion time
>> - - gpmc,cs-rd-off-ns:	Read deassertion time
>> - - gpmc,cs-wr-off-ns:	Write deassertion time
>> -
>> - ADV signal timings (in nanoseconds) corresponding to GPMC_CONFIG3:
>> - - gpmc,adv-on-ns:	Assertion time
>> - - gpmc,adv-rd-off-ns:	Read deassertion time
>> - - gpmc,adv-wr-off-ns:	Write deassertion time
>> - - gpmc,adv-aad-mux-on-ns:	Assertion time for AAD
>> - - gpmc,adv-aad-mux-rd-off-ns:	Read deassertion time for AAD
>> - - gpmc,adv-aad-mux-wr-off-ns:	Write deassertion time for AAD
>> -
>> - WE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
>> - - gpmc,we-on-ns	Assertion time
>> - - gpmc,we-off-ns:	Deassertion time
>> -
>> - OE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
>> - - gpmc,oe-on-ns:	Assertion time
>> - - gpmc,oe-off-ns:	Deassertion time
>> - - gpmc,oe-aad-mux-on-ns:	Assertion time for AAD
>> - - gpmc,oe-aad-mux-off-ns:	Deassertion time for AAD
>> -
>> - Access time and cycle time timings (in nanoseconds) corresponding to
>> - GPMC_CONFIG5:
>> - - gpmc,page-burst-access-ns: 	Multiple access word delay
>> - - gpmc,access-ns:		Start-cycle to first data valid delay
>> - - gpmc,rd-cycle-ns:		Total read cycle time
>> - - gpmc,wr-cycle-ns:		Total write cycle time
>> - - gpmc,bus-turnaround-ns:	Turn-around time between successive accesses
>> - - gpmc,cycle2cycle-delay-ns:	Delay between chip-select pulses
>> - - gpmc,clk-activation-ns: 	GPMC clock activation time
>> - - gpmc,wait-monitoring-ns:	Start of wait monitoring with regard to valid
>> -				data
>> -
>> -Boolean timing parameters. If property is present parameter enabled and
>> -disabled if omitted:
>> - - gpmc,adv-extra-delay:	ADV signal is delayed by half GPMC clock
>> - - gpmc,cs-extra-delay:		CS signal is delayed by half GPMC clock
>> - - gpmc,cycle2cycle-diffcsen:	Add "cycle2cycle-delay" between successive
>> -				accesses to a different CS
>> - - gpmc,cycle2cycle-samecsen:	Add "cycle2cycle-delay" between successive
>> -				accesses to the same CS
>> - - gpmc,oe-extra-delay:		OE signal is delayed by half GPMC clock
>> - - gpmc,we-extra-delay:		WE signal is delayed by half GPMC clock
>> - - gpmc,time-para-granularity:	Multiply all access times by 2
>> -
>> -The following are only applicable to OMAP3+ and AM335x:
>> - - gpmc,wr-access-ns:		In synchronous write mode, for single or
>> -				burst accesses, defines the number of
>> -				GPMC_FCLK cycles from start access time
>> -				to the GPMC_CLK rising edge used by the
>> -				memory device for the first data capture.
>> - - gpmc,wr-data-mux-bus-ns:	In address-data multiplex mode, specifies
>> -				the time when the first data is driven on
>> -				the address-data bus.
>> -
>> -GPMC chip-select settings properties for child nodes. All are optional.
>> -
>> -- gpmc,burst-length	Page/burst length. Must be 4, 8 or 16.
>> -- gpmc,burst-wrap	Enables wrap bursting
>> -- gpmc,burst-read	Enables read page/burst mode
>> -- gpmc,burst-write	Enables write page/burst mode
>> -- gpmc,device-width	Total width of device(s) connected to a GPMC
>> -			chip-select in bytes. The GPMC supports 8-bit
>> -			and 16-bit devices and so this property must be
>> -			1 or 2.
>> -- gpmc,mux-add-data	Address and data multiplexing configuration.
>> -			Valid values are 1 for address-address-data
>> -			multiplexing mode and 2 for address-data
>> -			multiplexing mode.
>> -- gpmc,sync-read	Enables synchronous read. Defaults to asynchronous
>> -			is this is not set.
>> -- gpmc,sync-write	Enables synchronous writes. Defaults to asynchronous
>> -			is this is not set.
>> -- gpmc,wait-pin		Wait-pin used by client. Must be less than
>> -			"gpmc,num-waitpins".
>> -- gpmc,wait-on-read	Enables wait monitoring on reads.
>> -- gpmc,wait-on-write	Enables wait monitoring on writes.
>> -
>> -Example for an AM33xx board:
>> -
>> -	gpmc: gpmc@50000000 {
>> -		compatible = "ti,am3352-gpmc";
>> -		ti,hwmods = "gpmc";
>> -		reg = <0x50000000 0x2000>;
>> -		interrupts = <100>;
>> -		dmas = <&edma 52 0>;
>> -		dma-names = "rxtx";
>> -		gpmc,num-cs = <8>;
>> -		gpmc,num-waitpins = <2>;
>> -		#address-cells = <2>;
>> -		#size-cells = <1>;
>> -		ranges = <0 0 0x08000000 0x10000000>; /* CS0 @addr 0x8000000, size 0x10000000 */
>> -		interrupt-controller;
>> -		#interrupt-cells = <2>;
>> -		gpio-controller;
>> -		#gpio-cells = <2>;
>> -
>> -		/* child nodes go here */
>> -	};
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>> new file mode 100644
>> index 000000000000..d6cd39bd3940
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>> @@ -0,0 +1,172 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments GPMC Memory Controller device-tree bindings
>> +
>> +maintainers:
>> +  - Tony Lindgren <tony@atomide.com>
>> +  - Roger Quadros <rogerq@kernel.org>
>> +
>> +description:
>> +  The GPMC is a unified memory controller dedicated for interfacing
>> +  with external memory devices like
>> +  - Asynchronous SRAM-like memories and ASICs
>> +  - Asynchronous, synchronous, and page mode burst NOR flash
>> +  - NAND flash
>> +  - Pseudo-SRAM devices
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - ti,omap2420-gpmc
>> +          - ti,omap2430-gpmc
>> +          - ti,omap3430-gpmc
>> +          - ti,omap4430-gpmc
>> +          - ti,am3352-gpmc
> 
> How about putting them in alphabetical order?

OK.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: |
>> +      Functional clock. Used for bus timing calculations and
>> +      GPMC configuration.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: fck
>> +
>> +  dmas:
>> +    items:
>> +      - description: DMA channel for GPMC NAND prefetch
>> +
>> +  dma-names:
>> +    items:
>> +      - const: rxtx
>> +
>> +  "#address-cells": true
>> +
>> +  "#size-cells": true
>> +
>> +  gpmc,num-cs:
>> +    description: maximum number of supported chip-select lines.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  gpmc,num-waitpins:
>> +    description: maximum number of supported wait pins.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  ranges:
>> +    minItems: 1
>> +    description: |
>> +      Must be set up to reflect the memory layout with four
>> +      integer values for each chip-select line in use,
>> +      <cs-number> 0 <physical address of mapping> <size>
>> +    items:
>> +      - description: NAND bank 0
>> +      - description: NOR/SRAM bank 0
>> +      - description: NOR/SRAM bank 1
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +  interrupt-controller:
>> +    description: |
>> +      The GPMC driver implements and interrupt controller for
>> +      the NAND events "fifoevent" and "termcount" plus the
>> +      rising/falling edges on the GPMC_WAIT pins.
>> +      The interrupt number mapping is as follows
>> +      0 - NAND_fifoevent
>> +      1 - NAND_termcount
>> +      2 - GPMC_WAIT0 pin edge
>> +      3 - GPMC_WAIT1 pin edge, and so on.
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  gpio-controller:
>> +    description: |
>> +      The GPMC driver implements a GPIO controller for the
>> +      GPMC WAIT pins that can be used as general purpose inputs.
>> +      0 maps to GPMC_WAIT0 pin.
>> +
>> +  ti,hwmods:
>> +    description:
>> +      Name of the HWMOD associated with GPMC. This is for legacy
>> +      omap2/3 platforms only.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    deprecated: true
>> +
>> +  ti,no-idle-on-init:
>> +    description:
>> +      Prevent idling the module at init. This is for legacy omap2/3
>> +      platforms only.
>> +    type: boolean
>> +    deprecated: true
>> +
>> +patternProperties:
>> +  "@[0-7],[a-f0-9]+$":
>> +    type: object
>> +    description: |
>> +      The child device node represents the device connected to the GPMC
>> +      bus. The device can be a NAND chip, SRAM device, NOR device
>> +      or an ASIC.
>> +
>> +    allOf:
>> +      - $ref: "ti,gpmc-child.yaml"
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - gpmc,num-cs
>> +  - gpmc,num-waitpins
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    gpmc: memory-controller@50000000 {
>> +      compatible = "ti,am3352-gpmc";
>> +      reg = <0x50000000 0x2000>;
>> +      interrupts = <100>;
>> +      clocks = <&l3s_clkctrl>;
>> +      clock-names = "fck";
>> +      dmas = <&edma 52 0>;
>> +      dma-names = "rxtx";
>> +      gpmc,num-cs = <8>;
>> +      gpmc,num-waitpins = <2>;
>> +      #address-cells = <2>;
>> +      #size-cells = <1>;
>> +      ranges = <0 0 0x08000000 0x10000000>; /* CS0 @addr 0x8000000, size 0x10000000 */
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +
>> +      nand@0,0 {
>> +        compatible = "ti,omap2-nand";
>> +        reg = <0 0 4>;
>> +        interrupt-parent = <&gpmc>;
>> +        interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
>> +                     <1 IRQ_TYPE_NONE>; /* termcount */
> 
> Why these are interrupts of unspecified type (NONE)?

These are not external interrupt pins but internal to the SoC.
So they don't have any meaning for rising/falling edge or low/high level.

> 
>> +        ti,nand-xfer-type = "prefetch-dma";
>> +        ti,nand-ecc-opt = "bch16";
>> +        ti,elm-id = <&elm>;
>> +        rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 pin */
>> +      };
>> +    };
>>
> 
> 
> Best regards,
> Krzysztof
> 

cheers,
-roger
