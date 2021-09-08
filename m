Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90070403892
	for <lists+linux-omap@lfdr.de>; Wed,  8 Sep 2021 13:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbhIHLPZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Sep 2021 07:15:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232630AbhIHLPY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 8 Sep 2021 07:15:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4F3361154;
        Wed,  8 Sep 2021 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631099657;
        bh=xO7xq4UPIttK7gzjwNTIx3JG/kR0uW9mJPiRvVeCvtM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fXRr4zdw6hKUGCYSeBUH7HFG3BYLZS+ddRJt+Zf359GUSpHTt++k5wFhUSxaBSaKR
         0NfmLZX83qM7rD7NUbNmKCkNP2b619Y3cG7g5KakDUiXXfOuDf5IZDlPu/3OuvSX6g
         qmQFQw5xIdvyibGtwZWMpWHfrJXLH8iaEL9QvR4Efhe/PjK/wF8rj/iiX3EhFdbshJ
         jGJnzHQ52LzReKSx3fDJrgArL0foBqODyhB9thmAHEv/apmDV0yiV3OnAj/F5QWi8x
         rGsaQs1hG/NkTc+TWkxmsxJKdArYBZsK/Jel+Sc85RiFza43AdH5dmzeGViL5j5LfG
         jl97QfbsK+b6Q==
Subject: Re: [PATCH v3 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     tony@atomide.com, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-6-rogerq@kernel.org>
 <YTea/Ium7TptHlnV@robh.at.kernel.org>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <5b7787ce-d51f-e79c-fa7a-0113acda5648@kernel.org>
Date:   Wed, 8 Sep 2021 14:14:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTea/Ium7TptHlnV@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 07/09/2021 20:01, Rob Herring wrote:
> On Tue, Sep 07, 2021 at 02:32:23PM +0300, Roger Quadros wrote:
>> Convert gpmc-nand.txt to ti,gpmc-nand.yaml.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 ------------------
>>  .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 110 +++++++++++++
>>  2 files changed, 110 insertions(+), 147 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
>> deleted file mode 100644
>> index 44919d48d241..000000000000
>> --- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
>> +++ /dev/null
>> @@ -1,147 +0,0 @@
>> -Device tree bindings for GPMC connected NANDs
>> -
>> -GPMC connected NAND (found on OMAP boards) are represented as child nodes of
>> -the GPMC controller with a name of "nand".
>> -
>> -All timing relevant properties as well as generic gpmc child properties are
>> -explained in a separate documents - please refer to
>> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>> -
>> -For NAND specific properties such as ECC modes or bus width, please refer to
>> -Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> -
>> -
>> -Required properties:
>> -
>> - - compatible:	"ti,omap2-nand"
>> - - reg:		range id (CS number), base offset and length of the
>> -		NAND I/O space
>> - - interrupts:	Two interrupt specifiers, one for fifoevent, one for termcount.
>> -
>> -Optional properties:
>> -
>> - - nand-bus-width: 		Set this numeric value to 16 if the hardware
>> -				is wired that way. If not specified, a bus
>> -				width of 8 is assumed.
>> -
>> - - ti,nand-ecc-opt:		A string setting the ECC layout to use. One of:
>> -		"sw"		1-bit Hamming ecc code via software
>> -		"hw"		<deprecated> use "ham1" instead
>> -		"hw-romcode"	<deprecated> use "ham1" instead
>> -		"ham1"		1-bit Hamming ecc code
>> -		"bch4"		4-bit BCH ecc code
>> -		"bch8"		8-bit BCH ecc code
>> -		"bch16"		16-bit BCH ECC code
>> -		Refer below "How to select correct ECC scheme for your device ?"
>> -
>> - - ti,nand-xfer-type:		A string setting the data transfer type. One of:
>> -
>> -		"prefetch-polled"	Prefetch polled mode (default)
>> -		"polled"		Polled mode, without prefetch
>> -		"prefetch-dma"		Prefetch enabled DMA mode
>> -		"prefetch-irq"		Prefetch enabled irq mode
>> -
>> - - elm_id:	<deprecated> use "ti,elm-id" instead
>> - - ti,elm-id:	Specifies phandle of the ELM devicetree node.
>> -		ELM is an on-chip hardware engine on TI SoC which is used for
>> -		locating ECC errors for BCHx algorithms. SoC devices which have
>> -		ELM hardware engines should specify this device node in .dtsi
>> -		Using ELM for ECC error correction frees some CPU cycles.
>> - - rb-gpios:	GPIO specifier for the ready/busy# pin.
>> -
>> -For inline partition table parsing (optional):
>> -
>> - - #address-cells: should be set to 1
>> - - #size-cells: should be set to 1
>> -
>> -Example for an AM33xx board:
>> -
>> -	gpmc: gpmc@50000000 {
>> -		compatible = "ti,am3352-gpmc";
>> -		ti,hwmods = "gpmc";
>> -		reg = <0x50000000 0x36c>;
>> -		interrupts = <100>;
>> -		gpmc,num-cs = <8>;
>> -		gpmc,num-waitpins = <2>;
>> -		#address-cells = <2>;
>> -		#size-cells = <1>;
>> -		ranges = <0 0 0x08000000 0x1000000>;	/* CS0 space, 16MB */
>> -		elm_id = <&elm>;
>> -		interrupt-controller;
>> -		#interrupt-cells = <2>;
>> -
>> -		nand@0,0 {
>> -			compatible = "ti,omap2-nand";
>> -			reg = <0 0 4>;		/* CS0, offset 0, NAND I/O window 4 */
>> -			interrupt-parent = <&gpmc>;
>> -			interrupts = <0 IRQ_TYPE_NONE>, <1 IRQ_TYPE NONE>;
>> -			nand-bus-width = <16>;
>> -			ti,nand-ecc-opt = "bch8";
>> -			ti,nand-xfer-type = "polled";
>> -			rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
>> -
>> -			gpmc,sync-clk-ps = <0>;
>> -			gpmc,cs-on-ns = <0>;
>> -			gpmc,cs-rd-off-ns = <44>;
>> -			gpmc,cs-wr-off-ns = <44>;
>> -			gpmc,adv-on-ns = <6>;
>> -			gpmc,adv-rd-off-ns = <34>;
>> -			gpmc,adv-wr-off-ns = <44>;
>> -			gpmc,we-off-ns = <40>;
>> -			gpmc,oe-off-ns = <54>;
>> -			gpmc,access-ns = <64>;
>> -			gpmc,rd-cycle-ns = <82>;
>> -			gpmc,wr-cycle-ns = <82>;
>> -			gpmc,wr-access-ns = <40>;
>> -			gpmc,wr-data-mux-bus-ns = <0>;
>> -
>> -			#address-cells = <1>;
>> -			#size-cells = <1>;
>> -
>> -			/* partitions go here */
>> -		};
>> -	};
>> -
>> -How to select correct ECC scheme for your device ?
>> ---------------------------------------------------
>> -Higher ECC scheme usually means better protection against bit-flips and
>> -increased system lifetime. However, selection of ECC scheme is dependent
>> -on various other factors also like;
>> -
>> -(1) support of built in hardware engines.
>> -	Some legacy OMAP SoC do not have ELM harware engine, so those SoC cannot
>> -	support ecc-schemes with hardware error-correction (BCHx_HW). However
>> -	such SoC can use ecc-schemes with software library for error-correction
>> -	(BCHx_HW_DETECTION_SW). The error correction capability with software
>> -	library remains equivalent to their hardware counter-part, but there is
>> -	slight CPU penalty when too many bit-flips are detected during reads.
>> -
>> -(2) Device parameters like OOBSIZE.
>> -	Other factor which governs the selection of ecc-scheme is oob-size.
>> -	Higher ECC schemes require more OOB/Spare area to store ECC syndrome,
>> -	so the device should have enough free bytes available its OOB/Spare
>> -	area to accommodate ECC for entire page. In general following expression
>> -	helps in determining if given device can accommodate ECC syndrome:
>> -	"2 + (PAGESIZE / 512) * ECC_BYTES" >= OOBSIZE"
>> -	where
>> -		OOBSIZE		number of bytes in OOB/spare area
>> -		PAGESIZE	number of bytes in main-area of device page
>> -		ECC_BYTES	number of ECC bytes generated to protect
>> -		                512 bytes of data, which is:
>> -				'3' for HAM1_xx ecc schemes
>> -				'7' for BCH4_xx ecc schemes
>> -				'14' for BCH8_xx ecc schemes
>> -				'26' for BCH16_xx ecc schemes
>> -
>> -	Example(a): For a device with PAGESIZE = 2048 and OOBSIZE = 64 and
>> -		trying to use BCH16 (ECC_BYTES=26) ecc-scheme.
>> -		Number of ECC bytes per page = (2 + (2048 / 512) * 26) = 106 B
>> -		which is greater than capacity of NAND device (OOBSIZE=64)
>> -		Hence, BCH16 cannot be supported on given device. But it can
>> -		probably use lower ecc-schemes like BCH8.
>> -
>> -	Example(b): For a device with PAGESIZE = 2048 and OOBSIZE = 128 and
>> -		trying to use BCH16 (ECC_BYTES=26) ecc-scheme.
>> -		Number of ECC bytes per page = (2 + (2048 / 512) * 26) = 106 B
>> -		which can be accommodated in the OOB/Spare area of this device
>> -		(OOBSIZE=128). So this device can use BCH16 ecc-scheme.
>> diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
>> new file mode 100644
>> index 000000000000..db36f2e944ef
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/ti,gpmc-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments GPMC NAND Flash controller.
>> +
>> +maintainers:
>> +  - Tony Lindgren <tony@atomide.com>
>> +  - Roger Quadros <rogerq@kernel.org>
>> +
>> +description:
>> +  GPMC NAND controller/Flash is represented as a child of the
>> +  GPMC controller node.
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,omap2-nand
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt for fifoevent
>> +      - description: Interrupt for termcount
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ti,nand-ecc-opt:
>> +    description: Desired ECC algorithm
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [sw, ham1, bch4, bch8, bch16]
>> +
>> +  ti,nand-xfer-type:
>> +    description: Data transfer method between controller and chip.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [prefetch-polled, polled, prefetch-dma, prefetch-irq]
>> +    default: prefetch-polled
>> +
>> +  ti,elm-id:
>> +    description:
>> +      phandle to the ELM (Error Location Module).
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  nand-bus-width:
>> +    description:
>> +      Bus width to the NAND chip
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [8, 16]
>> +    default: 8
>> +
>> +allOf:
>> +  - $ref: "../memory-controllers/ti,gpmc-child.yaml"
> 
> Use /schemas/... rather than '..'

ok.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ti,nand-ecc-opt
>> +
>> +unevaluatedProperties: false
> 
> This will throw errors if you have partition nodes. You need to 
> reference the partitions schema.

I didn't get any errors with dtbs_check so far. But I will
try referencing the partition schema here.

> 
> Or minimally restrict to nodes with: 
> 
> unevaluatedProperties:
>   type: object
> 
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    gpmc: memory-controller@50000000 {
>> +      compatible = "ti,am3352-gpmc";
>> +      dmas = <&edma 52 0>;
>> +      dma-names = "rxtx";
>> +      clocks = <&l3s_gclk>;
>> +      clock-names = "fck";
>> +      reg = <0x50000000 0x2000>;
>> +      interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>> +      gpmc,num-cs = <7>;
>> +      gpmc,num-waitpins = <2>;
>> +      #address-cells = <2>;
>> +      #size-cells = <1>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +
>> +      ranges = <0 0 0x08000000 0x01000000>;   /* CS0 space. Min partition = 16MB */
>> +      nand@0,0 {
>> +        compatible = "ti,omap2-nand";
>> +        reg = <0 0 4>;          /* device IO registers */
>> +        interrupt-parent = <&gpmc>;
>> +        interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
>> +                     <1 IRQ_TYPE_NONE>; /* termcount */
>> +        ti,nand-xfer-type = "prefetch-dma";
>> +        ti,nand-ecc-opt = "bch16";
>> +        ti,elm-id = <&elm>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        /* NAND generic properties */
>> +        nand-bus-width = <8>;
>> +        rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>;  /* gpmc_wait0 */
>> +
>> +        /* GPMC properties*/
>> +        gpmc,device-width = <1>;
>> +      };
>> +    };
>> -- 
>> 2.17.1
>>
>>

cheers,
-roger
