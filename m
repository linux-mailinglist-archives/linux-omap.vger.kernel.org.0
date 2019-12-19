Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3FA126379
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2019 14:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLSN3U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 08:29:20 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35348 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSN3U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 08:29:20 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJDTHkH125291;
        Thu, 19 Dec 2019 07:29:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576762157;
        bh=dS/xqM+ZosGF60kpQjGAN8mLwLCwkxr3vRiW1x7FztU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=t3sO7sOFgSxDIkf+bBpxOsT2R/8db0pNfzoZ6jEIvxr2nWny1CWJlSbyLfv4VwBGx
         9XdimePI+VhyIDqQrI2wUil6CEWbxvpZL7uBW2Hhw4F7F0LfdH5UAUaj4iRFIri2SE
         SXzZOsIXKr0rCe6AB5yrNV+Itb3Uqbc3oLeJtlVM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJDTHsS043917
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Dec 2019 07:29:17 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 07:29:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 07:29:17 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJDTEkF064669;
        Thu, 19 Dec 2019 07:29:15 -0600
Subject: Re: [PATCHv3 07/15] remoteproc/omap: Add support for DRA7xx remote
 processors
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-8-t-kristo@ti.com> <20191218213152.GD16271@xps15>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <0c817542-b4b8-9dde-3efd-a7878ab19f79@ti.com>
Date:   Thu, 19 Dec 2019 15:29:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218213152.GD16271@xps15>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/12/2019 23:31, Mathieu Poirier wrote:
> On Fri, Dec 13, 2019 at 02:55:29PM +0200, Tero Kristo wrote:
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
>>   drivers/remoteproc/Kconfig           |  2 +-
>>   drivers/remoteproc/omap_remoteproc.c | 44 +++++++++++++++++++++++++++-
>>   2 files changed, 44 insertions(+), 2 deletions(-)
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
>> index 3ad74c4b4071..6cf7f0a9ba9a 100644
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
>>   /*
>> @@ -78,12 +81,14 @@ struct omap_rproc {
>>    * struct omap_rproc_dev_data - device data for the omap remote processor
>>    * @device_name: device name of the remote processor
>>    * @has_bootreg: true if this remote processor has boot register
>> + * @boot_reg_shift: bit shift for the boot register mask
>>    * @mem_names: memory names for this remote processor
>>    * @dev_addrs: device addresses corresponding to the memory names
>>    */
>>   struct omap_rproc_dev_data {
>>   	const char *device_name;
>>   	bool has_bootreg;
>> +	int boot_reg_shift;
>>   	const char * const *mem_names;
>>   	const u32 *dev_addrs;
>>   };
>> @@ -153,6 +158,8 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>>   	struct omap_rproc *oproc = rproc->priv;
>>   	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>>   	u32 offset = bdata->boot_reg;
>> +	u32 value;
>> +	u32 mask;
>>   
>>   	if (rproc->bootaddr & (SZ_1K - 1)) {
>>   		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
>> @@ -160,7 +167,10 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
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
>> @@ -286,6 +296,14 @@ static const u32 ipu_dev_addrs[] = {
>>   	0x20000000,
>>   };
>>   
>> +static const char * const dra7_dsp_mem_names[] = {
>> +	"l2ram", "l1pram", "l1dram", NULL
>> +};
>> +
>> +static const u32 dra7_dsp_dev_addrs[] = {
>> +	0x800000, 0xe00000, 0xf00000,
>> +};
>> +
>>   static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>>   	.device_name	= "dsp",
>>   	.has_bootreg	= true,
>> @@ -308,6 +326,20 @@ static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>>   	.dev_addrs	= ipu_dev_addrs,
>>   };
>>   
>> +static const struct omap_rproc_dev_data dra7_dsp_dev_data = {
>> +	.device_name	= "dsp",
>> +	.has_bootreg	= true,
> 
> Shouldn't this be solely driven from the DT?  If the "ti,bootreg" is specified
> then we can count on omap_rproc::boot_data to provide the same functionality.
> 
> 
>> +	.boot_reg_shift	= 10,
> 
> I also think this should be driven from the DT.  Otherwise some information is
> from the DT and other is hard coded in the omap_rproc_dev_data.

Hmm right I believe this is a fair point. Let me fix that for next rev.

-Tero

> 
>> +	.mem_names	= dra7_dsp_mem_names,
>> +	.dev_addrs	= dra7_dsp_dev_addrs,
>> +};
>> +
>> +static const struct omap_rproc_dev_data dra7_ipu_dev_data = {
>> +	.device_name	= "ipu",
>> +	.mem_names	= ipu_mem_names,
>> +	.dev_addrs	= ipu_dev_addrs,
>> +};
>> +
>>   static const struct of_device_id omap_rproc_of_match[] = {
>>   	{
>>   		.compatible     = "ti,omap4-dsp",
>> @@ -325,6 +357,14 @@ static const struct of_device_id omap_rproc_of_match[] = {
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
>> @@ -382,6 +422,8 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>   		return -EINVAL;
>>   	}
>>   
>> +	oproc->boot_data->boot_reg_shift = data->boot_reg_shift;
>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
