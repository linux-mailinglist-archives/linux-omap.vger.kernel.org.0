Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F37B95946
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 10:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbfHTIRn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 04:17:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40158 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729150AbfHTIRn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 04:17:43 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7K8HaKF050508;
        Tue, 20 Aug 2019 03:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566289056;
        bh=biZGJGGzdHRuydMS8dV7JNB7lbJnKSBmHwsZR0nrilM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=c/0Zoe7Zre0IvouCPQvAah8/jqmMfDgImNhkt4vVWdOm93FVCjt9l1gzkySQQm/5l
         39gkpeoYIeVWZx3k8C2p79QZw5y2l1FtPQnDMCRsNos0YpLXbeZtTLiUk1nDQZBTPI
         fgkUQD6CgQqI3+LJBZobHKblqHKF10fkAnwM5OIY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7K8Ha6Z078715
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 03:17:36 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 03:17:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 03:17:35 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7K8HXUr019455;
        Tue, 20 Aug 2019 03:17:34 -0500
Subject: Re: [PATCH 1/3] clk: ti: clkctrl: add support for polling clock
 status for enable only
To:     Suman Anna <s-anna@ti.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-2-git-send-email-t-kristo@ti.com>
 <6a088bc2-e854-b4fa-3c97-ce94dd2a92cb@ti.com>
 <99f2b99f-6b5a-eef6-cc6f-fed7431f7cc8@ti.com>
 <839910f6-e533-b823-c2ca-22525a7b8733@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <e961d427-2ca5-dd05-7f63-c2acf4a9b18d@ti.com>
Date:   Tue, 20 Aug 2019 11:17:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <839910f6-e533-b823-c2ca-22525a7b8733@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20.8.2019 0.07, Suman Anna wrote:
> On 8/19/19 4:13 AM, Tero Kristo wrote:
>> On 08/08/2019 01:43, Suman Anna wrote:
>>> Hi Tero,
>>>
>>> On 8/7/19 8:04 AM, Tero Kristo wrote:
>>>> The activity status for certain clocks is possible to be polled only
>>>> during enable phase; the disable phase depends on additional reset
>>>> logic.
>>>
>>> I am not sure this is an entirely accurate statement. Can you explain
>>> why this is an issue only with disable sequence and not enable sequence?
>>> Almost sounds like you are doing some asymmetric sequence w.r.t clocks
>>> and resets.
>>
>> This follows the recommended ordering sequence from TRM, so reset will
>> be de-asserted before enabling clock, so we can keep the polling there.
> 
> Can you please point out the section where this ordering sequence is
> mentioned? If anything, this is quite the opposite, and that is what the
> existing hwmod code also reflects. Please see the NOTE in Section
> 5.3.3.2 of the DRA7 TRM [1] for reference and the section 3.5.6.6 and/or
> 3.5.6.7.

Ah you are right. This was actually because of the flipped logic within 
ti-sysc driver. I'll have a look if I can figure out a better way to 
handle this.

-Tero

> 
> Your patch is a consequence of your on-going ti-sysc code where you have
> flipped the logic compared to hwmod code. In anycase, the mainline
> kernel has the various MMUs on OMAP3, OMAP4 and OMAP5 SoCs functional a
> long-time before ti-sysc and clkctrl are introduced and this was broken
> when clkctrl clks were introduced in 4.16 kernel. The issue can be seen
> rather easily with an OMAP IOMMU unit-test [2], and the error issue
> signatures are something like below. Below log is an example log
> generated when using OMAP5 DSP MMU on 5.3-rc1 + addition of test nodes
> from [2], and similar crashes are also seen with other MMUs.
> 
> # insmod iommu_dt_test.ko count=4
> [  126.070188] iommu_dt_test: loading out-of-tree module taints kernel.
> [  126.077568] omap_iommu_test iommu_test: ignoring dependency for
> device, assuming no driver
> [  126.085963] omap_iommu_test_init: iommu_test_init entered
> [  126.091495] omap_iommu_test iommu_test: Enabling IOMMU...
> [  126.096997] omap_iommu_test iommu_test: dev->of_node->name:
> iommu_test dev_name iommu_test
> [  126.107352] dsp_cm:clk:0000:0: failed to enable
> [  126.111907] ------------[ cut here ]------------
> [  126.116553] WARNING: CPU: 0 PID: 1013 at drivers/clk/clk.c:924
> clk_core_disable_lock+0x18/0x24
> [  126.125198] dsp_cm:clk:0000:0 already disabled
> [  126.129656] Modules linked in: iommu_dt_test(O+)
> [  126.134299] CPU: 0 PID: 1013 Comm: insmod Tainted: G           O
> 5.3.0-rc1-00005-gd893572f52c6 #129
> [  126.143816] Hardware name: Generic OMAP5 (Flattened Device Tree)
> [  126.149859] [<c01122d8>] (unwind_backtrace) from [<c010c8b8>]
> (show_stack+0x10/0x14)
> [  126.157641] [<c010c8b8>] (show_stack) from [<c08cce38>]
> (dump_stack+0xb4/0xd4)
> [  126.164900] [<c08cce38>] (dump_stack) from [<c0139d70>]
> (__warn.part.3+0xa8/0xd4)
> [  126.172419] [<c0139d70>] (__warn.part.3) from [<c0139df8>]
> (warn_slowpath_fmt+0x5c/0x88)
> [  126.180549] [<c0139df8>] (warn_slowpath_fmt) from [<c05733b4>]
> (clk_core_disable_lock+0x18/0x24)
> [  126.189376] [<c05733b4>] (clk_core_disable_lock) from [<c0122d5c>]
> (_disable_clocks+0x18/0x98)
> [  126.198027] [<c0122d5c>] (_disable_clocks) from [<c012569c>]
> (omap_hwmod_deassert_hardreset+0xc8/0x174)
> [  126.207463] [<c012569c>] (omap_hwmod_deassert_hardreset) from
> [<c0126160>] (omap_device_deassert_hardreset+0x30/0x50)
> [  126.218121] [<c0126160>] (omap_device_deassert_hardreset) from
> [<c05d5f24>] (omap_iommu_attach_dev+0x298/0x418)
> [  126.228256] [<c05d5f24>] (omap_iommu_attach_dev) from [<c05d0ba8>]
> (__iommu_attach_device+0x44/0xdc)
> [  126.237430] [<c05d0ba8>] (__iommu_attach_device) from [<c05d28e8>]
> (__iommu_attach_group+0x40/0x68)
> [  126.246517] [<c05d28e8>] (__iommu_attach_group) from [<c05d29c8>]
> (iommu_attach_device+0x80/0x88)
> [  126.255434] [<c05d29c8>] (iommu_attach_device) from [<bf000188>]
> (omap_iommu_test_probe+0x10c/0x210 [iommu_dt_test])
> [  126.266011] [<bf000188>] (omap_iommu_test_probe [iommu_dt_test]) from
> [<c05e0d8c>] (platform_drv_probe+0x48/0x98)
> [  126.276321] [<c05e0d8c>] (platform_drv_probe) from [<c05dedd0>]
> (really_probe+0xec/0x2cc)
> [  126.284537] [<c05dedd0>] (really_probe) from [<c05df134>]
> (driver_probe_device+0x5c/0x160)
> [  126.292839] [<c05df134>] (driver_probe_device) from [<c05df3d8>]
> (device_driver_attach+0x58/0x60)
> [  126.301751] [<c05df3d8>] (device_driver_attach) from [<c05df438>]
> (__driver_attach+0x58/0xcc)
> [  126.310314] [<c05df438>] (__driver_attach) from [<c05dd264>]
> (bus_for_each_dev+0x70/0xb4)
> [  126.318529] [<c05dd264>] (bus_for_each_dev) from [<c05de2ac>]
> (bus_add_driver+0x198/0x1d0)
> [  126.326831] [<c05de2ac>] (bus_add_driver) from [<c05dfea0>]
> (driver_register+0x74/0x108)
> [  126.334959] [<c05dfea0>] (driver_register) from [<c0102e80>]
> (do_one_initcall+0x48/0x224)
> [  126.343177] [<c0102e80>] (do_one_initcall) from [<c01d6fa4>]
> (do_init_module+0x5c/0x234)
> [  126.351307] [<c01d6fa4>] (do_init_module) from [<c01d9404>]
> (load_module+0x2200/0x24d0)
> [  126.359347] [<c01d9404>] (load_module) from [<c01d9928>]
> (sys_finit_module+0xbc/0xdc)
> [  126.367213] [<c01d9928>] (sys_finit_module) from [<c01011e0>]
> (__sys_trace_return+0x0/0x20)
> [  126.375598] Exception stack(0xebc99fa8 to 0xebc99ff0)
> [  126.380671] 9fa0:                   00000000 00035160 00000003
> 00035150 00000000 00035ee8
> [  126.388885] 9fc0: 00000000 00035160 00000000 0000017b 00000007
> 00000003 00035150 be8e3c2c
> [  126.397095] 9fe0: be8e3a80 be8e3a70 0001b42d b6e4a1b0
> [  126.402166] ---[ end trace 9ba6f4788aad890b ]---
> [  126.406896] omap-iommu 4a066000.mmu: 4a066000.mmu: version 2.0
> [  126.412765] omap_iommu_test iommu_test: Mapping da 0xa0100000, pa
> 0x95100000, len 0x100000
> [  126.421196] omap_iommu_test iommu_test: Mapping da 0xa0200000, pa
> 0x95200000, len 0x100000
> [  126.429622] omap_iommu_test iommu_test: Mapping da 0xa0300000, pa
> 0x95300000, len 0x100000
> [  126.437997] omap_iommu_test iommu_test: Mapping da 0xa0400000, pa
> 0x95400000, len 0x100000
> 
> The fix for that is actually doing this poll bailout in _enable rather
> than disable. I would rather see these fixed first before the ti-sysc
> conversions and logic are vetted.
> 
>>
>> Going down, reset must be asserted post disabling clocks, which results
>> a timeout if the idle status check is not bypassed.
>>
>> This is kind of not perfect and should be fixed later to somehow add a
>> direct link between the clock and reset lines, so that we know when
>> there is dependency between the two and can check the status of both to
>> see if we should poll something or not.
> 
> Yeah, agreed. Unfortunately, I do not there is a clean way of doing this
> given that typically clocks and resets are treated and managed by
> separate subsystems in kernel. You will always end up with a quirk flags
> like this in either of the drivers.
> 
>>
>>>
>>> On the downstream kernel, we have reused the existing NO_IDLEST flag as
>>> a quirk within both the enable and disable functions for the IPs with
>>> hardreset lines, and this patch seems to introduce a new NO_IDLE_POLL
>>> flag but only during the disable path.
>>
>> The NO_IDLEST patch is not perfect, as it introduces a timing hazard
>> where while enabling the module one can access the IP registers before
>> it has left idle, leading into a crash.
> 
> Both these flag macro names are misnomers IMO, the IP registers cannot
> be accessed without releasing the resets and clocks on the IPs with the
> hard-reset lines.
> 
> regards
> Suman
> 
> [1] http://www.ti.com/lit/pdf/sprui30
> [2] https://github.com/sumananna/omap-test-iommu
> 
>>
>> -Tero
>>
>>>
>>> regards
>>> Suman
>>>
>>> If the disable phase is polled with these clocks, it will
>>>> result in a timeout. To fix this, add logic for polling the clock
>>>> activity only during enable, and add a new flag for this purpose.
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>    drivers/clk/ti/clkctrl.c | 5 ++++-
>>>>    drivers/clk/ti/clock.h   | 1 +
>>>>    2 files changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
>>>> index 975995e..f5517a8 100644
>>>> --- a/drivers/clk/ti/clkctrl.c
>>>> +++ b/drivers/clk/ti/clkctrl.c
>>>> @@ -25,6 +25,7 @@
>>>>    #include "clock.h"
>>>>      #define NO_IDLEST            0x1
>>>> +#define NO_IDLE_POLL            0x2
>>>>      #define OMAP4_MODULEMODE_MASK        0x3
>>>>    @@ -187,7 +188,7 @@ static void _omap4_clkctrl_clk_disable(struct
>>>> clk_hw *hw)
>>>>          ti_clk_ll_ops->clk_writel(val, &clk->enable_reg);
>>>>    -    if (clk->flags & NO_IDLEST)
>>>> +    if (clk->flags & (NO_IDLEST | NO_IDLE_POLL))
>>>>            goto exit;
>>>>          /* Wait until module is disabled */
>>>> @@ -597,6 +598,8 @@ static void __init _ti_omap4_clkctrl_setup(struct
>>>> device_node *node)
>>>>                hw->enable_bit = MODULEMODE_HWCTRL;
>>>>            if (reg_data->flags & CLKF_NO_IDLEST)
>>>>                hw->flags |= NO_IDLEST;
>>>> +        if (reg_data->flags & CLKF_NO_IDLE_POLL)
>>>> +            hw->flags |= NO_IDLE_POLL;
>>>>              if (reg_data->clkdm_name)
>>>>                hw->clkdm_name = reg_data->clkdm_name;
>>>> diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
>>>> index e4b8392..6410ff6 100644
>>>> --- a/drivers/clk/ti/clock.h
>>>> +++ b/drivers/clk/ti/clock.h
>>>> @@ -82,6 +82,7 @@ enum {
>>>>    #define CLKF_SW_SUP            BIT(5)
>>>>    #define CLKF_HW_SUP            BIT(6)
>>>>    #define CLKF_NO_IDLEST            BIT(7)
>>>> +#define CLKF_NO_IDLE_POLL        BIT(8)
>>>>      #define CLKF_SOC_MASK            GENMASK(11, 8)
>>>>   
>>>
>>
>> -- 
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
