Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC88140D01
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jan 2020 15:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgAQOtT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jan 2020 09:49:19 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46918 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgAQOtT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jan 2020 09:49:19 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00HEnDrb013744;
        Fri, 17 Jan 2020 08:49:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579272553;
        bh=lHkZJVDjQIQnIzS3CkxR0abI766wvz4JWBLNC7tuc08=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eQIFUETzaHOtANeXk6DNN7Kqem73KThIRd7ovwkaN7MxyCZ8BhzjxY/bKt55A+TZm
         9F+0xb5yTg71neTuYcRbNctDdT/Pjm/daEU726gF34YMB8KRWRqymdY7AwtEw7a0Nk
         wH03Tq9vHtrKViI3b5jwROYEgAcYrj7HdAGThiLQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00HEnD5L011095
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Jan 2020 08:49:13 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Jan 2020 08:49:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Jan 2020 08:49:13 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00HEnAUG122410;
        Fri, 17 Jan 2020 08:49:11 -0600
Subject: Re: [PATCH v2] clk: ti: dra7: fix parent for gmac_clkctrl
To:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20191221110004.9951-1-grygorii.strashko@ti.com>
 <e1782af7-098e-4550-8c9c-9f90187df8f3@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <b448c468-5216-f599-7add-cefaf4f557db@ti.com>
Date:   Fri, 17 Jan 2020 16:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e1782af7-098e-4550-8c9c-9f90187df8f3@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 17/01/2020 16:05, Tero Kristo wrote:
> On 21/12/2019 13:00, Grygorii Strashko wrote:
>> The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
>> of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
>> Hence, fix it.
>>
>> Fixes: dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>   drivers/clk/ti/clk-7xx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>> index 9dd6185a4b4e..66e4b2b9ec60 100644
>> --- a/drivers/clk/ti/clk-7xx.c
>> +++ b/drivers/clk/ti/clk-7xx.c
>> @@ -405,7 +405,7 @@ static const struct omap_clkctrl_bit_data dra7_gmac_bit_data[] __initconst = {
>>   };
>>   static const struct omap_clkctrl_reg_data dra7_gmac_clkctrl_regs[] __initconst = {
>> -    { DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "dpll_gmac_ck" },
>> +    { DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "gmac_main_clk" },
> 
> I think the gmac clk path is still somehow wrong after this change. This only fixes it partially imo.
> 
> Looking at TRM, gmac_main_clk is fed from dpll_gmac_x2_h12, 

No, it seems not.
DPLL_GMAC.CLKOUT_M2 -> GMAC_250M_CLK -> 1/2 -> GMAC_MAIN_CLK

http://www.ti.com/lit/ug/sprui30f/sprui30f.pdf
3.6.3.12.1 DPLL_GMAC Overview
Figure 3-41. CM_CORE_AON Overview (b)
Figure 24-185. GMAC_SW Integration

but looking at the existing clock data, gmac_main_clk comes out from dpll_gmac_m2_ck. This potentially applies one extra divider to the path which appears wrong. Can you take a look at fixing the DTS side for this also?
> 
> -Tero
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

-- 
Best regards,
grygorii
