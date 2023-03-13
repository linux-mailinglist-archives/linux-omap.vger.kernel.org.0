Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28BD6B7584
	for <lists+linux-omap@lfdr.de>; Mon, 13 Mar 2023 12:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbjCMLMr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Mar 2023 07:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjCMLMV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Mar 2023 07:12:21 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EFD62B62;
        Mon, 13 Mar 2023 04:11:44 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32DBBbsi127510;
        Mon, 13 Mar 2023 06:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1678705897;
        bh=/LnQVwcLeT7f3U8ql/KJDiQzc4a7auQHB9YGQjTucTQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WUuwvbpAh00pBOfNCwAJTUSkwBTMNRgV6wefVnNoIzX9PwLDfIlDmklFvuMYI5QZv
         tVvnLPtMgLTwRVo8nr2J/YFsWLTRVass866+3nvrwPFEw/0RrZq1POGnRMu33dGb96
         ZKRBhgs7EFxYgxLWrbafmBON/mKs2wjim7QWC56Y=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32DBBbNO124042
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Mar 2023 06:11:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Mar 2023 06:11:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Mar 2023 06:11:37 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32DBBb98041246;
        Mon, 13 Mar 2023 06:11:37 -0500
Received: from localhost (a0501179-pc.dhcp.ti.com [10.24.69.114])
        by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 32DBBaRi032274;
        Mon, 13 Mar 2023 06:11:36 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        MD Danish Anwar <danishanwar@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <srk@ti.com>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: [PATCH v4 3/5] soc: ti: pruss: Add pruss_cfg_read()/update() API
Date:   Mon, 13 Mar 2023 16:41:25 +0530
Message-ID: <20230313111127.1229187-4-danishanwar@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230313111127.1229187-1-danishanwar@ti.com>
References: <20230313111127.1229187-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add two new generic API pruss_cfg_read() and pruss_cfg_update() to
the PRUSS platform driver to read and program respectively a register
within the PRUSS CFG sub-module represented by a syscon driver.

These APIs are internal to PRUSS driver. Various useful registers
and macros for certain register bit-fields and their values have also
been added.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/soc/ti/pruss.c           | 39 ++++++++++++++
 include/linux/remoteproc/pruss.h | 87 ++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index c8053c0d735f..26d8129b515c 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -164,6 +164,45 @@ int pruss_release_mem_region(struct pruss *pruss,
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
+static int pruss_cfg_read(struct pruss *pruss, unsigned int reg, unsigned int *val)
+{
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	return regmap_read(pruss->cfg_regmap, reg, val);
+}
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
+static int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
+			    unsigned int mask, unsigned int val)
+{
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	return regmap_update_bits(pruss->cfg_regmap, reg, mask, val);
+}
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
diff --git a/include/linux/remoteproc/pruss.h b/include/linux/remoteproc/pruss.h
index 33f930e0a0ce..12ef10b9fe9a 100644
--- a/include/linux/remoteproc/pruss.h
+++ b/include/linux/remoteproc/pruss.h
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
 /**
  * enum pruss_pru_id - PRU core identifiers
  * @PRUSS_PRU0: PRU Core 0.
-- 
2.25.1

