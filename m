Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF68619AE
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 05:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbfGHDyT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 7 Jul 2019 23:54:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46572 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfGHDxz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 7 Jul 2019 23:53:55 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x683qkYZ017977;
        Sun, 7 Jul 2019 22:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562557966;
        bh=0frDprr6mFGJ9Tw1xlMqTJaMNs6+o4FICJuO/EOBWdw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tgmTgs+0SqkD0J3qGeKuaLLvWVdbWmhaZiIeHqry6h06CVk/w7Q5cPQvBv4b5HWiM
         003P6SR1tX5rnVdYkkln8A07jlQ/qoCBm6X0LM5xRibaMHZjQFKEIOw5BOsL0+6tfR
         fwushiGxyFlOYUNEDqQZ+GBVv6CQVK0spATHqsPk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x683qkMW102647
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 7 Jul 2019 22:52:46 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 7 Jul
 2019 22:52:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 7 Jul 2019 22:52:46 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x683qkv7130108;
        Sun, 7 Jul 2019 22:52:46 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x683qkm26441;
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
Subject: [PATCH 3/6] irqchip/irq-pruss-intc: Add support for shared and invalid interrupts
Date:   Sun, 7 Jul 2019 22:52:40 -0500
Message-ID: <20190708035243.12170-4-s-anna@ti.com>
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

The PRUSS INTC has a fixed number of output interrupt lines that are
connected to a number of processors or other PRUSS instances or other
devices (like DMA) on the SoC. The output interrupt lines 2 through 9
are usually connected to the main ARM host processor and are referred
to as host interrupts 0 through 7 from ARM/MPU perspective.

All of these 8 host interrupts are not always exclusively connected
to the ARM GIC. Some SoCs have some interrupt lines not connected to
the ARM GIC at all, while a few others have the interrupt lines
connected to multiple processors in which they need to be partitioned
as per SoC integration needs. For example, AM437x and 66AK2G SoCs have
2 PRUSS instances each and have the host interrupt 5 connected to the
other PRUSS, while AM335x has host interrupt 0 shared between MPU and
TSC_ADC and host interrupts 6 & 7 shared between MPU and a DMA controller.

Add support to the PRUSS INTC driver to allow both these shared and
invalid interrupts by not returning a failure if any of these interrupts
are skipped from the corresponding INTC DT node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/irqchip/irq-pruss-intc.c | 44 +++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index d62186ad1be4..142d01b434e0 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -68,6 +68,8 @@
  * @domain: irq domain for this interrupt controller
  * @lock: mutex to serialize access to INTC
  * @host_mask: indicate which HOST IRQs are enabled
+ * @shared_intr: bit-map denoting if the MPU host interrupt is shared
+ * @invalid_intr: bit-map denoting if host interrupt is connected to MPU
  */
 struct pruss_intc {
 	unsigned int irqs[MAX_NUM_HOST_IRQS];
@@ -76,6 +78,8 @@ struct pruss_intc {
 	struct irq_domain *domain;
 	struct mutex lock; /* PRUSS INTC lock */
 	u32 host_mask;
+	u16 shared_intr;
+	u16 invalid_intr;
 };
 
 static inline u32 pruss_intc_read_reg(struct pruss_intc *intc, unsigned int reg)
@@ -243,7 +247,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	struct pruss_intc *intc;
 	struct resource *res;
 	struct irq_chip *irqchip;
-	int i, irq;
+	int i, irq, count;
+	u8 temp_intr[MAX_NUM_HOST_IRQS] = { 0 };
 
 	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
 	if (!intc)
@@ -260,6 +265,39 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	dev_dbg(dev, "intc memory: pa %pa size 0x%zx va %pK\n", &res->start,
 		(size_t)resource_size(res), intc->base);
 
+	count = of_property_read_variable_u8_array(dev->of_node,
+						   "ti,irqs-reserved",
+						   temp_intr, 0,
+						   MAX_NUM_HOST_IRQS);
+	if (count < 0 && count != -EINVAL)
+		return count;
+	count = (count == -EINVAL ? 0 : count);
+	for (i = 0; i < count; i++) {
+		if (temp_intr[i] < MAX_NUM_HOST_IRQS) {
+			intc->invalid_intr |= BIT(temp_intr[i]);
+		} else {
+			dev_warn(dev, "ignoring invalid reserved irq %d\n",
+				 temp_intr[i]);
+		}
+		temp_intr[i] = 0;
+	}
+
+	count = of_property_read_variable_u8_array(dev->of_node,
+						   "ti,irqs-shared",
+						   temp_intr, 0,
+						   MAX_NUM_HOST_IRQS);
+	if (count < 0 && count != -EINVAL)
+		return count;
+	count = (count == -EINVAL ? 0 : count);
+	for (i = 0; i < count; i++) {
+		if (temp_intr[i] < MAX_NUM_HOST_IRQS) {
+			intc->shared_intr |= BIT(temp_intr[i]);
+		} else {
+			dev_warn(dev, "ignoring invalid reserved irq %d\n",
+				 temp_intr[i]);
+		}
+	}
+
 	mutex_init(&intc->lock);
 
 	pruss_intc_init(intc);
@@ -286,6 +324,10 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
 		irq = platform_get_irq_byname(pdev, irq_names[i]);
 		if (irq < 0) {
+			if (intc->shared_intr & BIT(i) ||
+			    intc->invalid_intr & BIT(i))
+				continue;
+
 			dev_err(dev->parent, "platform_get_irq_byname failed for %s : %d\n",
 				irq_names[i], irq);
 			goto fail_irq;
-- 
2.22.0

