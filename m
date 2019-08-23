Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C029B627
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2019 20:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404393AbfHWSQz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 14:16:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48432 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390422AbfHWSQy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Aug 2019 14:16:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NIGnjn061687;
        Fri, 23 Aug 2019 13:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566584209;
        bh=FMLSygCw6ss56+cWZANwKBAvWc1Q1/9AHdxfh6O7xAA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qdrtLsEkJUq+QVYUQxunJuF1stxvp871yFab3Hg3pBVximp/iHFzge9vgo5Ua07oO
         DHrCa0+HavjVmymt0Qtw3JBoRjhh2x490SjSNiq0Q6UvukRH4VqrD91oc9/t/9C/D6
         +I4Z8A+35q/7wGbQcfBqa85sGbOZWT4mH6Hw+Gao=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NIGnEL104575
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Aug 2019 13:16:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 23
 Aug 2019 13:16:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 23 Aug 2019 13:16:49 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NIGlVE126177;
        Fri, 23 Aug 2019 13:16:47 -0500
Subject: Re: [PATCH 3/3] clk: ti: dra7xx: add timer_sys_ck clock alias
To:     Suman Anna <s-anna@ti.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-4-git-send-email-t-kristo@ti.com>
 <9d0edab4-cae2-50d5-2df9-42c879f2623f@ti.com>
 <b1005a98-e098-f651-d70e-c519fd740540@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <12f0fa92-f6e1-0e71-09da-78722f040966@ti.com>
Date:   Fri, 23 Aug 2019 21:16:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b1005a98-e098-f651-d70e-c519fd740540@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20.8.2019 0.14, Suman Anna wrote:
> Hi Tero,
> 
> On 8/7/19 5:56 PM, Anna, Suman wrote:
>> Hi Tero,
>>
>> On 8/7/19 8:04 AM, Tero Kristo wrote:
>>> This is needed by the TI DM timer driver.
>>
>> Again can do with some better patch descriptions. Similar to the
>> previous patch, missing the equivalent patches for OMAP4 and OMAP5.
>> You can use my downstream patches for these - [1][2][3] that has all the
>> needed Fixes by details. Only difference is that you used a single line
>> change on DRA7, and this should suffice since all the sources are same,
>> but OMAP4 and OMAP5 needed different ones.
>>
>> [1] OMAP4:
>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=9d45dc42fbed8395d733366dbf6c0fd5ec171e2f
>> [2] OMAP5:
>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=34f4682a91173386307b310d7f4955d46dcaaea2
>> [3] DRA7:
>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=2a662694437ae7192b5ef759ec40abe796d2a058
>>
>> Technically, this data need to be added back for all OMAP2+ SoCs which
>> support dmtimer with any other drivers wanting to use the timers.
> 
> So, I checked and these aliases already are defined on OMAP2, OMAP3,
> AM33xx, AM43xx, DM814x and DM816x SoCs. So, just include the OMAP4 and
> OMAP5 ones along with the DRA7x one.

Actually, all these alias definitions can be completely removed, and can 
be replaced with DT data. Here's sample how it can be done for dra7xx 
timer11:

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index bed67603c186..fafa0a131af0 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1910,8 +1910,8 @@
                         timer11: timer@0 {
                                 compatible = "ti,omap5430-timer";
                                 reg = <0x0 0x80>;
-                               clocks = <&l4per_clkctrl 
DRA7_L4PER_TIMER11_CLKCTRL 24>;
-                               clock-names = "fck";
+                               clocks = <&l4per_clkctrl 
DRA7_L4PER_TIMER11_CLKCTRL 24>, <&timer_sys_clk_div>;
+                               clock-names = "fck", "timer_sys_ck";
                                 interrupts = <GIC_SPI 42 
IRQ_TYPE_LEVEL_HIGH>;
                         };
                 };

I will post these changes along with other DTS patches once the time is 
right. For now, I will just drop these aliases completely.

-Tero

> 
> regards
> Suman
> 
>>
>> regards
>> Suman
>>
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   drivers/clk/ti/clk-7xx.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>>> index 5208eb8..64507b8 100644
>>> --- a/drivers/clk/ti/clk-7xx.c
>>> +++ b/drivers/clk/ti/clk-7xx.c
>>> @@ -792,6 +792,7 @@
>>>   static struct ti_dt_clk dra7xx_clks[] = {
>>>   	DT_CLK(NULL, "timer_32k_ck", "sys_32k_ck"),
>>>   	DT_CLK(NULL, "sys_clkin_ck", "timer_sys_clk_div"),
>>> +	DT_CLK(NULL, "timer_sys_ck", "timer_sys_clk_div"),
>>>   	DT_CLK(NULL, "sys_clkin", "sys_clkin1"),
>>>   	DT_CLK(NULL, "atl_dpll_clk_mux", "atl-clkctrl:0000:24"),
>>>   	DT_CLK(NULL, "atl_gfclk_mux", "atl-clkctrl:0000:26"),
>>>
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
