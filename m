Return-Path: <linux-omap+bounces-1017-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C35F88D9E6
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 10:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E571629B6AA
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 09:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6E947F50;
	Wed, 27 Mar 2024 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EG8bvRRM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5AA38DEF
	for <linux-omap@vger.kernel.org>; Wed, 27 Mar 2024 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711530864; cv=none; b=d7CRmXAZf//QRQwAgqU9L8fE8ttvP+7ucW6ctY+YRZKkBOFYhEUWKrg2bDr+kVK9f9iDhnDROjZHhKV6eTrnLukTrIEgziqDLAiJv+Fdij39Odt10njkIc7kn1vbgf78k0ZN0sNYz93SuAq1a2W8XRoTBruFIz7lvgUr3sJlVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711530864; c=relaxed/simple;
	bh=pNo18qkD8Pxin1ExwVA6sv//n2b0xE66vsBA+jskrBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+FYTC5sM6usdeghCt2hG8I9AZvgRN4rLAeCcCiu0Yff2VS8a3PogKmqcNW3Bk/x9RvBZijUn3kqc04YmDMJbsC2gT6paQc6DpNxbvMax0+AifrYeMd5w2xKLG7m9F70VCmpVuUZzoZKQTOsQYAuUvZLGA7tL1kWJwkfOaSRvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EG8bvRRM; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5a46abf093cso4078920eaf.2
        for <linux-omap@vger.kernel.org>; Wed, 27 Mar 2024 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711530860; x=1712135660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqASZM91XPcXELguAroAsfznz8SI/TV8wGGgEbcPSCg=;
        b=EG8bvRRM7uD707uoc9VjTbvQIcXJ639OA7he0nYXcsSv56A43LV56om/tEB8Yzk8Le
         Kf16CTu9RmGaCenkl76b52s4O/9b88r5DOV7YIbMl47Dk3WCmweenGX5IG5FTt9GBaFs
         8O17+aisI3DsAFBjAqVDimk7RPfjj6KNto1v62NBCE1wIgR3VxfEWWJZtV4yrYrN0Abp
         DkVJcjmuivLbppxqOPfXM9ZtRCLPVGbVDD/DRQ03gzh1llNMQTWVqEz3Z/PmPCvIySRQ
         vEPhSziNc3Hrq7VOKdGMIGUhrwP0MOUGswsNIT20MhKeOJrmgzPZxMXbD7+k5Tn31m5c
         fAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530860; x=1712135660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqASZM91XPcXELguAroAsfznz8SI/TV8wGGgEbcPSCg=;
        b=osqaPmAd+IvZZOdxtcEB8i6X34I6Q9orYxgVBWpxCY3f8WWpPy+rEQEbw6F/y74QEi
         QFtk+DW3Sug8o1H2Wf7WJsoyYcNz9fTc/f6b429mqW46sbwArFts98CohkmnFtbAfmON
         jA/zULjDBfnpuLrI3PRXiKfsm0zNnELLyhb/a6UNSrz3kTOdS7lcttS0F2Lao13AjyIT
         RtNwtridNNDS7B+E/S3lV5dmWCpnBPwfzi1hS4yoZMzw0TBdT0QfTnLTAcKOnRHITUEu
         XomOUnMB/tcCSn+ELlyYZOwM/So4mx4PiblhZFQQGPMGBhZUamR0+fGVY1gxG+llp0jk
         RebQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3EQIz3mnJHU91Qsh/HPhVDLrM1Ckfu25dj/qFCKcRAHtyiPvtewJYoX85f3inFQMD9LJ4X/XN4YTkDfxLHoeaE6R3GGO2eLtq5Q==
X-Gm-Message-State: AOJu0Ywvaw+ONUl9LNhhifpqIpRVL5k6cT4e740B7ODKIWCBk8Hr7ydG
	K8eZPfXhwgX9k14ZTMY25rawjofBBr/+IFhzf3c5t9k/IaZrhnU6esgCdSLotg==
X-Google-Smtp-Source: AGHT+IGkxnrnXnBY3c/aP7t7drqoD/wVEvlWzS8FQLVs973449FDjsXS7XP6PnjZ8yU1SgAX6Fby7A==
X-Received: by 2002:a05:6358:42aa:b0:17e:de1f:290 with SMTP id s42-20020a05635842aa00b0017ede1f0290mr5630348rwc.25.1711530859729;
        Wed, 27 Mar 2024 02:14:19 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b005dc4fc80b21sm8673871pge.70.2024.03.27.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:14:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 14:43:31 +0530
Subject: [PATCH v12 2/8] PCI: dwc: ep: Add Kernel-doc comments for APIs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v12-2-082625472414@linaro.org>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
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
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5382;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=pNo18qkD8Pxin1ExwVA6sv//n2b0xE66vsBA+jskrBo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA+NImhvprmFrGELVQDHV0ZI/sZ+kM69J4CaE+
 HElRFx/IL2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgPjSAAKCRBVnxHm/pHO
 9W5jB/9zQRHznlVynvYmBiqzCvcB02QT8dW3UjzdximNDPDPbCzqXkccGjVDilD+Mi4X1Xzl8Nm
 NDfCNc54wBkV62wzDAGL8J5gH6TVAtcorCq3lpbKhJHKEd5i64jvO2wLpnBd6cqJfeO2nD3slks
 2PvDyP9rltiK+KfM2e3DPOIwMJ8s/WmG9A6WBSVWj46hgkKlH9qvUQ+1Sn1DJGBzLQKR/lbkJlH
 YqeH3CV6lK+tXv8kJKdi43CqqrA5ScQr+fU/+8yryhga/HqaM3LUZ1yJFB/NgP28cmXilmbgXD1
 Agj1GUZAeXAgAMMUashx7s7FQUNOHLAy2qVG+Q6GQhVhCnma
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All of the APIs are missing the Kernel-doc comments. Hence, add them.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 77 +++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index c43a1479de2c..dc63478f6910 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -15,6 +15,10 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+/**
+ * dw_pcie_ep_linkup - Notify EPF drivers about Link Up event
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -23,6 +27,10 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
 
+/**
+ * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization complete
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -31,6 +39,14 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
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
@@ -61,6 +77,11 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
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
@@ -440,6 +461,13 @@ static const struct pci_epc_ops epc_ops = {
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
@@ -451,6 +479,14 @@ int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
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
@@ -500,6 +536,15 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msi_irq);
 
+/**
+ * dw_pcie_ep_raise_msix_irq_doorbell - Raise MSI-X to the host using Doorbell
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
@@ -519,6 +564,14 @@ int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_raise_msix_irq - Raise MSI-X to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			      u16 interrupt_num)
 {
@@ -566,6 +619,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_exit - Deinitialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Deinitialize the endpoint device. EPC device is not destroyed since that will
+ * be taken care by Devres.
+ */
 void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -601,6 +661,14 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
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
@@ -723,6 +791,15 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
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


