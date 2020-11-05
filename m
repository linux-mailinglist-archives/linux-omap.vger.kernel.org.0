Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007232A88AE
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 22:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732344AbgKEVMW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 16:12:22 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35316 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732250AbgKEVMV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 16:12:21 -0500
Received: by mail-ot1-f68.google.com with SMTP id n11so2796627ota.2;
        Thu, 05 Nov 2020 13:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BGG5aLFH7MIcMhwnSLPymZKuREEniuoZvvhDMmhfEIw=;
        b=Edplcc/ldqE8r0scntx5Okw0BlpHvxqguQs3GCnDYFUzUu0WxnwKvT/lIoQQ5HPLpR
         WgMu5rwhXhWhGshm8OdwUd40uRdIURHo6dgkWHxxl6D0cbVrWyoaV/nrofnS/6fEyUQN
         /hle4OVTST0hoD/4/F4VfP6dBC06BMINaE3l08L4oQ0yQBK8PSzvqtb4+hdluNGjZJAN
         gcEXzdFxt7CfxY1HRcUTcmyCf402vcIcnC33F+nQR1zUSb+CeEpJqbs+L1JAUMsGOGo0
         oDpDsygBXMvm/Uz89V51kU2FwBCA3fUy3p6Om7HHesvQX0SJTx6ed7d0C0otlvxp4eG6
         5PZQ==
X-Gm-Message-State: AOAM532fwe30JuxU936COg540bdC6YG7sZQcobESpyJn1wEvwCOtIrWz
        T4oWftv8rKTopqZBuF52m1Eq1kqm/NYc
X-Google-Smtp-Source: ABdhPJx+69Rl2SYMwLdyZSWVW76k8rI5SBWpMMU4pU/p4nc1aBmnFsAnO6+/QoOU2SdWIw9tCavObA==
X-Received: by 2002:a9d:2255:: with SMTP id o79mr2851578ota.174.1604610739859;
        Thu, 05 Nov 2020 13:12:19 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id z19sm622549ooi.32.2020.11.05.13.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 13:12:19 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
Cc:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Yue Wang <yue.wang@Amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v2 11/16] PCI: dwc: Move dw_pcie_msi_init() into core
Date:   Thu,  5 Nov 2020 15:11:54 -0600
Message-Id: <20201105211159.1814485-12-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The host drivers which call dw_pcie_msi_init() are all the ones using
the built-in MSI controller, so let's move it into the common DWC code.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Acked-by: Jingoo Han <jingoohan1@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Drop now static dw_pcie_msi_init symbol export
---
 drivers/pci/controller/dwc/pci-dra7xx.c           |  2 --
 drivers/pci/controller/dwc/pci-exynos.c           |  4 ----
 drivers/pci/controller/dwc/pci-imx6.c             |  1 -
 drivers/pci/controller/dwc/pci-meson.c            |  1 -
 drivers/pci/controller/dwc/pcie-artpec6.c         |  1 -
 drivers/pci/controller/dwc/pcie-designware-host.c |  9 +++++----
 drivers/pci/controller/dwc/pcie-designware-plat.c |  1 -
 drivers/pci/controller/dwc/pcie-designware.h      | 10 ----------
 drivers/pci/controller/dwc/pcie-histb.c           |  2 --
 drivers/pci/controller/dwc/pcie-kirin.c           |  1 -
 drivers/pci/controller/dwc/pcie-qcom.c            |  2 --
 drivers/pci/controller/dwc/pcie-spear13xx.c       |  6 +-----
 drivers/pci/controller/dwc/pcie-tegra194.c        |  2 --
 drivers/pci/controller/dwc/pcie-uniphier.c        |  1 -
 14 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 054423d9646d..72a5a2bf933b 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -182,8 +182,6 @@ static int dra7xx_pcie_host_init(struct pcie_port *pp)
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
 
 	dw_pcie_setup_rc(pp);
-
-	dw_pcie_msi_init(pp);
 	dra7xx_pcie_enable_interrupts(dra7xx);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 6498b615c834..3939fe22e8a2 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -273,12 +273,8 @@ static irqreturn_t exynos_pcie_irq_handler(int irq, void *arg)
 
 static void exynos_pcie_msi_init(struct exynos_pcie *ep)
 {
-	struct dw_pcie *pci = ep->pci;
-	struct pcie_port *pp = &pci->pp;
 	u32 val;
 
-	dw_pcie_msi_init(pp);
-
 	/* enable MSI interrupt */
 	val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_IRQ_EN_LEVEL);
 	val |= IRQ_MSI_ENABLE;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 1fe8f3f2c380..9e30fbf4efbe 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -835,7 +835,6 @@ static int imx6_pcie_host_init(struct pcie_port *pp)
 	imx6_pcie_deassert_core_reset(imx6_pcie);
 	imx6_setup_phy_mpll(imx6_pcie);
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 41a3351b100b..2df0adcf0bf2 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -381,7 +381,6 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 8b3da3038ac3..7ee8f3c83f8f 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -329,7 +329,6 @@ static int artpec6_pcie_host_init(struct pcie_port *pp)
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 800e7a0415cf..ebea2c814448 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -256,7 +256,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 	return 0;
 }
 
-void dw_pcie_free_msi(struct pcie_port *pp)
+static void dw_pcie_free_msi(struct pcie_port *pp)
 {
 	if (pp->msi_irq) {
 		irq_set_chained_handler(pp->msi_irq, NULL);
@@ -275,19 +275,18 @@ void dw_pcie_free_msi(struct pcie_port *pp)
 	}
 }
 
-void dw_pcie_msi_init(struct pcie_port *pp)
+static void dw_pcie_msi_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	u64 msi_target = (u64)pp->msi_data;
 
-	if (!IS_ENABLED(CONFIG_PCI_MSI))
+	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
 		return;
 
 	/* Program the msi_data */
 	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_LO, lower_32_bits(msi_target));
 	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_HI, upper_32_bits(msi_target));
 }
-EXPORT_SYMBOL_GPL(dw_pcie_msi_init);
 
 int dw_pcie_host_init(struct pcie_port *pp)
 {
@@ -423,6 +422,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
+	dw_pcie_msi_init(pp);
+
 	if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
 		ret = pci->ops->start_link(pci);
 		if (ret)
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index adebcaeb1a6c..dec24e595c3e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -36,7 +36,6 @@ static const struct of_device_id dw_plat_pcie_of_match[];
 static int dw_plat_pcie_host_init(struct pcie_port *pp)
 {
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 5d374bab10d1..57326aebc6e1 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -363,8 +363,6 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
 
 #ifdef CONFIG_PCIE_DW_HOST
 irqreturn_t dw_handle_msi_irq(struct pcie_port *pp);
-void dw_pcie_msi_init(struct pcie_port *pp);
-void dw_pcie_free_msi(struct pcie_port *pp);
 void dw_pcie_setup_rc(struct pcie_port *pp);
 int dw_pcie_host_init(struct pcie_port *pp);
 void dw_pcie_host_deinit(struct pcie_port *pp);
@@ -377,14 +375,6 @@ static inline irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 	return IRQ_NONE;
 }
 
-static inline void dw_pcie_msi_init(struct pcie_port *pp)
-{
-}
-
-static inline void dw_pcie_free_msi(struct pcie_port *pp)
-{
-}
-
 static inline void dw_pcie_setup_rc(struct pcie_port *pp)
 {
 }
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index ece544165059..210777c793ea 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -199,8 +199,6 @@ static int histb_pcie_host_init(struct pcie_port *pp)
 	/* setup root complex */
 	dw_pcie_setup_rc(pp);
 
-	dw_pcie_msi_init(pp);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 675b4d8392d3..f84ac1b36b2c 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -406,7 +406,6 @@ static int kirin_pcie_host_init(struct pcie_port *pp)
 	pp->bridge->ops = &kirin_pci_ops;
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8eb8ac2fb270..eb107179d544 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1281,8 +1281,6 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 	}
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
-
 	qcom_ep_reset_deassert(pcie);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index ebbaa06fc8ab..31475e4493a7 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -102,16 +102,12 @@ static irqreturn_t spear13xx_pcie_irq_handler(int irq, void *arg)
 
 static void spear13xx_pcie_enable_interrupts(struct spear13xx_pcie *spear13xx_pcie)
 {
-	struct dw_pcie *pci = spear13xx_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
 	struct pcie_app_reg *app_reg = spear13xx_pcie->app_base;
 
 	/* Enable MSI interrupt */
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		dw_pcie_msi_init(pp);
+	if (IS_ENABLED(CONFIG_PCI_MSI))
 		writel(readl(&app_reg->int_mask) |
 				MSI_CTRL_INT, &app_reg->int_mask);
-	}
 }
 
 static int spear13xx_pcie_link_up(struct dw_pcie *pci)
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f7d7b002a06d..84f3e0bb4c7a 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -765,8 +765,6 @@ static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
 	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
 	u32 val;
 
-	dw_pcie_msi_init(pp);
-
 	/* Enable MSI interrupt generation */
 	val = appl_readl(pcie, APPL_INTR_EN_L0_0);
 	val |= APPL_INTR_EN_L0_0_SYS_MSI_INTR_EN;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index f4b776e231d6..e6616408a29c 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -315,7 +315,6 @@ static int uniphier_pcie_host_init(struct pcie_port *pp)
 	uniphier_pcie_irq_enable(priv);
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
-- 
2.25.1

