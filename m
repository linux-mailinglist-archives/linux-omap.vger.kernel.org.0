Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9736AD96
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jul 2019 19:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfGPRWa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jul 2019 13:22:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56060 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbfGPRW3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jul 2019 13:22:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GHLDUB121252;
        Tue, 16 Jul 2019 12:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563297673;
        bh=pGJ1pH9t9oveC+3vYJABnQ3Dl3UWKH//72W69udD7FY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Mrymdx2GYA40SecDfTaIbavUEsPGErwk1Zc2ttv1kBtfwP68dRGjycQ6wWFahEVK+
         otTX3ti8R+FRahEWwbW2UjA1uRSKtwYidJYT4/ojUn1I2y9nbWVUhIAMj4c+/QgOvj
         k8YT+lFCY7TzinV3N6N/r/K5dYd5i4tUpZ3aphPU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GHLD9E045222
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 16 Jul 2019 12:21:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 16
 Jul 2019 12:21:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 16 Jul 2019 12:21:12 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GHLCYw074615;
        Tue, 16 Jul 2019 12:21:12 -0500
Subject: Re: [PATCH 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
To:     David Lechner <david@lechnology.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-3-s-anna@ti.com>
 <3d91800b-e858-8c73-5ea8-e99e5ea30e8e@lechnology.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <54e871a8-dfa4-f65b-5869-d1661144cbf0@ti.com>
Date:   Tue, 16 Jul 2019 12:21:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3d91800b-e858-8c73-5ea8-e99e5ea30e8e@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 7/11/19 11:45 AM, David Lechner wrote:
> On 7/7/19 10:52 PM, Suman Anna wrote:
>> From: "Andrew F. Davis" <afd@ti.com>
>>
>> The Programmable Real-Time Unit Subsystem (PRUSS) contains a local
>> interrupt controller (INTC) that can handle various system input events
>> and post interrupts back to the device-level initiators. The INTC can
>> support upto 64 input events with individual control configuration and
>> hardware prioritization. These events are mapped onto 10 output interrupt
>> lines through two levels of many-to-one mapping support. Different
>> interrupt lines are routed to the individual PRU cores or to the host
>> CPU, or to other devices on the SoC. Some of these events are sourced
>> from peripherals or other sub-modules within that PRUSS, while a few
>> others are sourced from SoC-level peripherals/devices.
>>
>> The PRUSS INTC platform driver manages this PRUSS interrupt controller
>> and implements an irqchip driver to provide a Linux standard way for
>> the PRU client users to enable/disable/ack/re-trigger a PRUSS system
>> event. The system events to interrupt channels and host interrupts
>> relies on the mapping configuration provided either through the PRU
>> firmware blob or via the PRU application's device tree node. The
>> mappings will be programmed during the boot/shutdown of a PRU core.
>>
>> The PRUSS INTC module is reference counted during the interrupt
>> setup phase through the irqchip's irq_request_resources() and
>> irq_release_resources() ops. This restricts the module from being
>> removed as long as there are active interrupt users.
>>
>> The driver currently supports and can be built for OMAP architecture
>> based AM335x, AM437x and AM57xx SoCs; Keystone2 architecture based
>> 66AK2G SoCs and Davinci architecture based OMAP-L13x/AM18x/DA850 SoCs.
>> All of these SoCs support 64 system events, 10 interrupt channels and
>> 10 output interrupt lines per PRUSS INTC with a few SoC integration
>> differences.
>>
>> NOTE:
>> Each PRU-ICSS's INTC on AM57xx SoCs is preceded by a Crossbar that
>> enables multiple external events to be routed to a specific number
>> of input interrupt events. Any non-default external interrupt event
>> directed towards PRUSS needs this crossbar to be setup properly.
> 
> The all of the explanations above are very helpful. Great work.
> 
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>> Prior version: https://patchwork.kernel.org/patch/10795761/
>>
>>   drivers/irqchip/Kconfig          |  10 +
>>   drivers/irqchip/Makefile         |   1 +
>>   drivers/irqchip/irq-pruss-intc.c | 352 +++++++++++++++++++++++++++++++
>>   3 files changed, 363 insertions(+)
>>   create mode 100644 drivers/irqchip/irq-pruss-intc.c
>>
>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index 659c5e0fb835..b0a9479d527c 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -447,6 +447,16 @@ config TI_SCI_INTA_IRQCHIP
>>         If you wish to use interrupt aggregator irq resources managed
>> by the
>>         TI System Controller, say Y here. Otherwise, say N.
>>   +config TI_PRUSS_INTC
>> +    tristate "TI PRU-ICSS Interrupt Controller"
>> +    depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM437X || SOC_DRA7XX
>> || ARCH_KEYSTONE
>> +    select IRQ_DOMAIN
>> +    help
>> +       This enables support for the PRU-ICSS Local Interrupt Controller
>> +       present within a PRU-ICSS subsystem present on various TI SoCs.
>> +       The PRUSS INTC enables various interrupts to be routed to
>> multiple
>> +       different processors within the SoC.
>> +
>>   endmenu
>>     config SIFIVE_PLIC
>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index 606a003a0000..717f1d49e549 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -100,3 +100,4 @@ obj-$(CONFIG_MADERA_IRQ)        += irq-madera.o
>>   obj-$(CONFIG_LS1X_IRQ)            += irq-ls1x.o
>>   obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)    += irq-ti-sci-intr.o
>>   obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)    += irq-ti-sci-inta.o
>> +obj-$(CONFIG_TI_PRUSS_INTC)        += irq-pruss-intc.o
>> diff --git a/drivers/irqchip/irq-pruss-intc.c
>> b/drivers/irqchip/irq-pruss-intc.c
>> new file mode 100644
>> index 000000000000..d62186ad1be4
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-pruss-intc.c
>> @@ -0,0 +1,352 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * PRU-ICSS INTC IRQChip driver for various TI SoCs
>> + *
>> + * Copyright (C) 2016-2019 Texas Instruments Incorporated -
>> http://www.ti.com/
>> + *    Andrew F. Davis <afd@ti.com>
>> + *    Suman Anna <s-anna@ti.com>
>> + */
>> +
>> +#include <linux/irq.h>
>> +#include <linux/irqchip/chained_irq.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +
>> +/*
>> + * Number of host interrupts reaching the main MPU sub-system. Note
>> that this
>> + * is not the same as the total number of host interrupts supported
>> by the PRUSS
>> + * INTC instance
>> + */
>> +#define MAX_NUM_HOST_IRQS    8
>> +
>> +/* minimum starting host interrupt number for MPU */
>> +#define MIN_PRU_HOST_INT    2
>> +
>> +/* maximum number of system events */
>> +#define MAX_PRU_SYS_EVENTS    64
>> +
>> +/* PRU_ICSS_INTC registers */
>> +#define PRU_INTC_REVID        0x0000
>> +#define PRU_INTC_CR        0x0004
>> +#define PRU_INTC_GER        0x0010
>> +#define PRU_INTC_GNLR        0x001c
>> +#define PRU_INTC_SISR        0x0020
>> +#define PRU_INTC_SICR        0x0024
>> +#define PRU_INTC_EISR        0x0028
>> +#define PRU_INTC_EICR        0x002c
>> +#define PRU_INTC_HIEISR        0x0034
>> +#define PRU_INTC_HIDISR        0x0038
>> +#define PRU_INTC_GPIR        0x0080
>> +#define PRU_INTC_SRSR0        0x0200
>> +#define PRU_INTC_SRSR1        0x0204
>> +#define PRU_INTC_SECR0        0x0280
>> +#define PRU_INTC_SECR1        0x0284
>> +#define PRU_INTC_ESR0        0x0300
>> +#define PRU_INTC_ESR1        0x0304
>> +#define PRU_INTC_ECR0        0x0380
>> +#define PRU_INTC_ECR1        0x0384
>> +#define PRU_INTC_CMR(x)        (0x0400 + (x) * 4)
>> +#define PRU_INTC_HMR(x)        (0x0800 + (x) * 4)
>> +#define PRU_INTC_HIPIR(x)    (0x0900 + (x) * 4)
>> +#define PRU_INTC_SIPR0        0x0d00
>> +#define PRU_INTC_SIPR1        0x0d04
>> +#define PRU_INTC_SITR0        0x0d80
>> +#define PRU_INTC_SITR1        0x0d84
>> +#define PRU_INTC_HINLR(x)    (0x1100 + (x) * 4)
>> +#define PRU_INTC_HIER        0x1500
>> +
>> +/* HIPIR register bit-fields */
>> +#define INTC_HIPIR_NONE_HINT    0x80000000
> 
> Unused macro. See below.

Will use the macro in the code.

> 
>> +
>> +/**
>> + * struct pruss_intc - PRUSS interrupt controller structure
>> + * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
>> + * @base: base virtual address of INTC register space
>> + * @irqchip: irq chip for this interrupt controller
>> + * @domain: irq domain for this interrupt controller
>> + * @lock: mutex to serialize access to INTC
>> + * @host_mask: indicate which HOST IRQs are enabled
>> + */
>> +struct pruss_intc {
>> +    unsigned int irqs[MAX_NUM_HOST_IRQS];
>> +    void __iomem *base;
>> +    struct irq_chip *irqchip;
>> +    struct irq_domain *domain;
>> +    struct mutex lock; /* PRUSS INTC lock */
>> +    u32 host_mask;

This is also unused in this patch, will move this to patch 4.

>> +};
>> +
>> +static inline u32 pruss_intc_read_reg(struct pruss_intc *intc,
>> unsigned int reg)
>> +{
>> +    return readl_relaxed(intc->base + reg);
>> +}
>> +
>> +static inline void pruss_intc_write_reg(struct pruss_intc *intc,
>> +                    unsigned int reg, u32 val)
>> +{
>> +    writel_relaxed(val, intc->base + reg);
>> +}
>> +
>> +static int pruss_intc_check_write(struct pruss_intc *intc, unsigned
>> int reg,
>> +                  unsigned int sysevent)
>> +{
>> +    if (!intc)
>> +        return -EINVAL;
>> +
>> +    if (sysevent >= MAX_PRU_SYS_EVENTS)
>> +        return -EINVAL;
>> +
>> +    pruss_intc_write_reg(intc, reg, sysevent);
>> +
>> +    return 0;
>> +}
>> +
>> +static void pruss_intc_init(struct pruss_intc *intc)
>> +{
>> +    int i;
>> +
>> +    /* configure polarity to active high for all system interrupts */
>> +    pruss_intc_write_reg(intc, PRU_INTC_SIPR0, 0xffffffff);
>> +    pruss_intc_write_reg(intc, PRU_INTC_SIPR1, 0xffffffff);
>> +
>> +    /* configure type to pulse interrupt for all system interrupts */
>> +    pruss_intc_write_reg(intc, PRU_INTC_SITR0, 0);
>> +    pruss_intc_write_reg(intc, PRU_INTC_SITR1, 0);
>> +
>> +    /* clear all 16 interrupt channel map registers */
>> +    for (i = 0; i < 16; i++)
>> +        pruss_intc_write_reg(intc, PRU_INTC_CMR(i), 0);
>> +
>> +    /* clear all 3 host interrupt map registers */
>> +    for (i = 0; i < 3; i++)
>> +        pruss_intc_write_reg(intc, PRU_INTC_HMR(i), 0);
>> +}
>> +
>> +static void pruss_intc_irq_ack(struct irq_data *data)
>> +{
>> +    struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>> +    unsigned int hwirq = data->hwirq;
>> +
>> +    pruss_intc_check_write(intc, PRU_INTC_SICR, hwirq);
>> +}
>> +
>> +static void pruss_intc_irq_mask(struct irq_data *data)
>> +{
>> +    struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>> +    unsigned int hwirq = data->hwirq;
>> +
>> +    pruss_intc_check_write(intc, PRU_INTC_EICR, hwirq);
>> +}
>> +
>> +static void pruss_intc_irq_unmask(struct irq_data *data)
>> +{
>> +    struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>> +    unsigned int hwirq = data->hwirq;
>> +
>> +    pruss_intc_check_write(intc, PRU_INTC_EISR, hwirq);
>> +}
>> +
>> +static int pruss_intc_irq_retrigger(struct irq_data *data)
>> +{
>> +    struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>> +    unsigned int hwirq = data->hwirq;
>> +
>> +    return pruss_intc_check_write(intc, PRU_INTC_SISR, hwirq);
>> +}
>> +
>> +static int pruss_intc_irq_reqres(struct irq_data *data)
>> +{
>> +    if (!try_module_get(THIS_MODULE))
>> +        return -ENODEV;
>> +
>> +    return 0;
>> +}
>> +
>> +static void pruss_intc_irq_relres(struct irq_data *data)
>> +{
>> +    module_put(THIS_MODULE);
>> +}
>> +
>> +static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned
>> int virq,
>> +                     irq_hw_number_t hw)
>> +{
>> +    struct pruss_intc *intc = d->host_data;
>> +
>> +    irq_set_chip_data(virq, intc);
>> +    irq_set_chip_and_handler(virq, intc->irqchip, handle_level_irq);
>> +
>> +    return 0;
>> +}
>> +
>> +static void pruss_intc_irq_domain_unmap(struct irq_domain *d,
>> unsigned int virq)
>> +{
>> +    irq_set_chip_and_handler(virq, NULL, NULL);
>> +    irq_set_chip_data(virq, NULL);
>> +}
>> +
>> +static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
>> +    .xlate    = irq_domain_xlate_onecell,
>> +    .map    = pruss_intc_irq_domain_map,
>> +    .unmap    = pruss_intc_irq_domain_unmap,
>> +};
>> +
>> +static void pruss_intc_irq_handler(struct irq_desc *desc)
>> +{
>> +    unsigned int irq = irq_desc_get_irq(desc);
>> +    struct irq_chip *chip = irq_desc_get_chip(desc);
>> +    struct pruss_intc *intc = irq_get_handler_data(irq);
>> +    u32 hipir;
>> +    unsigned int virq;
>> +    int i, hwirq;
>> +
>> +    chained_irq_enter(chip, desc);
>> +
>> +    /* find our host irq number */
>> +    for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
>> +        if (intc->irqs[i] == irq)
>> +            break;
>> +    if (i == MAX_NUM_HOST_IRQS)
>> +        goto err;
>> +
>> +    i += MIN_PRU_HOST_INT;
>> +
>> +    /* get highest priority pending PRUSS system event */
>> +    hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
>> +    while (!(hipir & BIT(31))) {
> 
> Is BIT(31) here supposed to be INTC_HIPIR_NONE_HINT?

Yes, will replace BIT(31) with the macro.

> 
>> +        hwirq = hipir & GENMASK(9, 0);
>> +        virq = irq_linear_revmap(intc->domain, hwirq);
>> +
>> +        /*
>> +         * NOTE: manually ACK any system events that do not have a
>> +         * handler mapped yet
>> +         */
>> +        if (unlikely(!virq))
>> +            pruss_intc_check_write(intc, PRU_INTC_SICR, hwirq);
>> +        else
>> +            generic_handle_irq(virq);
>> +
>> +        /* get next system event */
>> +        hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
>> +    }
>> +err:
>> +    chained_irq_exit(chip, desc);
>> +}
>> +
>> +static int pruss_intc_probe(struct platform_device *pdev)
>> +{
>> +    static const char * const irq_names[] = {
>> +                "host0", "host1", "host2", "host3",
>> +                "host4", "host5", "host6", "host7", };
>> +    struct device *dev = &pdev->dev;
>> +    struct pruss_intc *intc;
>> +    struct resource *res;
>> +    struct irq_chip *irqchip;
>> +    int i, irq;
>> +
>> +    intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
>> +    if (!intc)
>> +        return -ENOMEM;
>> +    platform_set_drvdata(pdev, intc);
>> +
>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +    intc->base = devm_ioremap_resource(dev, res);
>> +    if (IS_ERR(intc->base)) {
>> +        dev_err(dev, "failed to parse and map intc memory resource\n");
>> +        return PTR_ERR(intc->base);
>> +    }
>> +
>> +    dev_dbg(dev, "intc memory: pa %pa size 0x%zx va %pK\n", &res->start,
>> +        (size_t)resource_size(res), intc->base);
>> +
>> +    mutex_init(&intc->lock);
>> +
>> +    pruss_intc_init(intc);
>> +
>> +    irqchip = devm_kzalloc(dev, sizeof(*irqchip), GFP_KERNEL);
>> +    if (!irqchip)
>> +        return -ENOMEM;
>> +
>> +    irqchip->irq_ack = pruss_intc_irq_ack;
>> +    irqchip->irq_mask = pruss_intc_irq_mask;
>> +    irqchip->irq_unmask = pruss_intc_irq_unmask;
>> +    irqchip->irq_retrigger = pruss_intc_irq_retrigger;
>> +    irqchip->irq_request_resources = pruss_intc_irq_reqres;
>> +    irqchip->irq_release_resources = pruss_intc_irq_relres;
>> +    irqchip->name = dev_name(dev);
> 
> Should we also set `irqchip->parent_device = dev;` here?
> 
> I tried it and had to add pm runtime stuff as well, otherwise
> requesting irqs would fail.

I haven't seen any during my local testing. What sort of failure are you
seeing?

The clocking for the overall PRUSS module will be handled in either the
ti-sysc driver for OMAP SoCs or in the pruss platform driver.

> 
>> +    intc->irqchip = irqchip;
>> +
>> +    /* always 64 events */
>> +    intc->domain = irq_domain_add_linear(dev->of_node,
>> MAX_PRU_SYS_EVENTS,
>> +                         &pruss_intc_irq_domain_ops, intc);
>> +    if (!intc->domain)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
>> +        irq = platform_get_irq_byname(pdev, irq_names[i]);
>> +        if (irq < 0) {
>> +            dev_err(dev->parent, "platform_get_irq_byname failed for
>> %s : %d\n",
> 
> Why dev->parent instead of just dev?

Yeah, will fix this. It is a vestige from previous code where we were
actually parsing the interrupts from the PRUSS node instead of the PRUSS
INTC node.

> 
>> +                irq_names[i], irq);
>> +            goto fail_irq;
>> +        }
>> +
>> +        intc->irqs[i] = irq;
>> +        irq_set_handler_data(irq, intc);
>> +        irq_set_chained_handler(irq, pruss_intc_irq_handler);
>> +    }
>> +
>> +    return 0;
>> +
>> +fail_irq:
>> +    while (--i >= 0) {
>> +        if (intc->irqs[i])
>> +            irq_set_chained_handler_and_data(intc->irqs[i], NULL,
>> +                             NULL);
>> +    }
>> +    irq_domain_remove(intc->domain);
>> +    return irq;
>> +}
>> +
>> +static int pruss_intc_remove(struct platform_device *pdev)
>> +{
>> +    struct pruss_intc *intc = platform_get_drvdata(pdev);
>> +    unsigned int hwirq;
>> +    int i;
>> +
>> +    for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
>> +        if (intc->irqs[i])
>> +            irq_set_chained_handler_and_data(intc->irqs[i], NULL,
>> +                             NULL);
>> +    }
>> +
>> +    if (intc->domain) {
> 
> Is it actuall possible for intc->domain to be NULL here?

Nope, will remove it.

Thank you for all the review comments.

regards
Suman

> 
>> +        for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
>> +            irq_dispose_mapping(irq_find_mapping(intc->domain,
>> +                                 hwirq));
>> +        irq_domain_remove(intc->domain);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id pruss_intc_of_match[] = {
>> +    { .compatible = "ti,pruss-intc", },
>> +    { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, pruss_intc_of_match);
>> +
>> +static struct platform_driver pruss_intc_driver = {
>> +    .driver = {
>> +        .name = "pruss-intc",
>> +        .of_match_table = pruss_intc_of_match,
>> +    },
>> +    .probe  = pruss_intc_probe,
>> +    .remove = pruss_intc_remove,
>> +};
>> +module_platform_driver(pruss_intc_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
>> +MODULE_DESCRIPTION("TI PRU-ICSS INTC Driver");
>> +MODULE_LICENSE("GPL v2");
>>
> 

