Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46585F798A
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 18:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfKKRND (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 12:13:03 -0500
Received: from muru.com ([72.249.23.125]:41568 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfKKRNC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Nov 2019 12:13:02 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E69C58119;
        Mon, 11 Nov 2019 17:13:38 +0000 (UTC)
Date:   Mon, 11 Nov 2019 09:12:55 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: ti: dra7: fix parent for gmac_clkctrl
Message-ID: <20191111171255.GU5610@atomide.com>
References: <20191109142017.10851-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191109142017.10851-1-grygorii.strashko@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [191109 14:21]:
> The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
> of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
> Hence, fix it.
> 
> Fixes: commit dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Hmm is there a mux for the source though?

In that case using assigned-clocks and assigned-clock-parents in
addition to a related clk-7xx.c fix would be needed.

Regards,

Tony

> ---
>  drivers/clk/ti/clk-7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
> index 9dd6185a4b4e..66e4b2b9ec60 100644
> --- a/drivers/clk/ti/clk-7xx.c
> +++ b/drivers/clk/ti/clk-7xx.c
> @@ -405,7 +405,7 @@ static const struct omap_clkctrl_bit_data dra7_gmac_bit_data[] __initconst = {
>  };
>  
>  static const struct omap_clkctrl_reg_data dra7_gmac_clkctrl_regs[] __initconst = {
> -	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "dpll_gmac_ck" },
> +	{ DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, "gmac_main_clk" },
>  	{ 0 },
>  };
>  
> -- 
> 2.17.1
> 
