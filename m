Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F12C340538
	for <lists+linux-omap@lfdr.de>; Thu, 18 Mar 2021 13:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhCRMK2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Mar 2021 08:10:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48852 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhCRMKS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Mar 2021 08:10:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12ICACtI064381;
        Thu, 18 Mar 2021 07:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616069412;
        bh=V55Fqi93WhICRWF6k7K7rR1gLR73q2SA61LmnQTRQKM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hEIkECQhKK9Uri7GuzN66hQ75ct6ucFuxvgLH+Zc7/meHfMCrI51CuALpW6DXEXar
         3EDlt3EyNJX5bgMkErdrpKYOW2NK0CCLoYdD/1y7kKdYPEssmTgxjEajwX0yTjyhaN
         WRFO2B7jMMgyYE7k/Jyk6pgU65G78qU+q/6eq/sw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12ICABqK015215
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Mar 2021 07:10:12 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 18
 Mar 2021 07:10:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 18 Mar 2021 07:10:11 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12ICA8Tm116376;
        Thu, 18 Mar 2021 07:10:08 -0500
Subject: Re: [PATCH 4/4] clk: ti: add am33xx spread spectrum clock support
To:     Dario Binacchi <dariobin@libero.it>,
        <linux-kernel@vger.kernel.org>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>, "Menon, Nishanth" <nm@ti.com>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20210314151233.23243-1-dariobin@libero.it>
 <20210314151233.23243-5-dariobin@libero.it>
 <6dc0d2c6-570a-3fbf-77e1-6731a6c8d558@ti.com>
 <2069482516.552063.1616053134087@mail1.libero.it>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <64771168-1222-cfb5-f79c-31a945b713a5@ti.com>
Date:   Thu, 18 Mar 2021 14:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2069482516.552063.1616053134087@mail1.libero.it>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 18/03/2021 09:38, Dario Binacchi wrote:
> Hi Grygorii,
> 
>> Il 16/03/2021 12:52 Grygorii Strashko <grygorii.strashko@ti.com> ha scritto:
>>
>>   
>> On 14/03/2021 17:12, Dario Binacchi wrote:
>>> The patch enables spread spectrum clocking (SSC) for MPU and LCD PLLs.
>>> As reported by the TI spruh73x RM, SSC is only supported for the
>>> DISP/LCD and MPU PLLs on am33xx device. SSC is not supported for DDR,
>>> PER, and CORE PLLs.
>>>
>>> Calculating the required values and setting the registers accordingly
>>> was taken from the set_mpu_spreadspectrum routine contained in the
>>> arch/arm/mach-omap2/am33xx/clock_am33xx.c file of the u-boot project.
>>>
>>> In locked condition, DPLL output clock = CLKINP *[M/N]. In case of
>>> SSC enabled, the AM335x reference manual explains that there is a
>>> restriction of range of M values. Since the omap2_dpll_round_rate
>>> routine attempts to select the minimum possible N, the value of M
>>> obtained is not guaranteed to be within the range required. With the new
>>> "ti,min-div" parameter it is possible to increase N and consequently M
>>> to satisfy the constraint imposed by SSC.
>>>
>>> Signed-off-by: Dario Binacchi <dariobin@libero.it>
>>>
>>> ---
>>>
>>>    arch/arm/boot/dts/am33xx-clocks.dtsi |  4 +-
>>>    drivers/clk/ti/dpll.c                | 41 ++++++++++++++
>>>    drivers/clk/ti/dpll3xxx.c            | 85 ++++++++++++++++++++++++++++
>>>    include/linux/clk/ti.h               | 24 ++++++++
>>>    4 files changed, 152 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
>>> index e7bbbf536a8c..a02e0b1229a4 100644
>>> --- a/arch/arm/boot/dts/am33xx-clocks.dtsi
>>> +++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
>>> @@ -164,7 +164,7 @@
>>>    		#clock-cells = <0>;
>>>    		compatible = "ti,am3-dpll-core-clock";
>>>    		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
>>> -		reg = <0x0490>, <0x045c>, <0x0468>, <0x0460>, <0x0464>;
>>> +		reg = <0x0490>, <0x045c>, <0x0468>;
>>>    	};
>>>    
>>>    	dpll_core_x2_ck: dpll_core_x2_ck {
>>> @@ -204,7 +204,7 @@
>>>    		#clock-cells = <0>;
>>>    		compatible = "ti,am3-dpll-clock";
>>>    		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
>>> -		reg = <0x0488>, <0x0420>, <0x042c>;
>>> +		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
>>>    	};
>>
>> You can't mix DT vs code.
> 
> Right, I forgot to remove it during a rebase of the series.
> 
>>
>>>    
>>>    	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
>>> diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
>>> index d6f1ac5b53e1..2738417a47b7 100644
>>> --- a/drivers/clk/ti/dpll.c
>>> +++ b/drivers/clk/ti/dpll.c
>>> @@ -290,7 +290,9 @@ static void __init of_ti_dpll_setup(struct device_node *node,
>>>    	struct clk_init_data *init = NULL;
>>>    	const char **parent_names = NULL;
>>>    	struct dpll_data *dd = NULL;
>>> +	int ssc_clk_index;
>>>    	u8 dpll_mode = 0;
>>> +	u32 min_div;
>>>    
>>>    	dd = kmemdup(ddt, sizeof(*dd), GFP_KERNEL);
>>>    	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
>>> @@ -345,6 +347,27 @@ static void __init of_ti_dpll_setup(struct device_node *node,
>>>    	if (dd->autoidle_mask) {
>>>    		if (ti_clk_get_reg_addr(node, 3, &dd->autoidle_reg))
>>>    			goto cleanup;
>>> +
>>> +		ssc_clk_index = 4;
>>> +	} else {
>>> +		ssc_clk_index = 3;
>>> +	}
>>> +
>>> +	if (dd->ssc_deltam_int_mask && dd->ssc_deltam_frac_mask &&
>>> +	    dd->ssc_modfreq_mant_mask && dd->ssc_modfreq_exp_mask) {
>>> +		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
>>> +					&dd->ssc_deltam_reg))
>>> +			goto cleanup;
>>> +
>>> +		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
>>> +					&dd->ssc_modfreq_reg))
>>> +			goto cleanup;
>>> +
>>> +		of_property_read_u32(node, "ti,ssc-modfreq", &dd->ssc_modfreq);
>>> +		of_property_read_u32(node, "ti,ssc-deltam", &dd->ssc_deltam);
>>> +		if (of_property_read_bool(node, "ti,ssc-downspread"))
>>> +			dd->ssc_downspread = 1;
>>
>> New bindings.
> 
> I added the bindings documentation in another patch of the series.
> 

oh. sorry I've not received it for some reasons :(

-- 
Best regards,
grygorii
