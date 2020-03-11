Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDB711817F1
	for <lists+linux-omap@lfdr.de>; Wed, 11 Mar 2020 13:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgCKMZQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Mar 2020 08:25:16 -0400
Received: from foss.arm.com ([217.140.110.172]:48968 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729095AbgCKMZP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Mar 2020 08:25:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF633FEC;
        Wed, 11 Mar 2020 05:25:14 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 895E63F7B4;
        Wed, 11 Mar 2020 05:25:12 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: dra7: Add bus_dma_limit for L3 bus
To:     Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
        Tero Kristo <t-kristo@ti.com>
Cc:     hch@lst.de, robh+dt@kernel.org, nm@ti.com, nsekhar@ti.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@ti.com>,
        "Anna, Suman" <s-anna@ti.com>
References: <20200310115309.31354-1-rogerq@ti.com>
 <e7df4db7-6fe1-cfa4-841b-ddd395864bb8@ti.com>
 <20200310154829.GS37466@atomide.com>
 <b405ca5e-4abd-7ddc-ff76-560b6c7abf86@arm.com>
 <80fbd54e-c2c6-8580-7dcb-cd80119ed3d0@ti.com>
 <25eaa8b7-f341-0816-3544-3ab1686de637@ti.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <388b3a2b-f847-0d1b-e725-c3cbfcf624e3@arm.com>
Date:   Wed, 11 Mar 2020 12:25:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <25eaa8b7-f341-0816-3544-3ab1686de637@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-03-11 10:28 am, Roger Quadros wrote:
> 
> 
> On 11/03/2020 09:13, Roger Quadros wrote:
>>
>>
>> On 10/03/2020 18:16, Robin Murphy wrote:
>>> On 10/03/2020 3:48 pm, Tony Lindgren wrote:
>>>> * Tero Kristo <t-kristo@ti.com> [200310 14:46]:
>>>>> On 10/03/2020 13:53, Roger Quadros wrote:
>>>>>> The L3 interconnect can access only 32-bits of address.
>>>>>> Add the dma-ranges property to reflect this limit.
>>>>>>
>>>>>> This will ensure that no device under L3 is
>>>>>> given > 32-bit address for DMA.
>>>>>>
>>>>>> Issue was observed only with SATA on DRA7-EVM with 4GB RAM
>>>>>> and CONFIG_ARM_LPAE enabled. This is because the controller
>>>>>> can perform 64-bit DMA and was setting the dma_mask to 64-bit.
>>>>>>
>>>>>> Setting the correct bus_dma_limit fixes the issue.
>>>>>
>>>>> This seems kind of messy to modify almost every DT node because of 
>>>>> this....
>>>>> Are you sure this is the only way to get it done? No way to modify 
>>>>> the sata
>>>>> node only which is impacted somehow?
>>>>>
>>>>> Also, what if you just pass 0xffffffff to the dma-ranges property? 
>>>>> That
>>>>> would avoid modifying every node I guess.
>>>>
>>>> Also, I think these interconnects are not limited to 32-bit access.
>>>> So yeah I too would prefer a top level dma-ranges property assuming
>>>> that works.
>>>>
>>>> I guess there dma-ranges should not be 0xffffffff though if
>>>> limited to 2GB :)
>>
>> Right, and the code expects it to not look like a mask.
>>  From of_dma_configure()
>>
>>          ret = of_dma_get_range(np, &dma_addr, &paddr, &size);
>>      ..
>>                  if (size & 1) {
>>                         dev_warn(dev, "Invalid size 0x%llx for 
>> dma-range\n",
>>                                   size);
>>                         size = size + 1;
>>                  }
>>
>>>
>>> It should work fine to just describe the Q3 and Q4 DDR regions as the 
>>> DMA range, i.e.:
>>>
>>>      ocp {
>>>          ...
>>>          dma-ranges = <0x80000000 0 0x80000000 0x80000000>;
>>>          ...
>>>      };
>>>
>>> That would certainly be far less invasive :)
>>
>> This is brilliant! Thanks :)
>>
> 
> I noticed that all devices are not getting the right bus_dma_limit (see 
> kernel log at end).

Hmm, looks like those are all nodes with one or more intermediate levels 
between them and &ocp - if you have the bus_dma_mask -> bus_dma_limit 
change then presumably your kernel also contains 81db12ee15cb 
("of/address: Translate 'dma-ranges' for parent nodes missing 
'dma-ranges'")? I thought that was supposed to allow things like this to 
work without having to explicitly add "dma-ranges;" to all those 
intermediate nodes as well, but seemingly that isn't happening...

Enabling the debug prints from drivers/of/address.c should hopefully 
give enough to narrow down where and why of_dma_get_range() is giving up 
for these nodes (be warned there will be a *lot* of noise to sift through).

Robin.

> At least the following devices should be fixed right? Any other devices 
> I missed?
> 
> [    1.264194] omap-dma-engine 4a056000.dma-controller: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> 
> [    4.583356] omap-iommu 40d01000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.605865] omap-iommu 40d02000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.659729] omap-iommu 55082000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.682122] omap-iommu 41501000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.704553] omap-iommu 41502000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> 
> [    4.234731] sdhci-omap 4809c000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.257030] sdhci-omap 480b4000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.298030] sdhci-omap 480d1000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    2.562873] dra7-pcie 51000000.pcie: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> 
> [   10.944741] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   10.955211] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> 
> cheers,
> -roger
> 
> 
> full list
> 
> [    0.286523] omap_l3_noc 44000000.ocp: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [    0.323023] sram 40300000.ocmcram: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [    0.365861] edma3-tptc 43400000.tptc: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [    0.374205] edma3-tptc 43500000.tptc: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [    0.382739] edma 43300000.edma: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [    0.415732] reg-fixed-voltage fixedregulator-evm_12v0: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    0.425130] reg-fixed-voltage fixedregulator-evm_1v8: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    0.434425] reg-fixed-voltage fixedregulator-sd: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    0.443154] reg-fixed-voltage fixedregulator-evm_3v3_sw: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    0.452704] reg-fixed-voltage fixedregulator-aic_dvdd: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    0.462128] reg-fixed-voltage fixedregulator-evm3v3: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    0.475522] reg-fixed-voltage fixedregulator-evm_5v0: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    0.488967] reg-fixed-voltage fixedregulator-evm_3v6: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    0.502370] reg-fixed-voltage fixedregulator-mmcwl: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    0.511344] reg-fixed-voltage fixedregulator-vtt: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.126761] armv7-pmu pmu: coherent_dma_mask ffffffff bus_dma_limit 0
> [    1.205964] ti-sysc 4a002000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.216197] ti-dma-crossbar 4a002b78.dma-router: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.225136] ti-dma-crossbar 4a002c78.dma-router: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.233950] ti-sysc 4a005000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.243850] ti-sysc 4a008000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.255339] ti-sysc 4a056000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.264194] omap-dma-engine 4a056000.dma-controller: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    1.301417] ti-sysc 4a080000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.310052] omap-ocp2scp 4a080000.ocp2scp: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.319096] ti-sysc 4a090000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.327664] omap-ocp2scp 4a090000.ocp2scp: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.336484] ti-sysc 4a0d9038.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.344789] ti-sysc 4a0dd038.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.353077] ti-sysc 4a0f4000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.361397] ti-sysc 4a0f6000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.369973] ti-sysc 4ae06000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.381433] ti-sysc 4ae0c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.389923] ti-sysc 4ae10000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.398621] omap_gpio 4ae10000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.410819] ti-sysc 4ae14000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.420131] ti-sysc 4ae20000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.428888] ti-sysc 4ae2b050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.437346] ti-sysc 4ae3c020.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.445970] ti-sysc 48020050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.454620] ti-sysc 48032000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.463231] ti-sysc 48034000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.471827] ti-sysc 48036000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.480417] ti-sysc 4803e000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.489001] ti-sysc 48051000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.497542] omap_gpio 48051000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.505504] ti-sysc 48053000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.514201] omap_gpio 48053000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.522119] ti-sysc 48055000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.530792] omap_gpio 48055000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.538700] ti-sysc 48057000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.547362] omap_gpio 48057000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.555278] ti-sysc 48059000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.563950] omap_gpio 48059000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.571856] ti-sysc 4805b000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.580533] omap_gpio 4805b000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.588444] ti-sysc 4805d000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.597098] omap_gpio 4805d000.gpio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.605010] ti-sysc 48060000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.613570] omap_i2c 48060000.i2c: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.627029] ti-sysc 48066050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.635352] ti-sysc 48068050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.643693] ti-sysc 4806a050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.652326] ti-sysc 4806c050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.660962] ti-sysc 4806e050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.669281] ti-sysc 48070000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.677833] omap_i2c 48070000.i2c: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.723570] palmas-pmic 48070000.i2c:tps659038@58:tps659038_pmic: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    1.852826] ti-sysc 48072000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.861432] omap_i2c 48072000.i2c: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    1.913194] ti-sysc 48078000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.921817] ti-sysc 4807a000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.930136] ti-sysc 4807c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.938463] ti-sysc 48086000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.947040] ti-sysc 48088000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.955640] ti-sysc 48091fe0.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.964262] ti-sysc 48098000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.972874] ti-sysc 4809a000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.981478] ti-sysc 4809c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.990191] ti-sysc 480a5030.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    1.998831] ti-sysc 480ad000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.007126] ti-sysc 480b2000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.015732] ti-sysc 480b4000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.024397] ti-sysc 480b8000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.032706] ti-sysc 480ba000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.041016] ti-sysc 480d1000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.049674] ti-sysc 48420050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.058001] ti-sysc 48422050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.066302] ti-sysc 48424050.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.074617] ti-sysc 4843c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.083140] ti-sysc 4843e000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.091459] ti-sysc 48440000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.099776] ti-sysc 48442000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.108088] ti-sysc 48460000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.116415] ti-sysc 48464000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.124742] ti-sysc 48468000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.133469] ti-sysc 4846c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.141786] ti-sysc 48470000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.150105] ti-sysc 48474000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.158421] ti-sysc 48478000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.166719] ti-sysc 4847c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.175035] ti-sysc 48480020.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.183342] ti-sysc 48485200.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.192236] ti-sysc 48802000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.200571] ti-sysc 48820000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.209169] ti-sysc 48822000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.217768] ti-sysc 48824000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.226640] ti-sysc 48826000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.235368] ti-sysc 48828000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.243989] ti-sysc 4882a000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.252585] ti-sysc 4882c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.261176] ti-sysc 4882e000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.269762] ti-sysc 48838074.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.278672] ti-sysc 4883a000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.286972] ti-sysc 4883c000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.295283] ti-sysc 4883e000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.303599] ti-sysc 48840000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.312384] ti-sysc 48842000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.321164] ti-sysc 48844000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.329478] ti-sysc 48846000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.337787] ti-sysc 4885e000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.346085] ti-sysc 48860000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.354397] ti-sysc 48862000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.362704] ti-sysc 48864000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.371014] ti-sysc 48880000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.379707] ti-sysc 488c0000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.388368] ti-sysc 48900000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.396669] ti-sysc 48940000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.404974] ti-sysc 489d0010.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.413835] ti-sysc 40d01000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.422743] ti-sysc 40d02000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.431628] ti-sysc 58882000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.440531] ti-sysc 55082000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.449459] ti-sysc 5600fe00.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.458381] ti-sysc 4b500080.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.467554] ti-sysc 4b700080.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.476728] ti-sysc 4b101100.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.485905] ti-sysc 41501000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.494817] ti-sysc 41502000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    2.504711] ti-pipe3 4a084400.phy: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    2.512311] ti-pipe3 4a094000.pciephy: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    2.520403] ti-pipe3 4a096000.phy: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    2.528429] phy-gmii-sel 4a002554.phy-gmii-sel: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.537864] pinctrl-single 4a003400.pinmux: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    2.553170] ti-iodelay 4844a000.padconf: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [    2.562873] dra7-pcie 51000000.pcie: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.702194] dra7-atl 4843c000.atl: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.710396] omap_prm 4ae06400.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.717831] omap_prm 4ae06500.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.725243] omap_prm 4ae06700.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.732669] omap_prm 4ae06f00.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.740097] omap_prm 4ae07b00.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.747507] omap_prm 4ae07b40.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.754931] omap_prm 4ae07b80.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.762354] omap_prm 4ae07bc0.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.769777] omap_prm 4ae07c00.prm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.778520] pbias-regulator 4a002e00.pbias_regulator: 
> coherent_dma_mask ffffffff bus_dma_limit 0
> [    3.801322] ti_abb 4ae07ddc.regulator-abb-mpu: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    3.810628] ti_abb 4ae07e34.regulator-abb-ivahd: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    3.820099] ti_abb 4ae07e30.regulator-abb-dspeve: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    3.829648] ti_abb 4ae07de4.regulator-abb-gpu: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    3.847872] omap8250 48020000.serial: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.865171] omap8250 4806a000.serial: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.900927] omap8250 4806c000.serial: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    3.938464] ahci 4a140000.sata: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [    4.014880] omap-elm 48078000.elm: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.022584] omap2_mcspi 48098000.spi: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.030387] omap2_mcspi 4809a000.spi: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.045347] cpsw 48484000.ethernet: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.053085] davinci_mdio 48485000.mdio: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.186373] ti-soc-thermal 4a0021e0.bandgap: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.197942] ti_opp_supply 4a003b20.opp-supply: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.234731] sdhci-omap 4809c000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.257030] sdhci-omap 480b4000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.298030] sdhci-omap 480d1000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.319188] omap_timer 4ae20000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.326842] omap_timer 48032000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.334480] omap_timer 48034000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.342121] omap_timer 48036000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.355045] omap_timer 4803e000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.362722] omap_timer 48086000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.370359] omap_timer 48088000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.378020] omap_timer 48820000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.385638] omap_timer 48822000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.393338] omap_timer 48824000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.401054] omap_timer 48826000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.408682] omap_timer 48828000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.416299] omap_timer 4882a000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.423926] omap_timer 4882c000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.431564] omap_timer 4882e000.timer: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.542727] reg-fixed-voltage fixedregulator-sd: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    4.551676] reg-fixed-voltage fixedregulator-mmcwl: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    4.560659] reg-fixed-voltage fixedregulator-vtt: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [    4.574085] ti-sysc 40d01000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.583356] omap-iommu 40d01000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.596839] ti-sysc 40d02000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.605865] omap-iommu 40d02000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.619137] ti-sysc 58882000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.650679] ti-sysc 55082000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.659729] omap-iommu 55082000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.673050] ti-sysc 41501000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.682122] omap-iommu 41501000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.695553] ti-sysc 41502000.target-module: coherent_dma_mask 
> ffffffff bus_dma_limit ffffffff
> [    4.704553] omap-iommu 41502000.mmu: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.718193] sdhci-omap 4809c000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    4.794819] sdhci-omap 480d1000.mmc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    9.595632] omap_rng 48090000.rng: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [    9.816725] omap-des 480a5000.des: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activati[    9.884459] 
> omap_hdq 480b2000.1w: coherent_dma_mask ffffffff bus_dma_limit 0
> [   10.387555] davinci-mcasp 48468000.mcasp: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   10.601762] omap_rtc 48838000.rtc: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   10.690955] omap-mailbox 48840000.mailbox: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   10.705329] omap-mailbox 48842000.mailbox: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   10.944741] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   10.955211] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   11.363422] omap-usb2 4a084000.phy: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   11.371219] omap-usb2 4a085000.phy: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   11.379847] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   11.388227] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.168625] ti-qspi 4b300000.spi: coherent_dma_mask ffffffff 
> bus_dma_limit ffffffff
> [   12.191757] omap-sham 4b101000.sham: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   12.222185] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.230552] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.383690] omap-aes 4b500000.aes: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   12.515766] omap_wdt 4ae14000.wdt: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   12.577845] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.586136] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.637362] c_can_platform 4ae3c000.can: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   12.659521] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.668206] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.771243] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.779655] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.820295] extcon-usb-gpio extcon_usb1: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   12.841609] extcon-usb-gpio extcon_usb2: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   12.850013] omap-dwc3 48880000.omap_dwc3_1: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   12.866441] omap-aes 4b700000.aes: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   12.880846] omap-dwc3 488c0000.omap_dwc3_2: coherent_dma_mask 
> ffffffff bus_dma_limit 0
> [   13.014297] gpio-keys gpio_keys: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   13.033599] leds-gpio leds: coherent_dma_mask ffffffff bus_dma_limit 0
> [   13.063978] asoc-simple-card sound0: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   14.294633] dwc3 48890000.usb: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> [   14.328563] dwc3 488d0000.usb: coherent_dma_mask ffffffff 
> bus_dma_limit 0
> 
