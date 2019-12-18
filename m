Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA63B123C2A
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 02:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfLRBBF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 20:01:05 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48064 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfLRBBF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 20:01:05 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBI1104i096893;
        Tue, 17 Dec 2019 19:01:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576630860;
        bh=gWirss4z2TwsaaOabHQAhC/9any+J11ohnxYoUt21FQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=iYJmRToxlA3+cExa6lRletT31wdgaKZGS0dl5zMKqvuolEJkSMSpHV+CPFfzxCM/P
         RsJvlbTH2iQFfythblCw45W8UqwPE4Bz4Q6sBsOyZuvn+CumjRlTHJTsFJeKDgyoLJ
         Nqes72vShmqoxuF9uRnGG9SP1h2A4ZOOQZs+3Y8M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBI110Cs096174
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 19:01:00 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 19:01:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 19:01:00 -0600
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBI10xPM120389;
        Tue, 17 Dec 2019 19:01:00 -0600
Subject: Re: [PATCH v2 2/3] ARM: OMAP2+: Introduce check for OP-TEE in
 omap_secure_init()
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191217234745.4434-1-afd@ti.com>
 <20191217234745.4434-3-afd@ti.com> <20191218005316.GG35479@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <f2efedb7-8050-2c16-02d0-a534c00a497e@ti.com>
Date:   Tue, 17 Dec 2019 20:00:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218005316.GG35479@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/17/19 7:53 PM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [191217 23:48]:
>> --- a/arch/arm/mach-omap2/omap-secure.c
>> +++ b/arch/arm/mach-omap2/omap-secure.c
>> @@ -20,6 +21,18 @@
>>  
>>  static phys_addr_t omap_secure_memblock_base;
>>  
>> +bool optee_available;
> 
> The above can be static bool optee_available?
> 
>> --- a/arch/arm/mach-omap2/omap-secure.h
>> +++ b/arch/arm/mach-omap2/omap-secure.h
>> @@ -10,6 +10,8 @@
>>  #ifndef OMAP_ARCH_OMAP_SECURE_H
>>  #define OMAP_ARCH_OMAP_SECURE_H
>>  
>> +#include <linux/types.h>
>> +
>>  /* Monitor error code */
>>  #define  API_HAL_RET_VALUE_NS2S_CONVERSION_ERROR	0xFFFFFFFE
>>  #define  API_HAL_RET_VALUE_SERVICE_UNKNWON		0xFFFFFFFF
>> @@ -72,6 +74,7 @@ extern u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
>>  extern u32 rx51_secure_update_aux_cr(u32 set_bits, u32 clear_bits);
>>  extern u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag);
>>  
>> +extern bool optee_available;
>>  void omap_secure_init(void);
> 
> And then this change should not be needed, right?
> 


I have a staged change I'm about to post that makes use of this flag
from outside of omap-secure.c, otherwise I would have left it internal
to that file.

I could also have moved the flag in the patch that uses it, but it
seemed like an unnecessary change given I know it will be needed here soon.

Andrew


> Otherwise series looks OK to me, thanks for updating it.
> 
> Regards,
> 
> Tony
> 
