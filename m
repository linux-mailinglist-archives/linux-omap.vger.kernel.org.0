Return-Path: <linux-omap+bounces-1474-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DCB8FDF9D
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 09:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475161F26F60
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 07:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E5C13D296;
	Thu,  6 Jun 2024 07:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWU0gejO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1849D13CA97
	for <linux-omap@vger.kernel.org>; Thu,  6 Jun 2024 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658854; cv=none; b=abscQ9LnpO52sOAg/5px/oxns6rVHH38fE5LcKO/40x/OQuxBCV7HxYzO/sw8/TW6/Ch6D/n9bpaHXxAMm526Rh5VjCy0o4k6wDNIU9vsksulkr1HnLkWh2Dc7khYZux6AStjY6QHHad4GO5R4w/8ww7aQCOFKSlA7D6Gs8cR5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658854; c=relaxed/simple;
	bh=GbOYu+TwhG+hMHKPWYPlU9l5l4iVl79aA0bUKAASNCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdLo/S+igNRc+rAKV0E3YmSX+BE8A7yXFnywWAAn7cBvnQtM0M/t37GBLpovjGUFFDOeTzch0QgSvGkRiOm87nBRtyTgEfxRy4A6ROI6pDMHdFbaYpMqo4fUdLjdK+4mOAHjCEGymIjZ+yifhPOAZwpTMrpm6OzTWmxbT9/QLCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iWU0gejO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7025b84c0daso528442b3a.2
        for <linux-omap@vger.kernel.org>; Thu, 06 Jun 2024 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658850; x=1718263650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4s6tIDIkxRPAkTqdlcJJCzh5RP/VyC6Pay0yvubVfws=;
        b=iWU0gejOfpdROnr7K+ngqXgqLRfQdcRJWB521UzeCNWcsmRYEProz+QV0BfjE/PKrw
         ViURNzi3HuFi9PJA7dGOMuRbjtyIW/4KrzONvHE6v04G3fyyDljbuLmpFbAj/Dhp3UQg
         DE4LF8dhybIqJEb8Tvu6KJeA8fjAtF97FIFS6LE7lM8/14t8YkhOqqLfidTh6TRvJu6/
         7OlvEaC/R/zR1utwxn+xMY/dF2XmJ6GDads0I6iTPAa29BE0khOedQ0IFI22oLaPfUog
         pjUCHnDo8fRj5lofjTdzSP3ALJjJh+j08bx4k3Xy7grxE1gFleA8dbtrbdbStq2frBGB
         l3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658850; x=1718263650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s6tIDIkxRPAkTqdlcJJCzh5RP/VyC6Pay0yvubVfws=;
        b=IKvaDoDKB4CISm3Zq2IYpOlteOi72cEzAaI/AV2verlb9v6gmoazVborITY60/Wwko
         HRbkcwC26tRobQQfOn6FJq690JjDI5p2lF6gbIwAFrkGkJa8AsDArhiGAh3lRYqx6yqg
         QwS20+uyf6HWSpK4Ul2Gm+Ohu8/rM1lZg/h9hH4P9prd90zT5KV0/nFHUXcdjbHiW+F+
         Y6IMtbQD5yFN4mEzf9lcjOl65pTYABuKXwGOXvcHWh84Hx8exvFLriPaeek8Sic/5Nn9
         d2uUGYNwLMkx3VuqvWoG3/lZgzBRyHWmtZq3+SzK1n+UM7fdIDxEhluQjftUemzlsic4
         vaxQ==
X-Gm-Message-State: AOJu0YzCWMMWpG/Na75v4FH8fwFu7RKuex33k7Go3OHpz9l7muPhj6wJ
	ZqfD5fHJDKpRCLi6HQanir1/WHryvmjnRe+t5dnygYRzis0mvCBewXiUKw2uLg==
X-Google-Smtp-Source: AGHT+IGaiybGi6wCqyOqfW7h/JsBn0scowWpyUza0Yrm57kHbK5xdefouT9nQfmNiEsFANaf/ZRQSg==
X-Received: by 2002:a05:6a21:329a:b0:1af:3715:80c8 with SMTP id adf61e73a8af0-1b2b70f893amr5554061637.46.1717658849988;
        Thu, 06 Jun 2024 00:27:29 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 06 Jun 2024 12:56:35 +0530
Subject: [PATCH 2/5] PCI: endpoint: Introduce 'epc_deinit' event and notify
 the EPF drivers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
In-Reply-To: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 mhi@lists.linux.dev, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9560;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=GbOYu+TwhG+hMHKPWYPlU9l5l4iVl79aA0bUKAASNCY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTCfUyadm2FsfT89qYm970AY7lKnZuqPFOxN
 5rQzJ3x5yOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwgAKCRBVnxHm/pHO
 9aD6B/9LE0t3lGEsKHXfOUpCw4cw1jDP5BxV1sJGlu1vOgp0Xka3RLQ5uhUlPtsjp6hb9MsvhXd
 4JvJeI9wFxsz0eqjQuUIDnxtr9xrEBvJFLdpAECsRTlLBQIE5ePIh7rYsZvUn9gWiagsu8W/F+S
 l/iuFgHvtI12yumK+1N+5K5E3c4yUPjiZV9DllTZmwdQLtAf0o7BpHeWMhpdbcToZ26w62K31zv
 kJSnZXzIsK/B/OrwnCbLVh8Xdq0iK81iAiqHBHuscXRJWmW3HpFMzyetAlDmXIBC1gV2eoMBQ4P
 nzak2S/MZ7yZQtluW+e3mLZ24byLk56hZgRySSN6KoDL5ZJJ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As like the 'epc_init' event, that is used to signal the EPF drivers about
the EPC initialization, let's introduce 'epc_deinit' event that is used to
signal EPC deinitialization.

The EPC deinitialization applies only when any sort of fundamental reset
is supported by the endpoint controller as per the PCIe spec.

Reference: PCIe Base spec v5.0, sections 4.2.4.9.1 and 6.6.1.

Currently, some EPC drivers like pcie-qcom-ep and pcie-tegra194 support
PERST# as the fundamental reset. So the 'deinit' event will be notified to
the EPF drivers when PERST# assert happens in the above mentioned EPC
drivers.

The EPF drivers, on receiving the event through the epc_deinit() callback
should reset the EPF state machine and also cleanup any configuration that
got affected by the fundamental reset like BAR, DMA etc...

This change also warrants skipping the cleanups in unbind() if already done
in epc_deinit().

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c |  1 -
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c      |  1 +
 drivers/pci/endpoint/functions/pci-epf-mhi.c    | 19 +++++++++++++++++++
 drivers/pci/endpoint/functions/pci-epf-test.c   | 17 +++++++++++++++--
 drivers/pci/endpoint/pci-epc-core.c             | 25 +++++++++++++++++++++++++
 include/linux/pci-epc.h                         | 13 +++++++++++++
 include/linux/pci-epf.h                         |  2 ++
 8 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 2e69f81baf99..78d5fc72c9cb 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -620,7 +620,6 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
 	dw_pcie_edma_remove(pci);
-	ep->epc->init_complete = false;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
 
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 4d2d7457dcb3..2324e56c9bfc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -507,6 +507,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 		return;
 	}
 
+	pci_epc_deinit_notify(pci->ep.epc);
 	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);
 	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 432ed9d9a463..4ca7404246a3 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1715,6 +1715,7 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (ret)
 		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
 
+	pci_epc_deinit_notify(pcie->pci.ep.epc);
 	dw_pcie_ep_cleanup(&pcie->pci.ep);
 
 	reset_control_assert(pcie->core_rst);
diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 205c02953f25..5832989e55e8 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -764,6 +764,24 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_mhi_epc_deinit(struct pci_epf *epf)
+{
+	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
+	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
+	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
+	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
+	struct pci_epc *epc = epf->epc;
+
+	if (mhi_cntrl->mhi_dev) {
+		mhi_ep_power_down(mhi_cntrl);
+		if (info->flags & MHI_EPF_USE_DMA)
+			pci_epf_mhi_dma_deinit(epf_mhi);
+		mhi_ep_unregister_controller(mhi_cntrl);
+	}
+
+	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
+}
+
 static int pci_epf_mhi_link_up(struct pci_epf *epf)
 {
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
@@ -898,6 +916,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 
 static const struct pci_epc_event_ops pci_epf_mhi_event_ops = {
 	.epc_init = pci_epf_mhi_epc_init,
+	.epc_deinit = pci_epf_mhi_epc_deinit,
 	.link_up = pci_epf_mhi_link_up,
 	.link_down = pci_epf_mhi_link_down,
 	.bus_master_enable = pci_epf_mhi_bus_master_enable,
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index e771be7512a1..7c2ed6eae53a 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -782,6 +782,15 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_epc_deinit(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+	pci_epf_test_clean_dma_chan(epf_test);
+	pci_epf_test_clear_bar(epf);
+}
+
 static int pci_epf_test_link_up(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
@@ -803,6 +812,7 @@ static int pci_epf_test_link_down(struct pci_epf *epf)
 
 static const struct pci_epc_event_ops pci_epf_test_event_ops = {
 	.epc_init = pci_epf_test_epc_init,
+	.epc_deinit = pci_epf_test_epc_deinit,
 	.link_up = pci_epf_test_link_up,
 	.link_down = pci_epf_test_link_down,
 };
@@ -905,10 +915,13 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 static void pci_epf_test_unbind(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	struct pci_epc *epc = epf->epc;
 
 	cancel_delayed_work(&epf_test->cmd_handler);
-	pci_epf_test_clean_dma_chan(epf_test);
-	pci_epf_test_clear_bar(epf);
+	if (epc->init_complete) {
+		pci_epf_test_clean_dma_chan(epf_test);
+		pci_epf_test_clear_bar(epf);
+	}
 	pci_epf_test_free_space(epf);
 }
 
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 56b60330355d..47a91dcb07d7 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -774,6 +774,31 @@ void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
 }
 EXPORT_SYMBOL_GPL(pci_epc_notify_pending_init);
 
+/**
+ * pci_epc_deinit_notify() - Notify the EPF device about EPC deinitialization
+ * @epc: the EPC device whose deinitialization is completed
+ *
+ * Invoke to notify the EPF device that the EPC deinitialization is completed.
+ */
+void pci_epc_deinit_notify(struct pci_epc *epc)
+{
+	struct pci_epf *epf;
+
+	if (IS_ERR_OR_NULL(epc))
+		return;
+
+	mutex_lock(&epc->list_lock);
+	list_for_each_entry(epf, &epc->pci_epf, list) {
+		mutex_lock(&epf->lock);
+		if (epf->event_ops && epf->event_ops->epc_deinit)
+			epf->event_ops->epc_deinit(epf);
+		mutex_unlock(&epf->lock);
+	}
+	epc->init_complete = false;
+	mutex_unlock(&epc->list_lock);
+}
+EXPORT_SYMBOL_GPL(pci_epc_deinit_notify);
+
 /**
  * pci_epc_bus_master_enable_notify() - Notify the EPF device that the EPC
  *					device has received the Bus Master
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 11115cd0fe5b..85bdf2adb760 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -197,6 +197,8 @@ struct pci_epc_features {
 
 #define to_pci_epc(device) container_of((device), struct pci_epc, dev)
 
+#ifdef CONFIG_PCI_ENDPOINT
+
 #define pci_epc_create(dev, ops)    \
 		__pci_epc_create((dev), (ops), THIS_MODULE)
 #define devm_pci_epc_create(dev, ops)    \
@@ -226,6 +228,7 @@ void pci_epc_linkup(struct pci_epc *epc);
 void pci_epc_linkdown(struct pci_epc *epc);
 void pci_epc_init_notify(struct pci_epc *epc);
 void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf);
+void pci_epc_deinit_notify(struct pci_epc *epc);
 void pci_epc_bus_master_enable_notify(struct pci_epc *epc);
 void pci_epc_remove_epf(struct pci_epc *epc, struct pci_epf *epf,
 			enum pci_epc_interface_type type);
@@ -272,4 +275,14 @@ void __iomem *pci_epc_mem_alloc_addr(struct pci_epc *epc,
 				     phys_addr_t *phys_addr, size_t size);
 void pci_epc_mem_free_addr(struct pci_epc *epc, phys_addr_t phys_addr,
 			   void __iomem *virt_addr, size_t size);
+
+#else
+static inline void pci_epc_init_notify(struct pci_epc *epc)
+{
+}
+
+static inline void pci_epc_deinit_notify(struct pci_epc *epc)
+{
+}
+#endif /* CONFIG_PCI_ENDPOINT */
 #endif /* __LINUX_PCI_EPC_H */
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index dc759eb7157c..0639d4dc8986 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -71,12 +71,14 @@ struct pci_epf_ops {
 /**
  * struct pci_epc_event_ops - Callbacks for capturing the EPC events
  * @epc_init: Callback for the EPC initialization complete event
+ * @epc_deinit: Callback for the EPC deinitialization event
  * @link_up: Callback for the EPC link up event
  * @link_down: Callback for the EPC link down event
  * @bus_master_enable: Callback for the EPC Bus Master Enable event
  */
 struct pci_epc_event_ops {
 	int (*epc_init)(struct pci_epf *epf);
+	void (*epc_deinit)(struct pci_epf *epf);
 	int (*link_up)(struct pci_epf *epf);
 	int (*link_down)(struct pci_epf *epf);
 	int (*bus_master_enable)(struct pci_epf *epf);

-- 
2.25.1


