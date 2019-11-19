Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D0B101088
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 02:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfKSBNe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 20:13:34 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37322 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfKSBNd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 20:13:33 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJ1DStQ004176;
        Mon, 18 Nov 2019 19:13:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574126008;
        bh=j/MvRXenpo6jOcTmnPaSp7brdT6l/vikV60lBViwoug=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nWWTFJsecNyAIVtZfocnq9MLTytMdr318wByrjKjR8NH9r4CVMn+aU0ykbxsnnfy2
         4wrPmwcE/bxcNIJnlJSON/3FsaLsqZwbYpPeruptwziCuEVju0YY7AUwDQjA4YQNL3
         F/qwSBT4HFCJMjb1Wqo8CMPsq5BZL4mzPVEyHRaI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJ1DSST105603
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 19:13:28 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 19:13:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 19:13:27 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJ1DRxJ066842;
        Mon, 18 Nov 2019 19:13:27 -0600
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
To:     Tony Lindgren <tony@atomide.com>
CC:     Mark Rutland <mark.rutland@arm.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191118165236.22136-1-afd@ti.com>
 <20191118215759.GD35479@atomide.com>
 <b86e1d66-1566-521c-a445-4f0ae2fd95d6@ti.com>
 <20191118223128.GE35479@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <29db708e-119e-8a89-7d43-e38e2a10dc07@ti.com>
Date:   Mon, 18 Nov 2019 20:13:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118223128.GE35479@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/18/19 5:31 PM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [191118 22:14]:
>> On 11/18/19 4:57 PM, Tony Lindgren wrote:
>>> Hi,
>>>
>>> * Andrew F. Davis <afd@ti.com> [191118 08:53]:
>>>> +#define OMAP_SIP_SMC_STD_CALL_VAL(func_num) \
>>>> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_32, \
>>>> +	ARM_SMCCC_OWNER_SIP, (func_num))
>>>> +
>>>> +void omap_smc1(u32 fn, u32 arg)
>>>> +{
>>>> +	struct device_node *optee;
>>>> +	struct arm_smccc_res res;
>>>> +
>>>> +	/*
>>>> +	 * If this platform has OP-TEE installed we use ARM SMC calls
>>>> +	 * otherwise fall back to the OMAP ROM style calls.
>>>> +	 */
>>>> +	optee = of_find_node_by_path("/firmware/optee");
>>>> +	if (optee) {
>>>> +		arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn), arg,
>>>> +			      0, 0, 0, 0, 0, 0, &res);
>>>> +		WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
>>>> +	} else {
>>>> +		_omap_smc1(fn, arg);
>>>> +	}
>>>> +}
>>>
>>> I think we're better off just making arm_smccc_smc() work properly.
>>> See cat arch/arm*/kernel/smccc-call.S.
>>>
>>
>>
>> arm_smccc_smc() does work properly already, I'm using it here.
> 
> OK. I guess I don't follow then why we can't use arm_smccc_smc()
> for old code.
> 


Our ROM code needs r12 to have the function code in it, where as the ARM
SMC calling convention standard requires that (plus some other
information) stored in r0. Our ROM doesn't know anything about the that
standard that came out years after we shipped these devices. And as such
is not complaint.

A generic smc() call would be nice, but arm_smccc_smc() is specifically
for SMCCC.


>>> If quirk handling is needed, looks like ARM_SMCCC_QUIRK_STATE_OFFS
>>> can be used.
>>>
>>
>>
>> Tried that [0], was NAKd. Making quirk-free SMCCC calls if OP-TEE is
>> detected seems to be the suggested path forward, QCOM got a pass,
>> doesn't look like we will get the same.
>>
>> +Mark, in case you want to comment if this patch matches what you had in
>> mind.
>>
>> [0] https://www.spinics.net/lists/arm-kernel/msg607263.html
> 
> Yeah I might be missing some parts here..
> 
>>> AFAIK this should work both for optee and the current use cases.
> 
> .. as I'd like to have a solution that works for both cases using
> arm_smccc_smc().
> 
> If r12 is the only issue, souds like we can just use a wrapper
> for the legacy calls to call arm_smccc_smc()?
> 


The standard does not define r12, to be compliant to the standard r12
must not be used. arm_smccc_smc() doesn't allow us to populate it even
if we wanted, only r0-r7.

In the above linked patch I made a quirk version that allowed for r12
use but got NAKd, I'm not sure of any other way outside of something
like this patch.

Andrew


> Regards,
> 
> Tony
> 
