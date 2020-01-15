Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 985F213C222
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgAOM6u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:58:50 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50432 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgAOM6u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jan 2020 07:58:50 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FCwnOt063206;
        Wed, 15 Jan 2020 06:58:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579093129;
        bh=CPpUW96znrNv4W2LWPXS0itKfbah2UFhRp18/0qZ6jg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dliCSZwFABJBYMdhREF7gmGUQKGKekiO2fsOltle0ApBNW0qJw9tGp4kSMtQa1Gr+
         0opO9K2O6vZvky3r/NbFGzsRRyIcuqlhi9YW3HrLoSfzNVPCZejhNIbmc3GbvKQiTP
         bbNZc+kG263S2+xfzilV6+pxLIF0/87EuUjxydvA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FCwnuj109694
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 06:58:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 06:58:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 06:58:49 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FCwkkD021782;
        Wed, 15 Jan 2020 06:58:47 -0600
Subject: Re: [PATCHv4 08/14] remoteproc/omap: remove the platform_data header
To:     Suman Anna <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20200102131845.12992-1-t-kristo@ti.com>
 <20200102131845.12992-9-t-kristo@ti.com>
 <4391856a-d956-751e-6d38-02f8306bb691@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <4a5d7320-1950-4ea8-19ee-3d09caeb3f80@ti.com>
Date:   Wed, 15 Jan 2020 14:58:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4391856a-d956-751e-6d38-02f8306bb691@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/01/2020 21:44, Suman Anna wrote:
> On 1/2/20 7:18 AM, Tero Kristo wrote:
>> The platform data header for OMAP remoteproc is no longer used for
>> anything post ti-sysc conversion, so just remove it completely.
> 
> Thanks for removing the header now altogether,
> %s/ti-sysc/ti-sysc and DT/ to be more accurate.
> 
> With that,
> Acked-by: Suman Anna <s-anna@ti.com>

Ok, will change that.

-Tero

> 
> regards
> Suman
> 
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>> v4:
>>    - new patch, to remove the platform data file completely compared to
>>      patches #8 / #9 in previous version of the series
>>
>>   include/linux/platform_data/remoteproc-omap.h | 51 -------------------
>>   1 file changed, 51 deletions(-)
>>   delete mode 100644 include/linux/platform_data/remoteproc-omap.h
>>
>> diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
>> deleted file mode 100644
>> index 7e3a16097672..000000000000
>> --- a/include/linux/platform_data/remoteproc-omap.h
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -/*
>> - * Remote Processor - omap-specific bits
>> - *
>> - * Copyright (C) 2011 Texas Instruments, Inc.
>> - * Copyright (C) 2011 Google, Inc.
>> - */
>> -
>> -#ifndef _PLAT_REMOTEPROC_H
>> -#define _PLAT_REMOTEPROC_H
>> -
>> -struct rproc_ops;
>> -struct platform_device;
>> -
>> -/*
>> - * struct omap_rproc_pdata - omap remoteproc's platform data
>> - * @name: the remoteproc's name
>> - * @oh_name: omap hwmod device
>> - * @oh_name_opt: optional, secondary omap hwmod device
>> - * @firmware: name of firmware file to load
>> - * @mbox_name: name of omap mailbox device to use with this rproc
>> - * @ops: start/stop rproc handlers
>> - * @device_enable: omap-specific handler for enabling a device
>> - * @device_shutdown: omap-specific handler for shutting down a device
>> - * @set_bootaddr: omap-specific handler for setting the rproc boot address
>> - */
>> -struct omap_rproc_pdata {
>> -	const char *name;
>> -	const char *oh_name;
>> -	const char *oh_name_opt;
>> -	const char *firmware;
>> -	const char *mbox_name;
>> -	const struct rproc_ops *ops;
>> -	int (*device_enable)(struct platform_device *pdev);
>> -	int (*device_shutdown)(struct platform_device *pdev);
>> -	void (*set_bootaddr)(u32);
>> -};
>> -
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
>> -#endif /* _PLAT_REMOTEPROC_H */
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
