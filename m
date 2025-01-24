Return-Path: <linux-omap+bounces-3210-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E6FA1B628
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 13:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F2533AB2E1
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 12:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56A821B1BF;
	Fri, 24 Jan 2025 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="GW0ENSsG"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518D621A422;
	Fri, 24 Jan 2025 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737722271; cv=none; b=LQi/qzxP738hkROu0k8NyCVHJ3h60GtP5ojlsDCIDOKGe/m25fyjETyTxCijYzabIkVdsj5s0sspjUPRNSQTneBmzMFUmyIyl1YG73JH1pdcsWYIqbz/tlFw5eVvn/9OlBoc0ADN2IO0W6ELnLpf+bc3NfhzuPES87q8JUTWn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737722271; c=relaxed/simple;
	bh=IEdqGpWBlO7BcdWmpHM6s/ypUwbyRvrlgR5CxA2anIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sokXIcV+9jQtsor6Id0t91WL7GYZQG339ta1r9KhPfi6orYRF8e/0bRvXirAHe6XsDB66b0ptGM9HTKy5WQQml+5a1yi9F6M6KDhwvJng7JnATVotGobptWhvh+k9DOlJHPAJITLK0XK4WqFQrga6ThN90KAVNPrp5PWlxzk0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=GW0ENSsG; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BKd69uRZUc8HDskr4h8ath83MaEEYQm7FQWqxS7CABk=; b=GW0ENSsG5ov/uD20URKbCKydaE
	4lpRtZ/K1Y1k9x7bpimdR3UxdqPLcNHc6fN9iFvsDS1ohjtzfQYd2pM8jhlqrJgNXXPuwdfFM1sHp
	WThOSsO3gKs2VV7u6DE2kJe+ZAeKGcFPnkdGvXMPsPIGHRr5Juf+F6mmOHcuC1W9S4UUKc1KpstYP
	gGtvdkVcoHg0miWRBxh4x3rmoLwRutjbRkq0eur8FtgU5nKRtVQSQULI0Eam2eBQHnOqK2WvOlJa5
	ue/dpSuURNnebuRbgOr+opticXB6to2iLy+mKeD8KdvsqsninU5LUGGEJSZf87HCd0uxoRZenhkMB
	6d7JbP8w==;
Received: from [122.175.9.182] (port=52302 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tbIwR-0004SM-2T;
	Fri, 24 Jan 2025 18:07:44 +0530
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
Subject: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX and TX support.
Date: Fri, 24 Jan 2025 18:07:01 +0530
Message-Id: <20250124123707.1457639-5-basharath@couthit.com>
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

Changes corresponding to link configuration such as speed and duplexity.
IRQ and handler initializations are performed for packet reception.Firmware
receives the packet from the wire and stores it into OCMC queue. Next, it
notifies the CPU via interrupt. Upon receiving the interrupt CPU will
service the IRQ and packet will be processed by pushing the newly allocated
SKB to upper layers.

When the user application want to transmit a packet, it will invoke
sys_send() which will inturn invoke the PRUETH driver, then it will write
the packet into OCMC queues. PRU firmware will pick up the packet and
transmit it on to the wire.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 599 ++++++++++++++++++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.h |  46 ++
 2 files changed, 640 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index 82ed0e3a0d88..0ba1d16a7a15 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -36,6 +36,13 @@
 #define TX_START_DELAY		0x40
 #define TX_CLK_DELAY_100M	0x6
 
+static inline void icssm_prueth_write_reg(struct prueth *prueth,
+					  enum prueth_mem region,
+					  unsigned int reg, u32 val)
+{
+	writel_relaxed(val, prueth->mem[region].va + reg);
+}
+
 /* Below macro is for 1528 Byte Frame support, to Allow even with
  * Redundancy tag
  */
@@ -299,18 +306,31 @@ static void icssm_prueth_init_ethernet_mode(struct prueth *prueth)
 	icssm_prueth_hostinit(prueth);
 }
 
-static int icssm_prueth_emac_config(struct prueth_emac *emac)
+static void icssm_prueth_port_enable(struct prueth_emac *emac, bool enable)
 {
 	struct prueth *prueth = emac->prueth;
+	void __iomem *port_ctrl;
+	void __iomem *ram;
 
-	/* PRU needs local shared RAM address for C28 */
-	u32 sharedramaddr = ICSS_LOCAL_SHARED_RAM;
+	ram = prueth->mem[emac->dram].va;
+	port_ctrl = ram + PORT_CONTROL_ADDR;
+	writeb(!!enable, port_ctrl);
+}
 
-	/* PRU needs real global OCMC address for C30*/
-	u32 ocmcaddr = (u32)prueth->mem[PRUETH_MEM_OCMC].pa;
+static int icssm_prueth_emac_config(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+	u32 sharedramaddr, ocmcaddr;
 	void __iomem *dram_base;
 	void __iomem *mac_addr;
 	void __iomem *dram;
+	void __iomem *sram;
+
+	/* PRU needs local shared RAM address for C28 */
+	sharedramaddr = ICSS_LOCAL_SHARED_RAM;
+	/* PRU needs real global OCMC address for C30*/
+	ocmcaddr = (u32)prueth->mem[PRUETH_MEM_OCMC].pa;
+	sram = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
 
 	/* Clear data RAM */
 	icssm_prueth_clearmem(prueth, emac->dram);
@@ -331,6 +351,9 @@ static int icssm_prueth_emac_config(struct prueth_emac *emac)
 	memcpy_toio(dram, queue_descs[emac->port_id],
 		    sizeof(queue_descs[emac->port_id]));
 
+	emac->rx_queue_descs = sram + HOST_QUEUE_DESC_OFFSET;
+	emac->tx_queue_descs = dram;
+
 	/* Set in constant table C28 of PRU0 to ICSS Shared memory */
 	pru_rproc_set_ctable(emac->pru, PRU_C28, sharedramaddr);
 
@@ -340,6 +363,40 @@ static int icssm_prueth_emac_config(struct prueth_emac *emac)
 	return 0;
 }
 
+/* update phy/port status information for firmware */
+static void icssm_emac_update_phystatus(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+	u32 phy_speed, port_status = 0;
+	enum prueth_mem region;
+	u32 delay;
+
+	region = emac->dram;
+	phy_speed = emac->speed;
+	icssm_prueth_write_reg(prueth, region, PHY_SPEED_OFFSET, phy_speed);
+
+	delay = TX_CLK_DELAY_100M;
+
+	delay = delay << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT;
+
+	if (emac->port_id) {
+		regmap_update_bits(prueth->mii_rt,
+				   PRUSS_MII_RT_TXCFG1,
+				   PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
+				   delay);
+	} else {
+		regmap_update_bits(prueth->mii_rt,
+				   PRUSS_MII_RT_TXCFG0,
+				   PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
+				   delay);
+	}
+
+	if (emac->link)
+		port_status |= PORT_LINK_MASK;
+
+	writeb(port_status, prueth->mem[region].va + PORT_STATUS_OFFSET);
+}
+
 /* called back by PHY layer if there is change in link state of hw port*/
 static void icssm_emac_adjust_link(struct net_device *ndev)
 {
@@ -369,6 +426,8 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
 		emac->link = 0;
 	}
 
+	icssm_emac_update_phystatus(emac);
+
 	if (new_state)
 		phy_print_status(phydev);
 
@@ -384,6 +443,374 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
 	spin_unlock_irqrestore(&emac->lock, flags);
 }
 
+/**
+ * icssm_prueth_tx_enqueue - queue a packet to firmware for transmission
+ *
+ * @emac: EMAC data structure
+ * @skb: packet data buffer
+ * @queue_id: priority queue id
+ *
+ * Return: 0 (Success)
+ */
+static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
+				   struct sk_buff *skb,
+				   enum prueth_queue_id queue_id)
+{
+	struct prueth_queue_desc __iomem *queue_desc;
+	const struct prueth_queue_info *txqueue;
+	u16 bd_rd_ptr, bd_wr_ptr, update_wr_ptr;
+	struct net_device *ndev = emac->ndev;
+	unsigned int buffer_desc_count;
+	int free_blocks, update_block;
+	bool buffer_wrapped = false;
+	int write_block, read_block;
+	void *src_addr, *dst_addr;
+	int pkt_block_size;
+	void __iomem *dram;
+	int txport, pktlen;
+	u32 wr_buf_desc;
+	void *ocmc_ram;
+
+	dram = emac->prueth->mem[emac->dram].va;
+	if (eth_skb_pad(skb)) {
+		if (netif_msg_tx_err(emac) && net_ratelimit())
+			netdev_err(ndev, "packet pad failed\n");
+		return -ENOMEM;
+	}
+
+	/* which port to tx: MII0 or MII1 */
+	txport = emac->tx_port_queue;
+	src_addr = skb->data;
+	pktlen = skb->len;
+	/* Get the tx queue */
+	queue_desc = emac->tx_queue_descs + queue_id;
+	txqueue = &queue_infos[txport][queue_id];
+
+	buffer_desc_count = txqueue->buffer_desc_end -
+			    txqueue->buffer_desc_offset;
+	buffer_desc_count /= BD_SIZE;
+	buffer_desc_count++;
+
+	bd_rd_ptr = readw(&queue_desc->rd_ptr);
+	bd_wr_ptr = readw(&queue_desc->wr_ptr);
+
+	/* the PRU firmware deals mostly in pointers already
+	 * offset into ram, we would like to deal in indexes
+	 * within the queue we are working with for code
+	 * simplicity, calculate this here
+	 */
+	write_block = (bd_wr_ptr - txqueue->buffer_desc_offset) / BD_SIZE;
+	read_block = (bd_rd_ptr - txqueue->buffer_desc_offset) / BD_SIZE;
+	if (write_block > read_block) {
+		free_blocks = buffer_desc_count - write_block;
+		free_blocks += read_block;
+	} else if (write_block < read_block) {
+		free_blocks = read_block - write_block;
+	} else { /* they are all free */
+		free_blocks = buffer_desc_count;
+	}
+
+	pkt_block_size = DIV_ROUND_UP(pktlen, ICSS_BLOCK_SIZE);
+	if (pkt_block_size > free_blocks) /* out of queue space */
+		return -ENOBUFS;
+
+	/* calculate end BD address post write */
+	update_block = write_block + pkt_block_size;
+
+	/* Check for wrap around */
+	if (update_block >= buffer_desc_count) {
+		update_block %= buffer_desc_count;
+		buffer_wrapped = true;
+	}
+
+	/* OCMC RAM is not cached and write order is not important */
+	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
+	dst_addr = ocmc_ram + txqueue->buffer_offset +
+		   (write_block * ICSS_BLOCK_SIZE);
+
+	/* Copy the data from socket buffer(DRAM) to PRU buffers(OCMC) */
+	if (buffer_wrapped) { /* wrapped around buffer */
+		int bytes = (buffer_desc_count - write_block) * ICSS_BLOCK_SIZE;
+		int remaining;
+
+		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
+		 * entire packet may have fit within the last BD
+		 * if pkt_info.length is not integral multiple of
+		 * ICSS_BLOCK_SIZE
+		 */
+		if (pktlen < bytes)
+			bytes = pktlen;
+
+		/* copy non-wrapped part */
+		memcpy(dst_addr, src_addr, bytes);
+
+		/* copy wrapped part */
+		src_addr += bytes;
+		remaining = pktlen - bytes;
+		dst_addr = ocmc_ram + txqueue->buffer_offset;
+		memcpy(dst_addr, src_addr, remaining);
+	} else {
+		memcpy(dst_addr, src_addr, pktlen);
+	}
+
+       /* update first buffer descriptor */
+	wr_buf_desc = (pktlen << PRUETH_BD_LENGTH_SHIFT) &
+		       PRUETH_BD_LENGTH_MASK;
+	writel(wr_buf_desc, dram + bd_wr_ptr);
+
+	/* update the write pointer in this queue descriptor, the firmware
+	 * polls for this change so this will signal the start of transmission
+	 */
+	update_wr_ptr = txqueue->buffer_desc_offset + (update_block * BD_SIZE);
+	writew(update_wr_ptr, &queue_desc->wr_ptr);
+
+	return 0;
+}
+
+void icssm_parse_packet_info(struct prueth *prueth, u32 buffer_descriptor,
+			     struct prueth_packet_info *pkt_info)
+{
+	pkt_info->start_offset = false;
+
+	pkt_info->shadow = !!(buffer_descriptor & PRUETH_BD_SHADOW_MASK);
+	pkt_info->port = (buffer_descriptor & PRUETH_BD_PORT_MASK) >>
+			 PRUETH_BD_PORT_SHIFT;
+	pkt_info->length = (buffer_descriptor & PRUETH_BD_LENGTH_MASK) >>
+			   PRUETH_BD_LENGTH_SHIFT;
+	pkt_info->broadcast = !!(buffer_descriptor & PRUETH_BD_BROADCAST_MASK);
+	pkt_info->error = !!(buffer_descriptor & PRUETH_BD_ERROR_MASK);
+	pkt_info->sv_frame = false;
+	pkt_info->lookup_success = !!(buffer_descriptor &
+				      PRUETH_BD_LOOKUP_SUCCESS_MASK);
+	pkt_info->flood = !!(buffer_descriptor & PRUETH_BD_SW_FLOOD_MASK);
+	pkt_info->timestamp = !!(buffer_descriptor & PRUETH_BD_TIMESTAMP_MASK);
+}
+
+/* get packet from queue
+ * negative for error
+ */
+int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
+			 struct prueth_packet_info *pkt_info,
+			 const struct prueth_queue_info *rxqueue)
+{
+	struct net_device *ndev = emac->ndev;
+	unsigned int buffer_desc_count;
+	int read_block, update_block;
+	unsigned int actual_pkt_len;
+	bool buffer_wrapped = false;
+	void *src_addr, *dst_addr;
+	u16 start_offset = 0;
+	struct sk_buff *skb;
+	int pkt_block_size;
+	void *ocmc_ram;
+
+	/* the PRU firmware deals mostly in pointers already
+	 * offset into ram, we would like to deal in indexes
+	 * within the queue we are working with for code
+	 * simplicity, calculate this here
+	 */
+	buffer_desc_count = rxqueue->buffer_desc_end -
+			    rxqueue->buffer_desc_offset;
+	buffer_desc_count /= BD_SIZE;
+	buffer_desc_count++;
+	read_block = (*bd_rd_ptr - rxqueue->buffer_desc_offset) / BD_SIZE;
+	pkt_block_size = DIV_ROUND_UP(pkt_info->length, ICSS_BLOCK_SIZE);
+
+	/* calculate end BD address post read */
+	update_block = read_block + pkt_block_size;
+
+	/* Check for wrap around */
+	if (update_block >= buffer_desc_count) {
+		update_block %= buffer_desc_count;
+		if (update_block)
+			buffer_wrapped = true;
+	}
+
+	/* calculate new pointer in ram */
+	*bd_rd_ptr = rxqueue->buffer_desc_offset + (update_block * BD_SIZE);
+
+	/* Pkt len w/ HSR tag removed, If applicable */
+	actual_pkt_len = pkt_info->length - start_offset;
+
+	/* Allocate a socket buffer for this packet */
+	skb = netdev_alloc_skb_ip_align(ndev, actual_pkt_len);
+	if (!skb) {
+		if (netif_msg_rx_err(emac) && net_ratelimit())
+			netdev_err(ndev, "failed rx buffer alloc\n");
+		return -ENOMEM;
+	}
+
+	dst_addr = skb->data;
+
+	/* OCMC RAM is not cached and read order is not important */
+	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
+
+	/* Get the start address of the first buffer from
+	 * the read buffer description
+	 */
+	src_addr = ocmc_ram + rxqueue->buffer_offset +
+		   (read_block * ICSS_BLOCK_SIZE);
+	src_addr += start_offset;
+
+	/* Copy the data from PRU buffers(OCMC) to socket buffer(DRAM) */
+	if (buffer_wrapped) { /* wrapped around buffer */
+		int bytes = (buffer_desc_count - read_block) * ICSS_BLOCK_SIZE;
+		int remaining;
+		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
+		 * entire packet may have fit within the last BD
+		 * if pkt_info.length is not integral multiple of
+		 * ICSS_BLOCK_SIZE
+		 */
+		if (pkt_info->length < bytes)
+			bytes = pkt_info->length;
+
+		/* If applicable, account for the HSR tag removed */
+		bytes -= start_offset;
+
+		/* copy non-wrapped part */
+		memcpy(dst_addr, src_addr, bytes);
+
+		/* copy wrapped part */
+		dst_addr += bytes;
+		remaining = actual_pkt_len - bytes;
+
+		src_addr = ocmc_ram + rxqueue->buffer_offset;
+		memcpy(dst_addr, src_addr, remaining);
+		src_addr += remaining;
+	} else {
+		memcpy(dst_addr, src_addr, actual_pkt_len);
+		src_addr += actual_pkt_len;
+	}
+
+	if (!pkt_info->sv_frame) {
+		skb_put(skb, actual_pkt_len);
+
+		/* send packet up the stack */
+		skb->protocol = eth_type_trans(skb, ndev);
+		local_bh_disable();
+		netif_receive_skb(skb);
+		local_bh_enable();
+	} else {
+		dev_kfree_skb_any(skb);
+	}
+
+	/* update stats */
+	ndev->stats.rx_bytes += actual_pkt_len;
+	ndev->stats.rx_packets++;
+
+	return 0;
+}
+
+/**
+ * icssm_emac_rx_thread - EMAC Rx interrupt thread handler
+ * @irq: interrupt number
+ * @dev_id: pointer to net_device
+ *
+ * EMAC Rx Interrupt thread handler - function to process the rx frames in a
+ * irq thread function. There is only limited buffer at the ingress to
+ * queue the frames. As the frames are to be emptied as quickly as
+ * possible to avoid overflow, irq thread is necessary. Current implementation
+ * based on NAPI poll results in packet loss due to overflow at
+ * the ingress queues. Industrial use case requires loss free packet
+ * processing. Tests shows that with threaded irq based processing,
+ * no overflow happens when receiving at ~92Mbps for MTU sized frames and thus
+ * meet the requirement for industrial use case.
+ *
+ * Return: interrupt handled condition
+ */
+static irqreturn_t icssm_emac_rx_thread(int irq, void *dev_id)
+{
+	struct net_device *ndev = (struct net_device *)dev_id;
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_queue_desc __iomem *queue_desc;
+	const struct prueth_queue_info *rxqueue;
+	struct prueth *prueth = emac->prueth;
+	struct net_device_stats *ndevstats;
+	struct prueth_packet_info pkt_info;
+	int start_queue, end_queue;
+	void __iomem *shared_ram;
+	u16 bd_rd_ptr, bd_wr_ptr;
+	u16 update_rd_ptr;
+	u8 overflow_cnt;
+	u32 rd_buf_desc;
+	int used = 0;
+	int i, ret;
+
+	ndevstats = &emac->ndev->stats;
+	shared_ram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
+
+	start_queue = emac->rx_queue_start;
+	end_queue = emac->rx_queue_end;
+retry:
+	/* search host queues for packets */
+	for (i = start_queue; i <= end_queue; i++) {
+		queue_desc = emac->rx_queue_descs + i;
+		rxqueue = &queue_infos[PRUETH_PORT_HOST][i];
+
+		overflow_cnt = readb(&queue_desc->overflow_cnt);
+		if (overflow_cnt > 0) {
+			emac->ndev->stats.rx_over_errors += overflow_cnt;
+			/* reset to zero */
+			writeb(0, &queue_desc->overflow_cnt);
+		}
+
+		bd_rd_ptr = readw(&queue_desc->rd_ptr);
+		bd_wr_ptr = readw(&queue_desc->wr_ptr);
+
+		/* while packets are available in this queue */
+		while (bd_rd_ptr != bd_wr_ptr) {
+			/* get packet info from the read buffer descriptor */
+			rd_buf_desc = readl(shared_ram + bd_rd_ptr);
+			icssm_parse_packet_info(prueth, rd_buf_desc, &pkt_info);
+
+			if (pkt_info.length <= 0) {
+				/* a packet length of zero will cause us to
+				 * never move the read pointer ahead, locking
+				 * the driver, so we manually have to move it
+				 * to the write pointer, discarding all
+				 * remaining packets in this queue. This should
+				 * never happen.
+				 */
+				update_rd_ptr = bd_wr_ptr;
+				ndevstats->rx_length_errors++;
+			} else if (pkt_info.length > EMAC_MAX_FRM_SUPPORT) {
+				/* if the packet is too large we skip it but we
+				 * still need to move the read pointer ahead
+				 * and assume something is wrong with the read
+				 * pointer as the firmware should be filtering
+				 * these packets
+				 */
+				update_rd_ptr = bd_wr_ptr;
+				ndevstats->rx_length_errors++;
+			} else {
+				update_rd_ptr = bd_rd_ptr;
+				ret = icssm_emac_rx_packet(emac, &update_rd_ptr,
+							   &pkt_info, rxqueue);
+				if (ret)
+					return IRQ_HANDLED;
+				used++;
+			}
+
+			/* after reading the buffer descriptor we clear it
+			 * to prevent improperly moved read pointer errors
+			 * from simply looking like old packets.
+			 */
+			writel(0, shared_ram + bd_rd_ptr);
+
+			/* update read pointer in queue descriptor */
+			writew(update_rd_ptr, &queue_desc->rd_ptr);
+			bd_rd_ptr = update_rd_ptr;
+		}
+	}
+
+	if (used) {
+		used = 0;
+		goto retry;
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
 				   struct net_device *ndev)
 {
@@ -412,6 +839,21 @@ static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
 		netdev_err(ndev, "failed to boot PRU0: %d\n", ret);
 		return ret;
 	}
+	return ret;
+}
+
+static int icssm_emac_request_irqs(struct prueth_emac *emac)
+{
+	struct net_device *ndev = emac->ndev;
+	int ret;
+
+	ret = request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_thread,
+				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+				   ndev->name, ndev);
+	if (ret) {
+		netdev_err(ndev, "unable to request RX IRQ\n");
+		return ret;
+	}
 
 	return ret;
 }
@@ -442,10 +884,27 @@ static int icssm_emac_ndo_open(struct net_device *ndev)
 	if (ret)
 		netdev_err(ndev, "failed to boot PRU: %d\n", ret);
 
+	ret = icssm_emac_request_irqs(emac);
+	if (ret)
+		goto rproc_shutdown;
+
 	/* start PHY */
 	phy_start(emac->phydev);
+
+	/* enable the port and vlan */
+	icssm_prueth_port_enable(emac, true);
+
 	prueth->emac_configured |= BIT(emac->port_id);
+
+	if (netif_msg_drv(emac))
+		dev_notice(&ndev->dev, "started\n");
+
 	return 0;
+
+rproc_shutdown:
+	rproc_shutdown(emac->pru);
+
+	return ret;
 }
 
 /**
@@ -459,18 +918,122 @@ static int icssm_emac_ndo_open(struct net_device *ndev)
 static int icssm_emac_ndo_stop(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth *prueth = emac->prueth;
+
+	prueth->emac_configured &= ~BIT(emac->port_id);
+
+	/* disable the mac port */
+	icssm_prueth_port_enable(emac, false);
 
 	/* stop PHY */
 	phy_stop(emac->phydev);
 
+	/* stop the PRU */
 	rproc_shutdown(emac->pru);
 
+	/* free rx and tx interrupts */
+	if (emac->tx_irq > 0)
+		free_irq(emac->tx_irq, ndev);
+
+	free_irq(emac->rx_irq, ndev);
+
+	if (netif_msg_drv(emac))
+		dev_notice(&ndev->dev, "stopped\n");
+
 	return 0;
 }
 
+/* VLAN-tag PCP to priority queue map for EMAC/Switch/HSR/PRP used by driver
+ * Index is PCP val / 2.
+ *   low  - pcp 0..3 maps to Q4 for Host
+ *   high - pcp 4..7 maps to Q3 for Host
+ *   low  - pcp 0..3 maps to Q2 (FWD Queue) for PRU-x
+ *   where x = 1 for PRUETH_PORT_MII0
+ *             0 for PRUETH_PORT_MII1
+ *   high - pcp 4..7 maps to Q1 (FWD Queue) for PRU-x
+ */
+static const unsigned short emac_pcp_tx_priority_queue_map[] = {
+	PRUETH_QUEUE4, PRUETH_QUEUE4,
+	PRUETH_QUEUE3, PRUETH_QUEUE3,
+	PRUETH_QUEUE2, PRUETH_QUEUE2,
+	PRUETH_QUEUE1, PRUETH_QUEUE1,
+};
+
+static u16 icssm_prueth_get_tx_queue_id(struct prueth *prueth,
+					struct sk_buff *skb)
+{
+	u16 vlan_tci, pcp;
+	int err;
+
+	err = vlan_get_tag(skb, &vlan_tci);
+	if (likely(err))
+		pcp = 0;
+	else
+		pcp = (vlan_tci & VLAN_PRIO_MASK) >> VLAN_PRIO_SHIFT;
+
+	/* Below code (pcp >>= 1) is made common for all
+	 * protocols (i.e., EMAC, RSTP, HSR and PRP)*
+	 * pcp value 0,1 will be updated to 0 mapped to QUEUE4
+	 * pcp value 2,3 will be updated to 1 mapped to QUEUE4
+	 * pcp value 4,5 will be updated to 2 mapped to QUEUE3
+	 * pcp value 6,7 will be updated to 3 mapped to QUEUE3
+	 */
+	pcp >>= 1;
+
+	return emac_pcp_tx_priority_queue_map[pcp];
+}
+
+/**
+ * icssm_emac_ndo_start_xmit - EMAC Transmit function
+ * @skb: SKB pointer
+ * @ndev: EMAC network adapter
+ *
+ * Called by the system to transmit a packet  - we queue the packet in
+ * EMAC hardware transmit queue
+ *
+ * Return: success(NETDEV_TX_OK) or error code (typically out of desc's)
+ */
+static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
+				     struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	int ret;
+	u16 qid;
+
+	qid = icssm_prueth_get_tx_queue_id(emac->prueth, skb);
+	ret = icssm_prueth_tx_enqueue(emac, skb, qid);
+	if (ret) {
+		if (ret != -ENOBUFS && netif_msg_tx_err(emac) &&
+		    net_ratelimit())
+			netdev_err(ndev, "packet queue failed: %d\n", ret);
+		goto fail_tx;
+	}
+
+	ndev->stats.tx_packets++;
+	ndev->stats.tx_bytes += skb->len;
+	dev_kfree_skb_any(skb);
+
+	return NETDEV_TX_OK;
+
+fail_tx:
+	if (ret == -ENOBUFS) {
+		/* no free TX queue */
+		if (emac->tx_irq > 0)
+			netif_stop_queue(ndev);
+		ret = NETDEV_TX_BUSY;
+	} else {
+		/* error */
+		ndev->stats.tx_dropped++;
+		ret = NET_XMIT_DROP;
+	}
+
+	return ret;
+}
+
 static const struct net_device_ops emac_netdev_ops = {
 	.ndo_open = icssm_emac_ndo_open,
 	.ndo_stop = icssm_emac_ndo_stop,
+	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
 };
 
 /* get emac_port corresponding to eth_node name */
@@ -540,16 +1103,42 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 	/* by default eth_type is EMAC */
 	switch (port) {
 	case PRUETH_PORT_MII0:
+		emac->tx_port_queue = PRUETH_PORT_QUEUE_MII0;
+
+		/* packets from MII0 are on queues 1 through 2 */
+		emac->rx_queue_start = PRUETH_QUEUE1;
+		emac->rx_queue_end = PRUETH_QUEUE2;
+
 		emac->dram = PRUETH_MEM_DRAM0;
 		emac->pru = prueth->pru0;
 		break;
 	case PRUETH_PORT_MII1:
+		emac->tx_port_queue = PRUETH_PORT_QUEUE_MII1;
+
+		/* packets from MII1 are on queues 3 through 4 */
+		emac->rx_queue_start = PRUETH_QUEUE3;
+		emac->rx_queue_end = PRUETH_QUEUE4;
+
 		emac->dram = PRUETH_MEM_DRAM1;
 		emac->pru = prueth->pru1;
 		break;
 	default:
 		return -EINVAL;
 	}
+
+	emac->rx_irq = of_irq_get_byname(eth_node, "rx");
+	if (emac->rx_irq < 0) {
+		ret = emac->rx_irq;
+		if (ret != -EPROBE_DEFER)
+			dev_err(prueth->dev, "could not get rx irq\n");
+		goto free;
+	}
+	emac->tx_irq = of_irq_get_byname(eth_node, "tx");
+	if (emac->tx_irq < 0) {
+		if (emac->tx_irq != -EPROBE_DEFER)
+			dev_dbg(prueth->dev, "tx irq not configured\n");
+	}
+
 	/* get mac address from DT and set private and netdev addr */
 	ret = of_get_ethdev_address(eth_node, ndev);
 	if (!is_valid_ether_addr(ndev->dev_addr)) {
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
index 6aaceb418f12..427dc8971d0f 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
@@ -20,6 +20,12 @@
 
 /* PRUSS local memory map */
 #define ICSS_LOCAL_SHARED_RAM	0x00010000
+#define EMAC_MAX_PKTLEN		(ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN)
+/* Below macro is for 1528 Byte Frame support, to Allow even with
+ * Redundancy tag
+ */
+#define EMAC_MAX_FRM_SUPPORT (ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN + \
+			      ICSSM_LRE_TAG_SIZE)
 
 /* PRU Ethernet Type - Ethernet functionality (protocol
  * implemented) provided by the PRU firmware being loaded.
@@ -76,6 +82,32 @@ struct prueth_queue_info {
 	u16 buffer_desc_end;
 } __packed;
 
+/**
+ * struct prueth_packet_info - Info about a packet in buffer
+ * @start_offset: start offset of the frame in the buffer for HSR/PRP
+ * @shadow: this packet is stored in the collision queue
+ * @port: port packet is on
+ * @length: length of packet
+ * @broadcast: this packet is a broadcast packet
+ * @error: this packet has an error
+ * @sv_frame: indicate if the frame is a SV frame for HSR/PRP
+ * @lookup_success: src mac found in FDB
+ * @flood: packet is to be flooded
+ * @timstamp: Specifies if timestamp is appended to the packet
+ */
+struct prueth_packet_info {
+	bool start_offset;
+	bool shadow;
+	unsigned int port;
+	unsigned int length;
+	bool broadcast;
+	bool error;
+	bool sv_frame;
+	bool lookup_success;
+	bool flood;
+	bool timestamp;
+};
+
 /* In switch mode there are 3 real ports i.e. 3 mac addrs.
  * however Linux sees only the host side port. The other 2 ports
  * are the switch ports.
@@ -160,14 +192,22 @@ struct prueth_emac {
 
 	struct rproc *pru;
 	struct phy_device *phydev;
+	struct prueth_queue_desc __iomem *rx_queue_descs;
+	struct prueth_queue_desc __iomem *tx_queue_descs;
 
 	int link;
 	int speed;
 	int duplex;
+	int rx_irq;
+	int tx_irq;
 
+	enum prueth_port_queue_id tx_port_queue;
+	enum prueth_queue_id rx_queue_start;
+	enum prueth_queue_id rx_queue_end;
 	enum prueth_port port_id;
 	enum prueth_mem dram;
 	const char *phy_id;
+	u32 msg_enable;
 	u8 mac_addr[6];
 	phy_interface_t phy_if;
 	spinlock_t lock;	/* serialize access */
@@ -191,4 +231,10 @@ struct prueth {
 	unsigned int eth_type;
 	u8 emac_configured;
 };
+
+void icssm_parse_packet_info(struct prueth *prueth, u32 buffer_descriptor,
+			     struct prueth_packet_info *pkt_info);
+int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
+			 struct prueth_packet_info *pkt_info,
+			 const struct prueth_queue_info *rxqueue);
 #endif /* __NET_TI_PRUETH_H */
-- 
2.34.1


