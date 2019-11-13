Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C4EFADE1
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 11:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfKMKCQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 05:02:16 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:32790 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbfKMKCO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Nov 2019 05:02:14 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADA2AV5089065;
        Wed, 13 Nov 2019 04:02:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573639330;
        bh=uDTNTh6hH0C3Y7IA3uJaDhPfkgnTiptkt7nzyp3BEfc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lH/bBBdVl8WS/xICwSKoShTWtH3TLVwioqks+DZVYawGRSuemTfzLmdsQhki/GIUA
         QXdyFDoXJ8kuIF0RMzibXeXysncVq52YsT8XEyQyXDiT2MAdsMl56N4hRlD5JKGoh+
         DwRkellp1DfeX7PPaTBwLDvn60AkmugCwcNNX74k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADA2ANp117514
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 04:02:10 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 04:01:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 04:01:52 -0600
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADA28Vm006400;
        Wed, 13 Nov 2019 04:02:08 -0600
Subject: Re: [PATCH] clk: ti: dra7: fix parent for gmac_clkctrl
To:     Tony Lindgren <tony@atomide.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20191109142017.10851-1-grygorii.strashko@ti.com>
 <20191111171255.GU5610@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <d22abbd3-518d-3f2b-a1d7-50601e89e9e1@ti.com>
Date:   Wed, 13 Nov 2019 12:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111171255.GU5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 11/11/2019 19:12, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [191109 14:21]:
>> The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
>> of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
>> Hence, fix it.
>>
>> Fixes: commit dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> Hmm is there a mux for the source though?

Not sure what do you mean here :(

fck clock for CPSW and MDIO is "gmac_main_clk" which is 125MHz and
that what need to be passed to drivers and enabled through the clock tree.
The TI specific PM is handled by gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0
which required sysc programming and child modules dosn't need to even know that.

So, this patch is simply correct clock tree for dra7:
dpll_gmac_ck -> .... -> gmac_main_clk -> gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0

Seems MDIO dt also need to be fixed to use:
gmac_main_clk as "fck". I'll try and send patch.

By the way, the patch follows am3/am4 (am4_cpsw_125mhz_clkctrl_regs,
  am3_cpsw_125mhz_clkctrl_regs)


> 
> In that case using assigned-clocks and assigned-clock-parents in
> addition to a related clk-7xx.c fix would be needed.
> 
> Regards,
> 
> Tony
> 
>> ---
>>   drivers/clk/ti/clk-7xx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>> index 9dd6185a4b4e..66e4b2b9ec60 100644
>> --- a/drivers/clk/ti/clk-7xx.c
>> +++ b/drivers/clk/ti/clk-7xx.c
>> @@ -405,7 +405,7 @@ static const struct omap_clkctrl_bit_data dra7_gmac_bit_data[] __initconst = {
>>   };
>>   
>>   static const struct omap_clkctrl_reg_data dra7_gmac_clkctrl_regs[] __initconst = {
>> -	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "dpll_gmac_ck" },
>> +	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "gmac_main_clk" },
>>   	{ 0 },
>>   };
>>   
>> -- 
>> 2.17.1
>>

-- 
Best regards,
grygorii
