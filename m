Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFEB291FEF
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 11:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfHSJT6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 05:19:58 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46970 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfHSJT6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 05:19:58 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J9JsDe089620;
        Mon, 19 Aug 2019 04:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566206394;
        bh=GNZU/NeGfxTaDylzoDngNX7wLh9BHQt7GzEKQ6CQVUE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ubUs8pkfmwnavTyUX3lccRYQoYIOgYf146A0kx1e8gyBbVg58dow3pd1j+v61YQIF
         R3UprD+oOQUP37B4Xt/G6mohzgH6DfG/pY8mXyo3WWMKcEVJdRlFwkemcnmW258clr
         fAsmWjpkV6PL5dtEAuy8DHJXFZwDEN6TOv3SgxOc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J9Jst9064808
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 04:19:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 04:19:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 04:19:53 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J9Jpnr003270;
        Mon, 19 Aug 2019 04:19:52 -0500
Subject: Re: [PATCH 2/3] clk: ti: dra7xx: remove idlest polling from disabling
 ipu/dsp clocks
To:     Suman Anna <s-anna@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-3-git-send-email-t-kristo@ti.com>
 <932d4ef2-7259-24a9-9a53-c5fcf751ea1b@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <4925ad2f-228f-4200-5500-43daa634be24@ti.com>
Date:   Mon, 19 Aug 2019 12:19:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <932d4ef2-7259-24a9-9a53-c5fcf751ea1b@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2019 01:50, Suman Anna wrote:
> Hi Tero,
> 
> On 8/7/19 8:04 AM, Tero Kristo wrote:
>> These cause some unwanted timeouts in the kernel, as they depend on
>> reset and the execution state of the remotecore itself. These details
>> should be handled by the driver with proper sequencing of events.
> 
> This can definitely do with some better patch description.

Can you elaborate a bit what you are missing here?

> What about
> the changes to the OMAP4 and OMAP5 files? Please see my equivalent
> downstream patches [1][2][3] for the same though they are using the
> CLKF_NO_IDLEST flag.

I did not want to touch OMAP4/OMAP5 for now, they can be fixed with 
trivial data only patches separately once the approach has been approved 
on one device (DRA7.)

-Tero

> 
> regards
> Suman
> 
> [1] OMAP4:
> http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=1979318da6f76809a5e6d652f814b2e80836aa21
> [2] OMAP5:
> http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=69b31b56ceffdec3aed5b0feaa06090f8ee318b6
> [3] DRA7:
> http://git.ti.com/gitweb/?p=rpmsg/iommu.git;a=commit;h=a26129c10cda1d64bec3cd7a03b9acd447df84ea
> (portions of this patch content are already upstream, the delta being
> these additional flags).
> 
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/clk/ti/clk-7xx.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>> index b57fe09..5208eb8 100644
>> --- a/drivers/clk/ti/clk-7xx.c
>> +++ b/drivers/clk/ti/clk-7xx.c
>> @@ -25,7 +25,7 @@
>>   };
>>   
>>   static const struct omap_clkctrl_reg_data dra7_dsp1_clkctrl_regs[] __initconst = {
>> -	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
>> +	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
>>   	{ 0 },
>>   };
>>   
>> @@ -41,7 +41,7 @@
>>   };
>>   
>>   static const struct omap_clkctrl_reg_data dra7_ipu1_clkctrl_regs[] __initconst = {
>> -	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP, "ipu1-clkctrl:0000:24" },
>> +	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "ipu1-clkctrl:0000:24" },
>>   	{ 0 },
>>   };
>>   
>> @@ -137,7 +137,7 @@
>>   };
>>   
>>   static const struct omap_clkctrl_reg_data dra7_dsp2_clkctrl_regs[] __initconst = {
>> -	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
>> +	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
>>   	{ 0 },
>>   };
>>   
>> @@ -164,7 +164,7 @@
>>   };
>>   
>>   static const struct omap_clkctrl_reg_data dra7_ipu2_clkctrl_regs[] __initconst = {
>> -	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h22x2_ck" },
>> +	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_core_h22x2_ck" },
>>   	{ 0 },
>>   };
>>   
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
