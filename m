Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23158134942
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 18:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgAHRWn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jan 2020 12:22:43 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46904 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729748AbgAHRWm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jan 2020 12:22:42 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008HMeSi079024;
        Wed, 8 Jan 2020 11:22:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578504160;
        bh=B7+w3x4iIJFmJjAqcEoxk/XJdz9AYO3nH6fQdIWUxhw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lg7GLyecJtMMAXu53Md3rHVyyS3RKgosCQM+ZTinDJLIRqMP8m3Ol3mAvR/t3aFLp
         ZGRPZXB/2fL/sJSf7jxWKFKgOTW8MZRjCCj2wbKMFevuRl7wpPluXd43iIWnykWy8J
         eMhQKIP8hMa0+PcK1i+KtOx8sxvwSbwWF4ypElgA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008HMel8017811
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jan 2020 11:22:40 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 11:22:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 11:22:40 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008HMewU004762;
        Wed, 8 Jan 2020 11:22:40 -0600
Subject: Re: [PATCHv4 06/14] remoteproc/omap: Initialize and assign reserved
 memory node
To:     "Andrew F. Davis" <afd@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20200102131845.12992-1-t-kristo@ti.com>
 <20200102131845.12992-7-t-kristo@ti.com>
 <f380b7a7-cef5-bf56-2344-49b83a15422e@ti.com>
 <1a3fcb85-59d5-ebe4-fe3e-e9cc3311785a@ti.com>
 <e95d88ca-aa7f-8df4-a206-9f485d6f4cd0@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <a09ab277-373d-4e6f-d21a-ea821421327d@ti.com>
Date:   Wed, 8 Jan 2020 11:22:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e95d88ca-aa7f-8df4-a206-9f485d6f4cd0@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 1/7/20 8:37 AM, Andrew F. Davis wrote:
> On 1/7/20 9:25 AM, Tero Kristo wrote:
>> On 07/01/2020 15:37, Andrew F. Davis wrote:
>>> On 1/2/20 8:18 AM, Tero Kristo wrote:
>>>> From: Suman Anna <s-anna@ti.com>
>>>>
>>>> The reserved memory nodes are not assigned to platform devices by
>>>> default in the driver core to avoid the lookup for every platform
>>>> device and incur a penalty as the real users are expected to be
>>>> only a few devices.
>>>>
>>>> OMAP remoteproc devices fall into the above category and the OMAP
>>>> remoteproc driver _requires_ specific CMA pools to be assigned
>>>> for each device at the moment to align on the location of the
>>>> vrings and vring buffers in the RTOS-side firmware images. So,
>>>
>>>
>>> Requires only at the moment due to firmware..
>>>
>>> This sounds like some firmware images hard-coded their vring addresses
>>> instead of getting them dynamically as they should and we are hacking
>>> around that on the kernel side by giving them the addresses they use as
>>> carveouts.
>>
>> The firmwares are built on specific device addresses, this includes data
>> + code.
>>
>>> Should we rather make use of the IOMMU attached to the DSP to map any
>>> kernel address to the DSP where the firmware expects it? Or better yet
>>> fixup the firmwares.
>>
>> Well, we do use IOMMU to map the corresponding memory area to specific
>> device address. What this patch does, is to allocate a contiguous memory
>> area for the remoteproc shared memories. Using completely random memory
>> location would potentially fragment the remoteproc memory around page
>> boundaries, resulting in a complex (read ineffective) IOMMU mapping.
> 
> 
> Complex is not always ineffective, this is what the (IO)MMUs are for,
> memory gets fragmented on page boundaries, they put it back together,
> that's part of modern computing despite its crazy complexity. Shying
> away from that and just using big static memory carveouts for usecases
> like this (that could otherwise work without them) will not scale.

Not sure what your definition of static carveout is, but we are really
using device-specific CMA pool here, and rely on RSC_CARVEOUTs from the
resource table to allocate the memory from that pool. Obviously, this
cannot be a CMA pool and has to be a static carveout for early-boot
scenarios.

Note that our OMAP IOMMUs are very simple, they only can handle 32-bit
physical addresses, and actually cannot add any memory attributes, and
that is actually handled by another sub-module managed and controlled by
the remote processor. So, this does place some constraints in using a
generic CMA pool.

regards
Suman

> 
> 
>> Also, we are going to need the reserved memory mechanism for the
>> remoteproc anyways later, as we are going to introduce the support for
>> early-boot / late-attach. Bootloader would pass the used memory regions
>> to the kernel via the reserved memory nodes in that case (unless we
>> assume to use some hardcoded region, which would be worse than passing
>> it via DT.)
> 
> 
> This is a different case, I can see a more valid use here (although I'd
> argue passing bootloader generated software configuration like this to
> kernel is a gray area for DT, but I'll leave that for our DT maintainer
> friends).
> 
> At very least can we make the reserved memory node optional here?
> DSP/IPU Firmware can/should be made to work without it.
> 
> Andrew
> 
> 
>>
>> -Tero
>>
>>>
>>> DRAM carveouts should be a last resort used only for when hardware
>>> really requires it.
>>>
>>> Andrew
>>>
>>>
>>>> use the of_reserved_mem_device_init/release() API appropriately
>>>> to assign the corresponding reserved memory region to the OMAP
>>>> remoteproc device. Note that only one region per device is
>>>> allowed by the framework.
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>> ---
>>>>   drivers/remoteproc/omap_remoteproc.c | 12 +++++++++++-
>>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/omap_remoteproc.c
>>>> b/drivers/remoteproc/omap_remoteproc.c
>>>> index 9ca337f18ac2..8a6dd742a8b1 100644
>>>> --- a/drivers/remoteproc/omap_remoteproc.c
>>>> +++ b/drivers/remoteproc/omap_remoteproc.c
>>>> @@ -17,6 +17,7 @@
>>>>   #include <linux/module.h>
>>>>   #include <linux/err.h>
>>>>   #include <linux/of_device.h>
>>>> +#include <linux/of_reserved_mem.h>
>>>>   #include <linux/platform_device.h>
>>>>   #include <linux/dma-mapping.h>
>>>>   #include <linux/remoteproc.h>
>>>> @@ -480,14 +481,22 @@ static int omap_rproc_probe(struct
>>>> platform_device *pdev)
>>>>       if (ret)
>>>>           goto free_rproc;
>>>>   +    ret = of_reserved_mem_device_init(&pdev->dev);
>>>> +    if (ret) {
>>>> +        dev_err(&pdev->dev, "device does not have specific CMA
>>>> pool\n");
>>>> +        goto free_rproc;
>>>> +    }
>>>> +
>>>>       platform_set_drvdata(pdev, rproc);
>>>>         ret = rproc_add(rproc);
>>>>       if (ret)
>>>> -        goto free_rproc;
>>>> +        goto release_mem;
>>>>         return 0;
>>>>   +release_mem:
>>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>>   free_rproc:
>>>>       rproc_free(rproc);
>>>>       return ret;
>>>> @@ -499,6 +508,7 @@ static int omap_rproc_remove(struct
>>>> platform_device *pdev)
>>>>         rproc_del(rproc);
>>>>       rproc_free(rproc);
>>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>>         return 0;
>>>>   }
>>>>
>>
>> -- 
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

