Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A631437AC
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 08:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgAUHdw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 02:33:52 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:32964 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUHdw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 02:33:52 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L7Xdgx053215;
        Tue, 21 Jan 2020 01:33:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579592019;
        bh=7sUy5WR/TidOz/Ir+AKZLhnP6AP96Tqpy6Qvf0LI3kw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MNWuUBgDYjBGr1EHBURcOsJ1S+y1QVW9kuinHtKZ6pneKySN1b1VIJtLsHx4VSknq
         cn50P/e9iKEwmoT71Sa6sbOTO873ZqcxaVJ5W4K5/0PaqkrYyEpX9vRZgD7PvzlQNj
         wTxu/oSeW/1lMYgIwBn1KHHRFaNfA9y8TVd0zucw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7Xd9S003132;
        Tue, 21 Jan 2020 01:33:39 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 01:33:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 01:33:39 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7XaNm056586;
        Tue, 21 Jan 2020 01:33:36 -0600
Subject: Re: [PATCH] clk: ti: omap5: Add missing AESS clock
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Matthijs van Duin <matthijsvanduin@gmail.com>
References: <20200114150607.18092-1-tony@atomide.com>
 <23f9723b-cb9e-8737-92c5-4c20bed55cf5@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <9bfd16c3-5f53-bf3a-d912-8e43e3f5bad3@ti.com>
Date:   Tue, 21 Jan 2020 09:33:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <23f9723b-cb9e-8737-92c5-4c20bed55cf5@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/01/2020 10:56, Peter Ujfalusi wrote:
> 
> 
> On 14/01/2020 17.06, Tony Lindgren wrote:
>> Looks like we're missing AESS clock for omap5. This is similar to what
>> omap4 has.
> 
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Queued up for 5.6, thanks.

-Tero

> 
>> Cc: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Matthijs van Duin <matthijsvanduin@gmail.com>
>> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>>   drivers/clk/ti/clk-54xx.c         | 15 +++++++++++++++
>>   include/dt-bindings/clock/omap5.h |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
>> --- a/drivers/clk/ti/clk-54xx.c
>> +++ b/drivers/clk/ti/clk-54xx.c
>> @@ -35,6 +35,20 @@ static const struct omap_clkctrl_reg_data omap5_dsp_clkctrl_regs[] __initconst =
>>   	{ 0 },
>>   };
>>   
>> +static const char * const omap5_aess_fclk_parents[] __initconst = {
>> +	"abe_clk",
>> +	NULL,
>> +};
>> +
>> +static const struct omap_clkctrl_div_data omap5_aess_fclk_data __initconst = {
>> +	.max_div = 2,
>> +};
>> +
>> +static const struct omap_clkctrl_bit_data omap5_aess_bit_data[] __initconst = {
>> +	{ 24, TI_CLK_DIVIDER, omap5_aess_fclk_parents, &omap5_aess_fclk_data },
>> +	{ 0 },
>> +};
>> +
>>   static const char * const omap5_dmic_gfclk_parents[] __initconst = {
>>   	"abe_cm:clk:0018:26",
>>   	"pad_clks_ck",
>> @@ -122,6 +136,7 @@ static const struct omap_clkctrl_bit_data omap5_timer8_bit_data[] __initconst =
>>   
>>   static const struct omap_clkctrl_reg_data omap5_abe_clkctrl_regs[] __initconst = {
>>   	{ OMAP5_L4_ABE_CLKCTRL, NULL, 0, "abe_iclk" },
>> +	{ OMAP5_AESS_CLKCTRL, omap5_aess_bit_data, CLKF_SW_SUP, "abe_cm:clk:0008:24" },
>>   	{ OMAP5_MCPDM_CLKCTRL, NULL, CLKF_SW_SUP, "pad_clks_ck" },
>>   	{ OMAP5_DMIC_CLKCTRL, omap5_dmic_bit_data, CLKF_SW_SUP, "abe_cm:clk:0018:24" },
>>   	{ OMAP5_MCBSP1_CLKCTRL, omap5_mcbsp1_bit_data, CLKF_SW_SUP, "abe_cm:clk:0028:24" },
>> diff --git a/include/dt-bindings/clock/omap5.h b/include/dt-bindings/clock/omap5.h
>> --- a/include/dt-bindings/clock/omap5.h
>> +++ b/include/dt-bindings/clock/omap5.h
>> @@ -16,6 +16,7 @@
>>   
>>   /* abe clocks */
>>   #define OMAP5_L4_ABE_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
>> +#define OMAP5_AESS_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
>>   #define OMAP5_MCPDM_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
>>   #define OMAP5_DMIC_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x38)
>>   #define OMAP5_MCBSP1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x48)
>>
> 
> - Péter
> 
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
