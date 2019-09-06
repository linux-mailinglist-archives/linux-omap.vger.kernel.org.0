Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE6AB352
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 09:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbfIFHjh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 03:39:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34420 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbfIFHjh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Sep 2019 03:39:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x867dRJB053866;
        Fri, 6 Sep 2019 02:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567755567;
        bh=z6Nh68YYvTDDh5HiSd5ce/6VHBCPMMXmMgbKOM1slds=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=iT3e59oWcC9/GWHtEvNJFERDlEd0VDsMZpqKav5auCLqqTQwYdbZs8EqQFLsI8XrU
         SXq+HElmMR2X3k2eAlJiw/9PISXTbdHV2qiKjDSy6p68s2Y/5sQfQBKhxd+rYVubVD
         tfqhQNMpcmlE5XUW7wOdQ6USYzAY9iKr+slbYk7g=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x867dRN6029677;
        Fri, 6 Sep 2019 02:39:27 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 6 Sep
 2019 02:39:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 6 Sep 2019 02:39:26 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x867dNc9078451;
        Fri, 6 Sep 2019 02:39:23 -0500
Subject: Re: [PATCH] bus: ti-sysc: Fix handling of invalid clocks
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190905215356.8168-1-tony@atomide.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <3c9f7340-f17f-cecd-3ae4-ec8a1af7c2bf@ti.com>
Date:   Fri, 6 Sep 2019 10:39:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905215356.8168-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/09/2019 00:53, Tony Lindgren wrote:
> We can currently get "Unable to handle kernel paging request at
> virtual address" for invalid clocks with dts node but no driver:
> 
> (__clk_get_hw) from [<c0138ebc>] (ti_sysc_find_one_clockdomain+0x18/0x34)
> (ti_sysc_find_one_clockdomain) from [<c0138f0c>] (ti_sysc_clkdm_init+0x34/0xdc)
> (ti_sysc_clkdm_init) from [<c0584660>] (sysc_probe+0xa50/0x10e8)
> (sysc_probe) from [<c065c6ac>] (platform_drv_probe+0x58/0xa8)
> 
> Let's add IS_ERR checks to ti_sysc_clkdm_init() as And let's start treating
> clk_get() with -ENOENT as a proper error. If the clock name is specified
> in device tree we must succeed with clk_get() to continue. For modules with
> no clock names specified in device tree we will just ignore the clocks.
> 
> Fixes: 2b2f7def058a ("bus: ti-sysc: Add support for missing clockdomain handling")
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>   arch/arm/mach-omap2/pdata-quirks.c | 4 ++--
>   drivers/bus/ti-sysc.c              | 5 +----
>   2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
> --- a/arch/arm/mach-omap2/pdata-quirks.c
> +++ b/arch/arm/mach-omap2/pdata-quirks.c
> @@ -491,11 +491,11 @@ static int ti_sysc_clkdm_init(struct device *dev,
>   			      struct clk *fck, struct clk *ick,
>   			      struct ti_sysc_cookie *cookie)
>   {
> -	if (fck)
> +	if (!IS_ERR(fck))
>   		cookie->clkdm = ti_sysc_find_one_clockdomain(fck);
>   	if (cookie->clkdm)
>   		return 0;
> -	if (ick)
> +	if (!IS_ERR(ick))
>   		cookie->clkdm = ti_sysc_find_one_clockdomain(ick);
>   	if (cookie->clkdm)
>   		return 0;
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -280,9 +280,6 @@ static int sysc_get_one_clock(struct sysc *ddata, const char *name)
>   
>   	ddata->clocks[index] = devm_clk_get(ddata->dev, name);
>   	if (IS_ERR(ddata->clocks[index])) {
> -		if (PTR_ERR(ddata->clocks[index]) == -ENOENT)
> -			return 0;
> -
>   		dev_err(ddata->dev, "clock get error for %s: %li\n",
>   			name, PTR_ERR(ddata->clocks[index]));
>   
> @@ -357,7 +354,7 @@ static int sysc_get_clocks(struct sysc *ddata)
>   			continue;
>   
>   		error = sysc_get_one_clock(ddata, name);
> -		if (error && error != -ENOENT)
> +		if (error)
>   			return error;
>   	}
>   
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
