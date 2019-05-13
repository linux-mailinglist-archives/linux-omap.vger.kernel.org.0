Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6355A1B1AD
	for <lists+linux-omap@lfdr.de>; Mon, 13 May 2019 10:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbfEMIEo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 May 2019 04:04:44 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7631 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725928AbfEMIEo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 May 2019 04:04:44 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4BF61DA8C2D313CFD939;
        Mon, 13 May 2019 16:04:42 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 13 May 2019
 16:04:37 +0800
Subject: Re: [PATCH] clk: ti: Remove unused function
 ti_clk_build_component_gate
To:     Tero Kristo <t-kristo@ti.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>
References: <20190512100328.27136-1-yuehaibing@huawei.com>
 <5315442d-fd29-1fbe-694d-07627cc43c25@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
From:   YueHaibing <yuehaibing@huawei.com>
Message-ID: <4fcb162f-527c-6259-1515-96d9bbda65e0@huawei.com>
Date:   Mon, 13 May 2019 16:04:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5315442d-fd29-1fbe-694d-07627cc43c25@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2019/5/13 15:22, Tero Kristo wrote:
> On 12/05/2019 13:03, YueHaibing wrote:
>> There is no callers in tree, so can be removed.
> 
> Looks ok to me, basically legacy code that we forgot to remove while doing:
> 
> commit 7558562a70fbd6b3fa746fa33c76c9333aa0bb32
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Thu Dec 14 08:32:06 2017 -0800
> 
>     clk: ti: Drop legacy clk-3xxx-legacy code
> 
> Could drop the same code for mux/div also though.

Yes, I can send v2 also to remove this two, thanks!

> 
> -Tero
> 
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>   drivers/clk/ti/gate.c | 30 ------------------------------
>>   1 file changed, 30 deletions(-)
>>
>> diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
>> index 504c0e9..4238955 100644
>> --- a/drivers/clk/ti/gate.c
>> +++ b/drivers/clk/ti/gate.c
>> @@ -131,36 +131,6 @@ static struct clk *_register_gate(struct device *dev, const char *name,
>>       return clk;
>>   }
>>   -struct clk_hw *ti_clk_build_component_gate(struct ti_clk_gate *setup)
>> -{
>> -    struct clk_hw_omap *gate;
>> -    struct clk_omap_reg *reg;
>> -    const struct clk_hw_omap_ops *ops = &clkhwops_wait;
>> -
>> -    if (!setup)
>> -        return NULL;
>> -
>> -    gate = kzalloc(sizeof(*gate), GFP_KERNEL);
>> -    if (!gate)
>> -        return ERR_PTR(-ENOMEM);
>> -
>> -    reg = (struct clk_omap_reg *)&gate->enable_reg;
>> -    reg->index = setup->module;
>> -    reg->offset = setup->reg;
>> -
>> -    gate->enable_bit = setup->bit_shift;
>> -
>> -    if (setup->flags & CLKF_NO_WAIT)
>> -        ops = NULL;
>> -
>> -    if (setup->flags & CLKF_INTERFACE)
>> -        ops = &clkhwops_iclk_wait;
>> -
>> -    gate->ops = ops;
>> -
>> -    return &gate->hw;
>> -}
>> -
>>   static void __init _of_ti_gate_clk_setup(struct device_node *node,
>>                        const struct clk_ops *ops,
>>                        const struct clk_hw_omap_ops *hw_ops)
>>
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> .
> 

