Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B14ACFA31
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 14:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbfJHMmX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 08:42:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34322 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730332AbfJHMmX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 08:42:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98Cg8Qa125316;
        Tue, 8 Oct 2019 07:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570538528;
        bh=rM082lErilysa/gP6hHtlnyuYioxvnxSBZCZXIuODTo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IQb9ED4rrcr1p2aDB3/I/4YEaMaJ4bE0GzjIkFgdaj1uHKqx3nJyywF6tiCKIStEl
         ev8ipsFMMSzXcGsH7RdoDYblZeFgcpEdOOVcAax+pztrNp1w1MyoTsv6Cdo3NhOZzU
         FTwtA5XIdv9Sv7gJCyxv5aXs3aZtQYwXnLwKqSis=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98Cg896108236
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 07:42:08 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 07:42:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 07:42:08 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98Cg62q019948;
        Tue, 8 Oct 2019 07:42:06 -0500
Subject: Re: [PATCHv7 2/9] soc: ti: add initial PRM driver with reset control
 support
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20191008071913.28740-1-t-kristo@ti.com>
 <20191008071913.28740-3-t-kristo@ti.com>
 <1570534767.18914.1.camel@pengutronix.de>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <5a2833e7-b967-c5fd-f50a-89dbd3ddf1a1@ti.com>
Date:   Tue, 8 Oct 2019 15:42:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570534767.18914.1.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/10/2019 14:39, Philipp Zabel wrote:
> On Tue, 2019-10-08 at 10:19 +0300, Tero Kristo wrote:
>> Add initial PRM (Power and Reset Management) driver for TI OMAP class
>> SoCs. Initially this driver only supports reset control, but can be
>> extended to support rest of the functionality, like powerdomain
>> control, PRCM irq support etc.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   arch/arm/mach-omap2/Kconfig |   1 +
>>   drivers/soc/ti/Makefile     |   1 +
>>   drivers/soc/ti/omap_prm.c   | 259 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 261 insertions(+)
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
>> index 000000000000..ab0b66ad715d
>> --- /dev/null
>> +++ b/drivers/soc/ti/omap_prm.c
>> @@ -0,0 +1,259 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * OMAP2+ PRM driver
>> + *
>> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> + *	Tero Kristo <t-kristo@ti.com>
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
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
>> +
>> +struct omap_prm {
>> +	const struct omap_prm_data *data;
>> +	void __iomem *base;
>> +};
>> +
>> +struct omap_reset_data {
>> +	struct reset_controller_dev rcdev;
>> +	struct omap_prm *prm;
>> +	u32 mask;
>> +	spinlock_t lock;
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
>> +	if (reset->mask & BIT(id))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static int omap_reset_get_st_bit(struct omap_reset_data *reset,
>> +				 unsigned long id)
>> +{
>> +	const struct omap_rst_map *map = reset->prm->data->rstmap;
>> +
>> +	while (map->rst >= 0) {
>> +		if (map->rst == id)
>> +			return map->st;
>> +
>> +		map++;
>> +	}
>> +
>> +	return id;
>> +}
>> +
>> +static int omap_reset_status(struct reset_controller_dev *rcdev,
>> +			     unsigned long id)
>> +{
>> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +	u32 v;
>> +	int st_bit = omap_reset_get_st_bit(reset, id);
>> +	bool has_rstst = reset->prm->data->rstst ||
>> +		(reset->prm->data->flags & OMAP_PRM_HAS_RSTST);
>> +
>> +	/* Check if we have rstst */
>> +	if (!has_rstst)
>> +		return -ENOTSUPP;
>> +
>> +	/* Check if hw reset line is asserted */
>> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
>> +	if (v & BIT(id))
>> +		return 1;
>> +
>> +	/*
>> +	 * Check reset status, high value means reset sequence has been
>> +	 * completed successfully so we can return 0 here (reset deasserted)
>> +	 */
>> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
>> +	v >>= st_bit;
>> +	v &= 1;
>> +
>> +	return !v;
>> +}
>> +
>> +static int omap_reset_assert(struct reset_controller_dev *rcdev,
>> +			     unsigned long id)
>> +{
>> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +	u32 v;
>> +	unsigned long flags;
>> +
>> +	/* assert the reset control line */
>> +	spin_lock_irqsave(&reset->lock, flags);
>> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
>> +	v |= 1 << id;
>> +	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>> +	spin_unlock_irqrestore(&reset->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>> +			       unsigned long id)
>> +{
>> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +	u32 v;
>> +	int st_bit;
>> +	bool has_rstst;
>> +	unsigned long flags;
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
> Could this accidentally clear the bits of other already completed
> resets? If this is a "write 1 to clear" register, and writing zero bits
> has no effect, I'd expect this to be just:
> 
> 		v = 1 << st_bit;
> 		writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);

You are right, good catch there. Just checked against TRMs and 
functionality in code and this is true, writing the status bit only as 1 
suffices.

Also checked the legacy hwmod based implementation for this, and it 
seems like this has always been broken, however the reset signals are 
quite fast to toggle so it hasn't caused any visible problems before...

> With this fixed (or, if I am mistaken, clarified):
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks, will post v8 with this fix.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
