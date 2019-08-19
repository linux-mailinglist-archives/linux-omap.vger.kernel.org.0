Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A16F9205F
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 11:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfHSJcS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 05:32:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51316 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfHSJcR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 05:32:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J9WAee095419;
        Mon, 19 Aug 2019 04:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566207130;
        bh=W6jPIAfs1BxgmaSUSoCWtUdi1X9YaEEV+Ijf139N2D4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XBmyjNwJXmkWl45Cl3vgw906IsleOtDPExLQLU8MoBwVjrRzon8l0DxNs3boLa70/
         rNh2f6BQCe1SRCmyxLCbDWEAmx3IzVnJoMSg+c7Xi1Apc4xYsQnzhx7d2dyUNe3n0y
         XZ/J0lcIpMjuW2jfh4Ne7cNkvAZZZNKhPerhcl90=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J9WA9W064527
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 04:32:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 04:32:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 04:32:09 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J9W6dm023929;
        Mon, 19 Aug 2019 04:32:07 -0500
Subject: Re: [PATCH 2/8] soc: ti: add initial PRM driver with reset control
 support
To:     Keerthy <j-keerthy@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-3-git-send-email-t-kristo@ti.com>
 <3b76f0e0-7530-e7b5-09df-2de9956f30ee@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <59709a2d-f13a-bd55-8aba-864c1cf2f19e@ti.com>
Date:   Mon, 19 Aug 2019 12:32:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3b76f0e0-7530-e7b5-09df-2de9956f30ee@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2019 08:26, Keerthy wrote:
> 
> 
> On 07/08/19 1:18 PM, Tero Kristo wrote:
>> Add initial PRM (Power and Reset Management) driver for TI OMAP class
>> SoCs. Initially this driver only supports reset control, but can be
>> extended to support rest of the functionality, like powerdomain
>> control, PRCM irq support etc.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   arch/arm/mach-omap2/Kconfig |   1 +
>>   drivers/soc/ti/Makefile     |   1 +
>>   drivers/soc/ti/omap_prm.c   | 216 
>> ++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 218 insertions(+)
>>   create mode 100644 drivers/soc/ti/omap_prm.c
>>
>> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
>> index fdb6743..42ad063 100644
>> --- a/arch/arm/mach-omap2/Kconfig
>> +++ b/arch/arm/mach-omap2/Kconfig
>> @@ -109,6 +109,7 @@ config ARCH_OMAP2PLUS
>>       select TI_SYSC
>>       select OMAP_IRQCHIP
>>       select CLKSRC_TI_32K
>> +    select RESET_CONTROLLER
>>       help
>>         Systems based on OMAP2, OMAP3, OMAP4 or OMAP5
>> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
>> index b3868d3..788b5cd 100644
>> --- a/drivers/soc/ti/Makefile
>> +++ b/drivers/soc/ti/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_KEYSTONE_NAVIGATOR_QMSS)    += knav_qmss.o
>>   knav_qmss-y := knav_qmss_queue.o knav_qmss_acc.o
>>   obj-$(CONFIG_KEYSTONE_NAVIGATOR_DMA)    += knav_dma.o
>>   obj-$(CONFIG_AMX3_PM)            += pm33xx.o
>> +obj-$(CONFIG_ARCH_OMAP2PLUS)        += omap_prm.o
>>   obj-$(CONFIG_WKUP_M3_IPC)        += wkup_m3_ipc.o
>>   obj-$(CONFIG_TI_SCI_PM_DOMAINS)        += ti_sci_pm_domains.o
>>   obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)    += ti_sci_inta_msi.o
>> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
>> new file mode 100644
>> index 0000000..7c89eb8
>> --- /dev/null
>> +++ b/drivers/soc/ti/omap_prm.c
>> @@ -0,0 +1,216 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * OMAP2+ PRM driver
>> + *
>> + * Copyright (C) 2019 Texas Instruments Incorporated - 
>> http://www.ti.com/
>> + *    Tero Kristo <t-kristo@ti.com>
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/delay.h>
>> +
>> +struct omap_rst_map {
>> +    s8 rst;
>> +    s8 st;
>> +};
>> +
>> +struct omap_prm_data {
>> +    u32 base;
>> +    const char *name;
>> +    u16 pwstctrl;
>> +    u16 pwstst;
>> +    u16 rstctl;
>> +    u16 rstst;
>> +    struct omap_rst_map *rstmap;
>> +    u8 flags;
>> +};
>> +
>> +struct omap_prm {
>> +    const struct omap_prm_data *data;
>> +    void __iomem *base;
>> +};
>> +
>> +struct omap_reset_data {
>> +    struct reset_controller_dev rcdev;
>> +    struct omap_prm *prm;
>> +};
>> +
>> +#define to_omap_reset_data(p) container_of((p), struct 
>> omap_reset_data, rcdev)
>> +
>> +#define OMAP_MAX_RESETS        8
>> +#define OMAP_RESET_MAX_WAIT    10000
>> +
>> +#define OMAP_PRM_NO_RSTST    BIT(0)
>> +
>> +static const struct of_device_id omap_prm_id_table[] = {
>> +    { },
>> +};
> 
> This table is blank and we are doing of_match_device against it.

Yes, it gets populated with other patches in series, one entry per soc.

> 
>> +
>> +static int omap_reset_status(struct reset_controller_dev *rcdev,
>> +                 unsigned long id)
>> +{
>> +    struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +    u32 v;
>> +
>> +    v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
>> +    v &= 1 << id;
>> +    v >>= id;
>> +
>> +    return v;
>> +}
>> +
>> +static int omap_reset_assert(struct reset_controller_dev *rcdev,
>> +                 unsigned long id)
>> +{
>> +    struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +    u32 v;
>> +
>> +    /* assert the reset control line */
>> +    v = readl_relaxed(reset->prm->base + reset->prm->data->rstctl);
>> +    v |= 1 << id;
>> +    writel_relaxed(v, reset->prm->base + reset->prm->data->rstctl);
>> +
>> +    return 0;
>> +}
>> +
>> +static int omap_reset_get_st_bit(struct omap_reset_data *reset,
>> +                 unsigned long id)
>> +{
>> +    struct omap_rst_map *map = reset->prm->data->rstmap;
>> +
>> +    while (map && map->rst >= 0) {
>> +        if (map->rst == id)
>> +            return map->st;
>> +
>> +        map++;
>> +    }
>> +
>> +    return id;
>> +}
>> +
>> +/*
>> + * Note that status will not change until clocks are on, and clocks 
>> cannot be
>> + * enabled until reset is deasserted. Consumer drivers must check status
>> + * separately after enabling clocks.
>> + */
>> +static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>> +                   unsigned long id)
>> +{
>> +    struct omap_reset_data *reset = to_omap_reset_data(rcdev);
>> +    u32 v;
>> +    int st_bit = id;
>> +    bool has_rstst;
>> +
>> +    /* check the current status to avoid de-asserting the line twice */
>> +    v = readl_relaxed(reset->prm->base + reset->prm->data->rstctl);
>> +    if (!(v & BIT(id)))
>> +        return -EEXIST;
>> +
>> +    has_rstst = !(reset->prm->data->flags & OMAP_PRM_NO_RSTST);
>> +
>> +    if (has_rstst) {
>> +        st_bit = omap_reset_get_st_bit(reset, id);
>> +
>> +        /* Clear the reset status by writing 1 to the status bit */
>> +        v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
>> +        v |= 1 << st_bit;
>> +        writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);
>> +    }
>> +
>> +    /* de-assert the reset control line */
>> +    v = readl_relaxed(reset->prm->base + reset->prm->data->rstctl);
>> +    v &= ~(1 << id);
>> +    writel_relaxed(v, reset->prm->base + reset->prm->data->rstctl);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct reset_control_ops omap_reset_ops = {
>> +    .assert        = omap_reset_assert,
>> +    .deassert    = omap_reset_deassert,
>> +    .status        = omap_reset_status,
>> +};
>> +
>> +static int omap_prm_reset_probe(struct platform_device *pdev,
>> +                struct omap_prm *prm)
>> +{
>> +    struct omap_reset_data *reset;
>> +
>> +    /*
>> +     * Check if we have resets. If either rstctl or rstst is
>> +     * non-zero, we have reset registers in place. Additionally
>> +     * the flag OMAP_PRM_NO_RSTST implies that we have resets.
>> +     */
>> +    if (!prm->data->rstctl && !prm->data->rstst &&
>> +        !(prm->data->flags & OMAP_PRM_NO_RSTST))
>> +        return 0;
>> +
>> +    reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
>> +    if (!reset)
>> +        return -ENOMEM;
>> +
>> +    reset->rcdev.owner = THIS_MODULE;
>> +    reset->rcdev.ops = &omap_reset_ops;
>> +    reset->rcdev.of_node = pdev->dev.of_node;
>> +    reset->rcdev.nr_resets = OMAP_MAX_RESETS;
>> +
>> +    reset->prm = prm;
>> +
>> +    return devm_reset_controller_register(&pdev->dev, &reset->rcdev);
>> +}
>> +
>> +static int omap_prm_probe(struct platform_device *pdev)
>> +{
>> +    struct resource *res;
>> +    const struct omap_prm_data *data;
>> +    struct omap_prm *prm;
>> +    const struct of_device_id *match;
>> +
>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +    if (!res)
>> +        return -ENODEV;
>> +
>> +    match = of_match_device(omap_prm_id_table, &pdev->dev);
>> +    if (!match)
>> +        return -ENOTSUPP;
>> +
>> +    prm = devm_kzalloc(&pdev->dev, sizeof(*prm), GFP_KERNEL);
>> +    if (!prm)
>> +        return -ENOMEM;
>> +
>> +    data = match->data;
>> +
>> +    while (data->base != res->start) {
>> +        if (!data->base)
>> +            return -EINVAL;
>> +        data++;
>> +    }
>> +
>> +    prm->data = data;
>> +
>> +    prm->base = devm_ioremap_resource(&pdev->dev, res);
>> +    if (!prm->base)
>> +        return -ENOMEM;
>> +
>> +    return omap_prm_reset_probe(pdev, prm);
>> +}
>> +
>> +static struct platform_driver omap_prm_driver = {
>> +    .probe = omap_prm_probe,
>> +    .driver = {
>> +        .name        = KBUILD_MODNAME,
>> +        .of_match_table    = omap_prm_id_table,
>> +    },
>> +};
>> +builtin_platform_driver(omap_prm_driver);
>> +
>> +MODULE_ALIAS("platform:prm");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("omap2+ prm driver");
> 
> It is a builtin_platform_driver so do we need the MODULE*?

Well, thats debatable, however some existing drivers do introduce this 
even if they are builtin.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
