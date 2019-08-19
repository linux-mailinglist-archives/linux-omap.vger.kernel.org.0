Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D58C194F9A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 23:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfHSVL3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 17:11:29 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43574 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbfHSVL3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 17:11:29 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JLBPXl098745;
        Mon, 19 Aug 2019 16:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566249085;
        bh=4rS3pU2cEX7bVlGj7nDNEe4WRwmB/iJ/bNhzqOKfRhQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BoqJpUyJHP08NiR301szNzQDCafpRrnKCWJIuLh+1b8cpafEX2R5RvHlMQVmTjvzq
         EWmhwebw9SH0P3/weXGgaL1JY/BizryP9tWcbnBb9zwZa8IUIIwynIC8NMgRh/LFe2
         KS4vR9C4QddmAjy9ccb0o66JZ0rXFria/zeAsEyg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JLBPhH033952
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 16:11:25 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 16:11:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 16:11:25 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JLBOR3053637;
        Mon, 19 Aug 2019 16:11:24 -0500
Subject: Re: [PATCH 2/3] clk: ti: dra7xx: remove idlest polling from disabling
 ipu/dsp clocks
To:     Tero Kristo <t-kristo@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-3-git-send-email-t-kristo@ti.com>
 <932d4ef2-7259-24a9-9a53-c5fcf751ea1b@ti.com>
 <4925ad2f-228f-4200-5500-43daa634be24@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <badc1638-b8b1-32d1-1d70-09b3d20b5edc@ti.com>
Date:   Mon, 19 Aug 2019 16:11:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4925ad2f-228f-4200-5500-43daa634be24@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 8/19/19 4:19 AM, Tero Kristo wrote:
> On 08/08/2019 01:50, Suman Anna wrote:
>> Hi Tero,
>>
>> On 8/7/19 8:04 AM, Tero Kristo wrote:
>>> These cause some unwanted timeouts in the kernel, as they depend on
>>> reset and the execution state of the remotecore itself. These details
>>> should be handled by the driver with proper sequencing of events.
>>
>> This can definitely do with some better patch description.
> 
> Can you elaborate a bit what you are missing here?

Well the above explanation is vague. Please see the descriptions from my
patches referenced below.

> 
>> What about
>> the changes to the OMAP4 and OMAP5 files? Please see my equivalent
>> downstream patches [1][2][3] for the same though they are using the
>> CLKF_NO_IDLEST flag.
> 
> I did not want to touch OMAP4/OMAP5 for now, they can be fixed with
> trivial data only patches separately once the approach has been approved
> on one device (DRA7.)

We might as well as fix all of them while doing the development. I do
not see any advantage in mixing them up while we go through the hwmod to
ti-sysc conversion. There are multiple subsystems involved, and so you
have to ensure functionality is not broken with individual series during
the transition.

regards
Suman

> 
> -Tero
> 
>>
>> regards
>> Suman
>>
>> [1] OMAP4:
>> http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=1979318da6f76809a5e6d652f814b2e80836aa21
>>
>> [2] OMAP5:
>> http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=69b31b56ceffdec3aed5b0feaa06090f8ee318b6
>>
>> [3] DRA7:
>> http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=a26129c10cda1d64bec3cd7a03b9acd447df84ea
>>
>> (portions of this patch content are already upstream, the delta being
>> these additional flags).
>>
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   drivers/clk/ti/clk-7xx.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>>> index b57fe09..5208eb8 100644
>>> --- a/drivers/clk/ti/clk-7xx.c
>>> +++ b/drivers/clk/ti/clk-7xx.c
>>> @@ -25,7 +25,7 @@
>>>   };
>>>     static const struct omap_clkctrl_reg_data
>>> dra7_dsp1_clkctrl_regs[] __initconst = {
>>> -    { DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP,
>>> "dpll_dsp_m2_ck" },
>>> +    { DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP |
>>> CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
>>>       { 0 },
>>>   };
>>>   @@ -41,7 +41,7 @@
>>>   };
>>>     static const struct omap_clkctrl_reg_data
>>> dra7_ipu1_clkctrl_regs[] __initconst = {
>>> -    { DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data,
>>> CLKF_HW_SUP, "ipu1-clkctrl:0000:24" },
>>> +    { DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data,
>>> CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "ipu1-clkctrl:0000:24" },
>>>       { 0 },
>>>   };
>>>   @@ -137,7 +137,7 @@
>>>   };
>>>     static const struct omap_clkctrl_reg_data
>>> dra7_dsp2_clkctrl_regs[] __initconst = {
>>> -    { DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP,
>>> "dpll_dsp_m2_ck" },
>>> +    { DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP |
>>> CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
>>>       { 0 },
>>>   };
>>>   @@ -164,7 +164,7 @@
>>>   };
>>>     static const struct omap_clkctrl_reg_data
>>> dra7_ipu2_clkctrl_regs[] __initconst = {
>>> -    { DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP,
>>> "dpll_core_h22x2_ck" },
>>> +    { DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP |
>>> CLKF_NO_IDLE_POLL, "dpll_core_h22x2_ck" },
>>>       { 0 },
>>>   };
>>>  
>>
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

