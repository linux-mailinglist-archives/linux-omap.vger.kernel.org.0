Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E1DCF37E
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 09:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730169AbfJHHTg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 03:19:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53614 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbfJHHTg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 03:19:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x987JRB7046353;
        Tue, 8 Oct 2019 02:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570519167;
        bh=ltl4RRb5Ij9ywqniuPIEH/A6XjJFdhz13S9UtX+wEX0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=eyquUaPQmKleNFjiRqAKKjifiPDxUUIBiq6ogyMA3bj4ilnyc8iNPeaoQ4LMqrOOt
         PwjAz6G9JuvJbj0AP7/993VWnORuYeVR0WnSK31SZN8QZbga2gO4pEVc/ZlrPl/LQD
         /UvBcEiv0MMfTZOic+4QSDMuWj9VE7j6FsFd/qc4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x987JRqc028753;
        Tue, 8 Oct 2019 02:19:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 02:19:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 02:19:23 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x987JJj5027770;
        Tue, 8 Oct 2019 02:19:24 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv7 2/9] soc: ti: add initial PRM driver with reset control support
Date:   Tue, 8 Oct 2019 10:19:06 +0300
Message-ID: <20191008071913.28740-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008071913.28740-1-t-kristo@ti.com>
References: <20191008071913.28740-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add initial PRM (Power and Reset Management) driver for TI OMAP class
SoCs. Initially this driver only supports reset control, but can be
extended to support rest of the functionality, like powerdomain
control, PRCM irq support etc.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/Kconfig |   1 +
 drivers/soc/ti/Makefile     |   1 +
 drivers/soc/ti/omap_prm.c   | 259 ++++++++++++++++++++++++++++++++++++
 3 files changed, 261 insertions(+)
 create mode 100644 drivers/soc/ti/omap_prm.c

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index fdb6743760a2..ad08d470a2ca 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -109,6 +109,7 @@ config ARCH_OMAP2PLUS
 	select TI_SYSC
 	select OMAP_IRQCHIP
 	select CLKSRC_TI_32K
+	select ARCH_HAS_RESET_CONTROLLER
 	help
 	  Systems based on OMAP2, OMAP3, OMAP4 or OMAP5
 
diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
index b3868d392d4f..788b5cd1e180 100644
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_KEYSTONE_NAVIGATOR_QMSS)	+= knav_qmss.o
 knav_qmss-y := knav_qmss_queue.o knav_qmss_acc.o
 obj-$(CONFIG_KEYSTONE_NAVIGATOR_DMA)	+= knav_dma.o
 obj-$(CONFIG_AMX3_PM)			+= pm33xx.o
+obj-$(CONFIG_ARCH_OMAP2PLUS)		+= omap_prm.o
 obj-$(CONFIG_WKUP_M3_IPC)		+= wkup_m3_ipc.o
 obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
 obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
new file mode 100644
index 000000000000..ab0b66ad715d
--- /dev/null
+++ b/drivers/soc/ti/omap_prm.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * OMAP2+ PRM driver
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *	Tero Kristo <t-kristo@ti.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/delay.h>
+
+struct omap_rst_map {
+	s8 rst;
+	s8 st;
+};
+
+struct omap_prm_data {
+	u32 base;
+	const char *name;
+	u16 rstctrl;
+	u16 rstst;
+	const struct omap_rst_map *rstmap;
+	u8 flags;
+};
+
+struct omap_prm {
+	const struct omap_prm_data *data;
+	void __iomem *base;
+};
+
+struct omap_reset_data {
+	struct reset_controller_dev rcdev;
+	struct omap_prm *prm;
+	u32 mask;
+	spinlock_t lock;
+};
+
+#define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
+
+#define OMAP_MAX_RESETS		8
+#define OMAP_RESET_MAX_WAIT	10000
+
+#define OMAP_PRM_HAS_RSTCTRL	BIT(0)
+#define OMAP_PRM_HAS_RSTST	BIT(1)
+
+#define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
+
+static const struct of_device_id omap_prm_id_table[] = {
+	{ },
+};
+
+static bool _is_valid_reset(struct omap_reset_data *reset, unsigned long id)
+{
+	if (reset->mask & BIT(id))
+		return true;
+
+	return false;
+}
+
+static int omap_reset_get_st_bit(struct omap_reset_data *reset,
+				 unsigned long id)
+{
+	const struct omap_rst_map *map = reset->prm->data->rstmap;
+
+	while (map->rst >= 0) {
+		if (map->rst == id)
+			return map->st;
+
+		map++;
+	}
+
+	return id;
+}
+
+static int omap_reset_status(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
+	u32 v;
+	int st_bit = omap_reset_get_st_bit(reset, id);
+	bool has_rstst = reset->prm->data->rstst ||
+		(reset->prm->data->flags & OMAP_PRM_HAS_RSTST);
+
+	/* Check if we have rstst */
+	if (!has_rstst)
+		return -ENOTSUPP;
+
+	/* Check if hw reset line is asserted */
+	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
+	if (v & BIT(id))
+		return 1;
+
+	/*
+	 * Check reset status, high value means reset sequence has been
+	 * completed successfully so we can return 0 here (reset deasserted)
+	 */
+	v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
+	v >>= st_bit;
+	v &= 1;
+
+	return !v;
+}
+
+static int omap_reset_assert(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
+	u32 v;
+	unsigned long flags;
+
+	/* assert the reset control line */
+	spin_lock_irqsave(&reset->lock, flags);
+	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
+	v |= 1 << id;
+	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
+	spin_unlock_irqrestore(&reset->lock, flags);
+
+	return 0;
+}
+
+static int omap_reset_deassert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
+	u32 v;
+	int st_bit;
+	bool has_rstst;
+	unsigned long flags;
+
+	has_rstst = reset->prm->data->rstst ||
+		(reset->prm->data->flags & OMAP_PRM_HAS_RSTST);
+
+	if (has_rstst) {
+		st_bit = omap_reset_get_st_bit(reset, id);
+
+		/* Clear the reset status by writing 1 to the status bit */
+		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
+		v |= 1 << st_bit;
+		writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);
+	}
+
+	/* de-assert the reset control line */
+	spin_lock_irqsave(&reset->lock, flags);
+	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
+	v &= ~(1 << id);
+	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
+	spin_unlock_irqrestore(&reset->lock, flags);
+
+	return 0;
+}
+
+static const struct reset_control_ops omap_reset_ops = {
+	.assert		= omap_reset_assert,
+	.deassert	= omap_reset_deassert,
+	.status		= omap_reset_status,
+};
+
+static int omap_prm_reset_xlate(struct reset_controller_dev *rcdev,
+				const struct of_phandle_args *reset_spec)
+{
+	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
+
+	if (!_is_valid_reset(reset, reset_spec->args[0]))
+		return -EINVAL;
+
+	return reset_spec->args[0];
+}
+
+static int omap_prm_reset_init(struct platform_device *pdev,
+			       struct omap_prm *prm)
+{
+	struct omap_reset_data *reset;
+	const struct omap_rst_map *map;
+
+	/*
+	 * Check if we have controllable resets. If either rstctrl is non-zero
+	 * or OMAP_PRM_HAS_RSTCTRL flag is set, we have reset control register
+	 * for the domain.
+	 */
+	if (!prm->data->rstctrl && !(prm->data->flags & OMAP_PRM_HAS_RSTCTRL))
+		return 0;
+
+	map = prm->data->rstmap;
+	if (!map)
+		return -EINVAL;
+
+	reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
+	if (!reset)
+		return -ENOMEM;
+
+	reset->rcdev.owner = THIS_MODULE;
+	reset->rcdev.ops = &omap_reset_ops;
+	reset->rcdev.of_node = pdev->dev.of_node;
+	reset->rcdev.nr_resets = OMAP_MAX_RESETS;
+	reset->rcdev.of_xlate = omap_prm_reset_xlate;
+	reset->rcdev.of_reset_n_cells = 1;
+	spin_lock_init(&reset->lock);
+
+	reset->prm = prm;
+
+	while (map->rst >= 0) {
+		reset->mask |= BIT(map->rst);
+		map++;
+	}
+
+	return devm_reset_controller_register(&pdev->dev, &reset->rcdev);
+}
+
+static int omap_prm_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	const struct omap_prm_data *data;
+	struct omap_prm *prm;
+	const struct of_device_id *match;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	match = of_match_device(omap_prm_id_table, &pdev->dev);
+	if (!match)
+		return -ENOTSUPP;
+
+	prm = devm_kzalloc(&pdev->dev, sizeof(*prm), GFP_KERNEL);
+	if (!prm)
+		return -ENOMEM;
+
+	data = match->data;
+
+	while (data->base != res->start) {
+		if (!data->base)
+			return -EINVAL;
+		data++;
+	}
+
+	prm->data = data;
+
+	prm->base = devm_ioremap_resource(&pdev->dev, res);
+	if (!prm->base)
+		return -ENOMEM;
+
+	return omap_prm_reset_init(pdev, prm);
+}
+
+static struct platform_driver omap_prm_driver = {
+	.probe = omap_prm_probe,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= omap_prm_id_table,
+	},
+};
+builtin_platform_driver(omap_prm_driver);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
