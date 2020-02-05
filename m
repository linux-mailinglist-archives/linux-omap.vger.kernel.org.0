Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 243951527A8
	for <lists+linux-omap@lfdr.de>; Wed,  5 Feb 2020 09:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgBEIvk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Feb 2020 03:51:40 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38898 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbgBEIvk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Feb 2020 03:51:40 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0158pcm6023014;
        Wed, 5 Feb 2020 02:51:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580892698;
        bh=yTfHSsngy81/FiSFeYlD8zOqhz6ygnQhzG6oRut5CFk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PHV3PEpvJmR+alFcltgLrgbEd7WTAVuKpE3Kr8P1mf2+r0qHLz3Mlc1VEnYZQ9gs5
         fRevF1GkW2WlLl0eZZJG2gPse6pQp4a18AiMRsEEwJZNet6mfH2E1j3gKm3jrdLMYz
         OJUT7nywDR57KbkGXW6AxUG0om92I2iNfNlcnbgQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0158pceH088997
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Feb 2020 02:51:38 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 5 Feb
 2020 02:51:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 5 Feb 2020 02:51:37 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0158pYar028735;
        Wed, 5 Feb 2020 02:51:35 -0600
Subject: Re: [PATCHv5 06/14] remoteproc/omap: Initialize and assign reserved
 memory node
To:     "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20200116135332.7819-1-t-kristo@ti.com>
 <20200116135332.7819-7-t-kristo@ti.com>
 <249c293c-6a23-165f-1df5-4859ee47658a@ti.com>
 <37db5d57-b1cd-1cec-2c9b-31c49e3bdc10@ti.com>
 <a0e85451-7c05-884c-4997-b4e8c5684c3e@ti.com>
 <2aaa4024-1e2c-5cab-c9f3-3be59c57e9ac@ti.com>
 <be337641-b4ac-d2be-b814-55b7681cb91a@ti.com>
 <7aed7a9f-3546-f622-37ac-34d33ddb4298@ti.com>
 <50c69e97-034b-3160-e95e-97aec2e75cc6@ti.com>
 <cf6fff1c-fde9-67b0-3173-7e019ce587cb@ti.com>
 <127eff13-cc16-2b59-d8ce-06e61bb910bc@ti.com>
 <39b3e536-26a9-e7da-a39a-db2853e0fe04@ti.com>
 <a92ab534-1525-f7d6-d29b-361809e0cae1@ti.com>
 <279b6f35-a316-94dd-af62-2891815cf453@ti.com>
 <2d7eeb94-ecb8-1e88-412b-215125c594fc@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <df565e1e-662a-86d2-1120-dfc437fe42d4@ti.com>
Date:   Wed, 5 Feb 2020 10:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2d7eeb94-ecb8-1e88-412b-215125c594fc@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 31/01/2020 01:04, Andrew F. Davis wrote:
> On 1/30/20 5:06 PM, Suman Anna wrote:
>> On 1/30/20 3:57 PM, Suman Anna wrote:
>>> On 1/30/20 3:50 PM, Andrew F. Davis wrote:
>>>> On 1/30/20 4:39 PM, Suman Anna wrote:
>>>>> On 1/30/20 3:19 PM, Andrew F. Davis wrote:
>>>>>> On 1/30/20 3:39 PM, Suman Anna wrote:
>>>>>>> On 1/30/20 2:22 PM, Andrew F. Davis wrote:
>>>>>>>> On 1/30/20 2:55 PM, Suman Anna wrote:
>>>>>>>>> On 1/30/20 1:42 PM, Tero Kristo wrote:
>>>>>>>>>> On 30/01/2020 21:20, Andrew F. Davis wrote:
>>>>>>>>>>> On 1/30/20 2:18 PM, Tero Kristo wrote:
>>>>>>>>>>>> On 30/01/2020 20:11, Andrew F. Davis wrote:
>>>>>>>>>>>>> On 1/16/20 8:53 AM, Tero Kristo wrote:
>>>>>>>>>>>>>> From: Suman Anna <s-anna@ti.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The reserved memory nodes are not assigned to platform devices by
>>>>>>>>>>>>>> default in the driver core to avoid the lookup for every platform
>>>>>>>>>>>>>> device and incur a penalty as the real users are expected to be
>>>>>>>>>>>>>> only a few devices.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> OMAP remoteproc devices fall into the above category and the OMAP
>>>>>>>>>>>>>> remoteproc driver _requires_ specific CMA pools to be assigned
>>>>>>>>>>>>>> for each device at the moment to align on the location of the
>>>>>>>>>>>>>> vrings and vring buffers in the RTOS-side firmware images. So,
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Same comment as before, this is a firmware issue for only some
>>>>>>>>>>>>> firmwares
>>>>>>>>>>>>> that do not handle being assigned vring locations correctly and instead
>>>>>>>>>>>>> hard-code them.
>>>>>>>>>
>>>>>>>>> As for this statement, this can do with some updating. Post 4.20,
>>>>>>>>> because of the lazy allocation scheme used for carveouts including the
>>>>>>>>> vrings, the resource tables now have to use FW_RSC_ADDR_ANY and will
>>>>>>>>> have to wait for the vdev synchronization to happen.
>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> I believe we discussed this topic in length in previous version but
>>>>>>>>>>>> there was no conclusion on it.
>>>>>>>>>>>>
>>>>>>>>>>>> The commit desc might be a bit misleading, we are not actually forced to
>>>>>>>>>>>> use specific CMA buffers, as we use IOMMU to map these to device
>>>>>>>>>>>> addresses. For example IPU1/IPU2 use internally exact same memory
>>>>>>>>>>>> addresses, iommu is used to map these to specific CMA buffer.
>>>>>>>>>>>>
>>>>>>>>>>>> CMA buffers are mostly used so that we get aligned large chunk of memory
>>>>>>>>>>>> which can be mapped properly with the limited IOMMU OMAP family of chips
>>>>>>>>>>>> have. Not sure if there is any sane way to get this done in any other
>>>>>>>>>>>> manner.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Why not use the default CMA area?
>>>>>>>>>>
>>>>>>>>>> I think using default CMA area getting the actual memory block is not
>>>>>>>>>> guaranteed and might fail. There are other users for the memory, and it
>>>>>>>>>> might get fragmented at the very late phase we are grabbing the memory
>>>>>>>>>> (omap remoteproc driver probe time.) Some chunks we need are pretty large.
>>>>>>>>>>
>>>>>>>>>> I believe I could experiment with this a bit though and see, or Suman
>>>>>>>>>> could maybe provide feedback why this was designed initially like this
>>>>>>>>>> and why this would not be a good idea.
>>>>>>>>>
>>>>>>>>> I have given some explanation on this on v4 as well, but if it is not
>>>>>>>>> clear, there are restrictions with using default CMA. Default CMA has
>>>>>>>>> switched to be assigned from the top of the memory (higher addresses,
>>>>>>>>> since 3.18 IIRC), and the MMUs on IPUs and DSPs can only address
>>>>>>>>> 32-bits. So, we cannot blindly use the default CMA pool, and this will
>>>>>>>>> definitely not work on boards > 2 GB RAM. And, if you want to add in any
>>>>>>>>> firewall capability, then specific physical addresses becomes mandatory.
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> If you need 32bit range allocations then
>>>>>>>> dma_set_mask(dev, DMA_BIT_MASK(32));
>>>>>>>>
>>>>>>>> I'm not saying don't have support for carveouts, just make them
>>>>>>>> optional, keystone_remoteproc.c does this:
>>>>>>>>
>>>>>>>> if (of_reserved_mem_device_init(dev))
>>>>>>>> 	dev_warn(dev, "device does not have specific CMA pool\n");
>>>>>>>>
>>>>>>>> There doesn't even needs to be a warning but that is up to you.
>>>>>>>
>>>>>>> It is not exactly an apples to apples comparison. K2s do not have MMUs,
>>>>>>> and most of our firmware images on K2 are actually running out of the
>>>>>>> DSP internal memory.
>>>>>>>
>>>>>>
>>>>>>
>>>>>> So again we circle back to it being a firmware issue, if K2 can get away
>>>>>> without needing carveouts and it doesn't even have an MMU then certainly
>>>>>> OMAP/DRA7x class devices can handle it even better given they *do* have
>>>>>> an IOMMU. Unless someone is hard-coding the IOMMU configuration.. In
>>>>>> which case we are still just hacking around the problem here with
>>>>>> mandatory specific address memory carveouts.
>>>>>
>>>>> Optional carveouts on OMAP remoteprocs can be an enhancement in the
>>>>> future, but at the moment, we won't be able to run use-cases without
>>>>> this. And I have already given some of the reasons for the same here and
>>>>> on v4.
>>>>>
>>>>
>>>>
>>>> No reason to be dismissive, my questions are valid.
>>>>
>>>> What "use-cases" are we talking about, I have firmware that doesn't need
>>>> specific carved-out addresses.
>>>
>>> I think you are well aware of all the usecases we provide with the TI
>>> SDKs with IPUs and DSPs. And what is the firmware that you have and what
>>> do you use it for?
>>>
> 
> 
> Yes I know exactly the pieces of TI firmware we are talking about and
> why it they still need carveouts. That's not the point, our firmware may
> have issues and hard-coding, but we need to allow for correctly built
> firmware that doesn't need carveouts also. This driver should not fail
> if a carveout is not provided. The remoteproc can run fine without a
> carveout, only some firmwares cannot, so it should be optional and not
> forced in DT on everyone using our DSP/IPU.
> 
> 
>>> If you have misbehaving firmware that
>>>> needs statically carved out memory addresses then you can have carveouts
>>>> if you want, but it should be optional.
>>> If I don't want to pollute my
>>>> system's memory space with a bunch of carveout holes then I shouldn't
>>>> have to just because your specific firmware needs them.
>>>
>>> Further follow-up series like early-boot and late-attach will mandate
>>> fixed carveouts actually. You cannot just run out of any random memory.
>>
> 
> 
> Those are different, the location of the loaded firmware in memory will
> need to be carved out if it is in use by a remote core before Linux
> boots. This carveout is for Linux to allocate from to load the Vrings
> and other memory it may need. When late-attach shows up then we can
> think about how to handle those.
> 
> 
>> Also, these are CMA pools ("reusable"), so they are not actual carveout
>> holes ("no-map"). This is the preferred method in remoteproc mode so
>> that the memory is available for kernel when remoteprocs are not in use.
>> Customers can always choose to make these carveouts so that they do not
>> run into memory allocation issues when changing firmwares and under
>> stress conditions. These will have to be carveouts for early-boot usecases.
>>
> 
> 
> Even "reusable" carveouts can only be used by re-locateable memory
> (caches and such) so still not a good thing to have your memory space
> full of them.
> 
>> Customers can always choose to make these carveouts
> 
> That is exactly what I am saying, they can choose, but it should be
> optional, the current binding and driver make them mandatory or the
> driver will not probe.

Ok, so just to re-cap here, we (me + Suman + Andrew) aligned offline on 
this and the plan from our side is to:

- Make the memory-regions part of the binding optional, not mandatory
- Make the omap remoteproc driver portion for the memory-regions also 
optional, not fail to probe
- Print a warning from the omap driver if memory regions are not in 
place, claiming user knows what he is doing, as right now nothing works 
without the memory regions defined.

I'll post v6 against -rc1 with these changes once it is available.

-Tero


> 
> Andrew
> 
> 
>> regards
>> Suman
>>
>>>
>>> regards
>>> Suman
>>>
>>>>
>>>> Andrew
>>>>
>>>>
>>>>> regards
>>>>> Suman
>>>>>
>>>>>>
>>>>>> Andrew
>>>>>>
>>>>>>
>>>>>>> regards
>>>>>>> Suman
>>>>>>>
>>>>>>>>
>>>>>>>> Andrew
>>>>>>>>
>>>>>>>>
>>>>>>>>> regards
>>>>>>>>> Suman
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> -Tero
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Andrew
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> -Tero
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> This is not a requirement of the remote processor itself and so it
>>>>>>>>>>>>> should not fail to probe if a specific memory carveout isn't given.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> use the of_reserved_mem_device_init/release() API appropriately
>>>>>>>>>>>>>> to assign the corresponding reserved memory region to the OMAP
>>>>>>>>>>>>>> remoteproc device. Note that only one region per device is
>>>>>>>>>>>>>> allowed by the framework.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>>>>>>>>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>>>>>>>>>>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> v5: no changes
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>     drivers/remoteproc/omap_remoteproc.c | 12 +++++++++++-
>>>>>>>>>>>>>>     1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/remoteproc/omap_remoteproc.c
>>>>>>>>>>>>>> b/drivers/remoteproc/omap_remoteproc.c
>>>>>>>>>>>>>> index 0846839b2c97..194303b860b2 100644
>>>>>>>>>>>>>> --- a/drivers/remoteproc/omap_remoteproc.c
>>>>>>>>>>>>>> +++ b/drivers/remoteproc/omap_remoteproc.c
>>>>>>>>>>>>>> @@ -17,6 +17,7 @@
>>>>>>>>>>>>>>     #include <linux/module.h>
>>>>>>>>>>>>>>     #include <linux/err.h>
>>>>>>>>>>>>>>     #include <linux/of_device.h>
>>>>>>>>>>>>>> +#include <linux/of_reserved_mem.h>
>>>>>>>>>>>>>>     #include <linux/platform_device.h>
>>>>>>>>>>>>>>     #include <linux/dma-mapping.h>
>>>>>>>>>>>>>>     #include <linux/remoteproc.h>
>>>>>>>>>>>>>> @@ -480,14 +481,22 @@ static int omap_rproc_probe(struct
>>>>>>>>>>>>>> platform_device *pdev)
>>>>>>>>>>>>>>         if (ret)
>>>>>>>>>>>>>>             goto free_rproc;
>>>>>>>>>>>>>>     +    ret = of_reserved_mem_device_init(&pdev->dev);
>>>>>>>>>>>>>> +    if (ret) {
>>>>>>>>>>>>>> +        dev_err(&pdev->dev, "device does not have specific CMA
>>>>>>>>>>>>>> pool\n");
>>>>>>>>>>>>>> +        goto free_rproc;
>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>         platform_set_drvdata(pdev, rproc);
>>>>>>>>>>>>>>           ret = rproc_add(rproc);
>>>>>>>>>>>>>>         if (ret)
>>>>>>>>>>>>>> -        goto free_rproc;
>>>>>>>>>>>>>> +        goto release_mem;
>>>>>>>>>>>>>>           return 0;
>>>>>>>>>>>>>>     +release_mem:
>>>>>>>>>>>>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>>>>>>>>>>>>     free_rproc:
>>>>>>>>>>>>>>         rproc_free(rproc);
>>>>>>>>>>>>>>         return ret;
>>>>>>>>>>>>>> @@ -499,6 +508,7 @@ static int omap_rproc_remove(struct
>>>>>>>>>>>>>> platform_device *pdev)
>>>>>>>>>>>>>>           rproc_del(rproc);
>>>>>>>>>>>>>>         rproc_free(rproc);
>>>>>>>>>>>>>> +    of_reserved_mem_device_release(&pdev->dev);
>>>>>>>>>>>>>>           return 0;
>>>>>>>>>>>>>>     }
>>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> -- 
>>>>>>>>>>
>>>>>>>>>> -- 
>>>>>>>>>
>>>>>>>
>>>>>
>>>
>>

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
