Return-Path: <linux-omap+bounces-797-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB586FD52
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 10:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333A9281E67
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 09:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FDD2374B;
	Mon,  4 Mar 2024 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fW9FCX/P"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485B20B27
	for <linux-omap@vger.kernel.org>; Mon,  4 Mar 2024 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544219; cv=none; b=UfYnj+sednVpnd1746wHjE0+bPiMhSMIZWrR3fJq6nmnceJdjIMSQf3MSn9rd8kkWMnzoBK6F4p34FlgzqCyXm4A+0Q7xhv2m3/l5dLIkMgYBo3R3Jdc5njjJcDjzZGXet76q1fcGbJQI3iecAA32jcbZwTpO1QuVs5ioOkka4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544219; c=relaxed/simple;
	bh=Fp6rJByrSctP3eNKbtXVTAOzZutANZTbBvw1RHJqeRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQCtnmLSyYlGeLdll7colkwqLZ/t++3C4NdjA3MlQvKASHubIXVhH3MD8E+EGuBjfYyA1FtSCa2AWhzvwxxV9TcPxJLde8p+kbi1bQirzThI4OX0QiGrLld57lVQqBxBuF4aYHJX2Mj/P3zDA+hKLin5Pd4nC8j8kxJSD27Lt38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fW9FCX/P; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd178fc492so3826325ad.2
        for <linux-omap@vger.kernel.org>; Mon, 04 Mar 2024 01:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544218; x=1710149018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkzFBYFXCSZjZFtV1D4LiIfHfva4Ho8/0J/ZIEZhkEk=;
        b=fW9FCX/PUT+tJ9e3m3V4F4QVaHjBCVimxtle1t61jG+V3QWawyEOIkqDe7X2OCiswe
         u6JoCacAwKxdr9cX90Gpnh2mhciSUkDy5kTEe/FeXYvMzwxKT3o86hpZdDwyIZtEOGcz
         hgd0GsRBg9T7oqs7KQ4XluNvznTeC5P8khxcP6VRKwAVaxNo9LX4WIpkAx51pHpUDck9
         LmLVMoBP7vFcgahqGUdmrOjFcGj2WXty/eA8DBxDfEVJmMPugqfVnFgxIJRyg1fOWfUV
         OUFvpMCb4Z3YjP2sqEr/eybEI/09G9GltkW4iTCPt2ykrMed9t9btLBKTAqxAyQxSoSY
         LbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544218; x=1710149018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkzFBYFXCSZjZFtV1D4LiIfHfva4Ho8/0J/ZIEZhkEk=;
        b=gABoZ1HebKzd6lQWmkTXViyYALkjGa6YocL1CDIX9ENyoQd5A6nH5KKVg036QWn96T
         kgJ4MNklD95N0twIx7v2182Z6Qk9KDm8Aj3sVhCMONKDtR+zKxQBrrHMvME98tNw3W0b
         UTsZsP1N9ihHHGJ45Ad/IPmguv2oEGoMumLO/xZHexlu1TpB0y7aLbEwWT+lu5grU2j+
         /a1PbthVaPYvs7zXtStAkdy7PxeUWlP/xe6TRpMRurwcUV2LiWnKJF8/l3U8j9lSeeVZ
         NQrT8W0PKdd9Cq2GN+5qtrKBhoOm4W2UxdT1/oIhx6AcUB/XMMGuAYSQnz/t4YbRSv0n
         DGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcyMYjy9ZZwLz4sA8YsC1cdcH0kOk8Jc/bt3GA7wEGyaizzJ+C8d7CaNKwkriosv17yuQ0OVmbvZS7eY7+/j+OHst7JMl7gbVGkA==
X-Gm-Message-State: AOJu0YzGSMET6sZYeHX5JaMpuFjco7WLJojnT+GlEcRyY9nIf/EhX/e2
	HXXtnhxpzXwrXtyPPmgKTqmCwg+toiO8FDA8LO4Z68JJ37feiFJ6SN7NkTWiyA==
X-Google-Smtp-Source: AGHT+IFNqx91HO3ch0RptHhRuRdleRpWBYryWF6uDb9+IX/54TCR1jr/YVRuAIhPQN7m3FTNLNmKOw==
X-Received: by 2002:a17:902:d512:b0:1dc:f916:6b07 with SMTP id b18-20020a170902d51200b001dcf9166b07mr5739363plg.20.1709544217722;
        Mon, 04 Mar 2024 01:23:37 -0800 (PST)
Received: from [127.0.1.1] ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001dbb06b6138sm7996648plc.252.2024.03.04.01.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:23:37 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 04 Mar 2024 14:52:17 +0530
Subject: [PATCH v9 05/10] PCI: dwc: ep: Rename dw_pcie_ep_init_complete()
 to dw_pcie_ep_init_registers()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pci-dbi-rework-v9-5-29d433d99cda@linaro.org>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Fp6rJByrSctP3eNKbtXVTAOzZutANZTbBvw1RHJqeRc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl5ZLXIU0MjPqIaZsnKQro6gwztLOQttmAwbNx+
 V0Hgls9OyaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZeWS1wAKCRBVnxHm/pHO
 9TOHB/9429XJzml+LfdSTkCtQl0n80hnOSbSom7XkGwW19SZClMApCfOtDHkKSoDskUcqqOIN2g
 sFYRmZdylT+GLEGlCP/xONYGpGfdZaR5XzRsMxv8+r5YgiJbd+bMLwWk52TJ2LRmzA8SFqWeR06
 uRw/0pjbwkQeXMozNpR0i6bOdPpQxQbJh+X2NNy/+O9S2w49hJPU3VDFhQaCuEPS0tnZso1GONV
 bLYcPmNwaQ+oh9O28uAkOBw4L1ukGCwFP4SnxuuWoGw2eLgi9fzVTjQAb+9fFdBlxZGQacNmVuQ
 0/4fPXeOsVaWrN6n3E6Dc9jGpj/9Nnutx1FfS3DygPUGXyun
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

The goal of the dw_pcie_ep_init_complete() API is to initialize the DWC
specific registers post registering the controller with the EP framework.

But the naming doesn't reflect its functionality and causes confusion. So,
let's rename it to dw_pcie_ep_init_registers() to make it clear that it
initializes the DWC specific registers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 6 +++---
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-qcom-ep.c       | 2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c      | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 99d66b0fa59b..ed1f2afd830a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -603,7 +603,7 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 	return 0;
 }
 
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dw_pcie_ep_func *ep_func;
@@ -718,7 +718,7 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
 int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
@@ -788,7 +788,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	 * (Ex: tegra194). Any hardware access on such platforms result
 	 * in system hang.
 	 */
-	ret = dw_pcie_ep_init_complete(ep);
+	ret = dw_pcie_ep_init_registers(ep);
 	if (ret)
 		goto err_free_epc_mem;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 351d2fe3ea4d..f8e5431a207b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -669,7 +669,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 #ifdef CONFIG_PCIE_DW_EP
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
+int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
@@ -693,7 +693,7 @@ static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	return 0;
 }
 
-static inline int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+static inline int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 59b1c0110288..3697b4a944cc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -463,7 +463,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	      PARF_INT_ALL_LINK_UP | PARF_INT_ALL_EDMA;
 	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_MASK);
 
-	ret = dw_pcie_ep_init_complete(&pcie_ep->pci.ep);
+	ret = dw_pcie_ep_init_registers(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
 		goto err_disable_resources;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 68bfeed3429b..264ee76bf008 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1897,7 +1897,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 	val = (upper_32_bits(ep->msi_mem_phys) & MSIX_ADDR_MATCH_HIGH_OFF_MASK);
 	dw_pcie_writel_dbi(pci, MSIX_ADDR_MATCH_HIGH_OFF, val);
 
-	ret = dw_pcie_ep_init_complete(ep);
+	ret = dw_pcie_ep_init_registers(ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
 		goto fail_init_complete;

-- 
2.25.1


