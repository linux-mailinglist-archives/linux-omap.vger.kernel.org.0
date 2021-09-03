Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22E93FFD3F
	for <lists+linux-omap@lfdr.de>; Fri,  3 Sep 2021 11:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348847AbhICJgt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Sep 2021 05:36:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348802AbhICJgq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 3 Sep 2021 05:36:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 454FC60F91;
        Fri,  3 Sep 2021 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630661747;
        bh=XlIxehrCdusGQkVYHgdMT653kTSKd9t89Vos6UvqlIo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LzVsxAfAmyKryyY+R9j5hUHR5WPJfZW47mxgP3oobDsXY2bzx5lVUJp/d9plZ59Gx
         DG1pnwCS0Ni1PT5uP62AUzc/je3ZUnd/nyl9xdmtx8Rg//Gk0p1W6iDYP+HJGzfaww
         whrDxzeiSQUnwxGUBtYO1bZjumIVXUDLb+DpmZV+XxsGMgjr+txnqXLmQcaxjPmzJ7
         F0fKEjP3N2C/efdg1x1h1FuruSkXvRjk0K2Xr0aF2b5V9OrsNHvcVGumLFciNi+ig6
         FYiZcm9/8MEogt1i4STwH50k/Be5Tlui+1EzTGiafZ3llPAzRmN5IEqowJWN///9eB
         ne6lhD87COCBA==
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     tony@atomide.com, krzysztof.kozlowski@canonical.com,
        miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
 <YTEsiJiLMRYon5s3@robh.at.kernel.org>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <715fe0ee-a38c-c2ca-5e29-79fa0887bea0@kernel.org>
Date:   Fri, 3 Sep 2021 12:35:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTEsiJiLMRYon5s3@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On 02/09/2021 22:56, Rob Herring wrote:
> On Thu, Sep 02, 2021 at 12:56:05PM +0300, Roger Quadros wrote:
>> Convert omap-gpmc.txt to ti,gpmc.yaml.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>>  6 files changed, 370 insertions(+), 163 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>> new file mode 100644
>> index 000000000000..b7d43370a95d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>> @@ -0,0 +1,364 @@
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
>> +
>> +  reg:
>> +    items:
>> +      - description:
>> +          Configuration registers for the controller.
> 
> Just 'maxItems: 1' is sufficient.
> 
>> +
>> +  interrupts: true
> 
> Need to define how many.
> 
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
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 1
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
>> +
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
>> +     const: 2
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
>> +#  "@[0-3],[a-f0-9]+$":>> +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$":

> 
> Why the commented regex. There's no need for a full regex as we already 
> do that elsewhere. You only need to define the unit-address format.

This should be
  "@[0-7],[a-f0-9]+$":

I added the full regex during debug but forgot to take it off.

> 
>> +    type: object
>> +    description: |
>> +      The child device node represents the device connected to the GPMC
>> +      bus. The device can be a NAND controller, SRAM device, NOR device
>> +      or an ASIC.
>> +
>> +    properties:
>> +      compatible:
>> +        description:
>> +          Compatible of attached device.
> 
> Duh. Drop.
> 
>> +
>> +      reg:
>> +        items:
>> +        - description: Register access space for the device
> 
> A device with 2 register ranges isn't allowed?

GPMC is actually a memory controller and we are describing the children here.
Each child has to have a register range.

> 
>> +
>> +# GPMC Timing properties for child nodes. All are optional and default to 0.
>> +
>> +      gpmc,sync-clk-ps:
>> +        description: Minimum clock period for synchronous mode, in picoseconds
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>  
>            default: 0
> 
> And elsewhere...
> 
>> +
>> +# Chip-select signal timings (in nanoseconds) corresponding to GPMC_CONFIG2:
>> +      gpmc,cs-on-ns:
>> +        description: Assertion time
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> Blank line between DT properties.
> 
> Don't need a type ref with a standard unit suffix.
> 
> Is there a maximum value for all these?
> 

There is a maximum value but it is not an absolute value in time unit (ns)
as it depends on the GPMC functional clock rate which is platform specific.

e.g. for gpmc,cs-on-ns
	maximum: GPMC clock period * 15

>> +      gpmc,cs-rd-off-ns:
>> +        description: Read deassertion time
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +      gpmc,cs-wr-off-ns:
>> +        description: Write deassertion time
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +

<snip>

>>  
>> diff --git a/Documentation/devicetree/bindings/net/gpmc-eth.txt b/Documentation/devicetree/bindings/net/gpmc-eth.txt
>> index 32821066a85b..5e2f610455fa 100644
>> --- a/Documentation/devicetree/bindings/net/gpmc-eth.txt
>> +++ b/Documentation/devicetree/bindings/net/gpmc-eth.txt
>> @@ -9,7 +9,7 @@ the GPMC controller with an "ethernet" name.
>>  
>>  All timing relevant properties as well as generic GPMC child properties are
>>  explained in a separate documents. Please refer to
>> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>> +Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>>  
>>  For the properties relevant to the ethernet controller connected to the GPMC
>>  refer to the binding documentation of the device. For example, the documentation
>> @@ -43,7 +43,7 @@ Required properties:
>>  
>>  Optional properties:
>>  - gpmc,XXX		Additional GPMC timings and settings parameters. See
>> -			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>> +			Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 
> Perhaps delete this file first in the series so you don't have to 
> update it.
> 

Yes. Thanks for review :)

cheers,
-roger
