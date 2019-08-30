Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0ADA30FD
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 09:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbfH3H23 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 03:28:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49254 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfH3H23 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 03:28:29 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7U7SI50073271;
        Fri, 30 Aug 2019 02:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567150098;
        bh=8sdTCRtdplYo/h5ZDE5eJXQIxLz1e8dYm1qiYiYwDQo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cvzcotxYZ+yZtU5U/G4E5SwGBvdD5hQRC8OVg2VpqPFIhzs1/KnzFHbCZDir07kSS
         998ubvRTtmooaoX7JZS5mnbu3c0/GwzPDc3nsPi1B6pxzINbXjJxOH4MdxVUlHCFV5
         RUX/Eg2LF6JJkWxwkzjlONfxCkhaC296bo8rKrKA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7U7SIPZ073565
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 02:28:18 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 02:28:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 02:28:16 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7U7SEX2051736;
        Fri, 30 Aug 2019 02:28:15 -0500
Subject: Re: [PATCHv2 02/11] soc: ti: add initial PRM driver with reset
 control support
To:     Philipp Zabel <p.zabel@pengutronix.de>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <20190828071941.32378-1-t-kristo@ti.com>
 <20190828071941.32378-3-t-kristo@ti.com>
 <1567084339.5345.7.camel@pengutronix.de>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <049da607-c352-4ed1-9a2d-2374d7a7e372@ti.com>
Date:   Fri, 30 Aug 2019 10:28:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567084339.5345.7.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/08/2019 16:12, Philipp Zabel wrote:
> On Wed, 2019-08-28 at 10:19 +0300, Tero Kristo wrote:
>> Add initial PRM (Power and Reset Management) driver for TI OMAP class
>> SoCs. Initially this driver only supports reset control, but can be
>> extended to support rest of the functionality, like powerdomain
>> control, PRCM irq support etc.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   arch/arm/mach-omap2/Kconfig |   1 +
>>   drivers/soc/ti/Makefile     |   1 +
>>   drivers/soc/ti/omap_prm.c   | 235 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 237 insertions(+)
>>   create mode 100644 drivers/soc/ti/omap_prm.c
>>
>> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
>> index fdb6743760a2..ad08d470a2ca 100644
>> --- a/arch/arm/mach-omap2/Kconfig
>> +++ b/arch/arm/mach-omap2/Kconfig
>> @@ -109,6 +109,7 @@ config ARCH_OMAP2PLUS
>>   	select TI_SYSC
>>   	select OMAP_IRQCHIP
>>   	select CLKSRC_TI_32K
>> +	select ARCH_HAS_RESET_CONTROLLER
>>   	help
>>   	  Systems based on OMAP2, OMAP3, OMAP4 or OMAP5
>>   
>> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
>> index b3868d392d4f..788b5cd1e180 100644
>> --- a/drivers/soc/ti/Makefile
>> +++ b/drivers/soc/ti/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_KEYSTONE_NAVIGATOR_QMSS)	+= knav_qmss.o
>>   knav_qmss-y := knav_qmss_queue.o knav_qmss_acc.o
>>   obj-$(CONFIG_KEYSTONE_NAVIGATOR_DMA)	+= knav_dma.o
>>   obj-$(CONFIG_AMX3_PM)			+= pm33xx.o
>> +obj-$(CONFIG_ARCH_OMAP2PLUS)		+= omap_prm.o
>>   obj-$(CONFIG_WKUP_M3_IPC)		+= wkup_m3_ipc.o
>>   obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
>>   obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
>> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
>> new file mode 100644
>> index 000000000000..fd5c431f8736
>> --- /dev/null
>> +++ b/drivers/soc/ti/omap_prm.c
>> @@ -0,0 +1,235 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * OMAP2+ PRM driver
>> + *
>> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> + *	Tero Kristo <t-kristo@ti.com>
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
> 
> Why <linux/module.h>? This is a builtin driver.

Yeah, not anymore. Let me ditch this.

> 
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/delay.h>
>> +
>> +struct omap_rst_map {
>> +	s8 rst;
>> +	s8 st;
>> +};
>> +
>> +struct omap_prm_data {
>> +	u32 base;
>> +	const char *name;
>> +	u16 rstctrl;
>> +	u16 rstst;
>> +	const struct omap_rst_map *rstmap;
>> +	u8 flags;
>> +};
> 
> I wonder if splitting rstctrl/rstst/rstmap out into a separate structure
> would make sense. That could be linked from omap_reset_data directly.
> That only makes sense if there'd be enough cases where it can be reused
> for multiple PRMs instances.

Hmm, splitting these out would make it possible to share the bits for 
ipu:s across devices, same for dsp:s and eve:s.

However, adding too many levels of abstraction makes it kind of 
difficult to follow what is happening with the code, and it would only 
save maybe ~100 bytes of memory at the moment.

> 
>> +
>> +struct omap_prm {
>> +	const struct omap_prm_data *data;
>> +	void __iomem *base;
>> +};
>> +
>> +struct omap_reset_data {
>> +	struct reset_controller_dev rcdev;
>> +	struct omap_prm *prm;
>> +};
>> +
>> +#define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
>> +
>> +#define OMAP_MAX_RESETS		8
>> +#define OMAP_RESET_MAX_WAIT	10000
>> +
>> +#define OMAP_PRM_HAS_RSTCTRL	BIT(0)
>> +#define OMAP_PRM_HAS_RSTST	BIT(1)
>> +
>> +#define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
>> +
>> +static const struct of_device_id omap_prm_id_table[] = {
>> +	{ },
>> +};
>> +
>> +static bool _is_valid_reset(struct omap_reset_data *reset, unsigned long id)
>> +{
>> +	const struct omap_rst_map *map = reset->prm->data->rstmap;
>> +
>> +	while (map && map->rst >= 0) {
> 
> If rstmap is never NULL,
> 
> 	while (map->rst >= 0) {
> 
> should be enough.

I'll actually re-write this to use the reset mask.

> 
>> +		if (map->rst == id)
>> +			return true;
>> +		map++;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static int omap_reset_status(struct reset_controller_dev *rcdev,
>> +			     unsigned long id)
>> +{
>> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +	u32 v;
>> +
>> +	if (!_is_valid_reset(reset, id))
>> +		return -EINVAL;
> 
> Don't check this in the status/(de)assert/reset callbacks. Instead,
> implement rcdev.of_xlate and return -EINVAL there, so that invalid ids
> can never be requested.

Yeah, let me do that.

> 
>> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
>> +	v &= 1 << id;
>> +	v >>= id;
> 
> omap_get_st_bit below makes it look like the status bit can be in a
> different place than the reset control bit, should that be used here as
> well?

True, this is a bug.

> 
>> +
>> +	return v;
>> +}
>> +
>> +static int omap_reset_assert(struct reset_controller_dev *rcdev,
>> +			     unsigned long id)
>> +{
>> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +	u32 v;
>> +
>> +	if (!_is_valid_reset(reset, id))
>> +		return -EINVAL;
> 
> Same as above.

Will drop this one.

> 
>> +	/* assert the reset control line */
>> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
>> +	v |= 1 << id;
>> +	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
> 
> This read-modify-write should be protected with a lock.

Ok, will add a spinlock. I did think about this before but all the cases 
where we are sharing a reset register are to be controlled from the same 
process / driver, and the events are effectively serialized. Doesn't 
hurt adding it for possible future need though.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int omap_reset_get_st_bit(struct omap_reset_data *reset,
>> +				 unsigned long id)
>> +{
>> +	const struct omap_rst_map *map = reset->prm->data->rstmap;
>> +
>> +	while (map && map->rst >= 0) {
> 
> Same as above.

Yeah, usage of rstmap is now enforced, so no need to check it here.

> 
>> +		if (map->rst == id)
>> +			return map->st;
>> +
>> +		map++;
>> +	}
>> +
>> +	return id;
>> +}
>> +
>> +/*
>> + * Note that status will not change until clocks are on, and clocks cannot be
>> + * enabled until reset is deasserted. Consumer drivers must check status
>> + * separately after enabling clocks.
>> + */
>> +static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>> +			       unsigned long id)
>> +{
>> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +	u32 v;
>> +	int st_bit;
>> +	bool has_rstst;
>> +
>> +	if (!_is_valid_reset(reset, id))
>> +		return -EINVAL;
> 
> Same as above.

Will drop.

> 
>> +	/* check the current status to avoid de-asserting the line twice */
>> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
>> +	if (!(v & BIT(id)))
>> +		return -EEXIST;
> 
> What is the purpose of this? For shared consumers the core already does
> refcounting, and I expect exclusive consumers won't deassert twice.
> Since the reset signal is deasserted after this call, this should not
> return an error.

This is actually a leftover from legacy code; this driver is mostly a 
move of the reset handling from platform codebase to be an actual driver 
of its own. But yes, I believe this can be dropped.

> 
>> +
>> +	has_rstst = reset->prm->data->rstst ||
>> +		(reset->prm->data->flags & OMAP_PRM_HAS_RSTST);
>> +
>> +	if (has_rstst) {
>> +		st_bit = omap_reset_get_st_bit(reset, id);
>> +
>> +		/* Clear the reset status by writing 1 to the status bit */
>> +		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
>> +		v |= 1 << st_bit;
>> +		writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);
> 
> What does the value read from the rstst register indicate? Is it the
> current state of the reset line? Is it 0 until deassertion is completed,
> and then it turns to 1?

Value of 1 indicates that the corresponding IP has been reset 
successfully. Writing back 1 to the same bit clears it out, so the 
status can be polled later on.

> 
>> +	}
>> +
>> +	/* de-assert the reset control line */
>> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
> 
> Reading the register again seems unnecessary.

I dropped the earlier read for now, so this is again needed.

> 
>> +	v &= ~(1 << id);
>> +	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
> 
> As above, the read-modify-write should be locked.

Yep, will protect this.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct reset_control_ops omap_reset_ops = {
>> +	.assert		= omap_reset_assert,
>> +	.deassert	= omap_reset_deassert,
>> +	.status		= omap_reset_status,
>> +};
>> +
>> +static int omap_prm_reset_init(struct platform_device *pdev,
>> +			       struct omap_prm *prm)
>> +{
>> +	struct omap_reset_data *reset;
>> +
>> +	/*
>> +	 * Check if we have controllable resets. If either rstctrl is non-zero
>> +	 * or OMAP_PRM_HAS_RSTCTRL flag is set, we have reset control register
>> +	 * for the domain.
>> +	 */
>> +	if (!prm->data->rstctrl && !(prm->data->flags & OMAP_PRM_HAS_RSTCTRL))
>> +		return 0;
>> +
>> +	reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
>> +	if (!reset)
>> +		return -ENOMEM;
>> +
>> +	reset->rcdev.owner = THIS_MODULE;
>> +	reset->rcdev.ops = &omap_reset_ops;
>> +	reset->rcdev.of_node = pdev->dev.of_node;
>> +	reset->rcdev.nr_resets = OMAP_MAX_RESETS;
>> +
>> +	reset->prm = prm;
>> +
>> +	return devm_reset_controller_register(&pdev->dev, &reset->rcdev);
>> +}
>> +
>> +static int omap_prm_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	const struct omap_prm_data *data;
>> +	struct omap_prm *prm;
>> +	const struct of_device_id *match;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -ENODEV;
> 
> This can be merged with devm_ioremap_resource below.

Well, I actually use the "res" later on to map the DT node to the 
corresponding prm_data based on address.

> 
>> +	match = of_match_device(omap_prm_id_table, &pdev->dev);
>> +	if (!match)
>> +		return -ENOTSUPP;
>> +
>> +	prm = devm_kzalloc(&pdev->dev, sizeof(*prm), GFP_KERNEL);
>> +	if (!prm)
>> +		return -ENOMEM;
>> +
>> +	data = match->data;
>> +
>> +	while (data->base != res->start) {
>> +		if (!data->base)
>> +			return -EINVAL;
>> +		data++;
>> +	}
> 
> Is this not something that you want to have encoded in the compatible
> string? They all have a different register layout.

With the addition of all the prm instances later on, this changes. Most 
of the prm instances will have same register layout then. See v1 data 
that was posted earlier [1], but which I dropped for now to keep this 
series isolated for reset handling only. In this patch, you see that for 
DRA7, all the power domain handling related PRM instances have identical 
register layout, they just differ based on base address.

[1] https://www.spinics.net/lists/linux-omap/msg149872.html

It would be possible to encode all of this based on different 
compatibles, but then the amount of different compatible strings would 
explode... DRA7 is just one SoC.

> 
>> +
>> +	prm->data = data;
>> +
>> +	prm->base = devm_ioremap_resource(&pdev->dev, res);
> 
> 	prm->base = devm_platform_ioremap_resource(pdev, 0);

I still need the "res" pointer as indicated above.

-Tero

> 
>> +	if (!prm->base)
>> +		return -ENOMEM;
>> +
>> +	return omap_prm_reset_init(pdev, prm);
>> +}
>> +
>> +static struct platform_driver omap_prm_driver = {
>> +	.probe = omap_prm_probe,
>> +	.driver = {
>> +		.name		= KBUILD_MODNAME,
>> +		.of_match_table	= omap_prm_id_table,
>> +	},
>> +};
>> +builtin_platform_driver(omap_prm_driver);
> 
> regards
> Philipp
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
