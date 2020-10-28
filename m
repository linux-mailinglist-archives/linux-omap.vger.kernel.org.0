Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FC029D349
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 22:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgJ1Vmb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 17:42:31 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:40402 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgJ1Vma (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Oct 2020 17:42:30 -0400
Received: by mail-yb1-f194.google.com with SMTP id n142so423778ybf.7;
        Wed, 28 Oct 2020 14:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FkONxrubBeV0K9NDgqUuTrfLU2bjv1Hi6p5HuEPDagA=;
        b=qUqagjcsY/zibC+S7NxLziAc/Uwm2JYa6+kO1J/18T0loF4MIpB81+0UZFd0PVI+OP
         repdBr/yhzX676eGKw60h+sETTGS71X7FFDiPFoqIzdHYP7qHbG30CjXi9wQOMRIEJR6
         AGrv9TM79tvk2b0PJd93WMVQxhg6T0ZCcL7IMyy7zuGeKozAw45+r+yBFOdmbCzTe851
         xsgOLol4kXkuUjVQzFPGhi+Ti+tYGyW+3x9KdiNDzC6K28/8lgLIBiHGEIferf4t+sai
         rBkti3buL5p0ysHN1+kznW3qKhURknli7/ngE906Bm3crKU5vVrLiSL4CSXBzNuVy8dj
         gNTQ==
X-Gm-Message-State: AOAM530BXBDTTTWLhcC+4CjMPuzK1jFDpF0pChDnKaMy3zGP1imjCqog
        QXiVh6/6ZzeP3fuhgB3rhAN9xuns5A==
X-Google-Smtp-Source: ABdhPJzRldLmMpkMOaPGlc4NZrFT2+VzfztCngKSNqWCal9FQuy3FOd7GppyAX27y/AJQUXeK7pwGg==
X-Received: by 2002:a9d:7119:: with SMTP id n25mr885379otj.9.1603918035446;
        Wed, 28 Oct 2020 13:47:15 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 13:47:14 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-pci@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Fabio Estevam <festevam@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jonathan Chocron <jonnyc@amazon.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Minghuan Lian <minghuan.Lian@nxp.com>,
        Mingkai Hu <mingkai.hu@nxp.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Roy Zang <roy.zang@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Yue Wang <yue.wang@Amlogic.com>
Subject: [PATCH 10/13] PCI: dwc: Move link handling into common code
Date:   Wed, 28 Oct 2020 15:46:43 -0500
Message-Id: <20201028204646.356535-11-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All the DWC drivers do link setup and checks at roughly the same time.
Let's use the existing .start_link() hook (currently only used in EP
mode) and move the link handling to the core code.

The behavior for a link down was inconsistent as some drivers would fail
probe in that case while others succeed. Let's standardize this to
succeed as there are usecases where devices (and the link) appear later
even without hotplug. For example, a reconfigured FPGA device.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Pratyush Anand <pratyush.anand@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  2 -
 drivers/pci/controller/dwc/pci-exynos.c       | 41 +++++++----------
 drivers/pci/controller/dwc/pci-imx6.c         |  9 ++--
 drivers/pci/controller/dwc/pci-keystone.c     |  9 ----
 drivers/pci/controller/dwc/pci-meson.c        | 24 ++++------
 drivers/pci/controller/dwc/pcie-armada8k.c    | 39 +++++++---------
 drivers/pci/controller/dwc/pcie-artpec6.c     |  2 -
 .../pci/controller/dwc/pcie-designware-host.c |  9 ++++
 .../pci/controller/dwc/pcie-designware-plat.c |  3 --
 drivers/pci/controller/dwc/pcie-histb.c       | 34 +++++++-------
 drivers/pci/controller/dwc/pcie-kirin.c       | 23 ++--------
 drivers/pci/controller/dwc/pcie-qcom.c        | 19 ++------
 drivers/pci/controller/dwc/pcie-spear13xx.c   | 46 ++++++++-----------
 drivers/pci/controller/dwc/pcie-tegra194.c    |  1 -
 drivers/pci/controller/dwc/pcie-uniphier.c    | 13 ++----
 15 files changed, 103 insertions(+), 171 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 6b75c68dddb5..054423d9646d 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -183,8 +183,6 @@ static int dra7xx_pcie_host_init(struct pcie_port *pp)
 
 	dw_pcie_setup_rc(pp);
 
-	dra7xx_pcie_establish_link(pci);
-	dw_pcie_wait_for_link(pci);
 	dw_pcie_msi_init(pp);
 	dra7xx_pcie_enable_interrupts(dra7xx);
 
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 7734394953e5..6498b615c834 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -229,30 +229,9 @@ static void exynos_pcie_assert_reset(struct exynos_pcie *ep)
 				GPIOF_OUT_INIT_HIGH, "RESET");
 }
 
-static int exynos_pcie_establish_link(struct exynos_pcie *ep)
+static int exynos_pcie_start_link(struct dw_pcie *pci)
 {
-	struct dw_pcie *pci = ep->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = pci->dev;
-
-	if (dw_pcie_link_up(pci)) {
-		dev_err(dev, "Link already up\n");
-		return 0;
-	}
-
-	exynos_pcie_assert_core_reset(ep);
-
-	phy_reset(ep->phy);
-
-	exynos_pcie_writel(ep->mem_res->elbi_base, 1,
-			PCIE_PWR_RESET);
-
-	phy_power_on(ep->phy);
-	phy_init(ep->phy);
-
-	exynos_pcie_deassert_core_reset(ep);
-	dw_pcie_setup_rc(pp);
-	exynos_pcie_assert_reset(ep);
+	struct exynos_pcie *ep = to_exynos_pcie(pci);
 
 	/* assert LTSSM enable */
 	exynos_pcie_writel(ep->mem_res->elbi_base, PCIE_ELBI_LTSSM_ENABLE,
@@ -386,7 +365,20 @@ static int exynos_pcie_host_init(struct pcie_port *pp)
 
 	pp->bridge->ops = &exynos_pci_ops;
 
-	exynos_pcie_establish_link(ep);
+	exynos_pcie_assert_core_reset(ep);
+
+	phy_reset(ep->phy);
+
+	exynos_pcie_writel(ep->mem_res->elbi_base, 1,
+			PCIE_PWR_RESET);
+
+	phy_power_on(ep->phy);
+	phy_init(ep->phy);
+
+	exynos_pcie_deassert_core_reset(ep);
+	dw_pcie_setup_rc(pp);
+	exynos_pcie_assert_reset(ep);
+
 	exynos_pcie_enable_interrupts(ep);
 
 	return 0;
@@ -430,6 +422,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 	.read_dbi = exynos_pcie_read_dbi,
 	.write_dbi = exynos_pcie_write_dbi,
 	.link_up = exynos_pcie_link_up,
+	.start_link = exynos_pcie_start_link,
 };
 
 static int __init exynos_pcie_probe(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 1b979c956fcd..20e249efb02c 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -745,9 +745,9 @@ static void imx6_pcie_ltssm_enable(struct device *dev)
 	}
 }
 
-static int imx6_pcie_establish_link(struct imx6_pcie *imx6_pcie)
+static int imx6_pcie_start_link(struct dw_pcie *pci)
 {
-	struct dw_pcie *pci = imx6_pcie->pci;
+	struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
 	struct device *dev = pci->dev;
 	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 tmp;
@@ -835,7 +835,6 @@ static int imx6_pcie_host_init(struct pcie_port *pp)
 	imx6_pcie_deassert_core_reset(imx6_pcie);
 	imx6_setup_phy_mpll(imx6_pcie);
 	dw_pcie_setup_rc(pp);
-	imx6_pcie_establish_link(imx6_pcie);
 	dw_pcie_msi_init(pp);
 
 	return 0;
@@ -865,7 +864,7 @@ static int imx6_add_pcie_port(struct imx6_pcie *imx6_pcie,
 }
 
 static const struct dw_pcie_ops dw_pcie_ops = {
-	/* No special ops needed, but pcie-designware still expects this struct */
+	.start_link = imx6_pcie_start_link,
 };
 
 #ifdef CONFIG_PM_SLEEP
@@ -974,7 +973,7 @@ static int imx6_pcie_resume_noirq(struct device *dev)
 	imx6_pcie_deassert_core_reset(imx6_pcie);
 	dw_pcie_setup_rc(pp);
 
-	ret = imx6_pcie_establish_link(imx6_pcie);
+	ret = imx6_pcie_start_link(imx6_pcie->pci);
 	if (ret < 0)
 		dev_info(dev, "pcie link is down after resume.\n");
 
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 784385ae6074..90b222b020a3 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -511,14 +511,8 @@ static void ks_pcie_stop_link(struct dw_pcie *pci)
 static int ks_pcie_start_link(struct dw_pcie *pci)
 {
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
-	struct device *dev = pci->dev;
 	u32 val;
 
-	if (dw_pcie_link_up(pci)) {
-		dev_dbg(dev, "link is already up\n");
-		return 0;
-	}
-
 	/* Initiate Link Training */
 	val = ks_pcie_app_readl(ks_pcie, CMD_STATUS);
 	ks_pcie_app_writel(ks_pcie, CMD_STATUS, LTSSM_EN_VAL | val);
@@ -833,9 +827,6 @@ static int __init ks_pcie_host_init(struct pcie_port *pp)
 			"Asynchronous external abort");
 #endif
 
-	ks_pcie_start_link(pci);
-	dw_pcie_wait_for_link(pci);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 10d65b3093e4..41a3351b100b 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -231,7 +231,7 @@ static void meson_pcie_assert_reset(struct meson_pcie *mp)
 	gpiod_set_value_cansleep(mp->reset_gpio, 0);
 }
 
-static void meson_pcie_init_dw(struct meson_pcie *mp)
+static void meson_pcie_ltssm_enable(struct meson_pcie *mp)
 {
 	u32 val;
 
@@ -289,20 +289,14 @@ static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
 }
 
-static int meson_pcie_establish_link(struct meson_pcie *mp)
+static int meson_pcie_start_link(struct dw_pcie *pci)
 {
-	struct dw_pcie *pci = &mp->pci;
-	struct pcie_port *pp = &pci->pp;
-
-	meson_pcie_init_dw(mp);
-	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
-	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
-
-	dw_pcie_setup_rc(pp);
+	struct meson_pcie *mp = to_meson_pcie(pci);
 
+	meson_pcie_ltssm_enable(mp);
 	meson_pcie_assert_reset(mp);
 
-	return dw_pcie_wait_for_link(pci);
+	return 0;
 }
 
 static int meson_pcie_rd_own_conf(struct pci_bus *bus, u32 devfn,
@@ -380,14 +374,13 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct meson_pcie *mp = to_meson_pcie(pci);
-	int ret;
 
 	pp->bridge->ops = &meson_pci_ops;
 
-	ret = meson_pcie_establish_link(mp);
-	if (ret)
-		return ret;
+	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
+	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
+	dw_pcie_setup_rc(pp);
 	dw_pcie_msi_init(pp);
 
 	return 0;
@@ -418,6 +411,7 @@ static int meson_add_pcie_port(struct meson_pcie *mp,
 
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = meson_pcie_link_up,
+	.start_link = meson_pcie_start_link,
 };
 
 static int meson_pcie_probe(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index 13901f359a41..dd2926bbb901 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -154,10 +154,24 @@ static int armada8k_pcie_link_up(struct dw_pcie *pci)
 	return 0;
 }
 
-static void armada8k_pcie_establish_link(struct armada8k_pcie *pcie)
+static int armada8k_pcie_start_link(struct dw_pcie *pci)
+{
+	u32 reg;
+
+	/* Start LTSSM */
+	reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_CONTROL_REG);
+	reg |= PCIE_APP_LTSSM_EN;
+	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_CONTROL_REG, reg);
+
+	return 0;
+}
+
+static int armada8k_pcie_host_init(struct pcie_port *pp)
 {
-	struct dw_pcie *pci = pcie->pci;
 	u32 reg;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	dw_pcie_setup_rc(pp);
 
 	if (!dw_pcie_link_up(pci)) {
 		/* Disable LTSSM state machine to enable configuration */
@@ -193,26 +207,6 @@ static void armada8k_pcie_establish_link(struct armada8k_pcie *pcie)
 	       PCIE_INT_C_ASSERT_MASK | PCIE_INT_D_ASSERT_MASK;
 	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK1_REG, reg);
 
-	if (!dw_pcie_link_up(pci)) {
-		/* Configuration done. Start LTSSM */
-		reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_CONTROL_REG);
-		reg |= PCIE_APP_LTSSM_EN;
-		dw_pcie_writel_dbi(pci, PCIE_GLOBAL_CONTROL_REG, reg);
-	}
-
-	/* Wait until the link becomes active again */
-	if (dw_pcie_wait_for_link(pci))
-		dev_err(pci->dev, "Link not up after reconfiguration\n");
-}
-
-static int armada8k_pcie_host_init(struct pcie_port *pp)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct armada8k_pcie *pcie = to_armada8k_pcie(pci);
-
-	dw_pcie_setup_rc(pp);
-	armada8k_pcie_establish_link(pcie);
-
 	return 0;
 }
 
@@ -269,6 +263,7 @@ static int armada8k_add_pcie_port(struct armada8k_pcie *pcie,
 
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = armada8k_pcie_link_up,
+	.start_link = armada8k_pcie_start_link,
 };
 
 static int armada8k_pcie_probe(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index a5239a58cee0..8b3da3038ac3 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -329,8 +329,6 @@ static int artpec6_pcie_host_init(struct pcie_port *pp)
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
 	dw_pcie_setup_rc(pp);
-	artpec6_pcie_establish_link(pci);
-	dw_pcie_wait_for_link(pci);
 	dw_pcie_msi_init(pp);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6cebdd9bbd2e..f5f9d4e58aa3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -423,6 +423,15 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
+	if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
+		ret = pci->ops->start_link(pci);
+		if (ret)
+			goto err_free_msi;
+	}
+
+	/* Ignore errors, the link may come up later */
+	dw_pcie_wait_for_link(pci);
+
 	bridge->sysdata = pp;
 
 	ret = pci_host_probe(bridge);
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 3da38ac6a87a..adebcaeb1a6c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -35,10 +35,7 @@ static const struct of_device_id dw_plat_pcie_of_match[];
 
 static int dw_plat_pcie_host_init(struct pcie_port *pp)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-
 	dw_pcie_setup_rc(pp);
-	dw_pcie_wait_for_link(pci);
 	dw_pcie_msi_init(pp);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index 777e24902afb..ece544165059 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -169,39 +169,36 @@ static int histb_pcie_link_up(struct dw_pcie *pci)
 	return 0;
 }
 
-static int histb_pcie_establish_link(struct pcie_port *pp)
+static int histb_pcie_start_link(struct dw_pcie *pci)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct histb_pcie *hipcie = to_histb_pcie(pci);
 	u32 regval;
 
-	if (dw_pcie_link_up(pci)) {
-		dev_info(pci->dev, "Link already up\n");
-		return 0;
-	}
-
-	/* PCIe RC work mode */
-	regval = histb_pcie_readl(hipcie, PCIE_SYS_CTRL0);
-	regval &= ~PCIE_DEVICE_TYPE_MASK;
-	regval |= PCIE_WM_RC;
-	histb_pcie_writel(hipcie, PCIE_SYS_CTRL0, regval);
-
-	/* setup root complex */
-	dw_pcie_setup_rc(pp);
-
 	/* assert LTSSM enable */
 	regval = histb_pcie_readl(hipcie, PCIE_SYS_CTRL7);
 	regval |= PCIE_APP_LTSSM_ENABLE;
 	histb_pcie_writel(hipcie, PCIE_SYS_CTRL7, regval);
 
-	return dw_pcie_wait_for_link(pci);
+	return 0;
 }
 
 static int histb_pcie_host_init(struct pcie_port *pp)
 {
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct histb_pcie *hipcie = to_histb_pcie(pci);
+	u32 regval;
+
 	pp->bridge->ops = &histb_pci_ops;
 
-	histb_pcie_establish_link(pp);
+	/* PCIe RC work mode */
+	regval = histb_pcie_readl(hipcie, PCIE_SYS_CTRL0);
+	regval &= ~PCIE_DEVICE_TYPE_MASK;
+	regval |= PCIE_WM_RC;
+	histb_pcie_writel(hipcie, PCIE_SYS_CTRL0, regval);
+
+	/* setup root complex */
+	dw_pcie_setup_rc(pp);
+
 	dw_pcie_msi_init(pp);
 
 	return 0;
@@ -300,6 +297,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 	.read_dbi = histb_pcie_read_dbi,
 	.write_dbi = histb_pcie_write_dbi,
 	.link_up = histb_pcie_link_up,
+	.start_link = histb_pcie_start_link,
 };
 
 static int histb_pcie_probe(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index ba03dbca7885..675b4d8392d3 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -390,32 +390,14 @@ static int kirin_pcie_link_up(struct dw_pcie *pci)
 	return 0;
 }
 
-static int kirin_pcie_establish_link(struct pcie_port *pp)
+static int kirin_pcie_start_link(struct dw_pcie *pci)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct kirin_pcie *kirin_pcie = to_kirin_pcie(pci);
-	struct device *dev = kirin_pcie->pci->dev;
-	int count = 0;
-
-	if (kirin_pcie_link_up(pci))
-		return 0;
-
-	dw_pcie_setup_rc(pp);
 
 	/* assert LTSSM enable */
 	kirin_apb_ctrl_writel(kirin_pcie, PCIE_LTSSM_ENABLE_BIT,
 			      PCIE_APP_LTSSM_ENABLE);
 
-	/* check if the link is up or not */
-	while (!kirin_pcie_link_up(pci)) {
-		usleep_range(LINK_WAIT_MIN, LINK_WAIT_MAX);
-		count++;
-		if (count == 1000) {
-			dev_err(dev, "Link Fail\n");
-			return -EINVAL;
-		}
-	}
-
 	return 0;
 }
 
@@ -423,7 +405,7 @@ static int kirin_pcie_host_init(struct pcie_port *pp)
 {
 	pp->bridge->ops = &kirin_pci_ops;
 
-	kirin_pcie_establish_link(pp);
+	dw_pcie_setup_rc(pp);
 	dw_pcie_msi_init(pp);
 
 	return 0;
@@ -433,6 +415,7 @@ static const struct dw_pcie_ops kirin_dw_pcie_ops = {
 	.read_dbi = kirin_pcie_read_dbi,
 	.write_dbi = kirin_pcie_write_dbi,
 	.link_up = kirin_pcie_link_up,
+	.start_link = kirin_pcie_start_link,
 };
 
 static const struct dw_pcie_host_ops kirin_pcie_host_ops = {
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 7ac08f0cae17..8eb8ac2fb270 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -207,18 +207,15 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
 	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
 }
 
-static int qcom_pcie_establish_link(struct qcom_pcie *pcie)
+static int qcom_pcie_start_link(struct dw_pcie *pci)
 {
-	struct dw_pcie *pci = pcie->pci;
-
-	if (dw_pcie_link_up(pci))
-		return 0;
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
 
 	/* Enable Link Training state machine */
 	if (pcie->ops->ltssm_enable)
 		pcie->ops->ltssm_enable(pcie);
 
-	return dw_pcie_wait_for_link(pci);
+	return 0;
 }
 
 static void qcom_pcie_2_1_0_ltssm_enable(struct qcom_pcie *pcie)
@@ -1288,15 +1285,8 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 
 	qcom_ep_reset_deassert(pcie);
 
-	ret = qcom_pcie_establish_link(pcie);
-	if (ret)
-		goto err;
-
 	return 0;
-err:
-	qcom_ep_reset_assert(pcie);
-	if (pcie->ops->post_deinit)
-		pcie->ops->post_deinit(pcie);
+
 err_disable_phy:
 	phy_power_off(pcie->phy);
 err_deinit:
@@ -1363,6 +1353,7 @@ static const struct qcom_pcie_ops ops_2_7_0 = {
 
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
+	.start_link = qcom_pcie_start_link,
 };
 
 static int qcom_pcie_probe(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 800c34a60a33..ebbaa06fc8ab 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -66,32 +66,10 @@ struct pcie_app_reg {
 
 #define to_spear13xx_pcie(x)	dev_get_drvdata((x)->dev)
 
-static int spear13xx_pcie_establish_link(struct spear13xx_pcie *spear13xx_pcie)
+static int spear13xx_pcie_start_link(struct dw_pcie *pci)
 {
-	struct dw_pcie *pci = spear13xx_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
+	struct spear13xx_pcie *spear13xx_pcie = to_spear13xx_pcie(pci);
 	struct pcie_app_reg *app_reg = spear13xx_pcie->app_base;
-	u32 val;
-	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-
-	if (dw_pcie_link_up(pci)) {
-		dev_err(pci->dev, "link already up\n");
-		return 0;
-	}
-
-	dw_pcie_setup_rc(pp);
-
-	/*
-	 * this controller support only 128 bytes read size, however its
-	 * default value in capability register is 512 bytes. So force
-	 * it to 128 here.
-	 */
-	val = dw_pcie_readw_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL);
-	val &= ~PCI_EXP_DEVCTL_READRQ;
-	dw_pcie_writew_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL, val);
-
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, 0x104A);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, 0xCD80);
 
 	/* enable ltssm */
 	writel(DEVICE_TYPE_RC | (1 << MISCTRL_EN_ID)
@@ -99,7 +77,7 @@ static int spear13xx_pcie_establish_link(struct spear13xx_pcie *spear13xx_pcie)
 			| ((u32)1 << REG_TRANSLATION_ENABLE),
 			&app_reg->app_ctrl_0);
 
-	return dw_pcie_wait_for_link(pci);
+	return 0;
 }
 
 static irqreturn_t spear13xx_pcie_irq_handler(int irq, void *arg)
@@ -151,10 +129,25 @@ static int spear13xx_pcie_host_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct spear13xx_pcie *spear13xx_pcie = to_spear13xx_pcie(pci);
+	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 val;
 
 	spear13xx_pcie->app_base = pci->dbi_base + 0x2000;
 
-	spear13xx_pcie_establish_link(spear13xx_pcie);
+	dw_pcie_setup_rc(pp);
+
+	/*
+	 * this controller support only 128 bytes read size, however its
+	 * default value in capability register is 512 bytes. So force
+	 * it to 128 here.
+	 */
+	val = dw_pcie_readw_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL);
+	val &= ~PCI_EXP_DEVCTL_READRQ;
+	dw_pcie_writew_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL, val);
+
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, 0x104A);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, 0xCD80);
+
 	spear13xx_pcie_enable_interrupts(spear13xx_pcie);
 
 	return 0;
@@ -198,6 +191,7 @@ static int spear13xx_add_pcie_port(struct spear13xx_pcie *spear13xx_pcie,
 
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = spear13xx_pcie_link_up,
+	.start_link = spear13xx_pcie_start_link,
 };
 
 static int spear13xx_pcie_probe(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 77fc3ba3dec1..f7d7b002a06d 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1549,7 +1549,6 @@ static int tegra_pcie_deinit_controller(struct tegra_pcie_dw *pcie)
 
 static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
 {
-	struct pcie_port *pp = &pcie->pci.pp;
 	struct device *dev = pcie->dev;
 	char *name;
 	int ret;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 6198bd106b8a..f4b776e231d6 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -146,16 +146,13 @@ static int uniphier_pcie_link_up(struct dw_pcie *pci)
 	return (val & mask) == mask;
 }
 
-static int uniphier_pcie_establish_link(struct dw_pcie *pci)
+static int uniphier_pcie_start_link(struct dw_pcie *pci)
 {
 	struct uniphier_pcie_priv *priv = to_uniphier_pcie(pci);
 
-	if (dw_pcie_link_up(pci))
-		return 0;
-
 	uniphier_pcie_ltssm_enable(priv, true);
 
-	return dw_pcie_wait_for_link(pci);
+	return 0;
 }
 
 static void uniphier_pcie_stop_link(struct dw_pcie *pci)
@@ -318,10 +315,6 @@ static int uniphier_pcie_host_init(struct pcie_port *pp)
 	uniphier_pcie_irq_enable(priv);
 
 	dw_pcie_setup_rc(pp);
-	ret = uniphier_pcie_establish_link(pci);
-	if (ret)
-		return ret;
-
 	dw_pcie_msi_init(pp);
 
 	return 0;
@@ -385,7 +378,7 @@ static int uniphier_pcie_host_enable(struct uniphier_pcie_priv *priv)
 }
 
 static const struct dw_pcie_ops dw_pcie_ops = {
-	.start_link = uniphier_pcie_establish_link,
+	.start_link = uniphier_pcie_start_link,
 	.stop_link = uniphier_pcie_stop_link,
 	.link_up = uniphier_pcie_link_up,
 };
-- 
2.25.1

