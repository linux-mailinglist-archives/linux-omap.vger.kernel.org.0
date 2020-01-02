Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3EE12E273
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 06:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgABFDR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 00:03:17 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49098 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgABFDR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 00:03:17 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00253DtI038466;
        Wed, 1 Jan 2020 23:03:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577941393;
        bh=2JBpoNtOtupEcNKplnC4aYCfr97euILV8B9kr6D9dhY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LX03GlaDFQd0iCbGTQ3SB19HPtwboeTdqJW5JPdnROJ57cPbQ4cfoWbwuEOr3LSYP
         GnHRTnx1lRzVJmmSNjhfl5kCIw1FwKXhJ6ZPcvx5ZW2XhVa5485iJu3OLuBkOiNh+X
         UQwVnqHRY/TYx4/rJXc73MC6aIgsyoi7T64d5/vk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00253D2l122211
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Jan 2020 23:03:13 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Jan
 2020 23:03:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Jan 2020 23:03:12 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00253AeO043636;
        Wed, 1 Jan 2020 23:03:11 -0600
Subject: Re: [PATCH v3 4/4] ARM: OMAP2+: sleep43xx: Call secure suspend/resume
 handlers
To:     "Andrew F. Davis" <afd@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191230185004.32279-1-afd@ti.com>
 <20191230185004.32279-5-afd@ti.com>
 <a29d1e78-9736-ea93-8a53-4600f8f48cde@ti.com>
 <344674f2-6996-0f02-5507-f35190fb66b0@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <6e1df3fc-c6c3-7dc4-1f91-b0a0aeaa3b0f@ti.com>
Date:   Thu, 2 Jan 2020 10:32:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <344674f2-6996-0f02-5507-f35190fb66b0@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 31/12/19 7:47 PM, Andrew F. Davis wrote:
> On 12/31/19 1:20 AM, Lokesh Vutla wrote:
>>
>>
>> On 31/12/19 12:20 AM, Andrew F. Davis wrote:
>>> During suspend CPU context may be lost in both non-secure and secure CPU
>>> states. The kernel can handle saving and restoring the non-secure context
>>> but must call into the secure side to allow it to save any context it may
>>> lose. Add these calls here.
>>>
>>> Note that on systems with OP-TEE available the suspend call is issued to
>>> OP-TEE using the ARM SMCCC, but the resume call is always issued to the
>>> ROM. This is because on waking from suspend the ROM is restored as the
>>> secure monitor. It is this resume call that instructs the ROM to restore
>>> OP-TEE, all subsequent calls will be handled by OP-TEE and should use the
>>> ARM SMCCC.
>>>
>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>> Acked-by: Dave Gerlach <d-gerlach@ti.com>
>>> ---
>>>  arch/arm/mach-omap2/omap-secure.h |  3 +++
>>>  arch/arm/mach-omap2/pm33xx-core.c | 17 +++++++++++++++++
>>>  2 files changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
>>> index 736e594365f4..ba8c486c0454 100644
>>> --- a/arch/arm/mach-omap2/omap-secure.h
>>> +++ b/arch/arm/mach-omap2/omap-secure.h
>>> @@ -53,6 +53,9 @@
>>>  #define OMAP4_PPA_L2_POR_INDEX		0x23
>>>  #define OMAP4_PPA_CPU_ACTRL_SMP_INDEX	0x25
>>>  
>>> +#define AM43xx_PPA_SVC_PM_SUSPEND	0x71
>>> +#define AM43xx_PPA_SVC_PM_RESUME	0x72
>>> +
>>>  /* Secure RX-51 PPA (Primary Protected Application) APIs */
>>>  #define RX51_PPA_HWRNG			29
>>>  #define RX51_PPA_L2_INVAL		40
>>> diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
>>> index f11442ed3eff..4a564f676ff9 100644
>>> --- a/arch/arm/mach-omap2/pm33xx-core.c
>>> +++ b/arch/arm/mach-omap2/pm33xx-core.c
>>> @@ -28,6 +28,7 @@
>>>  #include "prm33xx.h"
>>>  #include "soc.h"
>>>  #include "sram.h"
>>> +#include "omap-secure.h"
>>>  
>>>  static struct powerdomain *cefuse_pwrdm, *gfx_pwrdm, *per_pwrdm, *mpu_pwrdm;
>>>  static struct clockdomain *gfx_l4ls_clkdm;
>>> @@ -166,6 +167,16 @@ static int am43xx_suspend(unsigned int state, int (*fn)(unsigned long),
>>>  {
>>>  	int ret = 0;
>>>  
>>> +	/* Suspend secure side on HS devices */
>>> +	if (omap_type() != OMAP2_DEVICE_TYPE_GP) {
>>> +		if (optee_available)
>>> +			omap_smccc_smc(AM43xx_PPA_SVC_PM_SUSPEND, 0);
>>> +		else
>>> +			omap_secure_dispatcher(AM43xx_PPA_SVC_PM_SUSPEND,
>>> +					       FLAG_START_CRITICAL,
>>> +					       0, 0, 0, 0, 0);
>>> +	}
>>> +
>>>  	amx3_pre_suspend_common();
>>>  	scu_power_mode(scu_base, SCU_PM_POWEROFF);
>>>  	ret = cpu_suspend(args, fn);
>>> @@ -174,6 +185,12 @@ static int am43xx_suspend(unsigned int state, int (*fn)(unsigned long),
>>>  	if (!am43xx_check_off_mode_enable())
>>>  		amx3_post_suspend_common();
>>>  
>>> +	/* Resume secure side on HS devices */
>>> +	if (omap_type() != OMAP2_DEVICE_TYPE_GP)
>>> +		omap_secure_dispatcher(AM43xx_PPA_SVC_PM_RESUME,
>>> +				       FLAG_START_CRITICAL,
>>> +				       0, 0, 0, 0, 0);
>>
>> Don't you need to check optee_available here?
>>
> 
> 
> I address this in the second paragraph of the commit message. I can add
> a comment in code also if you think anyone will find it confusing.

Yeah, a comment would help.

Thanks and regards,
Lokesh

> 
> Andrew
> 
> 
>> Thanks and regards,
>> Lokesh
>>
>>> +
>>>  	return ret;
>>>  }
>>>  
>>>
