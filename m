Return-Path: <linux-omap+bounces-3242-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36652A23230
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 17:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2553E3A3A75
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 16:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77781EEA3E;
	Thu, 30 Jan 2025 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKvn5QCO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A66D1EBA09;
	Thu, 30 Jan 2025 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255525; cv=none; b=ebS5b8gJkwUrAuaphjyVIF24pwLGCR1G22YX0N5g/Iil26SAJodorVlWdpwM1gyD7ONenzrCENVKVwSSoorZzDQBdnyrm+WlbQNyYG7BhlPofWts4+ratKWaoa5hl9kxCWbtO4NqEyyb+WgkDdBtNx9K9phRBQAxdnUvyFsTKRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255525; c=relaxed/simple;
	bh=jWf2CZnQEG7SXBVcZ508uMx8eAuNJOnmC6clM+twjls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VltCn5zE8IJizQifBtJFxXhCY+kbn7rJXr2xs8m9CDSPo11ieVAZqvR8bjdwelGgTFIvGchcbLX0mLE2wuFQYyZRUI8bWBjPTrN8fPLnrD3rr2C8rtmM+PWWez9u0hIUUGms5q/LgPLWZ9hE3cur+JaeVYwf9mY4bBBLrAz5jbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKvn5QCO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C2FC4CED2;
	Thu, 30 Jan 2025 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738255524;
	bh=jWf2CZnQEG7SXBVcZ508uMx8eAuNJOnmC6clM+twjls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKvn5QCOkmjdiW7oAvxSc53AAMbliawqVOmafoZBGgMUkKmyvWZEDSmgHMoULI265
	 Czvx3xXh7pri/q2XDmdAJggeTXuumXpkNCGzFdh/FFC5i8JjVxHY5tNwAN4a2DbFGI
	 /3Ge7T5ZCTdFiF9A695f99qEXU7XnGfRx3y8U20Oh+7qy/70naYUhuNrn5kTMsYTuW
	 U2D/kTuia4LZEq7qynyoPn2X409eLvRg/Wdjq7RrroTj6dsOYZDDSlFNhkqu63aFwt
	 FxLVcVl0evUzQJr5IWClNnoYuV4TUGdu8bQxghvDkmB+NVxFUW2I7F4V/rQBLuMQXU
	 +8GcAn12P9cmw==
Date: Thu, 30 Jan 2025 16:45:15 +0000
From: Simon Horman <horms@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
Message-ID: <20250130164515.GC13457@kernel.org>
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

...

> +/**
> + * icssm_emac_ndo_start_xmit - EMAC Transmit function
> + * @skb: SKB pointer
> + * @ndev: EMAC network adapter
> + *
> + * Called by the system to transmit a packet  - we queue the packet in
> + * EMAC hardware transmit queue
> + *
> + * Return: success(NETDEV_TX_OK) or error code (typically out of desc's)
> + */
> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
> +				     struct net_device *ndev)

I think the return type of this function should be netdev_tx_t
rather than int to match the signature of ndo_start_xmit
in struct net_device_ops.

Flagged by W=1 build with clang-19
(-Wincompatible-function-pointer-types-strict).

...

>  static const struct net_device_ops emac_netdev_ops = {
>  	.ndo_open = icssm_emac_ndo_open,
>  	.ndo_stop = icssm_emac_ndo_stop,
> +	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
>  };
>  
>  /* get emac_port corresponding to eth_node name */

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h

...

> @@ -76,6 +82,32 @@ struct prueth_queue_info {
>  	u16 buffer_desc_end;
>  } __packed;
>  
> +/**
> + * struct prueth_packet_info - Info about a packet in buffer
> + * @start_offset: start offset of the frame in the buffer for HSR/PRP
> + * @shadow: this packet is stored in the collision queue
> + * @port: port packet is on
> + * @length: length of packet
> + * @broadcast: this packet is a broadcast packet
> + * @error: this packet has an error
> + * @sv_frame: indicate if the frame is a SV frame for HSR/PRP
> + * @lookup_success: src mac found in FDB
> + * @flood: packet is to be flooded
> + * @timstamp: Specifies if timestamp is appended to the packet

nit: @timestamp

> + */
> +struct prueth_packet_info {
> +	bool start_offset;
> +	bool shadow;
> +	unsigned int port;
> +	unsigned int length;
> +	bool broadcast;
> +	bool error;
> +	bool sv_frame;
> +	bool lookup_success;
> +	bool flood;
> +	bool timestamp;
> +};

...

