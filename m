Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030369D917
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 00:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfHZW1A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 18:27:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55536 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfHZW1A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Aug 2019 18:27:00 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7QMQtsc098328;
        Mon, 26 Aug 2019 17:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566858415;
        bh=X+GmS/I0nk1TC/rPg4uKMoK0DXcSRBQk92yvQpdkDaQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FDVodDHQrgVrpT/1t6xnprHMUUxiCBPtY3ZtQxIxbCcd2QHKilROTb9rK8rNIwSGE
         /UDh9uQ56uE6YykJs86/5LIBmhkxMNwEC7wviKS/hhZYeLXP1dl+5f6dqTFeHi+Xll
         yxVoE+D9NACyjt4VFr/UmUgLpT8mwajlL4s3ASaY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7QMQtwK130627
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Aug 2019 17:26:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 17:26:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 17:26:54 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7QMQsbx076867;
        Mon, 26 Aug 2019 17:26:54 -0500
Subject: Re: [PATCH 3/3] clk: ti: dra7xx: add timer_sys_ck clock alias
To:     Tero Kristo <t-kristo@ti.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-4-git-send-email-t-kristo@ti.com>
 <9d0edab4-cae2-50d5-2df9-42c879f2623f@ti.com>
 <b1005a98-e098-f651-d70e-c519fd740540@ti.com>
 <12f0fa92-f6e1-0e71-09da-78722f040966@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <78fe85dc-6349-1cd7-e0fb-b0ccd6a81ad8@ti.com>
Date:   Mon, 26 Aug 2019 17:26:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <12f0fa92-f6e1-0e71-09da-78722f040966@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 8/23/19 1:16 PM, Tero Kristo wrote:
>>>
>>> On 8/7/19 8:04 AM, Tero Kristo wrote:
>>>> This is needed by the TI DM timer driver.
>>>
>>> Again can do with some better patch descriptions. Similar to the
>>> previous patch, missing the equivalent patches for OMAP4 and OMAP5.
>>> You can use my downstream patches for these - [1][2][3] that has all the
>>> needed Fixes by details. Only difference is that you used a single line
>>> change on DRA7, and this should suffice since all the sources are same,
>>> but OMAP4 and OMAP5 needed different ones.
>>>
>>> [1] OMAP4:
>>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=9d45dc42fbed8395d733366dbf6c0fd5ec171e2f
>>>
>>> [2] OMAP5:
>>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=34f4682a91173386307b310d7f4955d46dcaaea2
>>>
>>> [3] DRA7:
>>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=2a662694437ae7192b5ef759ec40abe796d2a058
>>>
>>>
>>> Technically, this data need to be added back for all OMAP2+ SoCs which
>>> support dmtimer with any other drivers wanting to use the timers.
>>
>> So, I checked and these aliases already are defined on OMAP2, OMAP3,
>> AM33xx, AM43xx, DM814x and DM816x SoCs. So, just include the OMAP4 and
>> OMAP5 ones along with the DRA7x one.
> 
> Actually, all these alias definitions can be completely removed, and can
> be replaced with DT data. Here's sample how it can be done for dra7xx
> timer11:
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi
> b/arch/arm/boot/dts/dra7-l4.dtsi
> index bed67603c186..fafa0a131af0 100644
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -1910,8 +1910,8 @@
>                         timer11: timer@0 {
>                                 compatible = "ti,omap5430-timer";
>                                 reg = <0x0 0x80>;
> -                               clocks = <&l4per_clkctrl
> DRA7_L4PER_TIMER11_CLKCTRL 24>;
> -                               clock-names = "fck";
> +                               clocks = <&l4per_clkctrl
> DRA7_L4PER_TIMER11_CLKCTRL 24>, <&timer_sys_clk_div>;
> +                               clock-names = "fck", "timer_sys_ck";
>                                 interrupts = <GIC_SPI 42
> IRQ_TYPE_LEVEL_HIGH>;
>                         };
>                 };
> 
> I will post these changes along with other DTS patches once the time is
> right. For now, I will just drop these aliases completely.

I am not sure if this is gonna buy us anything and if it is scalable.
The added clock is neither a functional clock nor an optional clock of
the timer device, but is just a name to use to set the clock parent. Are
you going to add the aliases from clk-<soc>.h to all the device nodes?
DRA7 dmtimers can actually be parented from one of 13 clocks (driver was
never updated to support those).

Given that the dmtimers can only be requested using phandle on DT boots,
it is possible to eliminate the naming and rely on
assigned-clock-parents in either the dmtimer nodes or the client nodes
(provided all the clock parents are listed in dts), and eliminate this
set_source logic.

regards
Suman

> 
> -Tero
> 
>>
>> regards
>> Suman
>>
>>>
>>> regards
>>> Suman
>>>
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>   drivers/clk/ti/clk-7xx.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>>>> index 5208eb8..64507b8 100644
>>>> --- a/drivers/clk/ti/clk-7xx.c
>>>> +++ b/drivers/clk/ti/clk-7xx.c
>>>> @@ -792,6 +792,7 @@
>>>>   static struct ti_dt_clk dra7xx_clks[] = {
>>>>       DT_CLK(NULL, "timer_32k_ck", "sys_32k_ck"),
>>>>       DT_CLK(NULL, "sys_clkin_ck", "timer_sys_clk_div"),
>>>> +    DT_CLK(NULL, "timer_sys_ck", "timer_sys_clk_div"),
>>>>       DT_CLK(NULL, "sys_clkin", "sys_clkin1"),
>>>>       DT_CLK(NULL, "atl_dpll_clk_mux", "atl-clkctrl:0000:24"),
>>>>       DT_CLK(NULL, "atl_gfclk_mux", "atl-clkctrl:0000:26"),
>>>>
>>>
>>
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

