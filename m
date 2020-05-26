Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8411DDE16
	for <lists+linux-omap@lfdr.de>; Fri, 22 May 2020 05:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgEVDhI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 23:37:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40760 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgEVDhH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 23:37:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04M3asHA037541;
        Thu, 21 May 2020 22:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590118614;
        bh=trx6Kkctm11H0eDVByyXNF39VDCbxETi0m05i4cIVpQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=V5PttCKJdbGM0TN5WWQ+rNZnJNmtEDnQnFcAitrUxdZLCQMP7kEzHehf8LwabkWaS
         3zHrvC+HhNHfOZIHJz/5MKBc3gV1OQMBoy5EWNAzc35bsSBO3JmIbeiX0d2ojYGUX/
         aF1rlMAPv69y5LaB4UVuTBHuDEc7JpeqS/MkOr5c=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04M3arTe026505
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 May 2020 22:36:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 22:36:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 22:36:53 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04M3aYc0062596;
        Thu, 21 May 2020 22:36:50 -0500
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
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v5 04/14] PCI: cadence: Add support to start link and verify link status
Date:   Fri, 22 May 2020 09:06:21 +0530
Message-ID: <20200522033631.32574-5-kishon@ti.com>
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

Add cdns_pcie_ops to start link and verify link status. The registers
to start link and to check link status is in Platform specific PCIe
wrapper. Add support for platform specific drivers to add callback
functions for the PCIe Cadence core to start link and verify link status.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/cadence/pcie-cadence-ep.c  |  8 ++++
 .../controller/cadence/pcie-cadence-host.c    | 28 ++++++++++++++
 drivers/pci/controller/cadence/pcie-cadence.h | 37 ++++++++++++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 1fdae37843ef..14021d760482 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -354,8 +354,10 @@ static int cdns_pcie_ep_start(struct pci_epc *epc)
 {
 	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
 	struct cdns_pcie *pcie = &ep->pcie;
+	struct device *dev = pcie->dev;
 	struct pci_epf *epf;
 	u32 cfg;
+	int ret;
 
 	/*
 	 * BIT(0) is hardwired to 1, hence function 0 is always enabled
@@ -366,6 +368,12 @@ static int cdns_pcie_ep_start(struct pci_epc *epc)
 		cfg |= BIT(epf->func_no);
 	cdns_pcie_writel(pcie, CDNS_PCIE_LM_EP_FUNC_CFG, cfg);
 
+	ret = cdns_pcie_start_link(pcie);
+	if (ret) {
+		dev_err(dev, "Failed to start link\n");
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 8e73a680b567..93a9414932a9 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -3,6 +3,7 @@
 // Cadence PCIe host controller driver.
 // Author: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
@@ -422,6 +423,23 @@ static int cdns_pcie_host_init(struct device *dev,
 	return err;
 }
 
+static int cdns_pcie_host_wait_for_link(struct cdns_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	int retries;
+
+	/* Check if the link is up or not */
+	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
+		if (cdns_pcie_link_up(pcie)) {
+			dev_info(dev, "Link up\n");
+			return 0;
+		}
+		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
+	}
+
+	return -ETIMEDOUT;
+}
+
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 {
 	struct device *dev = rc->pcie.dev;
@@ -470,6 +488,16 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 
 	pcie->mem_res = res;
 
+	ret = cdns_pcie_start_link(pcie);
+	if (ret) {
+		dev_err(dev, "Failed to start link\n");
+		return ret;
+	}
+
+	ret = cdns_pcie_host_wait_for_link(pcie);
+	if (ret)
+		dev_dbg(dev, "PCIe link never came up\n");
+
 	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
 		rc->avail_ib_bar[bar] = true;
 
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 737e9561092b..c013e629e9fa 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -10,6 +10,11 @@
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
 
+/* Parameters for the waiting for link up routine */
+#define LINK_WAIT_MAX_RETRIES	10
+#define LINK_WAIT_USLEEP_MIN	90000
+#define LINK_WAIT_USLEEP_MAX	100000
+
 /*
  * Local Management Registers
  */
@@ -245,12 +250,20 @@ enum cdns_pcie_msg_routing {
 	MSG_ROUTING_GATHER,
 };
 
+struct cdns_pcie_ops {
+	int	(*start_link)(struct cdns_pcie *pcie);
+	void	(*stop_link)(struct cdns_pcie *pcie);
+	bool	(*link_up)(struct cdns_pcie *pcie);
+};
+
 /**
  * struct cdns_pcie - private data for Cadence PCIe controller drivers
  * @reg_base: IO mapped register base
  * @mem_res: start/end offsets in the physical system memory to map PCI accesses
  * @is_rc: tell whether the PCIe controller mode is Root Complex or Endpoint.
  * @bus: In Root Complex mode, the bus number
+ * @ops: Platform specific ops to control various inputs from Cadence PCIe
+ *       wrapper
  */
 struct cdns_pcie {
 	void __iomem		*reg_base;
@@ -261,7 +274,7 @@ struct cdns_pcie {
 	int			phy_count;
 	struct phy		**phy;
 	struct device_link	**link;
-	const struct cdns_pcie_common_ops *ops;
+	const struct cdns_pcie_ops *ops;
 };
 
 /**
@@ -421,6 +434,28 @@ static inline u32 cdns_pcie_ep_fn_readl(struct cdns_pcie *pcie, u8 fn, u32 reg)
 	return readl(pcie->reg_base + CDNS_PCIE_EP_FUNC_BASE(fn) + reg);
 }
 
+static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
+{
+	if (pcie->ops->start_link)
+		return pcie->ops->start_link(pcie);
+
+	return 0;
+}
+
+static inline void cdns_pcie_stop_link(struct cdns_pcie *pcie)
+{
+	if (pcie->ops->stop_link)
+		pcie->ops->stop_link(pcie);
+}
+
+static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
+{
+	if (pcie->ops->link_up)
+		return pcie->ops->link_up(pcie);
+
+	return true;
+}
+
 #ifdef CONFIG_PCIE_CADENCE_HOST
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
 #else
-- 
2.17.1

