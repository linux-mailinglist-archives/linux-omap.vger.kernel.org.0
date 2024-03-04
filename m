Return-Path: <linux-omap+bounces-800-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A386FD70
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 10:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12EA41C20910
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 09:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B4238F99;
	Mon,  4 Mar 2024 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvx4ex0b"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1C383AF
	for <linux-omap@vger.kernel.org>; Mon,  4 Mar 2024 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544251; cv=none; b=lmlQtdxT1+yPlN+N4o7IkBLP1OskYT56JQs8vygOPEcrtM/BQlCARW4w197Dd9U9ZRdQ2TQoavCzEjNfk651hE5UvQW9JF6j1lDczmyxhgut0vGIUR1Ez46jK9jL599kLDg3AY9ycdxcX4O0Dh2xxyiJ46KBska8xP9Dn6bQSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544251; c=relaxed/simple;
	bh=xgOAPReEJUOUSBbq55ieo+WguRSIcL9ZHZoCKItajLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkI2HNnhfCKe+mjraJl2z5g2ZQO/vCn+Ua5RWiAHvcZqFwC0tKyfxweikYRLltX5e1p4OLIELK00zLcl28Penw38bkunTAgmlwL1XY/hVJ7wwADEwVlmHcZEFMutRhL7uS/r3haQ6bafNOElQXMa2UetuuX7PnzIaBlwmxVQqKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lvx4ex0b; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dca160163dso41084115ad.3
        for <linux-omap@vger.kernel.org>; Mon, 04 Mar 2024 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544248; x=1710149048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgFiBJufO6zwQVBrqTARojW9dQ2irJqXt9kXbZy5Siw=;
        b=lvx4ex0bjswscxWv1yd+z9REWSJAwbdOW+KLAoUxHg7z/5QKbgP2WN6Hqw6Gqy8ZjX
         ydwFmug8aAnc+DZLKteRTV8gMkGFfgo/UsxWmfM6XyrPM7XaKX3PpRiWawIXqtUtTA18
         9XfkpIh1nZFhDiQy45sWVj82UGsNaPXHhSh5XCoJQg2Sd6z/XoOD2No2P90hTg6FiJUN
         N7gEbXFP3jiAuhiZIpBh8a42NsteXtmdeiQuBybQ1wojQo6Neq55uOVnvnfYOuJFQMVz
         F2QRjcw6GYQkW7MhRX4nV6L5RI0AJTLrNvUdW4SybHiizk1lH0kzGiS0sEmV1Dm32pYj
         IiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544248; x=1710149048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgFiBJufO6zwQVBrqTARojW9dQ2irJqXt9kXbZy5Siw=;
        b=gLx+CeghkYPKyddea3nAHmQWL7tt8tBNXQX6EjYuxnYF/7152S/n5YWL0LfrMDoeYu
         zY4IZzdX+XbUSk13YVDRA11290a+ZSoAlb/wJWaUKFLG7CeOhh+LD2ezSEekX2MDEfPa
         msGGnVeqC3Lj/S5Wux3cqVRiU2kSx2+dK5P0vVSgde57CAeTDFSrusibzw1C2EJ1mVN6
         j7W90uQzR+HPgEht7gQ7Sj2mqHLmdKrpY6StFwFl/K+Q0mMzQWRTgrPwW5zjbcPvBbv0
         qZz10bxncz4KDbxjTv04yI+oJf5/b6smOmk7Pq/g0cw8012trbpYtKkD46bdzYM9en8P
         hvvw==
X-Forwarded-Encrypted: i=1; AJvYcCVRumpBwMBsDZANGqJskO9wx3vWlbJsjX5CtTB62VtEVIP13JQ+0nYNn6M90VzJPBucH38f8zgESzyjzBq/bvZah83j9UMiJ69OgA==
X-Gm-Message-State: AOJu0YwnLQxK1sqJwf6CMZRe2MpUFzMJX8J1qsz09pkQBQ4nzjADodVr
	oNXzarkkl74wjDbDqt+uZJ7kMyj+X4KL7wgDVx07JOkyxqeWZdz4WOMtD35r6Q==
X-Google-Smtp-Source: AGHT+IFo5eebOeyugha7lOr8k0/CIeXIuboU6TDZf1rD6y0IgFPJt4NlY4gqHykbE2xn1NMzjbgGew==
X-Received: by 2002:a17:902:d48b:b0:1dc:8790:6809 with SMTP id c11-20020a170902d48b00b001dc87906809mr11325571plg.8.1709544248627;
        Mon, 04 Mar 2024 01:24:08 -0800 (PST)
Received: from [127.0.1.1] ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001dbb06b6138sm7996648plc.252.2024.03.04.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:24:08 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 04 Mar 2024 14:52:20 +0530
Subject: [PATCH v9 08/10] PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown()
 API to handle LINK_DOWN event
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pci-dbi-rework-v9-8-29d433d99cda@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6608;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=xgOAPReEJUOUSBbq55ieo+WguRSIcL9ZHZoCKItajLk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl5ZLYtskHlXQ3QZgExsN5RA1FP9N/GDLnjzUGH
 kRLsANy4nOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZeWS2AAKCRBVnxHm/pHO
 9VyMB/4yPbhV7BnfjQ7iJT41Ka8VybDCRRkNm0C7sKKBhcaHq1riRDs/JMnNLA2dQWxrkfZGT3d
 R8CWA2JwwwfVZndAw/ZCieNB4niqKfzKoxLoY5kpj3zNSXkqa2tRrMIOjzrtlft8yyK0LoVHvk4
 8HMNKJK+Ke+eTMD1PENFMLWtRGEGQT518TSpUMu6C8RrLQgSIsE8Qxi1NsFSEXJRI1oGXZjUhYN
 jo6eMu2S/mKrrQMt/hxHRxzc5TXfDPf0jfaQIAkrsDzGrvwRCw0/8X9ORAMr6d2NxPjUCWhVp7z
 nhlCJDofqRlh4Hgs8DOSbg84xzb21K7cqgaPclQVLe+G+RlB
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

The PCIe link can go to LINK_DOWN state in one of the following scenarios:

1. Fundamental (PERST#)/hot/warm reset
2. Link transition from L2/L3 to L0

In those cases, LINK_DOWN causes some non-sticky DWC registers to loose the
state (like REBAR, PTM_CAP etc...). So the drivers need to reinitialize
them to function properly once the link comes back again.

This is not a problem for drivers supporting PERST# IRQ, since they can
reinitialize the registers in the PERST# IRQ callback. But for the drivers
not supporting PERST#, there is no way they can reinitialize the registers
other than relying on LINK_DOWN IRQ received when the link goes down. So
let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
non-sticky registers and also notifies the EPF drivers about link going
down.

This API can also be used by the drivers supporting PERST# to handle the
scenario (2) mentioned above.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 111 ++++++++++++++----------
 drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
 2 files changed, 72 insertions(+), 44 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 278bdc9b2269..fed4c2936c78 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -14,14 +14,6 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
-void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
-{
-	struct pci_epc *epc = ep->epc;
-
-	pci_epc_linkup(epc);
-}
-EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
-
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -603,19 +595,56 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 	return 0;
 }
 
+static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
+{
+	unsigned int offset, ptm_cap_base;
+	unsigned int nbars;
+	u32 reg, i;
+
+	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
+	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	if (offset) {
+		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
+		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
+			PCI_REBAR_CTRL_NBAR_SHIFT;
+
+		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
+			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
+	}
+
+	/*
+	 * PTM responder capability can be disabled only after disabling
+	 * PTM root capability.
+	 */
+	if (ptm_cap_base) {
+		dw_pcie_dbi_ro_wr_en(pci);
+		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
+		reg &= ~PCI_PTM_CAP_ROOT;
+		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
+
+		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
+		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
+		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
+		dw_pcie_dbi_ro_wr_dis(pci);
+	}
+
+	dw_pcie_setup(pci);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dw_pcie_ep_func *ep_func;
 	struct device *dev = pci->dev;
 	struct pci_epc *epc = ep->epc;
-	unsigned int offset, ptm_cap_base;
-	unsigned int nbars;
 	u8 hdr_type;
 	u8 func_no;
-	int i, ret;
 	void *addr;
-	u32 reg;
+	int ret;
 
 	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
 		   PCI_HEADER_TYPE_MASK;
@@ -678,38 +707,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ep->ops->init)
 		ep->ops->init(ep);
 
-	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
-	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
-
-	dw_pcie_dbi_ro_wr_en(pci);
-
-	if (offset) {
-		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
-		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
-			PCI_REBAR_CTRL_NBAR_SHIFT;
-
-		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
-			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
-	}
-
-	/*
-	 * PTM responder capability can be disabled only after disabling
-	 * PTM root capability.
-	 */
-	if (ptm_cap_base) {
-		dw_pcie_dbi_ro_wr_en(pci);
-		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
-		reg &= ~PCI_PTM_CAP_ROOT;
-		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
-
-		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
-		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
-		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
-		dw_pcie_dbi_ro_wr_dis(pci);
-	}
-
-	dw_pcie_setup(pci);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	dw_pcie_ep_init_non_sticky_registers(pci);
 
 	return 0;
 
@@ -720,6 +718,31 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
+void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
+{
+	struct pci_epc *epc = ep->epc;
+
+	pci_epc_linkup(epc);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
+
+void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct pci_epc *epc = ep->epc;
+
+	/*
+	 * Initialize the non-sticky DWC registers as they would've reset post
+	 * LINK_DOWN. This is specifically needed for drivers not supporting
+	 * PERST# as they have no way to reinitialize the registers before the
+	 * link comes back again.
+	 */
+	dw_pcie_ep_init_non_sticky_registers(pci);
+
+	pci_epc_linkdown(epc);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
+
 int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	int ret;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f8e5431a207b..152969545b0a 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 
 #ifdef CONFIG_PCIE_DW_EP
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
+void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
@@ -688,6 +689,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 }
 
+static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
+{
+}
+
 static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	return 0;

-- 
2.25.1


