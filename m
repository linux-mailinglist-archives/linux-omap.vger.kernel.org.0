Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BC52B2C39
	for <lists+linux-omap@lfdr.de>; Sat, 14 Nov 2020 09:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgKNIqn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Nov 2020 03:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgKNIqm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Nov 2020 03:46:42 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83858C061A47
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:40 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id f11so17686053lfs.3
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JvpLMePIknPhqX468aE7CiD8A7arlUotPHYUEbJmuQ=;
        b=qlRjyspoKD4oCkrM2fPAEgcFSp5rwfzsAKMnmoeDxgXqI5zIFUE+Lhd9oJKznfLOQb
         0Lb4/jN2Dv+tXQCB5P7i6rAbzAJXTsHhqn6g+h0jdDBqXy73j8ysM1TWYppCANJzES36
         kBLmBP8ZWe7ATjWLrJH6YzsxXAJ+tNArqzKrQNTJiyNneIDm0TAtSzcFSir8N+yDq/Xr
         qJM/nr+l8t78tKoOHZfYhwh8ytn7xpshEdcsF1vUmQhSswV0mr/pXVln9vjDmCZ3rX0S
         F8RSEkT93qULE8uODtk5ae5pseHitH/kWLCntD1o+Na5Ue91wLEZG8ItFSZqnkjvm2Ua
         QQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JvpLMePIknPhqX468aE7CiD8A7arlUotPHYUEbJmuQ=;
        b=TnTFotWRhQH09ZY4vJX+W/oYFlTItlFRIRtw47DznkzJ6NcKycVXFtOfBJceWV0y/K
         i5vLOeN0AOecIR7BgZmfMsgcPlVFZUP+KH50YJZTeLdiPwp4MWWYcVR8a7HeLAo54VVa
         JqvXi/KnImGqyYQ9TpSEILoj6c1D150DjWHO4VO95h45cDDbRGfM+t72Ru8EdYVf/3YM
         2v5EcK609Nzmd9okCSXq8fx5El5UVqvM7QWxcUCJjGJoVuDReOfMO2lDbDb9btcMFaT/
         wIpN6XHxWJmL+LjPTV/ojuHdy2B1ouJDses+MY5ceSYczQKWtoSRoxJZnzP7IXKQxGVQ
         2NzA==
X-Gm-Message-State: AOAM530+xhyDp1893vIXCUwt/neafohCJVKNMSQ0N6T8lBnhIeGXKSzi
        YScbFyg2o38IoJrBn82E+Mpisw==
X-Google-Smtp-Source: ABdhPJwUHt7Wyv/yWFkn1sZ5PW6VLdiEdHDskn8O28+QxR9dlv7qgc1oMtgtR6lnMOH69JYYX7FNHA==
X-Received: by 2002:a19:6551:: with SMTP id c17mr2511849lfj.46.1605343598899;
        Sat, 14 Nov 2020 00:46:38 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id f62sm1870081lfd.144.2020.11.14.00.46.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 00:46:38 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH 2/6] remoteproc/pru: Add a PRU remoteproc driver
Date:   Sat, 14 Nov 2020 09:46:09 +0100
Message-Id: <20201114084613.13503-3-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Programmable Real-Time Unit Subsystem (PRUSS) consists of
dual 32-bit RISC cores (Programmable Real-Time Units, or PRUs)
for program execution. This patch adds a remoteproc platform
driver for managing the individual PRU RISC cores life cycle.

The PRUs do not have a unified address space (have an Instruction
RAM and a primary Data RAM at both 0x0). The PRU remoteproc driver
therefore uses a custom remoteproc core ELF loader ops. The added
.da_to_va ops is only used to provide translations for the PRU
Data RAMs. This remoteproc driver does not have support for error
recovery and system suspend/resume features. Different compatibles
are used to allow providing scalability for instance-specific device
data if needed. The driver uses a default firmware-name retrieved
from device-tree for each PRU core, and the firmwares are expected
to be present in the standard Linux firmware search paths. They can
also be adjusted by userspace if required through the sysfs interface
provided by the remoteproc core.

The PRU remoteproc driver uses a client-driven boot methodology: it
does _not_ support auto-boot so that the PRU load and boot is dictated
by the corresponding client drivers for achieving various usecases.
This allows flexibility for the client drivers or applications to set
a firmware name (if needed) based on their desired functionality and
boot the PRU. The sysfs bind and unbind attributes have also been
suppressed so that the PRU devices cannot be unbound and thereby
shutdown a PRU from underneath a PRU client driver.

The driver currently supports the AM335x, AM437x, AM57xx and 66AK2G
SoCs, and support for other TI SoCs will be added in subsequent
patches.

Co-developed-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/Kconfig     |  12 +
 drivers/remoteproc/Makefile    |   1 +
 drivers/remoteproc/pru_rproc.c | 428 +++++++++++++++++++++++++++++++++
 3 files changed, 441 insertions(+)
 create mode 100644 drivers/remoteproc/pru_rproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d99548fb5dde..3e3865a7cd78 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -125,6 +125,18 @@ config KEYSTONE_REMOTEPROC
 	  It's safe to say N here if you're not interested in the Keystone
 	  DSPs or just want to use a bare minimum kernel.
 
+config PRU_REMOTEPROC
+	tristate "TI PRU remoteproc support"
+	depends on TI_PRUSS
+	default TI_PRUSS
+	help
+	  Support for TI PRU remote processors present within a PRU-ICSS
+	  subsystem via the remote processor framework.
+
+	  Say Y or M here to support the Programmable Realtime Unit (PRU)
+	  processors on various TI SoCs. It's safe to say N here if you're
+	  not interested in the PRU or if you are unsure.
+
 config QCOM_PIL_INFO
 	tristate
 
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index da2ace4ec86c..bb26c9e4ef9c 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
+obj-$(CONFIG_PRU_REMOTEPROC)		+= pru_rproc.o
 obj-$(CONFIG_QCOM_PIL_INFO)		+= qcom_pil_info.o
 obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
 obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
new file mode 100644
index 000000000000..c94c8e965c21
--- /dev/null
+++ b/drivers/remoteproc/pru_rproc.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PRU-ICSS remoteproc driver for various TI SoCs
+ *
+ * Copyright (C) 2014-2020 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Author(s):
+ *	Suman Anna <s-anna@ti.com>
+ *	Andrew F. Davis <afd@ti.com>
+ *	Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org> for Texas Instruments
+ */
+
+#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pruss_driver.h>
+#include <linux/remoteproc.h>
+
+#include "remoteproc_internal.h"
+#include "remoteproc_elf_helpers.h"
+
+/* PRU_ICSS_PRU_CTRL registers */
+#define PRU_CTRL_CTRL		0x0000
+#define PRU_CTRL_STS		0x0004
+
+/* CTRL register bit-fields */
+#define CTRL_CTRL_SOFT_RST_N	BIT(0)
+#define CTRL_CTRL_EN		BIT(1)
+#define CTRL_CTRL_SLEEPING	BIT(2)
+#define CTRL_CTRL_CTR_EN	BIT(3)
+#define CTRL_CTRL_SINGLE_STEP	BIT(8)
+#define CTRL_CTRL_RUNSTATE	BIT(15)
+
+/* PRU Core IRAM address masks */
+#define PRU0_IRAM_ADDR_MASK	0x34000
+#define PRU1_IRAM_ADDR_MASK	0x38000
+
+/* PRU device addresses for various type of PRU RAMs */
+#define PRU_IRAM_DA	0	/* Instruction RAM */
+#define PRU_PDRAM_DA	0	/* Primary Data RAM */
+#define PRU_SDRAM_DA	0x2000	/* Secondary Data RAM */
+#define PRU_SHRDRAM_DA	0x10000 /* Shared Data RAM */
+
+/**
+ * enum pru_iomem - PRU core memory/register range identifiers
+ *
+ * @PRU_IOMEM_IRAM: PRU Instruction RAM range
+ * @PRU_IOMEM_CTRL: PRU Control register range
+ * @PRU_IOMEM_DEBUG: PRU Debug register range
+ * @PRU_IOMEM_MAX: just keep this one at the end
+ */
+enum pru_iomem {
+	PRU_IOMEM_IRAM = 0,
+	PRU_IOMEM_CTRL,
+	PRU_IOMEM_DEBUG,
+	PRU_IOMEM_MAX,
+};
+
+/**
+ * struct pru_rproc - PRU remoteproc structure
+ * @id: id of the PRU core within the PRUSS
+ * @dev: PRU core device pointer
+ * @pruss: back-reference to parent PRUSS structure
+ * @rproc: remoteproc pointer for this PRU core
+ * @mem_regions: data for each of the PRU memory regions
+ * @fw_name: name of firmware image used during loading
+ */
+struct pru_rproc {
+	int id;
+	struct device *dev;
+	struct pruss *pruss;
+	struct rproc *rproc;
+	struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
+	const char *fw_name;
+};
+
+static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
+{
+	return readl_relaxed(pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
+}
+
+static inline
+void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
+{
+	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
+}
+
+static int pru_rproc_start(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	struct pru_rproc *pru = rproc->priv;
+	u32 val;
+
+	dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
+		pru->id, (rproc->bootaddr >> 2));
+
+	val = CTRL_CTRL_EN | ((rproc->bootaddr >> 2) << 16);
+	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
+
+	return 0;
+}
+
+static int pru_rproc_stop(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	struct pru_rproc *pru = rproc->priv;
+	u32 val;
+
+	dev_dbg(dev, "stopping PRU%d\n", pru->id);
+
+	val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
+	val &= ~CTRL_CTRL_EN;
+	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
+
+	return 0;
+}
+
+/*
+ * Convert PRU device address (data spaces only) to kernel virtual address.
+ *
+ * Each PRU has access to all data memories within the PRUSS, accessible at
+ * different ranges. So, look through both its primary and secondary Data
+ * RAMs as well as any shared Data RAM to convert a PRU device address to
+ * kernel virtual address. Data RAM0 is primary Data RAM for PRU0 and Data
+ * RAM1 is primary Data RAM for PRU1.
+ */
+static void *pru_d_da_to_va(struct pru_rproc *pru, u32 da, int len)
+{
+	struct pruss_mem_region dram0, dram1, shrd_ram;
+	struct pruss *pruss = pru->pruss;
+	u32 offset;
+	void *va = NULL;
+
+	if (len <= 0)
+		return NULL;
+
+	dram0 = pruss->mem_regions[PRUSS_MEM_DRAM0];
+	dram1 = pruss->mem_regions[PRUSS_MEM_DRAM1];
+	/* PRU1 has its local RAM addresses reversed */
+	if (pru->id == 1)
+		swap(dram0, dram1);
+	shrd_ram = pruss->mem_regions[PRUSS_MEM_SHRD_RAM2];
+
+	if (da >= PRU_PDRAM_DA && da + len <= PRU_PDRAM_DA + dram0.size) {
+		offset = da - PRU_PDRAM_DA;
+		va = (__force void *)(dram0.va + offset);
+	} else if (da >= PRU_SDRAM_DA &&
+		   da + len <= PRU_SDRAM_DA + dram1.size) {
+		offset = da - PRU_SDRAM_DA;
+		va = (__force void *)(dram1.va + offset);
+	} else if (da >= PRU_SHRDRAM_DA &&
+		   da + len <= PRU_SHRDRAM_DA + shrd_ram.size) {
+		offset = da - PRU_SHRDRAM_DA;
+		va = (__force void *)(shrd_ram.va + offset);
+	}
+
+	return va;
+}
+
+/*
+ * Convert PRU device address (instruction space) to kernel virtual address.
+ *
+ * A PRU does not have an unified address space. Each PRU has its very own
+ * private Instruction RAM, and its device address is identical to that of
+ * its primary Data RAM device address.
+ */
+static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, int len)
+{
+	u32 offset;
+	void *va = NULL;
+
+	if (len <= 0)
+		return NULL;
+
+	if (da >= PRU_IRAM_DA &&
+	    da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
+		offset = da - PRU_IRAM_DA;
+		va = (__force void *)(pru->mem_regions[PRU_IOMEM_IRAM].va +
+				      offset);
+	}
+
+	return va;
+}
+
+/*
+ * Provide address translations for only PRU Data RAMs through the remoteproc
+ * core for any PRU client drivers. The PRU Instruction RAM access is restricted
+ * only to the PRU loader code.
+ */
+static void *pru_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+{
+	struct pru_rproc *pru = rproc->priv;
+
+	return pru_d_da_to_va(pru, da, len);
+}
+
+/* PRU-specific address translator used by PRU loader. */
+static void *pru_da_to_va(struct rproc *rproc, u64 da, int len, bool is_iram)
+{
+	struct pru_rproc *pru = rproc->priv;
+	void *va;
+
+	if (is_iram)
+		va = pru_i_da_to_va(pru, da, len);
+	else
+		va = pru_d_da_to_va(pru, da, len);
+
+	return va;
+}
+
+static struct rproc_ops pru_rproc_ops = {
+	.start		= pru_rproc_start,
+	.stop		= pru_rproc_stop,
+	.da_to_va	= pru_rproc_da_to_va,
+};
+
+static int
+pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
+{
+	struct device *dev = &rproc->dev;
+	struct elf32_hdr *ehdr;
+	struct elf32_phdr *phdr;
+	int i, ret = 0;
+	const u8 *elf_data = fw->data;
+
+	ehdr = (struct elf32_hdr *)elf_data;
+	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
+
+	/* go through the available ELF segments */
+	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
+		u32 da = phdr->p_paddr;
+		u32 memsz = phdr->p_memsz;
+		u32 filesz = phdr->p_filesz;
+		u32 offset = phdr->p_offset;
+		bool is_iram;
+		void *ptr;
+
+		if (phdr->p_type != PT_LOAD)
+			continue;
+
+		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
+			phdr->p_type, da, memsz, filesz);
+
+		if (filesz > memsz) {
+			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
+				filesz, memsz);
+			ret = -EINVAL;
+			break;
+		}
+
+		if (offset + filesz > fw->size) {
+			dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
+				offset + filesz, fw->size);
+			ret = -EINVAL;
+			break;
+		}
+
+		/* grab the kernel address for this device address */
+		is_iram = phdr->p_flags & PF_X;
+		ptr = pru_da_to_va(rproc, da, memsz, is_iram);
+		if (!ptr) {
+			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
+			ret = -EINVAL;
+			break;
+		}
+
+		/* skip the memzero logic performed by remoteproc ELF loader */
+		if (!phdr->p_filesz)
+			continue;
+
+		memcpy(ptr, elf_data + phdr->p_offset, filesz);
+	}
+
+	return ret;
+}
+
+static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	/* load optional rsc table */
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret == -EINVAL)
+		dev_dbg(&rproc->dev, "no resource table found for this fw\n");
+
+	return ret;
+}
+
+/*
+ * Compute PRU id based on the IRAM addresses. The PRU IRAMs are
+ * always at a particular offset within the PRUSS address space.
+ */
+static int pru_rproc_set_id(struct pru_rproc *pru)
+{
+	int ret = 0;
+
+	switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & 0x3ffff) {
+	case PRU0_IRAM_ADDR_MASK:
+		pru->id = 0;
+		break;
+	case PRU1_IRAM_ADDR_MASK:
+		pru->id = 1;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int pru_rproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct platform_device *ppdev = to_platform_device(dev->parent);
+	struct pru_rproc *pru;
+	const char *fw_name;
+	struct rproc *rproc = NULL;
+	struct resource *res;
+	int i, ret;
+	const char *mem_names[PRU_IOMEM_MAX] = { "iram", "control", "debug" };
+
+	ret = of_property_read_string(np, "firmware-name", &fw_name);
+	if (ret) {
+		dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
+		return ret;
+	}
+
+	rproc = devm_rproc_alloc(dev, pdev->name, &pru_rproc_ops, fw_name,
+				 sizeof(*pru));
+	if (!rproc) {
+		dev_err(dev, "rproc_alloc failed\n");
+		return -ENOMEM;
+	}
+	/* use a custom load function to deal with PRU-specific quirks */
+	rproc->ops->load = pru_rproc_load_elf_segments;
+
+	/* use a custom parse function to deal with PRU-specific resources */
+	rproc->ops->parse_fw = pru_rproc_parse_fw;
+
+	/* error recovery is not supported for PRUs */
+	rproc->recovery_disabled = true;
+
+	/*
+	 * rproc_add will auto-boot the processor normally, but this is not
+	 * desired with PRU client driven boot-flow methodology. A PRU
+	 * application/client driver will boot the corresponding PRU
+	 * remote-processor as part of its state machine either through the
+	 * remoteproc sysfs interface or through the equivalent kernel API.
+	 */
+	rproc->auto_boot = false;
+
+	pru = rproc->priv;
+	pru->dev = dev;
+	pru->pruss = platform_get_drvdata(ppdev);
+	pru->rproc = rproc;
+	pru->fw_name = fw_name;
+
+	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   mem_names[i]);
+		pru->mem_regions[i].va = devm_ioremap_resource(dev, res);
+		if (IS_ERR(pru->mem_regions[i].va)) {
+			dev_err(dev, "failed to parse and map memory resource %d %s\n",
+				i, mem_names[i]);
+			ret = PTR_ERR(pru->mem_regions[i].va);
+			return ret;
+		}
+		pru->mem_regions[i].pa = res->start;
+		pru->mem_regions[i].size = resource_size(res);
+
+		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %pK\n",
+			mem_names[i], &pru->mem_regions[i].pa,
+			pru->mem_regions[i].size, pru->mem_regions[i].va);
+	}
+
+	ret = pru_rproc_set_id(pru);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, rproc);
+
+	ret = devm_rproc_add(dev, pru->rproc);
+	if (ret) {
+		dev_err(dev, "rproc_add failed: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
+
+	return 0;
+}
+
+static int pru_rproc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rproc *rproc = platform_get_drvdata(pdev);
+
+	dev_dbg(dev, "%s: removing rproc %s\n", __func__, rproc->name);
+
+	return 0;
+}
+
+static const struct of_device_id pru_rproc_match[] = {
+	{ .compatible = "ti,am3356-pru", },
+	{ .compatible = "ti,am4376-pru", },
+	{ .compatible = "ti,am5728-pru", },
+	{ .compatible = "ti,k2g-pru",    },
+	{},
+};
+MODULE_DEVICE_TABLE(of, pru_rproc_match);
+
+static struct platform_driver pru_rproc_driver = {
+	.driver = {
+		.name   = "pru-rproc",
+		.of_match_table = pru_rproc_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe  = pru_rproc_probe,
+	.remove = pru_rproc_remove,
+};
+module_platform_driver(pru_rproc_driver);
+
+MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_AUTHOR("Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>");
+MODULE_DESCRIPTION("PRU-ICSS Remote Processor Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.29.0

