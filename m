Return-Path: <linux-omap+bounces-3060-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33421A07D68
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 17:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14A1188B3F3
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 16:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D3F221DB3;
	Thu,  9 Jan 2025 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mv7JKCcr"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC82206AE;
	Thu,  9 Jan 2025 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439922; cv=none; b=jtSUlZMNXuaEdDIXm/RWQ29mII3LpAzwtNHIpYCQcJVwrYEiRuFaokQoK3ADxkXpKfJw1bDBvXRAruZag/V84+pVZLllhUzbRH4UxP6kgfU/9oqlz7hPul+tPft7WjHZC2/3vRuizo2Q2mmykwOQCRzYDWr0rkBCeSMcn4jBr9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439922; c=relaxed/simple;
	bh=l+rXxODw+VS9BSJrzGpfyM9tNsZ0dhwPA/7+8v0Fzs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpVTMC+bSh+Eor3LS1SjXV8/3cBTxCoJL+7Hc5T4y/giJqsupIskiMBmKxb9kfDoVZ8lxtmMsAIMoLiAfwUfb8SM71sv5vAEwgpRBD0vmvPiGscFV8WBMgOd019gr2WUZQqybp+EtCD8vvPOvjBvT3Xkqhh+rJZWRrQuQ/qSNdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mv7JKCcr; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TTXini+czMs1unGWfy+9RDBWtdxNH7Ox1uD++fpTx/0=; b=mv7JKCcr1Vdbzmm78Cb8yDIma2
	KvWR974hzYEBNpvuEPDgEKZPrL4Y28RUqK0390pXSfABbnf8X0Q501h5s9MAW6asQgLZdd0jPB8gk
	/ndpidG2eAMuZX2FV2ktO5JdhBglJmtuTui7VkmSIhLXTO7iVf4uzoW8asKW9YIfxiK4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVvL9-002wx8-Ey; Thu, 09 Jan 2025 17:24:59 +0100
Date: Thu, 9 Jan 2025 17:24:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
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
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and
 TX support.
Message-ID: <fce8d698-2ae2-460c-a288-3d70d61dbf9e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-5-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-5-basharath@couthit.com>

> +/* update phy/port status information for firmware */
> +static void icssm_emac_update_phystatus(struct prueth_emac *emac)
> +{
> +	struct prueth *prueth = emac->prueth;
> +	u32 phy_speed, port_status = 0;
> +	enum prueth_mem region;
> +	u32 delay;
> +
> +	region = emac->dram;
> +	phy_speed = emac->speed;
> +	icssm_prueth_write_reg(prueth, region, PHY_SPEED_OFFSET, phy_speed);
> +
> +	if (phy_speed == SPEED_10)
> +		delay = TX_CLK_DELAY_10M;

How can speed to 10? You removed those link modes?

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
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	int ret = 0;
> +	u16 qid;
> +
> +	if (unlikely(!emac->link)) {
> +		if (netif_msg_tx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "No link to transmit");
> +		goto fail_tx;
> +	}

Do many other MAC drivers have this test?

> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> @@ -17,6 +17,11 @@
>  
>  /* PRUSS local memory map */
>  #define ICSS_LOCAL_SHARED_RAM	0x00010000
> +#define EMAC_MAX_PKTLEN		(ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN)
> +/* Below macro is for 1528 Byte Frame support, to Allow even with
> + * Redundancy tag
> + */
> +#define EMAC_MAX_FRM_SUPPORT (ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN + 6)

This looks familiar....

	Andrew

