Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC541B113
	for <lists+linux-omap@lfdr.de>; Mon, 13 May 2019 09:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbfEMHXN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 May 2019 03:23:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47992 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727568AbfEMHXM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 May 2019 03:23:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4D7N2gn050263;
        Mon, 13 May 2019 02:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557732183;
        bh=TFmyXWtIKo5SlABzx3xj66YrZaNuiNEc+e/r3gV7HIQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fyVsUIKWjQAok8Jwgteg99Wm6b39pcOjHWHBcnbDU0WIVFmcoT5bbLsxKPUi5NrQi
         LlpvKHvVHp0pozi5eMb2pMyEloNZ7Yu2gM5i0bHHld7aOEBF3+1BDjBgrtySNriVGr
         7nF/mcFwdHaEJ66R6bfzltFnrZ0woQj76zt+UBZQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4D7N2PF043042
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 May 2019 02:23:02 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 13
 May 2019 02:23:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 13 May 2019 02:23:01 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4D7MwCF018030;
        Mon, 13 May 2019 02:22:59 -0500
Subject: Re: [PATCH] clk: ti: Remove unused function
 ti_clk_build_component_gate
To:     YueHaibing <yuehaibing@huawei.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20190512100328.27136-1-yuehaibing@huawei.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <5315442d-fd29-1fbe-694d-07627cc43c25@ti.com>
Date:   Mon, 13 May 2019 10:22:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190512100328.27136-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/05/2019 13:03, YueHaibing wrote:
> There is no callers in tree, so can be removed.

Looks ok to me, basically legacy code that we forgot to remove while doing:

commit 7558562a70fbd6b3fa746fa33c76c9333aa0bb32
Author: Tony Lindgren <tony@atomide.com>
Date:   Thu Dec 14 08:32:06 2017 -0800

     clk: ti: Drop legacy clk-3xxx-legacy code

Could drop the same code for mux/div also though.

-Tero

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/clk/ti/gate.c | 30 ------------------------------
>   1 file changed, 30 deletions(-)
> 
> diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
> index 504c0e9..4238955 100644
> --- a/drivers/clk/ti/gate.c
> +++ b/drivers/clk/ti/gate.c
> @@ -131,36 +131,6 @@ static struct clk *_register_gate(struct device *dev, const char *name,
>   	return clk;
>   }
>   
> -struct clk_hw *ti_clk_build_component_gate(struct ti_clk_gate *setup)
> -{
> -	struct clk_hw_omap *gate;
> -	struct clk_omap_reg *reg;
> -	const struct clk_hw_omap_ops *ops = &clkhwops_wait;
> -
> -	if (!setup)
> -		return NULL;
> -
> -	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
> -	if (!gate)
> -		return ERR_PTR(-ENOMEM);
> -
> -	reg = (struct clk_omap_reg *)&gate->enable_reg;
> -	reg->index = setup->module;
> -	reg->offset = setup->reg;
> -
> -	gate->enable_bit = setup->bit_shift;
> -
> -	if (setup->flags & CLKF_NO_WAIT)
> -		ops = NULL;
> -
> -	if (setup->flags & CLKF_INTERFACE)
> -		ops = &clkhwops_iclk_wait;
> -
> -	gate->ops = ops;
> -
> -	return &gate->hw;
> -}
> -
>   static void __init _of_ti_gate_clk_setup(struct device_node *node,
>   					 const struct clk_ops *ops,
>   					 const struct clk_hw_omap_ops *hw_ops)
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
