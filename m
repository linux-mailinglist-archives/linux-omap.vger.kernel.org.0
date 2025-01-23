Return-Path: <linux-omap+bounces-3190-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80CA19EE4
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 08:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C62543A304D
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 07:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A2420B7EB;
	Thu, 23 Jan 2025 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="RCJG0LZS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8201BD01F;
	Thu, 23 Jan 2025 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617143; cv=none; b=YhVXMWmCtV5y5919bNX/jDuC1jdnYkypyxiG4xSakkYHYPg1dsZX84KwqyJVIRqf2YvKVqeB5RLB6OBu1JOoCS2fwk8w8HMIG0BxqwK1CCNpfuInlJPrRdmCVuW+UJZ5EcDSOC1Reo6tWmWWFXMuKuTf19PLvd8Xmtwt3lwoQKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617143; c=relaxed/simple;
	bh=4Ybj/gzCNGADDvvknNkxFQvNmzXh/yVwMcxfNAtmbNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSVrlQuXxo+hOLMqimYKjxLYl88Xjk9hqtx7/whAVH/duQo95wUDj+9goFdmLrOt8waN3eOQ3HQAlg9IEltpTNrFfNVcnlJKfc3OTLAGNGXZmU9ad4okFdZ1IzMztJ/7HOgNQ4b5GGiF/he+T9XotJzTFv/zhj9QSLY58HFZ0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=RCJG0LZS; arc=none smtp.client-ip=80.12.242.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id arRhtWwm7puS4arRktmPw9; Thu, 23 Jan 2025 08:16:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737616579;
	bh=hcGfEedhE7m9EkCg6qCuIbrFQfNbCC4sY3ipNadpGYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RCJG0LZST/c9iDLh1h2eAi6tSx/hpX4+/bh3htnH7e0khwHvVG9w0wmLaMSqWoIKp
	 Dj5MuOopdZZPzFZYTVgeAZP4r2kEpipHdhLDaXRcWSFYkFdOQIpMyxwZRoAMy2ktAn
	 Bje5JvwCdghoQ+Lc979DeoZ1Hp86EW8rXBWf9vsznO3tlugwsDRcD88SPPpHSLw/zo
	 MElRrxYMfPZt3Mo6dn1oOk5onWSMY+Nzc/GUus2vqY28VyMd5DkisxlmxxqXjzLfQX
	 J8Q+ovpUs4OrHzP4QjQjV3YjYnNw726t2qx+ebfn8P6xe+c0g4FSEXAqp/a/O9M0Wy
	 97uvgBG44uDDQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 23 Jan 2025 08:16:19 +0100
X-ME-IP: 90.11.132.44
Message-ID: <6ac6161b-373a-47ce-801d-9e4ff1ef258c@wanadoo.fr>
Date: Thu, 23 Jan 2025 08:16:09 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and TX
 support.
To: Basharath Hussain Khaja <basharath@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
 tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
 schnelle@linux.ibm.com, rdunlap@infradead.org, diogo.ivo@siemens.com,
 m-karicheri2@ti.com, horms@kernel.org, jacob.e.keller@intel.com,
 m-malladi@ti.com, javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
 vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-5-basharath@couthit.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250109105600.41297-5-basharath@couthit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/01/2025 à 11:55, Basharath Hussain Khaja a écrit :
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

Hi,
a few nitpicks.

...

> +static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
> +				   struct sk_buff *skb,
> +				   enum prueth_queue_id queue_id)
> +{
> +	struct prueth_queue_desc __iomem *queue_desc;
> +	const struct prueth_queue_info *txqueue;
> +	u16 bd_rd_ptr, bd_wr_ptr, update_wr_ptr;
> +	struct net_device *ndev = emac->ndev;
> +	unsigned int buffer_desc_count;
> +	int free_blocks, update_block;
> +	bool buffer_wrapped = false;
> +	int write_block, read_block;
> +	void *src_addr, *dst_addr;
> +	int pkt_block_size;
> +	void __iomem *dram;
> +	int txport, pktlen;
> +	u32 wr_buf_desc;
> +	void *ocmc_ram;
> +
> +	dram = emac->prueth->mem[emac->dram].va;
> +	if (eth_skb_pad(skb)) {
> +		if (netif_msg_tx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "packet pad failed");

Missing trailing \n.

> +		return -ENOMEM;
> +	}
> +
> +	/* which port to tx: MII0 or MII1 */
> +	txport = emac->tx_port_queue;

...

> +static int icssm_emac_request_irqs(struct prueth_emac *emac)
> +{
> +	struct net_device *ndev = emac->ndev;
> +	int ret = 0;

No need to init.

> +
> +	ret = request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_thread,
> +				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +				   ndev->name, ndev);
> +	if (ret) {
> +		netdev_err(ndev, "unable to request RX IRQ\n");
> +		return ret;
> +	}

...

> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
> +				     struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	int ret = 0;
> +	u16 qid;
> +
> +	if (unlikely(!emac->link)) {
> +		if (netif_msg_tx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "No link to transmit");

\n

> +		goto fail_tx;
> +	}
> +
> +	qid = icssm_prueth_get_tx_queue_id(emac->prueth, skb);...
CJ

