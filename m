Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B967224D78D
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 16:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgHUOon (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Aug 2020 10:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgHUOo2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 10:44:28 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B88EC061573
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:26 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i10so2143111ljn.2
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9m2MB1HdAM+HhlpLZuuBQdVjZ/8l/n1l2gHBVtQjwDo=;
        b=uakkZE7BhaDcwZlDuShp0vlXoDZ9XN+arg5WuVzEtVViMFuSA2z9yOaQlVmmwNfQJF
         uOSOygY9QYWcWvceVPNrSWVOMw5GhKF56FVz8aseRTATbXV02wbNLw4qHQuFtTXgU9xV
         fLrz/gdXN99Nte4wlmj6AM3qAypuJ8CsVXO7iTbYDzsMiYGRAShF+xi/SudqfqFKAEiB
         jfRtCBIaYJYEIsMibQhp2jghiX9sY4bOmArwNn5+VwHUWRlRW8NFT17iqXjX9tYKf3H1
         5+nYSBb+2sX+qomKMuVH24PU3dY+Sj/fGgYQQDWRb05dERpTX0ECAnnvVH/cjXlAnW3f
         rvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9m2MB1HdAM+HhlpLZuuBQdVjZ/8l/n1l2gHBVtQjwDo=;
        b=XN9lNUROj9awe+3BCaRESQ70803lfOOvZ63F8ehssM309bYsK23zpNmrXWlT3ETlsR
         XgrN5ZoTNkcUc8tHZ4PyWry5zbRFTXuGnfa6siYAjmVQid1wCBk9eOV5Q7TOXWqCVQYx
         ldvNJ49m+Qk1n8O2ZYFO3q9jhWMA+Xrx/fO6YbdT8cv1Qj+6Cq02QXFbwpUfetASyRH2
         GYnMpl8Y/HO2cyivAZ2mH1csl+lzo0O8h4FlTsti0R/IySaaPBVifmFqlI96qN4PMjx+
         hwhNy4iuZI/ftVZs7Jlxu3aNJUdGHzvU+Qd9p/0vzJ4xJiSqUVPIxGLVTY6s/7dyG+aG
         an5A==
X-Gm-Message-State: AOAM5314qjQjDrUjLGDRtA1RMIdKkxm6FzjQ+wk/hfUJ/UuD+yZ9WVE5
        BKTDlsudvFdUZ966da4eMmn5GA==
X-Google-Smtp-Source: ABdhPJw2mXV988sDj7HI7goIw/MC2NhKXeQ7vSLrYLHn36vstx3ZAWPAneM61bZjEihgSc6UxD4hFg==
X-Received: by 2002:a2e:99cc:: with SMTP id l12mr1582537ljj.235.1598021064408;
        Fri, 21 Aug 2020 07:44:24 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:23 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com, "Andrew F . Davis" <afd@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH v2 2/7] soc: ti: pruss: Add a platform driver for PRUSS in TI SoCs
Date:   Fri, 21 Aug 2020 16:42:39 +0200
Message-Id: <1598020964-29877-3-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Programmable Real-Time Unit - Industrial Communication
Subsystem (PRU-ICSS) is present on various TI SoCs such as
AM335x or AM437x or the Keystone 66AK2G. Each SoC can have
one or more PRUSS instances that may or may not be identical.
For example, AM335x SoCs have a single PRUSS, while AM437x has
two PRUSS instances PRUSS1 and PRUSS0, with the PRUSS0 being
a cut-down version of the PRUSS1.

The PRUSS consists of dual 32-bit RISC cores called the
Programmable Real-Time Units (PRUs), some shared, data and
instruction memories, some internal peripheral modules, and
an interrupt controller. The programmable nature of the PRUs
provide flexibility to implement custom peripheral interfaces,
fast real-time responses, or specialized data handling.

The PRU-ICSS functionality is achieved through three different
platform drivers addressing a specific portion of the PRUSS.
Some sub-modules of the PRU-ICSS IP reuse some of the existing
drivers (like davinci mdio driver or the generic syscon driver).
This design provides flexibility in representing the different
modules of PRUSS accordingly, and at the same time allowing the
PRUSS driver to add some instance specific configuration within
an SoC.

The PRUSS platform driver deals with the overall PRUSS and is
used for managing the subsystem level resources like various
memories and the CFG module. It is responsible for the creation
and deletion of the platform devices for the child PRU devices
and other child devices (like Interrupt Controller, MDIO node
and some syscon nodes) so that they can be managed by specific
platform drivers. The PRUSS interrupt controller is managed by
an irqchip driver, while the individual PRU RISC cores are
managed by a PRU remoteproc driver.

The driver currently supports the AM335x SoC, and support for
other TI SoCs will be added in subsequent patches.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
 - No changes.
---
 drivers/soc/ti/Kconfig       |  11 ++++
 drivers/soc/ti/Makefile      |   1 +
 drivers/soc/ti/pruss.c       | 147 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/pruss_driver.h |  48 ++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 drivers/soc/ti/pruss.c
 create mode 100644 include/linux/pruss_driver.h

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index e192fb7..b934bc3 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -101,6 +101,17 @@ config TI_K3_SOCINFO
 	  platforms to provide information about the SoC family and
 	  variant to user space.
 
+config TI_PRUSS
+	tristate "TI PRU-ICSS Subsystem Platform drivers"
+	depends on SOC_AM33XX
+	select MFD_SYSCON
+	help
+	  TI PRU-ICSS Subsystem platform specific support.
+
+	  Say Y or M here to support the Programmable Realtime Unit (PRU)
+	  processors on various TI SoCs. It's safe to say N here if you're
+	  not interested in the PRU or if you are unsure.
+
 endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
index 1110e5c..18129aa 100644
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
 obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
 obj-$(CONFIG_TI_K3_RINGACC)		+= k3-ringacc.o
 obj-$(CONFIG_TI_K3_SOCINFO)		+= k3-socinfo.o
+obj-$(CONFIG_TI_PRUSS)			+= pruss.o
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
new file mode 100644
index 0000000..c071bb2
--- /dev/null
+++ b/drivers/soc/ti/pruss.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PRU-ICSS platform driver for various TI SoCs
+ *
+ * Copyright (C) 2014-2020 Texas Instruments Incorporated - http://www.ti.com/
+ * Author(s):
+ *	Suman Anna <s-anna@ti.com>
+ *	Andrew F. Davis <afd@ti.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pruss_driver.h>
+
+static int pruss_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct device_node *child;
+	struct pruss *pruss;
+	struct resource res;
+	int ret, i, index;
+	const char *mem_names[PRUSS_MEM_MAX] = { "dram0", "dram1", "shrdram2" };
+
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "failed to set the DMA coherent mask");
+		return ret;
+	}
+
+	pruss = devm_kzalloc(dev, sizeof(*pruss), GFP_KERNEL);
+	if (!pruss)
+		return -ENOMEM;
+
+	pruss->dev = dev;
+
+	child = of_get_child_by_name(np, "memories");
+	if (!child) {
+		dev_err(dev, "%pOF is missing its 'memories' node\n", child);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
+		index = of_property_match_string(child, "reg-names",
+						 mem_names[i]);
+		if (index < 0) {
+			of_node_put(child);
+			return index;
+		}
+
+		if (of_address_to_resource(child, index, &res)) {
+			of_node_put(child);
+			return -EINVAL;
+		}
+
+		pruss->mem_regions[i].va = devm_ioremap(dev, res.start,
+							resource_size(&res));
+		if (!pruss->mem_regions[i].va) {
+			dev_err(dev, "failed to parse and map memory resource %d %s\n",
+				i, mem_names[i]);
+			of_node_put(child);
+			return -ENOMEM;
+		}
+		pruss->mem_regions[i].pa = res.start;
+		pruss->mem_regions[i].size = resource_size(&res);
+
+		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %pK\n",
+			mem_names[i], &pruss->mem_regions[i].pa,
+			pruss->mem_regions[i].size, pruss->mem_regions[i].va);
+	}
+	of_node_put(child);
+
+	platform_set_drvdata(pdev, pruss);
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "couldn't enable module\n");
+		pm_runtime_put_noidle(dev);
+		goto rpm_disable;
+	}
+
+	child = of_get_child_by_name(np, "cfg");
+	if (!child) {
+		dev_err(dev, "%pOF is missing its 'cfg' node\n", child);
+		ret = -ENODEV;
+		goto rpm_put;
+	}
+
+	pruss->cfg_regmap = syscon_node_to_regmap(child);
+	of_node_put(child);
+	if (IS_ERR(pruss->cfg_regmap)) {
+		ret = -ENODEV;
+		goto rpm_put;
+	}
+
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		dev_err(dev, "failed to register child devices\n");
+		goto rpm_put;
+	}
+
+	return 0;
+
+rpm_put:
+	pm_runtime_put_sync(dev);
+rpm_disable:
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static int pruss_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	devm_of_platform_depopulate(dev);
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	return 0;
+}
+
+static const struct of_device_id pruss_of_match[] = {
+	{ .compatible = "ti,am3356-pruss" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, pruss_of_match);
+
+static struct platform_driver pruss_driver = {
+	.driver = {
+		.name = "pruss",
+		.of_match_table = pruss_of_match,
+	},
+	.probe  = pruss_probe,
+	.remove = pruss_remove,
+};
+module_platform_driver(pruss_driver);
+
+MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
+MODULE_DESCRIPTION("PRU-ICSS Subsystem Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
new file mode 100644
index 0000000..0701fe1
--- /dev/null
+++ b/include/linux/pruss_driver.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * PRU-ICSS sub-system specific definitions
+ *
+ * Copyright (C) 2014-2020 Texas Instruments Incorporated - http://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#ifndef _PRUSS_DRIVER_H_
+#define _PRUSS_DRIVER_H_
+
+#include <linux/types.h>
+
+/*
+ * enum pruss_mem - PRUSS memory range identifiers
+ */
+enum pruss_mem {
+	PRUSS_MEM_DRAM0 = 0,
+	PRUSS_MEM_DRAM1,
+	PRUSS_MEM_SHRD_RAM2,
+	PRUSS_MEM_MAX,
+};
+
+/**
+ * struct pruss_mem_region - PRUSS memory region structure
+ * @va: kernel virtual address of the PRUSS memory region
+ * @pa: physical (bus) address of the PRUSS memory region
+ * @size: size of the PRUSS memory region
+ */
+struct pruss_mem_region {
+	void __iomem *va;
+	phys_addr_t pa;
+	size_t size;
+};
+
+/**
+ * struct pruss - PRUSS parent structure
+ * @dev: pruss device pointer
+ * @cfg_regmap: regmap for config region
+ * @mem_regions: data for each of the PRUSS memory regions
+ */
+struct pruss {
+	struct device *dev;
+	struct regmap *cfg_regmap;
+	struct pruss_mem_region mem_regions[PRUSS_MEM_MAX];
+};
+
+#endif	/* _PRUSS_DRIVER_H_ */
-- 
2.7.4

