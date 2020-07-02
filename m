Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD90E212605
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 16:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbgGBOT6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 10:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729643AbgGBOT5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jul 2020 10:19:57 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B59C08C5DC
        for <linux-omap@vger.kernel.org>; Thu,  2 Jul 2020 07:19:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s1so32403434ljo.0
        for <linux-omap@vger.kernel.org>; Thu, 02 Jul 2020 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e2p7Qgo0iovqEwvWwPOoN8STIZ8vtZ2v+ghlQhOSJCg=;
        b=Nl6KDI+LgqLnFpFPYAzowFno0hi/vDCI21qHMyn7odZ2qli1bBWHO05yQlC0/dYaIF
         FUnbACAdnpUCO7jctCGmLvoT/dk+gpUJut3Io5TKHeRMjNMdJ7nxGvsiSDCO8/p/D09R
         RNpI/u/t4Axup0n4XkhYMwx+Tb3XqTm9Gk1GqZG1ECMeSiupYhRq7GZX3Mv56LYwH1Sz
         OajzlhlzCIQiRnWfdsDpljYWlWljLZzrfGEBEz+ggvu8BlpxEVuCASv4OLovLxKJlUzX
         aAIKTzKh5jvOwY0rdU75B4qM3kSG28iMixHARiUuhKl1RwLI/lRHwyjSUmfO/H0bFl3K
         htyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e2p7Qgo0iovqEwvWwPOoN8STIZ8vtZ2v+ghlQhOSJCg=;
        b=uOdhdw6Ve59x1i9MSoLfR8EkVKwl7/azn3aNCT4SxgGRCPUmjHMHuNm4j2qRIYFrir
         wj5rQb8P11d6YEKJjUkmHG8MDH+vWH2ZsOf64JYInUc0GfAStwuRm54CpNUO0LDw1SAi
         uk5BbIvoYaqGPnQIPbuStuMahJPeruDKeQXtkwL3zBAhALe/2yhHygeWe4TcI7Q3otBz
         UkWC2li0vrqSwGmk5YtNJWz8JxcwpFHMwaaHCfKtPzFQmUX3d0H435Lnjov7Q+7iwEaW
         8EJyw8orQ7Gytyd31hH7rro5GDLeKUfQFJoQeOW3AyFAsGbZrWB+oU6ujyMT9MEQRjlg
         LAww==
X-Gm-Message-State: AOAM533YbZCL+2PCmbQEEEa0md/jwc/Wai0dDu8dl/Mwb+VocW5DYLtB
        IqkEQUc1gnKVF3JAhCJXYDk0WA==
X-Google-Smtp-Source: ABdhPJzyUKSmz+PE35gMoMF4kQzhuI1GIF5mxttGufnvlTrtqClntsjKhFxyRkXfllm9nWYyskZfUg==
X-Received: by 2002:a2e:7116:: with SMTP id m22mr13912368ljc.271.1593699595616;
        Thu, 02 Jul 2020 07:19:55 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id v10sm692581ljg.113.2020.07.02.07.19.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 07:19:55 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCHv3 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS interrupts
Date:   Thu,  2 Jul 2020 16:17:55 +0200
Message-Id: <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Programmable Real-Time Unit Subsystem (PRUSS) contains a local
interrupt controller (INTC) that can handle various system input events
and post interrupts back to the device-level initiators. The INTC can
support upto 64 input events with individual control configuration and
hardware prioritization. These events are mapped onto 10 output interrupt
lines through two levels of many-to-one mapping support. Different
interrupt lines are routed to the individual PRU cores or to the host
CPU, or to other devices on the SoC. Some of these events are sourced
from peripherals or other sub-modules within that PRUSS, while a few
others are sourced from SoC-level peripherals/devices.

The PRUSS INTC platform driver manages this PRUSS interrupt controller
and implements an irqchip driver to provide a Linux standard way for
the PRU client users to enable/disable/ack/re-trigger a PRUSS system
event. The system events to interrupt channels and output interrupts
relies on the mapping configuration provided either through the PRU
firmware blob or via the PRU application's device tree node. The
mappings will be programmed during the boot/shutdown of a PRU core.

The PRUSS INTC module is reference counted during the interrupt
setup phase through the irqchip's irq_request_resources() and
irq_release_resources() ops. This restricts the module from being
removed as long as there are active interrupt users.

The driver currently supports and can be built for OMAP architecture
based AM335x, AM437x and AM57xx SoCs; Keystone2 architecture based
66AK2G SoCs and Davinci architecture based OMAP-L13x/AM18x/DA850 SoCs.
All of these SoCs support 64 system events, 10 interrupt channels and
10 output interrupt lines per PRUSS INTC with a few SoC integration
differences.

NOTE:
Each PRU-ICSS's INTC on AM57xx SoCs is preceded by a Crossbar that
enables multiple external events to be routed to a specific number
of input interrupt events. Any non-default external interrupt event
directed towards PRUSS needs this crossbar to be setup properly.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
---
v2->v3:
- use single irqchip description instead of separately allocating it for
  each pruss_intc
- get rid of unused mutex
- improve error handling
v1->v2:
- https://patchwork.kernel.org/patch/11069771/
---
 drivers/irqchip/Kconfig          |  10 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-pruss-intc.c | 307 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 318 insertions(+)
 create mode 100644 drivers/irqchip/irq-pruss-intc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 29fead2..733d7ec 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -493,6 +493,16 @@ config TI_SCI_INTA_IRQCHIP
 	  If you wish to use interrupt aggregator irq resources managed by the
 	  TI System Controller, say Y here. Otherwise, say N.
 
+config TI_PRUSS_INTC
+	tristate "TI PRU-ICSS Interrupt Controller"
+	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
+	select IRQ_DOMAIN
+	help
+	   This enables support for the PRU-ICSS Local Interrupt Controller
+	   present within a PRU-ICSS subsystem present on various TI SoCs.
+	   The PRUSS INTC enables various interrupts to be routed to multiple
+	   different processors within the SoC.
+
 config RISCV_INTC
 	bool "RISC-V Local Interrupt Controller"
 	depends on RISCV
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 133f9c4..990a106 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
 obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
 obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
 obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
+obj-$(CONFIG_TI_PRUSS_INTC)		+= irq-pruss-intc.o
 obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
 obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
 obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
new file mode 100644
index 0000000..fb3dda3
--- /dev/null
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PRU-ICSS INTC IRQChip driver for various TI SoCs
+ *
+ * Copyright (C) 2016-2020 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+/*
+ * Number of host interrupts reaching the main MPU sub-system. Note that this
+ * is not the same as the total number of host interrupts supported by the PRUSS
+ * INTC instance
+ */
+#define MAX_NUM_HOST_IRQS	8
+
+/* minimum starting host interrupt number for MPU */
+#define MIN_PRU_HOST_INT	2
+
+/* maximum number of system events */
+#define MAX_PRU_SYS_EVENTS	64
+
+/* PRU_ICSS_INTC registers */
+#define PRU_INTC_REVID		0x0000
+#define PRU_INTC_CR		0x0004
+#define PRU_INTC_GER		0x0010
+#define PRU_INTC_GNLR		0x001c
+#define PRU_INTC_SISR		0x0020
+#define PRU_INTC_SICR		0x0024
+#define PRU_INTC_EISR		0x0028
+#define PRU_INTC_EICR		0x002c
+#define PRU_INTC_HIEISR		0x0034
+#define PRU_INTC_HIDISR		0x0038
+#define PRU_INTC_GPIR		0x0080
+#define PRU_INTC_SRSR0		0x0200
+#define PRU_INTC_SRSR1		0x0204
+#define PRU_INTC_SECR0		0x0280
+#define PRU_INTC_SECR1		0x0284
+#define PRU_INTC_ESR0		0x0300
+#define PRU_INTC_ESR1		0x0304
+#define PRU_INTC_ECR0		0x0380
+#define PRU_INTC_ECR1		0x0384
+#define PRU_INTC_CMR(x)		(0x0400 + (x) * 4)
+#define PRU_INTC_HMR(x)		(0x0800 + (x) * 4)
+#define PRU_INTC_HIPIR(x)	(0x0900 + (x) * 4)
+#define PRU_INTC_SIPR0		0x0d00
+#define PRU_INTC_SIPR1		0x0d04
+#define PRU_INTC_SITR0		0x0d80
+#define PRU_INTC_SITR1		0x0d84
+#define PRU_INTC_HINLR(x)	(0x1100 + (x) * 4)
+#define PRU_INTC_HIER		0x1500
+
+/* HIPIR register bit-fields */
+#define INTC_HIPIR_NONE_HINT	0x80000000
+
+/**
+ * struct pruss_intc - PRUSS interrupt controller structure
+ * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
+ * @base: base virtual address of INTC register space
+ * @domain: irq domain for this interrupt controller
+ */
+struct pruss_intc {
+	unsigned int irqs[MAX_NUM_HOST_IRQS];
+	void __iomem *base;
+	struct irq_domain *domain;
+};
+
+static inline u32 pruss_intc_read_reg(struct pruss_intc *intc, unsigned int reg)
+{
+	return readl_relaxed(intc->base + reg);
+}
+
+static inline void pruss_intc_write_reg(struct pruss_intc *intc,
+					unsigned int reg, u32 val)
+{
+	writel_relaxed(val, intc->base + reg);
+}
+
+static void pruss_intc_init(struct pruss_intc *intc)
+{
+	int i;
+
+	/* configure polarity to active high for all system interrupts */
+	pruss_intc_write_reg(intc, PRU_INTC_SIPR0, 0xffffffff);
+	pruss_intc_write_reg(intc, PRU_INTC_SIPR1, 0xffffffff);
+
+	/* configure type to pulse interrupt for all system interrupts */
+	pruss_intc_write_reg(intc, PRU_INTC_SITR0, 0);
+	pruss_intc_write_reg(intc, PRU_INTC_SITR1, 0);
+
+	/* clear all 16 interrupt channel map registers */
+	for (i = 0; i < 16; i++)
+		pruss_intc_write_reg(intc, PRU_INTC_CMR(i), 0);
+
+	/* clear all 3 host interrupt map registers */
+	for (i = 0; i < 3; i++)
+		pruss_intc_write_reg(intc, PRU_INTC_HMR(i), 0);
+}
+
+static void pruss_intc_irq_ack(struct irq_data *data)
+{
+	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
+	unsigned int hwirq = data->hwirq;
+
+	pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
+}
+
+static void pruss_intc_irq_mask(struct irq_data *data)
+{
+	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
+	unsigned int hwirq = data->hwirq;
+
+	pruss_intc_write_reg(intc, PRU_INTC_EICR, hwirq);
+}
+
+static void pruss_intc_irq_unmask(struct irq_data *data)
+{
+	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
+	unsigned int hwirq = data->hwirq;
+
+	pruss_intc_write_reg(intc, PRU_INTC_EISR, hwirq);
+}
+
+static int pruss_intc_irq_reqres(struct irq_data *data)
+{
+	if (!try_module_get(THIS_MODULE))
+		return -ENODEV;
+
+	return 0;
+}
+
+static void pruss_intc_irq_relres(struct irq_data *data)
+{
+	module_put(THIS_MODULE);
+}
+
+static struct irq_chip pruss_irqchip = {
+	.name = "pruss-intc",
+	.irq_ack = pruss_intc_irq_ack,
+	.irq_mask = pruss_intc_irq_mask,
+	.irq_unmask = pruss_intc_irq_unmask,
+	.irq_request_resources = pruss_intc_irq_reqres,
+	.irq_release_resources = pruss_intc_irq_relres,
+};
+
+static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
+				     irq_hw_number_t hw)
+{
+	struct pruss_intc *intc = d->host_data;
+
+	irq_set_chip_data(virq, intc);
+	irq_set_chip_and_handler(virq, &pruss_irqchip, handle_level_irq);
+
+	return 0;
+}
+
+static void pruss_intc_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
+{
+	irq_set_chip_and_handler(virq, NULL, NULL);
+	irq_set_chip_data(virq, NULL);
+}
+
+static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
+	.xlate	= irq_domain_xlate_onecell,
+	.map	= pruss_intc_irq_domain_map,
+	.unmap	= pruss_intc_irq_domain_unmap,
+};
+
+static void pruss_intc_irq_handler(struct irq_desc *desc)
+{
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct pruss_intc *intc = irq_get_handler_data(irq);
+	u32 hipir;
+	unsigned int virq;
+	int i, hwirq;
+
+	chained_irq_enter(chip, desc);
+
+	/* find our host irq number */
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
+		if (intc->irqs[i] == irq)
+			break;
+	if (i == MAX_NUM_HOST_IRQS)
+		goto err;
+
+	i += MIN_PRU_HOST_INT;
+
+	/* get highest priority pending PRUSS system event */
+	hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
+	while (!(hipir & INTC_HIPIR_NONE_HINT)) {
+		hwirq = hipir & GENMASK(9, 0);
+		virq = irq_linear_revmap(intc->domain, hwirq);
+
+		/*
+		 * NOTE: manually ACK any system events that do not have a
+		 * handler mapped yet
+		 */
+		if (WARN_ON(!virq))
+			pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
+		else
+			generic_handle_irq(virq);
+
+		/* get next system event */
+		hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
+	}
+err:
+	chained_irq_exit(chip, desc);
+}
+
+static int pruss_intc_probe(struct platform_device *pdev)
+{
+	static const char * const irq_names[MAX_NUM_HOST_IRQS] = {
+		"host_intr0", "host_intr1", "host_intr2", "host_intr3",
+		"host_intr4", "host_intr5", "host_intr6", "host_intr7", };
+	struct device *dev = &pdev->dev;
+	struct pruss_intc *intc;
+	int i, irq;
+
+	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
+	if (!intc)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, intc);
+
+	intc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(intc->base)) {
+		dev_err(dev, "failed to parse and map intc memory resource\n");
+		return PTR_ERR(intc->base);
+	}
+
+	pruss_intc_init(intc);
+
+	/* always 64 events */
+	intc->domain = irq_domain_add_linear(dev->of_node, MAX_PRU_SYS_EVENTS,
+					     &pruss_intc_irq_domain_ops, intc);
+	if (!intc->domain)
+		return -ENOMEM;
+
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		irq = platform_get_irq_byname(pdev, irq_names[i]);
+		if (irq <= 0) {
+			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
+				irq_names[i], irq);
+			goto fail_irq;
+		}
+
+		intc->irqs[i] = irq;
+		irq_set_handler_data(irq, intc);
+		irq_set_chained_handler(irq, pruss_intc_irq_handler);
+	}
+
+	return 0;
+
+fail_irq:
+	while (--i >= 0)
+		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
+
+	irq_domain_remove(intc->domain);
+
+	return irq;
+}
+
+static int pruss_intc_remove(struct platform_device *pdev)
+{
+	struct pruss_intc *intc = platform_get_drvdata(pdev);
+	unsigned int hwirq;
+	int i;
+
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
+		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
+
+	for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
+
+	irq_domain_remove(intc->domain);
+
+	return 0;
+}
+
+static const struct of_device_id pruss_intc_of_match[] = {
+	{ .compatible = "ti,pruss-intc", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, pruss_intc_of_match);
+
+static struct platform_driver pruss_intc_driver = {
+	.driver = {
+		.name = "pruss-intc",
+		.of_match_table = pruss_intc_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe  = pruss_intc_probe,
+	.remove = pruss_intc_remove,
+};
+module_platform_driver(pruss_intc_driver);
+
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
+MODULE_DESCRIPTION("TI PRU-ICSS INTC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

