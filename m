Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125A32B2C3F
	for <lists+linux-omap@lfdr.de>; Sat, 14 Nov 2020 09:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgKNIqp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Nov 2020 03:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgKNIqo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Nov 2020 03:46:44 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35E9C061A4A
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:42 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d17so17652906lfq.10
        for <linux-omap@vger.kernel.org>; Sat, 14 Nov 2020 00:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/nSWEsw3N6fSKKLuz4XMLcWzgg3KLh595YgOxVRdOs=;
        b=N2JwHMrPfSCZtpY3q2xbT+ib5L1HzYHliqPlmcYp9QsD2VBTyZKlDdbpGuiOFoJd1s
         52+L9WETgaAeMww0c5i8OTnbug++dQoSJ0h7+K+lDnRpglJY3CEsa8su/PqZr0U1lKQg
         r5HAu3k15jf4yz3c+LI71v1m2P/mpF51p8O2ha8LsW/FM4q0Kj3gB3yLEjuUU22rhv7k
         nN5dl3awHgK8joTyqs975AkNlM1P0mZe8C+Hp9+azEMoonWwf2UHgxDo2IJ9dbo/z6LK
         IqMLpuPKn6xVz1/e1Q2og6dDca8UOCwyr22MKH2TxlEZLvf0sbZSqgBhr0amgtdkB3mi
         jhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/nSWEsw3N6fSKKLuz4XMLcWzgg3KLh595YgOxVRdOs=;
        b=gYMnVgLpw9tYL8C0bVUggnl+tx2t8YlcGtjWajp5LCiezZ1l0zd3zavsg4dyOTfjkG
         KRpgb6gpDUg7QP8uGu4viTofAtykz3E2p94PG3M5IByPihkqxXjqzJDckkIkEp1dV9qg
         wBOVjpC6ju7mK8d8iqsHn+wO+jaRfR91tx+yPuOoQKgqhDZKN37RAGBSEjfeHt7mQBEp
         oMqKpA/kvst5yvKIofhKln/qKKPuubra5C4lKITlqSNXV3xw9tdJPDcRZG3B+JpwyV5U
         0cGvvk1Di1jHZf4a55SHVaq3QVVNEpVn3Zxbc+lOVZwpD0WcOfW4yGLE3oOtkOGUNis/
         8lAQ==
X-Gm-Message-State: AOAM5321vEKSbtD2tj8zGJU/g7desRfBZvuwCUlA0/fU3j8g1dR9MPTI
        VZg5uFfR41IqLNmdnXG9moIupQ==
X-Google-Smtp-Source: ABdhPJydz8kP6av8ZiAuObPfCUcyTmQd+SirxJXI3YER6a5DTo1JgeQT9UyQvyt+lPNEc3iKShgWIA==
X-Received: by 2002:a05:6512:368a:: with SMTP id d10mr2224684lfs.579.1605343601373;
        Sat, 14 Nov 2020 00:46:41 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id f62sm1870081lfd.144.2020.11.14.00.46.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 00:46:40 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: [PATCH 4/6] remoteproc/pru: Add pru-specific debugfs support
Date:   Sat, 14 Nov 2020 09:46:11 +0100
Message-Id: <20201114084613.13503-5-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
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
index 825e9c7e081b..33806ddcbd5d 100644
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
 #define PRU0_IRAM_ADDR_MASK	0x34000
 #define PRU1_IRAM_ADDR_MASK	0x38000
@@ -73,6 +85,8 @@ enum pru_iomem {
  * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
  * @pru_interrupt_map_sz: pru_interrupt_map size
  * @evt_count: number of mapped events
+ * @dbg_single_step: debug state variable to set PRU into single step mode
+ * @dbg_continuous: debug state variable to restore PRU execution mode
  */
 struct pru_rproc {
 	int id;
@@ -85,6 +99,8 @@ struct pru_rproc {
 	struct pru_irq_rsc *pru_interrupt_map;
 	size_t pru_interrupt_map_sz;
 	ssize_t evt_count;
+	u32 dbg_single_step;
+	u32 dbg_continuous;
 };
 
 static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
@@ -98,6 +114,125 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
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
 	while (--pru->evt_count >= 0) {
@@ -575,6 +710,8 @@ static int pru_rproc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pru_rproc_create_debug_entries(rproc);
+
 	dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
 
 	return 0;
-- 
2.29.0

