Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A0091FBF
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 11:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfHSJOF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 05:14:05 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52152 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfHSJOF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 05:14:05 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J9E0Pa121957;
        Mon, 19 Aug 2019 04:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566206040;
        bh=rb6LFBf30/wCTI0ehauzI5PZe1QvtMqBb/M1L2sFBB0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eyeezsuAJXrqom7P18KaQ58iIDMms8NEE7gl11PjRcJL2Kcbe/XBB+NOuEAT1o6WP
         /p4MVVjos7jfV3198mMOcidmysWzVWyJzZUutqV6sbe+c87TsYKshSZA5+qHt2Xp/9
         pRJ7KEh25La5fEtxa2kXl8//oT9EZxgeKvXgmz2E=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J9E0Ta082321
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 04:14:00 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 04:14:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 04:14:00 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J9DwkS006922;
        Mon, 19 Aug 2019 04:13:58 -0500
Subject: Re: [PATCH 1/3] clk: ti: clkctrl: add support for polling clock
 status for enable only
To:     Suman Anna <s-anna@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-2-git-send-email-t-kristo@ti.com>
 <6a088bc2-e854-b4fa-3c97-ce94dd2a92cb@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <99f2b99f-6b5a-eef6-cc6f-fed7431f7cc8@ti.com>
Date:   Mon, 19 Aug 2019 12:13:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6a088bc2-e854-b4fa-3c97-ce94dd2a92cb@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2019 01:43, Suman Anna wrote:
> Hi Tero,
> 
> On 8/7/19 8:04 AM, Tero Kristo wrote:
>> The activity status for certain clocks is possible to be polled only
>> during enable phase; the disable phase depends on additional reset
>> logic.
> 
> I am not sure this is an entirely accurate statement. Can you explain
> why this is an issue only with disable sequence and not enable sequence?
> Almost sounds like you are doing some asymmetric sequence w.r.t clocks
> and resets.

This follows the recommended ordering sequence from TRM, so reset will 
be de-asserted before enabling clock, so we can keep the polling there.

Going down, reset must be asserted post disabling clocks, which results 
a timeout if the idle status check is not bypassed.

This is kind of not perfect and should be fixed later to somehow add a 
direct link between the clock and reset lines, so that we know when 
there is dependency between the two and can check the status of both to 
see if we should poll something or not.

> 
> On the downstream kernel, we have reused the existing NO_IDLEST flag as
> a quirk within both the enable and disable functions for the IPs with
> hardreset lines, and this patch seems to introduce a new NO_IDLE_POLL
> flag but only during the disable path.

The NO_IDLEST patch is not perfect, as it introduces a timing hazard 
where while enabling the module one can access the IP registers before 
it has left idle, leading into a crash.

-Tero

> 
> regards
> Suman
> 
> If the disable phase is polled with these clocks, it will
>> result in a timeout. To fix this, add logic for polling the clock
>> activity only during enable, and add a new flag for this purpose.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/clk/ti/clkctrl.c | 5 ++++-
>>   drivers/clk/ti/clock.h   | 1 +
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
>> index 975995e..f5517a8 100644
>> --- a/drivers/clk/ti/clkctrl.c
>> +++ b/drivers/clk/ti/clkctrl.c
>> @@ -25,6 +25,7 @@
>>   #include "clock.h"
>>   
>>   #define NO_IDLEST			0x1
>> +#define NO_IDLE_POLL			0x2
>>   
>>   #define OMAP4_MODULEMODE_MASK		0x3
>>   
>> @@ -187,7 +188,7 @@ static void _omap4_clkctrl_clk_disable(struct clk_hw *hw)
>>   
>>   	ti_clk_ll_ops->clk_writel(val, &clk->enable_reg);
>>   
>> -	if (clk->flags & NO_IDLEST)
>> +	if (clk->flags & (NO_IDLEST | NO_IDLE_POLL))
>>   		goto exit;
>>   
>>   	/* Wait until module is disabled */
>> @@ -597,6 +598,8 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>>   			hw->enable_bit = MODULEMODE_HWCTRL;
>>   		if (reg_data->flags & CLKF_NO_IDLEST)
>>   			hw->flags |= NO_IDLEST;
>> +		if (reg_data->flags & CLKF_NO_IDLE_POLL)
>> +			hw->flags |= NO_IDLE_POLL;
>>   
>>   		if (reg_data->clkdm_name)
>>   			hw->clkdm_name = reg_data->clkdm_name;
>> diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
>> index e4b8392..6410ff6 100644
>> --- a/drivers/clk/ti/clock.h
>> +++ b/drivers/clk/ti/clock.h
>> @@ -82,6 +82,7 @@ enum {
>>   #define CLKF_SW_SUP			BIT(5)
>>   #define CLKF_HW_SUP			BIT(6)
>>   #define CLKF_NO_IDLEST			BIT(7)
>> +#define CLKF_NO_IDLE_POLL		BIT(8)
>>   
>>   #define CLKF_SOC_MASK			GENMASK(11, 8)
>>   
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
