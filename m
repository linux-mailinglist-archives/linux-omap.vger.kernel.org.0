Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE81133D365
	for <lists+linux-omap@lfdr.de>; Tue, 16 Mar 2021 12:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237510AbhCPLyK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Mar 2021 07:54:10 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49074 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237516AbhCPLyE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Mar 2021 07:54:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GBrtgX055676;
        Tue, 16 Mar 2021 06:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1615895635;
        bh=USX3FDz56GaGSSm4tzz/GjVz+nEqEAlrZ8vs1PQB29w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Wf5wKHaQWwcAg56IuTi2s8OotsmmWJNmvWwpzria4CQnQdlgkMLk92SHyXBmnu23z
         +QL32cfybvmc7XKBA8jHmpLirM/Ka2AKVSnhiNhWdo029ZGH37bnF3mY00KrEgM3Dk
         PwJ46+tsac63rft2XUxoBueBoaNZh8C2/HV88GqU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GBrtFa089184
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 16 Mar 2021 06:53:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 16
 Mar 2021 06:53:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 16 Mar 2021 06:53:55 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GBroXt017544;
        Tue, 16 Mar 2021 06:53:51 -0500
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
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <6dc0d2c6-570a-3fbf-77e1-6731a6c8d558@ti.com>
Date:   Tue, 16 Mar 2021 13:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210314151233.23243-5-dariobin@libero.it>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 14/03/2021 17:12, Dario Binacchi wrote:
> The patch enables spread spectrum clocking (SSC) for MPU and LCD PLLs.
> As reported by the TI spruh73x RM, SSC is only supported for the
> DISP/LCD and MPU PLLs on am33xx device. SSC is not supported for DDR,
> PER, and CORE PLLs.
> 
> Calculating the required values and setting the registers accordingly
> was taken from the set_mpu_spreadspectrum routine contained in the
> arch/arm/mach-omap2/am33xx/clock_am33xx.c file of the u-boot project.
> 
> In locked condition, DPLL output clock = CLKINP *[M/N]. In case of
> SSC enabled, the AM335x reference manual explains that there is a
> restriction of range of M values. Since the omap2_dpll_round_rate
> routine attempts to select the minimum possible N, the value of M
> obtained is not guaranteed to be within the range required. With the new
> "ti,min-div" parameter it is possible to increase N and consequently M
> to satisfy the constraint imposed by SSC.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
> ---
> 
>   arch/arm/boot/dts/am33xx-clocks.dtsi |  4 +-
>   drivers/clk/ti/dpll.c                | 41 ++++++++++++++
>   drivers/clk/ti/dpll3xxx.c            | 85 ++++++++++++++++++++++++++++
>   include/linux/clk/ti.h               | 24 ++++++++
>   4 files changed, 152 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
> index e7bbbf536a8c..a02e0b1229a4 100644
> --- a/arch/arm/boot/dts/am33xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
> @@ -164,7 +164,7 @@
>   		#clock-cells = <0>;
>   		compatible = "ti,am3-dpll-core-clock";
>   		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
> -		reg = <0x0490>, <0x045c>, <0x0468>, <0x0460>, <0x0464>;
> +		reg = <0x0490>, <0x045c>, <0x0468>;
>   	};
>   
>   	dpll_core_x2_ck: dpll_core_x2_ck {
> @@ -204,7 +204,7 @@
>   		#clock-cells = <0>;
>   		compatible = "ti,am3-dpll-clock";
>   		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
> -		reg = <0x0488>, <0x0420>, <0x042c>;
> +		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
>   	};

You can't mix DT vs code.

>   
>   	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
> diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
> index d6f1ac5b53e1..2738417a47b7 100644
> --- a/drivers/clk/ti/dpll.c
> +++ b/drivers/clk/ti/dpll.c
> @@ -290,7 +290,9 @@ static void __init of_ti_dpll_setup(struct device_node *node,
>   	struct clk_init_data *init = NULL;
>   	const char **parent_names = NULL;
>   	struct dpll_data *dd = NULL;
> +	int ssc_clk_index;
>   	u8 dpll_mode = 0;
> +	u32 min_div;
>   
>   	dd = kmemdup(ddt, sizeof(*dd), GFP_KERNEL);
>   	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
> @@ -345,6 +347,27 @@ static void __init of_ti_dpll_setup(struct device_node *node,
>   	if (dd->autoidle_mask) {
>   		if (ti_clk_get_reg_addr(node, 3, &dd->autoidle_reg))
>   			goto cleanup;
> +
> +		ssc_clk_index = 4;
> +	} else {
> +		ssc_clk_index = 3;
> +	}
> +
> +	if (dd->ssc_deltam_int_mask && dd->ssc_deltam_frac_mask &&
> +	    dd->ssc_modfreq_mant_mask && dd->ssc_modfreq_exp_mask) {
> +		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
> +					&dd->ssc_deltam_reg))
> +			goto cleanup;
> +
> +		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
> +					&dd->ssc_modfreq_reg))
> +			goto cleanup;
> +
> +		of_property_read_u32(node, "ti,ssc-modfreq", &dd->ssc_modfreq);
> +		of_property_read_u32(node, "ti,ssc-deltam", &dd->ssc_deltam);
> +		if (of_property_read_bool(node, "ti,ssc-downspread"))
> +			dd->ssc_downspread = 1;

New bindings.

> +
>   	}
>   
>   	if (of_property_read_bool(node, "ti,low-power-stop"))
> @@ -356,6 +379,10 @@ static void __init of_ti_dpll_setup(struct device_node *node,
>   	if (of_property_read_bool(node, "ti,lock"))
>   		dpll_mode |= 1 << DPLL_LOCKED;
>   
> +	if (!of_property_read_u32(node, "ti,min-div", &min_div) &&
> +	    min_div > dd->min_divider)
> +		dd->min_divider = min_div;
> +

New bindings.

[...]

-- 
Best regards,
grygorii
