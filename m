Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1833D12622E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2019 13:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfLSMb4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 07:31:56 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53366 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfLSMb4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 07:31:56 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJCVs7D040194;
        Thu, 19 Dec 2019 06:31:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576758714;
        bh=Pv1mJYF6L0EcMQKuEnZ7/ITcNqi4Vjrbht7VTdB5o1k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kd+giAJSEM1/h1weIiBiwYp/RD22EU5WxGmEWhQooj8zJcNZUBl3W5ffFxk6f4wDn
         ziAgwGxNJXvzkKnYm1741HL4yrLBJfJ24Mkh3sIEaXTRdOlBZ5A6ZZ6hDQt118HDac
         QXYJjxS6hSeauKvDwT20MbzYN0WgG3M3eYB6pP98=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJCVsmn067784
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Dec 2019 06:31:54 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 06:31:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 06:31:54 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJCVp9k097056;
        Thu, 19 Dec 2019 06:31:52 -0600
Subject: Re: [PATCHv3 04/15] remoteproc/omap: Add support to parse internal
 memories from DT
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-5-t-kristo@ti.com> <20191218002257.GB16271@xps15>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <021d0654-5e78-85cd-4737-c1eccc8c07ce@ti.com>
Date:   Thu, 19 Dec 2019 14:31:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218002257.GB16271@xps15>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/12/2019 02:22, Mathieu Poirier wrote:
> On Fri, Dec 13, 2019 at 02:55:26PM +0200, Tero Kristo wrote:
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
>>   drivers/remoteproc/omap_remoteproc.c | 86 ++++++++++++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index d80f5d7b5931..844703507a74 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -39,11 +39,27 @@ struct omap_rproc_boot_data {
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
>> @@ -51,6 +67,8 @@ struct omap_rproc {
>>   	struct mbox_chan *mbox;
>>   	struct mbox_client client;
>>   	struct omap_rproc_boot_data *boot_data;
>> +	struct omap_rproc_mem *mem;
>> +	int num_mems;
>>   	struct rproc *rproc;
>>   	struct reset_control *reset;
>>   };
>> @@ -59,10 +77,14 @@ struct omap_rproc {
>>    * struct omap_rproc_dev_data - device data for the omap remote processor
>>    * @device_name: device name of the remote processor
>>    * @has_bootreg: true if this remote processor has boot register
>> + * @mem_names: memory names for this remote processor
>> + * @dev_addrs: device addresses corresponding to the memory names
>>    */
>>   struct omap_rproc_dev_data {
>>   	const char *device_name;
>>   	bool has_bootreg;
>> +	const char * const *mem_names;
>> +	const u32 *dev_addrs;
> 
> Bunching these two in a new structure like omap_rproc_mem_data would clean
> things up.  That way the two arrays in the next hunk get merged and there can't
> be a difference in sizes, somthing that will sturdy the main loop in
> omap_rproc_of_get_internal_memories() below.

Will fix this.

> 
>>   };
>>   
>>   /**
>> @@ -216,6 +238,14 @@ static const struct rproc_ops omap_rproc_ops = {
>>   	.kick		= omap_rproc_kick,
>>   };
>>   
>> +static const char * const ipu_mem_names[] = {
>> +	"l2ram", NULL
>> +};
>> +
>> +static const u32 ipu_dev_addrs[] = {
>> +	0x20000000,
>> +};
>> +
>>   static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>   	.device_name	= "dsp",
>>   	.has_bootreg	= true,
>> @@ -223,6 +253,8 @@ static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>   
>>   static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
>>   	.device_name	= "ipu",
>> +	.mem_names	= ipu_mem_names,
>> +	.dev_addrs	= ipu_dev_addrs,
>>   };
>>   
>>   static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
>> @@ -232,6 +264,8 @@ static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
>>   
>>   static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>>   	.device_name	= "ipu",
>> +	.mem_names	= ipu_mem_names,
>> +	.dev_addrs	= ipu_dev_addrs,
>>   };
>>   
>>   static const struct of_device_id omap_rproc_of_match[] = {
>> @@ -311,6 +345,54 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
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
>> +	if (!data->mem_names)
>> +		return 0;
>> +
>> +	for (num_mems = 0; data->mem_names[num_mems]; num_mems++)
>> +		;
> 
> Instead of doing this function of_property_count_elems_of_size() can be used on
> the "reg" property.

Hmm right, but the problem is then we don't know if someone left out one 
of the memories in DT. We want to check the presence for all defined in 
the platform data.

> 
> In the loop below a check should be done to see if data->mem_data[i] (see above
> comment) is valid before calling platform_get_resource_byname().  If not then
> an error can be returned.

Will add a check to it.

-Tero

> 
> I'm running out of time for today - I will continue reviewing the other patches
> tomorrow.
> 
>> +
>> +	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
>> +				  GFP_KERNEL);
>> +	if (!oproc->mem)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < num_mems; i++) {
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   data->mem_names[i]);
>> +		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>> +		if (IS_ERR(oproc->mem[i].cpu_addr)) {
>> +			dev_err(dev, "failed to parse and map %s memory\n",
>> +				data->mem_names[i]);
>> +			return PTR_ERR(oproc->mem[i].cpu_addr);
>> +		}
>> +		oproc->mem[i].bus_addr = res->start;
>> +		oproc->mem[i].dev_addr = data->dev_addrs[i];
>> +		oproc->mem[i].size = resource_size(res);
>> +
>> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
>> +			data->mem_names[i], &oproc->mem[i].bus_addr,
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
>> @@ -350,6 +432,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
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
