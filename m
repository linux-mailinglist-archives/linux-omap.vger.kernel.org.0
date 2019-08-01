Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1AF7DF77
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 17:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731573AbfHAPwa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Aug 2019 11:52:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38736 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731593AbfHAPw3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Aug 2019 11:52:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71FpM9M097603;
        Thu, 1 Aug 2019 10:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564674682;
        bh=Piaf0yNg+MjDYASvDsZ47qt8n5CJXkN1ewP4GPFdIF4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nxJa66bak8aOx+Uemy+A1RpS7wwmfBQP00CjptcKs/wA7ULt4c15ytPtci4Gw5+Si
         dmIFAh5ywcJJjcsqCnZFTxIhJ/JDMii7HfAhLK/IkWuGy+AhNam9n2Rt+yBqy2IObM
         mcDqJV5q2z0BAhmn45gFOXaWt/NsY8M6NvorLQ9M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71FpMBD037539
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Aug 2019 10:51:22 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 10:51:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 10:51:21 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71FpL6p090525;
        Thu, 1 Aug 2019 10:51:21 -0500
Subject: Re: [PATCH v2 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190731224149.11153-1-s-anna@ti.com>
 <20190731224149.11153-3-s-anna@ti.com>
 <d0d539c2-4247-d74e-3bb2-ddb98e0bafb5@kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b58f0faf-f099-da0b-9451-8262df0f683e@ti.com>
Date:   Thu, 1 Aug 2019 10:51:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d0d539c2-4247-d74e-3bb2-ddb98e0bafb5@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

On 8/1/19 4:42 AM, Marc Zyngier wrote:
> On 31/07/2019 23:41, Suman Anna wrote:
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
>> event. The system events to interrupt channels and output interrupts
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
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>> v2: 
>>  - Addressed all of David Lechner's comments
>>  - Dropped irq_retrigger callback
>>  - Updated interrupt names from "hostX" to "host_intrX"
>>  - Moved host_mask variable to patch 4
>> v1: https://patchwork.kernel.org/patch/11034545/
>> v0: https://patchwork.kernel.org/patch/10795761/
>>
>>  drivers/irqchip/Kconfig          |  10 +
>>  drivers/irqchip/Makefile         |   1 +
>>  drivers/irqchip/irq-pruss-intc.c | 338 +++++++++++++++++++++++++++++++
>>  3 files changed, 349 insertions(+)
>>  create mode 100644 drivers/irqchip/irq-pruss-intc.c
>>
>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index 80e10f4e213a..dc6b5aa77a5d 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -471,6 +471,16 @@ config TI_SCI_INTA_IRQCHIP
>>  	  If you wish to use interrupt aggregator irq resources managed by the
>>  	  TI System Controller, say Y here. Otherwise, say N.
>>  
>> +config TI_PRUSS_INTC
>> +	tristate "TI PRU-ICSS Interrupt Controller"
>> +	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM437X || SOC_DRA7XX || ARCH_KEYSTONE
>> +	select IRQ_DOMAIN
>> +	help
>> +	   This enables support for the PRU-ICSS Local Interrupt Controller
>> +	   present within a PRU-ICSS subsystem present on various TI SoCs.
>> +	   The PRUSS INTC enables various interrupts to be routed to multiple
>> +	   different processors within the SoC.
>> +
>>  endmenu
>>  
>>  config SIFIVE_PLIC
>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index 8d0fcec6ab23..a02e652ca805 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -102,3 +102,4 @@ obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
>>  obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
>>  obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
>>  obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
>> +obj-$(CONFIG_TI_PRUSS_INTC)		+= irq-pruss-intc.o
>> diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
>> new file mode 100644
>> index 000000000000..4a9456544fd0
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-pruss-intc.c
>> @@ -0,0 +1,338 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * PRU-ICSS INTC IRQChip driver for various TI SoCs
>> + *
>> + * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
>> + *	Andrew F. Davis <afd@ti.com>
>> + *	Suman Anna <s-anna@ti.com>
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
>> + * Number of host interrupts reaching the main MPU sub-system. Note that this
>> + * is not the same as the total number of host interrupts supported by the PRUSS
>> + * INTC instance
>> + */
>> +#define MAX_NUM_HOST_IRQS	8
>> +
>> +/* minimum starting host interrupt number for MPU */
>> +#define MIN_PRU_HOST_INT	2
>> +
>> +/* maximum number of system events */
>> +#define MAX_PRU_SYS_EVENTS	64
>> +
>> +/* PRU_ICSS_INTC registers */
>> +#define PRU_INTC_REVID		0x0000
>> +#define PRU_INTC_CR		0x0004
>> +#define PRU_INTC_GER		0x0010
>> +#define PRU_INTC_GNLR		0x001c
>> +#define PRU_INTC_SISR		0x0020
>> +#define PRU_INTC_SICR		0x0024
>> +#define PRU_INTC_EISR		0x0028
>> +#define PRU_INTC_EICR		0x002c
>> +#define PRU_INTC_HIEISR		0x0034
>> +#define PRU_INTC_HIDISR		0x0038
>> +#define PRU_INTC_GPIR		0x0080
>> +#define PRU_INTC_SRSR0		0x0200
>> +#define PRU_INTC_SRSR1		0x0204
>> +#define PRU_INTC_SECR0		0x0280
>> +#define PRU_INTC_SECR1		0x0284
>> +#define PRU_INTC_ESR0		0x0300
>> +#define PRU_INTC_ESR1		0x0304
>> +#define PRU_INTC_ECR0		0x0380
>> +#define PRU_INTC_ECR1		0x0384
>> +#define PRU_INTC_CMR(x)		(0x0400 + (x) * 4)
>> +#define PRU_INTC_HMR(x)		(0x0800 + (x) * 4)
>> +#define PRU_INTC_HIPIR(x)	(0x0900 + (x) * 4)
>> +#define PRU_INTC_SIPR0		0x0d00
>> +#define PRU_INTC_SIPR1		0x0d04
>> +#define PRU_INTC_SITR0		0x0d80
>> +#define PRU_INTC_SITR1		0x0d84
>> +#define PRU_INTC_HINLR(x)	(0x1100 + (x) * 4)
>> +#define PRU_INTC_HIER		0x1500
>> +
>> +/* HIPIR register bit-fields */
>> +#define INTC_HIPIR_NONE_HINT	0x80000000
>> +
>> +/**
>> + * struct pruss_intc - PRUSS interrupt controller structure
>> + * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
>> + * @base: base virtual address of INTC register space
>> + * @irqchip: irq chip for this interrupt controller
>> + * @domain: irq domain for this interrupt controller
>> + * @lock: mutex to serialize access to INTC
>> + */
>> +struct pruss_intc {
>> +	unsigned int irqs[MAX_NUM_HOST_IRQS];
>> +	void __iomem *base;
>> +	struct irq_chip *irqchip;
>> +	struct irq_domain *domain;
>> +	struct mutex lock; /* PRUSS INTC lock */
> 
> Nothing seem to use that lock in this patch (other than to initialize it).

Correct, will move this to patch 4 where the actual usage is similar to
the host_mask move done in this version.

> 
>> +};
>> +
>> +static inline u32 pruss_intc_read_reg(struct pruss_intc *intc, unsigned int reg)
>> +{
>> +	return readl_relaxed(intc->base + reg);
>> +}
>> +
>> +static inline void pruss_intc_write_reg(struct pruss_intc *intc,
>> +					unsigned int reg, u32 val)
>> +{
>> +	writel_relaxed(val, intc->base + reg);
>> +}
>> +
>> +static int pruss_intc_check_write(struct pruss_intc *intc, unsigned int reg,
>> +				  unsigned int sysevent)
>> +{
>> +	if (!intc)
>> +		return -EINVAL;
>> +
>> +	if (sysevent >= MAX_PRU_SYS_EVENTS)
>> +		return -EINVAL;
> 
> How can any of these happen?  That'd be a bug in the driver surely.
> Also, nothing ever checks the return value.

Yeah, I think I can drop this. The ack/mask/unmask callbacks are all
void returning functions, but we do return the value in
irq_set_irqchip_state() callback added in patch 5 (will reorder that
patch for the next version). This is similar to the check in
gic_irq_set_irqchip_state().

> 
>> +
>> +	pruss_intc_write_reg(intc, reg, sysevent);
>> +
>> +	return 0;
>> +}
>> +
>> +static void pruss_intc_init(struct pruss_intc *intc)
>> +{
>> +	int i;
>> +
>> +	/* configure polarity to active high for all system interrupts */
>> +	pruss_intc_write_reg(intc, PRU_INTC_SIPR0, 0xffffffff);
>> +	pruss_intc_write_reg(intc, PRU_INTC_SIPR1, 0xffffffff);
>> +
>> +	/* configure type to pulse interrupt for all system interrupts */
>> +	pruss_intc_write_reg(intc, PRU_INTC_SITR0, 0);
>> +	pruss_intc_write_reg(intc, PRU_INTC_SITR1, 0);
>> +
>> +	/* clear all 16 interrupt channel map registers */
>> +	for (i = 0; i < 16; i++)
>> +		pruss_intc_write_reg(intc, PRU_INTC_CMR(i), 0);
>> +
>> +	/* clear all 3 host interrupt map registers */
>> +	for (i = 0; i < 3; i++)
>> +		pruss_intc_write_reg(intc, PRU_INTC_HMR(i), 0);
>> +}
>> +
>> +static void pruss_intc_irq_ack(struct irq_data *data)
>> +{
>> +	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>> +	unsigned int hwirq = data->hwirq;
>> +
>> +	pruss_intc_check_write(intc, PRU_INTC_SICR, hwirq);
>> +}
>> +
>> +static void pruss_intc_irq_mask(struct irq_data *data)
>> +{
>> +	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>> +	unsigned int hwirq = data->hwirq;
>> +
>> +	pruss_intc_check_write(intc, PRU_INTC_EICR, hwirq);
>> +}
>> +
>> +static void pruss_intc_irq_unmask(struct irq_data *data)
>> +{
>> +	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>> +	unsigned int hwirq = data->hwirq;
>> +
>> +	pruss_intc_check_write(intc, PRU_INTC_EISR, hwirq);
>> +}
>> +
>> +static int pruss_intc_irq_reqres(struct irq_data *data)
>> +{
>> +	if (!try_module_get(THIS_MODULE))
>> +		return -ENODEV;
>> +
>> +	return 0;
>> +}
>> +
>> +static void pruss_intc_irq_relres(struct irq_data *data)
>> +{
>> +	module_put(THIS_MODULE);
>> +}
>> +
>> +static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
>> +				     irq_hw_number_t hw)
>> +{
>> +	struct pruss_intc *intc = d->host_data;
>> +
>> +	irq_set_chip_data(virq, intc);
>> +	irq_set_chip_and_handler(virq, intc->irqchip, handle_level_irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static void pruss_intc_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
>> +{
>> +	irq_set_chip_and_handler(virq, NULL, NULL);
>> +	irq_set_chip_data(virq, NULL);
>> +}
>> +
>> +static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
>> +	.xlate	= irq_domain_xlate_onecell,
>> +	.map	= pruss_intc_irq_domain_map,
>> +	.unmap	= pruss_intc_irq_domain_unmap,
>> +};
>> +
>> +static void pruss_intc_irq_handler(struct irq_desc *desc)
>> +{
>> +	unsigned int irq = irq_desc_get_irq(desc);
>> +	struct irq_chip *chip = irq_desc_get_chip(desc);
>> +	struct pruss_intc *intc = irq_get_handler_data(irq);
>> +	u32 hipir;
>> +	unsigned int virq;
>> +	int i, hwirq;
>> +
>> +	chained_irq_enter(chip, desc);
>> +
>> +	/* find our host irq number */
>> +	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
>> +		if (intc->irqs[i] == irq)
>> +			break;
>> +	if (i == MAX_NUM_HOST_IRQS)
>> +		goto err;
>> +
>> +	i += MIN_PRU_HOST_INT;
>> +
>> +	/* get highest priority pending PRUSS system event */
>> +	hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
>> +	while (!(hipir & INTC_HIPIR_NONE_HINT)) {
>> +		hwirq = hipir & GENMASK(9, 0);
>> +		virq = irq_linear_revmap(intc->domain, hwirq);
>> +
>> +		/*
>> +		 * NOTE: manually ACK any system events that do not have a
>> +		 * handler mapped yet
>> +		 */
>> +		if (unlikely(!virq))
>> +			pruss_intc_check_write(intc, PRU_INTC_SICR, hwirq);
> 
> How were they configured the first place?

Ideally, this should not occur, I probably should add a WARN_ON here
catching any misuse. The PRUSS INTC is touched by multiple processors,
and each of them have to use some of the same registers to ack the
internal event. The current design is limited to only acking and
triggering the interrupts from PRU firmwares while the mappings are all
done by Linux. We are forced to do this to save some instruction space
in the tiny Instruction RAM that the PRUs (smallest is 4K and largest is
12K) have.

> 
>> +		else
>> +			generic_handle_irq(virq);
>> +
>> +		/* get next system event */
>> +		hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
>> +	}
>> +err:
>> +	chained_irq_exit(chip, desc);
>> +}
>> +
>> +static int pruss_intc_probe(struct platform_device *pdev)
>> +{
>> +	static const char * const irq_names[] = {
> 
> Should this be sized with MAX_NUM_HOST_IRQS, given that this is how you
> parse it?

Yes, will update in the next version.

> 
>> +		"host_intr0", "host_intr1", "host_intr2", "host_intr3",
>> +		"host_intr4", "host_intr5", "host_intr6", "host_intr7", };
>> +	struct device *dev = &pdev->dev;
>> +	struct pruss_intc *intc;
>> +	struct resource *res;
>> +	struct irq_chip *irqchip;
>> +	int i, irq;
>> +
>> +	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
>> +	if (!intc)
>> +		return -ENOMEM;
>> +	platform_set_drvdata(pdev, intc);
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	intc->base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(intc->base)) {
>> +		dev_err(dev, "failed to parse and map intc memory resource\n");
>> +		return PTR_ERR(intc->base);
>> +	}
>> +
>> +	dev_dbg(dev, "intc memory: pa %pa size 0x%zx va %pK\n", &res->start,
>> +		(size_t)resource_size(res), intc->base);
>> +
>> +	mutex_init(&intc->lock);
>> +
>> +	pruss_intc_init(intc);
>> +
>> +	irqchip = devm_kzalloc(dev, sizeof(*irqchip), GFP_KERNEL);
>> +	if (!irqchip)
>> +		return -ENOMEM;
>> +
>> +	irqchip->irq_ack = pruss_intc_irq_ack;
>> +	irqchip->irq_mask = pruss_intc_irq_mask;
>> +	irqchip->irq_unmask = pruss_intc_irq_unmask;
>> +	irqchip->irq_request_resources = pruss_intc_irq_reqres;
>> +	irqchip->irq_release_resources = pruss_intc_irq_relres;
>> +	irqchip->name = dev_name(dev);
>> +	intc->irqchip = irqchip;
> 
> Given that each and every pruss_intc ends up with a pointer to its own
> irqchip, why is it a separate allocation instead of directly embedding
> the structure?
> 
> Alternatively, have a single 'static const struct irq_chip' and lose the
> slightly pointless dev_name as the irqchip name.

Agreed, this can be optimized.

> 
>> +
>> +	/* always 64 events */
>> +	intc->domain = irq_domain_add_linear(dev->of_node, MAX_PRU_SYS_EVENTS,
>> +					     &pruss_intc_irq_domain_ops, intc);
>> +	if (!intc->domain)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
>> +		irq = platform_get_irq_byname(pdev, irq_names[i]);
>> +		if (irq < 0) {
> 
> irq == 0 is also an error.

OK, will fix.

> 
>> +			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
>> +				irq_names[i], irq);
>> +			goto fail_irq;
>> +		}
>> +
>> +		intc->irqs[i] = irq;
>> +		irq_set_handler_data(irq, intc);
>> +		irq_set_chained_handler(irq, pruss_intc_irq_handler);
>> +	}
>> +
>> +	return 0;
>> +
>> +fail_irq:
>> +	while (--i >= 0) {
>> +		if (intc->irqs[i])
> 
> This 'if' seems supperfluous.

So, some interrupts among the MAX_NUM_HOST_IRQS are not connected to the
Arm processor on some SoCs. I will move this check to the next patch
which introduces the skipping of interrupts.

> 
>> +			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
>> +							 NULL);
>> +	}
>> +	irq_domain_remove(intc->domain);
>> +	return irq;
>> +}
>> +
>> +static int pruss_intc_remove(struct platform_device *pdev)
>> +{
>> +	struct pruss_intc *intc = platform_get_drvdata(pdev);
>> +	unsigned int hwirq;
>> +	int i;
>> +
>> +	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
>> +		if (intc->irqs[i])
> 
> Same here.

Will move this as well.

> 
>> +			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
>> +							 NULL);
>> +	}
>> +
>> +	for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
>> +		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
>> +	irq_domain_remove(intc->domain);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id pruss_intc_of_match[] = {
>> +	{ .compatible = "ti,pruss-intc", },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, pruss_intc_of_match);
>> +
>> +static struct platform_driver pruss_intc_driver = {
>> +	.driver = {
>> +		.name = "pruss-intc",
>> +		.of_match_table = pruss_intc_of_match,
>> +	},
>> +	.probe  = pruss_intc_probe,
>> +	.remove = pruss_intc_remove,
>> +};
>> +module_platform_driver(pruss_intc_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
>> +MODULE_DESCRIPTION("TI PRU-ICSS INTC Driver");
>> +MODULE_LICENSE("GPL v2");
>>
> 
> Thanks,
> 	

Thank you for all the review comments.

regards
Suman

