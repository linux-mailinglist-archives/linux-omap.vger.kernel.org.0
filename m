Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D838A2B9425
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 15:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgKSOJF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 09:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbgKSOJE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 09:09:04 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342E0C061A4C
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:09:04 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id f11so8434100lfs.3
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 06:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4GxPRhf1TIGU81EpUXbruLnn+BtpK1ExU2vHQeREY0=;
        b=vBSuYvg13KmMeZL1yU4f5RRFf2wzhxAAcTCsgZ4SjZGbB+CV44bCK567h0U9AC7EES
         92cx325b0q4voNl5msMSWjJqd0bi+vhJZufqBc1ZtDrJ/w4cUAVL+fAPYVgiHOgP5TiF
         DdJfdiyh3vMa43X0A0m2pcaH9I43d7hIa5l55xIthcXsSJg/Le476tH4L6UXPVYu51Nr
         9C3eyiHlR0Hj0l3TayZmFwkvdNmlOV34i2T3plBQQlcQLnxa2gp/zYEWQk5/DP6F9Xsp
         xrT/f1UjN2qmUa4JxIiqika4OtW3fb5LH+wYYb7ICQ64FtqnPZLvXABJcJTltJhbEuvo
         41Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4GxPRhf1TIGU81EpUXbruLnn+BtpK1ExU2vHQeREY0=;
        b=tlpVrdzufaau2hW0zbhjbj3TrY4AlqO7rQD/xbt8vTMQczE8XAfuep8qELQxJfkjNj
         vHderXKlFm2NpuFUpidDAVYRvIxwDiy7aniJ3wn1QNA72Rk1pIDkifFKSKvj5r3Nm/IH
         ylZkuTZVHFUzdcQKtZ9RhivBHVTfL0I8UlKNlVHja5osSpwPiS5/FVOrCDIttvOLD28o
         F0YfS1eMp94bvaf6FoL53Y+4LckOIVHjbPtCcwhAqcGVWp9C0WUYa0vdEO1nF0aRvGAu
         tas/e7I+tN3aXjC7S7qdoSln++fuQG1WCntd8egSzUcgiYaTbug2FFxJZSjk3sjffVdO
         jTug==
X-Gm-Message-State: AOAM5324nm/G7040Z8tKPjzqa5FCh4wqsVDM5w2zbZ3Y8xxqRygV4W8w
        3wmKg30ueMliV56mm0ZXJgN54Q==
X-Google-Smtp-Source: ABdhPJyRn7A1RKV3RZMiI/5shJL442Wtsn6rGAWrt1d4D3IYdyuCRSB8OhszdrQHx0sgxe/oG82RhA==
X-Received: by 2002:a19:e04:: with SMTP id 4mr5611671lfo.193.1605794942614;
        Thu, 19 Nov 2020 06:09:02 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h12sm4024706lfl.74.2020.11.19.06.09.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 06:09:01 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v2 4/6] remoteproc/pru: Add pru-specific debugfs support
Date:   Thu, 19 Nov 2020 15:08:48 +0100
Message-Id: <20201119140850.12268-5-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The remoteproc core creates certain standard debugfs entries,
that does not give a whole lot of useful information for the
PRUs. The PRU remoteproc driver is enhanced to add additional
debugfs entries for PRU. These will be auto-cleaned up when
the parent rproc debug directory is removed.

The enhanced debugfs support adds two new entries: 'regs' and
'single_step'. The 'regs' dumps out the useful CTRL sub-module
registers as well as each of the 32 GPREGs and CT_REGs registers.
The GPREGs and CT_REGs though are printed only when the PRU is
halted and accessible as per the IP design.

The 'single_step' utilizes the single-step execution of the PRU
cores. Writing a non-zero value performs a single step, and a
zero value restores the PRU to execute in the same mode as the
mode before the first single step. (note: if the PRU is halted
because of a halt instruction, then no change occurs).

Logic for setting the PC and jumping over a halt instruction shall
be added in the future.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 137 +++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index c68c3d6bfddd..d5f04d77ad54 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/debugfs.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -25,6 +26,13 @@
 /* PRU_ICSS_PRU_CTRL registers */
 #define PRU_CTRL_CTRL		0x0000
 #define PRU_CTRL_STS		0x0004
+#define PRU_CTRL_WAKEUP_EN	0x0008
+#define PRU_CTRL_CYCLE		0x000C
+#define PRU_CTRL_STALL		0x0010
+#define PRU_CTRL_CTBIR0		0x0020
+#define PRU_CTRL_CTBIR1		0x0024
+#define PRU_CTRL_CTPPR0		0x0028
+#define PRU_CTRL_CTPPR1		0x002C
 
 /* CTRL register bit-fields */
 #define CTRL_CTRL_SOFT_RST_N	BIT(0)
@@ -34,6 +42,10 @@
 #define CTRL_CTRL_SINGLE_STEP	BIT(8)
 #define CTRL_CTRL_RUNSTATE	BIT(15)
 
+/* PRU_ICSS_PRU_DEBUG registers */
+#define PRU_DEBUG_GPREG(x)	(0x0000 + (x) * 4)
+#define PRU_DEBUG_CT_REG(x)	(0x0080 + (x) * 4)
+
 /* PRU Core IRAM address masks */
 #define PRU_IRAM_ADDR_MASK	0x3ffff
 #define PRU0_IRAM_ADDR_MASK	0x34000
@@ -73,6 +85,8 @@ enum pru_iomem {
  * @mapped_irq: virtual interrupt numbers of created fw specific mapping
  * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
  * @pru_interrupt_map_sz: pru_interrupt_map size
+ * @dbg_single_step: debug state variable to set PRU into single step mode
+ * @dbg_continuous: debug state variable to restore PRU execution mode
  * @evt_count: number of mapped events
  */
 struct pru_rproc {
@@ -85,6 +99,8 @@ struct pru_rproc {
 	int *mapped_irq;
 	struct pru_irq_rsc *pru_interrupt_map;
 	size_t pru_interrupt_map_sz;
+	u32 dbg_single_step;
+	u32 dbg_continuous;
 	u8 evt_count;
 };
 
@@ -99,6 +115,125 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
 	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
 }
 
+static inline u32 pru_debug_read_reg(struct pru_rproc *pru, unsigned int reg)
+{
+	return readl_relaxed(pru->mem_regions[PRU_IOMEM_DEBUG].va + reg);
+}
+
+static int regs_show(struct seq_file *s, void *data)
+{
+	struct rproc *rproc = s->private;
+	struct pru_rproc *pru = rproc->priv;
+	int i, nregs = 32;
+	u32 pru_sts;
+	int pru_is_running;
+
+	seq_puts(s, "============== Control Registers ==============\n");
+	seq_printf(s, "CTRL      := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_CTRL));
+	pru_sts = pru_control_read_reg(pru, PRU_CTRL_STS);
+	seq_printf(s, "STS (PC)  := 0x%08x (0x%08x)\n", pru_sts, pru_sts << 2);
+	seq_printf(s, "WAKEUP_EN := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_WAKEUP_EN));
+	seq_printf(s, "CYCLE     := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_CYCLE));
+	seq_printf(s, "STALL     := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_STALL));
+	seq_printf(s, "CTBIR0    := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_CTBIR0));
+	seq_printf(s, "CTBIR1    := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_CTBIR1));
+	seq_printf(s, "CTPPR0    := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_CTPPR0));
+	seq_printf(s, "CTPPR1    := 0x%08x\n",
+		   pru_control_read_reg(pru, PRU_CTRL_CTPPR1));
+
+	seq_puts(s, "=============== Debug Registers ===============\n");
+	pru_is_running = pru_control_read_reg(pru, PRU_CTRL_CTRL) &
+				CTRL_CTRL_RUNSTATE;
+	if (pru_is_running) {
+		seq_puts(s, "PRU is executing, cannot print/access debug registers.\n");
+		return 0;
+	}
+
+	for (i = 0; i < nregs; i++) {
+		seq_printf(s, "GPREG%-2d := 0x%08x\tCT_REG%-2d := 0x%08x\n",
+			   i, pru_debug_read_reg(pru, PRU_DEBUG_GPREG(i)),
+			   i, pru_debug_read_reg(pru, PRU_DEBUG_CT_REG(i)));
+	}
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(regs);
+
+/*
+ * Control PRU single-step mode
+ *
+ * This is a debug helper function used for controlling the single-step
+ * mode of the PRU. The PRU Debug registers are not accessible when the
+ * PRU is in RUNNING state.
+ *
+ * Writing a non-zero value sets the PRU into single-step mode irrespective
+ * of its previous state. The PRU mode is saved only on the first set into
+ * a single-step mode. Writing a zero value will restore the PRU into its
+ * original mode.
+ */
+static int pru_rproc_debug_ss_set(void *data, u64 val)
+{
+	struct rproc *rproc = data;
+	struct pru_rproc *pru = rproc->priv;
+	u32 reg_val;
+
+	val = val ? 1 : 0;
+	if (!val && !pru->dbg_single_step)
+		return 0;
+
+	reg_val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
+
+	if (val && !pru->dbg_single_step)
+		pru->dbg_continuous = reg_val;
+
+	if (val)
+		reg_val |= CTRL_CTRL_SINGLE_STEP | CTRL_CTRL_EN;
+	else
+		reg_val = pru->dbg_continuous;
+
+	pru->dbg_single_step = val;
+	pru_control_write_reg(pru, PRU_CTRL_CTRL, reg_val);
+
+	return 0;
+}
+
+static int pru_rproc_debug_ss_get(void *data, u64 *val)
+{
+	struct rproc *rproc = data;
+	struct pru_rproc *pru = rproc->priv;
+
+	*val = pru->dbg_single_step;
+
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(pru_rproc_debug_ss_fops, pru_rproc_debug_ss_get,
+			pru_rproc_debug_ss_set, "%llu\n");
+
+/*
+ * Create PRU-specific debugfs entries
+ *
+ * The entries are created only if the parent remoteproc debugfs directory
+ * exists, and will be cleaned up by the remoteproc core.
+ */
+static void pru_rproc_create_debug_entries(struct rproc *rproc)
+{
+	if (!rproc->dbg_dir)
+		return;
+
+	debugfs_create_file("regs", 0400, rproc->dbg_dir,
+			    rproc, &regs_fops);
+	debugfs_create_file("single_step", 0600, rproc->dbg_dir,
+			    rproc, &pru_rproc_debug_ss_fops);
+}
+
 static void pru_dispose_irq_mapping(struct pru_rproc *pru)
 {
 	while (pru->evt_count--) {
@@ -573,6 +708,8 @@ static int pru_rproc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pru_rproc_create_debug_entries(rproc);
+
 	dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
 
 	return 0;
-- 
2.29.0

