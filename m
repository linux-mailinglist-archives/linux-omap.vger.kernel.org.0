Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE64A127392
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 03:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLTCoC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 21:44:02 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57948 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfLTCoC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 21:44:02 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBK2FUTE097491;
        Thu, 19 Dec 2019 20:15:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576808130;
        bh=zfRRgmenEvjUog94sf5leKSGDx4lfpSPTyPI1QrPCqw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wxhbAUzg6CK6yLhZVhlJ0bAC9qs43tBYW4HxA7K8eTl/DGFspMMvzlCa5r53K4+iY
         uvgFcRv+VUQt40+yM0r1Fnp/ViEkbQ3KK2APJ+AqIoHFxW3HqgJmbVDrI35DKXrR6f
         TmIdEu4zKadCSvHCbFVP+ctMgwU9PWQSoqWk0UCo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBK2FUq5108214
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Dec 2019 20:15:30 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 20:15:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 20:15:29 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK2FTgT049569;
        Thu, 19 Dec 2019 20:15:29 -0600
Subject: Re: [PATCHv3 04/15] remoteproc/omap: Add support to parse internal
 memories from DT
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-5-t-kristo@ti.com> <20191218002257.GB16271@xps15>
 <021d0654-5e78-85cd-4737-c1eccc8c07ce@ti.com>
 <CANLsYkxqA4jm3igF9hfppzPGx4fyvmc+5LTY8uMCYNvZBCJoSQ@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <c60ce8fd-1933-a1ad-5ceb-230d96f17126@ti.com>
Date:   Thu, 19 Dec 2019 20:15:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANLsYkxqA4jm3igF9hfppzPGx4fyvmc+5LTY8uMCYNvZBCJoSQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/19/19 11:37 AM, Mathieu Poirier wrote:
> On Thu, 19 Dec 2019 at 05:31, Tero Kristo <t-kristo@ti.com> wrote:
>>
>> On 18/12/2019 02:22, Mathieu Poirier wrote:
>>> On Fri, Dec 13, 2019 at 02:55:26PM +0200, Tero Kristo wrote:
>>>> From: Suman Anna <s-anna@ti.com>
>>>>
>>>> The OMAP remoteproc driver has been enhanced to parse and store
>>>> the kernel mappings for different internal RAM memories that may
>>>> be present within each remote processor IP subsystem. Different
>>>> devices have varying memories present on current SoCs. The current
>>>> support handles the L2RAM for all IPU devices on OMAP4+ SoCs. The
>>>> DSPs on OMAP4/OMAP5 only have Unicaches and do not have any L1 or
>>>> L2 RAM memories.
>>>>
>>>> IPUs are expected to have the L2RAM at a fixed device address of
>>>> 0x20000000, based on the current limitations on Attribute MMU
>>>> configurations.
>>>>
>>>> NOTE:
>>>> The current logic doesn't handle the parsing of memories for DRA7
>>>> remoteproc devices, and will be added alongside the DRA7 support.
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> [t-kristo: converted to parse mem names / device addresses from pdata]
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>   drivers/remoteproc/omap_remoteproc.c | 86 ++++++++++++++++++++++++++++
>>>>   1 file changed, 86 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>>>> index d80f5d7b5931..844703507a74 100644
>>>> --- a/drivers/remoteproc/omap_remoteproc.c
>>>> +++ b/drivers/remoteproc/omap_remoteproc.c
>>>> @@ -39,11 +39,27 @@ struct omap_rproc_boot_data {
>>>>      unsigned int boot_reg;
>>>>   };
>>>>
>>>> +/*

Somehow a second trailing * got dropped by mistake here.

>>>> + * struct omap_rproc_mem - internal memory structure
>>>> + * @cpu_addr: MPU virtual address of the memory region
>>>> + * @bus_addr: bus address used to access the memory region
>>>> + * @dev_addr: device address of the memory region from DSP view
>>>> + * @size: size of the memory region
>>>> + */
>>>> +struct omap_rproc_mem {
>>>> +    void __iomem *cpu_addr;
>>>> +    phys_addr_t bus_addr;
>>>> +    u32 dev_addr;
>>>> +    size_t size;
>>>> +};
>>>> +
>>>>   /**
>>>>    * struct omap_rproc - omap remote processor state
>>>>    * @mbox: mailbox channel handle
>>>>    * @client: mailbox client to request the mailbox channel
>>>>    * @boot_data: boot data structure for setting processor boot address
>>>> + * @mem: internal memory regions data
>>>> + * @num_mems: number of internal memory regions
>>>>    * @rproc: rproc handle
>>>>    * @reset: reset handle
>>>>    */
>>>> @@ -51,6 +67,8 @@ struct omap_rproc {
>>>>      struct mbox_chan *mbox;
>>>>      struct mbox_client client;
>>>>      struct omap_rproc_boot_data *boot_data;
>>>> +    struct omap_rproc_mem *mem;
>>>> +    int num_mems;
>>>>      struct rproc *rproc;
>>>>      struct reset_control *reset;
>>>>   };
>>>> @@ -59,10 +77,14 @@ struct omap_rproc {
>>>>    * struct omap_rproc_dev_data - device data for the omap remote processor
>>>>    * @device_name: device name of the remote processor
>>>>    * @has_bootreg: true if this remote processor has boot register
>>>> + * @mem_names: memory names for this remote processor
>>>> + * @dev_addrs: device addresses corresponding to the memory names
>>>>    */
>>>>   struct omap_rproc_dev_data {
>>>>      const char *device_name;
>>>>      bool has_bootreg;
>>>> +    const char * const *mem_names;
>>>> +    const u32 *dev_addrs;
>>>
>>> Bunching these two in a new structure like omap_rproc_mem_data would clean
>>> things up.  That way the two arrays in the next hunk get merged and there can't
>>> be a difference in sizes, somthing that will sturdy the main loop in
>>> omap_rproc_of_get_internal_memories() below.
>>
>> Will fix this.
>>
>>>
>>>>   };
>>>>
>>>>   /**
>>>> @@ -216,6 +238,14 @@ static const struct rproc_ops omap_rproc_ops = {
>>>>      .kick           = omap_rproc_kick,
>>>>   };
>>>>
>>>> +static const char * const ipu_mem_names[] = {
>>>> +    "l2ram", NULL
>>>> +};
>>>> +
>>>> +static const u32 ipu_dev_addrs[] = {
>>>> +    0x20000000,
>>>> +};
>>>> +
>>>>   static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>>>      .device_name    = "dsp",
>>>>      .has_bootreg    = true,
>>>> @@ -223,6 +253,8 @@ static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>>>
>>>>   static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
>>>>      .device_name    = "ipu",
>>>> +    .mem_names      = ipu_mem_names,
>>>> +    .dev_addrs      = ipu_dev_addrs,
>>>>   };
>>>>
>>>>   static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
>>>> @@ -232,6 +264,8 @@ static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
>>>>
>>>>   static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>>>>      .device_name    = "ipu",
>>>> +    .mem_names      = ipu_mem_names,
>>>> +    .dev_addrs      = ipu_dev_addrs,
>>>>   };
>>>>
>>>>   static const struct of_device_id omap_rproc_of_match[] = {
>>>> @@ -311,6 +345,54 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>>>      return 0;
>>>>   }
>>>>
>>>> +static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>>>> +                                           struct rproc *rproc)
>>>> +{
>>>> +    struct omap_rproc *oproc = rproc->priv;
>>>> +    struct device *dev = &pdev->dev;
>>>> +    const struct omap_rproc_dev_data *data;
>>>> +    struct resource *res;
>>>> +    int num_mems;
>>>> +    int i;
>>>> +
>>>> +    data = of_device_get_match_data(&pdev->dev);
>>>> +    if (!data)
>>>> +            return -ENODEV;
>>>> +
>>>> +    if (!data->mem_names)
>>>> +            return 0;
>>>> +
>>>> +    for (num_mems = 0; data->mem_names[num_mems]; num_mems++)
>>>> +            ;
>>>
>>> Instead of doing this function of_property_count_elems_of_size() can be used on
>>> the "reg" property.
>>
>> Hmm right, but the problem is then we don't know if someone left out one
>> of the memories in DT. We want to check the presence for all defined in
>> the platform data.
>>
> 
> In my opinion (and to go along what I advocated in a comment on
> another patch) everything should be dictated from the DT.  If an area
> of reserved memory is missing in the DT then the infrastructure should
> recognise it and refuse to move forward with initialisation.

That's actually what the code does too. It is just different remoteprocs
have different internal memories, and that array of names is actually
retrieved here based on match data.

regards
Suman

> 
> Thanks
> Mathieu
> 
>>>
>>> In the loop below a check should be done to see if data->mem_data[i] (see above
>>> comment) is valid before calling platform_get_resource_byname().  If not then
>>> an error can be returned.
>>
>> Will add a check to it.
>>
>> -Tero
>>
>>>
>>> I'm running out of time for today - I will continue reviewing the other patches
>>> tomorrow.
>>>
>>>> +
>>>> +    oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
>>>> +                              GFP_KERNEL);
>>>> +    if (!oproc->mem)
>>>> +            return -ENOMEM;
>>>> +
>>>> +    for (i = 0; i < num_mems; i++) {
>>>> +            res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>>> +                                               data->mem_names[i]);
>>>> +            oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>>>> +            if (IS_ERR(oproc->mem[i].cpu_addr)) {
>>>> +                    dev_err(dev, "failed to parse and map %s memory\n",
>>>> +                            data->mem_names[i]);
>>>> +                    return PTR_ERR(oproc->mem[i].cpu_addr);
>>>> +            }
>>>> +            oproc->mem[i].bus_addr = res->start;
>>>> +            oproc->mem[i].dev_addr = data->dev_addrs[i];
>>>> +            oproc->mem[i].size = resource_size(res);
>>>> +
>>>> +            dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
>>>> +                    data->mem_names[i], &oproc->mem[i].bus_addr,
>>>> +                    oproc->mem[i].size, oproc->mem[i].cpu_addr,
>>>> +                    oproc->mem[i].dev_addr);
>>>> +    }
>>>> +    oproc->num_mems = num_mems;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int omap_rproc_probe(struct platform_device *pdev)
>>>>   {
>>>>      struct device_node *np = pdev->dev.of_node;
>>>> @@ -350,6 +432,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
>>>>      /* All existing OMAP IPU and DSP processors have an MMU */
>>>>      rproc->has_iommu = true;
>>>>
>>>> +    ret = omap_rproc_of_get_internal_memories(pdev, rproc);
>>>> +    if (ret)
>>>> +            goto free_rproc;
>>>> +
>>>>      ret = omap_rproc_get_boot_data(pdev, rproc);
>>>>      if (ret)
>>>>              goto free_rproc;
>>>> --
>>>> 2.17.1
>>>>
>>>> --
>>
>> --
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

