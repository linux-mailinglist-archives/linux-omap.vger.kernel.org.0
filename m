Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D5C35BB03
	for <lists+linux-omap@lfdr.de>; Mon, 12 Apr 2021 09:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236837AbhDLHmZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Apr 2021 03:42:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236939AbhDLHmH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Apr 2021 03:42:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6ACB60201;
        Mon, 12 Apr 2021 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618213309;
        bh=BX0eMo6RrMqJBnAaxOg9/r0RHrhLfkVMYXxjWlAL++c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZdaurBRYsEDOFoST4PAoy5DfwDdXj8rv+Wtqm0XD50M3mzuGeuzOEe7oRpf7hc77V
         hHQs8qIHP7KvI4zhT/7zcqHoHTbLL/t9y0xbUGVjhKyfAgZ4KZZJboJqANMnbNzEyi
         wuvKB/2F5u8cRzIJNDnztK66H9phiokweIqfc0pQVFCufyps2BfwNI+kFewCd8SBOl
         mfg0NdBtBeFdW6xHK1NZgRV+w5kokEUBNin6OwzjSjFzzjqYmYNSCaDZ1Ic0pzFQHj
         7MgGYGfi+2usWW0SyqLA5BreATFpMhsY3dJIsRu+EGANWqdIZ+5ENa4fl1tjizByqW
         l5tupbPvgOiqQ==
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
To:     Dario Binacchi <dariobin@libero.it>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
References: <20210402192054.7934-1-dariobin@libero.it>
 <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
 <1727466283.11523.1617746554330@mail1.libero.it>
 <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
 <1044574275.383115.1617779265390@mail1.libero.it>
 <CAL_JsqLcus=Y5nOuV1wiAiVb1mTq9N8xqJpGJD6ip+Ec_6YDyw@mail.gmail.com>
 <a197b5d8-621b-6655-e571-2877d007cd4c@kernel.org>
 <116337570.107804.1617913442196@mail1.libero.it>
 <8f232b81-4c83-54db-bcbd-2cae78ede814@kernel.org>
 <333530206.539702.1618169440615@mail1.libero.it>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <a17dec03-d98c-0aac-0bbb-eeaa11f156f3@kernel.org>
Date:   Mon, 12 Apr 2021 10:41:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <333530206.539702.1618169440615@mail1.libero.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/04/2021 22:30, Dario Binacchi wrote:
> 
>> Il 09/04/2021 12:32 Tero Kristo <kristo@kernel.org> ha scritto:
>>
>>   
>> On 08/04/2021 23:24, Dario Binacchi wrote:
>>>
>>>> Il 07/04/2021 15:21 Tero Kristo <kristo@kernel.org> ha scritto:
>>>>
>>>>    
>>>> On 07/04/2021 15:52, Rob Herring wrote:
>>>>> On Wed, Apr 7, 2021 at 2:07 AM Dario Binacchi <dariobin@libero.it> wrote:
>>>>>>
>>>>>>
>>>>>>> Il 07/04/2021 03:16 Rob Herring <robh+dt@kernel.org> ha scritto:
>>>>>>>
>>>>>>>
>>>>>>> On Tue, Apr 6, 2021 at 5:02 PM Dario Binacchi <dariobin@libero.it> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>> Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> The series comes from my commit in U-boot
>>>>>>>>>> d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
>>>>>>>>>> and from the subsequent exchange of emails at the end of which I was
>>>>>>>>>> suggested to send the patch to the linux kernel
>>>>>>>>>> (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
>>>>>>>>>
>>>>>>>>> It's 'ranges' that determines translatable which is missing from the
>>>>>>>>> DT. This should have not had a 0 size either though maybe we could
>>>>>>>>> support that.
>>>>>>>>
>>>>>>>> I have replied to the email you sent to the u-boot mailing list
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Does the DT have to be updated anyways for your spread spectrum support?
>>>>>>>>
>>>>>>>> The spread spectrum support patch does not need this patch to work. They belong
>>>>>>>> to two different series.
>>>>>>>
>>>>>>> That's not what I asked. Is the spread spectrum support forcing a DT
>>>>>>> update for users?
>>>>>>
>>>>>> Yes, the deltam and modfreq registers must be added to the DPLL clocks.
>>>>>
>>>>> That's a shame given this dts has been mostly untouched since 2013.
>>>>>
>>>>
>>>> I think technically it would be possible to map these registers within
>>>> the driver also, seeing there are like a handful of the DPLLs for both
>>>> am3/am4 which are impacted. Just add a new compatible or something, or
>>>> alternatively parse the register addresses and populate the
>>>> deltam/modfreq registers based on that.
>>>
>>> I have not added new compatibles, but I have added the offset of the delta and modfreq
>>> registers to the data structures used by the DPLL drivers and I have set them in the
>>> related setup functions.
>>> https://lore.kernel.org/patchwork/patch/1406590/
>>
>> True, I just said that technically it would be possible to add this data
>> within the driver itself to avoid modifying DT if that would be preferred.
> 
> In the review of the series no one asked not to change the device tree but it is also true
> that no review has been made on the patch 'clk: ti: add am33xx / am43xx spread spectrum clock support',
> the one to be applied on the drivers that support the SSC.
> I take this opportunity to ask you if you can kindly review that patch.

The clock driver patch itself seems fine, the devil is on the DT side, 
and how we are going to re-arrange the DT data to accommodate it.

> 
>>
>>>
>>>>
>>>>>>> If the DT has to be changed anyways (not really
>>>>>>> great policy), then you could fix this in the DT at the same time.
>>>>>>
>>>>>> I could put the fix to the device tree in that series, although I wouldn't
>>>>>> create a single patch to fix and add the SSC registers. First the size-cells = <0>
>>>>>> fix patch and then the SSC patch.
>>>>>> Do you agree?
>>>>>
>>>>> By at the same time, I really just meant within 1 release.
>>>>>
>>>>> But I'd like to hear TI maintainers' thoughts on this.
>>>>
>>>> I did post a comment on patch #1 questioning the approach from TI clock
>>>> driver perspective, imho I can't see why these two patches would be
>>>> needed right now.
>>
>> Fix to above, it was patch #2 I was referring to.
>>
>>>
>>> Because U-boot maintainers asked me after I sent them my patch on this issue.
>>> I believe that the email exchange that took place in the U-boot (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/)
>>> and Linux kernel mailing lists showed that:
>>> - The patch 'fdt: translate address if # size-cells = <0>' is wrong (U-boot has accepted
>>>     it, and it will have to be reverted).
>>> - However, the same patch highlighted that it is wrong to use the size-cells = <0> property
>>>     in the prcm_clocks and scm_clocks nodes of device tree.
>>> - Rob agrees that in the case of the am3xx this is the right choice:
>>
>> Well, I don't quite like where this is ending at. Basically you are just
>> modifying the am3/am4 DTs adding a size spec for every clock node. This
>> leaves the omap3/omap4/omap5/dra7 in the old format. Should someone
>> convert those also? Has anybody tested what happens with the u-boot
>> change on those platforms? Or with the kernel change proposed for the TI
>> clock driver?
>>
>> Also, none of this changes the fact that imho patch #2 in this series is
>> wrong and should be fixed. Doing ioremap for every clock node is at
>> least costly (dra7xx has some 180 clock nodes based on quick grep) and
>> also potentially breaks things (you get extremely fragmented iomappings,
>> and some of them might even get rejected because you end up in the same
>> 4K page), and should be avoided.
> 
> You are right, and in fact in my previous email, I proposed only to change the
> ti_clk_get_reg_addr() from:
> - if (of_property_read_u32_index (node, "reg", index, & val)) {
> + if (of_property_read_u32_index (node, "reg", index * 2, & val)) {
> following the change of size-cells from 0 to 1 in the DTS, without ioremap.

Yep that would be ok, assuming we change the DT in the manner proposed.

> 
>> If things would be fixed properly, we would get rid of the clock nodes
>> from the DT completely and just leave the clock providers in place;
>> clocks would be specified via something like 'clocks = <&prcm
>> AM3_ADC_TSC_FCK>;'
> 
> In which node of the device tree should the 'clocks = <&prcm AM3_ADC_TSC_FCK>;'
> property be found?

This would be used to replace the device nodes, e.g. currently we have 
clocks = <&adc_tsc_fck> under the tscadc node under am4, this would 
change to <&prcm AM3_ADC_TSC_FCK>. Similar to any other clock entry 
under every device on the platform.

> Could you please briefly describe how the device tree would change?
> The clock nodes would be removed but I am not clear how the rest of the device
> tree would change.
> Would this solution only impact the device trees and the code of the am3 / am4
> architectures?

The change on the DT itself would be pretty large, removing all clock 
nodes and modifying any existing handles towards the clock nodes, and 
this would impact all OMAP architectures.

Anyways, it is mostly up-to Tony how he wants to see the DT change, as 
he is the maintainer for the OMAP family DT data.

I am just raising the opinion here that from kernel point of view, 
adding the missing size cells seems unnecessary, and I can't see why 
u-boot can't be changed to support the existing broken DT. It is broken 
now, and it will be broken with the addition of the size cells in place, 
and the actual "neat" end result would be to get rid of the clock nodes 
completely.

-Tero

> 
> Thanks and regards,
> Dario
> 
>> similar to what is done with the clkctrl entries, and
>> rest of the clock data would be built-in to the clock driver. This would
>> completely get rid of any future compatibility issues and the need to
>> tweak the DT if some clock driver would need modifications to support
>> some new feature.
>>
>> -Tero
>>
>>> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
>>> index 1fb22088caeb..59b0a0cf211e 100644
>>> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
>>> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
>>> @@ -110,7 +110,8 @@
>>>    
>>>                                   prcm_clocks: clocks {
>>>                                           #address-cells = <1>;
>>> -                                       #size-cells = <0>;
>>> +                                       #size-cells = <1>;
>>> +                                       ranges = <0 0 0x2000>;
>>>                                   };
>>>    
>>>                                   prcm_clockdomains: clockdomains {
>>> @@ -320,7 +321,8 @@
>>>    
>>>                                           scm_clocks: clocks {
>>>                                                   #address-cells = <1>;
>>> -                                               #size-cells = <0>;
>>> +                                               #size-cells = <1>;
>>> +                                               ranges = <0 0 0x800>;
>>>                                           };
>>>                                   };
>>>
>>> --- a/arch/arm/boot/dts/am33xx-clocks.dtsi
>>> +++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
>>> @@ -10,7 +10,7 @@
>>>                   compatible = "ti,mux-clock";
>>>                   clocks = <&virt_19200000_ck>, <&virt_24000000_ck>, <&virt_25000000_ck>, <&virt_26000000_ck>;
>>>                   ti,bit-shift = <22>;
>>> -               reg = <0x0040>;
>>> +               reg = <0x0040 0x4>;
>>>           };
>>>    
>>>           adc_tsc_fck: adc_tsc_fck {
>>> @@ -98,7 +98,7 @@
>>>                   compatible = "ti,gate-clock";
>>>                   clocks = <&l4ls_gclk>;
>>>                   ti,bit-shift = <0>;
>>> -               reg = <0x0664>;
>>> +               reg = <0x0664 0x04>;
>>>           };
>>> [...]
>>>
>>> - U-boot rightly wants to use the same device tree as the Kernel.
>>> - IMHO, if I'm not missing something, I think using a #size-cells = <1>; for clocks
>>>     it requires only one code change in the ti_clk_get_reg_addr():
>>>
>>> --- a/drivers/clk/ti/clk.c
>>> +++ b/drivers/clk/ti/clk.c
>>> @@ -265,9 +265,27 @@ int __init ti_clk_retry_init(struct device_node *node, void *user,
>>>    int ti_clk_get_reg_addr(struct device_node *node, int index,
>>>                           struct clk_omap_reg *reg)
>>>
>>> -       if (of_property_read_u32_index(node, "reg", index, &val)) {
>>> +       if (of_property_read_u32_index(node, "reg", index * 2, &val)) {
>>>
>>>      The other changes to develop affect device trees of architectures which, like am3, currently
>>>      use #size-cells = <0>.
>>>
>>> IMHO, all this would lead to an improvement of the device trees with minimal impact on the code.
>>> It would benefit U-boot, which would not have to develop special platform code and any new
>>> architectures that would inherit from these DTs.
>>>
>>> If you think it might be worth it, I am available to develop this patch.
>>>
>>> Thanks and regards,
>>> Dario
>>>
>>>>
>>>> -Tero

