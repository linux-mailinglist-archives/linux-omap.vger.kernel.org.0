Return-Path: <linux-omap+bounces-886-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6A87B8BC
	for <lists+linux-omap@lfdr.de>; Thu, 14 Mar 2024 08:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06A771F24675
	for <lists+linux-omap@lfdr.de>; Thu, 14 Mar 2024 07:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBAD5E09C;
	Thu, 14 Mar 2024 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AIk6P3YB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47945DF3A
	for <linux-omap@vger.kernel.org>; Thu, 14 Mar 2024 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710402533; cv=none; b=rMueNvOZm6HCeCuOv7TjzFpuMX+KbVlN2WPSJnEZCHEWb4WMFa0oBXtAkmIafQ+rtFIYNwxLQqyW9L4k6/lj3DCdXsVbY2Dq+ilOIQSofDJug5KCN4ahChs0/mvh3olNyykZjcakuQYKj+Z2wTrLPfR2XpPjxIvJoLyl0MHVS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710402533; c=relaxed/simple;
	bh=qPJ16p8Nd0ufuHPNNhiWpoB7/WLrRfNhrK4O8P0gaT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGdJ59I/n3xR/MLik+wSv/1mw+4Dti1Iy/tQ5aG1JS9LaoZCkGgwc9WK93XS3EvkeFqT9dy5KCpbgHpOlgOZGokyOleqfxjTR1i6to1yI4PnF+f9LbRwTaqYc5GmGJD+M7x7K6OsShbGNs5ywUQ6LBdwSjGMyP5zuXhp97vlqAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AIk6P3YB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so4465945ad.1
        for <linux-omap@vger.kernel.org>; Thu, 14 Mar 2024 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402531; x=1711007331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDNJWarj7cajVCQS29vifUUVp7XsRM4vIgwi+SOVNU8=;
        b=AIk6P3YBHvdShqxO/BlZmX0W2/in19zdd7icsbWVseeSsjnzFpMkZS5UjYA5icpIXJ
         xc4RIDpq9pHsTva5xDSUOz2p52PiPN3wsktr4wFqkFUI1VNetZUEKOi5PP8tOL7bqcQK
         g50Q6qrRc+0jhIFdG4d5b/9AYguZawXrr96beXcadfA92W06jBHCwB2AC5iqEccpp3rD
         uGBDgrCDjqPX5xjrbH8jlX6DQx1J9cpIi1M2KVvXr3OyZMjxSLrC8OHFzvWOrBPDM/ai
         tMqXytOH7ocoPd+QlMlxUTrIUobb2dndjTAMJjZQ7TlOQ2EW47NP4NzR1iT5UyU5vQZN
         I4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402531; x=1711007331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDNJWarj7cajVCQS29vifUUVp7XsRM4vIgwi+SOVNU8=;
        b=JG6GPIP/LvMvq0qkUY3Y8juu4wIRgt8y1MvdUEJ9siDCS3GrmGb4VBaO/rxUko3Qvk
         I+c+QJIY1xX3YBT75tcX0m+uDW2ptA6Gw1qLyFPGYV8oR9t041JzHgxVWhcJzRjOXxWj
         GP/FD49zMD8KbUzA4I2PUDAvDouJPxpihcgw5P+YaQleNiML76SjrmFf7XdSYkNJZ7UY
         kDhr7C78OjnGR6lWbPG82Adr7IzlPNCDrS268K/7I60M8wiEwQdx/EI62Ih5eBm1s0B5
         mD0WfEPIPh81gnH7CPFdIyLRIoEUBAw7adBS3hq5PzDg1+I/WVeLaqoL5J/ZY2N8qjmm
         8gvw==
X-Forwarded-Encrypted: i=1; AJvYcCVtKF6W5f03LFzSR1bS848X1MkFc9RxbugdIJS0WFhW4034a4uCyeNv2+2ybi4WupgkvBO9wdf4dikaYncQeoddbiui9nhzGEyG9A==
X-Gm-Message-State: AOJu0YwPxKJvFevgMOVcqq9MPhQlctPpGagfcTp29q+rvKqBCLuOH0Qg
	oi0bewAfgKaUjqzjVmTS27mIfS8HCBFxW7fhI1K1yC3gT4MhJvHkrsV4kyRG2A==
X-Google-Smtp-Source: AGHT+IE+D+W4BbyrX9NyG1q6Rj2Sh+I9VNq6AY/ZFKmdLwL1NVSvv0GdClSZ4XxH4cu8/H1IShZoOQ==
X-Received: by 2002:a17:902:ce87:b0:1dc:7101:58c0 with SMTP id f7-20020a170902ce8700b001dc710158c0mr7191731plg.22.1710402530826;
        Thu, 14 Mar 2024 00:48:50 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:48:50 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:00 +0530
Subject: [PATCH v10 2/8] PCI: dwc: ep: Add Kernel-doc comments for APIs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-2-14a45c5a938e@linaro.org>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
In-Reply-To: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5340;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=qPJ16p8Nd0ufuHPNNhiWpoB7/WLrRfNhrK4O8P0gaT8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvCQlfusmHtkRqGvWtKmvyeNKM+C65NCODwx
 bK1ZJh/eceJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwgAKCRBVnxHm/pHO
 9R9mB/0b5JWO1eadebdGxANbD0K6A2DGRS/f4+rNu6AbMSY8rwWT+Rj8n6ht/VsnDI6VWJmv5cX
 yyARqUDjVGCDiwA/WEqpipsBgWFfmMPluBZ7e313bEIF6adquxVluGL+FlU+9NJXU0ha0t4YgRn
 9VH3H8MoUSfbdLCcXahGcpBTMxnlx8m7yrS4tej9kAujUK5tPDywHhdg8gn4pZg/M1MI7glJL9a
 vSPoK2fdg/MPOJCldMqPq+am2+yZoov6soeWnweojr6oCW21TL7C16aPWL4qdc+T6qcAG4lRiFQ
 tqSy+G8Yrx4g3s1k+wA/Dld6ZVrPR3ec6Vw0cyTjrJj7B0QD
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All of the APIs are missing the Kernel-doc comments. Hence, add them.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 78 +++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index c05304eabb89..d7e8f2dda6ce 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -14,6 +14,10 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+/**
+ * dw_pcie_ep_linkup - Notify EPF drivers about link up event
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -22,6 +26,11 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
 
+/**
+ * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization
+ *			    complete
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -30,6 +39,14 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
 
+/**
+ * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
+ *				 the endpoint function
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ *
+ * Return: struct dw_pcie_ep_func if success, NULL otherwise.
+ */
 struct dw_pcie_ep_func *
 dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 {
@@ -60,6 +77,11 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+/**
+ * dw_pcie_ep_reset_bar - Reset endpoint BAR
+ * @pci: DWC PCI device
+ * @bar: BAR number of the endpoint
+ */
 void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 {
 	u8 func_no, funcs;
@@ -439,6 +461,13 @@ static const struct pci_epc_ops epc_ops = {
 	.get_features		= dw_pcie_ep_get_features,
 };
 
+/**
+ * dw_pcie_ep_raise_intx_irq - Raise INTx IRQ to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint
+ *
+ * Return: 0 if success, errono otherwise.
+ */
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -450,6 +479,14 @@ int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_intx_irq);
 
+/**
+ * dw_pcie_ep_raise_msi_irq - Raise MSI IRQ to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errono otherwise.
+ */
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num)
 {
@@ -498,6 +535,15 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msi_irq);
 
+/**
+ * dw_pcie_ep_raise_msix_irq_doorbell - Raise MSIX to the host using Doorbell
+ *					method
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 				       u16 interrupt_num)
 {
@@ -517,6 +563,14 @@ int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_raise_msix_irq - Raise MSIX to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			      u16 interrupt_num)
 {
@@ -564,6 +618,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_exit - Deinitialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Deinitialize the endpoint device. EPC device is not destroyed since that will
+ * taken care by Devres.
+ */
 void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -599,6 +660,14 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_init_complete - Complete DWC EP initialization
+ * @ep: DWC EP device
+ *
+ * Complete the initialization of the registers (CSRs) specific to DWC EP. This
+ * API should be called only when the endpoint receives an active refclk (either
+ * from host or generated locally).
+ */
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -716,6 +785,15 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
 
+/**
+ * dw_pcie_ep_init - Initialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Initialize the endpoint device. Allocate resources and create the EPC
+ * device with the endpoint framework.
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	int ret;

-- 
2.25.1


