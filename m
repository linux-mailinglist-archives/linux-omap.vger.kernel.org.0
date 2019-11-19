Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00873102968
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 17:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfKSQai (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 11:30:38 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48788 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbfKSQah (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 11:30:37 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJGUQsH036701;
        Tue, 19 Nov 2019 10:30:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574181026;
        bh=fzVmaTFE/+khI14UweKO/zPXmFonF8H0Ptm7rO5t6rs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YN6uVoAhGiQgjtcpdFjLKTRRQM7OyhyUIyVE26IgkqyC8rwm65ARyD4lbsIAN3DKZ
         FtQNjxYHtk1uwoyV9RPWfhK2fZf7XHyDI/ts7IWILb/Q7eyIJcVEn/8WtD4oULdXVw
         w/8t1SR/LFKK8yWZYaRZaTd2GYr0LPCyXt4U9Lns=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJGUQoZ126114
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 10:30:26 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 10:30:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 10:30:25 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJGUPQY108564;
        Tue, 19 Nov 2019 10:30:25 -0600
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
To:     Tony Lindgren <tony@atomide.com>
CC:     Mark Rutland <mark.rutland@arm.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191118165236.22136-1-afd@ti.com>
 <20191118215759.GD35479@atomide.com>
 <b86e1d66-1566-521c-a445-4f0ae2fd95d6@ti.com>
 <20191118223128.GE35479@atomide.com>
 <29db708e-119e-8a89-7d43-e38e2a10dc07@ti.com>
 <20191119162157.GJ35479@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <6e009ae3-6aa2-409b-749f-4947303940d8@ti.com>
Date:   Tue, 19 Nov 2019 11:30:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119162157.GJ35479@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/19/19 11:21 AM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [191119 01:14]:
>> On 11/18/19 5:31 PM, Tony Lindgren wrote:
>>> * Andrew F. Davis <afd@ti.com> [191118 22:14]:
>>>> On 11/18/19 4:57 PM, Tony Lindgren wrote:
>>>>> Hi,
>>>>>
>>>>> * Andrew F. Davis <afd@ti.com> [191118 08:53]:
>>>>>> +#define OMAP_SIP_SMC_STD_CALL_VAL(func_num) \
>>>>>> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_32, \
>>>>>> +	ARM_SMCCC_OWNER_SIP, (func_num))
>>>>>> +
>>>>>> +void omap_smc1(u32 fn, u32 arg)
>>>>>> +{
>>>>>> +	struct device_node *optee;
>>>>>> +	struct arm_smccc_res res;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * If this platform has OP-TEE installed we use ARM SMC calls
>>>>>> +	 * otherwise fall back to the OMAP ROM style calls.
>>>>>> +	 */
>>>>>> +	optee = of_find_node_by_path("/firmware/optee");
>>>>>> +	if (optee) {
>>>>>> +		arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn), arg,
>>>>>> +			      0, 0, 0, 0, 0, 0, &res);
>>>>>> +		WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
>>>>>> +	} else {
>>>>>> +		_omap_smc1(fn, arg);
>>>>>> +	}
>>>>>> +}
>>>>>
>>>>> I think we're better off just making arm_smccc_smc() work properly.
>>>>> See cat arch/arm*/kernel/smccc-call.S.
>>>>>
>>>>
>>>>
>>>> arm_smccc_smc() does work properly already, I'm using it here.
>>>
>>> OK. I guess I don't follow then why we can't use arm_smccc_smc()
>>> for old code.
>>>
>>
>>
>> Our ROM code needs r12 to have the function code in it, where as the ARM
>> SMC calling convention standard requires that (plus some other
>> information) stored in r0. Our ROM doesn't know anything about the that
>> standard that came out years after we shipped these devices. And as such
>> is not complaint.
> 
> Right.
> 
>> A generic smc() call would be nice, but arm_smccc_smc() is specifically
>> for SMCCC.
> 
> To me it seeems that HAVE_ARM_SMCCC is a generic feature though.
> It's not limited to OPTEE. We have select HAVE_ARM_SMCCC if CPU_V7
> in arch/arm/Kconfig, and OPTEE depends on HAVE_ARM_SMCCC.
> 


It is not just for OP-TEE but for communicating with any compliant
system monitor/trustzone. Our ROM monitor is not compliant.


> From that point of view it seems that we could have HAVE_ARM_SMCCC
> enabled also for v6 and use it for all mach-omap2 with a wrapper.
> 
> So I'd like to have our smc callers eventually just call generic
> generic arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn)...) rather
> than the custom calls. And we want to update to using the generic
> functions one case at a time as the features get tested :)
> 


It wont work, as said above, arm_smccc_smc() is not compatible with our
ROM, no wrapper around that function will make it work with our ROM, it
is not able to load our function number into r12 where the ROM expects
it. The function number for arm_smccc_smc() goes into r0, r12 is not
even exposed through arm_smccc_smc().


> In any case, you should do the necessary checks for HAVE_ARM_SMCCC
> only once during init. I'm not sure how much checking for
> "/firmware/optee" helps here, sounds like we have a broken system
> if the firmware is not there while the arm_smccc_smc() should
> still work just fine :)


arm_smccc_smc() only works on mach-omap2 platforms when OP-TEE is
available. On older system or systems where OP-TEE has not been
installed we need to fall back to our custom smc() calls.

Andrew


> 
> Regards,
> 
> Tony
> 
