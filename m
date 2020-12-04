Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADE82CF57C
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 21:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgLDUUK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 15:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbgLDUUJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 15:20:09 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD8BC094242
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 12:18:23 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l11so9425294lfg.0
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 12:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xt8QuWXk/g6askbWi99LuVBrM97JNGcNTAl0D+UbaYI=;
        b=rKfCVJUwnd66MPqnMbOC508RPjgxrmg4EUxCnqngmcl/AnBfBf5eQFoQlK1so9JKc3
         ousXxG8hArnns/n+jOrvMbNouOh/wK51EZqkJjpLiGJUdyacqJ3dbC7zXXPj8WafTdrl
         4U+Mzf19EfB5F7I2R2q9L3UTRd3SQUcC43jb2+PEi610jqTycoHdOmDxfAxLi5Jj9KDe
         SU2DX81y4K5/5wg077xEMWvlwnMZzt5hyJlVZjJAyRz8KeqxnNiCgOPlr73Lg1sWjPHB
         JYUoyqa3t7hn7tN5+vuN8jHsnOPLukfl5mmVAa2b7982jUP334Hr81u44KGuX1+EIjdw
         itsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xt8QuWXk/g6askbWi99LuVBrM97JNGcNTAl0D+UbaYI=;
        b=PhPIxapaYAmfLsdJW5pRdfWu1JBkyKX3BIVMDkMKqmTbiiy2CA3Tzd+a5iMYdacD+R
         wweVaUULFR3hDysqaW6U/q6KKovmSCJiS/pSibKkE4JhpqZM8fHy2LMnOLUV06B3EJxf
         5Ig6rb4jlUrVMiK+bdgi0XhiPfEJU66Fdd3KXP0Ng0toyk9gQxnMOsGNk7/m3hfgVcAb
         bB6fTHqGadG90dVuYy3I4dMfW7zSWNkdf6kVLRLayKviq9ApIfzvXa9OPoogm0deRK/J
         4rSx320HegNaRVZC7qe+KBpZfpxzRjMV8TVvOAjpxP37hTBk4634zY+peVYf8d/a6+7C
         +1LQ==
X-Gm-Message-State: AOAM533n9TxB83ffUzhiwmxgnmAar5Vc066ENFwkpCdaq/CPpHfrenP6
        xuCjUpS2oc0yOR9Yrzx9ojBSsg==
X-Google-Smtp-Source: ABdhPJz7ITP46bNgVVcIhlX2UDpR0V2gXIhU5e4UTfVXSAbV6WJqncAsO/D+QNg9QBaFS3xUyVl5Tw==
X-Received: by 2002:a19:6144:: with SMTP id m4mr3959929lfk.546.1607113101740;
        Fri, 04 Dec 2020 12:18:21 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w21sm2036918lff.280.2020.12.04.12.18.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Dec 2020 12:18:21 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH v3 4/6] remoteproc: pru: Add pru-specific debugfs support
Date:   Fri,  4 Dec 2020 21:18:05 +0100
Message-Id: <20201204201807.14716-5-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
References: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
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
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v2->v3:
Address Mathieu comments:
- Remove extra line before DEFINE_SHOW_ATTRIBUTE().
- Add Reviewed-by: tag.
---
 drivers/remoteproc/pru_rproc.c | 136 +++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 4ef59d15d888..b22c4903299e 100644
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
 	unsigned int *mapped_irq;
 	struct pru_irq_rsc *pru_interrupt_map;
 	size_t pru_interrupt_map_sz;
+	u32 dbg_single_step;
+	u32 dbg_continuous;
 	u8 evt_count;
 };
 
@@ -99,6 +115,124 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
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
@@ -571,6 +705,8 @@ static int pru_rproc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pru_rproc_create_debug_entries(rproc);
+
 	dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
 
 	return 0;
-- 
2.29.0

