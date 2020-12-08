Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACEC2D2CD3
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 15:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729823AbgLHOMm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 09:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbgLHOMl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 09:12:41 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255DCC0619DC
        for <linux-omap@vger.kernel.org>; Tue,  8 Dec 2020 06:10:49 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id m12so1587558lfo.7
        for <linux-omap@vger.kernel.org>; Tue, 08 Dec 2020 06:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrmPgaht3F54ekOZjpnxRQJRgPSdJ6wC/G9opJrBVN8=;
        b=inXM++kM5P/h1IHNIRmF9OWWtUw5y4lowenOLGJkshRcFvttw3Wc3nWDC6MYg0Bg+j
         6qMf3UDd5YvznisJaBllC0lq9SVn4CO3IqGkMCDWwvNGOpfkXwE0AbNiuVdr9Qiu/ffE
         5vWuF0iFRW0QDIvst4n+UZq3QkCEROfWaLSU1Zv4IARqs8ubxet5rn3ndcVh9mIUuvTb
         MswU9PFuUCV/rZB4wtvL6r5VCCrihH3v2C9DJhMBi4U5PyciG5TvybuRDjp+fpSEDCIg
         sETzUz1eCovTPMWCKaeYdUsQyOv8HnaawWVuE34RHBGX9J0Uy3e1ARD7z64/ftjYbpun
         hQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrmPgaht3F54ekOZjpnxRQJRgPSdJ6wC/G9opJrBVN8=;
        b=tnDZzhxeMLj+PEJHucBKKMpmZ6RzEDCnadl9qKAAkya/my/5zmwetQ/Uq0L/0Lz7K4
         VWPTGQKhCzyopo+5JbvKPRKLrVLLGhYK6y0p0IvOv0hXLIepG0lqFhKK11QbdYDYfzts
         gVpbtAEjwVK0MyXZsvJiceTSgsVm9jEYbLVj0v8RDDNNWC18V0FdLfEIpVMAEAQTpPHF
         gg9jeS0qJcOGZnzZGqpuhCmVYHj0v+jJbre80kQiKTYzqqfp/hdnCpMvC1iTgAwEJ/M5
         1+A8oBlNn5H0Z2tgQmWp+U6BIH6RiSOpSNSI4O659bwP2q8jPrKDw17q4smFVmTiIYZh
         7Itw==
X-Gm-Message-State: AOAM533um1nlCzN13dCCVY22Dv/q55PUEEDAVefTRGHdT2QLkuLVx9Jc
        I5janaVzx+3oZfPd91j2dTbOhA==
X-Google-Smtp-Source: ABdhPJxeE9oobELcm/ICpJLmSov3AMZFnAz4s4rQI/lwGCOnJjhGGEAHUi5SN4i7y4Ry/Mhfe5zinw==
X-Received: by 2002:a19:f80a:: with SMTP id a10mr3890840lff.36.1607436645928;
        Tue, 08 Dec 2020 06:10:45 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h23sm417017ljh.115.2020.12.08.06.10.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 06:10:45 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH v4 5/6] remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs
Date:   Tue,  8 Dec 2020 15:10:01 +0100
Message-Id: <20201208141002.17777-6-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
References: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 AM65x family of SoCs have the next generation of the PRU-ICSS
processor subsystem, commonly referred to as ICSSG. Each ICSSG processor
subsystem on AM65x SR1.0 contains two primary PRU cores and two new
auxiliary PRU cores called RTUs. The AM65x SR2.0 SoCs have a revised
ICSSG IP that is based off the subsequent IP revision used on J721E
SoCs. This IP instance has two new custom auxiliary PRU cores called
Transmit PRUs (Tx_PRUs) in addition to the existing PRUs and RTUs.

Each RTU and Tx_PRU cores have their own dedicated IRAM (smaller than
a PRU), Control and debug feature sets, but is different in terms of
sub-modules integrated around it and does not have the full capabilities
associated with a PRU core. The RTU core is typically used to aid a
PRU core in accelerating data transfers, while the Tx_PRU cores is
normally used to control the TX L2 FIFO if enabled in Ethernet
applications. Both can also be used to run independent applications.
The RTU and Tx_PRU cores though share the same Data RAMs as the PRU
cores, so the memories have to be partitioned carefully between different
applications. The new cores also support a new sub-module called Task
Manager to support two different context thread executions.

Enhance the existing PRU remoteproc driver to support these new PRU, RTU
and Tx PRU cores by using specific compatibles. The initial names for the
firmware images for each PRU core are retrieved from DT nodes, and can
be adjusted through sysfs if required.

The PRU remoteproc driver has to be specifically modified to use a
custom memcpy function within its ELF loader implementation for these
new cores in order to overcome a limitation with copying data into each
of the core's IRAM memories. These memory ports support only 4-byte
writes, and any sub-word order byte writes clear out the remaining
bytes other than the bytes being written within the containing word.
The default ARM64 memcpy also cannot be used as it throws an exception
when the preferred 8-byte copy operation is attempted. This choice is
made by using a state flag that is set only on K3 SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v3->v4:
- No changes.

v2->v3:
Address Mathieu comments:
- Change type of some local variable in pru_rproc_memcpy from 'int *' to
  'u32 *'. At the occasion use size_t for 'size' inside mentioned
  function.
- Add Reviewed-by: tag.

v1->v2:
- Update documentation of pru_rproc_memcpy() according to Suman
  comments.
- Update documentation of is_k3 flag.
---
 drivers/remoteproc/pru_rproc.c | 140 ++++++++++++++++++++++++++++++---
 1 file changed, 131 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 59240fd82f56..421ebbc1c02d 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -46,10 +46,14 @@
 #define PRU_DEBUG_GPREG(x)	(0x0000 + (x) * 4)
 #define PRU_DEBUG_CT_REG(x)	(0x0080 + (x) * 4)
 
-/* PRU Core IRAM address masks */
+/* PRU/RTU/Tx_PRU Core IRAM address masks */
 #define PRU_IRAM_ADDR_MASK	0x3ffff
 #define PRU0_IRAM_ADDR_MASK	0x34000
 #define PRU1_IRAM_ADDR_MASK	0x38000
+#define RTU0_IRAM_ADDR_MASK	0x4000
+#define RTU1_IRAM_ADDR_MASK	0x6000
+#define TX_PRU0_IRAM_ADDR_MASK	0xa000
+#define TX_PRU1_IRAM_ADDR_MASK	0xc000
 
 /* PRU device addresses for various type of PRU RAMs */
 #define PRU_IRAM_DA	0	/* Instruction RAM */
@@ -74,12 +78,38 @@ enum pru_iomem {
 	PRU_IOMEM_MAX,
 };
 
+/**
+ * enum pru_type - PRU core type identifier
+ *
+ * @PRU_TYPE_PRU: Programmable Real-time Unit
+ * @PRU_TYPE_RTU: Auxiliary Programmable Real-Time Unit
+ * @PRU_TYPE_TX_PRU: Transmit Programmable Real-Time Unit
+ * @PRU_TYPE_MAX: just keep this one at the end
+ */
+enum pru_type {
+	PRU_TYPE_PRU = 0,
+	PRU_TYPE_RTU,
+	PRU_TYPE_TX_PRU,
+	PRU_TYPE_MAX,
+};
+
+/**
+ * struct pru_private_data - device data for a PRU core
+ * @type: type of the PRU core (PRU, RTU, Tx_PRU)
+ * @is_k3: flag used to identify the need for special load handling
+ */
+struct pru_private_data {
+	enum pru_type type;
+	unsigned int is_k3 : 1;
+};
+
 /**
  * struct pru_rproc - PRU remoteproc structure
  * @id: id of the PRU core within the PRUSS
  * @dev: PRU core device pointer
  * @pruss: back-reference to parent PRUSS structure
  * @rproc: remoteproc pointer for this PRU core
+ * @data: PRU core specific data
  * @mem_regions: data for each of the PRU memory regions
  * @fw_name: name of firmware image used during loading
  * @mapped_irq: virtual interrupt numbers of created fw specific mapping
@@ -94,6 +124,7 @@ struct pru_rproc {
 	struct device *dev;
 	struct pruss *pruss;
 	struct rproc *rproc;
+	const struct pru_private_data *data;
 	struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
 	const char *fw_name;
 	unsigned int *mapped_irq;
@@ -319,11 +350,12 @@ static int pru_rproc_start(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	struct pru_rproc *pru = rproc->priv;
+	const char *names[PRU_TYPE_MAX] = { "PRU", "RTU", "Tx_PRU" };
 	u32 val;
 	int ret;
 
-	dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
-		pru->id, (rproc->bootaddr >> 2));
+	dev_dbg(dev, "starting %s%d: entry-point = 0x%llx\n",
+		names[pru->data->type], pru->id, (rproc->bootaddr >> 2));
 
 	ret = pru_handle_intrmap(rproc);
 	/*
@@ -345,9 +377,10 @@ static int pru_rproc_stop(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	struct pru_rproc *pru = rproc->priv;
+	const char *names[PRU_TYPE_MAX] = { "PRU", "RTU", "Tx_PRU" };
 	u32 val;
 
-	dev_dbg(dev, "stopping PRU%d\n", pru->id);
+	dev_dbg(dev, "stopping %s%d\n", names[pru->data->type], pru->id);
 
 	val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
 	val &= ~CTRL_CTRL_EN;
@@ -459,9 +492,52 @@ static struct rproc_ops pru_rproc_ops = {
 	.da_to_va	= pru_rproc_da_to_va,
 };
 
+/*
+ * Custom memory copy implementation for ICSSG PRU/RTU/Tx_PRU Cores
+ *
+ * The ICSSG PRU/RTU/Tx_PRU cores have a memory copying issue with IRAM
+ * memories, that is not seen on previous generation SoCs. The data is reflected
+ * properly in the IRAM memories only for integer (4-byte) copies. Any unaligned
+ * copies result in all the other pre-existing bytes zeroed out within that
+ * 4-byte boundary, thereby resulting in wrong text/code in the IRAMs. Also, the
+ * IRAM memory port interface does not allow any 8-byte copies (as commonly used
+ * by ARM64 memcpy implementation) and throws an exception. The DRAM memory
+ * ports do not show this behavior.
+ */
+static int pru_rproc_memcpy(void *dest, const void *src, size_t count)
+{
+	const u32 *s = src;
+	u32 *d = dest;
+	size_t size = count / 4;
+	u32 *tmp_src = NULL;
+
+	/*
+	 * TODO: relax limitation of 4-byte aligned dest addresses and copy
+	 * sizes
+	 */
+	if ((long)dest % 4 || count % 4)
+		return -EINVAL;
+
+	/* src offsets in ELF firmware image can be non-aligned */
+	if ((long)src % 4) {
+		tmp_src = kmemdup(src, count, GFP_KERNEL);
+		if (!tmp_src)
+			return -ENOMEM;
+		s = tmp_src;
+	}
+
+	while (size--)
+		*d++ = *s++;
+
+	kfree(tmp_src);
+
+	return 0;
+}
+
 static int
 pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
 {
+	struct pru_rproc *pru = rproc->priv;
 	struct device *dev = &rproc->dev;
 	struct elf32_hdr *ehdr;
 	struct elf32_phdr *phdr;
@@ -509,7 +585,17 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		memcpy(ptr, elf_data + phdr->p_offset, filesz);
+		if (pru->data->is_k3 && is_iram) {
+			ret = pru_rproc_memcpy(ptr, elf_data + phdr->p_offset,
+					       filesz);
+			if (ret) {
+				dev_err(dev, "PRU memory copy failed for da 0x%x memsz 0x%x\n",
+					da, memsz);
+				break;
+			}
+		} else {
+			memcpy(ptr, elf_data + phdr->p_offset, filesz);
+		}
 
 		/* skip the memzero logic performed by remoteproc ELF loader */
 	}
@@ -615,9 +701,17 @@ static int pru_rproc_set_id(struct pru_rproc *pru)
 	int ret = 0;
 
 	switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & PRU_IRAM_ADDR_MASK) {
+	case TX_PRU0_IRAM_ADDR_MASK:
+		fallthrough;
+	case RTU0_IRAM_ADDR_MASK:
+		fallthrough;
 	case PRU0_IRAM_ADDR_MASK:
 		pru->id = 0;
 		break;
+	case TX_PRU1_IRAM_ADDR_MASK:
+		fallthrough;
+	case RTU1_IRAM_ADDR_MASK:
+		fallthrough;
 	case PRU1_IRAM_ADDR_MASK:
 		pru->id = 1;
 		break;
@@ -638,8 +732,13 @@ static int pru_rproc_probe(struct platform_device *pdev)
 	struct rproc *rproc = NULL;
 	struct resource *res;
 	int i, ret;
+	const struct pru_private_data *data;
 	const char *mem_names[PRU_IOMEM_MAX] = { "iram", "control", "debug" };
 
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = of_property_read_string(np, "firmware-name", &fw_name);
 	if (ret) {
 		dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
@@ -672,6 +771,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
 
 	pru = rproc->priv;
 	pru->dev = dev;
+	pru->data = data;
 	pru->pruss = platform_get_drvdata(ppdev);
 	pru->rproc = rproc;
 	pru->fw_name = fw_name;
@@ -723,11 +823,33 @@ static int pru_rproc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pru_private_data pru_data = {
+	.type = PRU_TYPE_PRU,
+};
+
+static const struct pru_private_data k3_pru_data = {
+	.type = PRU_TYPE_PRU,
+	.is_k3 = 1,
+};
+
+static const struct pru_private_data k3_rtu_data = {
+	.type = PRU_TYPE_RTU,
+	.is_k3 = 1,
+};
+
+static const struct pru_private_data k3_tx_pru_data = {
+	.type = PRU_TYPE_TX_PRU,
+	.is_k3 = 1,
+};
+
 static const struct of_device_id pru_rproc_match[] = {
-	{ .compatible = "ti,am3356-pru", },
-	{ .compatible = "ti,am4376-pru", },
-	{ .compatible = "ti,am5728-pru", },
-	{ .compatible = "ti,k2g-pru",    },
+	{ .compatible = "ti,am3356-pru",	.data = &pru_data },
+	{ .compatible = "ti,am4376-pru",	.data = &pru_data },
+	{ .compatible = "ti,am5728-pru",	.data = &pru_data },
+	{ .compatible = "ti,k2g-pru",		.data = &pru_data },
+	{ .compatible = "ti,am654-pru",		.data = &k3_pru_data },
+	{ .compatible = "ti,am654-rtu",		.data = &k3_rtu_data },
+	{ .compatible = "ti,am654-tx-pru",	.data = &k3_tx_pru_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pru_rproc_match);
-- 
2.29.0

