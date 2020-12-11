Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFE82D77F5
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 15:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406285AbgLKOdP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 09:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406247AbgLKOcU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 09:32:20 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13CFC0611CB
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:48 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id n11so6260681lji.5
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4kaS8K9NJ34up6Kjdshn5LWbMYzqvOti/z8UesqHNI=;
        b=KlC1mAT3qQPNJXPLj8Xkgal4/KRedM5OyNLIxtjlqAjGmXYRSRLNq6CxROHw1S2+LR
         mlQoJM1RhLhIvwHXnsCZtEjOhGkN1y9OJMJ2WlAzYtuufl+Aea3Z7hwwnMMvA/GrjNkg
         9U/RO4fzvrW96MWs5zglVc08bB+bk6w6rWm0FOV3uBZCL/uq2eIYcLfcvt1mp3xs6FLG
         DuwhFSZkKFGop46MVYkSSnxziPxWPahHDCeuIJqGnuzGbndsoRJVKcckPN7nNF+fGYnR
         UqSoEJv862YcgJh/kIzXoIPt1dYc4i5UUavubF21JtUXFMtO0fftcxw0beNn+WlEeZVg
         eIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4kaS8K9NJ34up6Kjdshn5LWbMYzqvOti/z8UesqHNI=;
        b=B30NzNuwpXxlvsTHZc9Q8/d2wS1QMYgkI5TpwDS3IioA8505Z/iNataD5OxbAfX6bP
         KgXCqAcbjhrvs7PM3b/iD6+enqqbya+5gjXsj7t0Zvh7PJ6Cvgw7BSV7YYmiVlGGqK/2
         cWJoTYwkZugVwEKzE6y63KErK6cxEPgHQYVxCiaYCIFuh2Du52dw/3R0GAUpKq1kYhMf
         1ky3myXo+OqOh0dWxzcMpkJC80Pmwg0FGo7KtbeselanDEa/pq7BmPVSD8gOpK7ksRQU
         FG90B2nw32l7sVy/Lhy+TVcYsebVCJlZW08PBxixrSmrebsPbi9eTPNlDCfulD/ql7wu
         zJcQ==
X-Gm-Message-State: AOAM530XNyvPZ4GW1X6V7TNr3u5Tz++r1+PnTtdFYkXc+q9Wz+0nRVwL
        77Obp/nMZRmjlMxvIzhPwv/xIA==
X-Google-Smtp-Source: ABdhPJzzkmbYh7QGxMWgHi37kKpusIhnf5UHgu3mXs+NJ5ZhvmBB6B3Ck/sQFGWP8Az2niFFEReizw==
X-Received: by 2002:a2e:9546:: with SMTP id t6mr5288769ljh.222.1607697047196;
        Fri, 11 Dec 2020 06:30:47 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x26sm906491lfq.112.2020.12.11.06.30.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 06:30:46 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH 4/5] remoteproc: pru: Add pru_rproc_set_ctable() function
Date:   Fri, 11 Dec 2020 15:29:32 +0100
Message-Id: <20201211142933.25784-5-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Roger Quadros <rogerq@ti.com>

Some firmwares expect the OS drivers to configure the CTABLE
entries publishing dynamically allocated memory regions. For
example, the PRU Ethernet firmwares use the C28 and C30 entries
for retrieving the Shared RAM and System SRAM (OCMC) areas
allocated by the PRU Ethernet client driver.

Provide a way for users to do that through a new API,
pru_rproc_set_ctable(). The API returns 0 on success and
a negative value on error.

NOTE:
The programmable CTABLE entries are typically re-programmed by
the PRU firmwares when dealing with a certain block of memory
during block processing. This API provides an interface to the
PRU client drivers to publish a dynamically allocated memory
block with the PRU firmware using a CTABLE entry instead of a
negotiated address in shared memory. Additional synchronization
may be needed between the PRU client drivers and firmwares if
different addresses needs to be published at run-time reusing
the same CTABLE entry.

Co-developed-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/remoteproc/pru_rproc.c | 59 ++++++++++++++++++++++++++++++++++
 include/linux/pruss.h          | 22 +++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index bfb53967edda..ac13e4452a57 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -118,6 +118,7 @@ struct pru_private_data {
  * @mapped_irq: virtual interrupt numbers of created fw specific mapping
  * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
  * @pru_interrupt_map_sz: pru_interrupt_map size
+ * @rmw_lock: lock for read, modify, write operations on registers
  * @dbg_single_step: debug state variable to set PRU into single step mode
  * @dbg_continuous: debug state variable to restore PRU execution mode
  * @evt_count: number of mapped events
@@ -135,6 +136,7 @@ struct pru_rproc {
 	unsigned int *mapped_irq;
 	struct pru_irq_rsc *pru_interrupt_map;
 	size_t pru_interrupt_map_sz;
+	spinlock_t rmw_lock; /* register access lock */
 	u32 dbg_single_step;
 	u32 dbg_continuous;
 	u8 evt_count;
@@ -151,6 +153,23 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
 	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
 }
 
+static inline
+void pru_control_set_reg(struct pru_rproc *pru, unsigned int reg,
+			 u32 mask, u32 set)
+{
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pru->rmw_lock, flags);
+
+	val = pru_control_read_reg(pru, reg);
+	val &= ~mask;
+	val |= (set & mask);
+	pru_control_write_reg(pru, reg, val);
+
+	spin_unlock_irqrestore(&pru->rmw_lock, flags);
+}
+
 static struct rproc *__pru_rproc_get(struct device_node *np, int index)
 {
 	struct device_node *rproc_np = NULL;
@@ -266,6 +285,45 @@ void pru_rproc_put(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(pru_rproc_put);
 
+/**
+ * pru_rproc_set_ctable() - set the constant table index for the PRU
+ * @rproc: the rproc instance of the PRU
+ * @c: constant table index to set
+ * @addr: physical address to set it to
+ *
+ * Return: 0 on success, or errno in error case.
+ */
+int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
+{
+	struct pru_rproc *pru = rproc->priv;
+	unsigned int reg;
+	u32 mask, set;
+	u16 idx;
+	u16 idx_mask;
+
+	if (IS_ERR_OR_NULL(rproc))
+		return -EINVAL;
+
+	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))
+		return -ENODEV;
+
+	/* pointer is 16 bit and index is 8-bit so mask out the rest */
+	idx_mask = (c >= PRU_C28) ? 0xFFFF : 0xFF;
+
+	/* ctable uses bit 8 and upwards only */
+	idx = (addr >> 8) & idx_mask;
+
+	/* configurable ctable (i.e. C24) starts at PRU_CTRL_CTBIR0 */
+	reg = PRU_CTRL_CTBIR0 + 4 * (c >> 1);
+	mask = idx_mask << (16 * (c & 1));
+	set = idx << (16 * (c & 1));
+
+	pru_control_set_reg(pru, reg, mask, set);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pru_rproc_set_ctable);
+
 static inline u32 pru_debug_read_reg(struct pru_rproc *pru, unsigned int reg)
 {
 	return readl_relaxed(pru->mem_regions[PRU_IOMEM_DEBUG].va + reg);
@@ -895,6 +953,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
 	pru->pruss = platform_get_drvdata(ppdev);
 	pru->rproc = rproc;
 	pru->fw_name = fw_name;
+	spin_lock_init(&pru->rmw_lock);
 	mutex_init(&pru->lock);
 
 	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
diff --git a/include/linux/pruss.h b/include/linux/pruss.h
index 43cb5c2eed08..903d0c0b75be 100644
--- a/include/linux/pruss.h
+++ b/include/linux/pruss.h
@@ -23,13 +23,29 @@ enum pruss_pru_id {
 	PRUSS_NUM_PRUS,
 };
 
+/*
+ * enum pru_ctable_idx - Configurable Constant table index identifiers
+ */
+enum pru_ctable_idx {
+	PRU_C24 = 0,
+	PRU_C25,
+	PRU_C26,
+	PRU_C27,
+	PRU_C28,
+	PRU_C29,
+	PRU_C30,
+	PRU_C31,
+};
+
 struct device_node;
+struct rproc;
 
 #if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
 
 struct rproc *pru_rproc_get(struct device_node *np, int index,
 			    enum pruss_pru_id *pru_id);
 void pru_rproc_put(struct rproc *rproc);
+int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr);
 
 #else
 
@@ -41,6 +57,12 @@ pru_rproc_get(struct device_node *np, int index, enum pruss_pru_id *pru_id)
 
 static inline void pru_rproc_put(struct rproc *rproc) { }
 
+static inline int pru_rproc_set_ctable(struct rproc *rproc,
+				       enum pru_ctable_idx c, u32 addr)
+{
+	return -ENOTSUPP;
+}
+
 #endif /* CONFIG_PRU_REMOTEPROC */
 
 static inline bool is_pru_rproc(struct device *dev)
-- 
2.29.0

