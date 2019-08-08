Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7064A859C0
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 07:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730505AbfHHFZh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 01:25:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36420 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbfHHFZh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 01:25:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x785PSBa079569;
        Thu, 8 Aug 2019 00:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565241928;
        bh=tUk6tOHIoVUgM+7SfBFU5CxGHIwubWaKM1gHqyla0FQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ydekaRYmnYzhQZSr4rnLyoBjGyalBCRYqUNbFtHVO3xt6EN23RsDTxEWHnqEUWqX+
         q7Nk3OXXOdymLdIG5MSYhZXYXGOZrrAlVH99heOLJ92PVEN+mFZHuQuM9WCG3rs96J
         CyZ/9QbE9rXprSmGV1tsz3ECeH2YstDDyfBaD+aQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x785PStN062431
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Aug 2019 00:25:28 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 8 Aug
 2019 00:25:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 8 Aug 2019 00:25:27 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x785POpW002855;
        Thu, 8 Aug 2019 00:25:25 -0500
Subject: Re: [PATCH 2/8] soc: ti: add initial PRM driver with reset control
 support
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-3-git-send-email-t-kristo@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <3b76f0e0-7530-e7b5-09df-2de9956f30ee@ti.com>
Date:   Thu, 8 Aug 2019 10:56:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565164139-21886-3-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 07/08/19 1:18 PM, Tero Kristo wrote:
> Add initial PRM (Power and Reset Management) driver for TI OMAP class
> SoCs. Initially this driver only supports reset control, but can be
> extended to support rest of the functionality, like powerdomain
> control, PRCM irq support etc.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>   arch/arm/mach-omap2/Kconfig |   1 +
>   drivers/soc/ti/Makefile     |   1 +
>   drivers/soc/ti/omap_prm.c   | 216 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 218 insertions(+)
>   create mode 100644 drivers/soc/ti/omap_prm.c
> 
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index fdb6743..42ad063 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -109,6 +109,7 @@ config ARCH_OMAP2PLUS
>   	select TI_SYSC
>   	select OMAP_IRQCHIP
>   	select CLKSRC_TI_32K
> +	select RESET_CONTROLLER
>   	help
>   	  Systems based on OMAP2, OMAP3, OMAP4 or OMAP5
>   
> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
> index b3868d3..788b5cd 100644
> --- a/drivers/soc/ti/Makefile
> +++ b/drivers/soc/ti/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_KEYSTONE_NAVIGATOR_QMSS)	+= knav_qmss.o
>   knav_qmss-y := knav_qmss_queue.o knav_qmss_acc.o
>   obj-$(CONFIG_KEYSTONE_NAVIGATOR_DMA)	+= knav_dma.o
>   obj-$(CONFIG_AMX3_PM)			+= pm33xx.o
> +obj-$(CONFIG_ARCH_OMAP2PLUS)		+= omap_prm.o
>   obj-$(CONFIG_WKUP_M3_IPC)		+= wkup_m3_ipc.o
>   obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
>   obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> new file mode 100644
> index 0000000..7c89eb8
> --- /dev/null
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OMAP2+ PRM driver
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *	Tero Kristo <t-kristo@ti.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/delay.h>
> +
> +struct omap_rst_map {
> +	s8 rst;
> +	s8 st;
> +};
> +
> +struct omap_prm_data {
> +	u32 base;
> +	const char *name;
> +	u16 pwstctrl;
> +	u16 pwstst;
> +	u16 rstctl;
> +	u16 rstst;
> +	struct omap_rst_map *rstmap;
> +	u8 flags;
> +};
> +
> +struct omap_prm {
> +	const struct omap_prm_data *data;
> +	void __iomem *base;
> +};
> +
> +struct omap_reset_data {
> +	struct reset_controller_dev rcdev;
> +	struct omap_prm *prm;
> +};
> +
> +#define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
> +
> +#define OMAP_MAX_RESETS		8
> +#define OMAP_RESET_MAX_WAIT	10000
> +
> +#define OMAP_PRM_NO_RSTST	BIT(0)
> +
> +static const struct of_device_id omap_prm_id_table[] = {
> +	{ },
> +};

This table is blank and we are doing of_match_device against it.

> +
> +static int omap_reset_status(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
> +	u32 v;
> +
> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
> +	v &= 1 << id;
> +	v >>= id;
> +
> +	return v;
> +}
> +
> +static int omap_reset_assert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
> +	u32 v;
> +
> +	/* assert the reset control line */
> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctl);
> +	v |= 1 << id;
> +	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctl);
> +
> +	return 0;
> +}
> +
> +static int omap_reset_get_st_bit(struct omap_reset_data *reset,
> +				 unsigned long id)
> +{
> +	struct omap_rst_map *map = reset->prm->data->rstmap;
> +
> +	while (map && map->rst >= 0) {
> +		if (map->rst == id)
> +			return map->st;
> +
> +		map++;
> +	}
> +
> +	return id;
> +}
> +
> +/*
> + * Note that status will not change until clocks are on, and clocks cannot be
> + * enabled until reset is deasserted. Consumer drivers must check status
> + * separately after enabling clocks.
> + */
> +static int omap_reset_deassert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
> +	u32 v;
> +	int st_bit = id;
> +	bool has_rstst;
> +
> +	/* check the current status to avoid de-asserting the line twice */
> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctl);
> +	if (!(v & BIT(id)))
> +		return -EEXIST;
> +
> +	has_rstst = !(reset->prm->data->flags & OMAP_PRM_NO_RSTST);
> +
> +	if (has_rstst) {
> +		st_bit = omap_reset_get_st_bit(reset, id);
> +
> +		/* Clear the reset status by writing 1 to the status bit */
> +		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
> +		v |= 1 << st_bit;
> +		writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);
> +	}
> +
> +	/* de-assert the reset control line */
> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctl);
> +	v &= ~(1 << id);
> +	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctl);
> +
> +	return 0;
> +}
> +
> +static const struct reset_control_ops omap_reset_ops = {
> +	.assert		= omap_reset_assert,
> +	.deassert	= omap_reset_deassert,
> +	.status		= omap_reset_status,
> +};
> +
> +static int omap_prm_reset_probe(struct platform_device *pdev,
> +				struct omap_prm *prm)
> +{
> +	struct omap_reset_data *reset;
> +
> +	/*
> +	 * Check if we have resets. If either rstctl or rstst is
> +	 * non-zero, we have reset registers in place. Additionally
> +	 * the flag OMAP_PRM_NO_RSTST implies that we have resets.
> +	 */
> +	if (!prm->data->rstctl && !prm->data->rstst &&
> +	    !(prm->data->flags & OMAP_PRM_NO_RSTST))
> +		return 0;
> +
> +	reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
> +	if (!reset)
> +		return -ENOMEM;
> +
> +	reset->rcdev.owner = THIS_MODULE;
> +	reset->rcdev.ops = &omap_reset_ops;
> +	reset->rcdev.of_node = pdev->dev.of_node;
> +	reset->rcdev.nr_resets = OMAP_MAX_RESETS;
> +
> +	reset->prm = prm;
> +
> +	return devm_reset_controller_register(&pdev->dev, &reset->rcdev);
> +}
> +
> +static int omap_prm_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	const struct omap_prm_data *data;
> +	struct omap_prm *prm;
> +	const struct of_device_id *match;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	match = of_match_device(omap_prm_id_table, &pdev->dev);
> +	if (!match)
> +		return -ENOTSUPP;
> +
> +	prm = devm_kzalloc(&pdev->dev, sizeof(*prm), GFP_KERNEL);
> +	if (!prm)
> +		return -ENOMEM;
> +
> +	data = match->data;
> +
> +	while (data->base != res->start) {
> +		if (!data->base)
> +			return -EINVAL;
> +		data++;
> +	}
> +
> +	prm->data = data;
> +
> +	prm->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (!prm->base)
> +		return -ENOMEM;
> +
> +	return omap_prm_reset_probe(pdev, prm);
> +}
> +
> +static struct platform_driver omap_prm_driver = {
> +	.probe = omap_prm_probe,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= omap_prm_id_table,
> +	},
> +};
> +builtin_platform_driver(omap_prm_driver);
> +
> +MODULE_ALIAS("platform:prm");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("omap2+ prm driver");

It is a builtin_platform_driver so do we need the MODULE*?

> 
