Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBEE12786C
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 10:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfLTJsp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Dec 2019 04:48:45 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44450 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfLTJsp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Dec 2019 04:48:45 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBK9mhCe042423;
        Fri, 20 Dec 2019 03:48:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576835323;
        bh=PJ17UzNY/apXpn1nMC+XQajQwtEnnEDQ7Io/zryhhos=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OaCfQFaXCRSQHCYAC/WRyofuyoHpNCa7A6ofUWlsHwzOsaiWiynWar9heqRyvBPUn
         p5IDVySI3tYWgYmA3J2E34+NP4lvU+XEGiW6tEX2asFAxoliM48KxKGO6V30hL/IcV
         6elJkWOvyRZeD5XhPX54eU+wHyYngUytKtuPInnY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBK9mhIu062037
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Dec 2019 03:48:43 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Dec 2019 03:48:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Dec 2019 03:48:42 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK9meuh030043;
        Fri, 20 Dec 2019 03:48:40 -0600
Subject: Re: [PATCHv3 08/15] remoteproc/omap: Remove the unused fields from
 platform data
To:     Suman Anna <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20191213125537.11509-1-t-kristo@ti.com>
 <20191213125537.11509-9-t-kristo@ti.com>
 <abc17f7b-7664-9064-2e48-4b429847b105@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c8c6f665-fe91-0c49-7134-aff4d57112b7@ti.com>
Date:   Fri, 20 Dec 2019 11:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <abc17f7b-7664-9064-2e48-4b429847b105@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/12/2019 04:44, Suman Anna wrote:
> Hi Tero,
> 
> On 12/13/19 6:55 AM, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> The following fields: .name, .oh_name, .oh_name_opt, .mbox_name,
>> .firmware, .ops and .set_bootaddr, are removed from the platform data,
>> as these are no longer needed after the addition of DT support to the
>> OMAP remoteproc driver.
>>
>> The .name field was used to give a name to the remoteproc, and this
>> is replaced with the device name. The .ops field was never used by
>> the OMAP remoteproc driver. The .mbox_name was used to define the
>> sub-mailbox node used for communication with the remote processor,
>> and is retrieved using the 'mboxes' property in the DT node. The
>> .firmware field is encoded directly in the OMAP remoteproc driver and
>> is retrieved using driver match data. The .set_bootaddr ops was used
>> for using a OMAP Control Module API to configure the boot address for
>> the processor, and is now implemented within the driver using a
>> syscon property.
>>
>> The .oh_name field is used to define the primary hwmod for the processor
>> node, and is represented using the 'ti,hwmods' property in the DT node.
>> The .oh_name_opt field was primarily defined to identify the hwmod for
>> the second cpu in a dual Cortex-M3/M4 IPU processor sub-system. This
>> hwmod entry is no longer defined usually, but rather a single hwmod
>> representing both the processors in the IPU sub-system is defined.
>> A single firmware image (either in SMP-mode or a combined image for
>> non-SMP mode) is used, with both the resets released together always
>> as part of the device management. Any power management and recovery
>> aspects require that both the processors be managed as one entity due
>> to the presence of shared MMU and unicache within the IPU sub-system.
>>
>> The OMAP remoteproc platform data structure is eventually expected
>> to be removed completely once the other dependencies with the
>> mach-omap layer are met.
> 
> This patch was a cleanup patch with DT using hwmod, and some of the
> description is pertinent to that. Now that you have converted to ti,sysc
> & reset with no dependencies against hwmod, the time for removing the
> structure is here. Some of the patch description is no longer correct as
> well since there is no 'ti,hwmods' :)

Hmm right, let me see if the header can be dropped completely.

-Tero

> 
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>   include/linux/platform_data/remoteproc-omap.h | 17 +----------------
>>   1 file changed, 1 insertion(+), 16 deletions(-)
>>
>> diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
>> index 7e3a16097672..6bea01e199fe 100644
>> --- a/include/linux/platform_data/remoteproc-omap.h
>> +++ b/include/linux/platform_data/remoteproc-omap.h
>> @@ -2,38 +2,23 @@
>>   /*
>>    * Remote Processor - omap-specific bits
>>    *
>> - * Copyright (C) 2011 Texas Instruments, Inc.
>> + * Copyright (C) 2011-2018 Texas Instruments Incorporated - http://www.ti.com/
> 
> %s/2018/2019 when you do update the patch.
> 
> regards
> Suman
> 
>>    * Copyright (C) 2011 Google, Inc.
>>    */
>>   
>>   #ifndef _PLAT_REMOTEPROC_H
>>   #define _PLAT_REMOTEPROC_H
>>   
>> -struct rproc_ops;
>>   struct platform_device;
>>   
>>   /*
>>    * struct omap_rproc_pdata - omap remoteproc's platform data
>> - * @name: the remoteproc's name
>> - * @oh_name: omap hwmod device
>> - * @oh_name_opt: optional, secondary omap hwmod device
>> - * @firmware: name of firmware file to load
>> - * @mbox_name: name of omap mailbox device to use with this rproc
>> - * @ops: start/stop rproc handlers
>>    * @device_enable: omap-specific handler for enabling a device
>>    * @device_shutdown: omap-specific handler for shutting down a device
>> - * @set_bootaddr: omap-specific handler for setting the rproc boot address
>>    */
>>   struct omap_rproc_pdata {
>> -	const char *name;
>> -	const char *oh_name;
>> -	const char *oh_name_opt;
>> -	const char *firmware;
>> -	const char *mbox_name;
>> -	const struct rproc_ops *ops;
>>   	int (*device_enable)(struct platform_device *pdev);
>>   	int (*device_shutdown)(struct platform_device *pdev);
>> -	void (*set_bootaddr)(u32);
>>   };
>>   
>>   #if defined(CONFIG_OMAP_REMOTEPROC) || defined(CONFIG_OMAP_REMOTEPROC_MODULE)
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
