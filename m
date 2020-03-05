Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D31417AACC
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 17:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgCEQq6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 11:46:58 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34580 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgCEQq6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Mar 2020 11:46:58 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025GkkKE102543;
        Thu, 5 Mar 2020 10:46:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583426806;
        bh=dLFUF+hs+lohm/Cy6tRRvf897Y3mN6z0nkcwCI41Suc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L82TiN1RIfnn7kmuwg7lIQk58WqJrf2UENT7X++AbV7KhQr6RrLWHAto6743DqU10
         29Z21bS0cz0D515Ns09f10dXHBcDpVzO6Gp82bMWGKK0jwoaF+LdQnt8uQqGHjbXCb
         uLhMST0d/sfxrGm2/Zri8vPmMzIFMMzWm0SkPiIA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025Gkk6G047305
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Mar 2020 10:46:46 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 10:46:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 10:46:45 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025Gkhkl105579;
        Thu, 5 Mar 2020 10:46:43 -0600
Subject: Re: [PATCH] dra7: sata: Fix SATA with CONFIG_ARM_LPAE enabled
To:     Robin Murphy <robin.murphy@arm.com>, <tony@atomide.com>,
        Nishanth Menon <nm@ti.com>
CC:     <yan-liu@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Rob Herring <robh+dt@kernel.org>,
        "Nori, Sekhar" <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20200304090031.30360-1-rogerq@ti.com>
 <9cc75c26-bd8c-03ea-8f8d-7784fffb7a0a@arm.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <eb4e97f2-9afd-41a9-e239-88798c326a86@ti.com>
Date:   Thu, 5 Mar 2020 18:46:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9cc75c26-bd8c-03ea-8f8d-7784fffb7a0a@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

+Nishanth

Robin,

On 05/03/2020 18:04, Robin Murphy wrote:
> On 04/03/2020 9:00 am, Roger Quadros wrote:
>> Even though the TRM says that SATA IP has 36 address bits
>> wired in the SoC, we see bus errors whenever any address
>> greater than 32-bit is given to the controller.
> 
> Actually, is it really just SATA? I pulled up a couple of DRA7xx TRMs out of curiosity - thanks for having such easy-to-access documentation by the way :) - and they both give me a clear impression that the entire L3_MAIN interconnect is limited to 32-bit addresses and thus pretty much all the DMA masters should only be able to touch the lower 2GB of DRAM. Especially the bit that explicitly says "This is a high address range (Q8 – Q15) that requires an address greater than 32 bits. This space is visible only for the MPU Subsystem."

You are right that L3 interconnect can only access first 2GB of DRAM.
Which means we should add the bus_dma_limit to the entire L3 bus
instead of just SATA?

> 
> Is it in fact the case that the SATA driver happens to be the only one to set a >32-bit DMA mask on your system?

This looks like the case. Other device drivers might not be overriding
dma_mask at all thus using the default 32-bit dma_mask.

cheers,
-roger

> 
> Robin.
> 
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
>>
>>   arch/arm/boot/dts/dra7.dtsi | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
>> index d78b684e7fca..895462c22d1c 100644
>> --- a/arch/arm/boot/dts/dra7.dtsi
>> +++ b/arch/arm/boot/dts/dra7.dtsi
>> @@ -642,15 +642,22 @@
>>           };
>>           /* OCP2SCP3 */
>> -        sata: sata@4a141100 {
>> -            compatible = "snps,dwc-ahci";
>> -            reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
>> -            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>> -            phys = <&sata_phy>;
>> -            phy-names = "sata-phy";
>> -            clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
>> -            ti,hwmods = "sata";
>> -            ports-implemented = <0x1>;
>> +        sata_aux_bus {
>> +            #address-cells = <1>;
>> +            #size-cells = <2>;
>> +            compatible = "simple-bus";
>> +            ranges = <0x0 0x4a140000 0x0 0x1200>;
>> +            dma-ranges = <0x0 0x0 0x1 0x00000000>;
>> +            sata: sata@4a141100 {
>> +                compatible = "snps,dwc-ahci";
>> +                reg = <0x0 0x0 0x1100>, <0x1100 0x0 0x7>;
>> +                interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>> +                phys = <&sata_phy>;
>> +                phy-names = "sata-phy";
>> +                clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
>> +                ti,hwmods = "sata";
>> +                ports-implemented = <0x1>;
>> +            };
>>           };
>>           /* OCP2SCP1 */
>>

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
