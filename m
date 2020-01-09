Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878BC135541
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2020 10:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbgAIJMO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jan 2020 04:12:14 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41664 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728565AbgAIJMO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jan 2020 04:12:14 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0099CCK3103646;
        Thu, 9 Jan 2020 03:12:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578561132;
        bh=qvfS1d11frb/j6Qof3I+09m+UPBh3+LWb8zGHKDjd4Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=iSWGkYqj+YRl+4xfB6HDnc/IZwgIAVdEN0ApwB7CmBjZn2shODwKD6K9NJI3bAV4y
         /jmichNNuyqMf+a/SShgaMyjGaLk3rdFun/FLOv9S+c1lq0na35TpkZ8xMHGvnSaXL
         uvpEQi71+HDOi5rwlP9nmxtXT8CCuiJGaWmnxgdg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0099CCpt109864
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jan 2020 03:12:12 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Jan
 2020 03:12:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Jan 2020 03:12:10 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0099C873097804;
        Thu, 9 Jan 2020 03:12:09 -0600
Subject: Re: [PATCHv4 04/14] remoteproc/omap: Add support to parse internal
 memories from DT
To:     Suman Anna <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20200102131845.12992-1-t-kristo@ti.com>
 <20200102131845.12992-5-t-kristo@ti.com>
 <b9690449-5edc-e8f0-2c26-5da6900e23e3@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <aef3436a-4491-e900-97cf-ac0c57e032a3@ti.com>
Date:   Thu, 9 Jan 2020 11:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b9690449-5edc-e8f0-2c26-5da6900e23e3@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/01/2020 20:05, Suman Anna wrote:
> Hi Tero,
> 
> On 1/2/20 7:18 AM, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> The OMAP remoteproc driver has been enhanced to parse and store
>> the kernel mappings for different internal RAM memories that may
>> be present within each remote processor IP subsystem. Different
>> devices have varying memories present on current SoCs. The current
>> support handles the L2RAM for all IPU devices on OMAP4+ SoCs. The
>> DSPs on OMAP4/OMAP5 only have Unicaches and do not have any L1 or
>> L2 RAM memories.
>>
>> IPUs are expected to have the L2RAM at a fixed device address of
>> 0x20000000, based on the current limitations on Attribute MMU
>> configurations.
>>
>> NOTE:
>> The current logic doesn't handle the parsing of memories for DRA7
>> remoteproc devices, and will be added alongside the DRA7 support.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> [t-kristo: converted to parse mem names / device addresses from pdata]
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>> v4:
>>    - moved device data mem definitions under single struct
>>
>>   drivers/remoteproc/omap_remoteproc.c | 89 ++++++++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index 557c439571c1..e429b2296d7a 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -39,11 +39,27 @@ struct omap_rproc_boot_data {
>>   	unsigned int boot_reg;
>>   };
>>   
>> +/**
>> + * struct omap_rproc_mem - internal memory structure
>> + * @cpu_addr: MPU virtual address of the memory region
>> + * @bus_addr: bus address used to access the memory region
>> + * @dev_addr: device address of the memory region from DSP view
>> + * @size: size of the memory region
>> + */
>> +struct omap_rproc_mem {
>> +	void __iomem *cpu_addr;
>> +	phys_addr_t bus_addr;
>> +	u32 dev_addr;
>> +	size_t size;
>> +};
>> +
>>   /**
>>    * struct omap_rproc - omap remote processor state
>>    * @mbox: mailbox channel handle
>>    * @client: mailbox client to request the mailbox channel
>>    * @boot_data: boot data structure for setting processor boot address
>> + * @mem: internal memory regions data
>> + * @num_mems: number of internal memory regions
>>    * @rproc: rproc handle
>>    * @reset: reset handle
>>    */
>> @@ -51,16 +67,30 @@ struct omap_rproc {
>>   	struct mbox_chan *mbox;
>>   	struct mbox_client client;
>>   	struct omap_rproc_boot_data *boot_data;
>> +	struct omap_rproc_mem *mem;
>> +	int num_mems;
>>   	struct rproc *rproc;
>>   	struct reset_control *reset;
>>   };
>>   
>> +/**
>> + * struct omap_rproc_mem_data - memory definitions for an omap remote processor
>> + * @mem_name: name for this memory entry
>> + * @dev_addr: device address for the memory entry
>> + */
>> +struct omap_rproc_mem_data {
>> +	const char *name;
>> +	const u32 dev_addr;
>> +};
>> +
>>   /**
>>    * struct omap_rproc_dev_data - device data for the omap remote processor
>>    * @device_name: device name of the remote processor
>> + * @mems: memory definitions for this remote processor
>>    */
>>   struct omap_rproc_dev_data {
>>   	const char *device_name;
>> +	const struct omap_rproc_mem_data *mems;
>>   };
>>   
>>   /**
>> @@ -221,12 +251,18 @@ static const struct rproc_ops omap_rproc_ops = {
>>   	.kick		= omap_rproc_kick,
>>   };
>>   
>> +static const struct omap_rproc_mem_data ipu_mems[] = {
>> +	{ .name = "l2ram", .dev_addr = 0x20000000 },
>> +	{ },
>> +};
>> +
>>   static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>   	.device_name	= "dsp",
>>   };
>>   
>>   static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
>>   	.device_name	= "ipu",
>> +	.mems		= ipu_mems,
>>   };
>>   
>>   static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
>> @@ -235,6 +271,7 @@ static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
>>   
>>   static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>>   	.device_name	= "ipu",
>> +	.mems		= ipu_mems,
>>   };
>>   
>>   static const struct of_device_id omap_rproc_of_match[] = {
>> @@ -309,6 +346,54 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>   	return 0;
>>   }
>>   
>> +static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>> +					       struct rproc *rproc)
>> +{
>> +	struct omap_rproc *oproc = rproc->priv;
>> +	struct device *dev = &pdev->dev;
>> +	const struct omap_rproc_dev_data *data;
>> +	struct resource *res;
>> +	int num_mems;
>> +	int i;
>> +
>> +	data = of_device_get_match_data(&pdev->dev);
>> +	if (!data)
>> +		return -ENODEV;
>> +
>> +	if (!data->mems)
>> +		return 0;
>> +
>> +	for (num_mems = 0; data->mems[num_mems].name; num_mems++)
>> +		;
> 
> Think you can restore back the ARRAY_SIZE here? Don't think you need the
> sentinel in the names either.

Can't do that. There is nothing to use the ARRAY_SIZE against here. I 
either need to have the ARRAY_SIZE embedded in the device data, or have 
the sentinel. Having the sentinel is cleaner.

> 
>> +
>> +	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
>> +				  GFP_KERNEL);
>> +	if (!oproc->mem)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < num_mems; i++) {
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   data->mems[i].name);
>> +		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>> +		if (IS_ERR(oproc->mem[i].cpu_addr)) {
>> +			dev_err(dev, "failed to parse and map %s memory\n",
>> +				data->mems[i].name);
>> +			return PTR_ERR(oproc->mem[i].cpu_addr);
>> +		}
>> +		oproc->mem[i].bus_addr = res->start;
>> +		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
>> +		oproc->mem[i].size = resource_size(res);
>> +
>> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
> 
> Would appreciate if you can fix up to use %pK here.

Ok, can change those.

-Tero

> 
> regards
> Suman
> 
>> +			data->mems[i].name, &oproc->mem[i].bus_addr,
>> +			oproc->mem[i].size, oproc->mem[i].cpu_addr,
>> +			oproc->mem[i].dev_addr);
>> +	}
>> +	oproc->num_mems = num_mems;
>> +
>> +	return 0;
>> +}
>> +
>>   static int omap_rproc_probe(struct platform_device *pdev)
>>   {
>>   	struct device_node *np = pdev->dev.of_node;
>> @@ -348,6 +433,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
>>   	/* All existing OMAP IPU and DSP processors have an MMU */
>>   	rproc->has_iommu = true;
>>   
>> +	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
>> +	if (ret)
>> +		goto free_rproc;
>> +
>>   	ret = omap_rproc_get_boot_data(pdev, rproc);
>>   	if (ret)
>>   		goto free_rproc;
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
