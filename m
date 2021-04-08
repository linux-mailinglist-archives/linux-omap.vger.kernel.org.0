Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6933358E4A
	for <lists+linux-omap@lfdr.de>; Thu,  8 Apr 2021 22:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbhDHUYR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Apr 2021 16:24:17 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:52205 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232041AbhDHUYQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 8 Apr 2021 16:24:16 -0400
Received: from oxapps-32-144.iol.local ([10.101.8.190])
        by smtp-32.iol.local with ESMTPA
        id UbC6lu1MTBc6YUbC6lVgnb; Thu, 08 Apr 2021 22:24:03 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617913443; bh=S3BIXQfpQo++zDln2EF8ZcTp8LoMYd8zAJ9p8/j1cB8=;
        h=From;
        b=xFdHjz4S1+eWsKxVH3uJuNwgtBvw9EcOO20hrm1MIspoCCg3GfBB7N5j8VGtWkCem
         gJq5hTeePzqgK/U5Ls7MCznyROAF+MNR3K3sbd3XLohYbsw8385TC++JQp0g69Ztmh
         gkc5WcGuH+28B4mKc0v3FcGuGizjHK3W7+EGXQkB5JEQjxraf6mlyASGI3jX/VRKoL
         fzBLqK5onoeNusHMyob/frpIem+qh70A4dRX8zW7mXnNDoKI0VNCtYfO0nSGeHAce5
         skLOcWdSpa3ZmmwiMlvhZUa/SYQatGcPTFY1FnfsC4BomcGKZ9uyuqVCQbZal7B1es
         oh+cqr19skVcQ==
X-CNFS-Analysis: v=2.4 cv=B6l8bMhM c=1 sm=1 tr=0 ts=606f6663 cx=a_exe
 a=+LyvvGPX93CApvOVpnXrdQ==:117 a=UPWQtH3J-JgA:10 a=IkcTkHD0fZMA:10
 a=_gZzKa99_6AA:10 a=VwQbUJbxAAAA:8 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8
 a=8LTHUb3NTGMUmE2BBAMA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=IC2XNlieTeVoXbcui8wp:22
Date:   Thu, 8 Apr 2021 22:24:02 +0200 (CEST)
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
Message-ID: <116337570.107804.1617913442196@mail1.libero.it>
In-Reply-To: <a197b5d8-621b-6655-e571-2877d007cd4c@kernel.org>
References: <20210402192054.7934-1-dariobin@libero.it>
 <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
 <1727466283.11523.1617746554330@mail1.libero.it>
 <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
 <1044574275.383115.1617779265390@mail1.libero.it>
 <CAL_JsqLcus=Y5nOuV1wiAiVb1mTq9N8xqJpGJD6ip+Ec_6YDyw@mail.gmail.com>
 <a197b5d8-621b-6655-e571-2877d007cd4c@kernel.org>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 87.20.116.197
X-Originating-Client: open-xchange-appsuite
x-libjamsun: TFQtKds0nbk74TFIzoCUz9lR1gEridzg
x-libjamv: fydCTFSi3F8=
X-CMAE-Envelope: MS4xfClDELyJojz8n+Kd3LDLNRqiGELfp97d0xdF/Xm+4PL05Az1h56U0o7sWpEBqTfnU5tN/T+tmmOeQvfH5TQ42zWNDNcIQ5loYIRzrs/6VZbMnSsyEKXV
 0Dj5BY813FOaXezdFBcrW4MXuJMAvulsWEse2THai0cXw2NNaNs15Wir/Pgg/6GW91o28GkUfbHrYXaFUc31qrQxH1fsQMDSD8qdgqfIEu8s9Sau2VV6zeCJ
 4g3fp+lZuq8bWFDM0tBLhlDQ9CtK8yJWGBFULcT6YL7y68Wu+0bUWBuFp4iSzo4omxiIRqkdlZ/pvJNEv6llHjbHessKIvU5JcY9Gjq/Ees5mdfye3ngl0z3
 ilYC7ZNve8Hh9ZhmjrkTN0bB0k4+ovaoKpqlZK783mltfY2r0j4asYRiCEWC/lP/FiV/X+SCvHXtvXMYIRCllH4aJjnFd8KzxMpfoGgFXDOM3M6259Yf/IW/
 iQs2gTKxaxDwyUvV9J6fF8b4yAAPcR3hmVDUsj6J1Dxi8XwIKQMqx7XVZdy7OwUDcMsoeOlIR3xL/2x7
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Il 07/04/2021 15:21 Tero Kristo <kristo@kernel.org> ha scritto:
> 
>  
> On 07/04/2021 15:52, Rob Herring wrote:
> > On Wed, Apr 7, 2021 at 2:07 AM Dario Binacchi <dariobin@libero.it> wrote:
> >>
> >>
> >>> Il 07/04/2021 03:16 Rob Herring <robh+dt@kernel.org> ha scritto:
> >>>
> >>>
> >>> On Tue, Apr 6, 2021 at 5:02 PM Dario Binacchi <dariobin@libero.it> wrote:
> >>>>
> >>>>
> >>>>> Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
> >>>>>
> >>>>>
> >>>>> On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
> >>>>>>
> >>>>>>
> >>>>>> The series comes from my commit in U-boot
> >>>>>> d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
> >>>>>> and from the subsequent exchange of emails at the end of which I was
> >>>>>> suggested to send the patch to the linux kernel
> >>>>>> (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
> >>>>>
> >>>>> It's 'ranges' that determines translatable which is missing from the
> >>>>> DT. This should have not had a 0 size either though maybe we could
> >>>>> support that.
> >>>>
> >>>> I have replied to the email you sent to the u-boot mailing list
> >>>>
> >>>>>
> >>>>> Does the DT have to be updated anyways for your spread spectrum support?
> >>>>
> >>>> The spread spectrum support patch does not need this patch to work. They belong
> >>>> to two different series.
> >>>
> >>> That's not what I asked. Is the spread spectrum support forcing a DT
> >>> update for users?
> >>
> >> Yes, the deltam and modfreq registers must be added to the DPLL clocks.
> > 
> > That's a shame given this dts has been mostly untouched since 2013.
> > 
> 
> I think technically it would be possible to map these registers within 
> the driver also, seeing there are like a handful of the DPLLs for both 
> am3/am4 which are impacted. Just add a new compatible or something, or 
> alternatively parse the register addresses and populate the 
> deltam/modfreq registers based on that.

I have not added new compatibles, but I have added the offset of the delta and modfreq 
registers to the data structures used by the DPLL drivers and I have set them in the 
related setup functions.
https://lore.kernel.org/patchwork/patch/1406590/

> 
> >>> If the DT has to be changed anyways (not really
> >>> great policy), then you could fix this in the DT at the same time.
> >>
> >> I could put the fix to the device tree in that series, although I wouldn't
> >> create a single patch to fix and add the SSC registers. First the size-cells = <0>
> >> fix patch and then the SSC patch.
> >> Do you agree?
> > 
> > By at the same time, I really just meant within 1 release.
> > 
> > But I'd like to hear TI maintainers' thoughts on this.
> 
> I did post a comment on patch #1 questioning the approach from TI clock 
> driver perspective, imho I can't see why these two patches would be 
> needed right now.

Because U-boot maintainers asked me after I sent them my patch on this issue. 
I believe that the email exchange that took place in the U-boot (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/)
and Linux kernel mailing lists showed that:
- The patch 'fdt: translate address if # size-cells = <0>' is wrong (U-boot has accepted 
  it, and it will have to be reverted).
- However, the same patch highlighted that it is wrong to use the size-cells = <0> property 
  in the prcm_clocks and scm_clocks nodes of device tree.
- Rob agrees that in the case of the am3xx this is the right choice:
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 1fb22088caeb..59b0a0cf211e 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -110,7 +110,8 @@
 
                                prcm_clocks: clocks {
                                        #address-cells = <1>;
-                                       #size-cells = <0>;
+                                       #size-cells = <1>;
+                                       ranges = <0 0 0x2000>;
                                };
 
                                prcm_clockdomains: clockdomains {
@@ -320,7 +321,8 @@
 
                                        scm_clocks: clocks {
                                                #address-cells = <1>;
-                                               #size-cells = <0>;
+                                               #size-cells = <1>;
+                                               ranges = <0 0 0x800>;
                                        };
                                };

--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -10,7 +10,7 @@
                compatible = "ti,mux-clock";
                clocks = <&virt_19200000_ck>, <&virt_24000000_ck>, <&virt_25000000_ck>, <&virt_26000000_ck>;
                ti,bit-shift = <22>;
-               reg = <0x0040>;
+               reg = <0x0040 0x4>;
        };
 
        adc_tsc_fck: adc_tsc_fck {
@@ -98,7 +98,7 @@
                compatible = "ti,gate-clock";
                clocks = <&l4ls_gclk>;
                ti,bit-shift = <0>;
-               reg = <0x0664>;
+               reg = <0x0664 0x04>;
        };
[...]

- U-boot rightly wants to use the same device tree as the Kernel.
- IMHO, if I'm not missing something, I think using a #size-cells = <1>; for clocks 
  it requires only one code change in the ti_clk_get_reg_addr():

--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -265,9 +265,27 @@ int __init ti_clk_retry_init(struct device_node *node, void *user,
 int ti_clk_get_reg_addr(struct device_node *node, int index,
                        struct clk_omap_reg *reg)

-       if (of_property_read_u32_index(node, "reg", index, &val)) {
+       if (of_property_read_u32_index(node, "reg", index * 2, &val)) {

   The other changes to develop affect device trees of architectures which, like am3, currently
   use #size-cells = <0>.

IMHO, all this would lead to an improvement of the device trees with minimal impact on the code. 
It would benefit U-boot, which would not have to develop special platform code and any new 
architectures that would inherit from these DTs.

If you think it might be worth it, I am available to develop this patch.

Thanks and regards,
Dario

> 
> -Tero
