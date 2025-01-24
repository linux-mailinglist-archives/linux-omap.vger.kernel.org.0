Return-Path: <linux-omap+bounces-3223-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F8A1BEEF
	for <lists+linux-omap@lfdr.de>; Sat, 25 Jan 2025 00:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4FFC3A1124
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 23:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5681E7C38;
	Fri, 24 Jan 2025 23:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="SFEhTafe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD21E3DE3
	for <linux-omap@vger.kernel.org>; Fri, 24 Jan 2025 23:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737760429; cv=none; b=sBwdUMHi1VRnzoq79CGTxvy8VLi9ptbOi0+iBzOu3ojmFiKI/4KXUuTqaiTaGmd7AxX1JI0dsZqbfFw7IW42BELnYfMaYGOujFe/HKUcfgZ6l4LMA3DMgSSltxaI9hq6C1YoFapH5dRp30UO6KyUTMpHUPN2IcngU1EKRDoXzr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737760429; c=relaxed/simple;
	bh=Obld9qTIYm3KJefEoogJrCRjwtgalbvJDpPbleMuOYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSVP/5AGRUwsDjGcef3TzuJ0eBu0tGwZUaL9HXoGU6h4pkUttV3veVk71aDU5mjGH3SPA7M6P0Lf85+gqH79fJh50OGCJYWeOZJpLEkNthx7Y1O199D6e059zBk0QAFWNCf7UflbHEdysaxLCZfd3wq9bMe4Jg/UP/iO9R6oqjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=SFEhTafe; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844e39439abso71695339f.1
        for <linux-omap@vger.kernel.org>; Fri, 24 Jan 2025 15:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1737760427; x=1738365227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0XaHocYpjBMm1kr/4P6FLGq+gbasSGEMI2ExACwoaU=;
        b=SFEhTafe0bnBNt1Lnf2g25JCJ7pnRoVbO3BY9rIUCS+ZgMhP0v2QxxykEA63CJrdgk
         +bJh4/B7Vzzm0LJqT4Oj/vt/huwSMtE7d2PQxctJ9mTBAY8vSJwygtIhIg64tLy99M8t
         snMaxS/JAUzJPLmnGmiNgHUnJ7ZdpykzIbMUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737760427; x=1738365227;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0XaHocYpjBMm1kr/4P6FLGq+gbasSGEMI2ExACwoaU=;
        b=mPx0ICcU7CAyXR/4/ArRGWZx5tYc2/yG6CwLDVbMJm9UFw/2wSs3dfNWsB5Lz5D3E/
         hofuOsZfK3cVqHu541M/8hPdWDddFqGhtwFgpc8wJsgx0Cm7H91UC3OQdmMJNwLFQo5s
         yzO2Kly48QhfQFfhHClelYladhD/gO79d98PrNB6f5gmmbNh7vyZZVuIu5OLN5zcYwzQ
         0lCQqhIXPfPnwOpiYhWZ3ErvI8vzsRjGsPYQ8Jlvr3bop5s+Gb/Umoea52w+aibOsvgM
         Y2gtG44aHnWzXfJCacTmqfMlcSDa3bt35qTnkyijs4XNKlfoa1KFmxhi6B05Hgr8xS88
         wOmA==
X-Forwarded-Encrypted: i=1; AJvYcCX9UI8SNnsj/0ACGo6CTitfrNxkQVbCqCSHyCcy3QGb5KhO5ist/WfuwdbrjDBomwycp9RRPOvkS351@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOkhFizY46gRPSBLvowK2QgC1ZnOuTP3xfdDysUw3/zJvGt4r
	snuHVMdMzr46SYiFFEBkG4kwxa/6ol/s3EsOsfN4ucNqOZphO3Zm3jBiNhMCOpI=
X-Gm-Gg: ASbGncu0J+rWPYqPi68E6jRFoBACrnQuQOwi6FO3ClI0d8n/COfNC3cv+bza4ctHuGK
	Lx2vBbjI1gXh0chTs8rAre9PMAKh0DHDreOcqq/nBevwC9XSWY3Onff0vVvHnfpUCeL+hL9XEjL
	OPe/2w3/Yf9zwzZlhS+Dd5rCsAwu3BWCnizpOrMDdiE2mH61fBYxJkXaVBNE2yaKKYrkjikTHTg
	++fWQBUz3UBrlxIFd8fDjeRaT72GcSfyBgwu9+A4PnOUk0=
X-Google-Smtp-Source: AGHT+IGVVBGfEdi2ND44dQvzJycmDmT9wC964cNHWq8xu4fhYbtR7D+cmmqExueT+DEvZOFAxLuYGA==
X-Received: by 2002:a05:6602:3e88:b0:84f:41cb:1895 with SMTP id ca18e2360f4ac-851b616dc39mr2821802739f.1.1737760426589;
        Fri, 24 Jan 2025 15:13:46 -0800 (PST)
Received: from LQ3V64L9R2 ([75.104.111.203])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da4461dsm917901173.56.2025.01.24.15.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 15:13:45 -0800 (PST)
Date: Fri, 24 Jan 2025 15:13:04 -0800
From: Joe Damato <jdamato@fastly.com>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
Message-ID: <Z5QegAP71PkbppOO@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Basharath Hussain Khaja <basharath@couthit.com>, danishanwar@ti.com,
	rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	ssantosh@kernel.org, tony@atomide.com, richardcochran@gmail.com,
	parvathi@couthit.com, schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124123707.1457639-5-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124123707.1457639-5-basharath@couthit.com>

On Fri, Jan 24, 2025 at 06:07:01PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Changes corresponding to link configuration such as speed and duplexity.
> IRQ and handler initializations are performed for packet reception.Firmware
> receives the packet from the wire and stores it into OCMC queue. Next, it
> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
> service the IRQ and packet will be processed by pushing the newly allocated
> SKB to upper layers.
> 
> When the user application want to transmit a packet, it will invoke
> sys_send() which will inturn invoke the PRUETH driver, then it will write
> the packet into OCMC queues. PRU firmware will pick up the packet and
> transmit it on to the wire.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 599 ++++++++++++++++++-
>  drivers/net/ethernet/ti/icssm/icssm_prueth.h |  46 ++
>  2 files changed, 640 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index 82ed0e3a0d88..0ba1d16a7a15 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

[...]

> +/**
> + * icssm_prueth_tx_enqueue - queue a packet to firmware for transmission
> + *
> + * @emac: EMAC data structure
> + * @skb: packet data buffer
> + * @queue_id: priority queue id
> + *
> + * Return: 0 (Success)
> + */
> +static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
> +				   struct sk_buff *skb,
> +				   enum prueth_queue_id queue_id)
> +{

[...]

> +
> +	/* which port to tx: MII0 or MII1 */
> +	txport = emac->tx_port_queue;
> +	src_addr = skb->data;
> +	pktlen = skb->len;
> +	/* Get the tx queue */
> +	queue_desc = emac->tx_queue_descs + queue_id;
> +	txqueue = &queue_infos[txport][queue_id];
> +
> +	buffer_desc_count = txqueue->buffer_desc_end -
> +			    txqueue->buffer_desc_offset;
> +	buffer_desc_count /= BD_SIZE;
> +	buffer_desc_count++;
> +
> +	bd_rd_ptr = readw(&queue_desc->rd_ptr);
> +	bd_wr_ptr = readw(&queue_desc->wr_ptr);
> +
> +	/* the PRU firmware deals mostly in pointers already
> +	 * offset into ram, we would like to deal in indexes
> +	 * within the queue we are working with for code
> +	 * simplicity, calculate this here
> +	 */
> +	write_block = (bd_wr_ptr - txqueue->buffer_desc_offset) / BD_SIZE;
> +	read_block = (bd_rd_ptr - txqueue->buffer_desc_offset) / BD_SIZE;

Seems like there's a lot of similar code repeated in the rx code
path.

Maybe there's a way to simplify it all with a helper of some sort?

> +	if (write_block > read_block) {
> +		free_blocks = buffer_desc_count - write_block;
> +		free_blocks += read_block;
> +	} else if (write_block < read_block) {
> +		free_blocks = read_block - write_block;
> +	} else { /* they are all free */
> +		free_blocks = buffer_desc_count;
> +	}
> +
> +	pkt_block_size = DIV_ROUND_UP(pktlen, ICSS_BLOCK_SIZE);
> +	if (pkt_block_size > free_blocks) /* out of queue space */
> +		return -ENOBUFS;
> +
> +	/* calculate end BD address post write */
> +	update_block = write_block + pkt_block_size;
> +
> +	/* Check for wrap around */
> +	if (update_block >= buffer_desc_count) {
> +		update_block %= buffer_desc_count;
> +		buffer_wrapped = true;
> +	}
> +
> +	/* OCMC RAM is not cached and write order is not important */
> +	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
> +	dst_addr = ocmc_ram + txqueue->buffer_offset +
> +		   (write_block * ICSS_BLOCK_SIZE);
> +
> +	/* Copy the data from socket buffer(DRAM) to PRU buffers(OCMC) */
> +	if (buffer_wrapped) { /* wrapped around buffer */
> +		int bytes = (buffer_desc_count - write_block) * ICSS_BLOCK_SIZE;
> +		int remaining;
> +
> +		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
> +		 * entire packet may have fit within the last BD
> +		 * if pkt_info.length is not integral multiple of
> +		 * ICSS_BLOCK_SIZE
> +		 */
> +		if (pktlen < bytes)
> +			bytes = pktlen;
> +
> +		/* copy non-wrapped part */
> +		memcpy(dst_addr, src_addr, bytes);
> +
> +		/* copy wrapped part */
> +		src_addr += bytes;
> +		remaining = pktlen - bytes;
> +		dst_addr = ocmc_ram + txqueue->buffer_offset;
> +		memcpy(dst_addr, src_addr, remaining);
> +	} else {
> +		memcpy(dst_addr, src_addr, pktlen);
> +	}
> +
> +       /* update first buffer descriptor */
> +	wr_buf_desc = (pktlen << PRUETH_BD_LENGTH_SHIFT) &
> +		       PRUETH_BD_LENGTH_MASK;
> +	writel(wr_buf_desc, dram + bd_wr_ptr);
> +
> +	/* update the write pointer in this queue descriptor, the firmware
> +	 * polls for this change so this will signal the start of transmission
> +	 */
> +	update_wr_ptr = txqueue->buffer_desc_offset + (update_block * BD_SIZE);
> +	writew(update_wr_ptr, &queue_desc->wr_ptr);
> +
> +	return 0;
> +}

[...]

> +
> +/* get packet from queue
> + * negative for error
> + */

The comment above seems superfluous and does not seem to follow the
format of the tx comment which appears to use kdoc style

> +int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
> +			 struct prueth_packet_info *pkt_info,
> +			 const struct prueth_queue_info *rxqueue)
> +{

[...]

> +
> +	/* the PRU firmware deals mostly in pointers already
> +	 * offset into ram, we would like to deal in indexes
> +	 * within the queue we are working with for code
> +	 * simplicity, calculate this here
> +	 */
> +	buffer_desc_count = rxqueue->buffer_desc_end -
> +			    rxqueue->buffer_desc_offset;
> +	buffer_desc_count /= BD_SIZE;
> +	buffer_desc_count++;
> +	read_block = (*bd_rd_ptr - rxqueue->buffer_desc_offset) / BD_SIZE;
> +	pkt_block_size = DIV_ROUND_UP(pkt_info->length, ICSS_BLOCK_SIZE);
> +
> +	/* calculate end BD address post read */
> +	update_block = read_block + pkt_block_size;
> +
> +	/* Check for wrap around */
> +	if (update_block >= buffer_desc_count) {
> +		update_block %= buffer_desc_count;
> +		if (update_block)
> +			buffer_wrapped = true;
> +	}
> +
> +	/* calculate new pointer in ram */
> +	*bd_rd_ptr = rxqueue->buffer_desc_offset + (update_block * BD_SIZE);

Seems like there's a lot of repeated math here and in the above
function. Maybe this can be simplified with a helper function to
avoid repeating the math in multiple places?

> +
> +	/* Pkt len w/ HSR tag removed, If applicable */
> +	actual_pkt_len = pkt_info->length - start_offset;
> +
> +	/* Allocate a socket buffer for this packet */
> +	skb = netdev_alloc_skb_ip_align(ndev, actual_pkt_len);
> +	if (!skb) {
> +		if (netif_msg_rx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "failed rx buffer alloc\n");
> +		return -ENOMEM;
> +	}
> +
> +	dst_addr = skb->data;
> +
> +	/* OCMC RAM is not cached and read order is not important */
> +	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
> +
> +	/* Get the start address of the first buffer from
> +	 * the read buffer description
> +	 */
> +	src_addr = ocmc_ram + rxqueue->buffer_offset +
> +		   (read_block * ICSS_BLOCK_SIZE);
> +	src_addr += start_offset;
> +
> +	/* Copy the data from PRU buffers(OCMC) to socket buffer(DRAM) */
> +	if (buffer_wrapped) { /* wrapped around buffer */
> +		int bytes = (buffer_desc_count - read_block) * ICSS_BLOCK_SIZE;
> +		int remaining;
> +		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
> +		 * entire packet may have fit within the last BD
> +		 * if pkt_info.length is not integral multiple of
> +		 * ICSS_BLOCK_SIZE
> +		 */
> +		if (pkt_info->length < bytes)
> +			bytes = pkt_info->length;
> +
> +		/* If applicable, account for the HSR tag removed */
> +		bytes -= start_offset;
> +
> +		/* copy non-wrapped part */
> +		memcpy(dst_addr, src_addr, bytes);
> +
> +		/* copy wrapped part */
> +		dst_addr += bytes;
> +		remaining = actual_pkt_len - bytes;
> +
> +		src_addr = ocmc_ram + rxqueue->buffer_offset;
> +		memcpy(dst_addr, src_addr, remaining);
> +		src_addr += remaining;
> +	} else {
> +		memcpy(dst_addr, src_addr, actual_pkt_len);
> +		src_addr += actual_pkt_len;
> +	}
> +
> +	if (!pkt_info->sv_frame) {
> +		skb_put(skb, actual_pkt_len);
> +
> +		/* send packet up the stack */
> +		skb->protocol = eth_type_trans(skb, ndev);
> +		local_bh_disable();
> +		netif_receive_skb(skb);
> +		local_bh_enable();
> +	} else {
> +		dev_kfree_skb_any(skb);
> +	}
> +
> +	/* update stats */
> +	ndev->stats.rx_bytes += actual_pkt_len;
> +	ndev->stats.rx_packets++;

See comment below about atomicity.

> +	return 0;
> +}
> +
> +/**
> + * icssm_emac_rx_thread - EMAC Rx interrupt thread handler
> + * @irq: interrupt number
> + * @dev_id: pointer to net_device
> + *
> + * EMAC Rx Interrupt thread handler - function to process the rx frames in a
> + * irq thread function. There is only limited buffer at the ingress to
> + * queue the frames. As the frames are to be emptied as quickly as
> + * possible to avoid overflow, irq thread is necessary. Current implementation
> + * based on NAPI poll results in packet loss due to overflow at
> + * the ingress queues. Industrial use case requires loss free packet
> + * processing. Tests shows that with threaded irq based processing,
> + * no overflow happens when receiving at ~92Mbps for MTU sized frames and thus
> + * meet the requirement for industrial use case.

That's interesting. Any idea why this is the case? Is there not
enough CPU for softirq/NAPI processing to run or something? I
suppose I'd imagine that NAPI would run and if data is arriving fast
enough, the NAPI would be added to the repoll list and processed
later.

So I guess either there isn't enough CPU or the ingress queues don't
have many descriptors or something like that ?

> + *
> + * Return: interrupt handled condition
> + */
> +static irqreturn_t icssm_emac_rx_thread(int irq, void *dev_id)
> +{
> +	struct net_device *ndev = (struct net_device *)dev_id;
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_queue_desc __iomem *queue_desc;
> +	const struct prueth_queue_info *rxqueue;
> +	struct prueth *prueth = emac->prueth;
> +	struct net_device_stats *ndevstats;
> +	struct prueth_packet_info pkt_info;
> +	int start_queue, end_queue;
> +	void __iomem *shared_ram;
> +	u16 bd_rd_ptr, bd_wr_ptr;
> +	u16 update_rd_ptr;
> +	u8 overflow_cnt;
> +	u32 rd_buf_desc;
> +	int used = 0;
> +	int i, ret;
> +
> +	ndevstats = &emac->ndev->stats;

FWIW the docs in include/linux/netdevice.h say:

/**
 ...
 *      @stats:         Statistics struct, which was left as a legacy, use
 *                      rtnl_link_stats64 instead
 ...
 */
struct net_device {
  ...
  struct net_device_stats stats; /* not used by modern drivers */
  ...
};

perhaps consider using rtnl_link_stats64 as suggested instead?

> +	shared_ram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
> +
> +	start_queue = emac->rx_queue_start;
> +	end_queue = emac->rx_queue_end;
> +retry:
> +	/* search host queues for packets */
> +	for (i = start_queue; i <= end_queue; i++) {
> +		queue_desc = emac->rx_queue_descs + i;
> +		rxqueue = &queue_infos[PRUETH_PORT_HOST][i];
> +
> +		overflow_cnt = readb(&queue_desc->overflow_cnt);
> +		if (overflow_cnt > 0) {
> +			emac->ndev->stats.rx_over_errors += overflow_cnt;
> +			/* reset to zero */
> +			writeb(0, &queue_desc->overflow_cnt);
> +		}
> +
> +		bd_rd_ptr = readw(&queue_desc->rd_ptr);
> +		bd_wr_ptr = readw(&queue_desc->wr_ptr);
> +
> +		/* while packets are available in this queue */
> +		while (bd_rd_ptr != bd_wr_ptr) {
> +			/* get packet info from the read buffer descriptor */
> +			rd_buf_desc = readl(shared_ram + bd_rd_ptr);
> +			icssm_parse_packet_info(prueth, rd_buf_desc, &pkt_info);
> +
> +			if (pkt_info.length <= 0) {
> +				/* a packet length of zero will cause us to
> +				 * never move the read pointer ahead, locking
> +				 * the driver, so we manually have to move it
> +				 * to the write pointer, discarding all
> +				 * remaining packets in this queue. This should
> +				 * never happen.
> +				 */
> +				update_rd_ptr = bd_wr_ptr;
> +				ndevstats->rx_length_errors++;

See question below.

> +			} else if (pkt_info.length > EMAC_MAX_FRM_SUPPORT) {
> +				/* if the packet is too large we skip it but we
> +				 * still need to move the read pointer ahead
> +				 * and assume something is wrong with the read
> +				 * pointer as the firmware should be filtering
> +				 * these packets
> +				 */
> +				update_rd_ptr = bd_wr_ptr;
> +				ndevstats->rx_length_errors++;

in netdevice.h it says:

* struct net_device_stats* (*ndo_get_stats)(struct net_device *dev);
*      Called when a user wants to get the network device usage
*      statistics. Drivers must do one of the following:
*      1. Define @ndo_get_stats64 to fill in a zero-initialised
*         rtnl_link_stats64 structure passed by the caller.
*      2. Define @ndo_get_stats to update a net_device_stats structure
*         (which should normally be dev->stats) and return a pointer to
*         it. The structure may be changed asynchronously only if each
*         field is written atomically.
*      3. Update dev->stats asynchronously and atomically, and define
*         neither operation.

I didn't look in the other patches to see if ndo_get_stats is
defined or not, but are these increments atomic?

