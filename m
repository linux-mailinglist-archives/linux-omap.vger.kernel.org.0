Return-Path: <linux-omap+bounces-3209-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA5A1B5ED
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 13:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DED61607D7
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 12:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294BC1CEEA4;
	Fri, 24 Jan 2025 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="HYloyU4H"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3A21B1AA;
	Fri, 24 Jan 2025 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737721650; cv=none; b=HwqBOKNh3iwOgNK+bz/XZmItSF4y2FVt7GRfyG1pSyS6tUTIRsg3TVuycFTQB+/zrpq6mcJk52Ln0uH1O+DW3RYh+T7iPkLtGZ9lfcyJ6YCDcELldAzeIvmwxKE8TPnTjVcAxT4Tv5gmyGUkO2Y7Zf9XiacGR1z78wYNY7B3MtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737721650; c=relaxed/simple;
	bh=KrHTwzIJgD6vuRFXtExv+f9Pe/8kEuPeN7d3R+9LJVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VV7EyR811NoPqnoY3n5R+HtbY3fbFza6EChIeuradAdyJ62mtER8xoWVPKw+gwXIjl1YmsRt7YtzJco0fFJS+x4j9U2i9MdTrpp0n6+oIpyqQZJ9GVySK66jHtL8ZfSBX7NbeYqnCZQgoJOprQbyLFvJEv37PkoXdTutlOhEFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=HYloyU4H; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=p3+mUdW8w24mYQNfNRI+8kE7Lc2kkILMDqB85/m8CJ8=; b=HYloyU4HH7hFeP5zV9nsRaJCIb
	wQ/9W01tE4s2zxAt4Kqezo+FaNiFJ76QL4Oj34LWGrT3SeoN/yRGpCjnmJYVgasypXTvhirYHpVzt
	oueCk65/D9MG5dbOVOnwvyjRuCd8iJImel7NGRO7WGVDEvh8glWKLoJaJNmhv29g44LFS++FYpCKr
	wxVzVhwSpveQgIWxffimEDBp4XpMynw92KWT/ZUt4pQTzyPzqSwsgW/n3eZw40ymhooHVgRYDmXWa
	EM7Th0nGMpaPTsfNBfvy1MARs+syHvpUNri1W7Fy6cUTV9lUYvQLdxr3SRqXD6ydk59jRKn52nP9j
	jCt1m+GA==;
Received: from [122.175.9.182] (port=47173 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tbImQ-0004DJ-2T;
	Fri, 24 Jan 2025 17:57:23 +0530
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
Subject: [RFC v2 PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW configuration
Date: Fri, 24 Jan 2025 17:53:46 +0530
Message-Id: <20250124122353.1457174-4-basharath@couthit.com>
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

Updates for MII_RT hardware peripheral configuration such as RX and TX
configuration for PRU0 and PRU1, frame sizes, and MUX config.

Updates for PRU-ICSS firmware register configuration and DRAM, SRAM and
OCMC memory initialization, which will be used in the runtime for packet
reception and transmission.

DUAL-EMAC memory allocation for software queues and its supporting
components such as the buffer descriptors and queue discriptors. These
software queues are placed in OCMC memory and are shared with CPU by
PRU-ICSS for packet receive and transmit.

All declarations and macros are being used from common header file
for various protocols.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 424 ++++++++++++++++++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.h |  94 ++++
 drivers/net/ethernet/ti/icssm/icssm_switch.h | 257 +++++++++++
 3 files changed, 773 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switch.h

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index aec81962c6c2..82ed0e3a0d88 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -29,6 +29,316 @@
 #include <net/pkt_cls.h>
 
 #include "icssm_prueth.h"
+#include "../icssg/icssg_mii_rt.h"
+
+#define OCMC_RAM_SIZE		(SZ_64K)
+
+#define TX_START_DELAY		0x40
+#define TX_CLK_DELAY_100M	0x6
+
+/* Below macro is for 1528 Byte Frame support, to Allow even with
+ * Redundancy tag
+ */
+#define PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC  (VLAN_ETH_FRAME_LEN + \
+						ETH_FCS_LEN + \
+						ICSSM_LRE_TAG_SIZE)
+
+/* ensure that order of PRUSS mem regions is same as enum prueth_mem */
+static enum pruss_mem pruss_mem_ids[] = { PRUSS_MEM_DRAM0, PRUSS_MEM_DRAM1,
+					  PRUSS_MEM_SHRD_RAM2 };
+
+static const struct prueth_queue_info queue_infos[][NUM_QUEUES] = {
+	[PRUETH_PORT_QUEUE_HOST] = {
+		[PRUETH_QUEUE1] = {
+			P0_Q1_BUFFER_OFFSET,
+			HOST_QUEUE_DESC_OFFSET,
+			P0_Q1_BD_OFFSET,
+			P0_Q1_BD_OFFSET + ((HOST_QUEUE_1_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE2] = {
+			P0_Q2_BUFFER_OFFSET,
+			HOST_QUEUE_DESC_OFFSET + 8,
+			P0_Q2_BD_OFFSET,
+			P0_Q2_BD_OFFSET + ((HOST_QUEUE_2_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE3] = {
+			P0_Q3_BUFFER_OFFSET,
+			HOST_QUEUE_DESC_OFFSET + 16,
+			P0_Q3_BD_OFFSET,
+			P0_Q3_BD_OFFSET + ((HOST_QUEUE_3_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE4] = {
+			P0_Q4_BUFFER_OFFSET,
+			HOST_QUEUE_DESC_OFFSET + 24,
+			P0_Q4_BD_OFFSET,
+			P0_Q4_BD_OFFSET + ((HOST_QUEUE_4_SIZE - 1) * BD_SIZE),
+		},
+	},
+	[PRUETH_PORT_QUEUE_MII0] = {
+		[PRUETH_QUEUE1] = {
+			P1_Q1_BUFFER_OFFSET,
+			P1_Q1_BUFFER_OFFSET + ((QUEUE_1_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P1_Q1_BD_OFFSET,
+			P1_Q1_BD_OFFSET + ((QUEUE_1_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE2] = {
+			P1_Q2_BUFFER_OFFSET,
+			P1_Q2_BUFFER_OFFSET + ((QUEUE_2_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P1_Q2_BD_OFFSET,
+			P1_Q2_BD_OFFSET + ((QUEUE_2_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE3] = {
+			P1_Q3_BUFFER_OFFSET,
+			P1_Q3_BUFFER_OFFSET + ((QUEUE_3_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P1_Q3_BD_OFFSET,
+			P1_Q3_BD_OFFSET + ((QUEUE_3_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE4] = {
+			P1_Q4_BUFFER_OFFSET,
+			P1_Q4_BUFFER_OFFSET + ((QUEUE_4_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P1_Q4_BD_OFFSET,
+			P1_Q4_BD_OFFSET + ((QUEUE_4_SIZE - 1) * BD_SIZE),
+		},
+	},
+	[PRUETH_PORT_QUEUE_MII1] = {
+		[PRUETH_QUEUE1] = {
+			P2_Q1_BUFFER_OFFSET,
+			P2_Q1_BUFFER_OFFSET + ((QUEUE_1_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P2_Q1_BD_OFFSET,
+			P2_Q1_BD_OFFSET + ((QUEUE_1_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE2] = {
+			P2_Q2_BUFFER_OFFSET,
+			P2_Q2_BUFFER_OFFSET + ((QUEUE_2_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P2_Q2_BD_OFFSET,
+			P2_Q2_BD_OFFSET + ((QUEUE_2_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE3] = {
+			P2_Q3_BUFFER_OFFSET,
+			P2_Q3_BUFFER_OFFSET + ((QUEUE_3_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P2_Q3_BD_OFFSET,
+			P2_Q3_BD_OFFSET + ((QUEUE_3_SIZE - 1) * BD_SIZE),
+		},
+		[PRUETH_QUEUE4] = {
+			P2_Q4_BUFFER_OFFSET,
+			P2_Q4_BUFFER_OFFSET + ((QUEUE_4_SIZE - 1) *
+					ICSS_BLOCK_SIZE),
+			P2_Q4_BD_OFFSET,
+			P2_Q4_BD_OFFSET + ((QUEUE_4_SIZE - 1) * BD_SIZE),
+		},
+	},
+};
+
+static const struct prueth_queue_desc queue_descs[][NUM_QUEUES] = {
+	[PRUETH_PORT_QUEUE_HOST] = {
+		{ .rd_ptr = P0_Q1_BD_OFFSET, .wr_ptr = P0_Q1_BD_OFFSET, },
+		{ .rd_ptr = P0_Q2_BD_OFFSET, .wr_ptr = P0_Q2_BD_OFFSET, },
+		{ .rd_ptr = P0_Q3_BD_OFFSET, .wr_ptr = P0_Q3_BD_OFFSET, },
+		{ .rd_ptr = P0_Q4_BD_OFFSET, .wr_ptr = P0_Q4_BD_OFFSET, },
+	},
+	[PRUETH_PORT_QUEUE_MII0] = {
+		{ .rd_ptr = P1_Q1_BD_OFFSET, .wr_ptr = P1_Q1_BD_OFFSET, },
+		{ .rd_ptr = P1_Q2_BD_OFFSET, .wr_ptr = P1_Q2_BD_OFFSET, },
+		{ .rd_ptr = P1_Q3_BD_OFFSET, .wr_ptr = P1_Q3_BD_OFFSET, },
+		{ .rd_ptr = P1_Q4_BD_OFFSET, .wr_ptr = P1_Q4_BD_OFFSET, },
+	},
+	[PRUETH_PORT_QUEUE_MII1] = {
+		{ .rd_ptr = P2_Q1_BD_OFFSET, .wr_ptr = P2_Q1_BD_OFFSET, },
+		{ .rd_ptr = P2_Q2_BD_OFFSET, .wr_ptr = P2_Q2_BD_OFFSET, },
+		{ .rd_ptr = P2_Q3_BD_OFFSET, .wr_ptr = P2_Q3_BD_OFFSET, },
+		{ .rd_ptr = P2_Q4_BD_OFFSET, .wr_ptr = P2_Q4_BD_OFFSET, },
+	}
+};
+
+static void icssm_prueth_hostconfig(struct prueth *prueth)
+{
+	void __iomem *sram_base = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+	void __iomem *sram;
+
+	/* queue size lookup table */
+	sram = sram_base + HOST_QUEUE_SIZE_ADDR;
+	writew(HOST_QUEUE_1_SIZE, sram);
+	writew(HOST_QUEUE_2_SIZE, sram + 2);
+	writew(HOST_QUEUE_3_SIZE, sram + 4);
+	writew(HOST_QUEUE_4_SIZE, sram + 6);
+
+	/* queue information table */
+	sram = sram_base + HOST_Q1_RX_CONTEXT_OFFSET;
+	memcpy_toio(sram, queue_infos[PRUETH_PORT_QUEUE_HOST],
+		    sizeof(queue_infos[PRUETH_PORT_QUEUE_HOST]));
+
+	/* buffer offset table */
+	sram = sram_base + HOST_QUEUE_OFFSET_ADDR;
+	writew(P0_Q1_BUFFER_OFFSET, sram);
+	writew(P0_Q2_BUFFER_OFFSET, sram + 2);
+	writew(P0_Q3_BUFFER_OFFSET, sram + 4);
+	writew(P0_Q4_BUFFER_OFFSET, sram + 6);
+
+	/* buffer descriptor offset table*/
+	sram = sram_base + HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR;
+	writew(P0_Q1_BD_OFFSET, sram);
+	writew(P0_Q2_BD_OFFSET, sram + 2);
+	writew(P0_Q3_BD_OFFSET, sram + 4);
+	writew(P0_Q4_BD_OFFSET, sram + 6);
+
+	/* queue table */
+	sram = sram_base + HOST_QUEUE_DESC_OFFSET;
+	memcpy_toio(sram, queue_descs[PRUETH_PORT_QUEUE_HOST],
+		    sizeof(queue_descs[PRUETH_PORT_QUEUE_HOST]));
+}
+
+static void icssm_prueth_mii_init(struct prueth *prueth)
+{
+	struct regmap *mii_rt;
+	u32 rxcfg_reg, rxcfg;
+	u32 txcfg_reg, txcfg;
+
+	mii_rt = prueth->mii_rt;
+
+	rxcfg = PRUSS_MII_RT_RXCFG_RX_ENABLE |
+		PRUSS_MII_RT_RXCFG_RX_DATA_RDY_MODE_DIS |
+		PRUSS_MII_RT_RXCFG_RX_L2_EN |
+		PRUSS_MII_RT_RXCFG_RX_CUT_PREAMBLE |
+		PRUSS_MII_RT_RXCFG_RX_L2_EOF_SCLR_DIS;
+
+	/* Configuration of Port 0 Rx */
+	rxcfg_reg = PRUSS_MII_RT_RXCFG0;
+
+	regmap_write(mii_rt, rxcfg_reg, rxcfg);
+
+	/* Configuration of Port 1 Rx */
+	rxcfg_reg = PRUSS_MII_RT_RXCFG1;
+
+	rxcfg |= PRUSS_MII_RT_RXCFG_RX_MUX_SEL;
+
+	regmap_write(mii_rt, rxcfg_reg, rxcfg);
+
+	txcfg = PRUSS_MII_RT_TXCFG_TX_ENABLE |
+		PRUSS_MII_RT_TXCFG_TX_AUTO_PREAMBLE |
+		PRUSS_MII_RT_TXCFG_TX_32_MODE_EN |
+		(TX_START_DELAY << PRUSS_MII_RT_TXCFG_TX_START_DELAY_SHIFT) |
+		(TX_CLK_DELAY_100M << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT);
+
+	/* Configuration of Port 0 Tx */
+	txcfg_reg = PRUSS_MII_RT_TXCFG0;
+
+	regmap_write(mii_rt, txcfg_reg, txcfg);
+
+	txcfg	|= PRUSS_MII_RT_TXCFG_TX_MUX_SEL;
+
+	/* Configuration of Port 1 Tx */
+	txcfg_reg = PRUSS_MII_RT_TXCFG1;
+
+	regmap_write(mii_rt, txcfg_reg, txcfg);
+
+	txcfg_reg = PRUSS_MII_RT_RX_FRMS0;
+
+	/* Min frame length should be set to 64 to allow receive of standard
+	 * Ethernet frames such as PTP, LLDP that will not have the tag/rct.
+	 * Actual size written to register is size - 1 per TRM. This also
+	 * includes CRC/FCS.
+	 */
+	txcfg = (((PRUSS_MII_RT_RX_FRMS_MIN_FRM - 1) <<
+			PRUSS_MII_RT_RX_FRMS_MIN_FRM_SHIFT) &
+			PRUSS_MII_RT_RX_FRMS_MIN_FRM_MASK);
+
+	/* For EMAC, set Max frame size to 1528 i.e size with VLAN.
+	 * Actual size written to register is size - 1 as per TRM.
+	 * Since driver support run time change of protocol, driver
+	 * must overwrite the values based on Ethernet type.
+	 */
+	txcfg |= (((PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC - 1) <<
+			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT)	&
+			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK);
+
+	regmap_write(mii_rt, txcfg_reg, txcfg);
+
+	txcfg_reg = PRUSS_MII_RT_RX_FRMS1;
+
+	regmap_write(mii_rt, txcfg_reg, txcfg);
+}
+
+static void icssm_prueth_clearmem(struct prueth *prueth, enum prueth_mem region)
+{
+	memset_io(prueth->mem[region].va, 0, prueth->mem[region].size);
+}
+
+static void icssm_prueth_hostinit(struct prueth *prueth)
+{
+	/* Clear shared RAM */
+	icssm_prueth_clearmem(prueth, PRUETH_MEM_SHARED_RAM);
+
+	/* Clear OCMC RAM */
+	icssm_prueth_clearmem(prueth, PRUETH_MEM_OCMC);
+
+	/* Clear data RAMs */
+	if (prueth->eth_node[PRUETH_MAC0])
+		icssm_prueth_clearmem(prueth, PRUETH_MEM_DRAM0);
+	if (prueth->eth_node[PRUETH_MAC1])
+		icssm_prueth_clearmem(prueth, PRUETH_MEM_DRAM1);
+
+	/* Initialize host queues in shared RAM */
+	icssm_prueth_hostconfig(prueth);
+
+	/* Configure MII_RT */
+	icssm_prueth_mii_init(prueth);
+}
+
+/* This function initialize the driver in EMAC or HSR or PRP mode
+ * based on eth_type
+ */
+static void icssm_prueth_init_ethernet_mode(struct prueth *prueth)
+{
+	icssm_prueth_hostinit(prueth);
+}
+
+static int icssm_prueth_emac_config(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+
+	/* PRU needs local shared RAM address for C28 */
+	u32 sharedramaddr = ICSS_LOCAL_SHARED_RAM;
+
+	/* PRU needs real global OCMC address for C30*/
+	u32 ocmcaddr = (u32)prueth->mem[PRUETH_MEM_OCMC].pa;
+	void __iomem *dram_base;
+	void __iomem *mac_addr;
+	void __iomem *dram;
+
+	/* Clear data RAM */
+	icssm_prueth_clearmem(prueth, emac->dram);
+
+	dram_base = prueth->mem[emac->dram].va;
+
+	/* setup mac address */
+	mac_addr = dram_base + PORT_MAC_ADDR;
+	memcpy_toio(mac_addr, emac->mac_addr, 6);
+
+	/* queue information table */
+	dram = dram_base + TX_CONTEXT_Q1_OFFSET_ADDR;
+	memcpy_toio(dram, queue_infos[emac->port_id],
+		    sizeof(queue_infos[emac->port_id]));
+
+	/* queue table */
+	dram = dram_base + PORT_QUEUE_DESC_OFFSET;
+	memcpy_toio(dram, queue_descs[emac->port_id],
+		    sizeof(queue_descs[emac->port_id]));
+
+	/* Set in constant table C28 of PRU0 to ICSS Shared memory */
+	pru_rproc_set_ctable(emac->pru, PRU_C28, sharedramaddr);
+
+	/* Set in constant table C30 of PRU0 to OCMC memory */
+	pru_rproc_set_ctable(emac->pru, PRU_C30, ocmcaddr);
+
+	return 0;
+}
 
 /* called back by PHY layer if there is change in link state of hw port*/
 static void icssm_emac_adjust_link(struct net_device *ndev)
@@ -117,15 +427,24 @@ static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
 static int icssm_emac_ndo_open(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth *prueth = emac->prueth;
 	int ret;
 
+	/* set h/w MAC as user might have re-configured */
+	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
+
+	if (!prueth->emac_configured)
+		icssm_prueth_init_ethernet_mode(prueth);
+
+	icssm_prueth_emac_config(emac);
+
 	ret = icssm_emac_set_boot_pru(emac, ndev);
 	if (ret)
 		netdev_err(ndev, "failed to boot PRU: %d\n", ret);
 
 	/* start PHY */
 	phy_start(emac->phydev);
-
+	prueth->emac_configured |= BIT(emac->port_id);
 	return 0;
 }
 
@@ -221,9 +540,11 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 	/* by default eth_type is EMAC */
 	switch (port) {
 	case PRUETH_PORT_MII0:
+		emac->dram = PRUETH_MEM_DRAM0;
 		emac->pru = prueth->pru0;
 		break;
 	case PRUETH_PORT_MII1:
+		emac->dram = PRUETH_MEM_DRAM1;
 		emac->pru = prueth->pru1;
 		break;
 	default:
@@ -292,6 +613,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct prueth *prueth;
+	struct pruss *pruss;
 	int i, ret;
 
 	np = dev->of_node;
@@ -357,6 +679,12 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	prueth->eth_node[PRUETH_MAC0] = eth0_node;
 	prueth->eth_node[PRUETH_MAC1] = eth1_node;
 
+	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
+	if (IS_ERR(prueth->mii_rt)) {
+		dev_err(dev, "couldn't get mii-rt syscon regmap\n");
+		return -ENODEV;
+	}
+
 	if (eth0_node) {
 		prueth->pru0 = pru_rproc_get(np, 0, &pruss_id0);
 		if (IS_ERR(prueth->pru0)) {
@@ -377,6 +705,70 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		}
 	}
 
+	pruss = pruss_get(prueth->pru0 ? prueth->pru0 : prueth->pru1);
+	if (IS_ERR(pruss)) {
+		ret = PTR_ERR(pruss);
+		dev_err(dev, "unable to get pruss handle\n");
+		goto put_pru;
+	}
+	prueth->pruss = pruss;
+
+	ret = pruss_cfg_ocp_master_ports(prueth->pruss, 1);
+	if (ret) {
+		dev_err(dev, "couldn't enabled ocp master port: %d\n", ret);
+		goto put_pruss;
+	}
+
+	/* Configure PRUSS */
+	if (eth0_node)
+		pruss_cfg_gpimode(pruss, pruss_id0, PRUSS_GPI_MODE_MII);
+	if (eth1_node)
+		pruss_cfg_gpimode(pruss, pruss_id1, PRUSS_GPI_MODE_MII);
+	pruss_cfg_miirt_enable(pruss, true);
+	pruss_cfg_xfr_enable(pruss, PRU_TYPE_PRU, true);
+
+	/* Get PRUSS mem resources */
+	/* OCMC is system resource which we get separately */
+	for (i = 0; i < ARRAY_SIZE(pruss_mem_ids); i++) {
+		/* skip appropriate DRAM if not required */
+		if (!eth0_node && i == PRUETH_MEM_DRAM0)
+			continue;
+
+		if (!eth1_node && i == PRUETH_MEM_DRAM1)
+			continue;
+
+		ret = pruss_request_mem_region(pruss, pruss_mem_ids[i],
+					       &prueth->mem[i]);
+		if (ret) {
+			dev_err(dev, "unable to get PRUSS resource %d: %d\n",
+				i, ret);
+			goto put_mem;
+		}
+	}
+
+	prueth->sram_pool = of_gen_pool_get(np, "sram", 0);
+	if (!prueth->sram_pool) {
+		dev_err(dev, "unable to get SRAM pool\n");
+		ret = -ENODEV;
+		goto put_mem;
+	}
+	prueth->mem[PRUETH_MEM_OCMC].va =
+			(void __iomem *)gen_pool_alloc(prueth->sram_pool,
+						       OCMC_RAM_SIZE);
+	if (!prueth->mem[PRUETH_MEM_OCMC].va) {
+		dev_err(dev, "unable to allocate OCMC resource\n");
+		ret = -ENOMEM;
+		goto put_mem;
+	}
+	prueth->mem[PRUETH_MEM_OCMC].pa = gen_pool_virt_to_phys
+		(prueth->sram_pool, (unsigned long)
+		 prueth->mem[PRUETH_MEM_OCMC].va);
+	prueth->mem[PRUETH_MEM_OCMC].size = OCMC_RAM_SIZE;
+	dev_dbg(dev, "ocmc: pa %pa va %p size %#zx\n",
+		&prueth->mem[PRUETH_MEM_OCMC].pa,
+		prueth->mem[PRUETH_MEM_OCMC].va,
+		prueth->mem[PRUETH_MEM_OCMC].size);
+
 	/* setup netdev interfaces */
 	if (eth0_node) {
 		ret = icssm_prueth_netdev_init(prueth, eth0_node);
@@ -385,7 +777,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 				dev_err(dev, "netdev init %s failed: %d\n",
 					eth0_node->name, ret);
 			}
-			goto put_pru;
+			goto free_pool;
 		}
 	}
 
@@ -423,6 +815,9 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 			prueth->emac[PRUETH_MAC1]->ndev;
 	}
 
+	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
+		 (!eth0_node || !eth1_node) ? "single" : "dual");
+
 	if (eth1_node)
 		of_node_put(eth1_node);
 	if (eth0_node)
@@ -445,6 +840,21 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		icssm_prueth_netdev_exit(prueth, eth_node);
 	}
 
+free_pool:
+	gen_pool_free(prueth->sram_pool,
+		      (unsigned long)prueth->mem[PRUETH_MEM_OCMC].va,
+		      OCMC_RAM_SIZE);
+
+put_mem:
+	pruss_cfg_ocp_master_ports(prueth->pruss, 0);
+	for (i = PRUETH_MEM_DRAM0; i < PRUETH_MEM_OCMC; i++) {
+		if (prueth->mem[i].va)
+			pruss_release_mem_region(pruss, &prueth->mem[i]);
+	}
+
+put_pruss:
+	pruss_put(prueth->pruss);
+
 put_pru:
 	if (eth1_node) {
 		if (prueth->pru1)
@@ -482,6 +892,16 @@ static void icssm_prueth_remove(struct platform_device *pdev)
 		of_node_put(eth_node);
 	}
 
+	gen_pool_free(prueth->sram_pool,
+		      (unsigned long)prueth->mem[PRUETH_MEM_OCMC].va,
+		      OCMC_RAM_SIZE);
+
+	for (i = PRUETH_MEM_DRAM0; i < PRUETH_MEM_OCMC; i++) {
+		if (prueth->mem[i].va)
+			pruss_release_mem_region(prueth->pruss,
+						 &prueth->mem[i]);
+	}
+
 	pruss_put(prueth->pruss);
 
 	if (prueth->eth_node[PRUETH_MAC0])
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
index 7f857edc6eb2..6aaceb418f12 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
@@ -13,6 +13,14 @@
 #include <linux/pruss_driver.h>
 #include <linux/remoteproc/pruss.h>
 
+#include "icssm_switch.h"
+
+/* ICSSM size of redundancy tag */
+#define ICSSM_LRE_TAG_SIZE	6
+
+/* PRUSS local memory map */
+#define ICSS_LOCAL_SHARED_RAM	0x00010000
+
 /* PRU Ethernet Type - Ethernet functionality (protocol
  * implemented) provided by the PRU firmware being loaded.
  */
@@ -24,6 +32,50 @@ enum pruss_ethtype {
 	PRUSS_ETHTYPE_MAX,
 };
 
+#define PRUETH_IS_EMAC(p)	((p)->eth_type == PRUSS_ETHTYPE_EMAC)
+#define PRUETH_IS_SWITCH(p)	((p)->eth_type == PRUSS_ETHTYPE_SWITCH)
+
+/**
+ * struct prueth_queue_desc - Queue descriptor
+ * @rd_ptr:	Read pointer, points to a buffer descriptor in Shared PRU RAM.
+ * @wr_ptr:	Write pointer, points to a buffer descriptor in Shared PRU RAM.
+ * @busy_s:	Slave queue busy flag, set by slave(us) to request access from
+ *		master(PRU).
+ * @status:	Bit field status register, Bits:
+ *			0: Master queue busy flag.
+ *			1: Packet has been placed in collision queue.
+ *			2: Packet has been discarded due to overflow.
+ * @max_fill_level:	Maximum queue usage seen.
+ * @overflow_cnt:	Count of queue overflows.
+ *
+ * Each port has up to 4 queues with variable length. The queue is processed
+ * as ring buffer with read and write pointers. Both pointers are address
+ * pointers and increment by 4 for each buffer descriptor position. Queue has
+ * a length defined in constants and a status.
+ */
+struct prueth_queue_desc {
+	u16 rd_ptr;
+	u16 wr_ptr;
+	u8 busy_s;
+	u8 status;
+	u8 max_fill_level;
+	u8 overflow_cnt;
+} __packed;
+
+/**
+ * struct prueth_queue - Information about a queue in memory
+ * @buffer_offset: buffer offset in OCMC RAM
+ * @queue_desc_offset: queue descriptor offset in Shared RAM
+ * @buffer_desc_offset: buffer descriptors offset in Shared RAM
+ * @buffer_desc_end: end address of buffer descriptors in Shared RAM
+ */
+struct prueth_queue_info {
+	u16 buffer_offset;
+	u16 queue_desc_offset;
+	u16 buffer_desc_offset;
+	u16 buffer_desc_end;
+} __packed;
+
 /* In switch mode there are 3 real ports i.e. 3 mac addrs.
  * however Linux sees only the host side port. The other 2 ports
  * are the switch ports.
@@ -44,6 +96,34 @@ enum prueth_mac {
 	PRUETH_MAC_INVALID,
 };
 
+/* In both switch & emac modes there are 3 port queues
+ * EMAC mode:
+ *     RX packets for both MII0 & MII1 ports come on
+ *     QUEUE_HOST.
+ *     TX packets for MII0 go on QUEUE_MII0, TX packets
+ *     for MII1 go on QUEUE_MII1.
+ * Switch mode:
+ *     Host port RX packets come on QUEUE_HOST
+ *     TX packets might have to go on MII0 or MII1 or both.
+ *     MII0 TX queue is QUEUE_MII0 and MII1 TX queue is
+ *     QUEUE_MII1.
+ */
+enum prueth_port_queue_id {
+	PRUETH_PORT_QUEUE_HOST = 0,
+	PRUETH_PORT_QUEUE_MII0,
+	PRUETH_PORT_QUEUE_MII1,
+	PRUETH_PORT_QUEUE_MAX,
+};
+
+/* Each port queue has 4 queues and 1 collision queue */
+enum prueth_queue_id {
+	PRUETH_QUEUE1 = 0,
+	PRUETH_QUEUE2,
+	PRUETH_QUEUE3,
+	PRUETH_QUEUE4,
+	PRUETH_COLQUEUE,        /* collision queue */
+};
+
 /**
  * struct prueth_firmware - PRU Ethernet FW data
  * @fw_name: firmware names of firmware to run on PRU
@@ -52,6 +132,15 @@ struct prueth_firmware {
 	const char *fw_name[PRUSS_ETHTYPE_MAX];
 };
 
+/* PRUeth memory range identifiers */
+enum prueth_mem {
+	PRUETH_MEM_DRAM0 = 0,
+	PRUETH_MEM_DRAM1,
+	PRUETH_MEM_SHARED_RAM,
+	PRUETH_MEM_OCMC,
+	PRUETH_MEM_MAX,
+};
+
 /**
  * struct prueth_private_data - PRU Ethernet private data
  * @fw_pru: firmware names to be used for PRUSS ethernet usecases
@@ -77,6 +166,7 @@ struct prueth_emac {
 	int duplex;
 
 	enum prueth_port port_id;
+	enum prueth_mem dram;
 	const char *phy_id;
 	u8 mac_addr[6];
 	phy_interface_t phy_if;
@@ -87,6 +177,9 @@ struct prueth {
 	struct device *dev;
 	struct pruss *pruss;
 	struct rproc *pru0, *pru1;
+	struct pruss_mem_region mem[PRUETH_MEM_MAX];
+	struct gen_pool *sram_pool;
+	struct regmap *mii_rt;
 
 	const struct prueth_private_data *fw_data;
 	struct prueth_fw_offsets *fw_offsets;
@@ -96,5 +189,6 @@ struct prueth {
 	struct net_device *registered_netdevs[PRUETH_NUM_MACS];
 
 	unsigned int eth_type;
+	u8 emac_configured;
 };
 #endif /* __NET_TI_PRUETH_H */
diff --git a/drivers/net/ethernet/ti/icssm/icssm_switch.h b/drivers/net/ethernet/ti/icssm/icssm_switch.h
new file mode 100644
index 000000000000..b13e0706ccec
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssm/icssm_switch.h
@@ -0,0 +1,257 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright (C) 2015-2021 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#ifndef __ICSS_SWITCH_H
+#define __ICSS_SWITCH_H
+
+/* Basic Switch Parameters
+ * Used to auto compute offset addresses on L3 OCMC RAM. Do not modify these
+ * without changing firmware accordingly
+ */
+#define SWITCH_BUFFER_SIZE	(64 * 1024)	/* L3 buffer */
+#define ICSS_BLOCK_SIZE		32		/* data bytes per BD */
+#define BD_SIZE			4		/* byte buffer descriptor */
+#define NUM_QUEUES		4		/* Queues on Port 0/1/2 */
+
+#define PORT_LINK_MASK		0x1
+#define PORT_IS_HD_MASK		0x2
+
+/* Physical Port queue size (number of BDs). Same for both ports */
+#define QUEUE_1_SIZE		97	/* Network Management high */
+#define QUEUE_2_SIZE		97	/* Network Management low */
+#define QUEUE_3_SIZE		97	/* Protocol specific */
+#define QUEUE_4_SIZE		97	/* NRT (IP,ARP, ICMP) */
+
+/* Host queue size (number of BDs). Each BD points to data buffer of 32 bytes.
+ * HOST PORT QUEUES can buffer up to 4 full sized frames per queue
+ */
+#define	HOST_QUEUE_1_SIZE	194	/* Protocol and VLAN priority 7 & 6 */
+#define HOST_QUEUE_2_SIZE	194	/* Protocol mid */
+#define HOST_QUEUE_3_SIZE	194	/* Protocol low */
+#define HOST_QUEUE_4_SIZE	194	/* NRT (IP, ARP, ICMP) */
+
+#define COL_QUEUE_SIZE		0
+
+/* NRT Buffer descriptor definition
+ * Each buffer descriptor points to a max 32 byte block and has 32 bit in size
+ * to have atomic operation.
+ * PRU can address bytewise into memory.
+ * Definition of 32 bit descriptor is as follows
+ *
+ * Bits		Name			Meaning
+ * =============================================================================
+ * 0..7		Index		points to index in buffer queue, max 256 x 32
+ *				byte blocks can be addressed
+ * 6		LookupSuccess	For switch, FDB lookup was successful (source
+ *				MAC address found in FDB).
+ *				For RED, NodeTable lookup was successful.
+ * 7		Flood		Packet should be flooded (destination MAC
+ *				address found in FDB). For switch only.
+ * 8..12	Block_length	number of valid bytes in this specific block.
+ *				Will be <=32 bytes on last block of packet
+ * 13		More		"More" bit indicating that there are more blocks
+ * 14		Shadow		indicates that "index" is pointing into shadow
+ *				buffer
+ * 15		TimeStamp	indicates that this packet has time stamp in
+ *				separate buffer - only needed of PTCP runs on
+ *				host
+ * 16..17	Port		different meaning for ingress and egress,
+ *				Ingress: Port = 0 indicates phy port 1 and
+ *				Port = 1 indicates phy port 2.
+ *				Egress: 0 sends on phy port 1 and 1 sends on
+ *				phy port 2. Port = 2 goes over MAC table
+ *				look-up
+ * 18..28	Length		11 bit of total packet length which is put into
+ *				first BD only so that host access only one BD
+ * 29		VlanTag		indicates that packet has Length/Type field of
+ *				0x08100 with VLAN tag in following byte
+ * 30		Broadcast	indicates that packet goes out on both physical
+ *				ports,	there will be two bd but only one buffer
+ * 31		Error		indicates there was an error in the packet
+ */
+#define PRUETH_BD_START_FLAG_MASK	BIT(0)
+#define PRUETH_BD_START_FLAG_SHIFT	0
+
+#define PRUETH_BD_HSR_FRAME_MASK	BIT(4)
+#define PRUETH_BD_HSR_FRAME_SHIFT	4
+
+#define PRUETH_BD_SUP_HSR_FRAME_MASK	BIT(5)
+#define PRUETH_BD_SUP_HSR_FRAME_SHIFT	5
+
+#define PRUETH_BD_LOOKUP_SUCCESS_MASK	BIT(6)
+#define PRUETH_BD_LOOKUP_SUCCESS_SHIFT	6
+
+#define PRUETH_BD_SW_FLOOD_MASK		BIT(7)
+#define PRUETH_BD_SW_FLOOD_SHIFT	7
+
+#define	PRUETH_BD_SHADOW_MASK		BIT(14)
+#define	PRUETH_BD_SHADOW_SHIFT		14
+
+#define PRUETH_BD_TIMESTAMP_MASK	BIT(15)
+#define PRUETH_BD_TIMESTAMP_SHIT	15
+
+#define PRUETH_BD_PORT_MASK		GENMASK(17, 16)
+#define PRUETH_BD_PORT_SHIFT		16
+
+#define PRUETH_BD_LENGTH_MASK		GENMASK(28, 18)
+#define PRUETH_BD_LENGTH_SHIFT		18
+
+#define PRUETH_BD_BROADCAST_MASK	BIT(30)
+#define PRUETH_BD_BROADCAST_SHIFT	30
+
+#define PRUETH_BD_ERROR_MASK		BIT(31)
+#define PRUETH_BD_ERROR_SHIFT		31
+
+/* The following offsets indicate which sections of the memory are used
+ * for EMAC internal tasks
+ */
+#define DRAM_START_OFFSET		0x1E98
+#define SRAM_START_OFFSET		0x400
+
+/* General Purpose Statistics
+ * These are present on both PRU0 and PRU1 DRAM
+ */
+/* base statistics offset */
+#define STATISTICS_OFFSET	0x1F00
+#define STAT_SIZE		0x98
+
+/* Offset for storing
+ * 1. Storm Prevention Params
+ * 2. PHY Speed Offset
+ * 3. Port Status Offset
+ * These are present on both PRU0 and PRU1
+ */
+/* 4 bytes */
+#define STORM_PREVENTION_OFFSET_BC	(STATISTICS_OFFSET + STAT_SIZE)
+/* 4 bytes */
+#define PHY_SPEED_OFFSET		(STATISTICS_OFFSET + STAT_SIZE + 4)
+/* 1 byte */
+#define PORT_STATUS_OFFSET		(STATISTICS_OFFSET + STAT_SIZE + 8)
+/* 1 byte */
+#define COLLISION_COUNTER		(STATISTICS_OFFSET + STAT_SIZE + 9)
+/* 4 bytes */
+#define RX_PKT_SIZE_OFFSET		(STATISTICS_OFFSET + STAT_SIZE + 10)
+/* 4 bytes */
+#define PORT_CONTROL_ADDR		(STATISTICS_OFFSET + STAT_SIZE + 14)
+/* 6 bytes */
+#define PORT_MAC_ADDR			(STATISTICS_OFFSET + STAT_SIZE + 18)
+/* 1 byte */
+#define RX_INT_STATUS_OFFSET		(STATISTICS_OFFSET + STAT_SIZE + 24)
+/* 4 bytes */
+#define STORM_PREVENTION_OFFSET_MC	(STATISTICS_OFFSET + STAT_SIZE + 25)
+/* 4 bytes */
+#define STORM_PREVENTION_OFFSET_UC	(STATISTICS_OFFSET + STAT_SIZE + 29)
+/* 4 bytes ? */
+#define STP_INVALID_STATE_OFFSET	(STATISTICS_OFFSET + STAT_SIZE + 33)
+
+/* DRAM Offsets for EMAC
+ * Present on Both DRAM0 and DRAM1
+ */
+
+/* 4 queue descriptors for port tx = 32 bytes */
+#define TX_CONTEXT_Q1_OFFSET_ADDR	(PORT_QUEUE_DESC_OFFSET + 32)
+#define PORT_QUEUE_DESC_OFFSET	(ICSS_EMAC_TTS_CYC_TX_SOF + 8)
+
+/* EMAC Time Triggered Send Offsets */
+#define ICSS_EMAC_TTS_CYC_TX_SOF	(ICSS_EMAC_TTS_PREV_TX_SOF + 8)
+#define ICSS_EMAC_TTS_PREV_TX_SOF	\
+	(ICSS_EMAC_TTS_MISSED_CYCLE_CNT_OFFSET	+ 4)
+#define ICSS_EMAC_TTS_MISSED_CYCLE_CNT_OFFSET	(ICSS_EMAC_TTS_STATUS_OFFSET \
+						 + 4)
+#define ICSS_EMAC_TTS_STATUS_OFFSET	(ICSS_EMAC_TTS_CFG_TIME_OFFSET + 4)
+#define ICSS_EMAC_TTS_CFG_TIME_OFFSET	(ICSS_EMAC_TTS_CYCLE_PERIOD_OFFSET + 4)
+#define ICSS_EMAC_TTS_CYCLE_PERIOD_OFFSET	\
+	(ICSS_EMAC_TTS_CYCLE_START_OFFSET + 8)
+#define ICSS_EMAC_TTS_CYCLE_START_OFFSET	ICSS_EMAC_TTS_BASE_OFFSET
+#define ICSS_EMAC_TTS_BASE_OFFSET	DRAM_START_OFFSET
+
+/* Shared RAM offsets for EMAC */
+
+/* Queue Descriptors */
+
+/* 4 queue descriptors for port 0 (host receive). 32 bytes */
+#define HOST_QUEUE_DESC_OFFSET		(HOST_QUEUE_SIZE_ADDR + 16)
+
+/* table offset for queue size:
+ * 3 ports * 4 Queues * 1 byte offset = 12 bytes
+ */
+#define HOST_QUEUE_SIZE_ADDR		(HOST_QUEUE_OFFSET_ADDR + 8)
+/* table offset for queue:
+ * 4 Queues * 2 byte offset = 8 bytes
+ */
+#define HOST_QUEUE_OFFSET_ADDR		(HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR + 8)
+/* table offset for Host queue descriptors:
+ * 1 ports * 4 Queues * 2 byte offset = 8 bytes
+ */
+#define HOST_QUEUE_DESCRIPTOR_OFFSET_ADDR	(HOST_Q4_RX_CONTEXT_OFFSET + 8)
+
+/* Host Port Rx Context */
+#define HOST_Q4_RX_CONTEXT_OFFSET	(HOST_Q3_RX_CONTEXT_OFFSET + 8)
+#define HOST_Q3_RX_CONTEXT_OFFSET	(HOST_Q2_RX_CONTEXT_OFFSET + 8)
+#define HOST_Q2_RX_CONTEXT_OFFSET	(HOST_Q1_RX_CONTEXT_OFFSET + 8)
+#define HOST_Q1_RX_CONTEXT_OFFSET	(EMAC_PROMISCUOUS_MODE_OFFSET + 4)
+
+/* Promiscuous mode control */
+#define EMAC_P1_PROMISCUOUS_BIT		BIT(0)
+#define EMAC_P2_PROMISCUOUS_BIT		BIT(1)
+#define EMAC_PROMISCUOUS_MODE_OFFSET	(EMAC_RESERVED + 4)
+#define EMAC_RESERVED			EOF_48K_BUFFER_BD
+
+/* allow for max 48k buffer which spans the descriptors up to 0x1800 6kB */
+#define EOF_48K_BUFFER_BD	(P0_BUFFER_DESC_OFFSET + HOST_BD_SIZE + \
+				 PORT_BD_SIZE)
+
+#define HOST_BD_SIZE		((HOST_QUEUE_1_SIZE +	\
+				  HOST_QUEUE_2_SIZE + HOST_QUEUE_3_SIZE + \
+				  HOST_QUEUE_4_SIZE) * BD_SIZE)
+#define PORT_BD_SIZE		((QUEUE_1_SIZE + QUEUE_2_SIZE +	\
+				  QUEUE_3_SIZE + QUEUE_4_SIZE) * 2 * BD_SIZE)
+
+#define END_OF_BD_POOL		(P2_Q4_BD_OFFSET + QUEUE_4_SIZE * BD_SIZE)
+#define P2_Q4_BD_OFFSET		(P2_Q3_BD_OFFSET + QUEUE_3_SIZE * BD_SIZE)
+#define P2_Q3_BD_OFFSET		(P2_Q2_BD_OFFSET + QUEUE_2_SIZE * BD_SIZE)
+#define P2_Q2_BD_OFFSET		(P2_Q1_BD_OFFSET + QUEUE_1_SIZE * BD_SIZE)
+#define P2_Q1_BD_OFFSET		(P1_Q4_BD_OFFSET + QUEUE_4_SIZE * BD_SIZE)
+#define P1_Q4_BD_OFFSET		(P1_Q3_BD_OFFSET + QUEUE_3_SIZE * BD_SIZE)
+#define P1_Q3_BD_OFFSET		(P1_Q2_BD_OFFSET + QUEUE_2_SIZE * BD_SIZE)
+#define P1_Q2_BD_OFFSET		(P1_Q1_BD_OFFSET + QUEUE_1_SIZE * BD_SIZE)
+#define P1_Q1_BD_OFFSET		(P0_Q4_BD_OFFSET + HOST_QUEUE_4_SIZE * BD_SIZE)
+#define P0_Q4_BD_OFFSET		(P0_Q3_BD_OFFSET + HOST_QUEUE_3_SIZE * BD_SIZE)
+#define P0_Q3_BD_OFFSET		(P0_Q2_BD_OFFSET + HOST_QUEUE_2_SIZE * BD_SIZE)
+#define P0_Q2_BD_OFFSET		(P0_Q1_BD_OFFSET + HOST_QUEUE_1_SIZE * BD_SIZE)
+#define P0_Q1_BD_OFFSET		P0_BUFFER_DESC_OFFSET
+#define P0_BUFFER_DESC_OFFSET	SRAM_START_OFFSET
+
+/* Memory Usage of L3 OCMC RAM */
+
+/* L3 64KB Memory - mainly buffer Pool */
+#define END_OF_BUFFER_POOL	(P2_Q4_BUFFER_OFFSET + QUEUE_4_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P2_Q4_BUFFER_OFFSET	(P2_Q3_BUFFER_OFFSET + QUEUE_3_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P2_Q3_BUFFER_OFFSET	(P2_Q2_BUFFER_OFFSET + QUEUE_2_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P2_Q2_BUFFER_OFFSET	(P2_Q1_BUFFER_OFFSET + QUEUE_1_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P2_Q1_BUFFER_OFFSET	(P1_Q4_BUFFER_OFFSET + QUEUE_4_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P1_Q4_BUFFER_OFFSET	(P1_Q3_BUFFER_OFFSET + QUEUE_3_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P1_Q3_BUFFER_OFFSET	(P1_Q2_BUFFER_OFFSET + QUEUE_2_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P1_Q2_BUFFER_OFFSET	(P1_Q1_BUFFER_OFFSET + QUEUE_1_SIZE *	\
+				 ICSS_BLOCK_SIZE)
+#define P1_Q1_BUFFER_OFFSET	(P0_Q4_BUFFER_OFFSET + HOST_QUEUE_4_SIZE * \
+				 ICSS_BLOCK_SIZE)
+#define P0_Q4_BUFFER_OFFSET	(P0_Q3_BUFFER_OFFSET + HOST_QUEUE_3_SIZE * \
+				 ICSS_BLOCK_SIZE)
+#define P0_Q3_BUFFER_OFFSET	(P0_Q2_BUFFER_OFFSET + HOST_QUEUE_2_SIZE * \
+				 ICSS_BLOCK_SIZE)
+#define P0_Q2_BUFFER_OFFSET	(P0_Q1_BUFFER_OFFSET + HOST_QUEUE_1_SIZE * \
+				 ICSS_BLOCK_SIZE)
+#define P0_COL_BUFFER_OFFSET	0xEE00
+#define P0_Q1_BUFFER_OFFSET	0x0000
+
+#endif /* __ICSS_SWITCH_H */
-- 
2.34.1


