Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531051811C3
	for <lists+linux-omap@lfdr.de>; Wed, 11 Mar 2020 08:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgCKHUT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Mar 2020 03:20:19 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37048 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbgCKHUT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Mar 2020 03:20:19 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02B7K9mJ055887;
        Wed, 11 Mar 2020 02:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583911209;
        bh=2XfN97zGDMprK+/GnAZ4QQKqgfCDzQBygFK9oOWO4Gc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VtmtlSe6aqrvpaNdJhhjseJ/7U8Y5oh48kJrMWOXurK1Lv0A1wdp0BgEphPoiv9SG
         0ZfsGobVUh3FJVpJ0btaFTen5FK6Vk07JvWXMYaS/9qZ4smboA+TknO/bhTUD7tcE/
         8hqKniq6So8QQhtqU+pplnvjPCw5tNlGHm56FgIw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02B7K9BZ016479
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Mar 2020 02:20:09 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Mar 2020 02:20:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Mar 2020 02:20:09 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02B7K6YX052872;
        Wed, 11 Mar 2020 02:20:07 -0500
Subject: Re: [PATCH] ARM: dts: dra7: Add bus_dma_limit for L3 bus
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <hch@lst.de>, <robin.murphy@arm.com>, <robh+dt@kernel.org>,
        <nm@ti.com>, <nsekhar@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200310115309.31354-1-rogerq@ti.com>
 <e7df4db7-6fe1-cfa4-841b-ddd395864bb8@ti.com>
 <20200310154829.GS37466@atomide.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <d2e217a4-4a45-bc46-4610-84e6c8567d5f@ti.com>
Date:   Wed, 11 Mar 2020 09:20:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310154829.GS37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/03/2020 17:48, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [200310 14:46]:
>> On 10/03/2020 13:53, Roger Quadros wrote:
>>> The L3 interconnect can access only 32-bits of address.
>>> Add the dma-ranges property to reflect this limit.
>>>
>>> This will ensure that no device under L3 is
>>> given > 32-bit address for DMA.
>>>
>>> Issue was observed only with SATA on DRA7-EVM with 4GB RAM
>>> and CONFIG_ARM_LPAE enabled. This is because the controller
>>> can perform 64-bit DMA and was setting the dma_mask to 64-bit.
>>>
>>> Setting the correct bus_dma_limit fixes the issue.
>>
>> This seems kind of messy to modify almost every DT node because of this....
>> Are you sure this is the only way to get it done? No way to modify the sata
>> node only which is impacted somehow?
>>
>> Also, what if you just pass 0xffffffff to the dma-ranges property? That
>> would avoid modifying every node I guess.
> 
> Also, I think these interconnects are not limited to 32-bit access.

But from Table 2-1. L3_MAIN Memory Map

Start address	0x0000_0000
End address	0xFFFF_FFFF

So it is 32-bit limit, right?

> So yeah I too would prefer a top level dma-ranges property assuming
> that works.
> 
> I guess there dma-ranges should not be 0xffffffff though if
> limited to 2GB :)
> 
> Regards,
> 
> Tony
> 

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
