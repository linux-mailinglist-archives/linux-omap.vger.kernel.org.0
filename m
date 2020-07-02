Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7541521260D
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 16:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbgGBOUO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 10:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729780AbgGBOUO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jul 2020 10:20:14 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C754DC08C5C1
        for <linux-omap@vger.kernel.org>; Thu,  2 Jul 2020 07:20:13 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so32416059ljn.4
        for <linux-omap@vger.kernel.org>; Thu, 02 Jul 2020 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DzB1zREDiJD3kRDNv1aKQ4AZAIoS6L96XnGWausRy9U=;
        b=bOopU77GuBJI4E/MWaA5GBIZzUFDTcAmIShyeMPr17bNtJueltJS82Y8wQoBe1XYvs
         Lq6IV0JRm3aO27hvA+/mqU3Yi1tWzqa2sjiFsFAr4a4c9vf8IlTNg4OycxXFEHHv0exs
         nEbybCEWFc2gNKNrSCuOPeHXh9SDdh6l55d/zyCWxQosoSx2HNRo+FyJjVFWX/dl49l3
         /DEysRFjUogt1WESd+4d38BnpY4tlYDwNJHj2oFFOnxbM0Sq9kRpeFwS3YxvJfCJeQVP
         6M+8tao8C/JLVwp/9UjHu+uM+lz65LpvdYmnA0HfyhujBqy5LrpRocBy/U0Y20FFAMT+
         0gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DzB1zREDiJD3kRDNv1aKQ4AZAIoS6L96XnGWausRy9U=;
        b=Uv60GeABF6WhFOlY3EfPn81rcr19FWKRGzdk4ID4el0sIhst2AxrjkQRr7WEg+LWx5
         4NotR7iz9qPDC3/lULiTRCteHE3s7JipFjYHUETcJO/qRw5dlNqrURFNVN7S37WAwdSW
         k8qUdveSRtV9UhGL5J9/dTAEUMWXjUYns72pnrp1iBUbOjLWO5pXSJz1Zh+gW6yoxdqd
         hDi/gl1IFBtoXFl/lZW0RVqFEaHh+JnfMESFxqs75sEZHepa1L5/GgFYP+zPy15j78d/
         hctTWBa2ocX9jLI14p9XAFm0MvMvCnq7vs90aHCFg3lcY9vmPFTsZzPlERKbOzPFpZOl
         akiw==
X-Gm-Message-State: AOAM530ZoXN0ApH09+DPcP4eULRvxSc4aqO29j61Cz+bYe52cbRKLAZB
        LOjr0OPwrYC4/twoy3cVmS80ag==
X-Google-Smtp-Source: ABdhPJz5L9BBTJw62WasoE8tW/oErMLlz6JydZ2fTHReGuMQKHtOD6JKFQJ52TIZbWOxhMVn+jkZuQ==
X-Received: by 2002:a2e:b5a8:: with SMTP id f8mr15678790ljn.247.1593699612111;
        Thu, 02 Jul 2020 07:20:12 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id v10sm692581ljg.113.2020.07.02.07.20.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 07:20:11 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com
Subject: [PATCHv3 5/6] irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 SoCs
Date:   Thu,  2 Jul 2020 16:17:58 +0200
Message-Id: <1593699479-1445-6-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

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
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v2->v3:
- Change patch order: use it directly after "irqchip/irq-pruss-intc:
  Implement irq_{get,set}_irqchip_state ops" and before new
  "irqchip/irq-pruss-intc: Add event mapping support" in order to reduce
  diff.

v1->v2:
- https://patchwork.kernel.org/patch/11069773/
---
 drivers/irqchip/Kconfig          |   2 +-
 drivers/irqchip/irq-pruss-intc.c | 101 ++++++++++++++++++++++++++++-----------
 2 files changed, 74 insertions(+), 29 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 733d7ec..9abee84 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -495,7 +495,7 @@ config TI_SCI_INTA_IRQCHIP
 
 config TI_PRUSS_INTC
 	tristate "TI PRU-ICSS Interrupt Controller"
-	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
+	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE || ARCH_K3
 	select IRQ_DOMAIN
 	help
 	   This enables support for the PRU-ICSS Local Interrupt Controller
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 19b3d38..362aa01 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -7,6 +7,7 @@
  *	Suman Anna <s-anna@ti.com>
  */
 
+#include <linux/bitmap.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
@@ -25,9 +26,6 @@
 /* minimum starting host interrupt number for MPU */
 #define MIN_PRU_HOST_INT	2
 
-/* maximum number of system events */
-#define MAX_PRU_SYS_EVENTS	64
-
 /* PRU_ICSS_INTC registers */
 #define PRU_INTC_REVID		0x0000
 #define PRU_INTC_CR		0x0004
@@ -41,30 +39,42 @@
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
 
+/* CMR register bit-field macros */
+#define CMR_EVT_PER_REG		4
+
+/* HMR register bit-field macros */
+#define HMR_CH_PER_REG		4
+
 /* HIPIR register bit-fields */
 #define INTC_HIPIR_NONE_HINT	0x80000000
 
 /**
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
  * struct pruss_intc - PRUSS interrupt controller structure
  * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
  * @base: base virtual address of INTC register space
  * @domain: irq domain for this interrupt controller
+ * @soc_config: cached PRUSS INTC IP configuration data
  * @shared_intr: bit-map denoting if the MPU host interrupt is shared
  * @invalid_intr: bit-map denoting if host interrupt is not connected to MPU
  */
@@ -72,6 +82,7 @@ struct pruss_intc {
 	unsigned int irqs[MAX_NUM_HOST_IRQS];
 	void __iomem *base;
 	struct irq_domain *domain;
+	const struct pruss_intc_match_data *soc_config;
 	u16 shared_intr;
 	u16 invalid_intr;
 };
@@ -89,22 +100,30 @@ static inline void pruss_intc_write_reg(struct pruss_intc *intc,
 
 static void pruss_intc_init(struct pruss_intc *intc)
 {
+	const struct pruss_intc_match_data *soc_config = intc->soc_config;
 	int i;
+	int num_chnl_map_regs = DIV_ROUND_UP(soc_config->num_system_events,
+					     CMR_EVT_PER_REG);
+	int num_host_intr_regs = DIV_ROUND_UP(soc_config->num_host_intrs,
+					      HMR_CH_PER_REG);
+	int num_event_type_regs =
+			DIV_ROUND_UP(soc_config->num_system_events, 32);
 
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
 
@@ -266,11 +285,20 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct pruss_intc *intc;
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
+	intc->soc_config = data;
 	platform_set_drvdata(pdev, intc);
 
 	intc->base = devm_platform_ioremap_resource(pdev, 0);
@@ -327,8 +355,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 
 	pruss_intc_init(intc);
 
-	/* always 64 events */
-	intc->domain = irq_domain_add_linear(dev->of_node, MAX_PRU_SYS_EVENTS,
+	intc->domain = irq_domain_add_linear(dev->of_node, max_system_events,
 					     &pruss_intc_irq_domain_ops, intc);
 	if (!intc->domain)
 		return -ENOMEM;
@@ -369,6 +396,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 static int pruss_intc_remove(struct platform_device *pdev)
 {
 	struct pruss_intc *intc = platform_get_drvdata(pdev);
+	u8 max_system_events = intc->soc_config->num_system_events;
 	unsigned int hwirq;
 	int i;
 
@@ -378,7 +406,7 @@ static int pruss_intc_remove(struct platform_device *pdev)
 							 NULL);
 	}
 
-	for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
+	for (hwirq = 0; hwirq < max_system_events; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
 
 	irq_domain_remove(intc->domain);
@@ -386,8 +414,25 @@ static int pruss_intc_remove(struct platform_device *pdev)
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
-- 
2.7.4

