Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF51717A549
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 13:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgCEMa7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 07:30:59 -0500
Received: from foss.arm.com ([217.140.110.172]:48022 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbgCEMa7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Mar 2020 07:30:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E754B2;
        Thu,  5 Mar 2020 04:30:58 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 453383F6C4;
        Thu,  5 Mar 2020 04:30:57 -0800 (PST)
Subject: Re: [PATCH] dra7: sata: Fix SATA with CONFIG_ARM_LPAE enabled
To:     Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     yan-liu@ti.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        "Nori, Sekhar" <nsekhar@ti.com>
References: <20200304090031.30360-1-rogerq@ti.com>
 <20200304162057.GV37466@atomide.com>
 <145c0448-ea33-8704-4fde-03fb180100d6@ti.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <00951cc4-6cbf-a3cf-5f2c-007d5b43ac5b@arm.com>
Date:   Thu, 5 Mar 2020 12:30:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <145c0448-ea33-8704-4fde-03fb180100d6@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/03/2020 12:05 pm, Roger Quadros wrote:
> Tony, Christoph,
> 
> On 04/03/2020 18:20, Tony Lindgren wrote:
>> * Roger Quadros <rogerq@ti.com> [200304 09:01]:
>>> Even though the TRM says that SATA IP has 36 address bits
>>> wired in the SoC, we see bus errors whenever any address
>>> greater than 32-bit is given to the controller.
>>>
>>> This happens on dra7-EVM with 4G of RAM with CONFIG_ARM_LPAE=y.
>>>
>>> As a workaround we limit the DMA address range to 32-bits
>>> for SATA.
>>>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Reported-by: Yan Liu <yan-liu@ti.com>
>>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>>> ---
>>>
>>> NOTE: Currently ARM dma-mapping code doesn't account for devices
>>> bus_dma_limit. This is fixed in [1].
>>>
>>> [1] https://lkml.org/lkml/2020/2/18/712
>>
>> So is this dts patch safe to apply without the series above?
>>
> 
> Yes. To my surprise this patch fixes the SATA issue even without [1].
> Without this patch dev->bus_dma_limit was being set to 0 and with the patch
> it is being set to 0xffffffff.

Right - LPAE configs should be getting dma-direct ops since 5.3, which 
already respect the limit. For non-LPAE configs it means you go from 
being broken from having no limit at all, to having a limit set but not 
respected, which is still equally broken, but no *more* so than before.

Robin.

>> And should this dts patch be applied as a fix or can it wait
>> until the merge window?
> 
> I think we should mark it for stable and apply it right away as fix for 
> v5.6.
> 
> Cc: stable@kernel.org
> 
> cheers,
> -roger
>>
>> Regards,
>>
>> Tony
>>
>>>   arch/arm/boot/dts/dra7.dtsi | 25 ++++++++++++++++---------
>>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
>>> index d78b684e7fca..895462c22d1c 100644
>>> --- a/arch/arm/boot/dts/dra7.dtsi
>>> +++ b/arch/arm/boot/dts/dra7.dtsi
>>> @@ -642,15 +642,22 @@
>>>           };
>>>           /* OCP2SCP3 */
>>> -        sata: sata@4a141100 {
>>> -            compatible = "snps,dwc-ahci";
>>> -            reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
>>> -            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>>> -            phys = <&sata_phy>;
>>> -            phy-names = "sata-phy";
>>> -            clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
>>> -            ti,hwmods = "sata";
>>> -            ports-implemented = <0x1>;
>>> +        sata_aux_bus {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <2>;
>>> +            compatible = "simple-bus";
>>> +            ranges = <0x0 0x4a140000 0x0 0x1200>;
>>> +            dma-ranges = <0x0 0x0 0x1 0x00000000>;
>>> +            sata: sata@4a141100 {
>>> +                compatible = "snps,dwc-ahci";
>>> +                reg = <0x0 0x0 0x1100>, <0x1100 0x0 0x7>;
>>> +                interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>>> +                phys = <&sata_phy>;
>>> +                phy-names = "sata-phy";
>>> +                clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
>>> +                ti,hwmods = "sata";
>>> +                ports-implemented = <0x1>;
>>> +            };
>>>           };
>>>           /* OCP2SCP1 */
>>> -- 
>>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>>
> 
