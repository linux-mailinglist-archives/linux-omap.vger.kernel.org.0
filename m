Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A503135FCCB
	for <lists+linux-omap@lfdr.de>; Wed, 14 Apr 2021 22:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbhDNUkA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Apr 2021 16:40:00 -0400
Received: from smtp-18-i2.italiaonline.it ([213.209.12.18]:38540 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230227AbhDNUj7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Apr 2021 16:39:59 -0400
Received: from oxapps-34-156.iol.local ([10.101.8.202])
        by smtp-18.iol.local with ESMTPA
        id WmIPlnPejgCmjWmIPlCVJG; Wed, 14 Apr 2021 22:39:35 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1618432775; bh=pgQRWWiXnAjv1OPeRW7Xqhv+VM7S98hxJ5GVUijdjp0=;
        h=From;
        b=MiLRLk2yeg1s/iJwOvQNab2QDAtuuL5tE1HOQQyobFkVRfBf6F7O9ueezMGu6oknk
         h3ctMKPnz5GbjZlnSt0DYckwmeNWK3oA527qQNPTUtgvHOu/QilzuZrckf2mjUHLfi
         jJGZKR9A5HGox4ipXSuXCXtJiLygeb417HkB0kAqsacsH+ps5JPORl2hHcfq/qBE18
         dS+uuzUYLd6UoeDXQ6qEPieVNYoN+WGwC7pZKkZN0j+eZOFlI+6gGEr701JAkzIf1z
         2ZThRK4c1ScMQtzuUqw+5ORM1jp4aRvjto4R8K8ETptWwLYMoDLOCsV0ZFafRiDEu9
         MqDc7lsQtZLww==
X-CNFS-Analysis: v=2.4 cv=X5uXlEfe c=1 sm=1 tr=0 ts=60775307 cx=a_exe
 a=8VG+hfycQzUmEcMvOp8bLQ==:117 a=VYA5D5F8Gk0A:10 a=IkcTkHD0fZMA:10
 a=4ehuGOvBq5EA:10 a=VwQbUJbxAAAA:8 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8
 a=vt_3zZcFIEjTfUP8xDMA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=IC2XNlieTeVoXbcui8wp:22
Date:   Wed, 14 Apr 2021 22:39:33 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Tero Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Message-ID: <1627640615.696710.1618432773724@mail1.libero.it>
In-Reply-To: <a17dec03-d98c-0aac-0bbb-eeaa11f156f3@kernel.org>
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
 <a17dec03-d98c-0aac-0bbb-eeaa11f156f3@kernel.org>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 95.244.94.151
X-Originating-Client: open-xchange-appsuite
x-libjamsun: tUXThDJCE87j9GPIGDtFSooe5aKIrLIy
x-libjamv: 0q95EGFlCl0=
X-CMAE-Envelope: MS4xfFBFs8oZhE+XtrWE7XdCVsupGI1Nhkqe83YBO7wZn4m6lClG68kahfrlapumIZTsh6oPmvbBcgZI8SsFdheliVYP7hFxM9l8RmsOVI/Zx71o5R48RXnf
 IzHix+lJvmqNC0k/NwteWjTMMdBThcSLJBS7ATVkzPPJG46wTIfHZILk3RGGBbZpI5kpFIFwb8NqRRNM3f7pqOtASxkAOiG6OHA49hB/cmxOiqhO7FxpW6Hy
 I/w+e2Dohvr4O7zX7ccvPSAVFuI/xSNxznjNS+OIIh67/kXezlZH9fRIz1PTokcZFJDUPMCM89zWP2WIzs/D3rQ1uaDcJMIF5DLEXNt97Pltgak9yqLJ0KkY
 gE0LCTF2PKwmhrBrHSvGOZpLSIBtnidup0nYwI8DCeLlC+LqjuM8DVCkiM0WLDW2sOqmD+YpE79WRQdknH1wr+IOUrZhpU7YdQSHO0kLojb5+YIbek0nblgu
 BnGg16iyTJgkjJstkvuTHSl4iEE0orBxgqjy90fhCdAA1lfe8/zu2ARBsKHBK8MgGgo007s3BAWVDLBo
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

> Il 12/04/2021 09:41 Tero Kristo <kristo@kernel.org> ha scritto:
> 
>  
> On 11/04/2021 22:30, Dario Binacchi wrote:
> > 
> >> Il 09/04/2021 12:32 Tero Kristo <kristo@kernel.org> ha scritto:
> >>
> >>   
> >> On 08/04/2021 23:24, Dario Binacchi wrote:
> >>>
> >>>> Il 07/04/2021 15:21 Tero Kristo <kristo@kernel.org> ha scritto:
> >>>>
> >>>>    
> >>>> On 07/04/2021 15:52, Rob Herring wrote:
> >>>>> On Wed, Apr 7, 2021 at 2:07 AM Dario Binacchi <dariobin@libero.it> wrote:
> >>>>>>
> >>>>>>
> >>>>>>> Il 07/04/2021 03:16 Rob Herring <robh+dt@kernel.org> ha scritto:
> >>>>>>>
> >>>>>>>
> >>>>>>> On Tue, Apr 6, 2021 at 5:02 PM Dario Binacchi <dariobin@libero.it> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> The series comes from my commit in U-boot
> >>>>>>>>>> d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
> >>>>>>>>>> and from the subsequent exchange of emails at the end of which I was
> >>>>>>>>>> suggested to send the patch to the linux kernel
> >>>>>>>>>> (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
> >>>>>>>>>
> >>>>>>>>> It's 'ranges' that determines translatable which is missing from the
> >>>>>>>>> DT. This should have not had a 0 size either though maybe we could
> >>>>>>>>> support that.
> >>>>>>>>
> >>>>>>>> I have replied to the email you sent to the u-boot mailing list
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Does the DT have to be updated anyways for your spread spectrum support?
> >>>>>>>>
> >>>>>>>> The spread spectrum support patch does not need this patch to work. They belong
> >>>>>>>> to two different series.
> >>>>>>>
> >>>>>>> That's not what I asked. Is the spread spectrum support forcing a DT
> >>>>>>> update for users?
> >>>>>>
> >>>>>> Yes, the deltam and modfreq registers must be added to the DPLL clocks.
> >>>>>
> >>>>> That's a shame given this dts has been mostly untouched since 2013.
> >>>>>
> >>>>
> >>>> I think technically it would be possible to map these registers within
> >>>> the driver also, seeing there are like a handful of the DPLLs for both
> >>>> am3/am4 which are impacted. Just add a new compatible or something, or
> >>>> alternatively parse the register addresses and populate the
> >>>> deltam/modfreq registers based on that.
> >>>
> >>> I have not added new compatibles, but I have added the offset of the delta and modfreq
> >>> registers to the data structures used by the DPLL drivers and I have set them in the
> >>> related setup functions.
> >>> https://lore.kernel.org/patchwork/patch/1406590/
> >>
> >> True, I just said that technically it would be possible to add this data
> >> within the driver itself to avoid modifying DT if that would be preferred.
> > 
> > In the review of the series no one asked not to change the device tree but it is also true
> > that no review has been made on the patch 'clk: ti: add am33xx / am43xx spread spectrum clock support',
> > the one to be applied on the drivers that support the SSC.
> > I take this opportunity to ask you if you can kindly review that patch.
> 
> The clock driver patch itself seems fine, the devil is on the DT side, 
> and how we are going to re-arrange the DT data to accommodate it.
> 
> > 
> >>
> >>>
> >>>>
> >>>>>>> If the DT has to be changed anyways (not really
> >>>>>>> great policy), then you could fix this in the DT at the same time.
> >>>>>>
> >>>>>> I could put the fix to the device tree in that series, although I wouldn't
> >>>>>> create a single patch to fix and add the SSC registers. First the size-cells = <0>
> >>>>>> fix patch and then the SSC patch.
> >>>>>> Do you agree?
> >>>>>
> >>>>> By at the same time, I really just meant within 1 release.
> >>>>>
> >>>>> But I'd like to hear TI maintainers' thoughts on this.
> >>>>
> >>>> I did post a comment on patch #1 questioning the approach from TI clock
> >>>> driver perspective, imho I can't see why these two patches would be
> >>>> needed right now.
> >>
> >> Fix to above, it was patch #2 I was referring to.
> >>
> >>>
> >>> Because U-boot maintainers asked me after I sent them my patch on this issue.
> >>> I believe that the email exchange that took place in the U-boot (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/)
> >>> and Linux kernel mailing lists showed that:
> >>> - The patch 'fdt: translate address if # size-cells = <0>' is wrong (U-boot has accepted
> >>>     it, and it will have to be reverted).
> >>> - However, the same patch highlighted that it is wrong to use the size-cells = <0> property
> >>>     in the prcm_clocks and scm_clocks nodes of device tree.
> >>> - Rob agrees that in the case of the am3xx this is the right choice:
> >>
> >> Well, I don't quite like where this is ending at. Basically you are just
> >> modifying the am3/am4 DTs adding a size spec for every clock node. This
> >> leaves the omap3/omap4/omap5/dra7 in the old format. Should someone
> >> convert those also? Has anybody tested what happens with the u-boot
> >> change on those platforms? Or with the kernel change proposed for the TI
> >> clock driver?
> >>
> >> Also, none of this changes the fact that imho patch #2 in this series is
> >> wrong and should be fixed. Doing ioremap for every clock node is at
> >> least costly (dra7xx has some 180 clock nodes based on quick grep) and
> >> also potentially breaks things (you get extremely fragmented iomappings,
> >> and some of them might even get rejected because you end up in the same
> >> 4K page), and should be avoided.
> > 
> > You are right, and in fact in my previous email, I proposed only to change the
> > ti_clk_get_reg_addr() from:
> > - if (of_property_read_u32_index (node, "reg", index, & val)) {
> > + if (of_property_read_u32_index (node, "reg", index * 2, & val)) {
> > following the change of size-cells from 0 to 1 in the DTS, without ioremap.
> 
> Yep that would be ok, assuming we change the DT in the manner proposed.
> 
> > 
> >> If things would be fixed properly, we would get rid of the clock nodes
> >> from the DT completely and just leave the clock providers in place;
> >> clocks would be specified via something like 'clocks = <&prcm
> >> AM3_ADC_TSC_FCK>;'
> > 
> > In which node of the device tree should the 'clocks = <&prcm AM3_ADC_TSC_FCK>;'
> > property be found?
> 
> This would be used to replace the device nodes, e.g. currently we have 
> clocks = <&adc_tsc_fck> under the tscadc node under am4, this would 
> change to <&prcm AM3_ADC_TSC_FCK>. Similar to any other clock entry 
> under every device on the platform.
> 
> > Could you please briefly describe how the device tree would change?
> > The clock nodes would be removed but I am not clear how the rest of the device
> > tree would change.
> > Would this solution only impact the device trees and the code of the am3 / am4
> > architectures?
> 
> The change on the DT itself would be pretty large, removing all clock 
> nodes and modifying any existing handles towards the clock nodes, and 
> this would impact all OMAP architectures.
> 
> Anyways, it is mostly up-to Tony how he wants to see the DT change, as 
> he is the maintainer for the OMAP family DT data.
> 
> I am just raising the opinion here that from kernel point of view, 
> adding the missing size cells seems unnecessary, and I can't see why 
> u-boot can't be changed to support the existing broken DT. It is broken 
> now, and it will be broken with the addition of the size cells in place, 
> and the actual "neat" end result would be to get rid of the clock nodes 
> completely.

I'll fix U-boot.
Thanks for your explanations.
Hope for SSC patch review from you and/or some TI MAINTAINER.

Thanks and regards,
Dario

> 
> -Tero
> 
> > 
> > Thanks and regards,
> > Dario
> > 
> >> similar to what is done with the clkctrl entries, and
> >> rest of the clock data would be built-in to the clock driver. This would
> >> completely get rid of any future compatibility issues and the need to
> >> tweak the DT if some clock driver would need modifications to support
> >> some new feature.
> >>
> >> -Tero
> >>
> >>> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> >>> index 1fb22088caeb..59b0a0cf211e 100644
> >>> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> >>> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> >>> @@ -110,7 +110,8 @@
> >>>    
> >>>                                   prcm_clocks: clocks {
> >>>                                           #address-cells = <1>;
> >>> -                                       #size-cells = <0>;
> >>> +                                       #size-cells = <1>;
> >>> +                                       ranges = <0 0 0x2000>;
> >>>                                   };
> >>>    
> >>>                                   prcm_clockdomains: clockdomains {
> >>> @@ -320,7 +321,8 @@
> >>>    
> >>>                                           scm_clocks: clocks {
> >>>                                                   #address-cells = <1>;
> >>> -                                               #size-cells = <0>;
> >>> +                                               #size-cells = <1>;
> >>> +                                               ranges = <0 0 0x800>;
> >>>                                           };
> >>>                                   };
> >>>
> >>> --- a/arch/arm/boot/dts/am33xx-clocks.dtsi
> >>> +++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
> >>> @@ -10,7 +10,7 @@
> >>>                   compatible = "ti,mux-clock";
> >>>                   clocks = <&virt_19200000_ck>, <&virt_24000000_ck>, <&virt_25000000_ck>, <&virt_26000000_ck>;
> >>>                   ti,bit-shift = <22>;
> >>> -               reg = <0x0040>;
> >>> +               reg = <0x0040 0x4>;
> >>>           };
> >>>    
> >>>           adc_tsc_fck: adc_tsc_fck {
> >>> @@ -98,7 +98,7 @@
> >>>                   compatible = "ti,gate-clock";
> >>>                   clocks = <&l4ls_gclk>;
> >>>                   ti,bit-shift = <0>;
> >>> -               reg = <0x0664>;
> >>> +               reg = <0x0664 0x04>;
> >>>           };
> >>> [...]
> >>>
> >>> - U-boot rightly wants to use the same device tree as the Kernel.
> >>> - IMHO, if I'm not missing something, I think using a #size-cells = <1>; for clocks
> >>>     it requires only one code change in the ti_clk_get_reg_addr():
> >>>
> >>> --- a/drivers/clk/ti/clk.c
> >>> +++ b/drivers/clk/ti/clk.c
> >>> @@ -265,9 +265,27 @@ int __init ti_clk_retry_init(struct device_node *node, void *user,
> >>>    int ti_clk_get_reg_addr(struct device_node *node, int index,
> >>>                           struct clk_omap_reg *reg)
> >>>
> >>> -       if (of_property_read_u32_index(node, "reg", index, &val)) {
> >>> +       if (of_property_read_u32_index(node, "reg", index * 2, &val)) {
> >>>
> >>>      The other changes to develop affect device trees of architectures which, like am3, currently
> >>>      use #size-cells = <0>.
> >>>
> >>> IMHO, all this would lead to an improvement of the device trees with minimal impact on the code.
> >>> It would benefit U-boot, which would not have to develop special platform code and any new
> >>> architectures that would inherit from these DTs.
> >>>
> >>> If you think it might be worth it, I am available to develop this patch.
> >>>
> >>> Thanks and regards,
> >>> Dario
> >>>
> >>>>
> >>>> -Tero
