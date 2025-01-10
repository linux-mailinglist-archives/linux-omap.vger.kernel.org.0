Return-Path: <linux-omap+bounces-3071-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED2A0873A
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 07:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62C423A79A3
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 06:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F18B20767F;
	Fri, 10 Jan 2025 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="gKZXzVO1"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778DB2066CB;
	Fri, 10 Jan 2025 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488890; cv=none; b=o7JSZcOsuq2mUOsbLP8gW+v2mLCPTNJkssUjLGTbb5x04xyMdX9S/6WDxfg4lgrEincw/l1hjRSYJW7B5SGpZYzwhdBn1l6BcQiaVfunNi3pbTUhHXp76IsRv6l/APwv1zP3o1b29Pl5ObzBYETkBIWn4IC2kaP0FJZNolz/+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488890; c=relaxed/simple;
	bh=4lzrWxaPCMxchtIJ+sLmzRadQsv50KidBDONMUHUIiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dt9f8wmmkuUoVKbGSu1ZCwupaq9Cixo9oMRd3htivOf6/9u8V2WT3jyuAZPxhKNS39y87HKs++ezxK6c0uK9aDOsu4LN0xAPzIcrodQWhwpUDTi0C5FrfDM8oqLyPkh6o8I6s39g3VUv3IRMWLYhkeYkqo1SnzjeF+yfCEcIRII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=gKZXzVO1; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UGLRUFgumU5nJaLIDLolkBBTeLvspCMVxBm0+sz7Zcs=; b=gKZXzVO1eZK8dUMrazV49tRlhI
	pFNqmlpWDj2cIcfNVrB/72oLcBOEz31nLQuQz5TRYMQF/gg5cLn9Uxu7T6z+6LB8/Sr8b1LwdmrTn
	naXr/oArZ3S6q41fdUs12s9CSbsEXMpctxoITwm5QK83f1ifTmSs0Ajpq1aytsQpMN7HDML8hqTM9
	W8aOBp31dBQWaK/y3KdK5vi3E7Qp/x7NQ1lziq+jcWRkBcEaPD0A+UHwI+tDsAIoEafKr3T8SZIfv
	RX076gkKXnbD6O2f1j0Ngfle2Nr/e5b4h1C/axorlgOENY0xuhYg3PRXK4A366a2dM4IlcXJ8RbtI
	aVjJ8OYg==;
Received: from [122.175.9.182] (port=1293 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tW85B-0001E8-1r;
	Fri, 10 Jan 2025 11:31:21 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
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
	parvathi@couthit.com,
	basharath@couthit.com,
	schnelle@linux.ibm.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	m-karicheri2@ti.com,
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
Subject: [RFC PATCH 07/10] net: ti: prueth: Adds support for network filters for traffic control supported by PRU-ICSS
Date: Fri, 10 Jan 2025 11:29:03 +0530
Message-Id: <20250110055906.65086-8-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109105600.41297-1-basharath@couthit.com>
References: <20250109105600.41297-1-basharath@couthit.com>
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
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Roger Quadros <rogerq@ti.com>

Driver updates to enable/disable network filters and traffic control
features supported by the firmware running on PRU-ICSS.

Control of the following features are now supported:
1. Promiscuous mode
2. Network Storm prevention
3. Multicast filtering and
4. VLAN filtering

Firmware running on PRU-ICSS will go through all these filter checks
prior to sending the rx packets to the host.

Ethtool or dev ioctl can be used to enable/disable these features from
the user space.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
---
 drivers/net/ethernet/ti/Makefile              |   2 +-
 drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  39 +++
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 310 +++++++++++++++++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  49 ++-
 .../net/ethernet/ti/icssm/icssm_prueth_dos.c  | 225 +++++++++++++
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |   5 +
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   | 120 +++++++
 7 files changed, 747 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h

diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
index f21dd11118ab..852640ce2b15 100644
--- a/drivers/net/ethernet/ti/Makefile
+++ b/drivers/net/ethernet/ti/Makefile
@@ -4,7 +4,7 @@
 #
 
 obj-$(CONFIG_TI_PRUETH) += icssm-prueth.o
-icssm-prueth-y := icssm/icssm_prueth.o icssm/icssm_ethtool.o
+icssm-prueth-y := icssm/icssm_prueth.o icssm/icssm_ethtool.o icssm/icssm_prueth_dos.o
 
 obj-$(CONFIG_TI_CPSW) += cpsw-common.o
 obj-$(CONFIG_TI_DAVINCI_EMAC) += cpsw-common.o
diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
index 86d62d64dc4d..73c947342e81 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
@@ -7,6 +7,7 @@
 
 #include <linux/if_bridge.h>
 #include "icssm_prueth.h"
+#include "icssm_vlan_mcast_filter_mmap.h"
 #include "../icssg/icss_iep.h"
 
 #define PRUETH_MODULE_VERSION "0.2"
@@ -20,6 +21,11 @@ void icssm_emac_set_stats(struct prueth_emac *emac,
 
 	dram = emac->prueth->mem[emac->dram].va;
 	memcpy_toio(dram + STATISTICS_OFFSET, pstats, STAT_SIZE);
+
+	writel(pstats->vlan_dropped, dram +
+			ICSS_EMAC_FW_VLAN_FILTER_DROP_CNT_OFFSET);
+	writel(pstats->multicast_dropped, dram +
+			ICSS_EMAC_FW_MULTICAST_FILTER_DROP_CNT_OFFSET);
 }
 
 /* get statistics maintained by the PRU firmware into @pstats */
@@ -30,6 +36,11 @@ void icssm_emac_get_stats(struct prueth_emac *emac,
 
 	dram = emac->prueth->mem[emac->dram].va;
 	memcpy_fromio(pstats, dram + STATISTICS_OFFSET, STAT_SIZE);
+
+	pstats->vlan_dropped =
+		readl(dram + ICSS_EMAC_FW_VLAN_FILTER_DROP_CNT_OFFSET);
+	pstats->multicast_dropped =
+		readl(dram + ICSS_EMAC_FW_MULTICAST_FILTER_DROP_CNT_OFFSET);
 }
 
 /**
@@ -181,13 +192,40 @@ static void icssm_emac_get_ethtool_stats(struct net_device *ndev,
 	}
 }
 
+static int icssm_emac_get_regs_len(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth *prueth = emac->prueth;
+
+	/* VLAN Table at the end of the memory map, after MultiCast
+	 * filter region. So VLAN table base +
+	 * size will give the entire size of reg dump in case of
+	 * Dual-EMAC firmware.
+	 */
+	if (PRUETH_IS_EMAC(prueth)) {
+		return ICSS_EMAC_FW_VLAN_FLTR_TBL_BASE_ADDR +
+		       ICSS_EMAC_FW_VLAN_FILTER_TABLE_SIZE_BYTES;
+	}
+
+	return 0;
+}
+
 static void icssm_emac_get_regs(struct net_device *ndev,
 				struct ethtool_regs *regs, void *p)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
+	void __iomem *ram;
+	u8 *reg = p;
 
 	regs->version = PRUETH_REG_DUMP_GET_VER(prueth);
+
+	/* Dump firmware's VLAN and MC tables */
+	if (PRUETH_IS_EMAC(prueth)) {
+		ram = prueth->mem[emac->dram].va;
+		memcpy_fromio(reg, ram, icssm_emac_get_regs_len(ndev));
+		return;
+	}
 }
 
 static int icssm_emac_get_ts_info(struct net_device *ndev,
@@ -225,5 +263,6 @@ const struct ethtool_ops emac_ethtool_ops = {
 	.get_strings = icssm_emac_get_strings,
 	.get_ethtool_stats = icssm_emac_get_ethtool_stats,
 	.get_regs = icssm_emac_get_regs,
+	.get_regs_len = icssm_emac_get_regs_len,
 };
 EXPORT_SYMBOL_GPL(emac_ethtool_ops);
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index b7b0181ffcb6..57fc887e4317 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -29,6 +29,7 @@
 #include <net/pkt_cls.h>
 
 #include "icssm_prueth.h"
+#include "icssm_vlan_mcast_filter_mmap.h"
 #include "../icssg/icssg_mii_rt.h"
 #include "../icssg/icss_iep.h"
 
@@ -38,6 +39,26 @@
 #define TX_CLK_DELAY_100M	0x6
 #define TX_CLK_DELAY_10M	0
 
+static struct prueth_fw_offsets fw_offsets_v2_1;
+
+static void icssm_prueth_set_fw_offsets(struct prueth *prueth)
+{
+	/* Set VLAN/Multicast filter control and table offsets */
+	if (PRUETH_IS_EMAC(prueth)) {
+		prueth->fw_offsets->vlan_ctrl_byte  =
+			ICSS_EMAC_FW_VLAN_FILTER_CTRL_BITMAP_OFFSET;
+		prueth->fw_offsets->vlan_filter_tbl =
+			ICSS_EMAC_FW_VLAN_FLTR_TBL_BASE_ADDR;
+
+		prueth->fw_offsets->mc_ctrl_byte  =
+			ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET;
+		prueth->fw_offsets->mc_filter_mask =
+			ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OFFSET;
+		prueth->fw_offsets->mc_filter_tbl =
+			ICSS_EMAC_FW_MULTICAST_FILTER_TABLE;
+	}
+}
+
 static inline void icssm_prueth_write_reg(struct prueth *prueth,
 					  enum prueth_mem region,
 					  unsigned int reg, u32 val)
@@ -337,18 +358,25 @@ static void icssm_prueth_hostinit(struct prueth *prueth)
  */
 static void icssm_prueth_init_ethernet_mode(struct prueth *prueth)
 {
+	icssm_prueth_set_fw_offsets(prueth);
 	icssm_prueth_hostinit(prueth);
 }
 
 static void icssm_prueth_port_enable(struct prueth_emac *emac, bool enable)
 {
 	struct prueth *prueth = emac->prueth;
-	void __iomem *port_ctrl;
+	void __iomem *port_ctrl, *vlan_ctrl;
+	u32 vlan_ctrl_offset;
 	void __iomem *ram;
 
+	vlan_ctrl_offset = prueth->fw_offsets->vlan_ctrl_byte;
+
 	ram = prueth->mem[emac->dram].va;
 	port_ctrl = ram + PORT_CONTROL_ADDR;
 	writeb(!!enable, port_ctrl);
+
+	vlan_ctrl = ram + vlan_ctrl_offset;
+	writeb(!!enable, vlan_ctrl);
 }
 
 static int icssm_prueth_emac_config(struct prueth_emac *emac)
@@ -1408,6 +1436,174 @@ static struct net_device_stats
 	return stats;
 }
 
+/* enable/disable MC filter */
+static void icssm_emac_mc_filter_ctrl(struct prueth_emac *emac, bool enable)
+{
+	struct prueth *prueth = emac->prueth;
+	void __iomem *mc_filter_ctrl;
+	void __iomem *ram;
+	u32 mc_ctrl_byte;
+	u32 reg;
+
+	ram = prueth->mem[emac->dram].va;
+	mc_ctrl_byte = prueth->fw_offsets->mc_ctrl_byte;
+	mc_filter_ctrl = ram + mc_ctrl_byte;
+
+	if (enable)
+		reg = ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_ENABLED;
+	else
+		reg = ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_DISABLED;
+
+	writeb(reg, mc_filter_ctrl);
+}
+
+/* reset MC filter bins */
+static void icssm_emac_mc_filter_reset(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+	void __iomem *mc_filter_tbl;
+	u32 mc_filter_tbl_base;
+	void __iomem *ram;
+
+	ram = prueth->mem[emac->dram].va;
+	mc_filter_tbl_base = prueth->fw_offsets->mc_filter_tbl;
+
+	mc_filter_tbl = ram + mc_filter_tbl_base;
+	memset_io(mc_filter_tbl, 0, ICSS_EMAC_FW_MULTICAST_TABLE_SIZE_BYTES);
+}
+
+/* set MC filter hashmask */
+static void icssm_emac_mc_filter_hashmask
+		(struct prueth_emac *emac,
+		 u8 mask[ICSS_EMAC_FW_MULTICAST_FILTER_MASK_SIZE_BYTES])
+{
+	struct prueth *prueth = emac->prueth;
+	void __iomem *mc_filter_mask;
+	u32 mc_filter_mask_base;
+	void __iomem *ram;
+
+	ram = prueth->mem[emac->dram].va;
+	mc_filter_mask_base = prueth->fw_offsets->mc_filter_mask;
+
+	mc_filter_mask = ram + mc_filter_mask_base;
+	memcpy_toio(mc_filter_mask, mask,
+		    ICSS_EMAC_FW_MULTICAST_FILTER_MASK_SIZE_BYTES);
+}
+
+static void icssm_emac_mc_filter_bin_update(struct prueth_emac *emac, u8 hash,
+					    u8 val)
+{
+	struct prueth *prueth = emac->prueth;
+	void __iomem *mc_filter_tbl;
+	u32 mc_filter_tbl_base;
+	void __iomem *ram;
+
+	ram = prueth->mem[emac->dram].va;
+	mc_filter_tbl_base = prueth->fw_offsets->mc_filter_tbl;
+
+	mc_filter_tbl = ram + mc_filter_tbl_base;
+	writeb(val, mc_filter_tbl + hash);
+}
+
+void icssm_emac_mc_filter_bin_allow(struct prueth_emac *emac, u8 hash)
+{
+	icssm_emac_mc_filter_bin_update
+		(emac, hash,
+		 ICSS_EMAC_FW_MULTICAST_FILTER_HOST_RCV_ALLOWED);
+}
+
+void icssm_emac_mc_filter_bin_disallow(struct prueth_emac *emac, u8 hash)
+{
+	icssm_emac_mc_filter_bin_update
+		(emac, hash,
+		 ICSS_EMAC_FW_MULTICAST_FILTER_HOST_RCV_NOT_ALLOWED);
+}
+
+u8 icssm_emac_get_mc_hash(u8 *mac, u8 *mask)
+{
+	u8 hash;
+	int j;
+
+	for (j = 0, hash = 0; j < ETH_ALEN; j++)
+		hash ^= (mac[j] & mask[j]);
+
+	return hash;
+}
+
+/**
+ * icssm_emac_ndo_set_rx_mode - EMAC set receive mode function
+ * @ndev: The EMAC network adapter
+ *
+ * Called when system wants to set the receive mode of the device.
+ *
+ */
+static void icssm_emac_ndo_set_rx_mode(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	bool promisc = ndev->flags & IFF_PROMISC;
+	struct netdev_hw_addr *ha;
+	struct prueth *prueth;
+	unsigned long flags;
+	void __iomem *sram;
+	u32 mask, reg;
+	u8 hash;
+
+	prueth = emac->prueth;
+	sram = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+	reg = readl(sram + EMAC_PROMISCUOUS_MODE_OFFSET);
+
+	/* for LRE, it is a shared table. So lock the access */
+	spin_lock_irqsave(&emac->addr_lock, flags);
+
+	/* Disable and reset multicast filter, allows allmulti */
+	icssm_emac_mc_filter_ctrl(emac, false);
+	icssm_emac_mc_filter_reset(emac);
+	icssm_emac_mc_filter_hashmask(emac, emac->mc_filter_mask);
+
+	if (PRUETH_IS_EMAC(prueth)) {
+		switch (emac->port_id) {
+		case PRUETH_PORT_MII0:
+			mask = EMAC_P1_PROMISCUOUS_BIT;
+			break;
+		case PRUETH_PORT_MII1:
+			mask = EMAC_P2_PROMISCUOUS_BIT;
+			break;
+		default:
+			netdev_err(ndev, "%s: invalid port\n", __func__);
+			goto unlock;
+		}
+
+		if (promisc) {
+			/* Enable promiscuous mode */
+			reg |= mask;
+		} else {
+			/* Disable promiscuous mode */
+			reg &= ~mask;
+		}
+
+		writel(reg, sram + EMAC_PROMISCUOUS_MODE_OFFSET);
+
+		if (promisc)
+			goto unlock;
+	}
+
+	if (ndev->flags & IFF_ALLMULTI && !PRUETH_IS_SWITCH(prueth))
+		goto unlock;
+
+	icssm_emac_mc_filter_ctrl(emac, true);	/* all multicast blocked */
+
+	if (netdev_mc_empty(ndev))
+		goto unlock;
+
+	netdev_for_each_mc_addr(ha, ndev) {
+		hash = icssm_emac_get_mc_hash(ha->addr, emac->mc_filter_mask);
+		icssm_emac_mc_filter_bin_allow(emac, hash);
+	}
+
+unlock:
+	spin_unlock_irqrestore(&emac->addr_lock, flags);
+}
+
 static int icssm_emac_hwtstamp_config_set(struct net_device *ndev,
 					  struct ifreq *ifr)
 {
@@ -1481,13 +1677,115 @@ static int icssm_emac_ndo_ioctl(struct net_device *ndev, struct ifreq *ifr,
 	return phy_do_ioctl(ndev, ifr, cmd);
 }
 
+int icssm_emac_add_del_vid(struct prueth_emac *emac,
+			   bool add, __be16 proto, u16 vid)
+{
+	struct prueth *prueth = emac->prueth;
+	u32 vlan_filter_tbl;
+	unsigned long flags;
+	void __iomem *ram;
+	u8 bit_index, val;
+	u16 byte_index;
+
+	vlan_filter_tbl = prueth->fw_offsets->vlan_filter_tbl;
+	ram = prueth->mem[emac->dram].va;
+
+	if (proto != htons(ETH_P_8021Q))
+		return -EINVAL;
+
+	if (vid >= ICSS_EMAC_FW_VLAN_FILTER_VID_MAX)
+		return -EINVAL;
+
+	/* By default, VLAN ID 0 (priority tagged packets) is routed to
+	 * host, so nothing to be done if vid = 0
+	 */
+	if (!vid)
+		return 0;
+
+	/* for LRE, it is a shared table. So lock the access */
+	spin_lock_irqsave(&emac->addr_lock, flags);
+
+	/* VLAN filter table is 512 bytes (4096 bit) bitmap.
+	 * Each bit controls enabling or disabling corresponding
+	 * VID. Therefore byte index that controls a given VID is
+	 * can calculated as vid / 8 and the bit within that byte
+	 * that controls VID is given by vid % 8. Allow untagged
+	 * frames to host by default.
+	 */
+	byte_index = vid / BITS_PER_BYTE;
+	bit_index = vid % BITS_PER_BYTE;
+	val = readb(ram + vlan_filter_tbl + byte_index);
+	if (add)
+		val |= BIT(bit_index);
+	else
+		val &= ~BIT(bit_index);
+	writeb(val, ram + vlan_filter_tbl + byte_index);
+
+	spin_unlock_irqrestore(&emac->addr_lock, flags);
+
+	netdev_dbg(emac->ndev, "%s VID bit at index %d and bit %d\n",
+		   add ? "Setting" : "Clearing", byte_index, bit_index);
+
+	return 0;
+}
+
+static int icssm_emac_ndo_vlan_rx_add_vid(struct net_device *dev,
+					  __be16 proto, u16 vid)
+{
+	struct prueth_emac *emac = netdev_priv(dev);
+
+	return icssm_emac_add_del_vid(emac, true, proto, vid);
+}
+
+static int icssm_emac_ndo_vlan_rx_kill_vid(struct net_device *dev,
+					   __be16 proto, u16 vid)
+{
+	struct prueth_emac *emac = netdev_priv(dev);
+
+	return icssm_emac_add_del_vid(emac, false, proto, vid);
+}
+
+static int icssm_emac_get_port_parent_id(struct net_device *dev,
+					 struct netdev_phys_item_id *ppid)
+{
+	struct prueth_emac *emac = netdev_priv(dev);
+	struct prueth *prueth = emac->prueth;
+
+	ppid->id_len = sizeof(prueth->base_mac);
+	memcpy(&ppid->id, &prueth->base_mac, ppid->id_len);
+
+	return 0;
+}
+
+static int icssm_emac_ndo_get_phys_port_name(struct net_device *ndev,
+					     char *name, size_t len)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	int err;
+
+	err = snprintf(name, len, "p%d", emac->port_id);
+
+	if (err >= len)
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct net_device_ops emac_netdev_ops = {
 	.ndo_open = icssm_emac_ndo_open,
 	.ndo_stop = icssm_emac_ndo_stop,
 	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
+	.ndo_set_mac_address = eth_mac_addr,
+	.ndo_validate_addr = eth_validate_addr,
 	.ndo_tx_timeout = icssm_emac_ndo_tx_timeout,
 	.ndo_get_stats = icssm_emac_ndo_get_stats,
+	.ndo_set_rx_mode = icssm_emac_ndo_set_rx_mode,
 	.ndo_eth_ioctl = icssm_emac_ndo_ioctl,
+	.ndo_vlan_rx_add_vid = icssm_emac_ndo_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid = icssm_emac_ndo_vlan_rx_kill_vid,
+	.ndo_setup_tc = icssm_emac_ndo_setup_tc,
+	.ndo_get_port_parent_id = icssm_emac_get_port_parent_id,
+	.ndo_get_phys_port_name = icssm_emac_ndo_get_phys_port_name,
 };
 
 /* get emac_port corresponding to eth_node name */
@@ -1553,6 +1851,7 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 	emac->prueth = prueth;
 	emac->ndev = ndev;
 	emac->port_id = port;
+	memset(&emac->mc_filter_mask[0], 0xff, ETH_ALEN); /* default mask */
 
 	/* by default eth_type is EMAC */
 	switch (port) {
@@ -1599,7 +1898,9 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 		dev_err(prueth->dev, "could not get ptp tx irq. Skipping PTP support\n");
 	}
 
+	spin_lock_init(&emac->lock);
 	spin_lock_init(&emac->ptp_skb_lock);
+	spin_lock_init(&emac->addr_lock);
 
 	/* get mac address from DT and set private and netdev addr */
 	ret = of_get_ethdev_address(eth_node, ndev);
@@ -1646,6 +1947,10 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
 	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
 
+	ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_TC;
+
+	ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	ndev->netdev_ops = &emac_netdev_ops;
 	ndev->ethtool_ops = &emac_ethtool_ops;
 
@@ -1699,6 +2004,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, prueth);
 	prueth->dev = dev;
 	prueth->fw_data = device_get_match_data(dev);
+	prueth->fw_offsets = &fw_offsets_v2_1;
 
 	eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
 	if (!eth_ports_node)
@@ -1894,6 +2200,8 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 			prueth->emac[PRUETH_MAC1]->ndev;
 	}
 
+	eth_random_addr(prueth->base_mac);
+
 	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
 		 (!eth0_node || !eth1_node) ? "single" : "dual");
 
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
index 9ff70cbf5963..6d16f249efa1 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
@@ -24,6 +24,9 @@
  */
 #define EMAC_MAX_FRM_SUPPORT (ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN + 6)
 
+/* default timer for NSP and HSR/PRP */
+#define PRUETH_NSP_TIMER_MS	(100) /* Refresh NSP counters every 100ms */
+
 #define PRUETH_REG_DUMP_VER		1
 
 /* Encoding: 32-16: Reserved, 16-8: Reg dump version, 8-0: Ethertype  */
@@ -289,6 +292,29 @@ enum prueth_mem {
 	PRUETH_MEM_MAX,
 };
 
+/* Firmware offsets/size information */
+struct prueth_fw_offsets {
+	u32 index_array_offset;
+	u32 bin_array_offset;
+	u32 nt_array_offset;
+	u32 index_array_loc;
+	u32 bin_array_loc;
+	u32 nt_array_loc;
+	u32 index_array_max_entries;
+	u32 bin_array_max_entries;
+	u32 nt_array_max_entries;
+	u32 vlan_ctrl_byte;
+	u32 vlan_filter_tbl;
+	u32 mc_ctrl_byte;
+	u32 mc_filter_mask;
+	u32 mc_filter_tbl;
+	/* IEP wrap is used in the rx packet ordering logic and
+	 * is different for ICSSM v1.0 vs 2.1
+	 */
+	u32 iep_wrap;
+	u16 hash_mask;
+};
+
 /**
  * struct prueth_private_data - PRU Ethernet private data
  * @fw_pru: firmware names to be used for PRUSS ethernet usecases
@@ -301,6 +327,11 @@ struct prueth_private_data {
 	bool support_switch;
 };
 
+struct nsp_counter {
+	unsigned long cookie;
+	u16 credit;
+};
+
 /* data for each emac port */
 struct prueth_emac {
 	struct prueth *prueth;
@@ -326,8 +357,16 @@ struct prueth_emac {
 	const char *phy_id;
 	u32 msg_enable;
 	u8 mac_addr[6];
+	unsigned char mc_filter_mask[ETH_ALEN];	/* for multicast filtering */
 	phy_interface_t phy_if;
+
 	spinlock_t lock;	/* serialize access */
+	spinlock_t addr_lock;	/* serialize access to VLAN/MC filter table */
+
+	struct nsp_counter nsp_bc;
+	struct nsp_counter nsp_mc;
+	struct nsp_counter nsp_uc;
+	bool nsp_enabled;
 
 	struct sk_buff *ptp_skb[PRUETH_PTP_TS_EVENTS];
 	spinlock_t ptp_skb_lock;	/* serialize access */
@@ -354,19 +393,27 @@ struct prueth {
 
 	unsigned int eth_type;
 	u8 emac_configured;
+	u8 base_mac[ETH_ALEN];
 };
 
 extern const struct ethtool_ops emac_ethtool_ops;
 
+int icssm_emac_ndo_setup_tc(struct net_device *dev, enum tc_setup_type type,
+			    void *type_data);
 void icssm_parse_packet_info(struct prueth *prueth, u32 buffer_descriptor,
 			     struct prueth_packet_info *pkt_info);
 int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
 			 struct prueth_packet_info *pkt_info,
 			 const struct prueth_queue_info *rxqueue);
-
+int icssm_emac_add_del_vid(struct prueth_emac *emac,
+			   bool add, __be16 proto, u16 vid);
 irqreturn_t icssm_prueth_ptp_tx_irq_handle(int irq, void *dev);
 irqreturn_t icssm_prueth_ptp_tx_irq_work(int irq, void *dev);
 
+void icssm_emac_mc_filter_bin_allow(struct prueth_emac *emac, u8 hash);
+void icssm_emac_mc_filter_bin_disallow(struct prueth_emac *emac, u8 hash);
+u8 icssm_emac_get_mc_hash(u8 *mac, u8 *mask);
+
 void icssm_emac_set_stats(struct prueth_emac *emac,
 			  struct port_statistics *pstats);
 void icssm_emac_get_stats(struct prueth_emac *emac,
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c
new file mode 100644
index 000000000000..8382bd8cab7c
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2020-2021 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/kernel.h>
+#include <linux/remoteproc/pruss.h>
+#include <linux/regmap.h>
+#include <linux/remoteproc.h>
+#include <net/pkt_cls.h>
+
+#include "../icssg/icssg_mii_rt.h"
+#include "icssm_vlan_mcast_filter_mmap.h"
+#include "icssm_prueth.h"
+
+static void icssm_emac_nsp_enable(void __iomem *counter, u16 credit)
+{
+	writel((credit << PRUETH_NSP_CREDIT_SHIFT) | PRUETH_NSP_ENABLE,
+	       counter);
+}
+
+/**
+ * icssm_prueth_enable_nsp - enable nsp
+ *
+ * @emac: EMAC data structure
+ *
+ */
+static void icssm_prueth_enable_nsp(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+	void __iomem *dram;
+
+	dram = prueth->mem[emac->dram].va;
+
+	if (emac->nsp_bc.cookie)
+		icssm_emac_nsp_enable(dram + STORM_PREVENTION_OFFSET_BC,
+				      emac->nsp_bc.credit);
+	if (emac->nsp_mc.cookie)
+		icssm_emac_nsp_enable(dram + STORM_PREVENTION_OFFSET_MC,
+				      emac->nsp_mc.credit);
+	if (emac->nsp_uc.cookie)
+		icssm_emac_nsp_enable(dram + STORM_PREVENTION_OFFSET_UC,
+				      emac->nsp_uc.credit);
+}
+
+static int icssm_emac_flower_parse_policer(struct prueth_emac *emac,
+					   struct netlink_ext_ack *extack,
+					   struct flow_cls_offload *cls,
+					   u64 rate_bytes_per_sec)
+{
+	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
+	struct flow_dissector *dissector = rule->match.dissector;
+	u8 null_mac[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	u8 bc_mac[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+	u8 mc_mac[] = {0x01, 0x00, 0x00, 0x00, 0x00, 0x00};
+	struct flow_match_eth_addrs match;
+	struct nsp_counter *nsp = NULL;
+	char *str;
+	u32 pps;
+
+	if (dissector->used_keys &
+	    ~(BIT(FLOW_DISSECTOR_KEY_BASIC) |
+	      BIT(FLOW_DISSECTOR_KEY_CONTROL) |
+	      BIT(FLOW_DISSECTOR_KEY_ETH_ADDRS))) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Unsupported keys used");
+		return -EOPNOTSUPP;
+	}
+
+	if (!flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ETH_ADDRS)) {
+		NL_SET_ERR_MSG_MOD(extack, "Not matching on eth address");
+		return -EOPNOTSUPP;
+	}
+
+	flow_rule_match_eth_addrs(rule, &match);
+
+	if (!ether_addr_equal_masked(match.key->src, null_mac,
+				     match.mask->src)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Matching on source MAC not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (ether_addr_equal(match.key->dst, bc_mac)) {
+		if (!emac->nsp_bc.cookie ||
+		    emac->nsp_bc.cookie == cls->cookie)
+			nsp = &emac->nsp_bc;
+		else
+			NL_SET_ERR_MSG_MOD(extack, "BC Filter already set");
+		str = "Broad";
+	} else if (ether_addr_equal_masked(match.key->dst, mc_mac, mc_mac)) {
+		if (!emac->nsp_mc.cookie ||
+		    emac->nsp_mc.cookie == cls->cookie)
+			nsp = &emac->nsp_mc;
+		else
+			NL_SET_ERR_MSG_MOD(extack, "MC Filter already set");
+		str = "Multi";
+	} else {
+		if (!emac->nsp_uc.cookie ||
+		    emac->nsp_uc.cookie == cls->cookie)
+			nsp = &emac->nsp_uc;
+		else
+			NL_SET_ERR_MSG_MOD(extack, "UC Filter already set");
+		str = "Uni";
+	}
+
+	if (!nsp)
+		return -EOPNOTSUPP;
+
+	/* Calculate number of packets per second for given bps
+	 * assuming min ethernet packet size
+	 */
+	pps = div_u64(rate_bytes_per_sec, ETH_ZLEN);
+	/* Convert that to packets per 100ms */
+	pps /= MSEC_PER_SEC / PRUETH_NSP_TIMER_MS;
+
+	nsp->cookie = cls->cookie;
+	nsp->credit = pps;
+	emac->nsp_enabled = emac->nsp_bc.cookie | emac->nsp_mc.cookie |
+			    emac->nsp_uc.cookie;
+
+	icssm_prueth_enable_nsp(emac);
+
+	netdev_dbg(emac->ndev,
+		   "%scast filter set to %d packets per %dms\n", str,
+		   nsp->credit, PRUETH_NSP_TIMER_MS);
+
+	return 0;
+}
+
+static int icssm_emac_configure_clsflower(struct prueth_emac *emac,
+					  struct flow_cls_offload *cls)
+{
+	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
+	struct netlink_ext_ack *extack = cls->common.extack;
+	const struct flow_action_entry *act;
+	int i;
+
+	flow_action_for_each(i, act, &rule->action) {
+		switch (act->id) {
+		case FLOW_ACTION_POLICE:
+			return icssm_emac_flower_parse_policer
+				(emac, extack, cls,
+				 act->police.rate_bytes_ps);
+		default:
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Action not supported");
+			return -EOPNOTSUPP;
+		}
+	}
+	return -EOPNOTSUPP;
+}
+
+static int icssm_emac_delete_clsflower(struct prueth_emac *emac,
+				       struct flow_cls_offload *cls)
+{
+	struct prueth *prueth = emac->prueth;
+	void __iomem *dram;
+
+	dram = prueth->mem[emac->dram].va;
+
+	if (cls->cookie == emac->nsp_bc.cookie) {
+		emac->nsp_bc.cookie = 0;
+		emac->nsp_bc.credit = 0;
+		writel(0, dram + STORM_PREVENTION_OFFSET_BC);
+	} else if (cls->cookie == emac->nsp_mc.cookie) {
+		emac->nsp_mc.cookie = 0;
+		emac->nsp_mc.credit = 0;
+		writel(0, dram + STORM_PREVENTION_OFFSET_MC);
+	} else if (cls->cookie == emac->nsp_uc.cookie) {
+		emac->nsp_uc.cookie = 0;
+		emac->nsp_uc.credit = 0;
+		writel(0, dram + STORM_PREVENTION_OFFSET_UC);
+	}
+
+	emac->nsp_enabled = emac->nsp_bc.cookie | emac->nsp_mc.cookie |
+			    emac->nsp_uc.cookie;
+
+	return 0;
+}
+
+static int icssm_emac_setup_tc_cls_flower(struct prueth_emac *emac,
+					  struct flow_cls_offload *cls_flower)
+{
+	switch (cls_flower->command) {
+	case FLOW_CLS_REPLACE:
+		return icssm_emac_configure_clsflower(emac, cls_flower);
+	case FLOW_CLS_DESTROY:
+		return icssm_emac_delete_clsflower(emac, cls_flower);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int icssm_emac_setup_tc_block_cb(enum tc_setup_type type,
+					void *type_data, void *cb_priv)
+{
+	struct prueth_emac *emac = cb_priv;
+
+	if (!tc_cls_can_offload_and_chain0(emac->ndev, type_data))
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case TC_SETUP_CLSFLOWER:
+		return icssm_emac_setup_tc_cls_flower(emac, type_data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static LIST_HEAD(emac_block_cb_list);
+
+int icssm_emac_ndo_setup_tc(struct net_device *dev, enum tc_setup_type type,
+			    void *type_data)
+{
+	struct prueth_emac *emac = netdev_priv(dev);
+
+	if (type == TC_SETUP_BLOCK) {
+		return flow_block_cb_setup_simple(type_data,
+						  &emac_block_cb_list,
+						  icssm_emac_setup_tc_block_cb,
+						  emac, emac, true);
+	}
+
+	return -EOPNOTSUPP;
+}
diff --git a/drivers/net/ethernet/ti/icssm/icssm_switch.h b/drivers/net/ethernet/ti/icssm/icssm_switch.h
index b13e0706ccec..0053191380b7 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_switch.h
+++ b/drivers/net/ethernet/ti/icssm/icssm_switch.h
@@ -146,6 +146,11 @@
 /* 4 bytes ? */
 #define STP_INVALID_STATE_OFFSET	(STATISTICS_OFFSET + STAT_SIZE + 33)
 
+/* Shared RAM Offsets for Switch */
+/* NSP (Network Storm Prevention) timer re-uses NT timer */
+#define PRUETH_NSP_CREDIT_SHIFT       8
+#define PRUETH_NSP_ENABLE            BIT(0)
+
 /* DRAM Offsets for EMAC
  * Present on Both DRAM0 and DRAM1
  */
diff --git a/drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h b/drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h
new file mode 100644
index 000000000000..32b5c228c5fb
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright (C) 2015-2021 Texas Instruments Incorporated - https://www.ti.com
+ *
+ * This file contains VLAN/Multicast filtering feature memory map
+ *
+ */
+
+#ifndef ICSS_VLAN_MULTICAST_FILTER_MM_H
+#define ICSS_VLAN_MULTICAST_FILTER_MM_H
+
+/*  VLAN/Multicast filter defines & offsets,
+ *  present on both PRU0 and PRU1 DRAM
+ */
+
+/* Feature enable/disable values for multicast filtering */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_DISABLED		0x00
+#define ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_ENABLED		0x01
+
+/* Feature enable/disable values  for VLAN filtering */
+#define ICSS_EMAC_FW_VLAN_FILTER_CTRL_DISABLED			0x00
+#define ICSS_EMAC_FW_VLAN_FILTER_CTRL_ENABLED			0x01
+
+/* Add/remove multicast mac id for filtering bin */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_HOST_RCV_ALLOWED		0x01
+#define ICSS_EMAC_FW_MULTICAST_FILTER_HOST_RCV_NOT_ALLOWED	0x00
+
+/* Default HASH value for the multicast filtering Mask */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_INIT_VAL			0xFF
+
+/* Size requirements for Multicast filtering feature */
+#define ICSS_EMAC_FW_MULTICAST_TABLE_SIZE_BYTES			       256
+#define ICSS_EMAC_FW_MULTICAST_FILTER_MASK_SIZE_BYTES			 6
+#define ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_SIZE_BYTES			 1
+#define ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OVERRIDE_STATUS_SIZE_BYTES	 1
+#define ICSS_EMAC_FW_MULTICAST_FILTER_DROP_CNT_SIZE_BYTES		 4
+
+/* Size requirements for VLAN filtering feature : 4096 bits = 512 bytes */
+#define ICSS_EMAC_FW_VLAN_FILTER_TABLE_SIZE_BYTES		       512
+#define ICSS_EMAC_FW_VLAN_FILTER_CTRL_SIZE_BYTES			 1
+#define ICSS_EMAC_FW_VLAN_FILTER_DROP_CNT_SIZE_BYTES			 4
+
+/* Mask override set status */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OVERRIDE_SET			 1
+/* Mask override not set status */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OVERRIDE_NOT_SET		 0
+/* 6 bytes HASH Mask for the MAC */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OFFSET	  0xF4
+/* 0 -> multicast filtering disabled | 1 -> multicast filtering enabled */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET	\
+	(ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OFFSET +	\
+	 ICSS_EMAC_FW_MULTICAST_FILTER_MASK_SIZE_BYTES)
+/* Status indicating if the HASH override is done or not: 0: no, 1: yes */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_OVERRIDE_STATUS	\
+	(ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET +	\
+	 ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_SIZE_BYTES)
+/* Multicast drop statistics */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_DROP_CNT_OFFSET	\
+	(ICSS_EMAC_FW_MULTICAST_FILTER_OVERRIDE_STATUS +\
+	 ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OVERRIDE_STATUS_SIZE_BYTES)
+/* Multicast table */
+#define ICSS_EMAC_FW_MULTICAST_FILTER_TABLE		\
+	(ICSS_EMAC_FW_MULTICAST_FILTER_DROP_CNT_OFFSET +\
+	 ICSS_EMAC_FW_MULTICAST_FILTER_DROP_CNT_SIZE_BYTES)
+
+/* Multicast filter defines & offsets for LRE
+ */
+#define ICSS_LRE_FW_MULTICAST_TABLE_SEARCH_OP_CONTROL_BIT	0xE0
+/* one byte field :
+ * 0 -> multicast filtering disabled
+ * 1 -> multicast filtering enabled
+ */
+#define ICSS_LRE_FW_MULTICAST_FILTER_MASK			 0xE4
+#define ICSS_LRE_FW_MULTICAST_FILTER_TABLE			 0x100
+
+/* VLAN table Offsets */
+#define ICSS_EMAC_FW_VLAN_FLTR_TBL_BASE_ADDR		 0x200
+#define ICSS_EMAC_FW_VLAN_FILTER_CTRL_BITMAP_OFFSET	 0xEF
+#define ICSS_EMAC_FW_VLAN_FILTER_DROP_CNT_OFFSET	\
+	(ICSS_EMAC_FW_VLAN_FILTER_CTRL_BITMAP_OFFSET +	\
+	 ICSS_EMAC_FW_VLAN_FILTER_CTRL_SIZE_BYTES)
+
+/* VLAN filter Control Bit maps */
+/* one bit field, bit 0: | 0 : VLAN filter disabled (default),
+ * 1: VLAN filter enabled
+ */
+#define ICSS_EMAC_FW_VLAN_FILTER_CTRL_ENABLE_BIT		       0
+/* one bit field, bit 1: | 0 : untagged host rcv allowed (default),
+ * 1: untagged host rcv not allowed
+ */
+#define ICSS_EMAC_FW_VLAN_FILTER_UNTAG_HOST_RCV_ALLOW_CTRL_BIT	       1
+/* one bit field, bit 1: | 0 : priotag host rcv allowed (default),
+ * 1: priotag host rcv not allowed
+ */
+#define ICSS_EMAC_FW_VLAN_FILTER_PRIOTAG_HOST_RCV_ALLOW_CTRL_BIT       2
+/* one bit field, bit 1: | 0 : skip sv vlan flow
+ * :1 : take sv vlan flow  (not applicable for dual emac )
+ */
+#define ICSS_EMAC_FW_VLAN_FILTER_SV_VLAN_FLOW_HOST_RCV_ALLOW_CTRL_BIT  3
+
+/* VLAN IDs */
+#define ICSS_EMAC_FW_VLAN_FILTER_PRIOTAG_VID			       0
+#define ICSS_EMAC_FW_VLAN_FILTER_VID_MIN			       0x0000
+#define ICSS_EMAC_FW_VLAN_FILTER_VID_MAX			       0x0FFF
+
+/* VLAN Filtering Commands */
+#define ICSS_EMAC_FW_VLAN_FILTER_ADD_VLAN_VID_CMD		       0x00
+#define ICSS_EMAC_FW_VLAN_FILTER_REMOVE_VLAN_VID_CMD		       0x01
+
+/* Switch defines for VLAN/MC filtering */
+/* SRAM
+ * VLAN filter defines & offsets
+ */
+#define ICSS_LRE_FW_VLAN_FLTR_CTRL_BYTE				 0x1FE
+/* one bit field | 0 : VLAN filter disabled
+ *		 | 1 : VLAN filter enabled
+ */
+#define ICSS_LRE_FW_VLAN_FLTR_TBL_BASE_ADDR			 0x200
+
+#endif /* ICSS_MULTICAST_FILTER_MM_H */
-- 
2.34.1


