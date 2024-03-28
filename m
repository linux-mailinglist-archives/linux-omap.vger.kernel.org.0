Return-Path: <linux-omap+bounces-989-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB8788D68F
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EA911C24FB5
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 06:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1BB28E34;
	Wed, 27 Mar 2024 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2Dihzpn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF321A06
	for <linux-omap@vger.kernel.org>; Wed, 27 Mar 2024 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521468; cv=none; b=NsOdLI3JFgY9LDtLX2jQFL7F32nHmS1caNmOK2/r6WvnpIAK6QcdvDKcVh6q1XBolm5I1nGumznJoX9C2uKbRqSBUHH6LZMdICNAvIOK3ktHmVjnx9sLnw6KgWCERm3L/GJKA3tsiuV1PsTj1erdTbtPzdn3ZfzDFCOo0b4waEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521468; c=relaxed/simple;
	bh=4pckZjBmxNpusZkqA+M22ldG4knwHCaY60uejIejplk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJqK0E09yEHe1J//hxdN8w6rMASu4KJwNZZyEG91Auj2Jx7tJYdyvesSBlA/1Hwa+XANeKeOtVPXEeq1hF+L1VnccIIJ+hbEI6jqFVyOkc19hVq7GO9I2PONXRvOlDo/anr8ZvCyLFjsj9dv6Jki148d9bXrYX7UIXjqj0T4H6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2Dihzpn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e0878b76f3so4487365ad.0
        for <linux-omap@vger.kernel.org>; Tue, 26 Mar 2024 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521465; x=1712126265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fbftbLuAcGOCvJ547ndsEKPrfAbJI6lg5QkNn87c6A=;
        b=o2DihzpnKDYVUZ23KN1s5jCBABHSlublPgq+2JRawGfLMaO6TR4rD4lT9xhofQmKI9
         pXK3DwNjxElYmZ40YhrYLZUHzOwNOo87oGzGNdp5LtpjPLLj2w/66nmPgt3AAFouZ7T4
         BcXhL302lC9sX9yqcogkBpLEEoZCFNBnJHFDnx5ubnGbDmkUjgQLo3iPNshsxATTlLyv
         dvHN6XffuuW5M2rp1qWsa5Ydyz/7X3Ae/meTlMobAQCQNG1cQX3e3eVG77zJDg2tDxL8
         cqwGizYINGc8dKzIA6J77LehbenyfINnEdCa1CHyg/NPdEDfQ1tNlG6omPV/Kkp/y+Z0
         +fNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521465; x=1712126265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fbftbLuAcGOCvJ547ndsEKPrfAbJI6lg5QkNn87c6A=;
        b=tjbSFYgviz1y9lHXUzXtFw64pP3OPOy9DdbP+0K+h4sSm0daeg66eXNYRpUoI1kt8A
         nlzzO+UZGOTxiKBHiQMAJ5aE6eWihvNQNNME4iWKTFUnzaAL6R7dZQ7+a39Z3ZmsbW/2
         a3ttsl0DRaMPD2g+PYIEse9onS3k7hZUedeMBmRY3y4NW1EMKRJXCJ7vUgUS75rvvf4q
         YlwNPWgw+fWTu6gloRcHBliStNgW9vbXFOphLb5vr5dyZ+qaMf0eOzGuYtcQHkWghxgw
         PA36CKjyrpnhHq0j/CnlG+Y50ZWA2KqsjGKYuY0eKXYW3b1BuysHZTHZUdLPvgZ2F1Ie
         6qlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC+OWTa+/Z0uyyI1hUcsr9lfnUQ8NA4IQLgb7XkwUQGACaIn5YmIAHK46ydXPAoZZ6Kbuzcbq/fNt/gGIGtcWa+MPbiIdihQBkOA==
X-Gm-Message-State: AOJu0YzagCFx5d+7M218iBdKdj89tyfyV30228kN20zBC1nUpEyQh177
	UW/qCc8Y4BMGZ+Gs2UjCUIxmkS8ANXD3hRu6rqudmmqOigMC/KhyWegTmtyUfA==
X-Google-Smtp-Source: AGHT+IEL2kQ/E2w8VNPZzPOZ/AXjQBKSfaIRVHPHsHH5DUZufhi/FZ0THiRCOOjOJPVwkmxhtjEwaA==
X-Received: by 2002:a17:902:ec92:b0:1dd:8ed0:59d0 with SMTP id x18-20020a170902ec9200b001dd8ed059d0mr5552393plg.17.1711521464905;
        Tue, 26 Mar 2024 23:37:44 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r9-20020a170902be0900b001e14807c7dfsm602553pls.86.2024.03.26.23.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:37:44 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 12:05:50 +0530
Subject: [PATCH v11 4/8] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v11-4-6f5259f90673@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=4pckZjBmxNpusZkqA+M22ldG4knwHCaY60uejIejplk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA75VlvEI0iis4/mkrgePkLoXBVTtHKaqjt41b
 U9Tp0UU8diJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgO+VQAKCRBVnxHm/pHO
 9WCIB/49HeYYYzpNo0IRZF4N+qJBcgCa5NyT0Fg2bMN5zwctdcsIeJc0KjBFpj+1feSCAHJ0xDZ
 6BH3+IYqHU6ZvNG46DCzRLBbjtCAfQE7NM+viqwGUhY/HqnMXhH86Eld5xbYMvPUN2zgWJUkGA3
 wRZEWcLlR6eeWiL23cmECPesRsWTAsY/k432+j0ekBkhHdb1Ni7M2ZiR+KT4LnLlII7xSEhWLlq
 q0JjZv/RjCw2M7C4OTi4w7OkM8PMBhmcekNLARohzzIQqn3Kef5UOMpUdWDEkbsT/TucQb9CiNC
 I7PqNzDxoRcw06lKPoHn2kk4tg4slh6L68ZO57XG1aETSGRe
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 6 +++---
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7d60abe4fef7..7ff2015736ef 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -618,13 +618,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 /**
- * dw_pcie_ep_exit - Deinitialize the endpoint device
+ * dw_pcie_ep_deinit - Deinitialize the endpoint device
  * @ep: DWC EP device
  *
  * Deinitialize the endpoint device. EPC device is not destroyed since that will
  * be taken care by Devres.
  */
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -636,7 +636,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	pci_epc_mem_exit(epc);
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
 
 static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ab7431a37209..61465203bb60 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 }
 
-static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ac97d594ea47..9d9d22e367bb 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1


