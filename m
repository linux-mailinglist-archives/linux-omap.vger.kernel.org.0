Return-Path: <linux-omap+bounces-3213-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F64A1B744
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 14:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 933A016917B
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 13:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D56378F51;
	Fri, 24 Jan 2025 13:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="TIIdWYVZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8570816;
	Fri, 24 Jan 2025 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726136; cv=none; b=Ek3/KQiLZ4tPhPoRupouUTof04sGGrbrHTF7M1WbHcy7h2C5KUSLxFn7pMpMYfJL9ldufpkxdjUkqgg4Zn45hdrUrm/3om8bxOtgeBryCmZXZh81734BBBdnM/oXdszy7ZQdI2FzMCb0v4u5NjwbIso1go5Sjp7dSjKZK7yIj88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726136; c=relaxed/simple;
	bh=agFAru+9yDHySWkkp+IM3Doz5OabSshyn2FjgH0Q4NI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t8JCqnp2wglkw0WbXU3kGUORId0Z1v7wW7P/UjKAJU+DXA39CxpKCkt4biacO02O//vPL07bWcrfAU54OTnsBto9muwxGTm00aS0Nnj03+JxK0tdEY3xlLTUIvqlOcT6CmCMMj8EJLi2bg3TKyp3+wvSbQZsJ/wayFDP9+4qWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=TIIdWYVZ; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AG18lyPKaJDwH+XXfEBCGVdk8Ed1OGTfR3tXONKpyuw=; b=TIIdWYVZfPLzu9rGxR6GOnM44M
	/u+f6XAbAWfOQ1JTEi0LJTznKwQzkSyeAYef6AnykJB01soc8/ApYS4X/ayKrPt3o5Fu5VA1hVYg5
	+PQOxHf5lcaKCTxObH64jSfjy/ck4iDudA7L3P5isLWW9QDVzsCI4XJHpi/a2BlO1qTWxhGMisobf
	4MS0uswk0mM7Ts1XVNvoy8zQvDP23dh4e8RzZlLZOn3SIahuUBttIpfpE2nzP8QWggF9JoulFfPus
	xiIV2RWRJ1oGfyNmsRW8ppQtXrBGcXNpK3tXXZu8qY399eTZ1cu/ziAf6PYe4plVSZ2UvTDtXUnHm
	Y9ekRGTw==;
Received: from [122.175.9.182] (port=2665 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tbJwl-0005Y4-1g;
	Fri, 24 Jan 2025 19:12:08 +0530
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
Subject: [RFC v2 PATCH 06/10] net: ti: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Date: Fri, 24 Jan 2025 19:10:52 +0530
Message-Id: <20250124134056.1459060-7-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124122353.1457174-1-basharath@couthit.com>
References: <20250124122353.1457174-1-basharath@couthit.com>
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

PRU-ICSS IEP module, which is capable of timestamping RX and
TX packets at HW level, is used for time synchronization by PTP4L.

This change includes interaction between firmware and user space
application (ptp4l) with required packet timestamps. The driver
initializes the PRU firmware with appropriate mode and configuration
flags. Firmware updates local registers with the flags set by driver
and uses for further operation. RX SOF timestamp comes along with
packet and firmware will rise interrupt with TX SOF timestamp after
pushing the packet on to the wire.

IEP driver is available in upstream and we are reusing for hardware
configuration for ICSSM as well. On top of that we have extended it
with the changes for AM57xx SoC.

Extended ethtool for reading HW timestamping capability of the PRU
interfaces.

Currently ordinary clock (OC) configuration has been validated with
Linux ptp4l.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
---
 drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
 drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  23 +
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
 .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
 5 files changed, 602 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index 768578c0d958..9a2ea13703d8 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -937,11 +937,53 @@ static const struct icss_iep_plat_data am654_icss_iep_plat_data = {
 	.config = &am654_icss_iep_regmap_config,
 };
 
+static const struct icss_iep_plat_data am57xx_icss_iep_plat_data = {
+	.flags = ICSS_IEP_64BIT_COUNTER_SUPPORT |
+		 ICSS_IEP_SLOW_COMPEN_REG_SUPPORT,
+	.reg_offs = {
+		[ICSS_IEP_GLOBAL_CFG_REG] = 0x00,
+		[ICSS_IEP_COMPEN_REG] = 0x08,
+		[ICSS_IEP_SLOW_COMPEN_REG] = 0x0C,
+		[ICSS_IEP_COUNT_REG0] = 0x10,
+		[ICSS_IEP_COUNT_REG1] = 0x14,
+		[ICSS_IEP_CAPTURE_CFG_REG] = 0x18,
+		[ICSS_IEP_CAPTURE_STAT_REG] = 0x1c,
+
+		[ICSS_IEP_CAP6_RISE_REG0] = 0x50,
+		[ICSS_IEP_CAP6_RISE_REG1] = 0x54,
+
+		[ICSS_IEP_CAP7_RISE_REG0] = 0x60,
+		[ICSS_IEP_CAP7_RISE_REG1] = 0x64,
+
+		[ICSS_IEP_CMP_CFG_REG] = 0x70,
+		[ICSS_IEP_CMP_STAT_REG] = 0x74,
+		[ICSS_IEP_CMP0_REG0] = 0x78,
+		[ICSS_IEP_CMP0_REG1] = 0x7c,
+		[ICSS_IEP_CMP1_REG0] = 0x80,
+		[ICSS_IEP_CMP1_REG1] = 0x84,
+
+		[ICSS_IEP_CMP8_REG0] = 0xc0,
+		[ICSS_IEP_CMP8_REG1] = 0xc4,
+		[ICSS_IEP_SYNC_CTRL_REG] = 0x180,
+		[ICSS_IEP_SYNC0_STAT_REG] = 0x188,
+		[ICSS_IEP_SYNC1_STAT_REG] = 0x18c,
+		[ICSS_IEP_SYNC_PWIDTH_REG] = 0x190,
+		[ICSS_IEP_SYNC0_PERIOD_REG] = 0x194,
+		[ICSS_IEP_SYNC1_DELAY_REG] = 0x198,
+		[ICSS_IEP_SYNC_START_REG] = 0x19c,
+	},
+	.config = &am654_icss_iep_regmap_config,
+};
+
 static const struct of_device_id icss_iep_of_match[] = {
 	{
 		.compatible = "ti,am654-icss-iep",
 		.data = &am654_icss_iep_plat_data,
 	},
+	{
+		.compatible = "ti,am5728-icss-iep",
+		.data = &am57xx_icss_iep_plat_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, icss_iep_of_match);
diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
index cce3276d5565..ff9faaef9f9e 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
@@ -7,6 +7,7 @@
 
 #include <linux/if_bridge.h>
 #include "icssm_prueth.h"
+#include "../icssg/icss_iep.h"
 
 #define PRUETH_MODULE_VERSION "0.2"
 #define PRUETH_MODULE_DESCRIPTION "PRUSS Ethernet driver"
@@ -189,12 +190,34 @@ static void icssm_emac_get_regs(struct net_device *ndev,
 	regs->version = PRUETH_REG_DUMP_GET_VER(prueth);
 }
 
+static int icssm_emac_get_ts_info(struct net_device *ndev,
+				  struct kernel_ethtool_ts_info *info)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
+		return ethtool_op_get_ts_info(ndev, info);
+
+	info->so_timestamping =
+		SOF_TIMESTAMPING_TX_HARDWARE |
+		SOF_TIMESTAMPING_RX_HARDWARE |
+		SOF_TIMESTAMPING_RAW_HARDWARE;
+
+	info->phc_index = icss_iep_get_ptp_clock_idx(emac->prueth->iep);
+	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
+	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
+				BIT(HWTSTAMP_FILTER_PTP_V2_EVENT);
+
+	return 0;
+}
+
 /* Ethtool support for EMAC adapter */
 const struct ethtool_ops emac_ethtool_ops = {
 	.get_drvinfo = icssm_emac_get_drvinfo,
 	.get_link_ksettings = icssm_emac_get_link_ksettings,
 	.set_link_ksettings = icssm_emac_set_link_ksettings,
 	.get_link = ethtool_op_get_link,
+	.get_ts_info = icssm_emac_get_ts_info,
 	.get_sset_count = icssm_emac_get_sset_count,
 	.get_strings = icssm_emac_get_strings,
 	.get_ethtool_stats = icssm_emac_get_ethtool_stats,
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index 35dd91c71caa..7311366dac93 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -30,6 +30,7 @@
 
 #include "icssm_prueth.h"
 #include "../icssg/icssg_mii_rt.h"
+#include "../icssg/icss_iep.h"
 
 #define OCMC_RAM_SIZE		(SZ_64K)
 
@@ -50,6 +51,45 @@ static inline void icssm_prueth_write_reg(struct prueth *prueth,
 						ETH_FCS_LEN + \
 						ICSSM_LRE_TAG_SIZE)
 
+static inline void icssm_prueth_ptp_ts_enable(struct prueth_emac *emac)
+{
+	void __iomem *sram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+	u8 val = 0;
+
+	if (emac->ptp_tx_enable) {
+		/* Disable fw background task */
+		val &= ~TIMESYNC_CTRL_BG_ENABLE;
+		/* Enable forced 2-step */
+		val |= TIMESYNC_CTRL_FORCED_2STEP;
+	}
+
+	writeb(val, sram + TIMESYNC_CTRL_VAR_OFFSET);
+}
+
+static inline void icssm_prueth_ptp_tx_ts_enable(struct prueth_emac *emac,
+						 bool enable)
+{
+	emac->ptp_tx_enable = enable;
+	icssm_prueth_ptp_ts_enable(emac);
+}
+
+static inline bool icssm_prueth_ptp_tx_ts_is_enabled(struct prueth_emac *emac)
+{
+	return !!emac->ptp_tx_enable;
+}
+
+static inline void icssm_prueth_ptp_rx_ts_enable(struct prueth_emac *emac,
+						 bool enable)
+{
+	emac->ptp_rx_enable = enable;
+	icssm_prueth_ptp_ts_enable(emac);
+}
+
+static inline bool icssm_prueth_ptp_rx_ts_is_enabled(struct prueth_emac *emac)
+{
+	return !!emac->ptp_rx_enable;
+}
+
 /* ensure that order of PRUSS mem regions is same as enum prueth_mem */
 static enum pruss_mem pruss_mem_ids[] = { PRUSS_MEM_DRAM0, PRUSS_MEM_DRAM1,
 					  PRUSS_MEM_SHRD_RAM2 };
@@ -443,6 +483,173 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
 	spin_unlock_irqrestore(&emac->lock, flags);
 }
 
+static u8 icssm_prueth_ptp_ts_event_type(struct sk_buff *skb, u8 *ptp_msgtype)
+{
+	unsigned int ptp_class = ptp_classify_raw(skb);
+	struct ptp_header *hdr;
+	u8 msgtype, event_type;
+
+	if (ptp_class == PTP_CLASS_NONE)
+		return PRUETH_PTP_TS_EVENTS;
+
+	hdr = ptp_parse_header(skb, ptp_class);
+	if (!hdr)
+		return PRUETH_PTP_TS_EVENTS;
+
+	msgtype = ptp_get_msgtype(hdr, ptp_class);
+	/* Treat E2E Delay Req/Resp messages in the same way as P2P peer delay
+	 * req/resp in driver here since firmware stores timestamps in the same
+	 * memory location for either (since they cannot operate simultaneously
+	 * anyway)
+	 */
+	switch (msgtype) {
+	case PTP_MSGTYPE_SYNC:
+		event_type = PRUETH_PTP_SYNC;
+		break;
+	case PTP_MSGTYPE_DELAY_REQ:
+	case PTP_MSGTYPE_PDELAY_REQ:
+		event_type = PRUETH_PTP_DLY_REQ;
+		break;
+	/* TODO: Check why PTP_MSGTYPE_DELAY_RESP needs timestamp
+	 * and need for it.
+	 */
+	case 0x9:
+	case PTP_MSGTYPE_PDELAY_RESP:
+		event_type = PRUETH_PTP_DLY_RESP;
+		break;
+	default:
+		event_type = PRUETH_PTP_TS_EVENTS;
+	}
+
+	if (ptp_msgtype)
+		*ptp_msgtype = msgtype;
+
+	return event_type;
+}
+
+static void icssm_prueth_ptp_tx_ts_reset(struct prueth_emac *emac, u8 event)
+{
+	void __iomem *sram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+	u32 ts_notify_offs, ts_offs;
+
+	ts_offs = icssm_prueth_tx_ts_offs_get(emac->port_id - 1, event);
+	ts_notify_offs = icssm_prueth_tx_ts_notify_offs_get(emac->port_id - 1,
+							    event);
+
+	writeb(0, sram + ts_notify_offs);
+	memset_io(sram + ts_offs, 0, sizeof(u64));
+}
+
+static int icssm_prueth_ptp_tx_ts_enqueue(struct prueth_emac *emac,
+					  struct sk_buff *skb)
+{
+	u8 event, changed = 0;
+	unsigned long flags;
+
+	if (skb_vlan_tagged(skb)) {
+		__skb_pull(skb, VLAN_HLEN);
+		changed += VLAN_HLEN;
+	}
+
+	skb_reset_mac_header(skb);
+	event = icssm_prueth_ptp_ts_event_type(skb, NULL);
+	__skb_push(skb, changed);
+	if (event == PRUETH_PTP_TS_EVENTS) {
+		netdev_err(emac->ndev, "invalid PTP event\n");
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&emac->ptp_skb_lock, flags);
+	if (emac->ptp_skb[event]) {
+		dev_consume_skb_any(emac->ptp_skb[event]);
+		icssm_prueth_ptp_tx_ts_reset(emac, event);
+		netdev_warn(emac->ndev, "Dropped event waiting for tx ts.\n");
+	}
+
+	skb_get(skb);
+	emac->ptp_skb[event] = skb;
+	spin_unlock_irqrestore(&emac->ptp_skb_lock, flags);
+
+	return 0;
+}
+
+irqreturn_t icssm_prueth_ptp_tx_irq_handle(int irq, void *dev)
+{
+	struct net_device *ndev = (struct net_device *)dev;
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	if (unlikely(netif_queue_stopped(ndev)))
+		netif_wake_queue(ndev);
+
+	if (icssm_prueth_ptp_tx_ts_is_enabled(emac))
+		return IRQ_WAKE_THREAD;
+
+	return IRQ_HANDLED;
+}
+
+static u64 icssm_prueth_ptp_ts_get(struct prueth_emac *emac, u32 ts_offs)
+{
+	void __iomem *sram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+	u64 cycles;
+
+	memcpy_fromio(&cycles, sram + ts_offs, sizeof(cycles));
+	memset_io(sram + ts_offs, 0, sizeof(cycles));
+
+	return cycles;
+}
+
+static void icssm_prueth_ptp_tx_ts_get(struct prueth_emac *emac, u8 event)
+{
+	struct skb_shared_hwtstamps ssh;
+	struct sk_buff *skb;
+	unsigned long flags;
+	u64 ns;
+
+	/* get the msg from list */
+	spin_lock_irqsave(&emac->ptp_skb_lock, flags);
+	skb = emac->ptp_skb[event];
+	emac->ptp_skb[event] = NULL;
+	spin_unlock_irqrestore(&emac->ptp_skb_lock, flags);
+	if (!skb) {
+		netdev_err(emac->ndev, "no tx msg %u found waiting for ts\n",
+			   event);
+		return;
+	}
+
+	/* get timestamp */
+	ns = icssm_prueth_ptp_ts_get(emac,
+				     icssm_prueth_tx_ts_offs_get
+				     (emac->port_id - 1, event));
+
+	memset(&ssh, 0, sizeof(ssh));
+	ssh.hwtstamp = ns_to_ktime(ns);
+	skb_tstamp_tx(skb, &ssh);
+	dev_consume_skb_any(skb);
+}
+
+irqreturn_t icssm_prueth_ptp_tx_irq_work(int irq, void *dev)
+{
+	struct prueth_emac *emac = netdev_priv(dev);
+	u32 ts_notify_offs, ts_notify_mask, i;
+	void __iomem *sram;
+
+	/* get and reset the ts notifications */
+	sram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+	for (i = 0; i < PRUETH_PTP_TS_EVENTS; i++) {
+		ts_notify_offs =
+			icssm_prueth_tx_ts_notify_offs_get(emac->port_id - 1,
+							   i);
+		memcpy_fromio(&ts_notify_mask, sram + ts_notify_offs,
+			      PRUETH_PTP_TS_NOTIFY_SIZE);
+		memset_io(sram + ts_notify_offs, 0, PRUETH_PTP_TS_NOTIFY_SIZE);
+
+		if (ts_notify_mask & PRUETH_PTP_TS_NOTIFY_MASK)
+			icssm_prueth_ptp_tx_ts_get(emac, i);
+	}
+
+	return IRQ_HANDLED;
+}
+
 /**
  * icssm_prueth_tx_enqueue - queue a packet to firmware for transmission
  *
@@ -553,6 +760,12 @@ static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
 		memcpy(dst_addr, src_addr, pktlen);
 	}
 
+	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
+	    icssm_prueth_ptp_tx_ts_is_enabled(emac)) {
+		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
+		icssm_prueth_ptp_tx_ts_enqueue(emac, skb);
+	}
+
        /* update first buffer descriptor */
 	wr_buf_desc = (pktlen << PRUETH_BD_LENGTH_SHIFT) &
 		       PRUETH_BD_LENGTH_MASK;
@@ -594,6 +807,7 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
 			 const struct prueth_queue_info *rxqueue)
 {
 	struct net_device *ndev = emac->ndev;
+	struct skb_shared_hwtstamps *ssh;
 	unsigned int buffer_desc_count;
 	int read_block, update_block;
 	unsigned int actual_pkt_len;
@@ -603,6 +817,7 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
 	struct sk_buff *skb;
 	int pkt_block_size;
 	void *ocmc_ram;
+	u64 ts = 0;
 
 	/* the PRU firmware deals mostly in pointers already
 	 * offset into ram, we would like to deal in indexes
@@ -615,6 +830,8 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
 	buffer_desc_count++;
 	read_block = (*bd_rd_ptr - rxqueue->buffer_desc_offset) / BD_SIZE;
 	pkt_block_size = DIV_ROUND_UP(pkt_info->length, ICSS_BLOCK_SIZE);
+	if (pkt_info->timestamp)
+		pkt_block_size++;
 
 	/* calculate end BD address post read */
 	update_block = read_block + pkt_block_size;
@@ -682,9 +899,22 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
 		src_addr += actual_pkt_len;
 	}
 
+	if (pkt_info->timestamp) {
+		src_addr = (void *)roundup((uintptr_t)src_addr,
+					   ICSS_BLOCK_SIZE);
+		dst_addr = &ts;
+		memcpy(dst_addr, src_addr, sizeof(ts));
+	}
+
 	if (!pkt_info->sv_frame) {
 		skb_put(skb, actual_pkt_len);
 
+		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
+		    pkt_info->timestamp) {
+			ssh = skb_hwtstamps(skb);
+			memset(ssh, 0, sizeof(*ssh));
+			ssh->hwtstamp = ns_to_ktime(ts);
+		}
 		/* send packet up the stack */
 		skb->protocol = eth_type_trans(skb, ndev);
 		local_bh_disable();
@@ -855,9 +1085,64 @@ static int icssm_emac_request_irqs(struct prueth_emac *emac)
 		return ret;
 	}
 
+	if (emac->emac_ptp_tx_irq) {
+		ret = request_threaded_irq(emac->emac_ptp_tx_irq,
+					   icssm_prueth_ptp_tx_irq_handle,
+					   icssm_prueth_ptp_tx_irq_work,
+					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					   ndev->name, ndev);
+		if (ret) {
+			netdev_err(ndev, "unable to request PTP TX IRQ\n");
+			free_irq(emac->rx_irq, ndev);
+			free_irq(emac->tx_irq, ndev);
+		}
+	}
+
 	return ret;
 }
 
+static void icssm_iptp_dram_init(struct prueth_emac *emac)
+{
+	void __iomem *sram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+	u64 temp64;
+
+	writew(0, sram + MII_RX_CORRECTION_OFFSET);
+	writew(0, sram + MII_TX_CORRECTION_OFFSET);
+
+	/* Initialize RCF to 1 (Linux N/A) */
+	writel(1 * 1024, sram + TIMESYNC_TC_RCF_OFFSET);
+
+	/* This flag will be set and cleared by firmware */
+	/* Write Sync0 period for sync signal generation in PTP
+	 * memory in shared RAM
+	 */
+	writel(200000000 / 50, sram + TIMESYNC_SYNC0_WIDTH_OFFSET);
+
+	/* Write CMP1 period for sync signal generation in PTP
+	 * memory in shared RAM
+	 */
+	temp64 = 1000000;
+	memcpy_toio(sram + TIMESYNC_CMP1_CMP_OFFSET, &temp64, sizeof(temp64));
+
+	/* Write Sync0 period for sync signal generation in PTP
+	 * memory in shared RAM
+	 */
+	writel(1000000, sram + TIMESYNC_CMP1_PERIOD_OFFSET);
+
+	/* Configures domainNumber list. Firmware supports 2 domains */
+	writeb(0, sram + TIMESYNC_DOMAIN_NUMBER_LIST);
+	writeb(0, sram + TIMESYNC_DOMAIN_NUMBER_LIST + 1);
+
+	/* Configure 1-step/2-step */
+	writeb(1, sram + DISABLE_SWITCH_SYNC_RELAY_OFFSET);
+
+	/* Configures the setting to Link local frame without HSR tag */
+	writeb(0, sram + LINK_LOCAL_FRAME_HAS_HSR_TAG);
+
+	/* Enable E2E/UDP PTP message timestamping */
+	writeb(1, sram + PTP_IPV4_UDP_E2E_ENABLE);
+}
+
 /**
  * icssm_emac_ndo_open - EMAC device open
  * @ndev: network adapter device
@@ -882,9 +1167,20 @@ static int icssm_emac_ndo_open(struct net_device *ndev)
 
 	icssm_emac_set_stats(emac, &emac->stats);
 
+	if (!prueth->emac_configured) {
+		icssm_iptp_dram_init(emac);
+		ret = icss_iep_init(prueth->iep, NULL, NULL, 0);
+		if (ret) {
+			netdev_err(ndev, "Failed to initialize iep: %d\n", ret);
+			goto iep_exit;
+		}
+	}
+
 	ret = icssm_emac_set_boot_pru(emac, ndev);
-	if (ret)
+	if (ret) {
 		netdev_err(ndev, "failed to boot PRU: %d\n", ret);
+		goto iep_exit;
+	}
 
 	ret = icssm_emac_request_irqs(emac);
 	if (ret)
@@ -906,6 +1202,10 @@ static int icssm_emac_ndo_open(struct net_device *ndev)
 rproc_shutdown:
 	rproc_shutdown(emac->pru);
 
+iep_exit:
+	if (!prueth->emac_configured)
+		icss_iep_exit(prueth->iep);
+
 	return ret;
 }
 
@@ -921,6 +1221,7 @@ static int icssm_emac_ndo_stop(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
+	int i;
 
 	prueth->emac_configured &= ~BIT(emac->port_id);
 
@@ -930,16 +1231,35 @@ static int icssm_emac_ndo_stop(struct net_device *ndev)
 	/* stop PHY */
 	phy_stop(emac->phydev);
 
+	/* inform the upper layers. */
+	netif_stop_queue(ndev);
+
 	/* stop the PRU */
 	rproc_shutdown(emac->pru);
 
 	icssm_emac_get_stats(emac, &emac->stats);
 
+	/* Cleanup ptp related stuff for all protocols */
+	icssm_prueth_ptp_tx_ts_enable(emac, 0);
+	icssm_prueth_ptp_rx_ts_enable(emac, 0);
+	for (i = 0; i < PRUETH_PTP_TS_EVENTS; i++) {
+		if (emac->ptp_skb[i]) {
+			icssm_prueth_ptp_tx_ts_reset(emac, i);
+			dev_consume_skb_any(emac->ptp_skb[i]);
+			emac->ptp_skb[i] = NULL;
+		}
+	}
+
 	/* free rx and tx interrupts */
 	if (emac->tx_irq > 0)
 		free_irq(emac->tx_irq, ndev);
 
 	free_irq(emac->rx_irq, ndev);
+	if (emac->emac_ptp_tx_irq)
+		free_irq(emac->emac_ptp_tx_irq, ndev);
+
+	if (!prueth->emac_configured)
+		icss_iep_exit(prueth->iep);
 
 	if (netif_msg_drv(emac))
 		dev_notice(&ndev->dev, "stopped\n");
@@ -1034,6 +1354,30 @@ static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
 	return ret;
 }
 
+/**
+ * icssm_emac_ndo_tx_timeout - EMAC Transmit timeout function
+ * @ndev: The EMAC network adapter
+ * @txqueue: TX queue being used
+ *
+ * Called when system detects that a skb timeout period has expired
+ * potentially due to a fault in the adapter in not being able to send
+ * it out on the wire.
+ */
+static void icssm_emac_ndo_tx_timeout(struct net_device *ndev,
+				      unsigned int txqueue)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	if (netif_msg_tx_err(emac))
+		netdev_err(ndev, "xmit timeout");
+
+	ndev->stats.tx_errors++;
+
+	/* TODO: can we recover or need to reboot firmware? */
+
+	netif_wake_queue(ndev);
+}
+
 /**
  * icssm_emac_ndo_get_stats - EMAC get statistics function
  * @ndev: The EMAC network adapter
@@ -1059,11 +1403,86 @@ static struct net_device_stats
 	return stats;
 }
 
+static int icssm_emac_hwtstamp_config_set(struct net_device *ndev,
+					  struct ifreq *ifr)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct hwtstamp_config cfg;
+
+	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
+		return -EFAULT;
+
+	/* reserved for future extensions */
+	if (cfg.flags)
+		return -EINVAL;
+
+	if (cfg.tx_type != HWTSTAMP_TX_OFF && cfg.tx_type != HWTSTAMP_TX_ON)
+		return -ERANGE;
+
+	switch (cfg.rx_filter) {
+	case HWTSTAMP_FILTER_NONE:
+		icssm_prueth_ptp_rx_ts_enable(emac, 0);
+		break;
+	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
+	case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
+	case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
+	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
+	case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
+	case HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ:
+	case HWTSTAMP_FILTER_PTP_V2_EVENT:
+	case HWTSTAMP_FILTER_PTP_V2_SYNC:
+	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
+		icssm_prueth_ptp_rx_ts_enable(emac, 1);
+		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
+		break;
+	case HWTSTAMP_FILTER_ALL:
+	case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
+	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
+	case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
+	default:
+		return -ERANGE;
+	}
+
+	icssm_prueth_ptp_tx_ts_enable(emac, cfg.tx_type == HWTSTAMP_TX_ON);
+
+	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+}
+
+static int icssm_emac_hwtstamp_config_get(struct net_device *ndev,
+					  struct ifreq *ifr)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct hwtstamp_config cfg;
+
+	cfg.flags = 0;
+	cfg.tx_type = icssm_prueth_ptp_tx_ts_is_enabled(emac) ?
+		      HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+	cfg.rx_filter = icssm_prueth_ptp_rx_ts_is_enabled(emac) ?
+			HWTSTAMP_FILTER_PTP_V2_EVENT : HWTSTAMP_FILTER_NONE;
+
+	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+}
+
+static int icssm_emac_ndo_ioctl(struct net_device *ndev, struct ifreq *ifr,
+				int cmd)
+{
+	switch (cmd) {
+	case SIOCSHWTSTAMP:
+		return icssm_emac_hwtstamp_config_set(ndev, ifr);
+	case SIOCGHWTSTAMP:
+		return icssm_emac_hwtstamp_config_get(ndev, ifr);
+	}
+
+	return phy_do_ioctl(ndev, ifr, cmd);
+}
+
 static const struct net_device_ops emac_netdev_ops = {
 	.ndo_open = icssm_emac_ndo_open,
 	.ndo_stop = icssm_emac_ndo_stop,
 	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
+	.ndo_tx_timeout = icssm_emac_ndo_tx_timeout,
 	.ndo_get_stats = icssm_emac_ndo_get_stats,
+	.ndo_eth_ioctl = icssm_emac_ndo_ioctl,
 };
 
 /* get emac_port corresponding to eth_node name */
@@ -1169,6 +1588,14 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 			dev_dbg(prueth->dev, "tx irq not configured\n");
 	}
 
+	emac->emac_ptp_tx_irq = of_irq_get_byname(eth_node, "emac_ptp_tx");
+	if (emac->emac_ptp_tx_irq < 0) {
+		emac->emac_ptp_tx_irq = 0;
+		dev_err(prueth->dev, "could not get ptp tx irq. Skipping PTP support\n");
+	}
+
+	spin_lock_init(&emac->ptp_skb_lock);
+
 	/* get mac address from DT and set private and netdev addr */
 	ret = of_get_ethdev_address(eth_node, ndev);
 	if (!is_valid_ether_addr(ndev->dev_addr)) {
@@ -1412,12 +1839,19 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		}
 	}
 
+	prueth->iep = icss_iep_get(np);
+	if (IS_ERR(prueth->iep)) {
+		ret = PTR_ERR(prueth->iep);
+		dev_err(dev, "unable to get IEP\n");
+		goto netdev_exit;
+	}
+
 	/* register the network devices */
 	if (eth0_node) {
 		ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
 		if (ret) {
 			dev_err(dev, "can't register netdev for port MII0");
-			goto netdev_exit;
+			goto iep_put;
 		}
 
 		prueth->registered_netdevs[PRUETH_MAC0] =
@@ -1451,6 +1885,9 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		unregister_netdev(prueth->registered_netdevs[i]);
 	}
 
+iep_put:
+	icss_iep_put(prueth->iep);
+
 netdev_exit:
 	for (i = 0; i < PRUETH_NUM_MACS; i++) {
 		eth_node = prueth->eth_node[i];
@@ -1522,6 +1959,8 @@ static void icssm_prueth_remove(struct platform_device *pdev)
 						 &prueth->mem[i]);
 	}
 
+	icss_iep_put(prueth->iep);
+
 	pruss_put(prueth->pruss);
 
 	if (prueth->eth_node[PRUETH_MAC0])
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
index d663a842fc38..bd7ad8318544 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
@@ -14,6 +14,7 @@
 #include <linux/remoteproc/pruss.h>
 
 #include "icssm_switch.h"
+#include "icssm_prueth_ptp.h"
 
 /* ICSSM size of redundancy tag */
 #define ICSSM_LRE_TAG_SIZE	6
@@ -331,6 +332,12 @@ struct prueth_emac {
 	u8 mac_addr[6];
 	phy_interface_t phy_if;
 	spinlock_t lock;	/* serialize access */
+
+	struct sk_buff *ptp_skb[PRUETH_PTP_TS_EVENTS];
+	spinlock_t ptp_skb_lock;	/* serialize access */
+	int emac_ptp_tx_irq;
+	bool ptp_tx_enable;
+	bool ptp_rx_enable;
 };
 
 struct prueth {
@@ -340,6 +347,7 @@ struct prueth {
 	struct pruss_mem_region mem[PRUETH_MEM_MAX];
 	struct gen_pool *sram_pool;
 	struct regmap *mii_rt;
+	struct icss_iep *iep;
 
 	const struct prueth_private_data *fw_data;
 	struct prueth_fw_offsets *fw_offsets;
@@ -360,6 +368,9 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
 			 struct prueth_packet_info *pkt_info,
 			 const struct prueth_queue_info *rxqueue);
 
+irqreturn_t icssm_prueth_ptp_tx_irq_handle(int irq, void *dev);
+irqreturn_t icssm_prueth_ptp_tx_irq_work(int irq, void *dev);
+
 void icssm_emac_set_stats(struct prueth_emac *emac,
 			  struct port_statistics *pstats);
 void icssm_emac_get_stats(struct prueth_emac *emac,
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h b/drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
new file mode 100644
index 000000000000..e0bf692beda1
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020-2021 Texas Instruments Incorporated - https://www.ti.com
+ */
+#ifndef PRUETH_PTP_H
+#define PRUETH_PTP_H
+
+#define RX_SYNC_TIMESTAMP_OFFSET_P1		0x8    /* 8 bytes */
+#define RX_PDELAY_REQ_TIMESTAMP_OFFSET_P1	0x14   /* 12 bytes */
+
+#define DISABLE_PTP_FRAME_FORWARDING_CTRL_OFFSET 0x14	/* 1 byte */
+
+#define RX_PDELAY_RESP_TIMESTAMP_OFFSET_P1	0x20   /* 12 bytes */
+#define RX_SYNC_TIMESTAMP_OFFSET_P2		0x2c   /* 12 bytes */
+#define RX_PDELAY_REQ_TIMESTAMP_OFFSET_P2	0x38   /* 12 bytes */
+#define RX_PDELAY_RESP_TIMESTAMP_OFFSET_P2	0x44   /* 12 bytes */
+#define TIMESYNC_DOMAIN_NUMBER_LIST		0x50   /* 2 bytes */
+#define P1_SMA_LINE_DELAY_OFFSET		0x52   /* 4 bytes */
+#define P2_SMA_LINE_DELAY_OFFSET		0x56   /* 4 bytes */
+#define TIMESYNC_SECONDS_COUNT_OFFSET		0x5a   /* 6 bytes */
+#define TIMESYNC_TC_RCF_OFFSET			0x60   /* 4 bytes */
+#define DUT_IS_MASTER_OFFSET			0x64   /* 1 byte */
+#define MASTER_PORT_NUM_OFFSET			0x65   /* 1 byte */
+#define SYNC_MASTER_MAC_OFFSET			0x66   /* 6 bytes */
+#define TX_TS_NOTIFICATION_OFFSET_SYNC_P1	0x6c   /* 1 byte */
+#define TX_TS_NOTIFICATION_OFFSET_PDEL_REQ_P1	0x6d   /* 1 byte */
+#define TX_TS_NOTIFICATION_OFFSET_PDEL_RES_P1	0x6e   /* 1 byte */
+#define TX_TS_NOTIFICATION_OFFSET_SYNC_P2	0x6f   /* 1 byte */
+#define TX_TS_NOTIFICATION_OFFSET_PDEL_REQ_P2	0x70   /* 1 byte */
+#define TX_TS_NOTIFICATION_OFFSET_PDEL_RES_P2	0x71   /* 1 byte */
+#define TX_SYNC_TIMESTAMP_OFFSET_P1		0x72   /* 12 bytes */
+#define TX_PDELAY_REQ_TIMESTAMP_OFFSET_P1	0x7e   /* 12 bytes */
+#define TX_PDELAY_RESP_TIMESTAMP_OFFSET_P1	0x8a   /* 12 bytes */
+#define TX_SYNC_TIMESTAMP_OFFSET_P2		0x96   /* 12 bytes */
+#define TX_PDELAY_REQ_TIMESTAMP_OFFSET_P2	0xa2   /* 12 bytes */
+#define TX_PDELAY_RESP_TIMESTAMP_OFFSET_P2	0xae   /* 12 bytes */
+#define TIMESYNC_CTRL_VAR_OFFSET		0xba   /* 1 byte */
+#define DISABLE_SWITCH_SYNC_RELAY_OFFSET	0xbb   /* 1 byte */
+#define MII_RX_CORRECTION_OFFSET		0xbc   /* 2 bytes */
+#define MII_TX_CORRECTION_OFFSET		0xbe   /* 2 bytes */
+#define TIMESYNC_CMP1_CMP_OFFSET		0xc0   /* 8 bytes */
+#define TIMESYNC_SYNC0_CMP_OFFSET		0xc8   /* 8 bytes */
+#define TIMESYNC_CMP1_PERIOD_OFFSET		0xd0   /* 4 bytes */
+#define TIMESYNC_SYNC0_WIDTH_OFFSET		0xd4   /* 4 bytes */
+#define SINGLE_STEP_IEP_OFFSET_P1		0xd8   /* 8 bytes */
+#define SINGLE_STEP_SECONDS_OFFSET_P1		0xe0   /* 8 bytes */
+#define SINGLE_STEP_IEP_OFFSET_P2		0xe8   /* 8 bytes */
+#define SINGLE_STEP_SECONDS_OFFSET_P2		0xf0   /* 8 bytes */
+#define LINK_LOCAL_FRAME_HAS_HSR_TAG		0xf8   /* 1 bytes */
+#define PTP_PREV_TX_TIMESTAMP_P1		0xf9  /* 8 bytes */
+#define PTP_PREV_TX_TIMESTAMP_P2		0x101  /* 8 bytes */
+#define PTP_CLK_IDENTITY_OFFSET			0x109  /* 8 bytes */
+#define PTP_SCRATCH_MEM				0x111  /* 16 byte */
+#define PTP_IPV4_UDP_E2E_ENABLE			0x121  /* 1 byte */
+
+enum {
+	PRUETH_PTP_SYNC,
+	PRUETH_PTP_DLY_REQ,
+	PRUETH_PTP_DLY_RESP,
+	PRUETH_PTP_TS_EVENTS,
+};
+
+#define PRUETH_PTP_TS_SIZE		12
+#define PRUETH_PTP_TS_NOTIFY_SIZE	1
+#define PRUETH_PTP_TS_NOTIFY_MASK	0xff
+
+/* Bit definitions for TIMESYNC_CTRL */
+#define TIMESYNC_CTRL_BG_ENABLE    BIT(0)
+#define TIMESYNC_CTRL_FORCED_2STEP BIT(1)
+
+static inline u32 icssm_prueth_tx_ts_offs_get(u8 port, u8 event)
+{
+	return TX_SYNC_TIMESTAMP_OFFSET_P1 + port *
+		PRUETH_PTP_TS_EVENTS * PRUETH_PTP_TS_SIZE +
+		event * PRUETH_PTP_TS_SIZE;
+}
+
+static inline u32 icssm_prueth_tx_ts_notify_offs_get(u8 port, u8 event)
+{
+	return TX_TS_NOTIFICATION_OFFSET_SYNC_P1 +
+		PRUETH_PTP_TS_EVENTS * PRUETH_PTP_TS_NOTIFY_SIZE * port +
+		event * PRUETH_PTP_TS_NOTIFY_SIZE;
+}
+
+#endif /* PRUETH_PTP_H */
-- 
2.34.1


