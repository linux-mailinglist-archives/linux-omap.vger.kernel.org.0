Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53E57D168
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 00:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfGaWnn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Jul 2019 18:43:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59608 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfGaWnn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Jul 2019 18:43:43 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VMgipG087035;
        Wed, 31 Jul 2019 17:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564612964;
        bh=KDMXNlSVT9WRNh4mjda1rLENwodco4HRgAe354yPkuU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Y0NTpyKBRSKCFVoP7ca2uPQcttJZHqw7bAaPVDf2VmLK4nrWMTB2QlwUuQ2yw11OR
         4aU7epa5mB9IUAnOF8Q/tC4X0Xs5+LXHbaPStzdnArm+BZaGSnQoI0nvcBrq3KrGgO
         UpaOfWVd/jJDyAsoopwXvloCuty0d4qyw/U95pGg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VMghPB061534
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 17:42:43 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 17:42:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 17:42:43 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VMgh2Q074928;
        Wed, 31 Jul 2019 17:42:43 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x6VMghZ25787;
        Wed, 31 Jul 2019 17:42:43 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
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
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 4/6] irqchip/irq-pruss-intc: Add helper functions to configure internal mapping
Date:   Wed, 31 Jul 2019 17:41:47 -0500
Message-ID: <20190731224149.11153-5-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731224149.11153-1-s-anna@ti.com>
References: <20190731224149.11153-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRUSS INTC receives a number of system input interrupt source events
and supports individual control configuration and hardware prioritization.
These input events can be mapped to some output interrupt lines through 2
levels of many-to-one mapping i.e. events to channel mapping and channels
to output interrupts.

This mapping information is provided through the PRU firmware that is
loaded onto a PRU core/s or through the device tree node of the PRU
application. The mapping is configured by the PRU remoteproc driver, and
is setup before the PRU core is started and cleaned up after the PRU core
is stopped. This event mapping configuration logic programs the Channel
Map Registers (CMRx) and Host-Interrupt Map Registers (HMRx) only when a
new program is being loaded/started and the same events and interrupt
channels are reset to zero when stopping a PRU.

Add two helper functions: pruss_intc_configure() & pruss_intc_unconfigure()
that the PRU remoteproc driver can use to configure the PRUSS INTC.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
v2:
 - Added new internal helper functions pruss_intc_update_cmr/hmr for
   programming CMR and HMR registers
 - Added unroll logic on failures in pruss_intc_configure() using the
   refactored functions
 - Updated unconfigure logic to reset the map registers and updated
   patch description accordingly
 - Renamed the FREE macro to PRU_INTC_FREE and moved it to header file 
v1: https://patchwork.kernel.org/patch/11034563/

 drivers/irqchip/irq-pruss-intc.c       | 286 ++++++++++++++++++++++++-
 include/linux/irqchip/irq-pruss-intc.h |  36 ++++
 2 files changed, 320 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/irqchip/irq-pruss-intc.h

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 3a1b8a93cfad..63cfc665be1e 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -9,6 +9,7 @@
 
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-pruss-intc.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -24,8 +25,8 @@
 /* minimum starting host interrupt number for MPU */
 #define MIN_PRU_HOST_INT	2
 
-/* maximum number of system events */
-#define MAX_PRU_SYS_EVENTS	64
+/* maximum number of host interrupts */
+#define MAX_PRU_HOST_INT	10
 
 /* PRU_ICSS_INTC registers */
 #define PRU_INTC_REVID		0x0000
@@ -57,6 +58,16 @@
 #define PRU_INTC_HINLR(x)	(0x1100 + (x) * 4)
 #define PRU_INTC_HIER		0x1500
 
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
 /* HIPIR register bit-fields */
 #define INTC_HIPIR_NONE_HINT	0x80000000
 
@@ -66,7 +77,9 @@
  * @base: base virtual address of INTC register space
  * @irqchip: irq chip for this interrupt controller
  * @domain: irq domain for this interrupt controller
+ * @config_map: stored INTC configuration mapping data
  * @lock: mutex to serialize access to INTC
+ * @host_mask: indicate which HOST IRQs are enabled
  * @shared_intr: bit-map denoting if the MPU host interrupt is shared
  * @invalid_intr: bit-map denoting if host interrupt is not connected to MPU
  */
@@ -75,7 +88,9 @@ struct pruss_intc {
 	void __iomem *base;
 	struct irq_chip *irqchip;
 	struct irq_domain *domain;
+	struct pruss_intc_config config_map;
 	struct mutex lock; /* PRUSS INTC lock */
+	u32 host_mask;
 	u16 shared_intr;
 	u16 invalid_intr;
 };
@@ -105,6 +120,267 @@ static int pruss_intc_check_write(struct pruss_intc *intc, unsigned int reg,
 	return 0;
 }
 
+static void pruss_intc_update_cmr(struct pruss_intc *intc, int evt, s8 ch)
+{
+	u32 idx, val;
+
+	idx = evt / CMR_EVT_PER_REG;
+	val = pruss_intc_read_reg(intc, PRU_INTC_CMR(idx));
+	val &= ~(CMR_EVT_MAP_MASK <<
+		 ((evt % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS));
+	val |= ch << ((evt % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS);
+	pruss_intc_write_reg(intc, PRU_INTC_CMR(idx), val);
+}
+
+static void pruss_intc_update_hmr(struct pruss_intc *intc, int ch, s8 host)
+{
+	u32 idx, val;
+
+	idx = ch / HMR_CH_PER_REG;
+	val = pruss_intc_read_reg(intc, PRU_INTC_HMR(idx));
+	val &= ~(HMR_CH_MAP_MASK <<
+		 ((ch % HMR_CH_PER_REG) * HMR_CH_MAP_BITS));
+	val |= host << ((ch % HMR_CH_PER_REG) * HMR_CH_MAP_BITS);
+	pruss_intc_write_reg(intc, PRU_INTC_HMR(idx), val);
+}
+
+static struct pruss_intc *to_pruss_intc(struct device *pru_dev)
+{
+	struct device_node *np;
+	struct platform_device *pdev;
+	struct device *pruss_dev = pru_dev->parent;
+	struct pruss_intc *intc = ERR_PTR(-ENODEV);
+
+	np = of_get_child_by_name(pruss_dev->of_node, "interrupt-controller");
+	if (!np) {
+		dev_err(pruss_dev, "pruss does not have an interrupt-controller node\n");
+		return intc;
+	}
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev) {
+		dev_err(pruss_dev, "no associated platform device\n");
+		goto out;
+	}
+
+	intc = platform_get_drvdata(pdev);
+	if (!intc) {
+		dev_err(pruss_dev, "pruss intc device probe failed?\n");
+		intc = ERR_PTR(-EINVAL);
+	}
+
+out:
+	of_node_put(np);
+	return intc;
+}
+
+/**
+ * pruss_intc_configure() - configure the PRUSS INTC
+ * @dev: pru device pointer
+ * @intc_config: PRU core-specific INTC configuration
+ *
+ * Configures the PRUSS INTC with the provided configuration from
+ * a PRU core. Any existing event to channel mappings or channel to
+ * host interrupt mappings are checked to make sure there are no
+ * conflicting configuration between both the PRU cores. The function
+ * is intended to be used only by the PRU remoteproc driver.
+ *
+ * Returns 0 on success, or a suitable error code otherwise
+ */
+int pruss_intc_configure(struct device *dev,
+			 struct pruss_intc_config *intc_config)
+{
+	struct pruss_intc *intc;
+	int i, idx, ret;
+	s8 ch, host;
+	u64 sysevt_mask = 0;
+	u32 ch_mask = 0;
+	u32 host_mask = 0;
+
+	intc = to_pruss_intc(dev);
+	if (IS_ERR(intc))
+		return PTR_ERR(intc);
+
+	mutex_lock(&intc->lock);
+
+	/*
+	 * configure channel map registers - each register holds map info
+	 * for 4 events, with each event occupying the lower nibble in
+	 * a register byte address in little-endian fashion
+	 */
+	for (i = 0; i < ARRAY_SIZE(intc_config->sysev_to_ch); i++) {
+		ch = intc_config->sysev_to_ch[i];
+		if (ch < 0)
+			continue;
+
+		/* check if sysevent already assigned */
+		if (intc->config_map.sysev_to_ch[i] != PRU_INTC_FREE) {
+			dev_err(dev, "event %d (req. channel %d) already assigned to channel %d\n",
+				i, ch, intc->config_map.sysev_to_ch[i]);
+			ret = -EEXIST;
+			goto fail_evt;
+		}
+
+		intc->config_map.sysev_to_ch[i] = ch;
+		pruss_intc_update_cmr(intc, i, ch);
+		sysevt_mask |= BIT_ULL(i);
+		ch_mask |= BIT(ch);
+		idx = i / CMR_EVT_PER_REG;
+
+		dev_dbg(dev, "SYSEVT%d -> CH%d (CMR%d 0x%08x)\n", i, ch, idx,
+			pruss_intc_read_reg(intc, PRU_INTC_CMR(idx)));
+	}
+
+	/*
+	 * set host map registers - each register holds map info for
+	 * 4 channels, with each channel occupying the lower nibble in
+	 * a register byte address in little-endian fashion
+	 */
+	for (i = 0; i < ARRAY_SIZE(intc_config->ch_to_host); i++) {
+		host = intc_config->ch_to_host[i];
+		if (host < 0)
+			continue;
+
+		/* check if channel already assigned */
+		if (intc->config_map.ch_to_host[i] != PRU_INTC_FREE) {
+			dev_err(dev, "channel %d (req. intr_no %d) already assigned to intr_no %d\n",
+				i, host, intc->config_map.ch_to_host[i]);
+			ret = -EEXIST;
+			goto fail_ch;
+		}
+
+		/* check if host intr is already in use by other PRU */
+		if (intc->host_mask & (1U << host)) {
+			dev_err(dev, "%s: host intr %d already in use\n",
+				__func__, host);
+			ret = -EEXIST;
+			goto fail_ch;
+		}
+
+		intc->config_map.ch_to_host[i] = host;
+		pruss_intc_update_hmr(intc, i, host);
+		ch_mask |= BIT(i);
+		host_mask |= BIT(host);
+		idx = i / HMR_CH_PER_REG;
+
+		dev_dbg(dev, "CH%d -> HOST%d (HMR%d 0x%08x)\n", i, host, idx,
+			pruss_intc_read_reg(intc, PRU_INTC_HMR(idx)));
+	}
+
+	dev_info(dev, "configured system_events = 0x%016llx intr_channels = 0x%08x host_intr = 0x%08x\n",
+		 sysevt_mask, ch_mask, host_mask);
+
+	/* enable system events, writing 0 has no-effect */
+	pruss_intc_write_reg(intc, PRU_INTC_ESR0, lower_32_bits(sysevt_mask));
+	pruss_intc_write_reg(intc, PRU_INTC_SECR0, lower_32_bits(sysevt_mask));
+	pruss_intc_write_reg(intc, PRU_INTC_ESR1, upper_32_bits(sysevt_mask));
+	pruss_intc_write_reg(intc, PRU_INTC_SECR1, upper_32_bits(sysevt_mask));
+
+	/* enable host interrupts */
+	for (i = 0; i < MAX_PRU_HOST_INT; i++) {
+		if (host_mask & BIT(i))
+			pruss_intc_write_reg(intc, PRU_INTC_HIEISR, i);
+	}
+
+	/* global interrupt enable */
+	pruss_intc_write_reg(intc, PRU_INTC_GER, 1);
+
+	intc->host_mask |= host_mask;
+
+	mutex_unlock(&intc->lock);
+	return 0;
+
+fail_ch:
+	while (--i >= 0) {
+		if (intc_config->ch_to_host[i] >= 0) {
+			intc->config_map.ch_to_host[i] = PRU_INTC_FREE;
+			pruss_intc_update_hmr(intc, i, 0);
+		}
+	}
+	i = ARRAY_SIZE(intc_config->sysev_to_ch);
+fail_evt:
+	while (--i >= 0) {
+		if (intc_config->sysev_to_ch[i] >= 0) {
+			intc->config_map.sysev_to_ch[i] = PRU_INTC_FREE;
+			pruss_intc_update_cmr(intc, i, 0);
+		}
+	}
+	mutex_unlock(&intc->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pruss_intc_configure);
+
+/**
+ * pruss_intc_unconfigure() - unconfigure the PRUSS INTC
+ * @dev: pru device pointer
+ * @intc_config: PRU core specific INTC configuration
+ *
+ * Undo whatever was done in pruss_intc_configure() for a PRU core.
+ * It should be sufficient to just mark the resources free in the
+ * global map and disable the host interrupts and sysevents.
+ */
+int pruss_intc_unconfigure(struct device *dev,
+			   struct pruss_intc_config *intc_config)
+{
+	struct pruss_intc *intc;
+	int i;
+	s8 ch, host;
+	u64 sysevt_mask = 0;
+	u32 host_mask = 0;
+
+	intc = to_pruss_intc(dev);
+	if (IS_ERR(intc))
+		return PTR_ERR(intc);
+
+	mutex_lock(&intc->lock);
+
+	for (i = 0; i < ARRAY_SIZE(intc_config->sysev_to_ch); i++) {
+		ch = intc_config->sysev_to_ch[i];
+		if (ch < 0)
+			continue;
+
+		/* mark sysevent free in global map */
+		intc->config_map.sysev_to_ch[i] = PRU_INTC_FREE;
+		sysevt_mask |= BIT_ULL(i);
+		/* clear the map using reset value 0 */
+		pruss_intc_update_cmr(intc, i, 0);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(intc_config->ch_to_host); i++) {
+		host = intc_config->ch_to_host[i];
+		if (host < 0)
+			continue;
+
+		/* mark channel free in global map */
+		intc->config_map.ch_to_host[i] = PRU_INTC_FREE;
+		host_mask |= BIT(host);
+		/* clear the map using reset value 0 */
+		pruss_intc_update_hmr(intc, i, 0);
+	}
+
+	dev_info(dev, "unconfigured system_events = 0x%016llx host_intr = 0x%08x\n",
+		 sysevt_mask, host_mask);
+
+	/* disable system events, writing 0 has no-effect */
+	pruss_intc_write_reg(intc, PRU_INTC_ECR0, lower_32_bits(sysevt_mask));
+	pruss_intc_write_reg(intc, PRU_INTC_ECR1, upper_32_bits(sysevt_mask));
+	/* clear any pending status */
+	pruss_intc_write_reg(intc, PRU_INTC_SECR0, lower_32_bits(sysevt_mask));
+	pruss_intc_write_reg(intc, PRU_INTC_SECR1, upper_32_bits(sysevt_mask));
+
+	/* disable host interrupts */
+	for (i = 0; i < MAX_PRU_HOST_INT; i++) {
+		if (host_mask & BIT(i))
+			pruss_intc_write_reg(intc, PRU_INTC_HIDISR, i);
+	}
+
+	intc->host_mask &= ~host_mask;
+	mutex_unlock(&intc->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pruss_intc_unconfigure);
+
 static void pruss_intc_init(struct pruss_intc *intc)
 {
 	int i;
@@ -290,6 +566,12 @@ static int pruss_intc_probe(struct platform_device *pdev)
 
 	mutex_init(&intc->lock);
 
+	for (i = 0; i < ARRAY_SIZE(intc->config_map.sysev_to_ch); i++)
+		intc->config_map.sysev_to_ch[i] = PRU_INTC_FREE;
+
+	for (i = 0; i < ARRAY_SIZE(intc->config_map.ch_to_host); i++)
+		intc->config_map.ch_to_host[i] = PRU_INTC_FREE;
+
 	pruss_intc_init(intc);
 
 	irqchip = devm_kzalloc(dev, sizeof(*irqchip), GFP_KERNEL);
diff --git a/include/linux/irqchip/irq-pruss-intc.h b/include/linux/irqchip/irq-pruss-intc.h
new file mode 100644
index 000000000000..daffc048b303
--- /dev/null
+++ b/include/linux/irqchip/irq-pruss-intc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PRU-ICSS sub-system private interfaces
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#ifndef __LINUX_IRQ_PRUSS_INTC_H
+#define __LINUX_IRQ_PRUSS_INTC_H
+
+/* maximum number of system events */
+#define MAX_PRU_SYS_EVENTS	64
+
+/* maximum number of interrupt channels */
+#define MAX_PRU_CHANNELS	10
+
+/* use -1 to mark unassigned events and channels */
+#define PRU_INTC_FREE		-1
+
+/**
+ * struct pruss_intc_config - INTC configuration info
+ * @sysev_to_ch: system events to channel mapping information
+ * @ch_to_host: interrupt channel to host interrupt information
+ */
+struct pruss_intc_config {
+	s8 sysev_to_ch[MAX_PRU_SYS_EVENTS];
+	s8 ch_to_host[MAX_PRU_CHANNELS];
+};
+
+int pruss_intc_configure(struct device *dev,
+			 struct pruss_intc_config *intc_config);
+int pruss_intc_unconfigure(struct device *dev,
+			   struct pruss_intc_config *intc_config);
+
+#endif	/* __LINUX_IRQ_PRUSS_INTC_H */
-- 
2.22.0

