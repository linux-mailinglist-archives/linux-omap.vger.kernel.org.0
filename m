Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E76D1DDE1E
	for <lists+linux-omap@lfdr.de>; Fri, 22 May 2020 05:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbgEVDhb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 23:37:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50108 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbgEVDha (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 23:37:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04M3bD47038277;
        Thu, 21 May 2020 22:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590118633;
        bh=opYvoy5UCDPBgLl5ETynu7BDPi03pcKgvKMD9L7KDJU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qa06+gh2QXyM2o22cjvuJcd/HFAjsqxsYg56X2zsiirBQyJPsOVcUm27UtaK+lieU
         nekKPU/2hAjMbxOtx9Q1TkVo3zkoEtPql7mmHGrj1paYWYdKl55iUts+t8L5RDKAgA
         1bZqRIn7YpSBXPKXtmeqLNQgbl4BeaflsTuxZIzk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04M3bDCA008800;
        Thu, 21 May 2020 22:37:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 22:37:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 22:37:12 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04M3aYc5062596;
        Thu, 21 May 2020 22:37:09 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Tom Joseph <tjoseph@cadence.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
CC:     <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alan Douglas <adouglas@cadence.com>
Subject: [PATCH v5 09/14] PCI: cadence: Add MSI-X support to Endpoint driver
Date:   Fri, 22 May 2020 09:06:26 +0530
Message-ID: <20200522033631.32574-10-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522033631.32574-1-kishon@ti.com>
References: <20200522033631.32574-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Alan Douglas <adouglas@cadence.com>

Implement ->set_msix() and ->get_msix() callback functions in order
to configure MSIX capability in the PCIe endpoint controller.

Add cdns_pcie_ep_send_msix_irq() to send MSIX interrupts to Host.
cdns_pcie_ep_send_msix_irq() gets the MSIX table address (virtual
address) from "struct cdns_pcie_epf" that gets initialized in
->set_bar() call back function.

Signed-off-by: Alan Douglas <adouglas@cadence.com>
[kishon@ti.com: Re-implement MSIX support in accordance with the
 re-designed core MSI-X interfaces]
Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 .../pci/controller/cadence/pcie-cadence-ep.c  | 108 +++++++++++++++++-
 drivers/pci/controller/cadence/pcie-cadence.h |  10 ++
 2 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 14021d760482..c5696274d81f 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -51,6 +51,7 @@ static int cdns_pcie_ep_set_bar(struct pci_epc *epc, u8 fn,
 				struct pci_epf_bar *epf_bar)
 {
 	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
+	struct cdns_pcie_epf *epf = &ep->epf[fn];
 	struct cdns_pcie *pcie = &ep->pcie;
 	dma_addr_t bar_phys = epf_bar->phys_addr;
 	enum pci_barno bar = epf_bar->barno;
@@ -111,6 +112,8 @@ static int cdns_pcie_ep_set_bar(struct pci_epc *epc, u8 fn,
 		CDNS_PCIE_LM_EP_FUNC_BAR_CFG_BAR_CTRL(b, ctrl));
 	cdns_pcie_writel(pcie, reg, cfg);
 
+	epf->epf_bar[bar] = epf_bar;
+
 	return 0;
 }
 
@@ -118,6 +121,7 @@ static void cdns_pcie_ep_clear_bar(struct pci_epc *epc, u8 fn,
 				   struct pci_epf_bar *epf_bar)
 {
 	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
+	struct cdns_pcie_epf *epf = &ep->epf[fn];
 	struct cdns_pcie *pcie = &ep->pcie;
 	enum pci_barno bar = epf_bar->barno;
 	u32 reg, cfg, b, ctrl;
@@ -139,6 +143,8 @@ static void cdns_pcie_ep_clear_bar(struct pci_epc *epc, u8 fn,
 
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_EP_FUNC_BAR_ADDR0(fn, bar), 0);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_EP_FUNC_BAR_ADDR1(fn, bar), 0);
+
+	epf->epf_bar[bar] = NULL;
 }
 
 static int cdns_pcie_ep_map_addr(struct pci_epc *epc, u8 fn, phys_addr_t addr,
@@ -224,6 +230,50 @@ static int cdns_pcie_ep_get_msi(struct pci_epc *epc, u8 fn)
 	return mme;
 }
 
+static int cdns_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
+{
+	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
+	struct cdns_pcie *pcie = &ep->pcie;
+	u32 cap = CDNS_PCIE_EP_FUNC_MSIX_CAP_OFFSET;
+	u32 val, reg;
+
+	reg = cap + PCI_MSIX_FLAGS;
+	val = cdns_pcie_ep_fn_readw(pcie, func_no, reg);
+	if (!(val & PCI_MSIX_FLAGS_ENABLE))
+		return -EINVAL;
+
+	val &= PCI_MSIX_FLAGS_QSIZE;
+
+	return val;
+}
+
+static int cdns_pcie_ep_set_msix(struct pci_epc *epc, u8 fn, u16 interrupts,
+				 enum pci_barno bir, u32 offset)
+{
+	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
+	struct cdns_pcie *pcie = &ep->pcie;
+	u32 cap = CDNS_PCIE_EP_FUNC_MSIX_CAP_OFFSET;
+	u32 val, reg;
+
+	reg = cap + PCI_MSIX_FLAGS;
+	val = cdns_pcie_ep_fn_readw(pcie, fn, reg);
+	val &= ~PCI_MSIX_FLAGS_QSIZE;
+	val |= interrupts;
+	cdns_pcie_ep_fn_writew(pcie, fn, reg, val);
+
+	/* Set MSIX BAR and offset */
+	reg = cap + PCI_MSIX_TABLE;
+	val = offset | bir;
+	cdns_pcie_ep_fn_writel(pcie, fn, reg, val);
+
+	/* Set PBA BAR and offset.  BAR must match MSIX BAR */
+	reg = cap + PCI_MSIX_PBA;
+	val = (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
+	cdns_pcie_ep_fn_writel(pcie, fn, reg, val);
+
+	return 0;
+}
+
 static void cdns_pcie_ep_assert_intx(struct cdns_pcie_ep *ep, u8 fn,
 				     u8 intx, bool is_asserted)
 {
@@ -330,6 +380,52 @@ static int cdns_pcie_ep_send_msi_irq(struct cdns_pcie_ep *ep, u8 fn,
 	return 0;
 }
 
+static int cdns_pcie_ep_send_msix_irq(struct cdns_pcie_ep *ep, u8 fn,
+				      u16 interrupt_num)
+{
+	u32 cap = CDNS_PCIE_EP_FUNC_MSIX_CAP_OFFSET;
+	u32 tbl_offset, msg_data, reg, vec_ctrl;
+	struct cdns_pcie *pcie = &ep->pcie;
+	struct pci_epf_msix_tbl *msix_tbl;
+	struct cdns_pcie_epf *epf;
+	u64 pci_addr_mask = 0xff;
+	u64 msg_addr;
+	u16 flags;
+	u8 bir;
+
+	/* Check whether the MSI-X feature has been enabled by the PCI host. */
+	flags = cdns_pcie_ep_fn_readw(pcie, fn, cap + PCI_MSIX_FLAGS);
+	if (!(flags & PCI_MSIX_FLAGS_ENABLE))
+		return -EINVAL;
+
+	reg = cap + PCI_MSIX_TABLE;
+	tbl_offset = cdns_pcie_ep_fn_readl(pcie, fn, reg);
+	bir = tbl_offset & PCI_MSIX_TABLE_BIR;
+	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
+
+	epf = &ep->epf[fn];
+	msix_tbl = epf->epf_bar[bir]->addr + tbl_offset;
+	msg_addr = msix_tbl[(interrupt_num - 1)].msg_addr;
+	msg_data = msix_tbl[(interrupt_num - 1)].msg_data;
+	vec_ctrl = msix_tbl[(interrupt_num - 1)].vector_ctrl;
+
+	/* Set the outbound region if needed. */
+	if (ep->irq_pci_addr != (msg_addr & ~pci_addr_mask) ||
+	    ep->irq_pci_fn != fn) {
+		/* First region was reserved for IRQ writes. */
+		cdns_pcie_set_outbound_region(pcie, fn, 0,
+					      false,
+					      ep->irq_phys_addr,
+					      msg_addr & ~pci_addr_mask,
+					      pci_addr_mask + 1);
+		ep->irq_pci_addr = (msg_addr & ~pci_addr_mask);
+		ep->irq_pci_fn = fn;
+	}
+	writel(msg_data, ep->irq_cpu_addr + (msg_addr & pci_addr_mask));
+
+	return 0;
+}
+
 static int cdns_pcie_ep_raise_irq(struct pci_epc *epc, u8 fn,
 				  enum pci_epc_irq_type type,
 				  u16 interrupt_num)
@@ -343,6 +439,9 @@ static int cdns_pcie_ep_raise_irq(struct pci_epc *epc, u8 fn,
 	case PCI_EPC_IRQ_MSI:
 		return cdns_pcie_ep_send_msi_irq(ep, fn, interrupt_num);
 
+	case PCI_EPC_IRQ_MSIX:
+		return cdns_pcie_ep_send_msix_irq(ep, fn, interrupt_num);
+
 	default:
 		break;
 	}
@@ -380,7 +479,7 @@ static int cdns_pcie_ep_start(struct pci_epc *epc)
 static const struct pci_epc_features cdns_pcie_epc_features = {
 	.linkup_notifier = false,
 	.msi_capable = true,
-	.msix_capable = false,
+	.msix_capable = true,
 };
 
 static const struct pci_epc_features*
@@ -397,6 +496,8 @@ static const struct pci_epc_ops cdns_pcie_epc_ops = {
 	.unmap_addr	= cdns_pcie_ep_unmap_addr,
 	.set_msi	= cdns_pcie_ep_set_msi,
 	.get_msi	= cdns_pcie_ep_get_msi,
+	.set_msix	= cdns_pcie_ep_set_msix,
+	.get_msix	= cdns_pcie_ep_get_msix,
 	.raise_irq	= cdns_pcie_ep_raise_irq,
 	.start		= cdns_pcie_ep_start,
 	.get_features	= cdns_pcie_ep_get_features,
@@ -455,6 +556,11 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
 	if (of_property_read_u8(np, "max-functions", &epc->max_functions) < 0)
 		epc->max_functions = 1;
 
+	ep->epf = devm_kcalloc(dev, epc->max_functions, sizeof(*ep->epf),
+			       GFP_KERNEL);
+	if (!ep->epf)
+		return -ENOMEM;
+
 	ret = pci_epc_mem_init(epc, pcie->mem_res->start,
 			       resource_size(pcie->mem_res));
 	if (ret < 0) {
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 3490723169c6..1bf7d4e09b8a 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -113,6 +113,7 @@
 #define CDNS_PCIE_EP_FUNC_BASE(fn)	(((fn) << 12) & GENMASK(19, 12))
 
 #define CDNS_PCIE_EP_FUNC_MSI_CAP_OFFSET	0x90
+#define CDNS_PCIE_EP_FUNC_MSIX_CAP_OFFSET	0xb0
 
 /*
  * Root Port Registers (PCI configuration space for the root port function)
@@ -302,6 +303,14 @@ struct cdns_pcie_rc {
 	bool			avail_ib_bar[CDNS_PCIE_RP_MAX_IB];
 };
 
+/**
+ * struct cdns_pcie_epf - Structure to hold info about endpoint function
+ * @epf_bar: reference to the pci_epf_bar for the six Base Address Registers
+ */
+struct cdns_pcie_epf {
+	struct pci_epf_bar *epf_bar[PCI_STD_NUM_BARS];
+};
+
 /**
  * struct cdns_pcie_ep - private data for this PCIe endpoint controller driver
  * @pcie: Cadence PCIe controller
@@ -329,6 +338,7 @@ struct cdns_pcie_ep {
 	u64			irq_pci_addr;
 	u8			irq_pci_fn;
 	u8			irq_pending;
+	struct cdns_pcie_epf	*epf;
 };
 
 
-- 
2.17.1

