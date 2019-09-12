Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487BEB09A1
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 09:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729922AbfILHmm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 03:42:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51648 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfILHmm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 03:42:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8C7gahj058257;
        Thu, 12 Sep 2019 02:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568274156;
        bh=vuPZwr+KXdj3F2GM0Pe1AeC9re/y0vMeBWRqmVoG2Nk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kGe0NaBJZyjdZtbr8CrCDxIbEWYH+KF2hSPzEkfdrwPpKOvkv/zl7mLFF66nYeUfS
         L7/ufK9qPjnJlK2sWmEpxTB5CNkp2c3CuLAw3MBmck4m3vDJbUiurv428Bsl7y9lbw
         EEo1BkIkp1lBXT4uNGFbg9cwIzmpejgqE4Km4izA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8C7gaaQ103555
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 02:42:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 02:42:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 02:42:36 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8C7gYRU036501;
        Thu, 12 Sep 2019 02:42:34 -0500
Subject: Re: [PATCH 2/2] clk: ti: clk-33xx.c: Update GPIO number as per
 datasheet
To:     Ankur Tyagi <ankur.tyagi@gallagher.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ondrej.pohl@gallagher.com>
References: <20190912015104.10737-1-ankur.tyagi@gallagher.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <b2a40288-ca74-3381-13c6-56c5da262a89@ti.com>
Date:   Thu, 12 Sep 2019 10:42:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912015104.10737-1-ankur.tyagi@gallagher.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/09/2019 04:51, Ankur Tyagi wrote:
> Sitara technical reference manual numbers GPIO from 0-3 whereas
> in code GPIO are numbered from 1-4.
> 
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>

Same comments as for patch #1, causing compile breakage + bisect issues.

Also, next time when posting, can you send patches as a proper series so 
individual patches get sorted in the recipient mailboxes automatically? 
Otherwise it is easy to lose patches if they are not grouped properly. 
git send-email tool does this for you automatically for example.

-Tero

> ---
>   drivers/clk/ti/clk-33xx.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
> index a360d3109555..d67f1f6bbec0 100644
> --- a/drivers/clk/ti/clk-33xx.c
> +++ b/drivers/clk/ti/clk-33xx.c
> @@ -28,17 +28,17 @@ static const char * const am3_gpio1_dbclk_parents[] __initconst = {
>   	NULL,
>   };
>   
> -static const struct omap_clkctrl_bit_data am3_gpio2_bit_data[] __initconst = {
> +static const struct omap_clkctrl_bit_data am3_gpio1_bit_data[] __initconst = {
>   	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
>   	{ 0 },
>   };
>   
> -static const struct omap_clkctrl_bit_data am3_gpio3_bit_data[] __initconst = {
> +static const struct omap_clkctrl_bit_data am3_gpio2_bit_data[] __initconst = {
>   	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
>   	{ 0 },
>   };
>   
> -static const struct omap_clkctrl_bit_data am3_gpio4_bit_data[] __initconst = {
> +static const struct omap_clkctrl_bit_data am3_gpio3_bit_data[] __initconst = {
>   	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
>   	{ 0 },
>   };
> @@ -61,9 +61,9 @@ static const struct omap_clkctrl_reg_data am3_l4ls_clkctrl_regs[] __initconst =
>   	{ AM3_L4LS_TIMER3_CLKCTRL, NULL, CLKF_SW_SUP, "timer3_fck" },
>   	{ AM3_L4LS_TIMER4_CLKCTRL, NULL, CLKF_SW_SUP, "timer4_fck" },
>   	{ AM3_L4LS_RNG_CLKCTRL, NULL, CLKF_SW_SUP, "rng_fck" },
> +	{ AM3_L4LS_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
>   	{ AM3_L4LS_GPIO2_CLKCTRL, am3_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
>   	{ AM3_L4LS_GPIO3_CLKCTRL, am3_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
> -	{ AM3_L4LS_GPIO4_CLKCTRL, am3_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
>   	{ AM3_L4LS_D_CAN0_CLKCTRL, NULL, CLKF_SW_SUP, "dcan0_fck" },
>   	{ AM3_L4LS_D_CAN1_CLKCTRL, NULL, CLKF_SW_SUP, "dcan1_fck" },
>   	{ AM3_L4LS_EPWMSS1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
> @@ -131,14 +131,14 @@ static const char * const am3_gpio0_dbclk_parents[] __initconst = {
>   	NULL,
>   };
>   
> -static const struct omap_clkctrl_bit_data am3_gpio1_bit_data[] __initconst = {
> +static const struct omap_clkctrl_bit_data am3_gpio0_bit_data[] __initconst = {
>   	{ 18, TI_CLK_GATE, am3_gpio0_dbclk_parents, NULL },
>   	{ 0 },
>   };
>   
>   static const struct omap_clkctrl_reg_data am3_l4_wkup_clkctrl_regs[] __initconst = {
>   	{ AM3_L4_WKUP_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
> -	{ AM3_L4_WKUP_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
> +	{ AM3_L4_WKUP_GPIO0_CLKCTRL, am3_gpio0_bit_data, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
>   	{ AM3_L4_WKUP_L4_WKUP_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
>   	{ AM3_L4_WKUP_UART1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
>   	{ AM3_L4_WKUP_I2C1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
