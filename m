Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CC023065E
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 11:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbgG1JTz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 05:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgG1JTy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 05:19:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6E8C061794
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so20357975ljm.1
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kmJKjS4qiWPT37eLPhQwDnE9C1y2auzSeyxFpWzqSLw=;
        b=PpRC/2HJRmWMQs+Vj3R6hbuC6GAVaAAXGdgs0ToOFVEvG/GknaVGMGYnmypKrUY68Q
         nvKqcXB3dfivRiF2YMBhWPWoK9R8kksk+EcUzxbGEoKuHrzq+ry+kD0Xz0S5eHDQBnv9
         VEFfhcfmeWil9Iw1+wyp5Jf1pSU2INlz7GVdPZ7H1kdNsLMge/2Rf53uw7qPqoPVxgGZ
         F+G4bCgSOgid59AUD+pY0R2UDfsm2THRouV1xrxurL0BZ/sG0YN8rdQL39QIJWMxfL/F
         BxbxS6CqAC0S5ZgihsW7/MtYJAxIDyrA5YaIjS6zqqcBHMD8j4mSheZmNYikHXhtyExf
         UN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kmJKjS4qiWPT37eLPhQwDnE9C1y2auzSeyxFpWzqSLw=;
        b=fp33R4u9Oe8bMM+YcrQmiUXoiE9Y2VZ3IVTngOSqZUAqqeV5QLG4olOiHTxMQlTpNk
         Ej+1QQTEoRAzW/hPN3ndTxGqYi/4ZBvRjAblaU+Ecvbqo87NXsB4IY9V50xD0snETC2b
         NGL9VtjBJ0B6V6fFx+unauS7EnJLIQJIgaZtzoKCQdVDetH0IgowX2U9KMyfDf2zMQUI
         EtL3rFCHE7TnWJjiR93LPg83Agt9WrgxafwnhZJuwTDkHNXMAUUsH7YxZ8o1gyCpdZDT
         4E811rddNjbmBTo58c7w21QcxPdE7fncWdYKRh5TFqBuebAx6ICBalS69REDx1nQpJJZ
         X0WQ==
X-Gm-Message-State: AOAM530pcBFgLoc9sET/zaY3hu2gNuo90QwkEHZ5LtVECRRlPxJOMy2u
        +SWdfRdHWwRzx2c8YaIz6izvxg==
X-Google-Smtp-Source: ABdhPJzx6PzEvfb1y/KGPrQs1wt2WFL2zPRCb1WqnESJEREXbUfKWOwQC5OUzH+yeBEg2KlMBD1j2w==
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr12689451ljj.283.1595927992066;
        Tue, 28 Jul 2020 02:19:52 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id q22sm3643270lfc.33.2020.07.28.02.19.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:19:51 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com, praneeth@ti.com, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH v4 2/5] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS interrupts
Date:   Tue, 28 Jul 2020 11:18:35 +0200
Message-Id: <1595927918-19845-3-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

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
firmware blob (for interrupts routed to PRU cores) or via the PRU
application's device tree node (for interrupt routed to the main CPU).
In the first case the mappings will be programmed on PRU remoteproc
driver demand (via irq_create_fwspec_mapping) during the boot of a PRU
core and cleaned up after the PRU core is stopped.

Reference counting is used to allow multiple system events to share a
single channel and to allow multiple channels to share a single host
event.

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
---
v3->v4:
- Introduce new structure for host_irq data and associate it to the
  chained interrupt handler.
- Improve pruss_intc_irq_handler: get use of new host_irq data
  structure; improve while loop to use one register read; convert
  WARN_ON to WARN_ON_ONCE.
- Convert irq_linear_revmap into irq_find_mapping.
- Clarify information about PRU system events type (edge vs level) by
  introducing proper updates to the driver description.
- Squash generic part of "irqchip/irq-pruss-intc: Add support for ICSSG
  INTC on K3 SoCs" patch into this one - it allows to reduce entire
  patchset diff.
- Drop reviewed-by due to introduced changes.
- Extend module authors list.
- Squash patch #6 of previous patchset "irqchip/irq-pruss-intc: Add
  event mapping support" into this one and introduce below changes:
  - Get rid of the two distinct code paths in the xlate function and allow
    to proceed only with 3 parameters description
    (system_event/channel/host_irq).
  - Improve error messages and introduce code simplification.
  - Add extra logic to xlate function which allows to validate existing
    interrupt routing violation.
  - Relax map/unmap validation due to introduced changes in xlate
    function.
  - Update commit log description.
v2->v3:
- use single irqchip description instead of separately allocating it for
  each pruss_intc
- get rid of unused mutex
- improve error handling
v1->v2:
- https://patchwork.kernel.org/patch/11069771/
---
 drivers/irqchip/Kconfig          |  10 +
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-pruss-intc.c | 591 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 602 insertions(+)
 create mode 100644 drivers/irqchip/irq-pruss-intc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 216b3b8..03e6ac1 100644
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
index 0000000..45b966a
--- /dev/null
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -0,0 +1,591 @@
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
+#define PRU_INTC_SRSR(x)	(0x0200 + (x) * 4)
+#define PRU_INTC_SECR(x)	(0x0280 + (x) * 4)
+#define PRU_INTC_ESR(x)		(0x0300 + (x) * 4)
+#define PRU_INTC_ECR(x)		(0x0380 + (x) * 4)
+#define PRU_INTC_CMR(x)		(0x0400 + (x) * 4)
+#define PRU_INTC_HMR(x)		(0x0800 + (x) * 4)
+#define PRU_INTC_HIPIR(x)	(0x0900 + (x) * 4)
+#define PRU_INTC_SIPR(x)	(0x0d00 + (x) * 4)
+#define PRU_INTC_SITR(x)	(0x0d80 + (x) * 4)
+#define PRU_INTC_HINLR(x)	(0x1100 + (x) * 4)
+#define PRU_INTC_HIER		0x1500
+
+/* CMR register bit-field macros */
+#define CMR_EVT_MAP_MASK	0xf
+#define CMR_EVT_MAP_BITS	8
+#define CMR_EVT_PER_REG		4
+
+/* HMR register bit-field macros */
+#define HMR_CH_MAP_MASK		0xf
+#define HMR_CH_MAP_BITS		8
+#define HMR_CH_PER_REG		4
+
+/* HIPIR register bit-fields */
+#define INTC_HIPIR_NONE_HINT	0x80000000
+
+#define MAX_PRU_SYS_EVENTS 160
+#define MAX_PRU_CHANNELS 20
+
+/**
+ * struct pruss_intc_map_record - keeps track of actual mapping state
+ * @value: The currently mapped value (channel or host)
+ * @ref_count: Keeps track of number of current users of this resource
+ */
+struct pruss_intc_map_record {
+	u8 value;
+	u8 ref_count;
+};
+
+/**
+ * struct pruss_intc_match_data - match data to handle SoC variations
+ * @num_system_events: number of input system events handled by the PRUSS INTC
+ * @num_host_intrs: number of host interrupts supported by the PRUSS INTC
+ */
+struct pruss_intc_match_data {
+	u8 num_system_events;
+	u8 num_host_intrs;
+};
+
+/**
+ * struct pruss_intc - PRUSS interrupt controller structure
+ * @event_channel: current state of system event to channel mappings
+ * @channel_host: current state of channel to host mappings
+ * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
+ * @base: base virtual address of INTC register space
+ * @domain: irq domain for this interrupt controller
+ * @soc_config: cached PRUSS INTC IP configuration data
+ * @dev: PRUSS INTC device pointer
+ * @lock: mutex to serialize access to INTC
+ */
+struct pruss_intc {
+	struct pruss_intc_map_record event_channel[MAX_PRU_SYS_EVENTS];
+	struct pruss_intc_map_record channel_host[MAX_PRU_CHANNELS];
+	unsigned int irqs[MAX_NUM_HOST_IRQS];
+	void __iomem *base;
+	struct irq_domain *domain;
+	const struct pruss_intc_match_data *soc_config;
+	struct device *dev;
+	struct mutex lock; /* PRUSS INTC lock */
+};
+
+/**
+ * struct pruss_host_irq_data - PRUSS host irq data structure
+ * @intc: PRUSS interrupt controller pointer
+ * @host_irq: host irq number
+ */
+struct pruss_host_irq_data {
+	struct pruss_intc *intc;
+	u8 host_irq;
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
+static void pruss_intc_update_cmr(struct pruss_intc *intc, int evt, s8 ch)
+{
+	u32 idx, offset, val;
+
+	idx = evt / CMR_EVT_PER_REG;
+	offset = (evt % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS;
+
+	val = pruss_intc_read_reg(intc, PRU_INTC_CMR(idx));
+	val &= ~(CMR_EVT_MAP_MASK << offset);
+	val |= ch << offset;
+	pruss_intc_write_reg(intc, PRU_INTC_CMR(idx), val);
+
+	dev_dbg(intc->dev, "SYSEV%u -> CH%d (CMR%d 0x%08x)\n", evt, ch,
+		idx, pruss_intc_read_reg(intc, PRU_INTC_CMR(idx)));
+}
+
+static void pruss_intc_update_hmr(struct pruss_intc *intc, int ch, s8 host)
+{
+	u32 idx, offset, val;
+
+	idx = ch / HMR_CH_PER_REG;
+	offset = (ch % HMR_CH_PER_REG) * HMR_CH_MAP_BITS;
+
+	val = pruss_intc_read_reg(intc, PRU_INTC_HMR(idx));
+	val &= ~(HMR_CH_MAP_MASK << offset);
+	val |= host << offset;
+	pruss_intc_write_reg(intc, PRU_INTC_HMR(idx), val);
+
+	dev_dbg(intc->dev, "CH%d -> HOST%d (HMR%d 0x%08x)\n", ch, host, idx,
+		pruss_intc_read_reg(intc, PRU_INTC_HMR(idx)));
+}
+
+/**
+ * pruss_intc_map() - configure the PRUSS INTC
+ * @intc: PRUSS interrupt controller pointer
+ * @hwirq: the system event number
+ *
+ * Configures the PRUSS INTC with the provided configuration from the one parsed
+ * in the xlate function.
+ */
+static void pruss_intc_map(struct pruss_intc *intc, unsigned long hwirq)
+{
+	struct device *dev = intc->dev;
+	u8 ch, host, reg_idx;
+	u32 val;
+
+	mutex_lock(&intc->lock);
+
+	intc->event_channel[hwirq].ref_count++;
+
+	ch = intc->event_channel[hwirq].value;
+	host = intc->channel_host[ch].value;
+
+	pruss_intc_update_cmr(intc, hwirq, ch);
+
+	reg_idx = hwirq / 32;
+	val = BIT(hwirq  % 32);
+
+	/* clear and enable system event */
+	pruss_intc_write_reg(intc, PRU_INTC_ESR(reg_idx), val);
+	pruss_intc_write_reg(intc, PRU_INTC_SECR(reg_idx), val);
+
+	if (++intc->channel_host[ch].ref_count == 1) {
+		pruss_intc_update_hmr(intc, ch, host);
+
+		/* enable host interrupts */
+		pruss_intc_write_reg(intc, PRU_INTC_HIEISR, host);
+	}
+
+	dev_dbg(dev, "mapped system_event = %lu channel = %d host = %d",
+		hwirq, ch, host);
+
+	/* global interrupt enable */
+	pruss_intc_write_reg(intc, PRU_INTC_GER, 1);
+
+	mutex_unlock(&intc->lock);
+}
+
+/**
+ * pruss_intc_unmap() - unconfigure the PRUSS INTC
+ * @intc: PRUSS interrupt controller pointer
+ * @hwirq: the system event number
+ *
+ * Undo whatever was done in pruss_intc_map() for a PRU core.
+ * Mappings are reference counted, so resources are only disabled when there
+ * are no longer any users.
+ */
+static void pruss_intc_unmap(struct pruss_intc *intc, unsigned long hwirq)
+{
+	u8 ch, host, reg_idx;
+	u32 val;
+
+	mutex_lock(&intc->lock);
+
+	ch = intc->event_channel[hwirq].value;
+	host = intc->channel_host[ch].value;
+
+	if (--intc->channel_host[ch].ref_count == 0) {
+		/* disable host interrupts */
+		pruss_intc_write_reg(intc, PRU_INTC_HIDISR, host);
+
+		/* clear the map using reset value 0 */
+		pruss_intc_update_hmr(intc, ch, 0);
+	}
+
+	intc->event_channel[hwirq].ref_count--;
+	reg_idx = hwirq / 32;
+	val = BIT(hwirq  % 32);
+
+	/* disable system events */
+	pruss_intc_write_reg(intc, PRU_INTC_ECR(reg_idx), val);
+	/* clear any pending status */
+	pruss_intc_write_reg(intc, PRU_INTC_SECR(reg_idx), val);
+
+	/* clear the map using reset value 0 */
+	pruss_intc_update_cmr(intc, hwirq, 0);
+
+	dev_dbg(intc->dev, "unmapped system_event = %lu channel = %d host = %d\n",
+		hwirq, ch, host);
+
+	mutex_unlock(&intc->lock);
+}
+
+static void pruss_intc_init(struct pruss_intc *intc)
+{
+	const struct pruss_intc_match_data *soc_config = intc->soc_config;
+	int i;
+	int num_chnl_map_regs = DIV_ROUND_UP(soc_config->num_system_events,
+					     CMR_EVT_PER_REG);
+	int num_host_intr_regs = DIV_ROUND_UP(soc_config->num_host_intrs,
+					      HMR_CH_PER_REG);
+	int num_event_type_regs =
+			DIV_ROUND_UP(soc_config->num_system_events, 32);
+
+	/*
+	 * configure polarity (SIPR register) to active high and
+	 * type (SITR register) to level interrupt for all system events
+	 */
+	for (i = 0; i < num_event_type_regs; i++) {
+		pruss_intc_write_reg(intc, PRU_INTC_SIPR(i), 0xffffffff);
+		pruss_intc_write_reg(intc, PRU_INTC_SITR(i), 0);
+	}
+
+	/* clear all interrupt channel map registers, 4 events per register */
+	for (i = 0; i < num_chnl_map_regs; i++)
+		pruss_intc_write_reg(intc, PRU_INTC_CMR(i), 0);
+
+	/* clear all host interrupt map registers, 4 channels per register */
+	for (i = 0; i < num_host_intr_regs; i++)
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
+static int pruss_intc_validate_mapping(struct pruss_intc *intc, int event,
+				       int channel, int host)
+{
+	struct device *dev = intc->dev;
+	int ret = 0;
+
+	mutex_lock(&intc->lock);
+
+	/* check if sysevent already assigned */
+	if (intc->event_channel[event].ref_count > 0 &&
+	    intc->event_channel[event].value != channel) {
+		dev_err(dev, "event %d (req. ch %d) already assigned to channel %d\n",
+			event, channel, intc->event_channel[event].value);
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* check if channel already assigned */
+	if (intc->channel_host[channel].ref_count > 0 &&
+	    intc->channel_host[channel].value != host) {
+		dev_err(dev, "channel %d (req. host %d) already assigned to host %d\n",
+			channel, host, intc->channel_host[channel].value);
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	intc->event_channel[event].value = channel;
+	intc->channel_host[channel].value = host;
+
+unlock:
+	mutex_unlock(&intc->lock);
+	return ret;
+}
+
+static int
+pruss_intc_irq_domain_xlate(struct irq_domain *d, struct device_node *node,
+			    const u32 *intspec, unsigned int intsize,
+			    unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct pruss_intc *intc = d->host_data;
+	struct device *dev = intc->dev;
+	int ret, sys_event, channel, host;
+
+	if (intsize < 3)
+		return -EINVAL;
+
+	sys_event = intspec[0];
+	if (sys_event < 0 || sys_event >= intc->soc_config->num_system_events) {
+		dev_err(dev, "%d is not valid event number\n", sys_event);
+		return -EINVAL;
+	}
+
+	channel = intspec[1];
+	if (channel < 0 || channel >= intc->soc_config->num_host_intrs) {
+		dev_err(dev, "%d is not valid channel number", channel);
+		return -EINVAL;
+	}
+
+	host = intspec[2];
+	if (host < 0 || host >= intc->soc_config->num_host_intrs) {
+		dev_err(dev, "%d is not valid host irq number\n", host);
+		return -EINVAL;
+	}
+
+	/* check if requested sys_event was already mapped, if so validate it */
+	ret = pruss_intc_validate_mapping(intc, sys_event, channel, host);
+	if (ret)
+		return ret;
+
+	*out_hwirq = sys_event;
+	*out_type = IRQ_TYPE_NONE;
+
+	return 0;
+}
+
+static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
+				     irq_hw_number_t hw)
+{
+	struct pruss_intc *intc = d->host_data;
+
+	pruss_intc_map(intc, hw);
+
+	irq_set_chip_data(virq, intc);
+	irq_set_chip_and_handler(virq, &pruss_irqchip, handle_level_irq);
+
+	return 0;
+}
+
+static void pruss_intc_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
+{
+	struct pruss_intc *intc = d->host_data;
+	unsigned long hwirq = irqd_to_hwirq(irq_get_irq_data(virq));
+
+	irq_set_chip_and_handler(virq, NULL, NULL);
+	irq_set_chip_data(virq, NULL);
+	pruss_intc_unmap(intc, hwirq);
+}
+
+static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
+	.xlate	= pruss_intc_irq_domain_xlate,
+	.map	= pruss_intc_irq_domain_map,
+	.unmap	= pruss_intc_irq_domain_unmap,
+};
+
+static void pruss_intc_irq_handler(struct irq_desc *desc)
+{
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct pruss_host_irq_data *host_irq_data = irq_get_handler_data(irq);
+	struct pruss_intc *intc = host_irq_data->intc;
+	u32 hipir;
+	unsigned int virq;
+	int hwirq;
+	u8 host_irq = host_irq_data->host_irq + MIN_PRU_HOST_INT;
+
+	chained_irq_enter(chip, desc);
+
+	while (true) {
+		/* get highest priority pending PRUSS system event */
+		hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(host_irq));
+		if (hipir & INTC_HIPIR_NONE_HINT)
+			break;
+
+		hwirq = hipir & GENMASK(9, 0);
+		virq = irq_find_mapping(intc->domain, hwirq);
+
+		/*
+		 * NOTE: manually ACK any system events that do not have a
+		 * handler mapped yet
+		 */
+		if (WARN_ON_ONCE(!virq))
+			pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
+		else
+			generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int pruss_intc_probe(struct platform_device *pdev)
+{
+	static const char * const irq_names[MAX_NUM_HOST_IRQS] = {
+		"host_intr0", "host_intr1", "host_intr2", "host_intr3",
+		"host_intr4", "host_intr5", "host_intr6", "host_intr7", };
+	const struct pruss_intc_match_data *data;
+	struct device *dev = &pdev->dev;
+	struct pruss_intc *intc;
+	struct pruss_host_irq_data *host_data[MAX_NUM_HOST_IRQS] = { NULL };
+	int i, irq, ret;
+	u8 max_system_events;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	max_system_events = data->num_system_events;
+
+	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
+	if (!intc)
+		return -ENOMEM;
+
+	intc->soc_config = data;
+	intc->dev = dev;
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
+	mutex_init(&intc->lock);
+
+	intc->domain = irq_domain_add_linear(dev->of_node, max_system_events,
+					     &pruss_intc_irq_domain_ops, intc);
+	if (!intc->domain)
+		return -ENOMEM;
+
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		irq = platform_get_irq_byname(pdev, irq_names[i]);
+		if (irq <= 0) {
+			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
+				irq_names[i], irq);
+			ret = irq;
+			goto fail_irq;
+		}
+
+		intc->irqs[i] = irq;
+
+		host_data[i] = devm_kzalloc(dev, sizeof(*host_data[0]),
+					    GFP_KERNEL);
+		if (!host_data[i]) {
+			ret = -ENOMEM;
+			goto fail_irq;
+		}
+
+		host_data[i]->intc = intc;
+		host_data[i]->host_irq = i;
+
+		irq_set_handler_data(irq, host_data[i]);
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
+	return ret;
+}
+
+static int pruss_intc_remove(struct platform_device *pdev)
+{
+	struct pruss_intc *intc = platform_get_drvdata(pdev);
+	u8 max_system_events = intc->soc_config->num_system_events;
+	unsigned int hwirq;
+	int i;
+
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
+		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
+
+	for (hwirq = 0; hwirq < max_system_events; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
+
+	irq_domain_remove(intc->domain);
+
+	return 0;
+}
+
+static const struct pruss_intc_match_data pruss_intc_data = {
+	.num_system_events = 64,
+	.num_host_intrs = 10,
+};
+
+static const struct of_device_id pruss_intc_of_match[] = {
+	{
+		.compatible = "ti,pruss-intc",
+		.data = &pruss_intc_data,
+	},
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
+MODULE_AUTHOR("Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>");
+MODULE_DESCRIPTION("TI PRU-ICSS INTC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

