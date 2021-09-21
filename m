Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F428413261
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbhIULRs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:17:48 -0400
Received: from muru.com ([72.249.23.125]:35712 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232380AbhIULRm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:17:42 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CD1E580A8;
        Tue, 21 Sep 2021 11:16:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/5] mmc: sdhci-omap: Add omap_offset to support omap3 and earlier
Date:   Tue, 21 Sep 2021 14:15:58 +0300
Message-Id: <20210921111600.24577-4-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921111600.24577-1-tony@atomide.com>
References: <20210921111600.24577-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The omap specific registers are at offset 0x100 from base for omap4 and
later, and for omap3 and earlier they are at offset 0. Let's handle also
the earlier SoCs by adding omap_offset.

Note that eventually we should just move to using standard sdhci register
access for the sdhci range with new offsets starting at 0x100.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 61 ++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -21,9 +21,14 @@
 
 #include "sdhci-pltfm.h"
 
-#define SDHCI_OMAP_SYSCONFIG	0x110
+/*
+ * Note that the register offsets used here are from omap_regs
+ * base which is 0x100 for omap4 and later, and 0 for omap3 and
+ * earlier.
+ */
+#define SDHCI_OMAP_SYSCONFIG	0x10
 
-#define SDHCI_OMAP_CON		0x12c
+#define SDHCI_OMAP_CON		0x2c
 #define CON_DW8			BIT(5)
 #define CON_DMA_MASTER		BIT(20)
 #define CON_DDR			BIT(19)
@@ -33,20 +38,20 @@
 #define CON_INIT		BIT(1)
 #define CON_OD			BIT(0)
 
-#define SDHCI_OMAP_DLL		0x0134
+#define SDHCI_OMAP_DLL		0x34
 #define DLL_SWT			BIT(20)
 #define DLL_FORCE_SR_C_SHIFT	13
 #define DLL_FORCE_SR_C_MASK	(0x7f << DLL_FORCE_SR_C_SHIFT)
 #define DLL_FORCE_VALUE		BIT(12)
 #define DLL_CALIB		BIT(1)
 
-#define SDHCI_OMAP_CMD		0x20c
+#define SDHCI_OMAP_CMD		0x10c
 
-#define SDHCI_OMAP_PSTATE	0x0224
+#define SDHCI_OMAP_PSTATE	0x124
 #define PSTATE_DLEV_DAT0	BIT(20)
 #define PSTATE_DATI		BIT(1)
 
-#define SDHCI_OMAP_HCTL		0x228
+#define SDHCI_OMAP_HCTL		0x128
 #define HCTL_SDBP		BIT(8)
 #define HCTL_SDVS_SHIFT		9
 #define HCTL_SDVS_MASK		(0x7 << HCTL_SDVS_SHIFT)
@@ -54,28 +59,28 @@
 #define HCTL_SDVS_30		(0x6 << HCTL_SDVS_SHIFT)
 #define HCTL_SDVS_18		(0x5 << HCTL_SDVS_SHIFT)
 
-#define SDHCI_OMAP_SYSCTL	0x22c
+#define SDHCI_OMAP_SYSCTL	0x12c
 #define SYSCTL_CEN		BIT(2)
 #define SYSCTL_CLKD_SHIFT	6
 #define SYSCTL_CLKD_MASK	0x3ff
 
-#define SDHCI_OMAP_STAT		0x230
+#define SDHCI_OMAP_STAT		0x130
 
-#define SDHCI_OMAP_IE		0x234
+#define SDHCI_OMAP_IE		0x134
 #define INT_CC_EN		BIT(0)
 
-#define SDHCI_OMAP_ISE		0x238
+#define SDHCI_OMAP_ISE		0x138
 
-#define SDHCI_OMAP_AC12		0x23c
+#define SDHCI_OMAP_AC12		0x13c
 #define AC12_V1V8_SIGEN		BIT(19)
 #define AC12_SCLK_SEL		BIT(23)
 
-#define SDHCI_OMAP_CAPA		0x240
+#define SDHCI_OMAP_CAPA		0x140
 #define CAPA_VS33		BIT(24)
 #define CAPA_VS30		BIT(25)
 #define CAPA_VS18		BIT(26)
 
-#define SDHCI_OMAP_CAPA2	0x0244
+#define SDHCI_OMAP_CAPA2	0x144
 #define CAPA2_TSDR50		BIT(13)
 
 #define SDHCI_OMAP_TIMEOUT	1		/* 1 msec */
@@ -93,7 +98,8 @@
 #define SDHCI_OMAP_SPECIAL_RESET	BIT(1)
 
 struct sdhci_omap_data {
-	u32 offset;
+	int omap_offset;	/* Offset for omap regs from base */
+	u32 offset;		/* Offset for SDHCI regs from base */
 	u8 flags;
 };
 
@@ -112,6 +118,10 @@ struct sdhci_omap_host {
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	**pinctrl_state;
 	bool			is_tuning;
+
+	/* Offset for omap specific registers from base */
+	int			omap_offset;
+
 	/* Omap specific context save */
 	u32			con;
 	u32			hctl;
@@ -127,13 +137,13 @@ static void sdhci_omap_stop_clock(struct sdhci_omap_host *omap_host);
 static inline u32 sdhci_omap_readl(struct sdhci_omap_host *host,
 				   unsigned int offset)
 {
-	return readl(host->base + offset);
+	return readl(host->base + host->omap_offset + offset);
 }
 
 static inline void sdhci_omap_writel(struct sdhci_omap_host *host,
 				     unsigned int offset, u32 data)
 {
-	writel(data, host->base + offset);
+	writel(data, host->base + host->omap_offset + offset);
 }
 
 static int sdhci_omap_set_pbias(struct sdhci_omap_host *omap_host,
@@ -1009,36 +1019,54 @@ static const struct sdhci_pltfm_data sdhci_omap_pdata = {
 	.ops = &sdhci_omap_ops,
 };
 
+static const struct sdhci_omap_data omap2430_data = {
+	.omap_offset = 0,
+	.offset = 0x100,
+};
+
+static const struct sdhci_omap_data omap3_data = {
+	.omap_offset = 0,
+	.offset = 0x100,
+};
+
 static const struct sdhci_omap_data omap4_data = {
+	.omap_offset = 0x100,
 	.offset = 0x200,
 	.flags = SDHCI_OMAP_SPECIAL_RESET,
 };
 
 static const struct sdhci_omap_data omap5_data = {
+	.omap_offset = 0x100,
 	.offset = 0x200,
 	.flags = SDHCI_OMAP_SPECIAL_RESET,
 };
 
 static const struct sdhci_omap_data k2g_data = {
+	.omap_offset = 0x100,
 	.offset = 0x200,
 };
 
 static const struct sdhci_omap_data am335_data = {
+	.omap_offset = 0x100,
 	.offset = 0x200,
 	.flags = SDHCI_OMAP_SPECIAL_RESET,
 };
 
 static const struct sdhci_omap_data am437_data = {
+	.omap_offset = 0x100,
 	.offset = 0x200,
 	.flags = SDHCI_OMAP_SPECIAL_RESET,
 };
 
 static const struct sdhci_omap_data dra7_data = {
+	.omap_offset = 0x100,
 	.offset = 0x200,
 	.flags	= SDHCI_OMAP_REQUIRE_IODELAY,
 };
 
 static const struct of_device_id omap_sdhci_match[] = {
+	{ .compatible = "ti,omap2430-sdhci", .data = &omap2430_data },
+	{ .compatible = "ti,omap3-sdhci", .data = &omap3_data },
 	{ .compatible = "ti,omap4-sdhci", .data = &omap4_data },
 	{ .compatible = "ti,omap5-sdhci", .data = &omap5_data },
 	{ .compatible = "ti,dra7-sdhci", .data = &dra7_data },
@@ -1223,6 +1251,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	omap_host->power_mode = MMC_POWER_UNDEFINED;
 	omap_host->timing = MMC_TIMING_LEGACY;
 	omap_host->flags = data->flags;
+	omap_host->omap_offset = data->omap_offset;
 	host->ioaddr += offset;
 	host->mapbase = regs->start + offset;
 
-- 
2.33.0
