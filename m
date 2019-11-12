Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20261F8AB2
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfKLIiD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:38:03 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56164 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfKLIiD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:38:03 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8c01F112888;
        Tue, 12 Nov 2019 02:38:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573547880;
        bh=RBU6T2Nh2+ByLEEG4MJg4kaoUQLdytcGJ4khenbTWao=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JdRaaRw0vvZbDpoHkdTyw2icPLcx7j8Cz20zpKDPpwOD4TgvDRqV0uVkL2PBzH14x
         Wm5j9IueQdaezGwcUpPbrSyj3cvY0WygFzbRXHMYbSbD2vwTdnAUa+0HIafIE6yseL
         sRvn0lClh8o8fghVkz1laLLCCkU8RSuwElEcq7Uc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAC8c0i6004370
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 02:38:00 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:37:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:37:42 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8bvTh085771;
        Tue, 12 Nov 2019 02:37:58 -0600
Subject: Re: [PATCH 08/17] remoteproc/omap: Add support for DRA7xx remote
 processors
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-9-t-kristo@ti.com> <20191111233707.GJ3108315@builder>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <0d26759a-8a48-e573-cbf6-721c6e5367c1@ti.com>
Date:   Tue, 12 Nov 2019 10:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111233707.GJ3108315@builder>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 01:37, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> 
>> From: Suman Anna <s-anna@ti.com>
>>
>> DRA7xx/AM57xx SoCs have two IPU and up to two DSP processor subsystems
>> for offloading different computation algorithms. The IPU processor
>> subsystem contains dual-core ARM Cortex-M4 processors, and is very
>> similar to those on OMAP5. The DSP processor subsystem is based on
>> the TI's standard TMS320C66x DSP CorePac core.
>>
>> Support has been added to the OMAP remoteproc driver through new
>> DRA7xx specific compatibles for properly probing and booting the
>> all the different processor subsystem instances on DRA7xx/AM57xx
>> SoCs - IPU1, IPU2, DSP1 & DSP2. A build dependency with SOC_DRA7XX
>> is added to enable the driver to be built in DRA7xx-only configuration.
>>
>> The DSP boot address programming needed enhancement for DRA7xx as the
>> boot register fields are different on DRA7 compared to OMAP4 and OMAP5
>> SoCs. The register on DRA7xx contains additional fields within the
>> register and the boot address bit-field is right-shifted by 10 bits.
>> The internal memory parsing logic has also been updated to compute
>> the device addresses for the L2 RAM for DSP devices using relative
>> addressing logic, and to parse two additional RAMs at L1 level - L1P
>> and L1D. This allows the remoteproc driver to support loading into
>> these regions for a small subset of firmware images requiring as
>> such. The most common usage would be to use the L1 programmable
>> RAMs as L1 Caches.
>>
>> The firmware lookup logic also has to be adjusted for DRA7xx as
>> there are (can be) more than one instance of both the IPU and DSP
>> remote processors for the first time in OMAP4+ SoCs.
>>
>> The names for the firmware images are fixed for each processor and
>> are expected to be as follows:
>> 	IPU1: dra7-ipu1-fw.xem4
>> 	IPU2: dra7-ipu2-fw.xem4
>> 	DSP1: dra7-dsp1-fw.xe66
>> 	DSP2: dra7-dsp2-fw.xe66
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> [t-kristo@ti.com: fixed l4_offset calculation logic]
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/remoteproc/Kconfig           |   2 +-
>>   drivers/remoteproc/omap_remoteproc.c | 103 ++++++++++++++++++++++++---
>>   2 files changed, 96 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 94afdde4bc9f..d6450d7fcf92 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -25,7 +25,7 @@ config IMX_REMOTEPROC
>>   
>>   config OMAP_REMOTEPROC
>>   	tristate "OMAP remoteproc support"
>> -	depends on ARCH_OMAP4 || SOC_OMAP5
>> +	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
>>   	depends on OMAP_IOMMU
>>   	select MAILBOX
>>   	select OMAP2PLUS_MBOX
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index 0b80570effee..e46bb4c790d7 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/module.h>
>>   #include <linux/err.h>
>>   #include <linux/of_device.h>
>> +#include <linux/of_address.h>
>>   #include <linux/of_reserved_mem.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/dma-mapping.h>
>> @@ -30,16 +31,20 @@
>>   #include "omap_remoteproc.h"
>>   #include "remoteproc_internal.h"
>>   
>> +#define OMAP_RPROC_DSP_LOCAL_MEM_OFFSET		(0x00800000)
>>   #define OMAP_RPROC_IPU_L2RAM_DEV_ADDR		(0x20000000)
>>   
>>   /**
>>    * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
>>    * @syscon: regmap handle for the system control configuration module
>>    * @boot_reg: boot register offset within the @syscon regmap
>> + * @boot_reg_shift: bit-field shift required for the boot address value in
>> + *		    @boot_reg
>>    */
>>   struct omap_rproc_boot_data {
>>   	struct regmap *syscon;
>>   	unsigned int boot_reg;
>> +	unsigned int boot_reg_shift;
>>   };
>>   
>>   /*
>> @@ -151,14 +156,19 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>>   	struct omap_rproc *oproc = rproc->priv;
>>   	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>>   	u32 offset = bdata->boot_reg;
>> +	unsigned int value = rproc->bootaddr;
>> +	unsigned int mask = ~(SZ_1K - 1);
>>   
>> -	if (rproc->bootaddr & (SZ_1K - 1)) {
>> +	if (value & (SZ_1K - 1)) {
> 
> I would prefer if you keep this as it was.
> 
>>   		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
>> -			rproc->bootaddr);
>> +			value);
> 
> Ditto.
> 
>>   		return -EINVAL;
>>   	}
>>   
>> -	regmap_write(bdata->syscon, offset, rproc->bootaddr);
>> +	value >>= bdata->boot_reg_shift;
>> +	mask >>= bdata->boot_reg_shift;
> 
> And then
> 
> value = rproc->bootaddr >> bdata->boot_reg_shift;
> mask = ~((SZ_1K - 1) >> bdata->boot_reg_shift);
> 
> Note though that this would make the upper boot_reg_shift bits 1, while
> in your case they are 0s.

Ok let me revamp this a bit.

> 
>> +
>> +	regmap_update_bits(bdata->syscon, offset, mask, value);
>>   
>>   	return 0;
>>   }
>> @@ -292,6 +302,28 @@ static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>>   	.fw_name	= "omap5-ipu-fw.xem4",
>>   };
>>   
>> +static const struct omap_rproc_dev_data dra7_rproc_dev_data[] = {
>> +	{
>> +		.device_name	= "40800000.dsp",
>> +		.fw_name	= "dra7-dsp1-fw.xe66",
>> +	},
>> +	{
>> +		.device_name	= "41000000.dsp",
>> +		.fw_name	= "dra7-dsp2-fw.xe66",
>> +	},
>> +	{
>> +		.device_name	= "55020000.ipu",
>> +		.fw_name	= "dra7-ipu2-fw.xem4",
>> +	},
>> +	{
>> +		.device_name	= "58820000.ipu",
>> +		.fw_name	= "dra7-ipu1-fw.xem4",
>> +	},
>> +	{
>> +		/* sentinel */
>> +	},
>> +};
>> +
>>   static const struct of_device_id omap_rproc_of_match[] = {
>>   	{
>>   		.compatible     = "ti,omap4-dsp",
>> @@ -309,6 +341,14 @@ static const struct of_device_id omap_rproc_of_match[] = {
>>   		.compatible     = "ti,omap5-ipu",
>>   		.data           = &omap5_ipu_dev_data,
>>   	},
>> +	{
>> +		.compatible     = "ti,dra7-dsp",
>> +		.data           = dra7_rproc_dev_data,
>> +	},
>> +	{
>> +		.compatible     = "ti,dra7-ipu",
>> +		.data           = dra7_rproc_dev_data,
>> +	},
>>   	{
>>   		/* end */
>>   	},
>> @@ -317,13 +357,23 @@ MODULE_DEVICE_TABLE(of, omap_rproc_of_match);
>>   
>>   static const char *omap_rproc_get_firmware(struct platform_device *pdev)
>>   {
>> +	struct device_node *np = pdev->dev.of_node;
>>   	const struct omap_rproc_dev_data *data;
>>   
>>   	data = of_device_get_match_data(&pdev->dev);
>>   	if (!data)
>>   		return ERR_PTR(-ENODEV);
>>   
>> -	return data->fw_name;
>> +	if (!of_device_is_compatible(np, "ti,dra7-dsp") &&
>> +	    !of_device_is_compatible(np, "ti,dra7-ipu"))
>> +		return data->fw_name;
>> +
>> +	for (; data && data->device_name; data++) {
>> +		if (!strcmp(dev_name(&pdev->dev), data->device_name))
> 
> I don't fancy the reliance on node names in devicetree, is this well
> defined in the binding?

I don't think it is.... So, would it be better to just replace the 
compatible strings for dra7 remoteprocs to be like ti,dra7-dsp1 / 
ti,dra7-dsp2 etc.? I think that would clean up the code also quite a bit.

> 
>> +			return data->fw_name;
>> +	}
>> +
>> +	return ERR_PTR(-ENOENT);
>>   }
>>   
>>   static int omap_rproc_get_boot_data(struct platform_device *pdev,
>> @@ -334,7 +384,8 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>   	int ret;
>>   
>>   	if (!of_device_is_compatible(np, "ti,omap4-dsp") &&
>> -	    !of_device_is_compatible(np, "ti,omap5-dsp"))
>> +	    !of_device_is_compatible(np, "ti,omap5-dsp") &&
>> +	    !of_device_is_compatible(np, "ti,dra7-dsp"))
>>   		return 0;
>>   
>>   	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
>> @@ -360,18 +411,27 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (of_device_is_compatible(np, "ti,dra7-dsp"))
>> +		oproc->boot_data->boot_reg_shift = 10;
> 
> Put this in omap_rproc_dev_data.

Yeah.

> 
>> +
>>   	return 0;
>>   }
>>   
>>   static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>>   					       struct rproc *rproc)
>>   {
>> -	static const char * const mem_names[] = {"l2ram"};
>> +	static const char * const ipu_mem_names[] = {"l2ram"};
>> +	static const char * const dra7_dsp_mem_names[] = {"l2ram", "l1pram",
>> +								"l1dram"};
>>   	struct device_node *np = pdev->dev.of_node;
>>   	struct omap_rproc *oproc = rproc->priv;
>>   	struct device *dev = &pdev->dev;
>> +	const char * const *mem_names;
>>   	struct resource *res;
>>   	int num_mems;
>> +	const __be32 *addrp;
>> +	u32 l4_offset = 0;
>> +	u64 size;
>>   	int i;
>>   
>>   	/* OMAP4 and OMAP5 DSPs do not have support for flat SRAM */
>> @@ -379,7 +439,15 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>>   	    of_device_is_compatible(np, "ti,omap5-dsp"))
>>   		return 0;
>>   
>> -	num_mems = ARRAY_SIZE(mem_names);
>> +	/* DRA7 DSPs have two additional SRAMs at L1 level */
>> +	if (of_device_is_compatible(np, "ti,dra7-dsp")) {
>> +		mem_names = dra7_dsp_mem_names;
>> +		num_mems = ARRAY_SIZE(dra7_dsp_mem_names);
>> +	} else {
>> +		mem_names = ipu_mem_names;
>> +		num_mems = ARRAY_SIZE(ipu_mem_names);
>> +	}
>> +
>>   	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
>>   				  GFP_KERNEL);
>>   	if (!oproc->mem)
>> @@ -395,7 +463,26 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>>   			return PTR_ERR(oproc->mem[i].cpu_addr);
>>   		}
>>   		oproc->mem[i].bus_addr = res->start;
>> -		oproc->mem[i].dev_addr = OMAP_RPROC_IPU_L2RAM_DEV_ADDR;
>> +
>> +		/*
>> +		 * The DSPs have the internal memories starting at a fixed
>> +		 * offset of 0x800000 from address 0, and this corresponds to
>> +		 * L2RAM. The L3 address view has the L2RAM bus address as the
>> +		 * starting address for the IP, so the L2RAM memory region needs
>> +		 * to be processed first, and the device addresses for each
>> +		 * memory region can be computed using the relative offset
>> +		 * from this base address.
>> +		 */
>> +		if (of_device_is_compatible(np, "ti,dra7-dsp") &&
> 
> Please don't use a ternary operator repeatedly, it makes the code hard
> to follow.

Yeah this parts looks somewhat messy, let me try to fix that.

-Tero

> 
> Regards,
> Bjorn
> 
>> +		    !strcmp(mem_names[i], "l2ram")) {
>> +			addrp = of_get_address(dev->of_node, i, &size, NULL);
>> +			l4_offset = of_translate_address(dev->of_node, addrp);
>> +		}
>> +		oproc->mem[i].dev_addr =
>> +			of_device_is_compatible(np, "ti,dra7-dsp") ?
>> +				res->start - l4_offset +
>> +				OMAP_RPROC_DSP_LOCAL_MEM_OFFSET :
>> +				OMAP_RPROC_IPU_L2RAM_DEV_ADDR;
>>   		oproc->mem[i].size = resource_size(res);
>>   
>>   		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
