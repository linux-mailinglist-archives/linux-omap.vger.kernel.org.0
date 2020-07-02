Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2364A212608
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 16:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbgGBOUG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 10:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbgGBOUF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jul 2020 10:20:05 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD8FC08C5C1
        for <linux-omap@vger.kernel.org>; Thu,  2 Jul 2020 07:20:05 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so32415515ljn.4
        for <linux-omap@vger.kernel.org>; Thu, 02 Jul 2020 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RoJjFQSX48jhwhl8Ul5YCo93h9fATpR+8tZryrxKU3c=;
        b=K5JQX5CnCB6yZjVindc2bgU/7edLnaiW8yXFIh/IIEyv1kN375fz1yNU0nCk4pC5lv
         sipMjiRouaBgQcsud6+xI/bdGQeyWgQHO1RxeRbDx5IkUPdSeyd+ij8a4P1flRlIP7TD
         Z9wlO7HZr2D6Fvfv439KMkwaM/KFmJjAhgVOsqCteuNoBNg0VhRFc8cwc4TJiUVCZjyG
         MSd+AXD0Mr81XWhKXWJkCjrXTE6hsVjYYZ4ufuQJIhDLphNxewZjhGOL+RmyC7E/tJuC
         Y430FOWIbYT10yqdSM/Ja1/dMrc5wFVGs5L4gTqk8HIeyHviVudizaCPafWKyxxJYJVs
         OO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RoJjFQSX48jhwhl8Ul5YCo93h9fATpR+8tZryrxKU3c=;
        b=L2SqZDlZuK5ZOG/QB/zVVKUD7+WhSq8K2uh4ilznzTQ4W+2RwTksHXF8o147xsFYX2
         r58lnIV0kkeaWvg5Mtd7pP2xxRu3WcwKLCFGaj7q6KD4vgOtOaylO2ZBd5bwIzjHwDku
         MpiEH80t7HhkeGaWL8cgXVVXXCVKlQz6j0qYAQyuPOesztvkHSkve0cU8LKaLg8q00R9
         XF6UbYbNVXAchYuYKNALtHruqWOAvVHUedubcK9PVlzF5f7HBspY++4VQboMm24D6HPQ
         H6UGTI94LvkLjbS108GK9GR8IGg28orJHAnGgBY8FaUc7j8P6Ng+pfijpy1eO7Bjx8Ic
         JqWw==
X-Gm-Message-State: AOAM531nCncGmOZua5bT1fNpZ0+8guFZndvRqgb0jOwPIVrV6gIl2GVM
        23a0PM9g32Oyct/BH+XJx7WFDA==
X-Google-Smtp-Source: ABdhPJwjjLvCnpUXJbEU4nV6HBTcQc9Xiw0hnWnzNQWD7GrgOcuj8ce3OmodzG4ifmmm6GOO1D8EXw==
X-Received: by 2002:a2e:6e05:: with SMTP id j5mr16118253ljc.135.1593699603585;
        Thu, 02 Jul 2020 07:20:03 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id v10sm692581ljg.113.2020.07.02.07.20.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 07:20:02 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com
Subject: [PATCHv3 3/6] irqchip/irq-pruss-intc: Add support for shared and invalid interrupts
Date:   Thu,  2 Jul 2020 16:17:56 +0200
Message-Id: <1593699479-1445-4-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The PRUSS INTC has a fixed number of output interrupt lines that are
connected to a number of processors or other PRUSS instances or other
devices (like DMA) on the SoC. The output interrupt lines 2 through 9
are usually connected to the main Arm host processor and are referred
to as host interrupts 0 through 7 from ARM/MPU perspective.

All of these 8 host interrupts are not always exclusively connected
to the Arm interrupt controller. Some SoCs have some interrupt lines
not connected to the Arm interrupt controller at all, while a few others
have the interrupt lines connected to multiple processors in which they
need to be partitioned as per SoC integration needs. For example, AM437x
and 66AK2G SoCs have 2 PRUSS instances each and have the host interrupt 5
connected to the other PRUSS, while AM335x has host interrupt 0 shared
between MPU and TSC_ADC and host interrupts 6 & 7 shared between MPU and
a DMA controller.

Add support to the PRUSS INTC driver to allow both these shared and
invalid interrupts by not returning a failure if any of these interrupts
are skipped from the corresponding INTC DT node.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v2->v3:
- Extra checks for (intc->irqs[i]) in error/remove path was moved from
  "irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
  interrupts" to this patch
v1->v2:
- https://patchwork.kernel.org/patch/11069757/
---
 drivers/irqchip/irq-pruss-intc.c | 73 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index fb3dda3..49c936f 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -65,11 +65,15 @@
  * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
  * @base: base virtual address of INTC register space
  * @domain: irq domain for this interrupt controller
+ * @shared_intr: bit-map denoting if the MPU host interrupt is shared
+ * @invalid_intr: bit-map denoting if host interrupt is not connected to MPU
  */
 struct pruss_intc {
 	unsigned int irqs[MAX_NUM_HOST_IRQS];
 	void __iomem *base;
 	struct irq_domain *domain;
+	u16 shared_intr;
+	u16 invalid_intr;
 };
 
 static inline u32 pruss_intc_read_reg(struct pruss_intc *intc, unsigned int reg)
@@ -222,7 +226,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		"host_intr4", "host_intr5", "host_intr6", "host_intr7", };
 	struct device *dev = &pdev->dev;
 	struct pruss_intc *intc;
-	int i, irq;
+	int i, irq, count;
+	u8 temp_intr[MAX_NUM_HOST_IRQS] = { 0 };
 
 	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
 	if (!intc)
@@ -235,6 +240,52 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		return PTR_ERR(intc->base);
 	}
 
+	count = of_property_read_variable_u8_array(dev->of_node,
+						   "ti,irqs-reserved",
+						   temp_intr, 0,
+						   MAX_NUM_HOST_IRQS);
+	/*
+	 * The irqs-reserved is used only for some SoC's therefore not having
+	 * this property is still valid
+	 */
+	if (count == -EINVAL)
+		count = 0;
+	if (count < 0)
+		return count;
+
+	for (i = 0; i < count; i++) {
+		if (temp_intr[i] >= MAX_NUM_HOST_IRQS) {
+			dev_warn(dev, "ignoring invalid reserved irq %d\n",
+				 temp_intr[i]);
+			continue;
+		}
+
+		intc->invalid_intr |= BIT(temp_intr[i]);
+	}
+
+	count = of_property_read_variable_u8_array(dev->of_node,
+						   "ti,irqs-shared",
+						   temp_intr, 0,
+						   MAX_NUM_HOST_IRQS);
+	/*
+	 * The irqs-shared is used only for some SoC's therefore not having
+	 * this property is still valid
+	 */
+	if (count == -EINVAL)
+		count = 0;
+	if (count < 0)
+		return count;
+
+	for (i = 0; i < count; i++) {
+		if (temp_intr[i] >= MAX_NUM_HOST_IRQS) {
+			dev_warn(dev, "ignoring invalid shared irq %d\n",
+				 temp_intr[i]);
+			continue;
+		}
+
+		intc->shared_intr |= BIT(temp_intr[i]);
+	}
+
 	pruss_intc_init(intc);
 
 	/* always 64 events */
@@ -244,8 +295,14 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		if (intc->invalid_intr & BIT(i))
+			continue;
+
 		irq = platform_get_irq_byname(pdev, irq_names[i]);
 		if (irq <= 0) {
+			if (intc->shared_intr & BIT(i))
+				continue;
+
 			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
 				irq_names[i], irq);
 			goto fail_irq;
@@ -259,8 +316,11 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	return 0;
 
 fail_irq:
-	while (--i >= 0)
-		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
+	while (--i >= 0) {
+		if (intc->irqs[i])
+			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
+							 NULL);
+	}
 
 	irq_domain_remove(intc->domain);
 
@@ -273,8 +333,11 @@ static int pruss_intc_remove(struct platform_device *pdev)
 	unsigned int hwirq;
 	int i;
 
-	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
-		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		if (intc->irqs[i])
+			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
+							 NULL);
+	}
 
 	for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
-- 
2.7.4

