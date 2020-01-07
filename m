Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 567AE132913
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 15:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgAGOhL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 09:37:11 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54712 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbgAGOhL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 09:37:11 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007Eb9UN009479;
        Tue, 7 Jan 2020 08:37:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578407829;
        bh=YgGSzprZT125RtCJvkZ/hvT+sodJn5nabPsNInBAm6k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AWpfBKjpPokmiZp2/EGjnupGenGQQBYq4nQ1mr1aKyOfHHoSpBZLsh8kPAQK7C0qc
         Pvt4fI3RiWenw+9YScFmVe2uyorf/glOQpNzBFrr/BdgLcG5zCRzpHcXqoum7fHo3z
         bOEs3uE4ucsfApwiopNiQcrxc5IHEcamYy36QONo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007Eb9t4085873;
        Tue, 7 Jan 2020 08:37:09 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 08:37:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 08:37:09 -0600
Received: from [10.250.65.50] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007Eb8ha048731;
        Tue, 7 Jan 2020 08:37:09 -0600
Subject: Re: [PATCHv4 06/14] remoteproc/omap: Initialize and assign reserved
 memory node
To:     Tero Kristo <t-kristo@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>, <s-anna@ti.com>
References: <20200102131845.12992-1-t-kristo@ti.com>
 <20200102131845.12992-7-t-kristo@ti.com>
 <f380b7a7-cef5-bf56-2344-49b83a15422e@ti.com>
 <1a3fcb85-59d5-ebe4-fe3e-e9cc3311785a@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <e95d88ca-aa7f-8df4-a206-9f485d6f4cd0@ti.com>
Date:   Tue, 7 Jan 2020 09:37:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1a3fcb85-59d5-ebe4-fe3e-e9cc3311785a@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 1/7/20 9:25 AM, Tero Kristo wrote:
> On 07/01/2020 15:37, Andrew F. Davis wrote:
>> On 1/2/20 8:18 AM, Tero Kristo wrote:
>>> From: Suman Anna <s-anna@ti.com>
>>>
>>> The reserved memory nodes are not assigned to platform devices by
>>> default in the driver core to avoid the lookup for every platform
>>> device and incur a penalty as the real users are expected to be
>>> only a few devices.
>>>
>>> OMAP remoteproc devices fall into the above category and the OMAP
>>> remoteproc driver _requires_ specific CMA pools to be assigned
>>> for each device at the moment to align on the location of the
>>> vrings and vring buffers in the RTOS-side firmware images. So,
>>
>>
>> Requires only at the moment due to firmware..
>>
>> This sounds like some firmware images hard-coded their vring addresses
>> instead of getting them dynamically as they should and we are hacking
>> around that on the kernel side by giving them the addresses they use as
>> carveouts.
> 
> The firmwares are built on specific device addresses, this includes data
> + code.
> 
>> Should we rather make use of the IOMMU attached to the DSP to map any
>> kernel address to the DSP where the firmware expects it? Or better yet
>> fixup the firmwares.
> 
> Well, we do use IOMMU to map the corresponding memory area to specific
> device address. What this patch does, is to allocate a contiguous memory
> area for the remoteproc shared memories. Using completely random memory
> location would potentially fragment the remoteproc memory around page
> boundaries, resulting in a complex (read ineffective) IOMMU mapping.


Complex is not always ineffective, this is what the (IO)MMUs are for,
memory gets fragmented on page boundaries, they put it back together,
that's part of modern computing despite its crazy complexity. Shying
away from that and just using big static memory carveouts for usecases
like this (that could otherwise work without them) will not scale.


> Also, we are going to need the reserved memory mechanism for the
> remoteproc anyways later, as we are going to introduce the support for
> early-boot / late-attach. Bootloader would pass the used memory regions
> to the kernel via the reserved memory nodes in that case (unless we
> assume to use some hardcoded region, which would be worse than passing
> it via DT.)


This is a different case, I can see a more valid use here (although I'd
argue passing bootloader generated software configuration like this to
kernel is a gray area for DT, but I'll leave that for our DT maintainer
friends).

At very least can we make the reserved memory node optional here?
DSP/IPU Firmware can/should be made to work without it.

Andrew


> 
> -Tero
> 
>>
>> DRAM carveouts should be a last resort used only for when hardware
>> really requires it.
>>
>> Andrew
>>
>>
>>> use the of_reserved_mem_device_init/release() API appropriately
>>> to assign the corresponding reserved memory region to the OMAP
>>> remoteproc device. Note that only one region per device is
>>> allowed by the framework.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>   drivers/remoteproc/omap_remoteproc.c | 12 +++++++++++-
>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/omap_remoteproc.c
>>> b/drivers/remoteproc/omap_remoteproc.c
>>> index 9ca337f18ac2..8a6dd742a8b1 100644
>>> --- a/drivers/remoteproc/omap_remoteproc.c
>>> +++ b/drivers/remoteproc/omap_remoteproc.c
>>> @@ -17,6 +17,7 @@
>>>   #include <linux/module.h>
>>>   #include <linux/err.h>
>>>   #include <linux/of_device.h>
>>> +#include <linux/of_reserved_mem.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/dma-mapping.h>
>>>   #include <linux/remoteproc.h>
>>> @@ -480,14 +481,22 @@ static int omap_rproc_probe(struct
>>> platform_device *pdev)
>>>       if (ret)
>>>           goto free_rproc;
>>>   +    ret = of_reserved_mem_device_init(&pdev->dev);
>>> +    if (ret) {
>>> +        dev_err(&pdev->dev, "device does not have specific CMA
>>> pool\n");
>>> +        goto free_rproc;
>>> +    }
>>> +
>>>       platform_set_drvdata(pdev, rproc);
>>>         ret = rproc_add(rproc);
>>>       if (ret)
>>> -        goto free_rproc;
>>> +        goto release_mem;
>>>         return 0;
>>>   +release_mem:
>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>   free_rproc:
>>>       rproc_free(rproc);
>>>       return ret;
>>> @@ -499,6 +508,7 @@ static int omap_rproc_remove(struct
>>> platform_device *pdev)
>>>         rproc_del(rproc);
>>>       rproc_free(rproc);
>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>         return 0;
>>>   }
>>>
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
