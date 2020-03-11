Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B56181189
	for <lists+linux-omap@lfdr.de>; Wed, 11 Mar 2020 08:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgCKHNb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Mar 2020 03:13:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33952 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgCKHNb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Mar 2020 03:13:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02B7DLYV041789;
        Wed, 11 Mar 2020 02:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583910801;
        bh=0YjQNOjI/Uoy3cXncI5ujknDbjJOtE5Hk2GYMVlQCQs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rG2u9V0hx4fwf4Me46T2rO8mG0A0p4eYL8Q9eC3UOXEqGdBEZ7CWmEyAGfhCummQK
         O57pUX7YBHAp0IkjMUHCt2W/837ePuoUSuBvI1bNebnm6ehWFhqvARK6xjtHlHhds+
         U/vnxooB/canxfgUN3HQX2VsKAPqwVRvMXL5wTI8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02B7DL4d105166
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Mar 2020 02:13:21 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Mar 2020 02:13:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Mar 2020 02:13:20 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02B7DIl4041900;
        Wed, 11 Mar 2020 02:13:18 -0500
Subject: Re: [PATCH] ARM: dts: dra7: Add bus_dma_limit for L3 bus
To:     Robin Murphy <robin.murphy@arm.com>,
        Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <hch@lst.de>, <robh+dt@kernel.org>, <nm@ti.com>, <nsekhar@ti.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200310115309.31354-1-rogerq@ti.com>
 <e7df4db7-6fe1-cfa4-841b-ddd395864bb8@ti.com>
 <20200310154829.GS37466@atomide.com>
 <b405ca5e-4abd-7ddc-ff76-560b6c7abf86@arm.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <80fbd54e-c2c6-8580-7dcb-cd80119ed3d0@ti.com>
Date:   Wed, 11 Mar 2020 09:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b405ca5e-4abd-7ddc-ff76-560b6c7abf86@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/03/2020 18:16, Robin Murphy wrote:
> On 10/03/2020 3:48 pm, Tony Lindgren wrote:
>> * Tero Kristo <t-kristo@ti.com> [200310 14:46]:
>>> On 10/03/2020 13:53, Roger Quadros wrote:
>>>> The L3 interconnect can access only 32-bits of address.
>>>> Add the dma-ranges property to reflect this limit.
>>>>
>>>> This will ensure that no device under L3 is
>>>> given > 32-bit address for DMA.
>>>>
>>>> Issue was observed only with SATA on DRA7-EVM with 4GB RAM
>>>> and CONFIG_ARM_LPAE enabled. This is because the controller
>>>> can perform 64-bit DMA and was setting the dma_mask to 64-bit.
>>>>
>>>> Setting the correct bus_dma_limit fixes the issue.
>>>
>>> This seems kind of messy to modify almost every DT node because of this....
>>> Are you sure this is the only way to get it done? No way to modify the sata
>>> node only which is impacted somehow?
>>>
>>> Also, what if you just pass 0xffffffff to the dma-ranges property? That
>>> would avoid modifying every node I guess.
>>
>> Also, I think these interconnects are not limited to 32-bit access.
>> So yeah I too would prefer a top level dma-ranges property assuming
>> that works.
>>
>> I guess there dma-ranges should not be 0xffffffff though if
>> limited to 2GB :)

Right, and the code expects it to not look like a mask.
 From of_dma_configure()

         ret = of_dma_get_range(np, &dma_addr, &paddr, &size);
	..
                 if (size & 1) {
                        dev_warn(dev, "Invalid size 0x%llx for dma-range\n",
                                  size);
                        size = size + 1;
                 }

> 
> It should work fine to just describe the Q3 and Q4 DDR regions as the DMA range, i.e.:
> 
>      ocp {
>          ...
>          dma-ranges = <0x80000000 0 0x80000000 0x80000000>;
>          ...
>      };
> 
> That would certainly be far less invasive :)

This is brilliant! Thanks :)

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
