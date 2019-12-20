Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE28127870
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 10:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfLTJtl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Dec 2019 04:49:41 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44526 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfLTJtl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Dec 2019 04:49:41 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBK9nd6R042676;
        Fri, 20 Dec 2019 03:49:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576835379;
        bh=QQcV+9YkaofN+92Zx46IG5q0lPQPGT6TS9og2QtYkvI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sSjUPVxxfOs/58dhff06y73O2VPjE4HZ29LFreqfiBLGfZHje8fytaiuCGq8Nzvl2
         trzbJI3AOVdyx9tVjFCclLnDoIR/rovNY+CXulVO8Nf4nO0UvQbj6wdCLqzE9gfUuJ
         /xnjYxE5TK68CAM4UBTymu59bIc65KXMVnYTMhmo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBK9ndlm063409
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Dec 2019 03:49:39 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Dec 2019 03:49:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Dec 2019 03:49:38 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK9nab3091264;
        Fri, 20 Dec 2019 03:49:36 -0600
Subject: Re: [PATCHv3 09/15] remoteproc/omap: Remove the
 omap_rproc_reserve_cma declaration
To:     Suman Anna <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-10-t-kristo@ti.com>
 <75420692-ecbc-f7cd-f7bc-9df0849d91dc@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c975de56-a6c6-a2d7-9eda-d075fad496d8@ti.com>
Date:   Fri, 20 Dec 2019 11:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <75420692-ecbc-f7cd-f7bc-9df0849d91dc@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/12/2019 04:47, Suman Anna wrote:
> Hi Tero,
> 
> On 12/13/19 6:55 AM, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> The omap_rproc_reserve_cma() function is not defined at the moment.
>> This prototype was to be used to define a function to declare a
>> remoteproc device-specific CMA pool.
>>
>> The remoteproc devices will be defined through DT going forward. A
>> device specific CMA pool will be defined under the reserved-memory
>> node, and will be associated with the appropriate remoteproc device
>> node. This function prototype will no longer be needed and has
>> therefore been cleaned up.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> With the structure removed, you can actually drop the file altogether.

Yeah, let me check that out.

-Tero

> 
> regards
> Suman
> 
>> ---
>>   include/linux/platform_data/remoteproc-omap.h | 12 ------------
>>   1 file changed, 12 deletions(-)
>>
>> diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
>> index 6bea01e199fe..49c78805916f 100644
>> --- a/include/linux/platform_data/remoteproc-omap.h
>> +++ b/include/linux/platform_data/remoteproc-omap.h
>> @@ -21,16 +21,4 @@ struct omap_rproc_pdata {
>>   	int (*device_shutdown)(struct platform_device *pdev);
>>   };
>>   
>> -#if defined(CONFIG_OMAP_REMOTEPROC) || defined(CONFIG_OMAP_REMOTEPROC_MODULE)
>> -
>> -void __init omap_rproc_reserve_cma(void);
>> -
>> -#else
>> -
>> -static inline void __init omap_rproc_reserve_cma(void)
>> -{
>> -}
>> -
>> -#endif
>> -
>>   #endif /* _PLAT_REMOTEPROC_H */
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
