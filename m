Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEC97D172
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2019 00:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbfGaWoB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Jul 2019 18:44:01 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49262 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730164AbfGaWnx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Jul 2019 18:43:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VMgksJ026887;
        Wed, 31 Jul 2019 17:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564612966;
        bh=Bhsdx4U0VO7X8x31n3G9Tta7yCxO4I1Lew0AJtA66mU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=asMoq1XPhG7H33wNhwV/BM8kTtmZotqVSL7RugpA+SFxjY+I0ugkbf44grGVXsNfH
         oiAX1zOQ1tw02GyME/xCAFgs+0b0iHts5pvvWNSJZHJvCsZz88NoapJ2mBmLVujUVL
         zsJE+5VmEz7oq7w6O1DMFuOyS4h2IaaH1YsQ/+DA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VMgkd9061569
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 17:42:46 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 17:42:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 17:42:46 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VMgka4072719;
        Wed, 31 Jul 2019 17:42:46 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x6VMgjZ25821;
        Wed, 31 Jul 2019 17:42:45 -0500 (CDT)
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
Subject: [PATCH v2 6/6] irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 SoCs
Date:   Wed, 31 Jul 2019 17:41:49 -0500
Message-ID: <20190731224149.11153-7-s-anna@ti.com>
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
v2:
 - Rebased patch with indexed macros like ESRx, ECRx where x = 0,1 dropped
v1: https://patchwork.kernel.org/patch/11034543/

 drivers/irqchip/Kconfig                |   2 +-
 drivers/irqchip/irq-pruss-intc.c       | 181 +++++++++++++++++--------
 include/linux/irqchip/irq-pruss-intc.h |   4 +-
 3 files changed, 126 insertions(+), 61 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index dc6b5aa77a5d..a98bfec6b364 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -473,7 +473,7 @@ config TI_SCI_INTA_IRQCHIP
 
 config TI_PRUSS_INTC
 	tristate "TI PRU-ICSS Interrupt Controller"
-	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM437X || SOC_DRA7XX || ARCH_KEYSTONE
+	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM437X || SOC_DRA7XX || ARCH_KEYSTONE || ARCH_K3
 	select IRQ_DOMAIN
 	help
 	   This enables support for the PRU-ICSS Local Interrupt Controller
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 59e26dfbb179..891a14b6c399 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -7,6 +7,7 @@
  *	Suman Anna <s-anna@ti.com>
  */
 
+#include <linux/bitmap.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
@@ -26,9 +27,6 @@
 /* minimum starting host interrupt number for MPU */
 #define MIN_PRU_HOST_INT	2
 
-/* maximum number of host interrupts */
-#define MAX_PRU_HOST_INT	10
-
 /* PRU_ICSS_INTC registers */
 #define PRU_INTC_REVID		0x0000
 #define PRU_INTC_CR		0x0004
@@ -42,19 +40,14 @@
 #define PRU_INTC_HIDISR		0x0038
 #define PRU_INTC_GPIR		0x0080
 #define PRU_INTC_SRSR(x)	(0x0200 + (x) * 4)
-#define PRU_INTC_SECR0		0x0280
-#define PRU_INTC_SECR1		0x0284
-#define PRU_INTC_ESR0		0x0300
-#define PRU_INTC_ESR1		0x0304
-#define PRU_INTC_ECR0		0x0380
-#define PRU_INTC_ECR1		0x0384
+#define PRU_INTC_SECR(x)	(0x0280 + (x) * 4)
+#define PRU_INTC_ESR(x)		(0x0300 + (x) * 4)
+#define PRU_INTC_ECR(x)		(0x0380 + (x) * 4)
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
 
@@ -71,12 +64,23 @@
 /* HIPIR register bit-fields */
 #define INTC_HIPIR_NONE_HINT	0x80000000
 
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
@@ -88,6 +92,7 @@ struct pruss_intc {
 	void __iomem *base;
 	struct irq_chip *irqchip;
 	struct irq_domain *domain;
+	const struct pruss_intc_match_data *data;
 	struct pruss_intc_config config_map;
 	struct mutex lock; /* PRUSS INTC lock */
 	u32 host_mask;
@@ -112,7 +117,7 @@ static int pruss_intc_check_write(struct pruss_intc *intc, unsigned int reg,
 	if (!intc)
 		return -EINVAL;
 
-	if (sysevent >= MAX_PRU_SYS_EVENTS)
+	if (sysevent >= intc->data->num_system_events)
 		return -EINVAL;
 
 	pruss_intc_write_reg(intc, reg, sysevent);
@@ -191,16 +196,28 @@ int pruss_intc_configure(struct device *dev,
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
@@ -208,7 +225,7 @@ int pruss_intc_configure(struct device *dev,
 	 * for 4 events, with each event occupying the lower nibble in
 	 * a register byte address in little-endian fashion
 	 */
-	for (i = 0; i < ARRAY_SIZE(intc_config->sysev_to_ch); i++) {
+	for (i = 0; i < num_events; i++) {
 		ch = intc_config->sysev_to_ch[i];
 		if (ch < 0)
 			continue;
@@ -223,7 +240,7 @@ int pruss_intc_configure(struct device *dev,
 
 		intc->config_map.sysev_to_ch[i] = ch;
 		pruss_intc_update_cmr(intc, i, ch);
-		sysevt_mask |= BIT_ULL(i);
+		bitmap_set(sysevt_bitmap, i, 1);
 		ch_mask |= BIT(ch);
 		idx = i / CMR_EVT_PER_REG;
 
@@ -236,7 +253,7 @@ int pruss_intc_configure(struct device *dev,
 	 * 4 channels, with each channel occupying the lower nibble in
 	 * a register byte address in little-endian fashion
 	 */
-	for (i = 0; i < ARRAY_SIZE(intc_config->ch_to_host); i++) {
+	for (i = 0; i < num_intrs; i++) {
 		host = intc_config->ch_to_host[i];
 		if (host < 0)
 			continue;
@@ -267,17 +284,19 @@ int pruss_intc_configure(struct device *dev,
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
@@ -286,9 +305,7 @@ int pruss_intc_configure(struct device *dev,
 	pruss_intc_write_reg(intc, PRU_INTC_GER, 1);
 
 	intc->host_mask |= host_mask;
-
-	mutex_unlock(&intc->lock);
-	return 0;
+	goto out;
 
 fail_ch:
 	while (--i >= 0) {
@@ -297,7 +314,7 @@ int pruss_intc_configure(struct device *dev,
 			pruss_intc_update_hmr(intc, i, 0);
 		}
 	}
-	i = ARRAY_SIZE(intc_config->sysev_to_ch);
+	i = num_events;
 fail_evt:
 	while (--i >= 0) {
 		if (intc_config->sysev_to_ch[i] >= 0) {
@@ -305,7 +322,9 @@ int pruss_intc_configure(struct device *dev,
 			pruss_intc_update_cmr(intc, i, 0);
 		}
 	}
+out:
 	mutex_unlock(&intc->lock);
+	bitmap_free(sysevt_bitmap);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pruss_intc_configure);
@@ -325,28 +344,39 @@ int pruss_intc_unconfigure(struct device *dev,
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
 		intc->config_map.sysev_to_ch[i] = PRU_INTC_FREE;
-		sysevt_mask |= BIT_ULL(i);
+		bitmap_set(sysevt_bitmap, i, 1);
 		/* clear the map using reset value 0 */
 		pruss_intc_update_cmr(intc, i, 0);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(intc_config->ch_to_host); i++) {
+	for (i = 0; i < num_intrs; i++) {
 		host = intc_config->ch_to_host[i];
 		if (host < 0)
 			continue;
@@ -358,24 +388,26 @@ int pruss_intc_unconfigure(struct device *dev,
 		pruss_intc_update_hmr(intc, i, 0);
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
@@ -384,21 +416,28 @@ EXPORT_SYMBOL_GPL(pruss_intc_unconfigure);
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
 
@@ -549,11 +588,20 @@ static int pruss_intc_probe(struct platform_device *pdev)
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
@@ -623,8 +671,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	irqchip->name = dev_name(dev);
 	intc->irqchip = irqchip;
 
-	/* always 64 events */
-	intc->domain = irq_domain_add_linear(dev->of_node, MAX_PRU_SYS_EVENTS,
+	intc->domain = irq_domain_add_linear(dev->of_node, max_system_events,
 					     &pruss_intc_irq_domain_ops, intc);
 	if (!intc->domain)
 		return -ENOMEM;
@@ -661,6 +708,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 static int pruss_intc_remove(struct platform_device *pdev)
 {
 	struct pruss_intc *intc = platform_get_drvdata(pdev);
+	u8 max_system_events = intc->data->num_system_events;
 	unsigned int hwirq;
 	int i;
 
@@ -670,15 +718,32 @@ static int pruss_intc_remove(struct platform_device *pdev)
 							 NULL);
 	}
 
-	for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
+	for (hwirq = 0; hwirq < max_system_events; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
 	irq_domain_remove(intc->domain);
 
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
index daffc048b303..cc6f9190b04f 100644
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
 
 /* use -1 to mark unassigned events and channels */
 #define PRU_INTC_FREE		-1
-- 
2.22.0

