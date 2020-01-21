Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF771437AE
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 08:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbgAUHeI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 02:34:08 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56108 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUHeI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 02:34:08 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L7Y5Ls021924;
        Tue, 21 Jan 2020 01:34:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579592045;
        bh=/8wPkVg64Sb6ToRgyES8+yOo10uiXr+Dpe7wHqu2iU4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aQB9YH3t70lnrVELntTJR1P5X77Mw7RJUcgFPkk91+OUVyOFTCvI9HfR37JZ2g8xB
         g0AunY3DsIeObMfjZo8WSQmo+T036yrC/abqBo7j4vQzB4AmdS9SPMq8EotOVwm/6M
         z2Twk3pHmEixSep+tRwfhe2MFDiAYFseqZoNAAs8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00L7Y4nu090858
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jan 2020 01:34:05 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 01:34:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 01:34:03 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7Y1Og057892;
        Tue, 21 Jan 2020 01:34:01 -0600
Subject: Re: [PATCH v2] clk: ti: dra7: fix parent for gmac_clkctrl
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20191221110004.9951-1-grygorii.strashko@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <df59b0b4-abc0-bab1-78d4-35518c295e06@ti.com>
Date:   Tue, 21 Jan 2020 09:34:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191221110004.9951-1-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/12/2019 13:00, Grygorii Strashko wrote:
> The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
> of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
> Hence, fix it.
> 
> Fixes: dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Queued up for 5.6, thanks.

-Tero

> ---
>   drivers/clk/ti/clk-7xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
> index 9dd6185a4b4e..66e4b2b9ec60 100644
> --- a/drivers/clk/ti/clk-7xx.c
> +++ b/drivers/clk/ti/clk-7xx.c
> @@ -405,7 +405,7 @@ static const struct omap_clkctrl_bit_data dra7_gmac_bit_data[] __initconst = {
>   };
>   
>   static const struct omap_clkctrl_reg_data dra7_gmac_clkctrl_regs[] __initconst = {
> -	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "dpll_gmac_ck" },
> +	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "gmac_main_clk" },
>   	{ 0 },
>   };
>   
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
