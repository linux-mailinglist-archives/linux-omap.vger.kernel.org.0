Return-Path: <linux-omap+bounces-3236-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CDDA21771
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2025 06:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E3ED7A233B
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2025 05:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF155191F83;
	Wed, 29 Jan 2025 05:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="0p0Vb4Lt"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6378533987;
	Wed, 29 Jan 2025 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738129287; cv=none; b=Hshvwarv9uvkmYGkcoKIbD75hi3YM4jPv78ui3jihE1e10lZ5y1EzT151zDg0bjmm2FBilklKDjCakDqQ7dWirfcktYOqSmqwieY4pIrJbXaAE5xHTRzr8C68qVEM59PSqHHbNfwfDKHBj9WWWwLU3mxTC5RCGzj38uRsNAQjus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738129287; c=relaxed/simple;
	bh=2yj+qPkbESVjBDDxBWZIxda9pc7P4/B5XTvbaxM0mgo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tBhIAHgA1+Qhh5qiShIDUCJ9CMGiPn4d2gOKND7nIFe7OnTZnk3QvKVgCAF4pD6iZJ8q54chioUCCV5OZg4iEio0bB9yfENuYBIoD7ZEzzrnvXvT7c38mRNsseh9ABMeD7Gi41OACKATvGnt7wgtKfRk0S6+jljcnhIwoV7kl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=0p0Vb4Lt; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GiuH1yxSbXm/GQN1dWP4QPW5JqWHPqsjlIyc5XT2i7c=; b=0p0Vb4LtG8I0R/hEcR717BkAdu
	2ajeUPYH7Ibkh9/CiFAJ4yQoMsLyY3FsKUD2ILINCUQfjck9tzHAL3VToUr+A6Dt38+8HOBkIZmY1
	ZnbzQP2wvQnypGnUXPvmQqqJbBc/EWr/2AeInBwGnntGFoO+MinyRZDWVCcOKfJG8nP2BgZjNFgN0
	eXyPXZvinW81g4KuajMYY7TbajKUFqE45C1xvO5OBBUfxo8yUig6YmhMapLjAaE5DydoCltpBHx9s
	If3V3ID2nC5z70MrdDbv/EgAG7vDwQLMKFy00xHyCNjVfNNgSeVaiB4AEPqVfPgq0/benln3s47lK
	/jPxv+iQ==;
Received: from [122.175.9.182] (port=32178 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1td0pB-0007um-13;
	Wed, 29 Jan 2025 11:11:17 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 9D34617823F4;
	Wed, 29 Jan 2025 11:11:09 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 7D2C11783F61;
	Wed, 29 Jan 2025 11:11:09 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JNr9Btyc64vw; Wed, 29 Jan 2025 11:11:09 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 2CBCE1782431;
	Wed, 29 Jan 2025 11:11:09 +0530 (IST)
Date: Wed, 29 Jan 2025 11:11:08 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Joe Damato <jdamato@fastly.com>
Cc: basharath <basharath@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, nm <nm@ti.com>, 
	ssantosh <ssantosh@kernel.org>, tony <tony@atomide.com>, 
	richardcochran <richardcochran@gmail.com>, 
	parvathi <parvathi@couthit.com>, schnelle <schnelle@linux.ibm.com>, 
	rdunlap <rdunlap@infradead.org>, diogo ivo <diogo.ivo@siemens.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, horms <horms@kernel.org>, 
	jacob e keller <jacob.e.keller@intel.com>, 
	m-malladi <m-malladi@ti.com>, 
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>, 
	afd <afd@ti.com>, s-anna <s-anna@ti.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	pratheesh <pratheesh@ti.com>, prajith <prajith@ti.com>, 
	vigneshr <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <1925493932.450322.1738129268925.JavaMail.zimbra@couthit.local>
In-Reply-To: <Z5QegAP71PkbppOO@LQ3V64L9R2>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124123707.1457639-5-basharath@couthit.com> <Z5QegAP71PkbppOO@LQ3V64L9R2>
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: 5u17rvDYcRPOH0YCU5P0hkAQzNNzKA==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

> On Fri, Jan 24, 2025 at 06:07:01PM +0530, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Changes corresponding to link configuration such as speed and duplexity.
>> IRQ and handler initializations are performed for packet reception.Firmware
>> receives the packet from the wire and stores it into OCMC queue. Next, it
>> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
>> service the IRQ and packet will be processed by pushing the newly allocated
>> SKB to upper layers.
>> 
>> When the user application want to transmit a packet, it will invoke
>> sys_send() which will inturn invoke the PRUETH driver, then it will write
>> the packet into OCMC queues. PRU firmware will pick up the packet and
>> transmit it on to the wire.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> ---
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 599 ++++++++++++++++++-
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.h |  46 ++
>>  2 files changed, 640 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> index 82ed0e3a0d88..0ba1d16a7a15 100644
>> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> 
> [...]
> 
>> +/**
>> + * icssm_prueth_tx_enqueue - queue a packet to firmware for transmission
>> + *
>> + * @emac: EMAC data structure
>> + * @skb: packet data buffer
>> + * @queue_id: priority queue id
>> + *
>> + * Return: 0 (Success)
>> + */
>> +static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
>> +				   struct sk_buff *skb,
>> +				   enum prueth_queue_id queue_id)
>> +{
> 
> [...]
> 
>> +
>> +	/* which port to tx: MII0 or MII1 */
>> +	txport = emac->tx_port_queue;
>> +	src_addr = skb->data;
>> +	pktlen = skb->len;
>> +	/* Get the tx queue */
>> +	queue_desc = emac->tx_queue_descs + queue_id;
>> +	txqueue = &queue_infos[txport][queue_id];
>> +
>> +	buffer_desc_count = txqueue->buffer_desc_end -
>> +			    txqueue->buffer_desc_offset;
>> +	buffer_desc_count /= BD_SIZE;
>> +	buffer_desc_count++;
>> +
>> +	bd_rd_ptr = readw(&queue_desc->rd_ptr);
>> +	bd_wr_ptr = readw(&queue_desc->wr_ptr);
>> +
>> +	/* the PRU firmware deals mostly in pointers already
>> +	 * offset into ram, we would like to deal in indexes
>> +	 * within the queue we are working with for code
>> +	 * simplicity, calculate this here
>> +	 */
>> +	write_block = (bd_wr_ptr - txqueue->buffer_desc_offset) / BD_SIZE;
>> +	read_block = (bd_rd_ptr - txqueue->buffer_desc_offset) / BD_SIZE;
> 
> Seems like there's a lot of similar code repeated in the rx code
> path.
> 
> Maybe there's a way to simplify it all with a helper of some sort?
> 

We will plan to re-look into common code (more than twice) and create a helper
function and use it.

>> +	if (write_block > read_block) {
>> +		free_blocks = buffer_desc_count - write_block;
>> +		free_blocks += read_block;
>> +	} else if (write_block < read_block) {
>> +		free_blocks = read_block - write_block;
>> +	} else { /* they are all free */
>> +		free_blocks = buffer_desc_count;
>> +	}
>> +
>> +	pkt_block_size = DIV_ROUND_UP(pktlen, ICSS_BLOCK_SIZE);
>> +	if (pkt_block_size > free_blocks) /* out of queue space */
>> +		return -ENOBUFS;
>> +
>> +	/* calculate end BD address post write */
>> +	update_block = write_block + pkt_block_size;
>> +
>> +	/* Check for wrap around */
>> +	if (update_block >= buffer_desc_count) {
>> +		update_block %= buffer_desc_count;
>> +		buffer_wrapped = true;
>> +	}
>> +
>> +	/* OCMC RAM is not cached and write order is not important */
>> +	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
>> +	dst_addr = ocmc_ram + txqueue->buffer_offset +
>> +		   (write_block * ICSS_BLOCK_SIZE);
>> +
>> +	/* Copy the data from socket buffer(DRAM) to PRU buffers(OCMC) */
>> +	if (buffer_wrapped) { /* wrapped around buffer */
>> +		int bytes = (buffer_desc_count - write_block) * ICSS_BLOCK_SIZE;
>> +		int remaining;
>> +
>> +		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
>> +		 * entire packet may have fit within the last BD
>> +		 * if pkt_info.length is not integral multiple of
>> +		 * ICSS_BLOCK_SIZE
>> +		 */
>> +		if (pktlen < bytes)
>> +			bytes = pktlen;
>> +
>> +		/* copy non-wrapped part */
>> +		memcpy(dst_addr, src_addr, bytes);
>> +
>> +		/* copy wrapped part */
>> +		src_addr += bytes;
>> +		remaining = pktlen - bytes;
>> +		dst_addr = ocmc_ram + txqueue->buffer_offset;
>> +		memcpy(dst_addr, src_addr, remaining);
>> +	} else {
>> +		memcpy(dst_addr, src_addr, pktlen);
>> +	}
>> +
>> +       /* update first buffer descriptor */
>> +	wr_buf_desc = (pktlen << PRUETH_BD_LENGTH_SHIFT) &
>> +		       PRUETH_BD_LENGTH_MASK;
>> +	writel(wr_buf_desc, dram + bd_wr_ptr);
>> +
>> +	/* update the write pointer in this queue descriptor, the firmware
>> +	 * polls for this change so this will signal the start of transmission
>> +	 */
>> +	update_wr_ptr = txqueue->buffer_desc_offset + (update_block * BD_SIZE);
>> +	writew(update_wr_ptr, &queue_desc->wr_ptr);
>> +
>> +	return 0;
>> +}
> 
> [...]
> 
>> +
>> +/* get packet from queue
>> + * negative for error
>> + */
> 
> The comment above seems superfluous and does not seem to follow the
> format of the tx comment which appears to use kdoc style
> 

We will address in the next version.

>> +int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
>> +			 struct prueth_packet_info *pkt_info,
>> +			 const struct prueth_queue_info *rxqueue)
>> +{
> 
> [...]
> 
>> +
>> +	/* the PRU firmware deals mostly in pointers already
>> +	 * offset into ram, we would like to deal in indexes
>> +	 * within the queue we are working with for code
>> +	 * simplicity, calculate this here
>> +	 */
>> +	buffer_desc_count = rxqueue->buffer_desc_end -
>> +			    rxqueue->buffer_desc_offset;
>> +	buffer_desc_count /= BD_SIZE;
>> +	buffer_desc_count++;
>> +	read_block = (*bd_rd_ptr - rxqueue->buffer_desc_offset) / BD_SIZE;
>> +	pkt_block_size = DIV_ROUND_UP(pkt_info->length, ICSS_BLOCK_SIZE);
>> +
>> +	/* calculate end BD address post read */
>> +	update_block = read_block + pkt_block_size;
>> +
>> +	/* Check for wrap around */
>> +	if (update_block >= buffer_desc_count) {
>> +		update_block %= buffer_desc_count;
>> +		if (update_block)
>> +			buffer_wrapped = true;
>> +	}
>> +
>> +	/* calculate new pointer in ram */
>> +	*bd_rd_ptr = rxqueue->buffer_desc_offset + (update_block * BD_SIZE);
> 
> Seems like there's a lot of repeated math here and in the above
> function. Maybe this can be simplified with a helper function to
> avoid repeating the math in multiple places?
> 

We will plan to re-look into common code (more than twice) and create a helper
function and use it.

>> +
>> +	/* Pkt len w/ HSR tag removed, If applicable */
>> +	actual_pkt_len = pkt_info->length - start_offset;
>> +
>> +	/* Allocate a socket buffer for this packet */
>> +	skb = netdev_alloc_skb_ip_align(ndev, actual_pkt_len);
>> +	if (!skb) {
>> +		if (netif_msg_rx_err(emac) && net_ratelimit())
>> +			netdev_err(ndev, "failed rx buffer alloc\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	dst_addr = skb->data;
>> +
>> +	/* OCMC RAM is not cached and read order is not important */
>> +	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
>> +
>> +	/* Get the start address of the first buffer from
>> +	 * the read buffer description
>> +	 */
>> +	src_addr = ocmc_ram + rxqueue->buffer_offset +
>> +		   (read_block * ICSS_BLOCK_SIZE);
>> +	src_addr += start_offset;
>> +
>> +	/* Copy the data from PRU buffers(OCMC) to socket buffer(DRAM) */
>> +	if (buffer_wrapped) { /* wrapped around buffer */
>> +		int bytes = (buffer_desc_count - read_block) * ICSS_BLOCK_SIZE;
>> +		int remaining;
>> +		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
>> +		 * entire packet may have fit within the last BD
>> +		 * if pkt_info.length is not integral multiple of
>> +		 * ICSS_BLOCK_SIZE
>> +		 */
>> +		if (pkt_info->length < bytes)
>> +			bytes = pkt_info->length;
>> +
>> +		/* If applicable, account for the HSR tag removed */
>> +		bytes -= start_offset;
>> +
>> +		/* copy non-wrapped part */
>> +		memcpy(dst_addr, src_addr, bytes);
>> +
>> +		/* copy wrapped part */
>> +		dst_addr += bytes;
>> +		remaining = actual_pkt_len - bytes;
>> +
>> +		src_addr = ocmc_ram + rxqueue->buffer_offset;
>> +		memcpy(dst_addr, src_addr, remaining);
>> +		src_addr += remaining;
>> +	} else {
>> +		memcpy(dst_addr, src_addr, actual_pkt_len);
>> +		src_addr += actual_pkt_len;
>> +	}
>> +
>> +	if (!pkt_info->sv_frame) {
>> +		skb_put(skb, actual_pkt_len);
>> +
>> +		/* send packet up the stack */
>> +		skb->protocol = eth_type_trans(skb, ndev);
>> +		local_bh_disable();
>> +		netif_receive_skb(skb);
>> +		local_bh_enable();
>> +	} else {
>> +		dev_kfree_skb_any(skb);
>> +	}
>> +
>> +	/* update stats */
>> +	ndev->stats.rx_bytes += actual_pkt_len;
>> +	ndev->stats.rx_packets++;
> 
> See comment below about atomicity.
> 
>> +	return 0;
>> +}
>> +
>> +/**
>> + * icssm_emac_rx_thread - EMAC Rx interrupt thread handler
>> + * @irq: interrupt number
>> + * @dev_id: pointer to net_device
>> + *
>> + * EMAC Rx Interrupt thread handler - function to process the rx frames in a
>> + * irq thread function. There is only limited buffer at the ingress to
>> + * queue the frames. As the frames are to be emptied as quickly as
>> + * possible to avoid overflow, irq thread is necessary. Current implementation
>> + * based on NAPI poll results in packet loss due to overflow at
>> + * the ingress queues. Industrial use case requires loss free packet
>> + * processing. Tests shows that with threaded irq based processing,
>> + * no overflow happens when receiving at ~92Mbps for MTU sized frames and thus
>> + * meet the requirement for industrial use case.
> 
> That's interesting. Any idea why this is the case? Is there not
> enough CPU for softirq/NAPI processing to run or something? I
> suppose I'd imagine that NAPI would run and if data is arriving fast
> enough, the NAPI would be added to the repoll list and processed
> later.
> 
> So I guess either there isn't enough CPU or the ingress queues don't
> have many descriptors or something like that ?
> 

This is due to combination of both limited number of buffer descriptors 
(memory constraints) and also not having enough CPU.

>> + *
>> + * Return: interrupt handled condition
>> + */
>> +static irqreturn_t icssm_emac_rx_thread(int irq, void *dev_id)
>> +{
>> +	struct net_device *ndev = (struct net_device *)dev_id;
>> +	struct prueth_emac *emac = netdev_priv(ndev);
>> +	struct prueth_queue_desc __iomem *queue_desc;
>> +	const struct prueth_queue_info *rxqueue;
>> +	struct prueth *prueth = emac->prueth;
>> +	struct net_device_stats *ndevstats;
>> +	struct prueth_packet_info pkt_info;
>> +	int start_queue, end_queue;
>> +	void __iomem *shared_ram;
>> +	u16 bd_rd_ptr, bd_wr_ptr;
>> +	u16 update_rd_ptr;
>> +	u8 overflow_cnt;
>> +	u32 rd_buf_desc;
>> +	int used = 0;
>> +	int i, ret;
>> +
>> +	ndevstats = &emac->ndev->stats;
> 
> FWIW the docs in include/linux/netdevice.h say:
> 
> /**
> ...
> *      @stats:         Statistics struct, which was left as a legacy, use
> *                      rtnl_link_stats64 instead
> ...
> */
> struct net_device {
>  ...
>  struct net_device_stats stats; /* not used by modern drivers */
>  ...
> };
> 
> perhaps consider using rtnl_link_stats64 as suggested instead?
> 
>> +	shared_ram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
>> +
>> +	start_queue = emac->rx_queue_start;
>> +	end_queue = emac->rx_queue_end;
>> +retry:
>> +	/* search host queues for packets */
>> +	for (i = start_queue; i <= end_queue; i++) {
>> +		queue_desc = emac->rx_queue_descs + i;
>> +		rxqueue = &queue_infos[PRUETH_PORT_HOST][i];
>> +
>> +		overflow_cnt = readb(&queue_desc->overflow_cnt);
>> +		if (overflow_cnt > 0) {
>> +			emac->ndev->stats.rx_over_errors += overflow_cnt;
>> +			/* reset to zero */
>> +			writeb(0, &queue_desc->overflow_cnt);
>> +		}
>> +
>> +		bd_rd_ptr = readw(&queue_desc->rd_ptr);
>> +		bd_wr_ptr = readw(&queue_desc->wr_ptr);
>> +
>> +		/* while packets are available in this queue */
>> +		while (bd_rd_ptr != bd_wr_ptr) {
>> +			/* get packet info from the read buffer descriptor */
>> +			rd_buf_desc = readl(shared_ram + bd_rd_ptr);
>> +			icssm_parse_packet_info(prueth, rd_buf_desc, &pkt_info);
>> +
>> +			if (pkt_info.length <= 0) {
>> +				/* a packet length of zero will cause us to
>> +				 * never move the read pointer ahead, locking
>> +				 * the driver, so we manually have to move it
>> +				 * to the write pointer, discarding all
>> +				 * remaining packets in this queue. This should
>> +				 * never happen.
>> +				 */
>> +				update_rd_ptr = bd_wr_ptr;
>> +				ndevstats->rx_length_errors++;
> 
> See question below.
> 
>> +			} else if (pkt_info.length > EMAC_MAX_FRM_SUPPORT) {
>> +				/* if the packet is too large we skip it but we
>> +				 * still need to move the read pointer ahead
>> +				 * and assume something is wrong with the read
>> +				 * pointer as the firmware should be filtering
>> +				 * these packets
>> +				 */
>> +				update_rd_ptr = bd_wr_ptr;
>> +				ndevstats->rx_length_errors++;
> 
> in netdevice.h it says:
> 
> * struct net_device_stats* (*ndo_get_stats)(struct net_device *dev);
> *      Called when a user wants to get the network device usage
> *      statistics. Drivers must do one of the following:
> *      1. Define @ndo_get_stats64 to fill in a zero-initialised
> *         rtnl_link_stats64 structure passed by the caller.
> *      2. Define @ndo_get_stats to update a net_device_stats structure
> *         (which should normally be dev->stats) and return a pointer to
> *         it. The structure may be changed asynchronously only if each
> *         field is written atomically.
> *      3. Update dev->stats asynchronously and atomically, and define
> *         neither operation.
> 
> I didn't look in the other patches to see if ndo_get_stats is
> defined or not, but are these increments atomic?

This module maintain 32 bit statistics inside PRU firmware. we will 
check the feasibility of using rtnl_link_stats64 and make appropriate 
changes as per your suggestion in next version. 

Thanks & Best Regards,
Basharath

