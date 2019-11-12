Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65BD0F8A6D
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfKLIWr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:22:47 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40716 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfKLIWr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:22:47 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8MjxH112223;
        Tue, 12 Nov 2019 02:22:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573546965;
        bh=2zHB2apUIvCfaoDVEWArD/pmK6gEjGZhE+A89O6V2o8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=T+To3vLS2gSkjO7m8I7kjdL2v6Xqp1C1G7DAq0w8RidzmU+o/s7sxypyQrSnCaGmK
         TIBhkD5lCQxUY6JwTojl8oBvOzrMm7abHMVyjylq5pW2Q9SuboZdypfPinPO32i5yS
         e+ezq2qBInA+PdTep13SyhHNg8rOwmLBBzzSbYYE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAC8MjK2024124
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 02:22:45 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:22:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:22:26 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8Mdfr043887;
        Tue, 12 Nov 2019 02:22:40 -0600
Subject: Re: [PATCH 06/17] remoteproc/omap: Add the rproc ops .da_to_va()
 implementation
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-7-t-kristo@ti.com> <20191111232251.GH3108315@builder>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <9670e8ad-4c36-2ad1-5967-931b0fc97343@ti.com>
Date:   Tue, 12 Nov 2019 10:22:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111232251.GH3108315@builder>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 01:22, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> 
>> From: Suman Anna <s-anna@ti.com>
>>
>> An implementation for the rproc ops .da_to_va() has been added
>> that provides the address translation between device addresses
>> to kernel virtual addresses for internal RAMs present on that
>> particular remote processor device. The implementation provides
>> the translations based on the addresses parsed and stored during
>> the probe.
>>
>> This ops gets invoked by the exported rproc_da_to_va() function
>> and allows the remoteproc core's ELF loader to be able to load
>> program data directly into the internal memories.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/remoteproc/omap_remoteproc.c | 35 ++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index bbd6ff360e10..0524f7e0ffa4 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -230,10 +230,45 @@ static int omap_rproc_stop(struct rproc *rproc)
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Internal Memory translation helper
> 
> Please format this as kerneldoc.
> 
>> + *
>> + * Custom function implementing the rproc .da_to_va ops to provide address
>> + * translation (device address to kernel virtual address) for internal RAMs
>> + * present in a DSP or IPU device). The translated addresses can be used
>> + * either by the remoteproc core for loading, or by any rpmsg bus drivers.
>> + */
>> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> +{
>> +	struct omap_rproc *oproc = rproc->priv;
>> +	void *va = NULL;
>> +	int i;
>> +	u32 offset;
>> +
>> +	if (len <= 0)
>> +		return NULL;
>> +
>> +	if (!oproc->num_mems)
>> +		return NULL;
>> +
>> +	for (i = 0; i < oproc->num_mems; i++) {
>> +		if (da >= oproc->mem[i].dev_addr && da + len <=
>> +		    oproc->mem[i].dev_addr +  oproc->mem[i].size) {
>> +			offset = da -  oproc->mem[i].dev_addr;
>> +			/* __force to make sparse happy with type conversion */
>> +			va = (__force void *)(oproc->mem[i].cpu_addr + offset);
> 
> Replace va = and break; with just a return here.

Right, va seems to be completely redundant local variable.

> 
>> +			break;
>> +		}
>> +	}
>> +
>> +	return va;
> 
> return NULL here.

Yep will do.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
