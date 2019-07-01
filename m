Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A644034841
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 15:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfFDNTA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 09:19:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55084 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbfFDNS7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 09:18:59 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x54DI4oQ028116;
        Tue, 4 Jun 2019 08:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559654284;
        bh=hKZXGYlFN1fONABLyDc+vJLlvFIrfsKSse6yqM2h9dA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mjI62sqN49gPl6cFJoxDVZjHIy1szKlLsYrpK+qUK7OsUlDcarolB+Y1l0glDzmkw
         rCcYm5koW4668+uWqe9Ruauc15dW3/xB4kVJrO0rwJ0KOTxrRTlWPPsqqv1K4gcAIw
         KkBadx9sQrcMDAkmjT1R1LMMePS9cWYIjYNLXewo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x54DI3Y0043183
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 08:18:03 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 08:18:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 08:18:03 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x54DGdGU098972;
        Tue, 4 Jun 2019 08:17:57 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Tom Joseph <tjoseph@cadence.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sekhar Nori <nsekhar@ti.com>
Subject: [RFC PATCH 14/30] PCI: endpoint: Use notification chain mechanism to notify EPC events to EPF
Date:   Tue, 4 Jun 2019 18:45:00 +0530
Message-ID: <20190604131516.13596-15-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604131516.13596-1-kishon@ti.com>
References: <20190604131516.13596-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use atomic_notifier_call_chain to notify EPC events like linkup to EPF
instead of using linkup ops in EPF driver. This is in preparation for
adding proper locking mechanism to EPF ops. This will also enable to
add more events (in addition to linkup) in the future.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 13 ++++++++---
 drivers/pci/endpoint/pci-epc-core.c           |  9 ++------
 drivers/pci/endpoint/pci-epf-core.c           | 22 +------------------
 include/linux/pci-epc.h                       |  8 +++++++
 include/linux/pci-epf.h                       |  6 ++---
 5 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 27806987e93b..6380641ccc7a 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -360,12 +360,16 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			   msecs_to_jiffies(1));
 }
 
-static void pci_epf_test_linkup(struct pci_epf *epf)
+static int pci_epf_test_notifier(struct notifier_block *nb, unsigned long val,
+				 void *data)
 {
+	struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
 
 	queue_delayed_work(kpcitest_workqueue, &epf_test->cmd_handler,
 			   msecs_to_jiffies(1));
+
+	return NOTIFY_OK;
 }
 
 static void pci_epf_test_unbind(struct pci_epf *epf)
@@ -541,8 +545,12 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 		}
 	}
 
-	if (!linkup_notifier)
+	if (linkup_notifier) {
+		epf->nb.notifier_call = pci_epf_test_notifier;
+		pci_epc_register_notifier(epc, &epf->nb);
+	} else {
 		queue_work(kpcitest_workqueue, &epf_test->cmd_handler.work);
+	}
 
 	return 0;
 }
@@ -575,7 +583,6 @@ static int pci_epf_test_probe(struct pci_epf *epf)
 static struct pci_epf_ops ops = {
 	.unbind	= pci_epf_test_unbind,
 	.bind	= pci_epf_test_bind,
-	.linkup = pci_epf_test_linkup,
 };
 
 static struct pci_epf_driver test_driver = {
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index e4712a0f249c..80831a874dbd 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -538,16 +538,10 @@ EXPORT_SYMBOL_GPL(pci_epc_remove_epf);
  */
 void pci_epc_linkup(struct pci_epc *epc)
 {
-	unsigned long flags;
-	struct pci_epf *epf;
-
 	if (!epc || IS_ERR(epc))
 		return;
 
-	spin_lock_irqsave(&epc->lock, flags);
-	list_for_each_entry(epf, &epc->pci_epf, list)
-		pci_epf_linkup(epf);
-	spin_unlock_irqrestore(&epc->lock, flags);
+	atomic_notifier_call_chain(&epc->notifier, 0, NULL);
 }
 EXPORT_SYMBOL_GPL(pci_epc_linkup);
 
@@ -611,6 +605,7 @@ __pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
 
 	spin_lock_init(&epc->lock);
 	INIT_LIST_HEAD(&epc->pci_epf);
+	ATOMIC_INIT_NOTIFIER_HEAD(&epc->notifier);
 
 	device_initialize(&epc->dev);
 	epc->dev.class = pci_epc_class;
diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
index fb1306de8f40..93f28c65ace0 100644
--- a/drivers/pci/endpoint/pci-epf-core.c
+++ b/drivers/pci/endpoint/pci-epf-core.c
@@ -20,26 +20,6 @@ static DEFINE_MUTEX(pci_epf_mutex);
 static struct bus_type pci_epf_bus_type;
 static const struct device_type pci_epf_type;
 
-/**
- * pci_epf_linkup() - Notify the function driver that EPC device has
- *		      established a connection with the Root Complex.
- * @epf: the EPF device bound to the EPC device which has established
- *	 the connection with the host
- *
- * Invoke to notify the function driver that EPC device has established
- * a connection with the Root Complex.
- */
-void pci_epf_linkup(struct pci_epf *epf)
-{
-	if (!epf->driver) {
-		dev_WARN(&epf->dev, "epf device not bound to driver\n");
-		return;
-	}
-
-	epf->driver->ops->linkup(epf);
-}
-EXPORT_SYMBOL_GPL(pci_epf_linkup);
-
 /**
  * pci_epf_unbind() - Notify the function driver that the binding between the
  *		      EPF device and EPC device has been lost
@@ -214,7 +194,7 @@ int __pci_epf_register_driver(struct pci_epf_driver *driver,
 	if (!driver->ops)
 		return -EINVAL;
 
-	if (!driver->ops->bind || !driver->ops->unbind || !driver->ops->linkup)
+	if (!driver->ops->bind || !driver->ops->unbind)
 		return -EINVAL;
 
 	driver->driver.bus = &pci_epf_bus_type;
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index f641badc2c61..834dfc00aa00 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -89,6 +89,7 @@ struct pci_epc_mem {
  * @max_functions: max number of functions that can be configured in this EPC
  * @group: configfs group representing the PCI EPC device
  * @lock: spinlock to protect pci_epc ops
+ * @notifier: used to notify EPF of any EPC events (like linkup)
  */
 struct pci_epc {
 	struct device			dev;
@@ -99,6 +100,7 @@ struct pci_epc {
 	struct config_group		*group;
 	/* spinlock to protect against concurrent access of EP controller */
 	spinlock_t			lock;
+	struct atomic_notifier_head	notifier;
 };
 
 /**
@@ -141,6 +143,12 @@ static inline void *epc_get_drvdata(struct pci_epc *epc)
 	return dev_get_drvdata(&epc->dev);
 }
 
+static inline int
+pci_epc_register_notifier(struct pci_epc *epc, struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&epc->notifier, nb);
+}
+
 struct pci_epc *
 __devm_pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
 		      struct module *owner);
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 2d6f07556682..4993f7f6439b 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -55,13 +55,10 @@ struct pci_epf_header {
  * @bind: ops to perform when a EPC device has been bound to EPF device
  * @unbind: ops to perform when a binding has been lost between a EPC device
  *	    and EPF device
- * @linkup: ops to perform when the EPC device has established a connection with
- *	    a host system
  */
 struct pci_epf_ops {
 	int	(*bind)(struct pci_epf *epf);
 	void	(*unbind)(struct pci_epf *epf);
-	void	(*linkup)(struct pci_epf *epf);
 };
 
 /**
@@ -112,6 +109,7 @@ struct pci_epf_bar {
  * @epc: the EPC device to which this EPF device is bound
  * @driver: the EPF driver to which this EPF device is bound
  * @list: to add pci_epf as a list of PCI endpoint functions to pci_epc
+ * @nb: notifier block to notify EPF of any EPC events (like linkup)
  */
 struct pci_epf {
 	struct device		dev;
@@ -125,6 +123,7 @@ struct pci_epf {
 	struct pci_epc		*epc;
 	struct pci_epf_driver	*driver;
 	struct list_head	list;
+	struct notifier_block   nb;
 };
 
 #define to_pci_epf(epf_dev) container_of((epf_dev), struct pci_epf, dev)
@@ -154,5 +153,4 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
 void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar);
 int pci_epf_bind(struct pci_epf *epf);
 void pci_epf_unbind(struct pci_epf *epf);
-void pci_epf_linkup(struct pci_epf *epf);
 #endif /* __LINUX_PCI_EPF_H */
-- 
2.17.1

