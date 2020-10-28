Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1E029D4A1
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 22:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgJ1Vx1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 17:53:27 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:41763 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgJ1VxY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Oct 2020 17:53:24 -0400
Received: by mail-ua1-f67.google.com with SMTP id b34so146786uab.8;
        Wed, 28 Oct 2020 14:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6UBH+mW2psqa9WVWV3bEwiNXWfoOpsOf3r+vdHAcirU=;
        b=anrisWRKEvrExh2bxlTu6SCFDVvDFApr2kogIAcjVSRRkKNq2vuce5k7Ymry6hlz+k
         3IYwo2XYa85a5AJEUU64lCL4MU8EgHTWijZUP2uiznth6M3eTgW4M+jnPS7iNSQtQqPb
         ndidByErHr8Q3V3QvfdZgggynHKiEbKikpFD5cktk+zvqEod2dsHoSRgiD55M2spjKHD
         V0kzD5RlX6d+M9gWfMX29lKfmZVoi7wxNzzNYVN4LLS22ZuqV/5Pxq0OpXhtYvHLpUtz
         MzwsQIU9inAjjVCEWrafbQKGI229yJ+qn8dJ/KRkHpO3N/vhp+7mgpgTRAzMC4ckR3cd
         NC+g==
X-Gm-Message-State: AOAM533kyPxW/1owvAVxf0j4i5czX6TJU2mxU+mvOFotn/VjblWGgijP
        H3a7208IznSPvIY09u9CJFcyR3oybQ==
X-Google-Smtp-Source: ABdhPJyeX3EkU8l1LUEBKBOX3QzZzanNJw0JaUVftNsRDWHlQpYdLh6zperSTre537nAKFty/86HYQ==
X-Received: by 2002:a9d:12ab:: with SMTP id g40mr831065otg.369.1603918017374;
        Wed, 28 Oct 2020 13:46:57 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 13:46:56 -0700 (PDT)
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
Subject: [PATCH 03/13] PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into common code
Date:   Wed, 28 Oct 2020 15:46:36 -0500
Message-Id: <20201028204646.356535-4-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Most DWC drivers use the common register resource names "dbi", "dbi2", and
"addr_space", so let's move their setup into the DWC common code.

This means 'dbi_base' in particular is setup later, but it looks like no
drivers touch DBI registers before dw_pcie_host_init or dw_pcie_ep_init.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Jonathan Chocron <jonnyc@amazon.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  8 ----
 drivers/pci/controller/dwc/pci-keystone.c     | 29 +-----------
 .../pci/controller/dwc/pci-layerscape-ep.c    | 37 +--------------
 drivers/pci/controller/dwc/pcie-al.c          |  9 +---
 drivers/pci/controller/dwc/pcie-artpec6.c     | 43 ++----------------
 .../pci/controller/dwc/pcie-designware-ep.c   | 29 ++++++++++--
 .../pci/controller/dwc/pcie-designware-host.c |  7 +++
 .../pci/controller/dwc/pcie-designware-plat.c | 45 +------------------
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  4 --
 drivers/pci/controller/dwc/pcie-kirin.c       |  5 ---
 drivers/pci/controller/dwc/pcie-qcom.c        |  8 ----
 drivers/pci/controller/dwc/pcie-spear13xx.c   | 11 +----
 drivers/pci/controller/dwc/pcie-tegra194.c    | 22 ---------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 38 +---------------
 drivers/pci/controller/dwc/pcie-uniphier.c    |  6 ---
 15 files changed, 47 insertions(+), 254 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 6d012d2b1e90..a4aabc85dbb1 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -578,7 +578,6 @@ static int __init dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
 {
 	int ret;
 	struct dw_pcie_ep *ep;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci = dra7xx->pci;
 
@@ -594,13 +593,6 @@ static int __init dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
 	if (IS_ERR(pci->dbi_base2))
 		return PTR_ERR(pci->dbi_base2);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
-	if (!res)
-		return -EINVAL;
-
-	ep->phys_base = res->start;
-	ep->addr_size = resource_size(res);
-
 	ret = dw_pcie_ep_init(ep);
 	if (ret) {
 		dev_err(dev, "failed to initialize endpoint\n");
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index a222728238ca..9cf14f13798b 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -977,33 +977,6 @@ static const struct dw_pcie_ep_ops ks_pcie_am654_ep_ops = {
 	.get_features = &ks_pcie_am654_get_features,
 };
 
-static int __init ks_pcie_add_pcie_ep(struct keystone_pcie *ks_pcie,
-				      struct platform_device *pdev)
-{
-	int ret;
-	struct dw_pcie_ep *ep;
-	struct resource *res;
-	struct device *dev = &pdev->dev;
-	struct dw_pcie *pci = ks_pcie->pci;
-
-	ep = &pci->ep;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
-	if (!res)
-		return -EINVAL;
-
-	ep->phys_base = res->start;
-	ep->addr_size = resource_size(res);
-
-	ret = dw_pcie_ep_init(ep);
-	if (ret) {
-		dev_err(dev, "failed to initialize endpoint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static void ks_pcie_disable_phy(struct keystone_pcie *ks_pcie)
 {
 	int num_lanes = ks_pcie->num_lanes;
@@ -1313,7 +1286,7 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 		}
 
 		pci->ep.ops = ep_ops;
-		ret = ks_pcie_add_pcie_ep(ks_pcie, pdev);
+		ret = dw_pcie_ep_init(&pci->ep);
 		if (ret < 0)
 			goto err_get_sync;
 		break;
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 84206f265e54..4af031b3f0a0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -18,8 +18,6 @@
 
 #include "pcie-designware.h"
 
-#define PCIE_DBI2_OFFSET		0x1000	/* DBI2 base address*/
-
 #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
 
 struct ls_pcie_ep_drvdata {
@@ -124,34 +122,6 @@ static const struct of_device_id ls_pcie_ep_of_match[] = {
 	{ },
 };
 
-static int __init ls_add_pcie_ep(struct ls_pcie_ep *pcie,
-				 struct platform_device *pdev)
-{
-	struct dw_pcie *pci = pcie->pci;
-	struct device *dev = pci->dev;
-	struct dw_pcie_ep *ep;
-	struct resource *res;
-	int ret;
-
-	ep = &pci->ep;
-	ep->ops = pcie->drvdata->ops;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
-	if (!res)
-		return -EINVAL;
-
-	ep->phys_base = res->start;
-	ep->addr_size = resource_size(res);
-
-	ret = dw_pcie_ep_init(ep);
-	if (ret) {
-		dev_err(dev, "failed to initialize endpoint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -159,7 +129,6 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
-	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -188,13 +157,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	if (IS_ERR(pci->dbi_base))
 		return PTR_ERR(pci->dbi_base);
 
-	pci->dbi_base2 = pci->dbi_base + PCIE_DBI2_OFFSET;
+	pci->ep.ops = &pcie_ep_ops;
 
 	platform_set_drvdata(pdev, pcie);
 
-	ret = ls_add_pcie_ep(pcie, pdev);
-
-	return ret;
+	return dw_pcie_ep_init(&pci->ep);
 }
 
 static struct platform_driver ls_pcie_ep_driver = {
diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index f973fbca90cf..d06866921187 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -347,7 +347,6 @@ static int al_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *controller_res;
 	struct resource *ecam_res;
-	struct resource *dbi_res;
 	struct al_pcie *al_pcie;
 	struct dw_pcie *pci;
 
@@ -365,11 +364,6 @@ static int al_pcie_probe(struct platform_device *pdev)
 	al_pcie->pci = pci;
 	al_pcie->dev = dev;
 
-	dbi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
-	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_res);
-	if (IS_ERR(pci->dbi_base))
-		return PTR_ERR(pci->dbi_base);
-
 	ecam_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
 	if (!ecam_res) {
 		dev_err(dev, "couldn't find 'config' reg in DT\n");
@@ -386,8 +380,7 @@ static int al_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(al_pcie->controller_base);
 	}
 
-	dev_dbg(dev, "From DT: dbi_base: %pR, controller_base: %pR\n",
-		dbi_res, controller_res);
+	dev_dbg(dev, "From DT: controller_base: %pR\n", controller_res);
 
 	platform_set_drvdata(pdev, al_pcie);
 
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 929448e9e0bc..52ad7909cd0c 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -403,38 +403,6 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.raise_irq = artpec6_pcie_raise_irq,
 };
 
-static int artpec6_add_pcie_ep(struct artpec6_pcie *artpec6_pcie,
-			       struct platform_device *pdev)
-{
-	int ret;
-	struct dw_pcie_ep *ep;
-	struct resource *res;
-	struct device *dev = &pdev->dev;
-	struct dw_pcie *pci = artpec6_pcie->pci;
-
-	ep = &pci->ep;
-	ep->ops = &pcie_ep_ops;
-
-	pci->dbi_base2 = devm_platform_ioremap_resource_byname(pdev, "dbi2");
-	if (IS_ERR(pci->dbi_base2))
-		return PTR_ERR(pci->dbi_base2);
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
-	if (!res)
-		return -EINVAL;
-
-	ep->phys_base = res->start;
-	ep->addr_size = resource_size(res);
-
-	ret = dw_pcie_ep_init(ep);
-	if (ret) {
-		dev_err(dev, "failed to initialize endpoint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int artpec6_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -469,10 +437,6 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
 	artpec6_pcie->variant = variant;
 	artpec6_pcie->mode = mode;
 
-	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "dbi");
-	if (IS_ERR(pci->dbi_base))
-		return PTR_ERR(pci->dbi_base);
-
 	artpec6_pcie->phy_base =
 		devm_platform_ioremap_resource_byname(pdev, "phy");
 	if (IS_ERR(artpec6_pcie->phy_base))
@@ -504,9 +468,10 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
 		val = artpec6_pcie_readl(artpec6_pcie, PCIECFG);
 		val &= ~PCIECFG_DEVICE_TYPE_MASK;
 		artpec6_pcie_writel(artpec6_pcie, PCIECFG, val);
-		ret = artpec6_add_pcie_ep(artpec6_pcie, pdev);
-		if (ret < 0)
-			return ret;
+
+		pci->ep.ops = &pcie_ep_ops;
+
+		return dw_pcie_ep_init(&pci->ep);
 		break;
 	}
 	default:
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index ad7da4ea43a5..6fe176e1bdd2 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include "pcie-designware.h"
 #include <linux/pci-epc.h>
@@ -676,20 +677,42 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	int ret;
 	void *addr;
 	u8 func_no;
+	struct resource *res;
 	struct pci_epc *epc;
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct device *dev = pci->dev;
+	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
 	const struct pci_epc_features *epc_features;
 	struct dw_pcie_ep_func *ep_func;
 
 	INIT_LIST_HEAD(&ep->func_list);
 
-	if (!pci->dbi_base || !pci->dbi_base2) {
-		dev_err(dev, "dbi_base/dbi_base2 is not populated\n");
-		return -EINVAL;
+	if (!pci->dbi_base) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
+		pci->dbi_base = devm_pci_remap_cfg_resource(dev, res);
+		if (IS_ERR(pci->dbi_base))
+			return PTR_ERR(pci->dbi_base);
+	}
+
+	if (!pci->dbi_base2) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi2");
+		if (!res)
+			pci->dbi_base2 = pci->dbi_base + SZ_4K;
+		else {
+			pci->dbi_base2 = devm_pci_remap_cfg_resource(dev, res);
+			if (IS_ERR(pci->dbi_base2))
+				return PTR_ERR(pci->dbi_base2);
+		}
 	}
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
+	if (!res)
+		return -EINVAL;
+
+	ep->phys_base = res->start;
+	ep->addr_size = resource_size(res);
+
 	ret = of_property_read_u32(np, "num-ib-windows", &ep->num_ib_windows);
 	if (ret < 0) {
 		dev_err(dev, "Unable to read *num-ib-windows* property\n");
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index a6ffab9b537e..cde45b2076ee 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -310,6 +310,13 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		dev_err(dev, "Missing *config* reg space\n");
 	}
 
+	if (!pci->dbi_base) {
+		struct resource *dbi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
+		pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_res);
+		if (IS_ERR(pci->dbi_base))
+			return PTR_ERR(pci->dbi_base);
+	}
+
 	bridge = devm_pci_alloc_host_bridge(dev, 0);
 	if (!bridge)
 		return -ENOMEM;
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index e3e300669ed5..562a05e07b1d 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -139,43 +139,11 @@ static int dw_plat_add_pcie_port(struct dw_plat_pcie *dw_plat_pcie,
 	return 0;
 }
 
-static int dw_plat_add_pcie_ep(struct dw_plat_pcie *dw_plat_pcie,
-			       struct platform_device *pdev)
-{
-	int ret;
-	struct dw_pcie_ep *ep;
-	struct resource *res;
-	struct device *dev = &pdev->dev;
-	struct dw_pcie *pci = dw_plat_pcie->pci;
-
-	ep = &pci->ep;
-	ep->ops = &pcie_ep_ops;
-
-	pci->dbi_base2 = devm_platform_ioremap_resource_byname(pdev, "dbi2");
-	if (IS_ERR(pci->dbi_base2))
-		return PTR_ERR(pci->dbi_base2);
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
-	if (!res)
-		return -EINVAL;
-
-	ep->phys_base = res->start;
-	ep->addr_size = resource_size(res);
-
-	ret = dw_pcie_ep_init(ep);
-	if (ret) {
-		dev_err(dev, "Failed to initialize endpoint\n");
-		return ret;
-	}
-	return 0;
-}
-
 static int dw_plat_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_plat_pcie *dw_plat_pcie;
 	struct dw_pcie *pci;
-	struct resource *res;  /* Resource from DT */
 	int ret;
 	const struct of_device_id *match;
 	const struct dw_plat_pcie_of_data *data;
@@ -202,14 +170,6 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
 	dw_plat_pcie->pci = pci;
 	dw_plat_pcie->mode = mode;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
-	if (!res)
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	pci->dbi_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(pci->dbi_base))
-		return PTR_ERR(pci->dbi_base);
-
 	platform_set_drvdata(pdev, dw_plat_pcie);
 
 	switch (dw_plat_pcie->mode) {
@@ -225,9 +185,8 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
 		if (!IS_ENABLED(CONFIG_PCIE_DW_PLAT_EP))
 			return -ENODEV;
 
-		ret = dw_plat_add_pcie_ep(dw_plat_pcie, pdev);
-		if (ret < 0)
-			return ret;
+		pci->ep.ops = &pcie_ep_ops;
+		return dw_pcie_ep_init(&pci->ep);
 		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", dw_plat_pcie->mode);
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 77ef88333115..88782653ed21 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -237,10 +237,6 @@ static int intel_pcie_get_resources(struct platform_device *pdev)
 	struct device *dev = pci->dev;
 	int ret;
 
-	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "dbi");
-	if (IS_ERR(pci->dbi_base))
-		return PTR_ERR(pci->dbi_base);
-
 	lpp->core_clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(lpp->core_clk)) {
 		ret = PTR_ERR(lpp->core_clk);
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index d0a6a2dee6f5..3042a23cf09a 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -157,11 +157,6 @@ static long kirin_pcie_get_resource(struct kirin_pcie *kirin_pcie,
 	if (IS_ERR(kirin_pcie->phy_base))
 		return PTR_ERR(kirin_pcie->phy_base);
 
-	kirin_pcie->pci->dbi_base =
-		devm_platform_ioremap_resource_byname(pdev, "dbi");
-	if (IS_ERR(kirin_pcie->pci->dbi_base))
-		return PTR_ERR(kirin_pcie->pci->dbi_base);
-
 	kirin_pcie->crgctrl =
 		syscon_regmap_lookup_by_compatible("hisilicon,hi3660-crgctrl");
 	if (IS_ERR(kirin_pcie->crgctrl))
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b4761640ffd9..3b4f70b9f3f0 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1368,7 +1368,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 static int qcom_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct pcie_port *pp;
 	struct dw_pcie *pci;
 	struct qcom_pcie *pcie;
@@ -1407,13 +1406,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		goto err_pm_runtime_put;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
-	pci->dbi_base = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(pci->dbi_base)) {
-		ret = PTR_ERR(pci->dbi_base);
-		goto err_pm_runtime_put;
-	}
-
 	pcie->elbi = devm_platform_ioremap_resource_byname(pdev, "elbi");
 	if (IS_ERR(pcie->elbi)) {
 		ret = PTR_ERR(pcie->elbi);
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index e348225f651f..1ed7e3501ff1 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -152,6 +152,8 @@ static int spear13xx_pcie_host_init(struct pcie_port *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct spear13xx_pcie *spear13xx_pcie = to_spear13xx_pcie(pci);
 
+	spear13xx_pcie->app_base = pci->dbi_base + 0x2000;
+
 	spear13xx_pcie_establish_link(spear13xx_pcie);
 	spear13xx_pcie_enable_interrupts(spear13xx_pcie);
 
@@ -203,7 +205,6 @@ static int spear13xx_pcie_probe(struct platform_device *pdev)
 	struct dw_pcie *pci;
 	struct spear13xx_pcie *spear13xx_pcie;
 	struct device_node *np = dev->of_node;
-	struct resource *dbi_base;
 	int ret;
 
 	spear13xx_pcie = devm_kzalloc(dev, sizeof(*spear13xx_pcie), GFP_KERNEL);
@@ -242,14 +243,6 @@ static int spear13xx_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
-	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
-	if (IS_ERR(pci->dbi_base)) {
-		ret = PTR_ERR(pci->dbi_base);
-		goto fail_clk;
-	}
-	spear13xx_pcie->app_base = pci->dbi_base + 0x2000;
-
 	if (of_property_read_bool(np, "st,pcie-is-gen1"))
 		pci->link_gen = 1;
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f920e7efe118..f8fca6794282 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1907,19 +1907,12 @@ static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
 	struct dw_pcie *pci = &pcie->pci;
 	struct device *dev = pcie->dev;
 	struct dw_pcie_ep *ep;
-	struct resource *res;
 	char *name;
 	int ret;
 
 	ep = &pci->ep;
 	ep->ops = &pcie_ep_ops;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
-	if (!res)
-		return -EINVAL;
-
-	ep->phys_base = res->start;
-	ep->addr_size = resource_size(res);
 	ep->page_size = SZ_64K;
 
 	ret = gpiod_set_debounce(pcie->pex_rst_gpiod, PERST_DEBOUNCE_TIME);
@@ -1982,7 +1975,6 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *atu_dma_res;
 	struct tegra_pcie_dw *pcie;
-	struct resource *dbi_res;
 	struct pcie_port *pp;
 	struct dw_pcie *pci;
 	struct phy **phys;
@@ -2091,20 +2083,6 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 
 	pcie->phys = phys;
 
-	dbi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
-	if (!dbi_res) {
-		dev_err(dev, "Failed to find \"dbi\" region\n");
-		return -ENODEV;
-	}
-	pcie->dbi_res = dbi_res;
-
-	pci->dbi_base = devm_ioremap_resource(dev, dbi_res);
-	if (IS_ERR(pci->dbi_base))
-		return PTR_ERR(pci->dbi_base);
-
-	/* Tegra HW locates DBI2 at a fixed offset from DBI */
-	pci->dbi_base2 = pci->dbi_base + 0x1000;
-
 	atu_dma_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						   "atu_dma");
 	if (!atu_dma_res) {
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index 148355960061..69810c6b0d58 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -218,35 +218,6 @@ static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
 	.get_features = uniphier_pcie_get_features,
 };
 
-static int uniphier_add_pcie_ep(struct uniphier_pcie_ep_priv *priv,
-				struct platform_device *pdev)
-{
-	struct dw_pcie *pci = &priv->pci;
-	struct dw_pcie_ep *ep = &pci->ep;
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int ret;
-
-	ep->ops = &uniphier_pcie_ep_ops;
-
-	pci->dbi_base2 = devm_platform_ioremap_resource_byname(pdev, "dbi2");
-	if (IS_ERR(pci->dbi_base2))
-		return PTR_ERR(pci->dbi_base2);
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
-	if (!res)
-		return -EINVAL;
-
-	ep->phys_base = res->start;
-	ep->addr_size = resource_size(res);
-
-	ret = dw_pcie_ep_init(ep);
-	if (ret)
-		dev_err(dev, "Failed to initialize endpoint (%d)\n", ret);
-
-	return ret;
-}
-
 static int uniphier_pcie_ep_enable(struct uniphier_pcie_ep_priv *priv)
 {
 	int ret;
@@ -300,7 +271,6 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct uniphier_pcie_ep_priv *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -314,11 +284,6 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 	priv->pci.dev = dev;
 	priv->pci.ops = &dw_pcie_ops;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
-	priv->pci.dbi_base = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(priv->pci.dbi_base))
-		return PTR_ERR(priv->pci.dbi_base);
-
 	priv->base = devm_platform_ioremap_resource_byname(pdev, "link");
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
@@ -352,7 +317,8 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return uniphier_add_pcie_ep(priv, pdev);
+	priv->pci.ep.ops = &uniphier_pcie_ep_ops;
+	return dw_pcie_ep_init(&priv->pci.ep);
 }
 
 static const struct pci_epc_features uniphier_pro5_data = {
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 48176265c867..33130fb4af90 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -400,7 +400,6 @@ static int uniphier_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct uniphier_pcie_priv *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -410,11 +409,6 @@ static int uniphier_pcie_probe(struct platform_device *pdev)
 	priv->pci.dev = dev;
 	priv->pci.ops = &dw_pcie_ops;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
-	priv->pci.dbi_base = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(priv->pci.dbi_base))
-		return PTR_ERR(priv->pci.dbi_base);
-
 	priv->base = devm_platform_ioremap_resource_byname(pdev, "link");
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
-- 
2.25.1

