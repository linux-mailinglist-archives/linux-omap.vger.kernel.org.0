Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E684127388
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 03:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLTCeY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 21:34:24 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56838 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfLTCeY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 21:34:24 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBK2YLxR104807;
        Thu, 19 Dec 2019 20:34:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576809261;
        bh=PBGWCZIMwZ5RNu34zEdKuEOlYTouyF9F2WPVl+QhAEo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VOwV33QcAtR6m09EDZ+cu4SGtg8aGTk2adu0wVhho5tP5r1RDWeRo/Jl52x4n59Js
         LwyUBfo84cxD1oZ04omzh7mXdJcXmI7PKKP9AZNANOJcRWHTATIYDkK1CI3dn9PtyR
         9v0VG9pOoKg+Ss0y/m7/FFE6VlEO0mN35c/7AiLs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK2YL3F105500;
        Thu, 19 Dec 2019 20:34:21 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 20:34:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 20:34:20 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK2YK0f102070;
        Thu, 19 Dec 2019 20:34:20 -0600
Subject: Re: [PATCHv3 05/15] remoteproc/omap: Add the rproc ops .da_to_va()
 implementation
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-6-t-kristo@ti.com> <20191218003815.GC16271@xps15>
 <5869498f-086c-cea4-edcf-1b75fb22cf22@ti.com>
 <CANLsYkz=ZV-AABXq2mSdwKkcdkQgFwStepteFnMBc4j=ahe4Dw@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <bd76da62-c9ad-2284-cf4b-8b0f02ed3e66@ti.com>
Date:   Thu, 19 Dec 2019 20:34:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANLsYkz=ZV-AABXq2mSdwKkcdkQgFwStepteFnMBc4j=ahe4Dw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/19/19 6:12 PM, Mathieu Poirier wrote:
> On Thu, 19 Dec 2019 at 06:18, Tero Kristo <t-kristo@ti.com> wrote:
>>
>> On 18/12/2019 02:38, Mathieu Poirier wrote:
>>> On Fri, Dec 13, 2019 at 02:55:27PM +0200, Tero Kristo wrote:
>>>> From: Suman Anna <s-anna@ti.com>
>>>>
>>>> An implementation for the rproc ops .da_to_va() has been added
>>>> that provides the address translation between device addresses
>>>> to kernel virtual addresses for internal RAMs present on that
>>>> particular remote processor device. The implementation provides
>>>> the translations based on the addresses parsed and stored during
>>>> the probe.
>>>>
>>>> This ops gets invoked by the exported rproc_da_to_va() function
>>>> and allows the remoteproc core's ELF loader to be able to load
>>>> program data directly into the internal memories.
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>   drivers/remoteproc/omap_remoteproc.c | 39 ++++++++++++++++++++++++++++
>>>>   1 file changed, 39 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>>>> index 844703507a74..28f14e24b389 100644
>>>> --- a/drivers/remoteproc/omap_remoteproc.c
>>>> +++ b/drivers/remoteproc/omap_remoteproc.c
>>>> @@ -232,10 +232,49 @@ static int omap_rproc_stop(struct rproc *rproc)
>>>>      return 0;
>>>>   }
>>>>
>>>> +/**
>>>> + * omap_rproc_da_to_va() - internal memory translation helper
>>>> + * @rproc: remote processor to apply the address translation for
>>>> + * @da: device address to translate
>>>> + * @len: length of the memory buffer
>>>> + *
>>>> + * Custom function implementing the rproc .da_to_va ops to provide address
>>>> + * translation (device address to kernel virtual address) for internal RAMs
>>>> + * present in a DSP or IPU device). The translated addresses can be used
>>>> + * either by the remoteproc core for loading, or by any rpmsg bus drivers.
>>>> + * Returns the translated virtual address in kernel memory space, or NULL
>>>> + * in failure.
>>>> + */
>>>> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>>> +{
>>>> +    struct omap_rproc *oproc = rproc->priv;
>>>> +    int i;
>>>> +    u32 offset;
>>>> +
>>>> +    if (len <= 0)
>>>> +            return NULL;
>>>> +
>>>> +    if (!oproc->num_mems)
>>>> +            return NULL;
>>>> +
>>>> +    for (i = 0; i < oproc->num_mems; i++) {
>>>> +            if (da >= oproc->mem[i].dev_addr && da + len <=
>>>
>>> Shouldn't this be '<' rather than '<=' ?
>>
>> No, I think <= is correct. You need to consider the initial byte in the
>> range also. Consider a simple case where you provide the exact da + len
>> corresponding to a specific memory range.
> 
> For that specific case you are correct.  On the flip side if @da falls
> somewhere after @mem[i].dev_addr, there is a possibility to clobber
> the first byte of the next range if <= is used.

Not really, you will miss out on the last byte actually if you use just
<. This is just address range check, any memcpy would actually end one
byte before.

Eg: 0x80000 of len 0x10000. I should perfectly be able to copy 0x1000
bytes at 0x8f000.

regards
Suman


> 
> Thanks,
> Mathieu
> 
>>
>>>
>>>> +                oproc->mem[i].dev_addr +  oproc->mem[i].size) {
>>>
>>> One space too many after the '+' .
>>
>> True, I wonder why checkpatch did not catch this.
>>
>>>
>>>> +                    offset = da -  oproc->mem[i].dev_addr;
>>>
>>> One space too many after then '-' .
>>
>> Same, will fix these two.
>>
>> -Tero
>>
>>>
>>>> +                    /* __force to make sparse happy with type conversion */
>>>> +                    return (__force void *)(oproc->mem[i].cpu_addr +
>>>> +                                            offset);
>>>> +            }
>>>> +    }
>>>> +
>>>> +    return NULL;
>>>> +}
>>>> +
>>>>   static const struct rproc_ops omap_rproc_ops = {
>>>>      .start          = omap_rproc_start,
>>>>      .stop           = omap_rproc_stop,
>>>>      .kick           = omap_rproc_kick,
>>>> +    .da_to_va       = omap_rproc_da_to_va,
>>>>   };
>>>>
>>>>   static const char * const ipu_mem_names[] = {
>>>> --
>>>> 2.17.1
>>>>
>>>> --
>>
>> --
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

