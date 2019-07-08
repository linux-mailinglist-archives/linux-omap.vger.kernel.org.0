Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95228619AF
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 05:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbfGHDxz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 7 Jul 2019 23:53:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46570 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfGHDxz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 7 Jul 2019 23:53:55 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x683qlNJ017985;
        Sun, 7 Jul 2019 22:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562557967;
        bh=1XHpXY1f+dtlv5bPSxDeBLj5zQS/NqH4f3yZcY65A4w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cnZXbLlYPfjgvpQWlprB0Fk39rRNq06dlp9ycL8zcLw8wqnvlcLsXXkThzBtjZosf
         mbqV4L8eO95baG/G/Efs37kO8fpYbqXSPDHPcYB6Z3NYeOad0VhEWTGYOlEVcUFoOq
         suUTByDpBOCCqIvbSMcIi8DjIyeRHWXzyLE6L1n4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x683qlfQ016593
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 7 Jul 2019 22:52:47 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 7 Jul
 2019 22:52:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 7 Jul 2019 22:52:47 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x683qlmA026311;
        Sun, 7 Jul 2019 22:52:47 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x683qkm26453;
        Sun, 7 Jul 2019 22:52:46 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        David Lechner <david@lechnology.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 6/6] irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 SoCs
Date:   Sun, 7 Jul 2019 22:52:43 -0500
Message-ID: <20190708035243.12170-7-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708035243.12170-1-s-anna@ti.com>
References: <20190708035243.12170-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
commonly called ICSSG. The PRUSS INTC present within the ICSSG supports
more System Events (160 vs 64), more Interrupt Channels and Host Interrupts
(20 vs 10) compared to the previous generation PRUSS INTC instances. The
first 2 and the last 10 of these host interrupt lines are used by the
PRU and other auxiliary cores and sub-modules within the ICSSG, with 8
host interrupts connected to MPU. The host interrupts 5, 6, 7 are also
connected to the other ICSSG instances within the SoC and can be
partitioned as per system integration through the board dts files.

Enhance the PRUSS INTC driver to add support for this ICSSG INTC
instance. This support is added using specific compatible and match
data and updating the code to use this data instead of the current
hard-coded macros. The INTC config structure is updated to use the
higher events and channels on all SoCs, while limiting the actual
processing to only the relevant number of events/channels/interrupts.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/irqchip/Kconfig                |   2 +-
 drivers/irqchip/irq-pruss-intc.c       | 172 +++++++++++++++++--------
 include/linux/irqchip/irq-pruss-intc.h |   4 +-
 3 files changed, 124 insertions(+), 54 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index b0a9479d527c..9f36a6252302 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -449,7 +449,7 @@ config TI_SCI_INTA_IRQCHIP
 
 config TI_PRUSS_INTC
 	tristate "TI PRU-ICSS Interrupt Controller"
-	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM437X || SOC_DRA7XX || ARCH_KEYSTONE
+	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM437X || SOC_DRA7XX || ARCH_KEYSTONE || ARCH_K3
 	select IRQ_DOMAIN
 	help
 	   This enables support for the PRU-ICSS Local Interrupt Controller
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index a0ad50b95cd5..702b1c120b21 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -7,6 +7,7 @@
  *	Suman Anna <s-anna@ti.com>
  */
 
+#include <linux/bitmap.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/irq-pruss-intc.h>
@@ -25,9 +26,6 @@
 /* minimum starting host interrupt number for MPU */
 #define MIN_PRU_HOST_INT	2
 
-/* maximum number of host interrupts */
-#define MAX_PRU_HOST_INT	10
-
 /* PRU_ICSS_INTC registers */
 #define PRU_INTC_REVID		0x0000
 #define PRU_INTC_CR		0x0004
@@ -40,21 +38,23 @@
 #define PRU_INTC_HIEISR		0x0034
 #define PRU_INTC_HIDISR		0x0038
 #define PRU_INTC_GPIR		0x0080
+#define PRU_INTC_SRSR(x)	(0x0200 + (x) * 4)
 #define PRU_INTC_SRSR0		0x0200
 #define PRU_INTC_SRSR1		0x0204
+#define PRU_INTC_SECR(x)	(0x0280 + (x) * 4)
 #define PRU_INTC_SECR0		0x0280
 #define PRU_INTC_SECR1		0x0284
+#define PRU_INTC_ESR(x)		(0x0300 + (x) * 4)
 #define PRU_INTC_ESR0		0x0300
 #define PRU_INTC_ESR1		0x0304
+#define PRU_INTC_ECR(x)		(0x0380 + (x) * 4)
 #define PRU_INTC_ECR0		0x0380
 #define PRU_INTC_ECR1		0x0384
 #define PRU_INTC_CMR(x)		(0x0400 + (x) * 4)
 #define PRU_INTC_HMR(x)		(0x0800 + (x) * 4)
 #define PRU_INTC_HIPIR(x)	(0x0900 + (x) * 4)
-#define PRU_INTC_SIPR0		0x0d00
-#define PRU_INTC_SIPR1		0x0d04
-#define PRU_INTC_SITR0		0x0d80
-#define PRU_INTC_SITR1		0x0d84
+#define PRU_INTC_SIPR(x)	(0x0d00 + (x) * 4)
+#define PRU_INTC_SITR(x)	(0x0d80 + (x) * 4)
 #define PRU_INTC_HINLR(x)	(0x1100 + (x) * 4)
 #define PRU_INTC_HIER		0x1500
 
@@ -74,12 +74,23 @@
 /* use -1 to mark unassigned events and channels */
 #define FREE			-1
 
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
 /**
  * struct pruss_intc - PRUSS interrupt controller structure
  * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
  * @base: base virtual address of INTC register space
  * @irqchip: irq chip for this interrupt controller
  * @domain: irq domain for this interrupt controller
+ * @data: cached PRUSS INTC IP configuration data
  * @config_map: stored INTC configuration mapping data
  * @lock: mutex to serialize access to INTC
  * @host_mask: indicate which HOST IRQs are enabled
@@ -91,6 +102,7 @@ struct pruss_intc {
 	void __iomem *base;
 	struct irq_chip *irqchip;
 	struct irq_domain *domain;
+	const struct pruss_intc_match_data *data;
 	struct pruss_intc_config config_map;
 	struct mutex lock; /* PRUSS INTC lock */
 	u32 host_mask;
@@ -115,7 +127,7 @@ static int pruss_intc_check_write(struct pruss_intc *intc, unsigned int reg,
 	if (!intc)
 		return -EINVAL;
 
-	if (sysevent >= MAX_PRU_SYS_EVENTS)
+	if (sysevent >= intc->data->num_system_events)
 		return -EINVAL;
 
 	pruss_intc_write_reg(intc, reg, sysevent);
@@ -170,17 +182,29 @@ int pruss_intc_configure(struct device *dev,
 			 struct pruss_intc_config *intc_config)
 {
 	struct pruss_intc *intc;
-	int i, idx, ret;
+	int i, idx;
 	s8 ch, host;
-	u64 sysevt_mask = 0;
+	u32 num_events, num_intrs, num_regs;
+	unsigned long *sysevt_bitmap;
+	u32 *sysevts;
 	u32 ch_mask = 0;
 	u32 host_mask = 0;
+	int ret = 0;
 	u32 val;
 
 	intc = to_pruss_intc(dev);
 	if (IS_ERR(intc))
 		return PTR_ERR(intc);
 
+	num_events = intc->data->num_system_events;
+	num_intrs = intc->data->num_host_intrs;
+	num_regs = DIV_ROUND_UP(num_events, 32);
+
+	sysevt_bitmap = bitmap_zalloc(num_events, GFP_KERNEL);
+	if (!sysevt_bitmap)
+		return -ENOMEM;
+	sysevts = (u32 *)sysevt_bitmap;
+
 	mutex_lock(&intc->lock);
 
 	/*
@@ -188,7 +212,7 @@ int pruss_intc_configure(struct device *dev,
 	 * for 4 events, with each event occupying the lower nibble in
 	 * a register byte address in little-endian fashion
 	 */
-	for (i = 0; i < ARRAY_SIZE(intc_config->sysev_to_ch); i++) {
+	for (i = 0; i < num_events; i++) {
 		ch = intc_config->sysev_to_ch[i];
 		if (ch < 0)
 			continue;
@@ -209,7 +233,7 @@ int pruss_intc_configure(struct device *dev,
 			 ((i % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS));
 		val |= ch << ((i % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS);
 		pruss_intc_write_reg(intc, PRU_INTC_CMR(idx), val);
-		sysevt_mask |= BIT_ULL(i);
+		bitmap_set(sysevt_bitmap, i, 1);
 		ch_mask |= BIT(ch);
 
 		dev_dbg(dev, "SYSEV%d -> CH%d (CMR%d 0x%08x)\n", i, ch, idx,
@@ -221,7 +245,7 @@ int pruss_intc_configure(struct device *dev,
 	 * 4 channels, with each channel occupying the lower nibble in
 	 * a register byte address in little-endian fashion
 	 */
-	for (i = 0; i < ARRAY_SIZE(intc_config->ch_to_host); i++) {
+	for (i = 0; i < num_intrs; i++) {
 		host = intc_config->ch_to_host[i];
 		if (host < 0)
 			continue;
@@ -259,17 +283,19 @@ int pruss_intc_configure(struct device *dev,
 			pruss_intc_read_reg(intc, PRU_INTC_HMR(idx)));
 	}
 
-	dev_info(dev, "configured system_events = 0x%016llx intr_channels = 0x%08x host_intr = 0x%08x\n",
-		 sysevt_mask, ch_mask, host_mask);
+	dev_info(dev, "configured system_events[%d-0] = %*pb\n",
+		 num_events - 1, num_events, sysevt_bitmap);
+	dev_info(dev, "configured intr_channels = 0x%08x host_intr = 0x%08x\n",
+		 ch_mask, host_mask);
 
 	/* enable system events, writing 0 has no-effect */
-	pruss_intc_write_reg(intc, PRU_INTC_ESR0, lower_32_bits(sysevt_mask));
-	pruss_intc_write_reg(intc, PRU_INTC_SECR0, lower_32_bits(sysevt_mask));
-	pruss_intc_write_reg(intc, PRU_INTC_ESR1, upper_32_bits(sysevt_mask));
-	pruss_intc_write_reg(intc, PRU_INTC_SECR1, upper_32_bits(sysevt_mask));
+	for (i = 0; i < num_regs; i++) {
+		pruss_intc_write_reg(intc, PRU_INTC_ESR(i), sysevts[i]);
+		pruss_intc_write_reg(intc, PRU_INTC_SECR(i), sysevts[i]);
+	}
 
 	/* enable host interrupts */
-	for (i = 0; i < MAX_PRU_HOST_INT; i++) {
+	for (i = 0; i < num_intrs; i++) {
 		if (host_mask & BIT(i))
 			pruss_intc_write_reg(intc, PRU_INTC_HIEISR, i);
 	}
@@ -279,11 +305,9 @@ int pruss_intc_configure(struct device *dev,
 
 	intc->host_mask |= host_mask;
 
-	mutex_unlock(&intc->lock);
-	return 0;
-
 unlock:
 	mutex_unlock(&intc->lock);
+	bitmap_free(sysevt_bitmap);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pruss_intc_configure);
@@ -303,26 +327,37 @@ int pruss_intc_unconfigure(struct device *dev,
 	struct pruss_intc *intc;
 	int i;
 	s8 ch, host;
-	u64 sysevt_mask = 0;
+	u32 num_events, num_intrs, num_regs;
+	unsigned long *sysevt_bitmap;
+	u32 *sysevts;
 	u32 host_mask = 0;
 
 	intc = to_pruss_intc(dev);
 	if (IS_ERR(intc))
 		return PTR_ERR(intc);
 
+	num_events = intc->data->num_system_events;
+	num_intrs = intc->data->num_host_intrs;
+	num_regs = DIV_ROUND_UP(num_events, 32);
+
+	sysevt_bitmap = bitmap_zalloc(num_events, GFP_KERNEL);
+	if (!sysevt_bitmap)
+		return -ENOMEM;
+	sysevts = (u32 *)sysevt_bitmap;
+
 	mutex_lock(&intc->lock);
 
-	for (i = 0; i < ARRAY_SIZE(intc_config->sysev_to_ch); i++) {
+	for (i = 0; i < num_events; i++) {
 		ch = intc_config->sysev_to_ch[i];
 		if (ch < 0)
 			continue;
 
 		/* mark sysevent free in global map */
 		intc->config_map.sysev_to_ch[i] = FREE;
-		sysevt_mask |= BIT_ULL(i);
+		bitmap_set(sysevt_bitmap, i, 1);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(intc_config->ch_to_host); i++) {
+	for (i = 0; i < num_intrs; i++) {
 		host = intc_config->ch_to_host[i];
 		if (host < 0)
 			continue;
@@ -332,24 +367,26 @@ int pruss_intc_unconfigure(struct device *dev,
 		host_mask |= BIT(host);
 	}
 
-	dev_info(dev, "unconfigured system_events = 0x%016llx host_intr = 0x%08x\n",
-		 sysevt_mask, host_mask);
+	dev_info(dev, "unconfigured system_events[%d-0] = %*pb\n",
+		 num_events - 1, num_events, sysevt_bitmap);
+	dev_info(dev, "unconfigured host_intr = 0x%08x\n", host_mask);
 
-	/* disable system events, writing 0 has no-effect */
-	pruss_intc_write_reg(intc, PRU_INTC_ECR0, lower_32_bits(sysevt_mask));
-	pruss_intc_write_reg(intc, PRU_INTC_ECR1, upper_32_bits(sysevt_mask));
-	/* clear any pending status */
-	pruss_intc_write_reg(intc, PRU_INTC_SECR0, lower_32_bits(sysevt_mask));
-	pruss_intc_write_reg(intc, PRU_INTC_SECR1, upper_32_bits(sysevt_mask));
+	for (i = 0; i < num_regs; i++) {
+		/* disable system events, writing 0 has no-effect */
+		pruss_intc_write_reg(intc, PRU_INTC_ECR(i), sysevts[i]);
+		/* clear any pending status */
+		pruss_intc_write_reg(intc, PRU_INTC_SECR(i), sysevts[i]);
+	}
 
 	/* disable host interrupts */
-	for (i = 0; i < MAX_PRU_HOST_INT; i++) {
+	for (i = 0; i < num_intrs; i++) {
 		if (host_mask & BIT(i))
 			pruss_intc_write_reg(intc, PRU_INTC_HIDISR, i);
 	}
 
 	intc->host_mask &= ~host_mask;
 	mutex_unlock(&intc->lock);
+	bitmap_free(sysevt_bitmap);
 
 	return 0;
 }
@@ -358,21 +395,28 @@ EXPORT_SYMBOL_GPL(pruss_intc_unconfigure);
 static void pruss_intc_init(struct pruss_intc *intc)
 {
 	int i;
+	int num_chnl_map_regs = DIV_ROUND_UP(intc->data->num_system_events,
+					     CMR_EVT_PER_REG);
+	int num_host_intr_regs = DIV_ROUND_UP(intc->data->num_host_intrs,
+					      HMR_CH_PER_REG);
+	int num_event_type_regs =
+			DIV_ROUND_UP(intc->data->num_system_events, 32);
 
-	/* configure polarity to active high for all system interrupts */
-	pruss_intc_write_reg(intc, PRU_INTC_SIPR0, 0xffffffff);
-	pruss_intc_write_reg(intc, PRU_INTC_SIPR1, 0xffffffff);
-
-	/* configure type to pulse interrupt for all system interrupts */
-	pruss_intc_write_reg(intc, PRU_INTC_SITR0, 0);
-	pruss_intc_write_reg(intc, PRU_INTC_SITR1, 0);
+	/*
+	 * configure polarity (SIPR register) to active high and
+	 * type (SITR register) to pulse interrupt for all system events
+	 */
+	for (i = 0; i < num_event_type_regs; i++) {
+		pruss_intc_write_reg(intc, PRU_INTC_SIPR(i), 0xffffffff);
+		pruss_intc_write_reg(intc, PRU_INTC_SITR(i), 0);
+	}
 
-	/* clear all 16 interrupt channel map registers */
-	for (i = 0; i < 16; i++)
+	/* clear all interrupt channel map registers, 4 events per register */
+	for (i = 0; i < num_chnl_map_regs; i++)
 		pruss_intc_write_reg(intc, PRU_INTC_CMR(i), 0);
 
-	/* clear all 3 host interrupt map registers */
-	for (i = 0; i < 3; i++)
+	/* clear all host interrupt map registers, 4 channels per register */
+	for (i = 0; i < num_host_intr_regs; i++)
 		pruss_intc_write_reg(intc, PRU_INTC_HMR(i), 0);
 }
 
@@ -527,11 +571,20 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct irq_chip *irqchip;
 	int i, irq, count;
+	const struct pruss_intc_match_data *data;
 	u8 temp_intr[MAX_NUM_HOST_IRQS] = { 0 };
+	u8 max_system_events;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	max_system_events = data->num_system_events;
 
 	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
 	if (!intc)
 		return -ENOMEM;
+	intc->data = data;
 	platform_set_drvdata(pdev, intc);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -600,8 +653,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	irqchip->name = dev_name(dev);
 	intc->irqchip = irqchip;
 
-	/* always 64 events */
-	intc->domain = irq_domain_add_linear(dev->of_node, MAX_PRU_SYS_EVENTS,
+	intc->domain = irq_domain_add_linear(dev->of_node, max_system_events,
 					     &pruss_intc_irq_domain_ops, intc);
 	if (!intc->domain)
 		return -ENOMEM;
@@ -638,6 +690,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 static int pruss_intc_remove(struct platform_device *pdev)
 {
 	struct pruss_intc *intc = platform_get_drvdata(pdev);
+	u8 max_system_events = intc->data->num_system_events;
 	unsigned int hwirq;
 	int i;
 
@@ -648,7 +701,7 @@ static int pruss_intc_remove(struct platform_device *pdev)
 	}
 
 	if (intc->domain) {
-		for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
+		for (hwirq = 0; hwirq < max_system_events; hwirq++)
 			irq_dispose_mapping(irq_find_mapping(intc->domain,
 							     hwirq));
 		irq_domain_remove(intc->domain);
@@ -657,8 +710,25 @@ static int pruss_intc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pruss_intc_match_data pruss_intc_data = {
+	.num_system_events = 64,
+	.num_host_intrs = 10,
+};
+
+static const struct pruss_intc_match_data icssg_intc_data = {
+	.num_system_events = 160,
+	.num_host_intrs = 20,
+};
+
 static const struct of_device_id pruss_intc_of_match[] = {
-	{ .compatible = "ti,pruss-intc", },
+	{
+		.compatible = "ti,pruss-intc",
+		.data = &pruss_intc_data,
+	},
+	{
+		.compatible = "ti,icssg-intc",
+		.data = &icssg_intc_data,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, pruss_intc_of_match);
diff --git a/include/linux/irqchip/irq-pruss-intc.h b/include/linux/irqchip/irq-pruss-intc.h
index f1f1bb150100..40ba6e0d2dad 100644
--- a/include/linux/irqchip/irq-pruss-intc.h
+++ b/include/linux/irqchip/irq-pruss-intc.h
@@ -10,10 +10,10 @@
 #define __LINUX_IRQ_PRUSS_INTC_H
 
 /* maximum number of system events */
-#define MAX_PRU_SYS_EVENTS	64
+#define MAX_PRU_SYS_EVENTS	160
 
 /* maximum number of interrupt channels */
-#define MAX_PRU_CHANNELS	10
+#define MAX_PRU_CHANNELS	20
 
 /**
  * struct pruss_intc_config - INTC configuration info
-- 
2.22.0

