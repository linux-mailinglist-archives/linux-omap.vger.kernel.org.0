Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416902D7EB0
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 19:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436877AbgLKStp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 13:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436764AbgLKStH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 13:49:07 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97053C061282
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:35 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y22so12031606ljn.9
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dyHsTJlcQ/DwhU6wIqjlDoykB2TJbiA9Zakot90S9Vs=;
        b=s8hMlrRDfCXKGv3HbwBnjy2oFH/99B5AkmJ6C6nONeyDiAl1vLqb4kpj/VPt3dacBh
         xjzyamxYYefF0fBSrlHgtapsfk2YedemOAbIcMe60inCtTxiLWElxGPiYjm6niPQzNHu
         3zSKjducrUXRRqGauoMGcuTq5hmcr+uxhB3IWOfIIR6j+POPekXbWvvsMDV+VgSZ22sK
         G1woGS5ahBLmk54bwAEGlNZkgA3juAtkxotifqiqFL/ygRiKOwYd7D2TY73syb6n/22+
         RYy+vRtN4ykfkmwQRYs5sOaYx8Bq0IZiIFoEtNGpD2lTVQDYVjGhgjWwsHXOyGrVCwuh
         PJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dyHsTJlcQ/DwhU6wIqjlDoykB2TJbiA9Zakot90S9Vs=;
        b=csbgnX6pTCmmARXbouEeUaBgWKIGw5kZYMB9BO/S2z7+lC5wDMxi7NQuhRe17iMmhh
         PkKxdMBrd49m/+g0NaARedzHJdr7KabwBYH+6fnobblJGKCzP+7C1VTKnRzxdw2yW81m
         ue3eqWGHqphU0pisNKggCY6LBI04WCl2MVvxXi+/DOeaw7eHXkjgBfyk1AN5GaBacUUk
         ErOj4tQyFjonSDsZvMSeHAsDFnx0Af+HrJ+a7RE01Ni3a6jIb4aDhJgxkeGJvgS7DQFx
         LH3KedLHgQwmiG8zyDbJSmduTMhz+zV5GV48JqjzkBRGVhA8sHZB2K8yTJqK1FFas8Oj
         F+gg==
X-Gm-Message-State: AOAM532roG6xAIVVNbswU1Ho8aMCtbV5PHXZPJx8J8fM49hC56VbpB92
        LaJ9vS/vgaVWF0QZcCp5KW8tWktb8c6tIg==
X-Google-Smtp-Source: ABdhPJyK+WN12qzVekgb7fTYpdtyMWsdx9teuCAg5WdStL+wDNvhz0wty7pw4y7FuSTgVI0l92RDzQ==
X-Received: by 2002:a2e:6c10:: with SMTP id h16mr2959620ljc.404.1607712513417;
        Fri, 11 Dec 2020 10:48:33 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id b12sm903316lfb.139.2020.12.11.10.48.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 10:48:32 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: [PATCH 3/6] soc: ti: pruss: Add pruss_cfg_read()/update() API
Date:   Fri, 11 Dec 2020 19:48:08 +0100
Message-Id: <20201211184811.6490-4-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
References: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add two new generic API pruss_cfg_read() and pruss_cfg_update() to
the PRUSS platform driver to allow other drivers to read and program
respectively a register within the PRUSS CFG sub-module represented
by a syscon driver. This interface provides a simple way for client
drivers without having them to include and parse the CFG syscon node
within their respective device nodes. Various useful registers and
macros for certain register bit-fields and their values have also
been added.

It is the responsibility of the client drivers to reconfigure or
reset a particular register upon any failures.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/soc/ti/pruss.c |  41 +++++++++++++++++
 include/linux/pruss.h  | 102 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 7569a7fc94f6..56e0ac948796 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -164,6 +164,47 @@ int pruss_release_mem_region(struct pruss *pruss,
 }
 EXPORT_SYMBOL_GPL(pruss_release_mem_region);
 
+/**
+ * pruss_cfg_read() - read a PRUSS CFG sub-module register
+ * @pruss: the pruss instance handle
+ * @reg: register offset within the CFG sub-module
+ * @val: pointer to return the value in
+ *
+ * Reads a given register within the PRUSS CFG sub-module and
+ * returns it through the passed-in @val pointer
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+int pruss_cfg_read(struct pruss *pruss, unsigned int reg, unsigned int *val)
+{
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	return regmap_read(pruss->cfg_regmap, reg, val);
+}
+EXPORT_SYMBOL_GPL(pruss_cfg_read);
+
+/**
+ * pruss_cfg_update() - configure a PRUSS CFG sub-module register
+ * @pruss: the pruss instance handle
+ * @reg: register offset within the CFG sub-module
+ * @mask: bit mask to use for programming the @val
+ * @val: value to write
+ *
+ * Programs a given register within the PRUSS CFG sub-module
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
+		     unsigned int mask, unsigned int val)
+{
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	return regmap_update_bits(pruss->cfg_regmap, reg, mask, val);
+}
+EXPORT_SYMBOL_GPL(pruss_cfg_update);
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
diff --git a/include/linux/pruss.h b/include/linux/pruss.h
index ec5b6609b5e5..9cef536c6cb5 100644
--- a/include/linux/pruss.h
+++ b/include/linux/pruss.h
@@ -10,12 +10,99 @@
 #ifndef __LINUX_PRUSS_H
 #define __LINUX_PRUSS_H
 
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
 #define PRU_RPROC_DRVNAME "pru-rproc"
 
+/*
+ * PRU_ICSS_CFG registers
+ * SYSCFG, ISRP, ISP, IESP, IECP, SCRP applicable on AMxxxx devices only
+ */
+#define PRUSS_CFG_REVID		0x00
+#define PRUSS_CFG_SYSCFG	0x04
+#define PRUSS_CFG_GPCFG(x)	(0x08 + (x) * 4)
+#define PRUSS_CFG_CGR		0x10
+#define PRUSS_CFG_ISRP		0x14
+#define PRUSS_CFG_ISP		0x18
+#define PRUSS_CFG_IESP		0x1C
+#define PRUSS_CFG_IECP		0x20
+#define PRUSS_CFG_SCRP		0x24
+#define PRUSS_CFG_PMAO		0x28
+#define PRUSS_CFG_MII_RT	0x2C
+#define PRUSS_CFG_IEPCLK	0x30
+#define PRUSS_CFG_SPP		0x34
+#define PRUSS_CFG_PIN_MX	0x40
+
+/* PRUSS_GPCFG register bits */
+#define PRUSS_GPCFG_PRU_GPO_SH_SEL		BIT(25)
+
+#define PRUSS_GPCFG_PRU_DIV1_SHIFT		20
+#define PRUSS_GPCFG_PRU_DIV1_MASK		GENMASK(24, 20)
+
+#define PRUSS_GPCFG_PRU_DIV0_SHIFT		15
+#define PRUSS_GPCFG_PRU_DIV0_MASK		GENMASK(15, 19)
+
+#define PRUSS_GPCFG_PRU_GPO_MODE		BIT(14)
+#define PRUSS_GPCFG_PRU_GPO_MODE_DIRECT		0
+#define PRUSS_GPCFG_PRU_GPO_MODE_SERIAL		BIT(14)
+
+#define PRUSS_GPCFG_PRU_GPI_SB			BIT(13)
+
+#define PRUSS_GPCFG_PRU_GPI_DIV1_SHIFT		8
+#define PRUSS_GPCFG_PRU_GPI_DIV1_MASK		GENMASK(12, 8)
+
+#define PRUSS_GPCFG_PRU_GPI_DIV0_SHIFT		3
+#define PRUSS_GPCFG_PRU_GPI_DIV0_MASK		GENMASK(7, 3)
+
+#define PRUSS_GPCFG_PRU_GPI_CLK_MODE_POSITIVE	0
+#define PRUSS_GPCFG_PRU_GPI_CLK_MODE_NEGATIVE	BIT(2)
+#define PRUSS_GPCFG_PRU_GPI_CLK_MODE		BIT(2)
+
+#define PRUSS_GPCFG_PRU_GPI_MODE_MASK		GENMASK(1, 0)
+#define PRUSS_GPCFG_PRU_GPI_MODE_SHIFT		0
+
+#define PRUSS_GPCFG_PRU_MUX_SEL_SHIFT		26
+#define PRUSS_GPCFG_PRU_MUX_SEL_MASK		GENMASK(29, 26)
+
+/* PRUSS_MII_RT register bits */
+#define PRUSS_MII_RT_EVENT_EN			BIT(0)
+
+/* PRUSS_SPP register bits */
+#define PRUSS_SPP_XFER_SHIFT_EN			BIT(1)
+#define PRUSS_SPP_PRU1_PAD_HP_EN		BIT(0)
+
+/*
+ * enum pruss_gp_mux_sel - PRUSS GPI/O Mux modes for the
+ * PRUSS_GPCFG0/1 registers
+ *
+ * NOTE: The below defines are the most common values, but there
+ * are some exceptions like on 66AK2G, where the RESERVED and MII2
+ * values are interchanged. Also, this bit-field does not exist on
+ * AM335x SoCs
+ */
+enum pruss_gp_mux_sel {
+	PRUSS_GP_MUX_SEL_GP = 0,
+	PRUSS_GP_MUX_SEL_ENDAT,
+	PRUSS_GP_MUX_SEL_RESERVED,
+	PRUSS_GP_MUX_SEL_SD,
+	PRUSS_GP_MUX_SEL_MII2,
+	PRUSS_GP_MUX_SEL_MAX,
+};
+
+/*
+ * enum pruss_gpi_mode - PRUSS GPI configuration modes, used
+ *			 to program the PRUSS_GPCFG0/1 registers
+ */
+enum pruss_gpi_mode {
+	PRUSS_GPI_MODE_DIRECT = 0,
+	PRUSS_GPI_MODE_PARALLEL,
+	PRUSS_GPI_MODE_28BIT_SHIFT,
+	PRUSS_GPI_MODE_MII,
+};
+
 /*
  * enum pruss_pru_id - PRU core identifiers
  */
@@ -73,6 +160,9 @@ int pruss_request_mem_region(struct pruss *pruss, enum pruss_mem mem_id,
 			     struct pruss_mem_region *region);
 int pruss_release_mem_region(struct pruss *pruss,
 			     struct pruss_mem_region *region);
+int pruss_cfg_read(struct pruss *pruss, unsigned int reg, unsigned int *val);
+int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
+		     unsigned int mask, unsigned int val);
 
 #else
 
@@ -96,6 +186,18 @@ static inline int pruss_release_mem_region(struct pruss *pruss,
 	return -ENOTSUPP;
 }
 
+static inline int pruss_cfg_read(struct pruss *pruss, unsigned int reg,
+				 unsigned int *val)
+{
+	return -ENOTSUPP;
+}
+
+static inline int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
+				   unsigned int mask, unsigned int val)
+{
+	return -ENOTSUPP;
+}
+
 #endif /* CONFIG_TI_PRUSS */
 
 #if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
-- 
2.29.0

