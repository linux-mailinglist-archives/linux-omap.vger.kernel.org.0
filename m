Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC27817A4E2
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 13:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgCEMGI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 07:06:08 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36798 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgCEMGI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Mar 2020 07:06:08 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025C5wT8099985;
        Thu, 5 Mar 2020 06:05:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583409958;
        bh=TWp3S9CF5lmJGI7WNCRkfKVlRklSzi69IV1YHVJ3w5M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X1Y1bh9gMxY9u7Be5WVbsRKHgWh74HAyi20y47FaE61fYrsfhAMM599I9Veeeq5vb
         jhdOh7d9erR3jMLi9LFJgIJbwyO7+m14njrht2qtknQ1v2FwAqVRK2J0EHzEWKk3Fo
         P97wN4Y2BGyy695IyRp6d94WWCZ8pJTdFTF9Hz0k=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025C5wg3070466
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Mar 2020 06:05:58 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 06:05:58 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 06:05:58 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025C5uZN120032;
        Thu, 5 Mar 2020 06:05:56 -0600
Subject: Re: [PATCH] dra7: sata: Fix SATA with CONFIG_ARM_LPAE enabled
To:     Tony Lindgren <tony@atomide.com>, Christoph Hellwig <hch@lst.de>
CC:     <yan-liu@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Nori, Sekhar" <nsekhar@ti.com>
References: <20200304090031.30360-1-rogerq@ti.com>
 <20200304162057.GV37466@atomide.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <145c0448-ea33-8704-4fde-03fb180100d6@ti.com>
Date:   Thu, 5 Mar 2020 14:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304162057.GV37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony, Christoph,

On 04/03/2020 18:20, Tony Lindgren wrote:
> * Roger Quadros <rogerq@ti.com> [200304 09:01]:
>> Even though the TRM says that SATA IP has 36 address bits
>> wired in the SoC, we see bus errors whenever any address
>> greater than 32-bit is given to the controller.
>>
>> This happens on dra7-EVM with 4G of RAM with CONFIG_ARM_LPAE=y.
>>
>> As a workaround we limit the DMA address range to 32-bits
>> for SATA.
>>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Reported-by: Yan Liu <yan-liu@ti.com>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>>
>> NOTE: Currently ARM dma-mapping code doesn't account for devices
>> bus_dma_limit. This is fixed in [1].
>>
>> [1] https://lkml.org/lkml/2020/2/18/712
> 
> So is this dts patch safe to apply without the series above?
> 

Yes. To my surprise this patch fixes the SATA issue even without [1].
Without this patch dev->bus_dma_limit was being set to 0 and with the patch
it is being set to 0xffffffff.

> And should this dts patch be applied as a fix or can it wait
> until the merge window?

I think we should mark it for stable and apply it right away as fix for v5.6.

Cc: stable@kernel.org

cheers,
-roger
> 
> Regards,
> 
> Tony
> 
>>   arch/arm/boot/dts/dra7.dtsi | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
>> index d78b684e7fca..895462c22d1c 100644
>> --- a/arch/arm/boot/dts/dra7.dtsi
>> +++ b/arch/arm/boot/dts/dra7.dtsi
>> @@ -642,15 +642,22 @@
>>   		};
>>   
>>   		/* OCP2SCP3 */
>> -		sata: sata@4a141100 {
>> -			compatible = "snps,dwc-ahci";
>> -			reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
>> -			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>> -			phys = <&sata_phy>;
>> -			phy-names = "sata-phy";
>> -			clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
>> -			ti,hwmods = "sata";
>> -			ports-implemented = <0x1>;
>> +		sata_aux_bus {
>> +			#address-cells = <1>;
>> +			#size-cells = <2>;
>> +			compatible = "simple-bus";
>> +			ranges = <0x0 0x4a140000 0x0 0x1200>;
>> +			dma-ranges = <0x0 0x0 0x1 0x00000000>;
>> +			sata: sata@4a141100 {
>> +				compatible = "snps,dwc-ahci";
>> +				reg = <0x0 0x0 0x1100>, <0x1100 0x0 0x7>;
>> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>> +				phys = <&sata_phy>;
>> +				phy-names = "sata-phy";
>> +				clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
>> +				ti,hwmods = "sata";
>> +				ports-implemented = <0x1>;
>> +			};
>>   		};
>>   
>>   		/* OCP2SCP1 */
>> -- 
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
