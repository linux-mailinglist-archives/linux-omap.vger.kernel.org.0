Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4D4329EC
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2019 09:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfFCHot (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jun 2019 03:44:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52136 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCHot (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jun 2019 03:44:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x537iiVJ049374;
        Mon, 3 Jun 2019 02:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559547884;
        bh=TXG8J+PUkGcvPfKML+X+9SkZHkdS+nNvxMr5mF0IbZc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pfL8oRuDBHuh47grxYuprlPTIq8guAhLDB4ClOOu4OtuClg8JrS3Xg4TFG4iOn39U
         YiWBVGtFcj5prRGl1gpYtKvxMhWe+47lWpgoyEqC2Ev/cg2glqaHDyvRL19m662vyv
         qrR8BkidRHb9igc+6nFA4krAwR3zZcnWrZN3zHCg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x537ii4m044046
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 3 Jun 2019 02:44:44 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 3 Jun
 2019 02:44:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 3 Jun 2019 02:44:42 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x537ieef006709;
        Mon, 3 Jun 2019 02:44:40 -0500
Subject: Re: [PATCH] clk: ti: clkctrl: Fix returning uninitialized data
To:     Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20190530065557.42741-1-tony@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <8f77a28b-4496-fbfe-f4e2-4cc8043f27d8@ti.com>
Date:   Mon, 3 Jun 2019 10:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530065557.42741-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 30/05/2019 9.55, Tony Lindgren wrote:
> If we do a clk_get() for a clock that does not exists, we have
> _ti_omap4_clkctrl_xlate() return uninitialized data if no match
> is found. This can be seen in some cases with SLAB_DEBUG enabled:
> 
> Unable to handle kernel paging request at virtual address 5a5a5a5a
> ...
> clk_hw_create_clk.part.33
> sysc_notifier_call
> notifier_call_chain
> blocking_notifier_call_chain
> device_add
> 
> Let's fix this by setting a found flag only when we find a match.

Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/clk/ti/clkctrl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -229,6 +229,7 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
>  {
>  	struct omap_clkctrl_provider *provider = data;
>  	struct omap_clkctrl_clk *entry;
> +	bool found = false;
>  
>  	if (clkspec->args_count != 2)
>  		return ERR_PTR(-EINVAL);
> @@ -238,11 +239,13 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
>  
>  	list_for_each_entry(entry, &provider->clocks, node) {
>  		if (entry->reg_offset == clkspec->args[0] &&
> -		    entry->bit_offset == clkspec->args[1])
> +		    entry->bit_offset == clkspec->args[1]) {
> +			found = true;
>  			break;
> +		}
>  	}
>  
> -	if (!entry)
> +	if (!found)
>  		return ERR_PTR(-EINVAL);
>  
>  	return entry->clk;
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
