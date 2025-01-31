Return-Path: <linux-omap+bounces-3244-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D73A23C4A
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jan 2025 11:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8FBC1884601
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jan 2025 10:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53E31B21BC;
	Fri, 31 Jan 2025 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJKwgYx4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66516ABC6;
	Fri, 31 Jan 2025 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738319642; cv=none; b=cEYlE0K8uVVm4K6fU7mdiNjGVwqr44fnBT9wHB6LdBNCQKCyYWqoMiq11r3xRaHFQ0BlA5R1C6MB9uOMGhtk1VsvbgjPAO6YduoLAQUtKg1iuCZet6+0HOX2vE342rEKoV8iM95hnuGtuuNpWdSftAY9aA/EyyXf+DWvrapD0OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738319642; c=relaxed/simple;
	bh=507IordbBCY3IYNuq34NGFeKCmJd+B5w6IiJLC+fePs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDTlfEvOUZ2sQo8zEwrZZHBf2pVhbGB11nh9tsgyksuf57g39VTw1QIRJYFxgDQCSN9nZiCi/4OPGC7x9aOTbWh04oSkJn4IgUWPrS5RCyueFuKKszS0TCfQZRoRJHBKuXR9vj+qc9ezoS8AfCuDCQ28drS4ftiUoCDsjE7bh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJKwgYx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B3EC4CED1;
	Fri, 31 Jan 2025 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738319641;
	bh=507IordbBCY3IYNuq34NGFeKCmJd+B5w6IiJLC+fePs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJKwgYx4wGk4PbRGB4npZ2QBeZdqUHm9GDObPJLYwi4QVAeIiD/JUAEdJCA4jfVJX
	 rUJtHR6NXauwiMPCI8XW39mtJWVtbqbHXrWIojC0Q9wyE6Ha2DVWQz1qoFjicDUSz0
	 hxQIAv3AdOZAcrJShTqAxDvFYg4zExkFycMUDIy3KdBbHiTIwPuM4qfvswmshxj8dz
	 MQHzCMpmponYQWuk6LezAa/Qlzp5c3quNX8bQml4td8phwAx9E4ghEJBsP5T6Kjc1J
	 G9dXBO8Z8/Dak5ChT1OTFimS/bk21VAii6mJLZYx+xg9MbvJCPO9DGTYWtgX/cvHT/
	 gmD2oalMNaqzA==
Date: Fri, 31 Jan 2025 10:33:52 +0000
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
Subject: Re: [RFC v2 PATCH 06/10] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
Message-ID: <20250131103352.GH24105@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124134056.1459060-7-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124134056.1459060-7-basharath@couthit.com>

On Fri, Jan 24, 2025 at 07:10:52PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
> 
> This change includes interaction between firmware and user space
> application (ptp4l) with required packet timestamps. The driver
> initializes the PRU firmware with appropriate mode and configuration
> flags. Firmware updates local registers with the flags set by driver
> and uses for further operation. RX SOF timestamp comes along with
> packet and firmware will rise interrupt with TX SOF timestamp after
> pushing the packet on to the wire.
> 
> IEP driver is available in upstream and we are reusing for hardware
> configuration for ICSSM as well. On top of that we have extended it
> with the changes for AM57xx SoC.
> 
> Extended ethtool for reading HW timestamping capability of the PRU
> interfaces.
> 
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

...

> @@ -682,9 +899,22 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
>  		src_addr += actual_pkt_len;
>  	}
>  
> +	if (pkt_info->timestamp) {
> +		src_addr = (void *)roundup((uintptr_t)src_addr,
> +					   ICSS_BLOCK_SIZE);

Can PTR_ALIGN() be used here?

> +		dst_addr = &ts;
> +		memcpy(dst_addr, src_addr, sizeof(ts));
> +	}
> +
>  	if (!pkt_info->sv_frame) {
>  		skb_put(skb, actual_pkt_len);
>  
> +		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
> +		    pkt_info->timestamp) {
> +			ssh = skb_hwtstamps(skb);
> +			memset(ssh, 0, sizeof(*ssh));
> +			ssh->hwtstamp = ns_to_ktime(ts);
> +		}
>  		/* send packet up the stack */
>  		skb->protocol = eth_type_trans(skb, ndev);
>  		local_bh_disable();

The code preceding the hunk below is:

static int icssm_emac_request_irqs(struct prueth_emac *emac)
{
	struct net_device *ndev = emac->ndev;
	int ret;

	ret = request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_thread,
				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
				   ndev->name, ndev);
	if (ret) {
		netdev_err(ndev, "unable to request RX IRQ\n");
		return ret;
	}

> @@ -855,9 +1085,64 @@ static int icssm_emac_request_irqs(struct prueth_emac *emac)
>  		return ret;
>  	}
>  
> +	if (emac->emac_ptp_tx_irq) {
> +		ret = request_threaded_irq(emac->emac_ptp_tx_irq,
> +					   icssm_prueth_ptp_tx_irq_handle,
> +					   icssm_prueth_ptp_tx_irq_work,
> +					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					   ndev->name, ndev);
> +		if (ret) {
> +			netdev_err(ndev, "unable to request PTP TX IRQ\n");
> +			free_irq(emac->rx_irq, ndev);
> +			free_irq(emac->tx_irq, ndev);

This seems somewhat asymmetric. This function does request emac->rx_irq
but not emac->tx_irq. So I don't think it is appropriate to free emac->tx_irq
here.

Also, I would suggest using a goto label for unwind here.

> +		}
> +	}
> +
>  	return ret;
>  }
>  

...

