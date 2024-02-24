Return-Path: <linux-omap+bounces-724-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8E2862338
	for <lists+linux-omap@lfdr.de>; Sat, 24 Feb 2024 07:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71813281275
	for <lists+linux-omap@lfdr.de>; Sat, 24 Feb 2024 06:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040D725775;
	Sat, 24 Feb 2024 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xeq+Vggr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303522616
	for <linux-omap@vger.kernel.org>; Sat, 24 Feb 2024 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757769; cv=none; b=qvnZDBco4zDLarMDx5V6gqmy9JGpYVoVZhYPMzFykY/y4chXITJ2BcYIxQwYDcQAapIOu2C3gvv5YeY9ODeHVIsDgSoObfbOruF+46ENxZP3jB/b9Sy6Am3DW3seYiWuLb5R/WFpgvmlT+B8OVgtDT1eimPEEjJZApeLUX5VC58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757769; c=relaxed/simple;
	bh=RlSifbzPxBtpu7PujRxYQXRm0HNOIzR8xSzjMWcC9aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaXoL/Yjl98K2Uc2JFY1qLfMv25RA4rcHQPnm2QVQNAkMYgN8JC9UamsKa1atakESwLQo8robQVAq8xToQCafgKOt1wWVb2zfCWOfk6yafOd8uEORNZFTE92bi6FKtze6+fFAY9/uJsis6t4w8mhT1CcNL+ts+h9r/5isMGUbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xeq+Vggr; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so1472913a12.0
        for <linux-omap@vger.kernel.org>; Fri, 23 Feb 2024 22:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757751; x=1709362551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7a40LFXPNdbxmfoEEZhDO4KpnySFv1la0Joe27Qfts=;
        b=Xeq+VggrPuLNeTEqB88/Z2mswIxo95t9YlexWB2/PqhuvdkMZgUFzbKiiPssx/C8ZT
         a4olQvY7tKZdDELxa7krnfaa9uY9G1EI4xj3rScVTiAQfn+bntULZqq3GKgHRSqeVpUP
         uj0m7m/GZJF4dOWWWNLItsVCzpHL5TKdxAj7sYCaDBOi9pv000PeEv+c6ncaas8hWKJm
         KFrAEWd1uJQSBcyjRwLhhqtRweIGt56KpurrjinDx9yzihkmajhQFB7/MVDdplN6hntu
         HLtMkUtpsy8OscyeOSn6pgVg0EbTgh+XS4m00CRCLFphKt6AZ/I/dpdWmVL7+jltsN1F
         Dd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757751; x=1709362551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7a40LFXPNdbxmfoEEZhDO4KpnySFv1la0Joe27Qfts=;
        b=EQ5rlG05ytSBf1dlV1bRNktt7Gj8YJmQC2wOjuSJvwqmnyMXpVfVRp984U46UuVEnX
         xm+6A0RKtYj6Rr4mbeqOHPzNryBkFAAkWaymJUBZM8E7XcDvsNFLDPneI0dzycB0TtmM
         qwwEFtwD7RT+NLwrQkc6kATAa7gi9KqDuBie2Wn34w2/nroxBNljNZS+0alA65TjQfqI
         WJA6m2nCFvuKYTSmho9EgRJFIEYTaiWSOLEPQixKejG94BNz0rbk9YGOEB5EPkGMNoJN
         eTFcjQW1gFr5BD/pFlHWL3+Pg6uM82sUUKa/aU2V0opafBD7FE9jPj8OVuiQ0oNQ/bGY
         kqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIODw62O3wRDo5X77bD2unM9WokcNAKiPR1awAWcSyyIkB76BVrEdRryUYlFdaKrOfSgj6s2+11rS0LC2OzG+r8rJV5nWkq6S/Vg==
X-Gm-Message-State: AOJu0YwtltwrCPHzrh8aGEiPEpvi9p4uEJrDQ1pFePsS9ILNuy3GeNpy
	0WtOiAROJmd8E0/uXN+ekNpqEaOhXrJs+Qk42gsFJ3pwUnaFLkvOTtsECpuapg==
X-Google-Smtp-Source: AGHT+IEnmjPufGU7gBJ9H9QW+12UD2lgzlRAOajQe9hGXsq6LLeTPTiiOQarSarYh6PhYynFshwacg==
X-Received: by 2002:a05:6a20:9598:b0:19e:a9e6:bfa with SMTP id iu24-20020a056a20959800b0019ea9e60bfamr3027765pzb.0.1708757750928;
        Fri, 23 Feb 2024 22:55:50 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:55:50 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:16 +0530
Subject: [PATCH v8 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-10-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6191;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=RlSifbzPxBtpu7PujRxYQXRm0HNOIzR8xSzjMWcC9aI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKYnORPJAWrZSvv2GaYNbEOsO2cd6ddhplS2
 ocQMoz+VY+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSmAAKCRBVnxHm/pHO
 9YJTB/4v7GuuRmbe0Zwxyo+tPfe7wHbF32OdBIEyJDAlpDhSmzu3hPTLA+GHTrWRvAi6LR1NxT2
 Geo7LAwfZyhTd9XHUj1LW6nZrP8HaeDHPpDeXdvury4TXEt/nJzaT6X46L8T4ZPVWeZjpnIAAUO
 VaRk25wB0GFN7qHOWP519/7zTqgE1Nvq8NwsPFJ0L+qF9PyDM5JQwqErlcoaeDE1ydE5VlfzHYY
 S0NyUgjfXf6OXkZduIxZ1Nre1D9jeGRMFFCPfwgmlDMMTWa2NPAg4BZtJhmQTJ3EZfldk6/srKQ
 baoBX4atAMnwFSU17XOzGeL6mEXH21rwVc7gH//Kc3x3mXaT
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All of the APIs are missing the Kernel-doc comments. Hence, add them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 92 +++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index fed4c2936c78..cdcb33a279db 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -14,6 +14,11 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+/**
+ * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization
+ *			    complete
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -22,6 +27,14 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
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
@@ -52,6 +65,11 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
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
@@ -431,6 +449,13 @@ static const struct pci_epc_ops epc_ops = {
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
@@ -442,6 +467,14 @@ int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
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
@@ -490,6 +523,15 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
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
@@ -509,6 +551,14 @@ int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
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
@@ -556,6 +606,12 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_cleanup - Cleanup DWC EP resources
+ * @ep: DWC EP device
+ *
+ * Cleans up the DWC EP specific resources like eDMA etc...
+ */
 void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -564,6 +620,13 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
 
+/**
+ * dw_pcie_ep_deinit - Deinitialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Deinitialize the endpoint device. EPC device is not destroyed since that will
+ * taken care by Devres.
+ */
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -635,6 +698,14 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+/**
+ * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
+ * @ep: DWC EP device
+ *
+ * Initialize the registers (CSRs) specific to DWC EP. This API should be called
+ * only when the endpoint receives an active refclk (either from host or
+ * generated locally).
+ */
 int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -718,6 +789,10 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
+/**
+ * dw_pcie_ep_linkup - Notify EPF drivers about link up event
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -726,6 +801,14 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
 
+/**
+ * dw_pcie_ep_linkdown - Notify EPF drivers about link down event
+ * @ep: DWC EP device
+ *
+ * Non-sticky registers are also initialized before sending the notification to
+ * the EPF drivers. This is needed since the registers need to be initialized
+ * before the link comes back again.
+ */
 void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -743,6 +826,15 @@ void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
 
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


