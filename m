Return-Path: <linux-omap+bounces-991-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75788D6B3
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35BF1F2AF8B
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 06:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0796D374EA;
	Wed, 27 Mar 2024 06:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jxlBC2so"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211137142
	for <linux-omap@vger.kernel.org>; Wed, 27 Mar 2024 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521511; cv=none; b=t8RW+MRGJ/lb3tggCnFvnipWR8jgOofJjDH+iofL7zV/dukipXni/TxaOqw+tWOOT85PPZhfawlPbUtCMqoUeOHtWH4RqNJopB/zk4N2CcDwewXCuTPefkyn58Uho6Q6jFduQxvvYhxtq3ZhjKNIsBPL+WLroEGnkQqYaC8JG+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521511; c=relaxed/simple;
	bh=T8xd9IMBFSLqtO7yLwds3AzXZKOw4i14aXO5E4koQK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXK+Y4mg9dwxoPeYZUAdVr6zcCA6xnVDxQSxHkSdpfH1HtCkj97hpNM9L6ZcJgDmbYe23KBjsOGWClxk25RtOwN5cIPA0soTaZzRALhQXpJpGzFBQlqB6WoXzUgn8fKKYhg0SKiCcaBW9DfHcnaLvs8qodH7TgH4WMvahgtcuus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jxlBC2so; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e0f2798b47so3886655ad.1
        for <linux-omap@vger.kernel.org>; Tue, 26 Mar 2024 23:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521508; x=1712126308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FJnclAUZyQM4WBVprXIqrY113PIuX3eACzO2IL03gI=;
        b=jxlBC2so4JuRgrByi3saZS16JUk5qshwlNY2gQfk6i/EQfBTSt9KFactZqUId4sv36
         Riy8zVpP6NnucBkJqYGJBfEBUBy48JbENtvG30uyDFLsW1VNWyMBJO0pNNV5Hn2OSE/g
         t3Z+hJJwiHEgpihrapMiD90mEaU/4CO8meo9q/XYpqoijNMsFyK7Pt2THXbfZPqecHiF
         xutEX4SUGEsLpDfo25LfT1oKBfKWI07rw9UbYqkTEHsLfos81pVicoSfLX8ZKSAVK2FQ
         091wUnIkdc4QA1wXNHYls4YmZx1mSlt0TzYP99MR9KeifaAgtadfQd0wc44rhmYrCxAd
         tlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521508; x=1712126308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FJnclAUZyQM4WBVprXIqrY113PIuX3eACzO2IL03gI=;
        b=FmPqmef3dDv/ldgMJ4amvfizrpxpoJnP+rqJAhzNLUnHV4BRP7mwecdVQqFol84Alu
         Gke1vXXz7DfNaG6ZNxwWZOkpPlR+AiVpv3JImxFoYlztguwMlgT3YJdZwmQ3cGts3uLZ
         SOUeO/1aaFp62PGe9FQgYk9d7vfGe+Qkupu0tVBoR/yuAeevB12Vf35Vzw4fuQHhIsPC
         3gxg1Nes4noH2nQHplaLeMJe4r2V9dR/6al/3yU0O/uFWtCokscwHFBG3i5KVn+igcb9
         OL5lkBbVH17V/vgqtqr30QeW1HZJxANKYSdBufAqvhjc9IuAY5MvM1LNbIj/vpoNMcBt
         n+PA==
X-Forwarded-Encrypted: i=1; AJvYcCWqxYd4kNEIJqwp5VSvoCFrIWN6/c8PH+XEU62N1i1eSnZ3yU5tNfT+C8JxPWhxmdin168mTiYPBWAPSol+hJjhmIn86mmPYwYmDA==
X-Gm-Message-State: AOJu0Yy2/+6Bo9glj0tXi0C+Qn9M5FvaDmABafBouc57I2t8IfuuMpnK
	SJWIzWa+1KtXrJ8f6pXk8258me350MZqed9HzTJkYEuNd8y8nUTaTAOqteK7zA==
X-Google-Smtp-Source: AGHT+IEdbYtFtcbyHCagT0tulvq/fnfaauxWjj9+6ItfB4oMcnI44QtrD2op3MsUl7pRVNsXpGCnKg==
X-Received: by 2002:a17:902:f687:b0:1e0:30ca:62c with SMTP id l7-20020a170902f68700b001e030ca062cmr5739334plg.1.1711521508266;
        Tue, 26 Mar 2024 23:38:28 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r9-20020a170902be0900b001e14807c7dfsm602553pls.86.2024.03.26.23.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:38:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 12:05:52 +0530
Subject: [PATCH v11 6/8] PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to
 dw_pcie_ep_init_registers()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v11-6-6f5259f90673@linaro.org>
References: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
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
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4791;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=T8xd9IMBFSLqtO7yLwds3AzXZKOw4i14aXO5E4koQK8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA75Wra5tRW8Nw7bBfF+BFzZWHyO11z6ZN9VCf
 OejVTU+NguJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgO+VgAKCRBVnxHm/pHO
 9Sw4B/0cG0if7rjvc14GX7fjtgymOBawKRqjqWuIiyrLkA54CiZVvzsE/IpNvUIhlsWUd8pIOlu
 ZhbNlhxvM0G8y308wRV63OFx88YZSsq2IxDhPXE7+OsyMSzD8cXrLygoh8s4OWx2vjiLPt/RkHA
 zYFQ4X1LaSDBmLCPsvx7NzACE76JUnQlZIWh1MchAYfaorwLlPJxnLHKkmbVExNIgaLtCU16y3w
 zDSzNOz+lArWNplhM3ABClsRdDruM5+0RRZ1dUb3/eYKLV6w60V0wrhAw46S/TrLFACTfv60ZxC
 EzyEUDgMrYur1CdaVpy4m55hoRprOCA6mk33KyCtuzeFrLn3
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

The goal of the dw_pcie_ep_init_complete() API is to initialize the DWC
specific registers post registering the controller with the EP framework.

But the naming doesn't reflect its functionality and causes confusion. So,
let's rename it to dw_pcie_ep_init_registers() to make it clear that it
initializes the DWC specific registers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 14 +++++++-------
 drivers/pci/controller/dwc/pcie-designware.h    |  4 ++--
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7509fa1d1e7d..0c13fdb8554e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -672,14 +672,14 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 }
 
 /**
- * dw_pcie_ep_init_complete - Complete DWC EP initialization
+ * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
  *
- * Complete the initialization of the registers (CSRs) specific to DWC EP. This
- * API should be called only when the endpoint receives an active refclk (either
- * from host or generated locally).
+ * Initialize the registers (CSRs) specific to DWC EP. This API should be called
+ * only when the endpoint receives an active refclk (either from host or
+ * generated locally).
  */
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dw_pcie_ep_func *ep_func;
@@ -794,7 +794,7 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
 /**
  * dw_pcie_ep_init - Initialize the endpoint device
@@ -873,7 +873,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
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


