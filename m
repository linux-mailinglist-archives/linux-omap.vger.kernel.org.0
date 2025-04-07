Return-Path: <linux-omap+bounces-3545-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481CA7DB24
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 12:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62EDA189148E
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 10:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434982309A3;
	Mon,  7 Apr 2025 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="1m1DMdRj"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02702309A7;
	Mon,  7 Apr 2025 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021619; cv=none; b=ocS19kdBDz86Y/AnwtzFstG0El10FzFRgIX7cghoilqfmaRXCXYXdeKWH5U5jTQfhD7DC8fZuPdJ4/89c1A8rmf/zkc+Mm/XrtJOJhbDuxK7sp/ZFzmh7Wq0Qdbv/mSt+8TjducxqqVTwYL1cC1FQNuIRXT2UiTU/dWCNy1PeBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021619; c=relaxed/simple;
	bh=UNMt9W084CnehGQKWtoc/wgqdlvTTxNVBPH6pE7tkqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KU7idvWWYa2s/Cpey/aRItwxvlZJ0RExZgEL41ibIyTyneFQ5TMes4Mef5vai+0dMF02C0SjuxqvN/hz3Yvfzqq6Uaxh9t7l/zrwax7sURg5u1p/jC5slDNuTQEFNqQXKX4KkcyM05fYPaKFuk71x1du6yqpPkavp9fHU065RVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=1m1DMdRj; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HRo307acovL3XZ9KfOeY7CAn2UkOyNAuLr8nrdZuEmY=; b=1m1DMdRjG7lH4Lm9F4uEqD42KA
	XcYTrIPJ5XJ/NDGiudJMt/IdJHWg6Hdn0Sxn3lh0L10e5g2chvY82tVzIx5FjOpbh4SbneZ2I/7u4
	gM+VfO6nyGXuSxQgMG5JRYZSMKtMUwDfj6vwXy3HLVbOwhtbCYO0KA2bgGMAi7aWJl4/YC+KlKsCf
	jk95ZVs3HwtdOoDMs2arf2swHoA55itZjYFKNooOH02f2DoJu9S1iigKJv68PMCAynm8n2D5X2Ti3
	3Wt/bBGDXC9ExbEizL6GsS67usrJ1U9jlx74RvbmDJxyvt5QVW7BGmllKeQh2wuEdQGFMpv4IuftJ
	mTMKgw4Q==;
Received: from [122.175.9.182] (port=29724 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u1jgp-000000001VV-3sbq;
	Mon, 07 Apr 2025 15:56:52 +0530
From: Parvathi Pudi <parvathi@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	tony@atomide.com,
	richardcochran@gmail.com,
	glaroque@baylibre.com,
	schnelle@linux.ibm.com,
	m-karicheri2@ti.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	basharath@couthit.com,
	parvathi@couthit.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next v4 02/11] net: ti: prueth: Adds ICSSM Ethernet driver
Date: Mon,  7 Apr 2025 15:55:19 +0530
Message-Id: <20250407102528.1048589-3-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407102528.1048589-1-parvathi@couthit.com>
References: <20250407102528.1048589-1-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Roger Quadros <rogerq@ti.com>

Updates Kernel configuration to enable PRUETH driver and its dependencies
along with makefile changes to add the new PRUETH driver.

Changes includes init and deinit of ICSSM PRU Ethernet driver including
net dev registration and firmware loading for DUAL-MAC mode running on
PRU-ICSS2 instance.

Changes also includes link handling, PRU booting, default firmware loading
and PRU stopping using existing remoteproc driver APIs.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 drivers/net/ethernet/ti/Kconfig              |  12 +
 drivers/net/ethernet/ti/Makefile             |   3 +
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 525 +++++++++++++++++++
 drivers/net/ethernet/ti/icssm/icssm_prueth.h | 100 ++++
 4 files changed, 640 insertions(+)
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.h

diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
index a07c910c497a..ab20f22524cb 100644
--- a/drivers/net/ethernet/ti/Kconfig
+++ b/drivers/net/ethernet/ti/Kconfig
@@ -229,4 +229,16 @@ config TI_ICSS_IEP
 	  To compile this driver as a module, choose M here. The module
 	  will be called icss_iep.
 
+config TI_PRUETH
+	tristate "TI PRU Ethernet EMAC driver"
+	depends on PRU_REMOTEPROC
+	depends on NET_SWITCHDEV
+	select TI_ICSS_IEP
+	imply PTP_1588_CLOCK
+	help
+	  Some TI SoCs has Programmable Realtime Units (PRUs) cores which can
+	  support Single or Dual Ethernet ports with help of firmware code running
+	  on PRU cores. This driver supports remoteproc based communication to
+	  PRU firmware to expose ethernet interface to Linux.
+
 endif # NET_VENDOR_TI
diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
index cbcf44806924..93c0a4d0e33a 100644
--- a/drivers/net/ethernet/ti/Makefile
+++ b/drivers/net/ethernet/ti/Makefile
@@ -3,6 +3,9 @@
 # Makefile for the TI network device drivers.
 #
 
+obj-$(CONFIG_TI_PRUETH) += icssm-prueth.o
+icssm-prueth-y := icssm/icssm_prueth.o
+
 obj-$(CONFIG_TI_CPSW) += cpsw-common.o
 obj-$(CONFIG_TI_DAVINCI_EMAC) += cpsw-common.o
 obj-$(CONFIG_TI_CPSW_SWITCHDEV) += cpsw-common.o
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
new file mode 100644
index 000000000000..b982f148d928
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Texas Instruments ICSSM Ethernet Driver
+ *
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+#include <linux/etherdevice.h>
+#include <linux/genalloc.h>
+#include <linux/if_bridge.h>
+#include <linux/if_hsr.h>
+#include <linux/if_vlan.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/net_tstamp.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_mdio.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/phy.h>
+#include <linux/remoteproc/pruss.h>
+#include <linux/ptp_classify.h>
+#include <linux/regmap.h>
+#include <linux/remoteproc.h>
+#include <net/pkt_cls.h>
+
+#include "icssm_prueth.h"
+
+/* called back by PHY layer if there is change in link state of hw port*/
+static void icssm_emac_adjust_link(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct phy_device *phydev = emac->phydev;
+	bool new_state = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&emac->lock, flags);
+
+	if (phydev->link) {
+		/* check the mode of operation */
+		if (phydev->duplex != emac->duplex) {
+			new_state = true;
+			emac->duplex = phydev->duplex;
+		}
+		if (phydev->speed != emac->speed) {
+			new_state = true;
+			emac->speed = phydev->speed;
+		}
+		if (!emac->link) {
+			new_state = true;
+			emac->link = 1;
+		}
+	} else if (emac->link) {
+		new_state = true;
+		emac->link = 0;
+	}
+
+	if (new_state)
+		phy_print_status(phydev);
+
+	if (emac->link) {
+	       /* reactivate the transmit queue if it is stopped */
+		if (netif_running(ndev) && netif_queue_stopped(ndev))
+			netif_wake_queue(ndev);
+	} else {
+		if (!netif_queue_stopped(ndev))
+			netif_stop_queue(ndev);
+	}
+
+	spin_unlock_irqrestore(&emac->lock, flags);
+}
+
+static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
+				   struct net_device *ndev)
+{
+	const struct prueth_firmware *pru_firmwares;
+	struct prueth *prueth = emac->prueth;
+	const char *fw_name;
+	int ret;
+
+	pru_firmwares = &prueth->fw_data->fw_pru[emac->port_id - 1];
+	fw_name = pru_firmwares->fw_name[prueth->eth_type];
+	if (!fw_name) {
+		netdev_err(ndev, "eth_type %d not supported\n",
+			   prueth->eth_type);
+		return -ENODEV;
+	}
+
+	ret = rproc_set_firmware(emac->pru, fw_name);
+	if (ret) {
+		netdev_err(ndev, "failed to set PRU0 firmware %s: %d\n",
+			   fw_name, ret);
+		return ret;
+	}
+
+	ret = rproc_boot(emac->pru);
+	if (ret) {
+		netdev_err(ndev, "failed to boot PRU0: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * icssm_emac_ndo_open - EMAC device open
+ * @ndev: network adapter device
+ *
+ * Called when system wants to start the interface.
+ *
+ * Return: 0 for a successful open, or appropriate error code
+ */
+static int icssm_emac_ndo_open(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	int ret;
+
+	ret = icssm_emac_set_boot_pru(emac, ndev);
+	if (ret)
+		return ret;
+
+	/* start PHY */
+	phy_start(emac->phydev);
+
+	return 0;
+}
+
+/**
+ * icssm_emac_ndo_stop - EMAC device stop
+ * @ndev: network adapter device
+ *
+ * Called when system wants to stop or down the interface.
+ *
+ * Return: Always 0 (Success)
+ */
+static int icssm_emac_ndo_stop(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	/* stop PHY */
+	phy_stop(emac->phydev);
+
+	rproc_shutdown(emac->pru);
+
+	return 0;
+}
+
+static const struct net_device_ops emac_netdev_ops = {
+	.ndo_open = icssm_emac_ndo_open,
+	.ndo_stop = icssm_emac_ndo_stop,
+};
+
+/* get emac_port corresponding to eth_node name */
+static int icssm_prueth_node_port(struct device_node *eth_node)
+{
+	u32 port_id;
+	int ret;
+
+	ret = of_property_read_u32(eth_node, "reg", &port_id);
+	if (ret)
+		return ret;
+
+	if (port_id == 0)
+		return PRUETH_PORT_MII0;
+	else if (port_id == 1)
+		return PRUETH_PORT_MII1;
+	else
+		return PRUETH_PORT_INVALID;
+}
+
+/* get MAC instance corresponding to eth_node name */
+static int icssm_prueth_node_mac(struct device_node *eth_node)
+{
+	u32 port_id;
+	int ret;
+
+	ret = of_property_read_u32(eth_node, "reg", &port_id);
+	if (ret)
+		return ret;
+
+	if (port_id == 0)
+		return PRUETH_MAC0;
+	else if (port_id == 1)
+		return PRUETH_MAC1;
+	else
+		return PRUETH_MAC_INVALID;
+}
+
+static int icssm_prueth_netdev_init(struct prueth *prueth,
+				    struct device_node *eth_node)
+{
+	struct prueth_emac *emac;
+	struct net_device *ndev;
+	enum prueth_port port;
+	enum prueth_mac mac;
+	int ret;
+
+	port = icssm_prueth_node_port(eth_node);
+	if (port == PRUETH_PORT_INVALID)
+		return -EINVAL;
+
+	mac = icssm_prueth_node_mac(eth_node);
+	if (mac == PRUETH_MAC_INVALID)
+		return -EINVAL;
+
+	ndev = devm_alloc_etherdev(prueth->dev, sizeof(*emac));
+	if (!ndev)
+		return -ENOMEM;
+
+	SET_NETDEV_DEV(ndev, prueth->dev);
+	emac = netdev_priv(ndev);
+	prueth->emac[mac] = emac;
+	emac->prueth = prueth;
+	emac->ndev = ndev;
+	emac->port_id = port;
+
+	/* by default eth_type is EMAC */
+	switch (port) {
+	case PRUETH_PORT_MII0:
+		emac->pru = prueth->pru0;
+		break;
+	case PRUETH_PORT_MII1:
+		emac->pru = prueth->pru1;
+		break;
+	default:
+		return -EINVAL;
+	}
+	/* get mac address from DT and set private and netdev addr */
+	ret = of_get_ethdev_address(eth_node, ndev);
+	if (!is_valid_ether_addr(ndev->dev_addr)) {
+		eth_hw_addr_random(ndev);
+		dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
+			 port, ndev->dev_addr);
+	}
+	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
+
+	/* connect PHY */
+	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
+					      icssm_emac_adjust_link);
+	if (!emac->phydev) {
+		dev_dbg(prueth->dev, "PHY connection failed\n");
+		ret = -EPROBE_DEFER;
+		goto free;
+	}
+
+	/* remove unsupported modes */
+	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
+
+	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
+	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
+
+	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
+	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
+
+	ndev->netdev_ops = &emac_netdev_ops;
+
+	return 0;
+free:
+	emac->ndev = NULL;
+	prueth->emac[mac] = NULL;
+
+	return ret;
+}
+
+static void icssm_prueth_netdev_exit(struct prueth *prueth,
+				     struct device_node *eth_node)
+{
+	struct prueth_emac *emac;
+	enum prueth_mac mac;
+
+	mac = icssm_prueth_node_mac(eth_node);
+	if (mac == PRUETH_MAC_INVALID)
+		return;
+
+	emac = prueth->emac[mac];
+	if (!emac)
+		return;
+
+	phy_disconnect(emac->phydev);
+
+	prueth->emac[mac] = NULL;
+}
+
+static int icssm_prueth_probe(struct platform_device *pdev)
+{
+	struct device_node *eth0_node = NULL, *eth1_node = NULL;
+	struct device_node *eth_node, *eth_ports_node;
+	enum pruss_pru_id pruss_id0, pruss_id1;
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct prueth *prueth;
+	int i, ret;
+
+	np = dev->of_node;
+	if (!np)
+		return -ENODEV; /* we don't support non DT */
+
+	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
+	if (!prueth)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, prueth);
+	prueth->dev = dev;
+	prueth->fw_data = device_get_match_data(dev);
+
+	eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
+	if (!eth_ports_node)
+		return -ENOENT;
+
+	for_each_child_of_node(eth_ports_node, eth_node) {
+		u32 reg;
+
+		if (strcmp(eth_node->name, "ethernet-port"))
+			continue;
+		ret = of_property_read_u32(eth_node, "reg", &reg);
+		if (ret < 0) {
+			dev_err(dev, "%pOF error reading port_id %d\n",
+				eth_node, ret);
+		}
+
+		of_node_get(eth_node);
+
+		if (reg == 0) {
+			eth0_node = eth_node;
+			if (!of_device_is_available(eth0_node)) {
+				of_node_put(eth0_node);
+				eth0_node = NULL;
+			}
+		} else if (reg == 1) {
+			eth1_node = eth_node;
+			if (!of_device_is_available(eth1_node)) {
+				of_node_put(eth1_node);
+				eth1_node = NULL;
+			}
+		} else {
+			dev_err(dev, "port reg should be 0 or 1\n");
+		}
+	}
+
+	of_node_put(eth_ports_node);
+
+	/* At least one node must be present and available else we fail */
+	if (!eth0_node && !eth1_node) {
+		dev_err(dev, "neither port0 nor port1 node available\n");
+		return -ENODEV;
+	}
+
+	if (eth0_node == eth1_node) {
+		dev_err(dev, "port0 and port1 can't have same reg\n");
+		of_node_put(eth0_node);
+		return -ENODEV;
+	}
+
+	prueth->eth_node[PRUETH_MAC0] = eth0_node;
+	prueth->eth_node[PRUETH_MAC1] = eth1_node;
+
+	if (eth0_node) {
+		prueth->pru0 = pru_rproc_get(np, 0, &pruss_id0);
+		if (IS_ERR(prueth->pru0)) {
+			ret = PTR_ERR(prueth->pru0);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "unable to get PRU0: %d\n", ret);
+			goto put_pru;
+		}
+	}
+
+	if (eth1_node) {
+		prueth->pru1 = pru_rproc_get(np, 1, &pruss_id1);
+		if (IS_ERR(prueth->pru1)) {
+			ret = PTR_ERR(prueth->pru1);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "unable to get PRU1: %d\n", ret);
+			goto put_pru;
+		}
+	}
+
+	/* setup netdev interfaces */
+	if (eth0_node) {
+		ret = icssm_prueth_netdev_init(prueth, eth0_node);
+		if (ret) {
+			if (ret != -EPROBE_DEFER) {
+				dev_err(dev, "netdev init %s failed: %d\n",
+					eth0_node->name, ret);
+			}
+			goto put_pru;
+		}
+	}
+
+	if (eth1_node) {
+		ret = icssm_prueth_netdev_init(prueth, eth1_node);
+		if (ret) {
+			if (ret != -EPROBE_DEFER) {
+				dev_err(dev, "netdev init %s failed: %d\n",
+					eth1_node->name, ret);
+			}
+			goto netdev_exit;
+		}
+	}
+
+	/* register the network devices */
+	if (eth0_node) {
+		ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
+		if (ret) {
+			dev_err(dev, "can't register netdev for port MII0");
+			goto netdev_exit;
+		}
+
+		prueth->registered_netdevs[PRUETH_MAC0] =
+			prueth->emac[PRUETH_MAC0]->ndev;
+	}
+
+	if (eth1_node) {
+		ret = register_netdev(prueth->emac[PRUETH_MAC1]->ndev);
+		if (ret) {
+			dev_err(dev, "can't register netdev for port MII1");
+			goto netdev_unregister;
+		}
+
+		prueth->registered_netdevs[PRUETH_MAC1] =
+			prueth->emac[PRUETH_MAC1]->ndev;
+	}
+
+	if (eth1_node)
+		of_node_put(eth1_node);
+	if (eth0_node)
+		of_node_put(eth0_node);
+	return 0;
+
+netdev_unregister:
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		if (!prueth->registered_netdevs[i])
+			continue;
+		unregister_netdev(prueth->registered_netdevs[i]);
+	}
+
+netdev_exit:
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		eth_node = prueth->eth_node[i];
+		if (!eth_node)
+			continue;
+
+		icssm_prueth_netdev_exit(prueth, eth_node);
+	}
+
+put_pru:
+	if (eth1_node) {
+		if (prueth->pru1)
+			pru_rproc_put(prueth->pru1);
+		of_node_put(eth1_node);
+	}
+
+	if (eth0_node) {
+		if (prueth->pru0)
+			pru_rproc_put(prueth->pru0);
+		of_node_put(eth0_node);
+	}
+
+	return ret;
+}
+
+static void icssm_prueth_remove(struct platform_device *pdev)
+{
+	struct prueth *prueth = platform_get_drvdata(pdev);
+	struct device_node *eth_node;
+	int i;
+
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		if (!prueth->registered_netdevs[i])
+			continue;
+		unregister_netdev(prueth->registered_netdevs[i]);
+	}
+
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		eth_node = prueth->eth_node[i];
+		if (!eth_node)
+			continue;
+
+		icssm_prueth_netdev_exit(prueth, eth_node);
+		of_node_put(eth_node);
+	}
+
+	pruss_put(prueth->pruss);
+
+	if (prueth->eth_node[PRUETH_MAC0])
+		pru_rproc_put(prueth->pru0);
+	if (prueth->eth_node[PRUETH_MAC1])
+		pru_rproc_put(prueth->pru1);
+}
+
+/* AM57xx SoC-specific firmware data */
+static struct prueth_private_data am57xx_prueth_pdata = {
+	.fw_pru[PRUSS_PRU0] = {
+		.fw_name[PRUSS_ETHTYPE_EMAC] =
+			"ti-pruss/am57xx-pru0-prueth-fw.elf",
+	},
+	.fw_pru[PRUSS_PRU1] = {
+		.fw_name[PRUSS_ETHTYPE_EMAC] =
+			"ti-pruss/am57xx-pru1-prueth-fw.elf",
+	},
+};
+
+static const struct of_device_id prueth_dt_match[] = {
+	{ .compatible = "ti,am57-prueth", .data = &am57xx_prueth_pdata, },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, prueth_dt_match);
+
+static struct platform_driver prueth_driver = {
+	.probe = icssm_prueth_probe,
+	.remove = icssm_prueth_remove,
+	.driver = {
+		.name = "prueth",
+		.of_match_table = prueth_dt_match,
+	},
+};
+module_platform_driver(prueth_driver);
+
+MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
+MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
+MODULE_DESCRIPTION("PRUSS ICSSM Ethernet Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
new file mode 100644
index 000000000000..7f857edc6eb2
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Texas Instruments ICSSM Ethernet driver
+ *
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+#ifndef __NET_TI_PRUETH_H
+#define __NET_TI_PRUETH_H
+
+#include <linux/phy.h>
+#include <linux/types.h>
+#include <linux/pruss_driver.h>
+#include <linux/remoteproc/pruss.h>
+
+/* PRU Ethernet Type - Ethernet functionality (protocol
+ * implemented) provided by the PRU firmware being loaded.
+ */
+enum pruss_ethtype {
+	PRUSS_ETHTYPE_EMAC = 0,
+	PRUSS_ETHTYPE_HSR,
+	PRUSS_ETHTYPE_PRP,
+	PRUSS_ETHTYPE_SWITCH,
+	PRUSS_ETHTYPE_MAX,
+};
+
+/* In switch mode there are 3 real ports i.e. 3 mac addrs.
+ * however Linux sees only the host side port. The other 2 ports
+ * are the switch ports.
+ * In emac mode there are 2 real ports i.e. 2 mac addrs.
+ * Linux sees both the ports.
+ */
+enum prueth_port {
+	PRUETH_PORT_HOST = 0,	/* host side port */
+	PRUETH_PORT_MII0,	/* physical port MII 0 */
+	PRUETH_PORT_MII1,	/* physical port MII 1 */
+	PRUETH_PORT_INVALID,	/* Invalid prueth port */
+};
+
+enum prueth_mac {
+	PRUETH_MAC0 = 0,
+	PRUETH_MAC1,
+	PRUETH_NUM_MACS,
+	PRUETH_MAC_INVALID,
+};
+
+/**
+ * struct prueth_firmware - PRU Ethernet FW data
+ * @fw_name: firmware names of firmware to run on PRU
+ */
+struct prueth_firmware {
+	const char *fw_name[PRUSS_ETHTYPE_MAX];
+};
+
+/**
+ * struct prueth_private_data - PRU Ethernet private data
+ * @fw_pru: firmware names to be used for PRUSS ethernet usecases
+ * @support_lre: boolean to indicate if lre is enabled
+ * @support_switch: boolean to indicate if switch is enabled
+ */
+struct prueth_private_data {
+	const struct prueth_firmware fw_pru[PRUSS_NUM_PRUS];
+	bool support_lre;
+	bool support_switch;
+};
+
+/* data for each emac port */
+struct prueth_emac {
+	struct prueth *prueth;
+	struct net_device *ndev;
+
+	struct rproc *pru;
+	struct phy_device *phydev;
+
+	int link;
+	int speed;
+	int duplex;
+
+	enum prueth_port port_id;
+	const char *phy_id;
+	u8 mac_addr[6];
+	phy_interface_t phy_if;
+	spinlock_t lock;	/* serialize access */
+};
+
+struct prueth {
+	struct device *dev;
+	struct pruss *pruss;
+	struct rproc *pru0, *pru1;
+
+	const struct prueth_private_data *fw_data;
+	struct prueth_fw_offsets *fw_offsets;
+
+	struct device_node *eth_node[PRUETH_NUM_MACS];
+	struct prueth_emac *emac[PRUETH_NUM_MACS];
+	struct net_device *registered_netdevs[PRUETH_NUM_MACS];
+
+	unsigned int eth_type;
+};
+#endif /* __NET_TI_PRUETH_H */
-- 
2.34.1


