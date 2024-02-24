Return-Path: <linux-omap+bounces-715-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EC862300
	for <lists+linux-omap@lfdr.de>; Sat, 24 Feb 2024 07:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EBCE1C21D45
	for <lists+linux-omap@lfdr.de>; Sat, 24 Feb 2024 06:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C736175BF;
	Sat, 24 Feb 2024 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLxxhM9r"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C029175B4
	for <linux-omap@vger.kernel.org>; Sat, 24 Feb 2024 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757677; cv=none; b=UHN3XAYT7kN5Ob9Rfl517y1AJzxpHQn7d7DkDwM2PvmydyZ6Gsx9edz5uy3PZDCkvgMtilXuv4Aicw8kBKh3Q0RsmCG7Ku9nmlPPUacdQCBsXR2VQw/ribJhvnMC1nb190ycS4XlJNVFuDEdCJsm8sTldnNfiZYcgCLmGNk34q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757677; c=relaxed/simple;
	bh=brw5OQuV/Ik2l5C2ECpfbHlK/lWJv4K6yC6zoE4TG1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auHvladm3UJUbCl/5dA/2HTU/v44yHx66u4eIJICLXQpULx5CXf6/+6KwRYZJgIi1Bv5ruOpGyH34SPAr55WSK+8pM7paiUtnfQWReUvGlFuKLxprY6qL6F9TUZHKO2LSlR9EZ1Y5H+DxLnoWLAZ5BLaUSLMtT/jrL112/yZi4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLxxhM9r; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e4804fc21cso473828a34.3
        for <linux-omap@vger.kernel.org>; Fri, 23 Feb 2024 22:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757673; x=1709362473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mn2ASIeu7r3EoULMeRoBQbh1Psop/1NIFKdgQYb7+D4=;
        b=QLxxhM9rMteUACjDKu9BlJjqTrm1C72ndJysY6ylG0vzXFMKUw0Tw+8qfIwugh8hK+
         xA9dQOTNFhDn3COkawo9nJSGTxKOqp/gyIaOWRq7L/Tuk0bPYmdah1+x1OtM5ejp6JYh
         G9sQZLyP/jMJgLXaUkXg90CrUVxNOz4NF8/dIcwAGmdFHpE4Wm13YwKuz9ZrJzYsLhxt
         +CaKinPDeCeByzBsz3Gj9yldpbGxZCLn955CJUzBLFxaywIH19bmf87PJKBHOv6CdqVg
         ahG7oQWHzQUOArj6B856xdMRkaY5ds8hWv8Qh0xIdgObBtWFUJ9kohyoa34ICiAg2lxe
         0fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757673; x=1709362473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mn2ASIeu7r3EoULMeRoBQbh1Psop/1NIFKdgQYb7+D4=;
        b=rJm2MdLy59scEOvmKgAO3i+Xg8U8N4+0yXVouSwsZ35or3ImCLhxgfoAALgWmFzH1Y
         /YGZyGC9TRkIm1b8avkKHCREtrgo5Qhaohuj/q4vCkSGlO03DZwTNM+HVAiRCZ9MjTv2
         FXg6Ix/lU3b3SSLXnjsolMxVbJfhAjTj3XFx/aCN/XHM2LpNE7O0qaJsEqir0HOtZcZE
         2/UpjfVroo8RQxwbaLpz23Ri9WnqgE+9PpScuWC8tOzY80OJE/tU6BjT91oTMsx4HhS/
         jUbhxqnqSPE4pvHOFOFB1o2nDQFrtY6k6WMhqW6F50lTKDgdbq5dZUnktCSIjybhbj/x
         vREA==
X-Forwarded-Encrypted: i=1; AJvYcCWKZAuQHFgqrNmF+ugV/IwipEoFLfkb50F7fKWgK9ShyRlgY1U9+G7619nxUmzkYIZQPB4+9KapKRVWWPlRBp3dCNivWvRDTkfbqA==
X-Gm-Message-State: AOJu0YwGvGpOdjgvfQkJ9dqz6oxNkSjUUBenWZ/XCCifQiNnaevEjmlr
	8e5lW31DRBUNr0vXZJ7VLxc7t6xHtbtoDxvY1Erh/Jh8JgAbNIz/30zc4WkPBQ==
X-Google-Smtp-Source: AGHT+IGBAxKLgMSrx3D0p6tMCl/7cXKMsLNJciUQtg+3nr50O3OgHpw5mzYSGzkWC4yMYzxEhISWFw==
X-Received: by 2002:a05:6808:3010:b0:3c1:36ac:2fea with SMTP id ay16-20020a056808301000b003c136ac2feamr2036396oib.10.1708757673610;
        Fri, 23 Feb 2024 22:54:33 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:07 +0530
Subject: [PATCH v8 01/10] PCI: dwc: ep: Remove deinit() callback from
 struct dw_pcie_ep_ops
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-1-64c7fd0cfe64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4240;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=brw5OQuV/Ik2l5C2ECpfbHlK/lWJv4K6yC6zoE4TG1w=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKV8PrPVZSd5HRR7G2F741l8Icm2yNIq7UQJ
 qc+mL6yJuuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSlQAKCRBVnxHm/pHO
 9YmPB/9X5Ta4E/Hhy7FsJgoBRr1RtBvMl2Lc7bKYhL7xUequSQ5WKmQiR6HE4VWQTM8CuGoxsmy
 5SyASkRwP3AXWWOfANkwRkUSzJZB+AFJHqNILrljTKPqLk30a9iVmPg7kUg5MiqHUsEHmjdcJdg
 9je0nna40J98Rs3EvE1Onr0L2ucC2O9lflmaquexdy3tcFMDgiIh3d/Qu4lbfYZAMN2+dB7Sv6u
 lEB62w5XOBHeQ5ctN/+211oRIs91KzCE3IgHmquYjjEsySHHVvuvry141nyYK+GtyYPaFLZZbXc
 c2PoIlx/WgOB4M0lwpVpD//ud0N20aIJp3n6eVplMuu6pSwm
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

deinit() callback was solely introduced for the pcie-rcar-gen4 driver where
it is used to do platform specific resource deallocation. And this callback
is called right at the end of the dw_pcie_ep_exit() API. So it doesn't
matter whether it is called within or outside of dw_pcie_ep_exit() API.

So let's remove this callback and directly call rcar_gen4_pcie_ep_deinit()
in pcie-rcar-gen4 driver to do resource deallocation after the completion
of dw_pcie_ep_exit() API in rcar_gen4_remove_dw_pcie_ep().

This simplifies the DWC layer.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c |  9 +--------
 drivers/pci/controller/dwc/pcie-designware.h    |  1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 14 ++++++++------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 5befed2dc02b..d305f9b4cdfe 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -575,9 +575,6 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 			      epc->mem->window.page_size);
 
 	pci_epc_mem_exit(epc);
-
-	if (ep->ops->deinit)
-		ep->ops->deinit(ep);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
 
@@ -738,7 +735,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 			       ep->page_size);
 	if (ret < 0) {
 		dev_err(dev, "Failed to initialize address space\n");
-		goto err_ep_deinit;
+		return ret;
 	}
 
 	ep->msi_mem = pci_epc_mem_alloc_addr(epc, &ep->msi_mem_phys,
@@ -775,10 +772,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 err_exit_epc_mem:
 	pci_epc_mem_exit(epc);
 
-err_ep_deinit:
-	if (ep->ops->deinit)
-		ep->ops->deinit(ep);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 26dae4837462..ab7431a37209 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -333,7 +333,6 @@ struct dw_pcie_rp {
 struct dw_pcie_ep_ops {
 	void	(*pre_init)(struct dw_pcie_ep *ep);
 	void	(*init)(struct dw_pcie_ep *ep);
-	void	(*deinit)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
 	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index e9166619b1f9..ac97d594ea47 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -352,11 +352,8 @@ static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
 		dw_pcie_ep_reset_bar(pci, bar);
 }
 
-static void rcar_gen4_pcie_ep_deinit(struct dw_pcie_ep *ep)
+static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
 {
-	struct dw_pcie *dw = to_dw_pcie_from_ep(ep);
-	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
-
 	writel(0, rcar->base + PCIEDMAINTSTSEN);
 	rcar_gen4_pcie_common_deinit(rcar);
 }
@@ -408,7 +405,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.pre_init = rcar_gen4_pcie_ep_pre_init,
 	.init = rcar_gen4_pcie_ep_init,
-	.deinit = rcar_gen4_pcie_ep_deinit,
 	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
 	.get_features = rcar_gen4_pcie_ep_get_features,
 	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
@@ -418,18 +414,24 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
 static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
 	struct dw_pcie_ep *ep = &rcar->dw.ep;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_PCIE_RCAR_GEN4_EP))
 		return -ENODEV;
 
 	ep->ops = &pcie_ep_ops;
 
-	return dw_pcie_ep_init(ep);
+	ret = dw_pcie_ep_init(ep);
+	if (ret)
+		rcar_gen4_pcie_ep_deinit(rcar);
+
+	return ret;
 }
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
 	dw_pcie_ep_exit(&rcar->dw.ep);
+	rcar_gen4_pcie_ep_deinit(rcar);
 }
 
 /* Common */

-- 
2.25.1


