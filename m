Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71ABBF8A6A
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfKLIVL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:21:11 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43626 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfKLIVL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:21:11 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8L8QR058939;
        Tue, 12 Nov 2019 02:21:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573546868;
        bh=nl1J6mTWnnUFj4yFSAtWqZEp/cTAu5r/moLzQPZ0gLY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SzZ0gqySagxC5s2hy/6//P3gwjFbYZRlK/5IbR1vVdrsar3Q4vwkDJNxZPkeFnkmq
         xcmtcGIG/gH9xOyo01W/KbiRNInBDZC9Y4E5AhU2SJ6Z6cOoza7jqHzk501yyJmaGg
         k0iAcZsM/ScsxfRKZ36ncQ5UTtHSSLiNiR2ofscM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAC8L8cm110847
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 02:21:08 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:20:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:20:49 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8L3eC118804;
        Tue, 12 Nov 2019 02:21:04 -0600
Subject: Re: [PATCH 05/17] remoteproc/omap: Add support to parse internal
 memories from DT
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-6-t-kristo@ti.com> <20191111232122.GG3108315@builder>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <8af6defc-17b0-c927-2360-581c495c4888@ti.com>
Date:   Tue, 12 Nov 2019 10:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111232122.GG3108315@builder>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 01:21, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> 
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
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/remoteproc/omap_remoteproc.c | 69 ++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index a10377547533..bbd6ff360e10 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -29,6 +29,8 @@
>>   #include "omap_remoteproc.h"
>>   #include "remoteproc_internal.h"
>>   
>> +#define OMAP_RPROC_IPU_L2RAM_DEV_ADDR		(0x20000000)
>> +
>>   /**
>>    * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
>>    * @syscon: regmap handle for the system control configuration module
>> @@ -39,11 +41,27 @@ struct omap_rproc_boot_data {
>>   	unsigned int boot_reg;
>>   };
>>   
>> +/*
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
>> @@ -51,6 +69,8 @@ struct omap_rproc {
>>   	struct mbox_chan *mbox;
>>   	struct mbox_client client;
>>   	struct omap_rproc_boot_data *boot_data;
>> +	struct omap_rproc_mem *mem;
>> +	int num_mems;
>>   	struct rproc *rproc;
>>   	struct reset_control *reset;
>>   };
>> @@ -307,6 +327,51 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>   	return 0;
>>   }
>>   
>> +static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>> +					       struct rproc *rproc)
>> +{
>> +	static const char * const mem_names[] = {"l2ram"};
>> +	struct device_node *np = pdev->dev.of_node;
>> +	struct omap_rproc *oproc = rproc->priv;
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	int num_mems;
>> +	int i;
>> +
>> +	/* OMAP4 and OMAP5 DSPs do not have support for flat SRAM */
>> +	if (of_device_is_compatible(np, "ti,omap4-dsp") ||
>> +	    of_device_is_compatible(np, "ti,omap5-dsp"))
>> +		return 0;
>> +
>> +	num_mems = ARRAY_SIZE(mem_names);
>> +	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
>> +				  GFP_KERNEL);
>> +	if (!oproc->mem)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < num_mems; i++) {
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   mem_names[i]);
>> +		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>> +		if (IS_ERR(oproc->mem[i].cpu_addr)) {
>> +			dev_err(dev, "failed to parse and map %s memory\n",
>> +				mem_names[i]);
>> +			return PTR_ERR(oproc->mem[i].cpu_addr);
>> +		}
>> +		oproc->mem[i].bus_addr = res->start;
>> +		oproc->mem[i].dev_addr = OMAP_RPROC_IPU_L2RAM_DEV_ADDR;
> 
> Presumably this means that mem_names[] will only ever be {"l2ram"} ?
> 
> This would imply that you can either remove the loop or you should
> generalize this for dev_addr as well.

Well, actually support for dra7 remoteprocs is added in patch #8, which 
adds also l1pram/l1dram to the mix.

-Tero

> 
> 
> Apart from that, this looks good.
> 
> Regards,
> Bjorn
> 
>> +		oproc->mem[i].size = resource_size(res);
>> +
>> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
>> +			mem_names[i], &oproc->mem[i].bus_addr,
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
>> @@ -346,6 +411,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
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
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
