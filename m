Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5FE7121E1F
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 23:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfLPWeP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 17:34:15 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34100 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfLPWeO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Dec 2019 17:34:14 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGMY8Aj039879;
        Mon, 16 Dec 2019 16:34:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576535648;
        bh=EnqJnVYZz+faeK6XiG5eCtHJXBU9SazPb4iIs6/0beY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=csuyG/cCjtXJYYbJPlQHicQKdY3F3ZS0S//Gf4x7LgnX9+rRdxDk5DtJa3RFN4bmS
         RRRR9anCMs+nU2zk8lJPpC6cs2VAAXY/M5NkYFZiMZKcxW/Mutne5fhSFBkCUNkIvm
         x1zPGpq+I3Azh3clC0d6xjg95c7uoirVIxF2geIY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGMY8bc043385
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Dec 2019 16:34:08 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 16:34:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 16:34:07 -0600
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGMY6jg028590;
        Mon, 16 Dec 2019 16:34:07 -0600
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
To:     Tony Lindgren <tony@atomide.com>
CC:     Mark Rutland <mark.rutland@arm.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <9e15c170-c9fa-778c-d998-bd1111a6390d@ti.com>
 <20191119183247.GN35479@atomide.com>
 <a351461a-f6a1-334b-6bdd-a56626914fb3@ti.com>
 <20191119190721.GO35479@atomide.com>
 <7fa11037-8d33-2274-c8cc-80e9630b38b0@ti.com>
 <20191119192029.GP35479@atomide.com>
 <0ad31b32-712e-5bef-5645-0336dfec99cc@ti.com>
 <20191119194425.GQ35479@atomide.com>
 <f2f53e5e-6c95-e32f-d67a-284bb88e73e0@ti.com>
 <1ff8ae4b-5de3-4fdf-7318-d33398dc7fc8@ti.com>
 <20191216210407.GR35479@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <9adad579-98b4-f228-caf3-f4996dcaecda@ti.com>
Date:   Mon, 16 Dec 2019 17:34:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216210407.GR35479@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/16/19 4:04 PM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [191216 20:57]:
>> Looks like the TI quirk idea is not moving forward, even the QCOM quirk
>> looks like it may get kicked out. arm_smccc_smc() will remain only for
>> SMCCC compliant calls, but it looks like a generic arm_smc() wouldn't be
>> too opposed upstream.
> 
> Yes so it seems.
> 
>> Either way this patch would still be valid as when OP-TEE is present
>> then arm_smccc_smc() will be the right call to make, how we handle the
>> legacy calls can be sorted out later if a generic SMC call is implemented.
> 
> Please see my comment regarding this patch earlier in this thread
> pasted below for convenience:
> 
> * Tony Lindgren <tony@atomide.com> [191119 16:22]:
>> In any case, you should do the necessary checks for HAVE_ARM_SMCCC
>> only once during init. I'm not sure how much checking for
>> "/firmware/optee" helps here, sounds like we have a broken system
>> if the firmware is not there while the arm_smccc_smc() should
>> still work just fine :)
> 
> So only check once during init. And during init, you should probably
> also check that arm_smccc_smc() actually infd optee if
> "/firmware/optee" is set, and only then set set the right function
> pointer or some flag.
> 

Okay, I'll check only once and make sure the node is "okay".

I'll do the check during the first call to an SMC caller, I wouldn't
want to pollute the OMAP generic init code for something that is only
called on HS platforms, plus these SMC calls are rare (only 3 calls
during boot of AM57x for instance) so performance is not critical, so I
don't want to do anything fancy like code patching :), I'll just use a flag.

Thanks,
Andrew


> Regards,
> 
> Tony
> 
