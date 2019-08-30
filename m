Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA666A3052
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 09:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfH3HEP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 03:04:15 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55538 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfH3HEP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 03:04:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7U73gmm042113;
        Fri, 30 Aug 2019 02:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567148622;
        bh=TvjLDefDv40s29fEzH3g7fQslYok3FADT3UXIgYvbVU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yhw24j2hc2Ms0XnG/Bp8FBmgwPVDGfO0uIh6twc+Fscewu9zYFZBzEm/DEvAZN203
         NpfFlnv2Zo8Hn1x1dPhedDpQAxKybR+MMI+uGCSXproeQ+qczo5ORw9mjfbX+WRMzf
         lWQKKBacNX/GTi9O+xu1pqo4EBrJVWzCA4tiYnhE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7U73gZ0045863
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 02:03:42 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 02:03:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 02:03:41 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7U73ddp074448;
        Fri, 30 Aug 2019 02:03:39 -0500
Subject: Re: [PATCHv2 05/11] soc: ti: omap-prm: sync func clock status with
 resets
To:     Philipp Zabel <p.zabel@pengutronix.de>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <20190828071941.32378-1-t-kristo@ti.com>
 <20190828071941.32378-6-t-kristo@ti.com>
 <1567085114.5345.12.camel@pengutronix.de>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <7725d643-42ac-c3c1-9b07-ce2631fdb3c4@ti.com>
Date:   Fri, 30 Aug 2019 10:03:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567085114.5345.12.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/08/2019 16:25, Philipp Zabel wrote:
> On Wed, 2019-08-28 at 10:19 +0300, Tero Kristo wrote:
>> Hardware reset signals are tightly coupled with associated clocks, and
>> basically de-asserting a reset won't succeed properly if the clock is
>> not enabled, and vice-versa. Also, disabling a clock won't fully succeed
>> if the associated hardware resets are not asserted. Add status sync
>> functionality between these two for TI drivers so that the situations
>> can be handled properly without generating any timeouts.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/soc/ti/omap_prm.c | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
>> index 38998ce19c71..e876bad8f8d5 100644
>> --- a/drivers/soc/ti/omap_prm.c
>> +++ b/drivers/soc/ti/omap_prm.c
>> @@ -15,6 +15,8 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/reset-controller.h>
>>   #include <linux/delay.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk/ti.h>
>>   
>>   #include <linux/platform_data/ti-prm.h>
>>   
>> @@ -42,7 +44,9 @@ struct omap_reset_data {
>>   	struct reset_controller_dev rcdev;
>>   	struct omap_prm *prm;
>>   	struct clockdomain *clkdm;
>> +	struct clk *clk;
>>   	struct device *dev;
>> +	u32 mask;
>>   };
>>   
>>   #define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
>> @@ -102,6 +106,8 @@ static int omap_reset_assert(struct reset_controller_dev *rcdev,
>>   	v |= 1 << id;
>>   	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>>   
>> +	ti_clk_notify_resets(reset->clk, v == reset->mask);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -163,9 +169,19 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>>   	v &= ~(1 << id);
>>   	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>>   
>> +	ti_clk_notify_resets(reset->clk, v == reset->mask);
>> +
>>   	if (!has_rstst)
>>   		goto exit;
>>   
>> +	/* If associated clock is disabled, we can't poll completion status */
>> +	if (reset->clk) {
>> +		struct clk_hw *hw = __clk_get_hw(reset->clk);
>> +
>> +		if (!clk_hw_is_enabled(hw))
>> +			return ret;
>> +	}
>> +
>>   	/* wait for the status to be set */
>>   	while (1) {
>>   		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
>> @@ -199,8 +215,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>>   			       struct omap_prm *prm)
>>   {
>>   	struct omap_reset_data *reset;
>> +	const struct omap_rst_map *map;
>>   	struct ti_prm_platform_data *pdata = dev_get_platdata(&pdev->dev);
>>   	char buf[32];
>> +	u32 v;
>>   
>>   	/*
>>   	 * Check if we have controllable resets. If either rstctrl is non-zero
>> @@ -215,6 +233,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>>   	    !pdata->clkdm_allow_idle)
>>   		return -EINVAL;
>>   
>> +	map = prm->data->rstmap;
>> +	if (!map)
>> +		return -EINVAL;
> 
> Can this actually happen?

It can, if user writes bad data to the omap_prm_data structs. Without 
this check it would make the probe crash which is bad.

> 
>> +
>>   	reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
>>   	if (!reset)
>>   		return -ENOMEM;
>> @@ -224,6 +246,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>>   	reset->rcdev.of_node = pdev->dev.of_node;
>>   	reset->rcdev.nr_resets = OMAP_MAX_RESETS;
>>   	reset->dev = &pdev->dev;
>> +	reset->clk = of_clk_get(pdev->dev.of_node, 0);
>> +
>> +	if (IS_ERR(reset->clk))
>> +		reset->clk = NULL;
> 
> Maybe only ignore -ENOENT?

Yeah, I can modify this.

> 
>>   	reset->prm = prm;
>>   
>> @@ -234,6 +260,16 @@ static int omap_prm_reset_init(struct platform_device *pdev,
>>   	if (!reset->clkdm)
>>   		return -EINVAL;
>>   
>> +	while (map->rst >= 0) {
>> +		reset->mask |= BIT(map->rst);
>> +		map++;
>> +	}
> 
> With this, you could use reset->mask to simplify _is_valid_reset.

True, let me re-write it.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
