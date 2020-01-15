Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8E513BB8D
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 09:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgAOIzu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 03:55:50 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50818 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAOIzu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jan 2020 03:55:50 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00F8tYgN109707;
        Wed, 15 Jan 2020 02:55:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579078534;
        bh=oAu0uGBid0yAygrmck+chOzn+hR2qgaPhFP4hnfF6y0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JdwsMlUgQc+02EYqcXhsgBUxb/lPU4/R/57/+8anFdr7jNJkXMtnPJ+T+f0fOtq0P
         00JObIx8tI3ATqe/aEg44p8NC0xHftviQzTQFxgJOvQZaKwGIE4iyek23/n4voS1fi
         qDut4H+HwANsouH8abbEnn07Jb76+pJTokM9KOHg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00F8tYwU080197
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 02:55:34 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 02:55:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 02:55:33 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00F8tUZS023564;
        Wed, 15 Jan 2020 02:55:31 -0600
Subject: Re: [PATCH] clk: ti: omap5: Add missing AESS clock
To:     Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Matthijs van Duin <matthijsvanduin@gmail.com>
References: <20200114150607.18092-1-tony@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <23f9723b-cb9e-8737-92c5-4c20bed55cf5@ti.com>
Date:   Wed, 15 Jan 2020 10:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200114150607.18092-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 14/01/2020 17.06, Tony Lindgren wrote:
> Looks like we're missing AESS clock for omap5. This is similar to what
> omap4 has.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Matthijs van Duin <matthijsvanduin@gmail.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/clk/ti/clk-54xx.c         | 15 +++++++++++++++
>  include/dt-bindings/clock/omap5.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
> --- a/drivers/clk/ti/clk-54xx.c
> +++ b/drivers/clk/ti/clk-54xx.c
> @@ -35,6 +35,20 @@ static const struct omap_clkctrl_reg_data omap5_dsp_clkctrl_regs[] __initconst =
>  	{ 0 },
>  };
>  
> +static const char * const omap5_aess_fclk_parents[] __initconst = {
> +	"abe_clk",
> +	NULL,
> +};
> +
> +static const struct omap_clkctrl_div_data omap5_aess_fclk_data __initconst = {
> +	.max_div = 2,
> +};
> +
> +static const struct omap_clkctrl_bit_data omap5_aess_bit_data[] __initconst = {
> +	{ 24, TI_CLK_DIVIDER, omap5_aess_fclk_parents, &omap5_aess_fclk_data },
> +	{ 0 },
> +};
> +
>  static const char * const omap5_dmic_gfclk_parents[] __initconst = {
>  	"abe_cm:clk:0018:26",
>  	"pad_clks_ck",
> @@ -122,6 +136,7 @@ static const struct omap_clkctrl_bit_data omap5_timer8_bit_data[] __initconst =
>  
>  static const struct omap_clkctrl_reg_data omap5_abe_clkctrl_regs[] __initconst = {
>  	{ OMAP5_L4_ABE_CLKCTRL, NULL, 0, "abe_iclk" },
> +	{ OMAP5_AESS_CLKCTRL, omap5_aess_bit_data, CLKF_SW_SUP, "abe_cm:clk:0008:24" },
>  	{ OMAP5_MCPDM_CLKCTRL, NULL, CLKF_SW_SUP, "pad_clks_ck" },
>  	{ OMAP5_DMIC_CLKCTRL, omap5_dmic_bit_data, CLKF_SW_SUP, "abe_cm:clk:0018:24" },
>  	{ OMAP5_MCBSP1_CLKCTRL, omap5_mcbsp1_bit_data, CLKF_SW_SUP, "abe_cm:clk:0028:24" },
> diff --git a/include/dt-bindings/clock/omap5.h b/include/dt-bindings/clock/omap5.h
> --- a/include/dt-bindings/clock/omap5.h
> +++ b/include/dt-bindings/clock/omap5.h
> @@ -16,6 +16,7 @@
>  
>  /* abe clocks */
>  #define OMAP5_L4_ABE_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
> +#define OMAP5_AESS_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
>  #define OMAP5_MCPDM_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x30)
>  #define OMAP5_DMIC_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x38)
>  #define OMAP5_MCBSP1_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x48)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
