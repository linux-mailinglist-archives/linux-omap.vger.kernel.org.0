Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADAD340051
	for <lists+linux-omap@lfdr.de>; Thu, 18 Mar 2021 08:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhCRHjE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Mar 2021 03:39:04 -0400
Received: from smtp-33-i2.italiaonline.it ([213.209.12.33]:55051 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229600AbhCRHi4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Mar 2021 03:38:56 -0400
Received: from oxapps-17-098.iol.local ([10.101.8.108])
        by smtp-33.iol.local with ESMTPA
        id MnF8lFBb6R8VAMnF8lNXaq; Thu, 18 Mar 2021 08:38:54 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1616053134; bh=UmWZibCkZXTHJgwmZDv3hJCRtDBRvCXUKmKgxOB37/E=;
        h=From;
        b=y0qYDGYULbWM7DwuKnl0EUny6mDQ7IOwDsKAJjjdZ7Zn4cjYynPnnwKV28yQ553mO
         P774JA4bXetT8FswKoP0Dle/dDtjX/9nzlypyXtUOVH9q/EZj+vIXsSaPyamheZOBK
         N3eWBcXe18+juba6SF1HBxX2NSkDWW5DkhUUZ/c1vtp8fxbG5s673wL2yamNIclbrf
         p5Ws2TZCOqQNYCM7stQ+FOtqDR4CxJJJspZx82ZNB1pBs8LywvDY5PhtFLiE0wrv38
         qU5i3VgVMRyp4dOp6EYC+M7HP7bfgfk8CvWqU24MExJfRlMz5ChOdclFH9V8BSDK/u
         5yCns0AGix6hg==
X-CNFS-Analysis: v=2.4 cv=OapdsjfY c=1 sm=1 tr=0 ts=6053038e cx=a_exe
 a=NIaCDMyvpSx5HZmal66lBw==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=sozttTNsAAAA:8 a=e1VBGZ4yoO3jfIRmQH0A:9 a=QEXdDO2ut3YA:10
 a=FYBFfbkh9HQ-bD74xMz0:22 a=aeg5Gbbo78KNqacMgKqU:22
Date:   Thu, 18 Mar 2021 08:38:53 +0100 (CET)
From:   Dario Binacchi <dariobin@libero.it>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-kernel@vger.kernel.org, "Vutla, Lokesh" <lokeshvutla@ti.com>,
        "Menon, Nishanth" <nm@ti.com>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Message-ID: <2069482516.552063.1616053134087@mail1.libero.it>
In-Reply-To: <6dc0d2c6-570a-3fbf-77e1-6731a6c8d558@ti.com>
References: <20210314151233.23243-1-dariobin@libero.it>
 <20210314151233.23243-5-dariobin@libero.it>
 <6dc0d2c6-570a-3fbf-77e1-6731a6c8d558@ti.com>
Subject: Re: [PATCH 4/4] clk: ti: add am33xx spread spectrum clock support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev27
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: V9BCza01eXjhlOGmMwcPmz48CscjONcn
x-libjamv: P64oCIh3Pcc=
X-CMAE-Envelope: MS4xfKeTUvUL2ykB0ir2RKaYwNgGaD68vavXR+zoqs1MQ0+mscfvpGxvgIjeKLFnHa+P05DQSlOqI6DZdr3tL4g7mGuS8fMsjGSCwHBKQ9TpP2Ft9PyI9sD3
 5+peIeVj5Zc92eNup0rDybr/wA2HrVX+OqTB60KAhlMMhVk8aqvrHQqd1ziOTDuZWuBpkwh3o8aVWUUDDc2mZMG16rJVxlkeKq3GUACiRrKsD4SthDhBdYs2
 kN9selwKi6d3FjhiPOyVC0Z29TtBfozPmy+nENnz87QzPBg+FYPPd/ZvjD6J4x1I+zwz5R0VfblTsFeB0GX4pZzv4dzdu4LYyU0r8wIIt7Oc5YLVAhZUJUvR
 nI5v2wzJQpEgIcjlyiglHAzyTY4afBnY+7uVgzbN3MF4CE1mYWv/zFEcJJErS6WOv9mkb/CgJa3coe9Nixt0HZHHQDoBBcL7wPtynEahrqce+gHSCINc4Ex5
 hvkPRSwwvsyMGl9E+xsNMy9hs6rE6hWnLyftslQkP+b8VR1Ai4nxltUCxk42MyyqHJek5qff1NgfKIcY1B4jFN0iedO4BRhoUXHiYXSZxk4D5EH1mHgBSwlk
 PKWKoDygc0UXiCYEpMsUlbrPID59ULlFuihW2yfYFsx5rg==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Grygorii,

> Il 16/03/2021 12:52 Grygorii Strashko <grygorii.strashko@ti.com> ha scritto:
> 
>  
> On 14/03/2021 17:12, Dario Binacchi wrote:
> > The patch enables spread spectrum clocking (SSC) for MPU and LCD PLLs.
> > As reported by the TI spruh73x RM, SSC is only supported for the
> > DISP/LCD and MPU PLLs on am33xx device. SSC is not supported for DDR,
> > PER, and CORE PLLs.
> > 
> > Calculating the required values and setting the registers accordingly
> > was taken from the set_mpu_spreadspectrum routine contained in the
> > arch/arm/mach-omap2/am33xx/clock_am33xx.c file of the u-boot project.
> > 
> > In locked condition, DPLL output clock = CLKINP *[M/N]. In case of
> > SSC enabled, the AM335x reference manual explains that there is a
> > restriction of range of M values. Since the omap2_dpll_round_rate
> > routine attempts to select the minimum possible N, the value of M
> > obtained is not guaranteed to be within the range required. With the new
> > "ti,min-div" parameter it is possible to increase N and consequently M
> > to satisfy the constraint imposed by SSC.
> > 
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > 
> > ---
> > 
> >   arch/arm/boot/dts/am33xx-clocks.dtsi |  4 +-
> >   drivers/clk/ti/dpll.c                | 41 ++++++++++++++
> >   drivers/clk/ti/dpll3xxx.c            | 85 ++++++++++++++++++++++++++++
> >   include/linux/clk/ti.h               | 24 ++++++++
> >   4 files changed, 152 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
> > index e7bbbf536a8c..a02e0b1229a4 100644
> > --- a/arch/arm/boot/dts/am33xx-clocks.dtsi
> > +++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
> > @@ -164,7 +164,7 @@
> >   		#clock-cells = <0>;
> >   		compatible = "ti,am3-dpll-core-clock";
> >   		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
> > -		reg = <0x0490>, <0x045c>, <0x0468>, <0x0460>, <0x0464>;
> > +		reg = <0x0490>, <0x045c>, <0x0468>;
> >   	};
> >   
> >   	dpll_core_x2_ck: dpll_core_x2_ck {
> > @@ -204,7 +204,7 @@
> >   		#clock-cells = <0>;
> >   		compatible = "ti,am3-dpll-clock";
> >   		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
> > -		reg = <0x0488>, <0x0420>, <0x042c>;
> > +		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
> >   	};
> 
> You can't mix DT vs code.

Right, I forgot to remove it during a rebase of the series.

> 
> >   
> >   	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
> > diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
> > index d6f1ac5b53e1..2738417a47b7 100644
> > --- a/drivers/clk/ti/dpll.c
> > +++ b/drivers/clk/ti/dpll.c
> > @@ -290,7 +290,9 @@ static void __init of_ti_dpll_setup(struct device_node *node,
> >   	struct clk_init_data *init = NULL;
> >   	const char **parent_names = NULL;
> >   	struct dpll_data *dd = NULL;
> > +	int ssc_clk_index;
> >   	u8 dpll_mode = 0;
> > +	u32 min_div;
> >   
> >   	dd = kmemdup(ddt, sizeof(*dd), GFP_KERNEL);
> >   	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
> > @@ -345,6 +347,27 @@ static void __init of_ti_dpll_setup(struct device_node *node,
> >   	if (dd->autoidle_mask) {
> >   		if (ti_clk_get_reg_addr(node, 3, &dd->autoidle_reg))
> >   			goto cleanup;
> > +
> > +		ssc_clk_index = 4;
> > +	} else {
> > +		ssc_clk_index = 3;
> > +	}
> > +
> > +	if (dd->ssc_deltam_int_mask && dd->ssc_deltam_frac_mask &&
> > +	    dd->ssc_modfreq_mant_mask && dd->ssc_modfreq_exp_mask) {
> > +		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
> > +					&dd->ssc_deltam_reg))
> > +			goto cleanup;
> > +
> > +		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
> > +					&dd->ssc_modfreq_reg))
> > +			goto cleanup;
> > +
> > +		of_property_read_u32(node, "ti,ssc-modfreq", &dd->ssc_modfreq);
> > +		of_property_read_u32(node, "ti,ssc-deltam", &dd->ssc_deltam);
> > +		if (of_property_read_bool(node, "ti,ssc-downspread"))
> > +			dd->ssc_downspread = 1;
> 
> New bindings.

I added the bindings documentation in another patch of the series.

Thanks and regards,
Dario
> 
> > +
> >   	}
> >   
> >   	if (of_property_read_bool(node, "ti,low-power-stop"))
> > @@ -356,6 +379,10 @@ static void __init of_ti_dpll_setup(struct device_node *node,
> >   	if (of_property_read_bool(node, "ti,lock"))
> >   		dpll_mode |= 1 << DPLL_LOCKED;
> >   
> > +	if (!of_property_read_u32(node, "ti,min-div", &min_div) &&
> > +	    min_div > dd->min_divider)
> > +		dd->min_divider = min_div;
> > +
> 
> New bindings.
> 
> [...]
> 
> -- 
> Best regards,
> grygorii
