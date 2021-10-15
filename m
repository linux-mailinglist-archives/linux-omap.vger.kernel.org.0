Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7746F42EF0B
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 12:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238039AbhJOKtl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 06:49:41 -0400
Received: from muru.com ([72.249.23.125]:44880 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhJOKtk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 06:49:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AD19883F4;
        Fri, 15 Oct 2021 10:48:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/6] mmc: sdhci-omap: Handle voltages to add support omap4
Date:   Fri, 15 Oct 2021 13:47:16 +0300
Message-Id: <20211015104720.52240-3-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015104720.52240-1-tony@atomide.com>
References: <20211015104720.52240-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order to start deprecating the custom omap_hsmmc.c in favor of the
generic sdhci-omap driver, we need to add support for voltages for earlier
SoCs.

The PBIAS regulator on omap4 and earlier only supports nominal values of
1.8V and 3.0V, while omap5 and later support nominal values of 1.8V and
3.3V IO voltage.

This gets omap4/5 working with sdhci-omap driver.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 124 ++++++++++++++++++++++++++--------
 1 file changed, 96 insertions(+), 28 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -178,7 +178,7 @@ static int sdhci_omap_set_pbias(struct sdhci_omap_host *omap_host,
 }
 
 static int sdhci_omap_enable_iov(struct sdhci_omap_host *omap_host,
-				 unsigned int iov)
+				 unsigned int iov_pbias)
 {
 	int ret;
 	struct sdhci_host *host = omap_host->host;
@@ -189,14 +189,15 @@ static int sdhci_omap_enable_iov(struct sdhci_omap_host *omap_host,
 		return ret;
 
 	if (!IS_ERR(mmc->supply.vqmmc)) {
-		ret = regulator_set_voltage(mmc->supply.vqmmc, iov, iov);
-		if (ret) {
+		/* Pick the right voltage to allow 3.0V for 3.3V nominal PBIAS */
+		ret = mmc_regulator_set_vqmmc(mmc, &mmc->ios);
+		if (ret < 0) {
 			dev_err(mmc_dev(mmc), "vqmmc set voltage failed\n");
 			return ret;
 		}
 	}
 
-	ret = sdhci_omap_set_pbias(omap_host, true, iov);
+	ret = sdhci_omap_set_pbias(omap_host, true, iov_pbias);
 	if (ret)
 		return ret;
 
@@ -206,16 +207,28 @@ static int sdhci_omap_enable_iov(struct sdhci_omap_host *omap_host,
 static void sdhci_omap_conf_bus_power(struct sdhci_omap_host *omap_host,
 				      unsigned char signal_voltage)
 {
-	u32 reg;
+	u32 reg, capa;
 	ktime_t timeout;
 
 	reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_HCTL);
 	reg &= ~HCTL_SDVS_MASK;
 
-	if (signal_voltage == MMC_SIGNAL_VOLTAGE_330)
-		reg |= HCTL_SDVS_33;
-	else
+	switch (signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		capa = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
+		if (capa & CAPA_VS33)
+			reg |= HCTL_SDVS_33;
+		else if (capa & CAPA_VS30)
+			reg |= HCTL_SDVS_30;
+		else
+			dev_warn(omap_host->dev, "misconfigured CAPA: %08x\n",
+				 capa);
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+	default:
 		reg |= HCTL_SDVS_18;
+		break;
+	}
 
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, reg);
 
@@ -533,28 +546,32 @@ static int sdhci_omap_start_signal_voltage_switch(struct mmc_host *mmc,
 
 	if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330) {
 		reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
-		if (!(reg & CAPA_VS33))
+		if (!(reg & (CAPA_VS30 | CAPA_VS33)))
 			return -EOPNOTSUPP;
 
+		if (reg & CAPA_VS30)
+			iov = IOV_3V0;
+		else
+			iov = IOV_3V3;
+
 		sdhci_omap_conf_bus_power(omap_host, ios->signal_voltage);
 
 		reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_AC12);
 		reg &= ~AC12_V1V8_SIGEN;
 		sdhci_omap_writel(omap_host, SDHCI_OMAP_AC12, reg);
 
-		iov = IOV_3V3;
 	} else if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180) {
 		reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
 		if (!(reg & CAPA_VS18))
 			return -EOPNOTSUPP;
 
+		iov = IOV_1V8;
+
 		sdhci_omap_conf_bus_power(omap_host, ios->signal_voltage);
 
 		reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_AC12);
 		reg |= AC12_V1V8_SIGEN;
 		sdhci_omap_writel(omap_host, SDHCI_OMAP_AC12, reg);
-
-		iov = IOV_1V8;
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -910,34 +927,73 @@ static struct sdhci_ops sdhci_omap_ops = {
 	.set_timeout = sdhci_omap_set_timeout,
 };
 
-static int sdhci_omap_set_capabilities(struct sdhci_omap_host *omap_host)
+static unsigned int sdhci_omap_regulator_get_caps(struct device *dev,
+						  const char *name)
 {
-	u32 reg;
-	int ret = 0;
+	struct regulator *reg;
+	unsigned int caps = 0;
+
+	reg = regulator_get(dev, name);
+	if (IS_ERR(reg))
+		return ~0U;
+
+	if (regulator_is_supported_voltage(reg, 1700000, 1950000))
+		caps |= SDHCI_CAN_VDD_180;
+	if (regulator_is_supported_voltage(reg, 2700000, 3150000))
+		caps |= SDHCI_CAN_VDD_300;
+	if (regulator_is_supported_voltage(reg, 3150000, 3600000))
+		caps |= SDHCI_CAN_VDD_330;
+
+	regulator_put(reg);
+
+	return caps;
+}
+
+static int sdhci_omap_set_capabilities(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 	struct device *dev = omap_host->dev;
-	struct regulator *vqmmc;
+	const u32 mask = SDHCI_CAN_VDD_180 | SDHCI_CAN_VDD_300 | SDHCI_CAN_VDD_330;
+	unsigned int pbias, vqmmc, caps = 0;
+	u32 reg;
 
-	vqmmc = regulator_get(dev, "vqmmc");
-	if (IS_ERR(vqmmc)) {
-		ret = PTR_ERR(vqmmc);
-		goto reg_put;
-	}
+	pbias = sdhci_omap_regulator_get_caps(dev, "pbias");
+	vqmmc = sdhci_omap_regulator_get_caps(dev, "vqmmc");
+	caps = pbias & vqmmc;
+
+	if (pbias != ~0U && vqmmc == ~0U)
+		dev_warn(dev, "vqmmc regulator missing for pbias\n");
+	else if (caps == ~0U)
+		return 0;
+
+	/*
+	 * Quirk handling to allow 3.0V vqmmc with a valid 3.3V PBIAS. This is
+	 * needed for 3.0V ldo9_reg on omap5 at least.
+	 */
+	if (pbias != ~0U && (pbias & SDHCI_CAN_VDD_330) &&
+	    (vqmmc & SDHCI_CAN_VDD_300))
+		caps |= SDHCI_CAN_VDD_330;
 
 	/* voltage capabilities might be set by boot loader, clear it */
 	reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
 	reg &= ~(CAPA_VS18 | CAPA_VS30 | CAPA_VS33);
 
-	if (regulator_is_supported_voltage(vqmmc, IOV_3V3, IOV_3V3))
-		reg |= CAPA_VS33;
-	if (regulator_is_supported_voltage(vqmmc, IOV_1V8, IOV_1V8))
+	if (caps & SDHCI_CAN_VDD_180)
 		reg |= CAPA_VS18;
 
+	if (caps & SDHCI_CAN_VDD_300)
+		reg |= CAPA_VS30;
+
+	if (caps & SDHCI_CAN_VDD_330)
+		reg |= CAPA_VS33;
+
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_CAPA, reg);
 
-reg_put:
-	regulator_put(vqmmc);
+	host->caps &= ~mask;
+	host->caps |= caps;
 
-	return ret;
+	return 0;
 }
 
 static const struct sdhci_pltfm_data sdhci_omap_pdata = {
@@ -953,6 +1009,16 @@ static const struct sdhci_pltfm_data sdhci_omap_pdata = {
 	.ops = &sdhci_omap_ops,
 };
 
+static const struct sdhci_omap_data omap4_data = {
+	.offset = 0x200,
+	.flags = SDHCI_OMAP_SPECIAL_RESET,
+};
+
+static const struct sdhci_omap_data omap5_data = {
+	.offset = 0x200,
+	.flags = SDHCI_OMAP_SPECIAL_RESET,
+};
+
 static const struct sdhci_omap_data k2g_data = {
 	.offset = 0x200,
 };
@@ -973,6 +1039,8 @@ static const struct sdhci_omap_data dra7_data = {
 };
 
 static const struct of_device_id omap_sdhci_match[] = {
+	{ .compatible = "ti,omap4-sdhci", .data = &omap4_data },
+	{ .compatible = "ti,omap5-sdhci", .data = &omap5_data },
 	{ .compatible = "ti,dra7-sdhci", .data = &dra7_data },
 	{ .compatible = "ti,k2g-sdhci", .data = &k2g_data },
 	{ .compatible = "ti,am335-sdhci", .data = &am335_data },
@@ -1212,7 +1280,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 		goto err_rpm_disable;
 	}
 
-	ret = sdhci_omap_set_capabilities(omap_host);
+	ret = sdhci_omap_set_capabilities(host);
 	if (ret) {
 		dev_err(dev, "failed to set system capabilities\n");
 		goto err_put_sync;
-- 
2.33.0
