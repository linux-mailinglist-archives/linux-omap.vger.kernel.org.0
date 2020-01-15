Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A713213C116
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgAOMe2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:34:28 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46000 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOMe2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jan 2020 07:34:28 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FCYQxF082837;
        Wed, 15 Jan 2020 06:34:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579091666;
        bh=sMlhyiE8VEkpNFwxItSFOijYYslhkKkXrTwP/fEjClM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Z23W7ASGR+0kPOQfFyW9AfXTN5QobP4jZQSQCuuK+4iULyyalGfNXQnrTquddFjxl
         vDn2LQH8OubwIoF413MCd2fP4Z6LOtnGwtdKQBTmGcMH/chK+3HNWxJb35msD4vV8E
         vQoGjyDqCXrB2vNtSvsW3Ph4JQk/fdwhijKj5RDk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FCYQVb013611
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 06:34:26 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 06:34:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 06:34:25 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FCYNLK112002;
        Wed, 15 Jan 2020 06:34:24 -0600
Subject: Re: [PATCHv4 07/14] remoteproc/omap: Add support for DRA7xx remote
 processors
To:     Suman Anna <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20200102131845.12992-1-t-kristo@ti.com>
 <20200102131845.12992-8-t-kristo@ti.com>
 <7ff029a9-20bd-2fec-9bcf-f97cd1bd5f85@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <065b32a7-f346-e262-2f03-9ad5e2a462c8@ti.com>
Date:   Wed, 15 Jan 2020 14:34:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7ff029a9-20bd-2fec-9bcf-f97cd1bd5f85@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/01/2020 21:39, Suman Anna wrote:
> Hi Tero,
> 
> On 1/2/20 7:18 AM, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> DRA7xx/AM57xx SoCs have two IPU and up to two DSP processor subsystems
>> for offloading different computation algorithms. The IPU processor
>> subsystem contains dual-core ARM Cortex-M4 processors, and is very
>> similar to those on OMAP5. The DSP processor subsystem is based on
>> the TI's standard TMS320C66x DSP CorePac core.
>>
>> Support has been added to the OMAP remoteproc driver through new
>> DRA7xx specific compatibles for properly probing and booting all
>> the different processor subsystem instances on DRA7xx/AM57xx
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
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> [t-kristo@ti.com: moved address translation quirks to pdata]
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>> v4:
>>    - data format change due to device data changes to mem layout
>>
>>   drivers/remoteproc/Kconfig           |  2 +-
>>   drivers/remoteproc/omap_remoteproc.c | 38 +++++++++++++++++++++++++++-
>>   2 files changed, 38 insertions(+), 2 deletions(-)
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
>> index 8a6dd742a8b1..9140c528c416 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -34,10 +34,13 @@
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
>>   /**
>> @@ -159,6 +162,8 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>>   	struct omap_rproc *oproc = rproc->priv;
>>   	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>>   	u32 offset = bdata->boot_reg;
>> +	u32 value;
>> +	u32 mask;
>>   
>>   	if (rproc->bootaddr & (SZ_1K - 1)) {
>>   		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
>> @@ -166,7 +171,10 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>>   		return -EINVAL;
>>   	}
>>   
>> -	regmap_write(bdata->syscon, offset, rproc->bootaddr);
>> +	value = rproc->bootaddr >> bdata->boot_reg_shift;
>> +	mask = ~(SZ_1K - 1) >> bdata->boot_reg_shift;
>> +
>> +	regmap_update_bits(bdata->syscon, offset, mask, value);
>>   
>>   	return 0;
>>   }
>> @@ -296,6 +304,13 @@ static const struct omap_rproc_mem_data ipu_mems[] = {
>>   	{ },
>>   };
>>   
>> +static const struct omap_rproc_mem_data dra7_dsp_mems[] = {
>> +	{ .name = "l2ram", .dev_addr = 0x800000 },
>> +	{ .name = "l1pram", .dev_addr = 0xe00000 },
>> +	{ .name = "l1dram", .dev_addr = 0xf00000 },
>> +	{ },
>> +};
>> +
>>   static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>   	.device_name	= "dsp",
>>   };
>> @@ -314,6 +329,16 @@ static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>>   	.mems		= ipu_mems,
>>   };
>>   
>> +static const struct omap_rproc_dev_data dra7_dsp_dev_data = {
>> +	.device_name	= "dsp",
>> +	.mems		= dra7_dsp_mems,
>> +};
>> +
>> +static const struct omap_rproc_dev_data dra7_ipu_dev_data = {
>> +	.device_name	= "ipu",
>> +	.mems		= ipu_mems,
>> +};
>> +
>>   static const struct of_device_id omap_rproc_of_match[] = {
>>   	{
>>   		.compatible     = "ti,omap4-dsp",
>> @@ -331,6 +356,14 @@ static const struct of_device_id omap_rproc_of_match[] = {
>>   		.compatible     = "ti,omap5-ipu",
>>   		.data           = &omap5_ipu_dev_data,
>>   	},
>> +	{
>> +		.compatible     = "ti,dra7-dsp",
>> +		.data           = &dra7_dsp_dev_data,
>> +	},
>> +	{
>> +		.compatible     = "ti,dra7-ipu",
>> +		.data           = &dra7_ipu_dev_data,
>> +	},
>>   	{
>>   		/* end */
>>   	},
>> @@ -383,6 +416,9 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>   		return -EINVAL;
>>   	}
>>   
>> +	of_property_read_u32(np, "ti,bootreg-shift",
>> +			     &oproc->boot_data->boot_reg_shift);
> 
> Missing error checks, guess you will have to change this anyway when you
> address Rob's comments.

This one is actually intentional. The only expected failure is missing 
the ti,bootreg-shift, but even this is a valid situation; we will just 
use bootreg shift value of zero (boot-data is zero initialized.)

-Tero

> 
> regards
> Suman
> 
>> +
>>   	return 0;
>>   }
>>   
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
