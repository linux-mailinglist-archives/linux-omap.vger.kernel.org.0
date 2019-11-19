Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94E6102BF0
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 19:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbfKSSuk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 13:50:40 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58654 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfKSSuk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 13:50:40 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJIoY0w117974;
        Tue, 19 Nov 2019 12:50:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574189434;
        bh=1rT3PY95YiGZt6aG3eiVAjFCuDsDatO18cV5ZcK6r40=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XuRz3A7IVegTfw6he7jzpo0NIIA5EQ37em7E5o6t9P1biaHZHSYvPdOIrUzDB16Tk
         5KVp1l4AKtyuxnI7q8+se9BWOCqJqTv2cuFsUMQnuy46pj4afU6aR5BFIM7GY3DpcC
         8vn69burALNhDHK3SzYjMW4uaOCatc3UW+S+dKac=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJIoY2C118651;
        Tue, 19 Nov 2019 12:50:34 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 12:50:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 12:50:31 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJIoUA0074509;
        Tue, 19 Nov 2019 12:50:30 -0600
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
 <6e009ae3-6aa2-409b-749f-4947303940d8@ti.com>
 <20191119164227.GL35479@atomide.com> <20191119180546.GM35479@atomide.com>
 <9e15c170-c9fa-778c-d998-bd1111a6390d@ti.com>
 <20191119183247.GN35479@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <a351461a-f6a1-334b-6bdd-a56626914fb3@ti.com>
Date:   Tue, 19 Nov 2019 13:50:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119183247.GN35479@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/19/19 1:32 PM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [191119 18:21]:
>> On 11/19/19 1:05 PM, Tony Lindgren wrote:
>>> * Tony Lindgren <tony@atomide.com> [191119 16:43]:
>>>> What I'd like to have though is to make arm_smccc_smc()
>>>> work for optee and non-optee case for mach-omap2 as it
>>>> already has the features necessary to do the runtime
>>>> patching of the code for the quirks.
>>>
>>> In any case sounds like we only need the r12 quirk when
>>> optee is _not_ enabled.
>>>
>>> So a modified version of your earlier smccc-call.S patch
>>> modified to only enable the r12 quirk when no optee is
>>> loaded just might be all we need :)
>>
>> Doesn't change the reason the earlier patch was NAKd, we would still be
>> modifying the core SMCCC call to be non-compliant.
> 
> Well let's see what Mark says about r12 quirk version
> that is only needed when optee is not active.
> 
>> And doing it only when OP-TEE is not installed doesn't gain us anything,
>> we already have our own SMC calls for when OP-TEE is not available, this
>> patch is specifically so the OMAP2+ boot still works even when OP-TEE is
>> installed.
> 
> It would allow us to completely change over to using
> arm_smccc_smc() and forget the custom calls.
> 


We would need more than just the r12 quirk to replace all our custom SMC
handlers, we would need quirks for omap_smc2 which puts process ID in r1
and puts #0xff in r6, and omap_smc3 that uses smc #1. All of our legacy
SMC calls also trash r4-r11, that is very non SMCCC complaint as only
r4-r7 need be caller saved. I don't see arm_smccc_smc() working with
legacy ROM no matter how much we hack at it :(


>> If you can get Mark to take my old patch then we can think about moving
>> more legacy SMC callers to the SMCCC, otherwise this patch is what we
>> need to get OP-TEE enabled OMAP2+ platforms to boot and we will just
>> stick to the custom SMC functions we already have for everything else.
> 
> To me it sounds like your old patch won't work as is though,
> we just want the code modified dynamically if optee is not
> present to enable the r12 quirk.
> 


I can make OP-TEE also compatible with the r12 quirk, which is what I
used to do. That way we didn't need to do any detection. The issue was
that non-standard SMC calls should not go through the common SMCCC
handler (unless you are QCOM for some reason..).

Andrew


> Of course if both the optee version without the r12 quirk,
> and a non-optee version with the r12 of the arm_smccc_smc()
> are needed the same time on a booted system, then they should
> be kept separate.
> 
> Regards,
> 
> Tony
> 
