Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7EE2B2C38
	for <lists+linux-omap@lfdr.de>; Sat, 14 Nov 2020 09:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgKNIqm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Nov 2020 03:46:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgKNIqm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Nov 2020 03:46:42 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FB9C0617A6
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:41 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id r9so17665564lfn.11
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AhJ59VVwS8xTyCm/hPVjI+Y1471PtmmtL/WaXfJW7As=;
        b=AKGDtpmpIAobB5uXIUDll3wd23wkQop9g4Ana1Vai9sGgwxIyMxnaVAK9eQaaMjiXk
         xxVyiur+TO8dDjgBzqmnswNGUIklKW333CjqvS3g6KnsYv4lii1hqO/I4bFgIjaTntrc
         sMxe+HTmg569Gkoa9frEEZZQ9tU+uLWB+6O0tZVTS6xLOccOE3zS4SZJrJCFP0FJa69x
         +mGXvuOpF8W7lTyLDHUkL6g4uCDJZ1Ykn9f8lJ1Ajk3YH3mZsKMaVJCoiBHr0C/3uAEp
         O9tcUU1bR861tw3UF3LL+bO1uwNbtNCkLydMtzkbQZ/b4YkUiWvoW7Jq4NJDKWmm2/zE
         4NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AhJ59VVwS8xTyCm/hPVjI+Y1471PtmmtL/WaXfJW7As=;
        b=puZXY1UEmWqa6CvVAP+yfU+JQSI8aR3Io2sEWB8KSEmPdyZLQdH3kuGzuj4e+FO9yT
         V274GbXwMoYRW3/t2opRCDRFjd9SrV7eS+3nxJmwQ0Y1qcjo4spzP4ugxL9l/XHXMyq3
         jf1wHpUSs3wAND4VTfy7M0D1/AZ7B2RRcjRkbeHNdf5EvCaaBeBmdQo5l7MichegiAa1
         2Izmwaq/9zn6iTC9QQnmV5+6/kmrIDNvxpqvpa+qNxHdznIwnb78mreLEuZYfSCRg9MU
         bJaz/pACbDwCsu4jAE229bN2+CH17zM/PJ3ci1S5nVz6+8zYyzW4Y5so4IFLFY6oGCFV
         t4yQ==
X-Gm-Message-State: AOAM530gBSh+ohW6/7yOB18ZpNty6gxXgZ0WbQaiHYLp1nn8p9WT8oX1
        mnPytpQBQET099aDZmXQB8FZ6A==
X-Google-Smtp-Source: ABdhPJzgDqdsSOOQ8Wp0ha6/uSxmIJEvxvFKMpxNyZzgj0JcdSRTUdrrZhoehPCBWyBjwfuSAMPAsA==
X-Received: by 2002:ac2:46e1:: with SMTP id q1mr2537326lfo.212.1605343600184;
        Sat, 14 Nov 2020 00:46:40 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id f62sm1870081lfd.144.2020.11.14.00.46.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 00:46:39 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH 3/6] remoteproc/pru: Add support for PRU specific interrupt configuration
Date:   Sat, 14 Nov 2020 09:46:10 +0100
Message-Id: <20201114084613.13503-4-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The firmware blob can contain optional ELF sections: .resource_table
section and .pru_irq_map one. The second one contains the PRUSS
interrupt mapping description, which needs to be setup before powering
on the PRU core. To avoid RAM wastage this ELF section is not mapped to
any ELF segment (by the firmware linker) and therefore is not loaded to
PRU memory.

The PRU interrupt configuration is handled within the PRUSS INTC irqchip
driver and leverages the system events to interrupt channels and host
interrupts mapping configuration. Relevant irq routing information is
passed through a special .pru_irq_map ELF section (for interrupts routed
to and used by PRU cores) or via the PRU application's device tree node
(for interrupts routed to and used by the main CPU). The mappings are
currently programmed during the booting/shutdown of the PRU.

The interrupt configuration passed through .pru_irq_map ELF section is
optional. It varies on specific firmware functionality and therefore
have to be unwinded during PRU stop and performed again during
PRU start.

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 191 ++++++++++++++++++++++++++++++++-
 drivers/remoteproc/pru_rproc.h |  46 ++++++++
 2 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 drivers/remoteproc/pru_rproc.h

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index c94c8e965c21..825e9c7e081b 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -11,13 +11,16 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/pruss_driver.h>
 #include <linux/remoteproc.h>
 
 #include "remoteproc_internal.h"
 #include "remoteproc_elf_helpers.h"
+#include "pru_rproc.h"
 
 /* PRU_ICSS_PRU_CTRL registers */
 #define PRU_CTRL_CTRL		0x0000
@@ -41,6 +44,8 @@
 #define PRU_SDRAM_DA	0x2000	/* Secondary Data RAM */
 #define PRU_SHRDRAM_DA	0x10000 /* Shared Data RAM */
 
+#define MAX_PRU_SYS_EVENTS 160
+
 /**
  * enum pru_iomem - PRU core memory/register range identifiers
  *
@@ -64,6 +69,10 @@ enum pru_iomem {
  * @rproc: remoteproc pointer for this PRU core
  * @mem_regions: data for each of the PRU memory regions
  * @fw_name: name of firmware image used during loading
+ * @mapped_irq: virtual interrupt numbers of created fw specific mapping
+ * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
+ * @pru_interrupt_map_sz: pru_interrupt_map size
+ * @evt_count: number of mapped events
  */
 struct pru_rproc {
 	int id;
@@ -72,6 +81,10 @@ struct pru_rproc {
 	struct rproc *rproc;
 	struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
 	const char *fw_name;
+	int *mapped_irq;
+	struct pru_irq_rsc *pru_interrupt_map;
+	size_t pru_interrupt_map_sz;
+	ssize_t evt_count;
 };
 
 static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
@@ -85,15 +98,107 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
 	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
 }
 
+static void pru_dispose_irq_mapping(struct pru_rproc *pru)
+{
+	while (--pru->evt_count >= 0) {
+		if (pru->mapped_irq[pru->evt_count] > 0)
+			irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
+	}
+
+	kfree(pru->mapped_irq);
+}
+
+/*
+ * Parse the custom PRU interrupt map resource and configure the INTC
+ * appropriately.
+ */
+static int pru_handle_intrmap(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct pru_rproc *pru = rproc->priv;
+	struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
+	struct irq_fwspec fwspec;
+	struct device_node *irq_parent;
+	int i, ret = 0;
+
+	/* not having pru_interrupt_map is not an error */
+	if (!rsc)
+		return 0;
+
+	/* currently supporting only type 0 */
+	if (rsc->type != 0) {
+		dev_err(dev, "unsupported rsc type: %d\n", rsc->type);
+		return -EINVAL;
+	}
+
+	if (rsc->num_evts < 0 || rsc->num_evts > MAX_PRU_SYS_EVENTS)
+		return -EINVAL;
+
+	if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
+	    pru->pru_interrupt_map_sz)
+		return -EINVAL;
+
+	pru->evt_count = rsc->num_evts;
+	pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);
+	if (!pru->mapped_irq)
+		return -ENOMEM;
+
+	/*
+	 * parse and fill in system event to interrupt channel and
+	 * channel-to-host mapping
+	 */
+	irq_parent = of_irq_find_parent(pru->dev->of_node);
+	if (!irq_parent) {
+		kfree(pru->mapped_irq);
+		return -ENODEV;
+	}
+
+	fwspec.fwnode = of_node_to_fwnode(irq_parent);
+	fwspec.param_count = 3;
+	for (i = 0; i < pru->evt_count; i++) {
+		fwspec.param[0] = rsc->pru_intc_map[i].event;
+		fwspec.param[1] = rsc->pru_intc_map[i].chnl;
+		fwspec.param[2] = rsc->pru_intc_map[i].host;
+
+		dev_dbg(dev, "mapping%d: event %d, chnl %d, host %d\n",
+		       i, fwspec.param[0], fwspec.param[1], fwspec.param[2]);
+
+		pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
+		if (pru->mapped_irq[i] < 0) {
+			dev_err(dev, "failed to get virq\n");
+			ret = pru->mapped_irq[i];
+			goto map_fail;
+		}
+	}
+
+	return ret;
+
+map_fail:
+	pru_dispose_irq_mapping(pru);
+
+	return ret;
+}
+
 static int pru_rproc_start(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	struct pru_rproc *pru = rproc->priv;
 	u32 val;
+	int ret;
 
 	dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
 		pru->id, (rproc->bootaddr >> 2));
 
+	ret = pru_handle_intrmap(rproc);
+	/*
+	 * reset references to pru interrupt map - they will stop being valid
+	 * after rproc_start returns
+	 */
+	pru->pru_interrupt_map = NULL;
+	pru->pru_interrupt_map_sz = 0;
+	if (ret)
+		return ret;
+
 	val = CTRL_CTRL_EN | ((rproc->bootaddr >> 2) << 16);
 	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
 
@@ -112,6 +217,10 @@ static int pru_rproc_stop(struct rproc *rproc)
 	val &= ~CTRL_CTRL_EN;
 	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
 
+	/* dispose irq mapping - new firmware can provide new mapping */
+	if (pru->mapped_irq)
+		pru_dispose_irq_mapping(pru);
+
 	return 0;
 }
 
@@ -274,16 +383,96 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static const void *
+pru_rproc_find_interrupt_map(struct device *dev, const struct firmware *fw)
+{
+	const void *shdr, *name_table_shdr;
+	const char *name_table;
+	const u8 *elf_data = (void *)fw->data;
+	u8 class = fw_elf_get_class(fw);
+	size_t fw_size = fw->size;
+	const void *ehdr = elf_data;
+	u16 shnum = elf_hdr_get_e_shnum(class, ehdr);
+	u32 elf_shdr_get_size = elf_size_of_shdr(class);
+	u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
+	int i;
+
+	/* first, get the section header according to the elf class */
+	shdr = elf_data + elf_hdr_get_e_shoff(class, ehdr);
+	/* compute name table section header entry in shdr array */
+	name_table_shdr = shdr + (shstrndx * elf_shdr_get_size);
+	/* finally, compute the name table section address in elf */
+	name_table = elf_data + elf_shdr_get_sh_offset(class, name_table_shdr);
+
+	for (i = 0; i < shnum; i++, shdr += elf_shdr_get_size) {
+		u64 size = elf_shdr_get_sh_size(class, shdr);
+		u64 offset = elf_shdr_get_sh_offset(class, shdr);
+		u32 name = elf_shdr_get_sh_name(class, shdr);
+
+		if (strcmp(name_table + name, ".pru_irq_map"))
+			continue;
+
+		/* make sure we have the entire table */
+		if (offset + size > fw_size || offset + size < size) {
+			dev_err(dev, "interrupt map sec truncated\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		/* make sure table has at least the header */
+		if (sizeof(struct pru_irq_rsc) > size) {
+			dev_err(dev, "header-less interrupt map sec\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		return shdr;
+	}
+
+	dev_dbg(dev, "no .pru_irq_map section found for this fw\n");
+
+	return NULL;
+}
+
+/*
+ * Usa a custom parse_fw callback function for dealing with standard
+ * resource table and a PRU-specific custom ELF section.
+ *
+ * The firmware blob can contain optional ELF sections: .resource_table section
+ * and .pru_irq_map one. The second one contains the PRUSS interrupt mapping
+ * description, which needs to be setup before powering on the PRU core. To
+ * avoid RAM wastage this ELF section is not mapped to any ELF segment (by the
+ * firmware linker) and therefore is not loaded to PRU memory.
+ */
 static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
+	struct device *dev = &rproc->dev;
+	struct pru_rproc *pru = rproc->priv;
+	const u8 *elf_data = fw->data;
+	const void *shdr;
+	u8 class = fw_elf_get_class(fw);
+	u64 sh_offset;
 	int ret;
 
 	/* load optional rsc table */
 	ret = rproc_elf_load_rsc_table(rproc, fw);
 	if (ret == -EINVAL)
 		dev_dbg(&rproc->dev, "no resource table found for this fw\n");
+	else if (ret)
+		return ret;
 
-	return ret;
+	/* find .pru_interrupt_map section, not having it is not an error */
+	shdr = pru_rproc_find_interrupt_map(dev, fw);
+	if (IS_ERR(shdr))
+		return PTR_ERR(shdr);
+
+	if (!shdr)
+		return 0;
+
+	/* preserve pointer to PRU interrupt map together with it size */
+	sh_offset = elf_shdr_get_sh_offset(class, shdr);
+	pru->pru_interrupt_map = (struct pru_irq_rsc *)(elf_data + sh_offset);
+	pru->pru_interrupt_map_sz = elf_shdr_get_sh_size(class, shdr);
+
+	return 0;
 }
 
 /*
diff --git a/drivers/remoteproc/pru_rproc.h b/drivers/remoteproc/pru_rproc.h
new file mode 100644
index 000000000000..8ee9c3171610
--- /dev/null
+++ b/drivers/remoteproc/pru_rproc.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * PRUSS Remote Processor specific types
+ *
+ * Copyright (C) 2014-2020 Texas Instruments Incorporated - https://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#ifndef _PRU_RPROC_H_
+#define _PRU_RPROC_H_
+
+/**
+ * struct pruss_int_map - PRU system events _to_ channel and host mapping
+ * @event: number of the system event
+ * @chnl: channel number assigned to a given @event
+ * @host: host number assigned to a given @chnl
+ *
+ * PRU system events are mapped to channels, and these channels are mapped
+ * to host interrupts. Events can be mapped to channels in a one-to-one or
+ * many-to-one ratio (multiple events per channel), and channels can be
+ * mapped to host interrupts in a one-to-one or many-to-one ratio (multiple
+ * channels per interrupt).
+ */
+struct pruss_int_map {
+	u8 event;
+	u8 chnl;
+	u8 host;
+};
+
+/**
+ * struct pru_irq_rsc - PRU firmware section header for IRQ data
+ * @type: resource type
+ * @num_evts: number of described events
+ * @pru_intc_map: PRU interrupt routing description
+ *
+ * The PRU firmware blob can contain optional .pru_irq_map ELF section, which
+ * provides the PRUSS interrupt mapping description. The pru_irq_rsc struct
+ * describes resource entry format.
+ */
+struct pru_irq_rsc {
+	u8 type;
+	u8 num_evts;
+	struct pruss_int_map pru_intc_map[];
+} __packed;
+
+#endif	/* _PRU_RPROC_H_ */
-- 
2.29.0

