Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D56349AEA
	for <lists+linux-omap@lfdr.de>; Thu, 25 Mar 2021 21:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhCYUTu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Mar 2021 16:19:50 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57740 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhCYUTm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Mar 2021 16:19:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12PKJYuD097527;
        Thu, 25 Mar 2021 15:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616703574;
        bh=KJuR5o9jImcczuGWZKeZZQslt0l/R8oIMFWCY3BFEXk=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=ldH6kROWnb/k4wIZ45z+D3SUXvQ5abynuNadg6cqv7PqgPHpMxaEH7sZm6NeN1rKr
         FMBu9d7D/5nVEraG6VQ53CpdN+pIJ0HIpKkPmLllWAlFvOOVYDKY0Ug3/LqM9kCV3R
         1M/hdWJkBY83IYITdsyP0ctTbm72vuRj8/FwNZqg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12PKJYDM015438
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Mar 2021 15:19:34 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 25
 Mar 2021 15:18:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 25 Mar 2021 15:18:21 -0500
Received: from [10.250.33.213] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12PKILUr130709;
        Thu, 25 Mar 2021 15:18:21 -0500
Subject: Re: [PATCH] remoteproc: pru: Fix firmware loading crashes on K3 SoCs
From:   Suman Anna <s-anna@ti.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210315205859.19590-1-s-anna@ti.com>
 <20210323232014.GA1782475@xps15>
 <2f8bfc4f-e43d-5e38-fc6d-7045c69af364@ti.com>
 <CANLsYkw75yTfzXBOV4u03XETYH4zfOPUozKRxp=RroYvzfXR9Q@mail.gmail.com>
 <eac64cf8-79bf-692d-8884-2cb340598e04@ti.com>
Message-ID: <d4ec2cf5-9a6c-9245-ebe0-2cc1aa7bbbcd@ti.com>
Date:   Thu, 25 Mar 2021 15:18:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eac64cf8-79bf-692d-8884-2cb340598e04@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 3/25/21 3:09 PM, Suman Anna wrote:
> On 3/25/21 12:36 PM, Mathieu Poirier wrote:
>> On Wed, 24 Mar 2021 at 11:09, Suman Anna <s-anna@ti.com> wrote:
>>>
>>> On 3/23/21 6:20 PM, Mathieu Poirier wrote:
>>>> On Mon, Mar 15, 2021 at 03:58:59PM -0500, Suman Anna wrote:
>>>>> The K3 PRUs are 32-bit processors and in general have some limitations
>>>>> in using the standard ARMv8 memcpy function for loading firmware segments,
>>>>> so the driver already uses a custom memcpy implementation. This added
>>>>> logic however is limited to only IRAMs at the moment, but the loading
>>>>> into Data RAMs is not completely ok either and does generate a kernel
>>>>> crash for unaligned accesses.
>>>>>
>>>>> Fix these crashes by removing the existing IRAM logic limitation and
>>>>> extending the custom memcpy usage to Data RAMs as well for all K3 SoCs.
>>>>>
>>>>> Fixes: 1d39f4d19921 ("remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs")
>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>
>>>> Probably a good idea to CC stable as well...
>>>>
>>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>
>>> Thanks Mathieu. This patch is already staged on Bjorn's rproc-fixes branch
>>> though and part of linux-next since next-20210319. I have posted an additional
>>> 3-patch series for some more PRU fixes. Do you want me to post a v2 for those
>>> with stable Cc'd?
>>
>> I didn't notice Bjorn had already picked it up.  Since the object is
>> now public there is no need to send a V2 for this one.  I haven't
>> looked at your other 3-patch series but if you think it is stable
>> material then yes, please send a new revision that CC stable.
> 
> Alright, will do.

On a second thought, we don't have any dts nodes in-kernel yet (5.13-rc1 would
be the first kernel with PRU nodes), so those are not critical for v5.11 kernel.
As long as they get fixed in either the current v5.12-rc's or by v5.13-rc1, we
will be fine.

regards
Suman

> 
> regards
> Suman
> 
>>
>> Mathieu
>>
>>>
>>> regards
>>> Suman
>>>
>>>>
>>>>> ---
>>>>>  drivers/remoteproc/pru_rproc.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
>>>>> index 2667919d76b3..16979c1cd2f4 100644
>>>>> --- a/drivers/remoteproc/pru_rproc.c
>>>>> +++ b/drivers/remoteproc/pru_rproc.c
>>>>> @@ -585,7 +585,7 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
>>>>>                      break;
>>>>>              }
>>>>>
>>>>> -            if (pru->data->is_k3 && is_iram) {
>>>>> +            if (pru->data->is_k3) {
>>>>>                      ret = pru_rproc_memcpy(ptr, elf_data + phdr->p_offset,
>>>>>                                             filesz);
>>>>>                      if (ret) {
>>>>> --
>>>>> 2.30.1
>>>>>
>>>
> 

