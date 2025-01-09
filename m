Return-Path: <linux-omap+bounces-3057-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E973A07CB5
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 17:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D47E1188B877
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 16:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250982206A4;
	Thu,  9 Jan 2025 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uY95dm5I"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA25421D5A2;
	Thu,  9 Jan 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438409; cv=none; b=q5q9aNAoGDPSaDWdJlzbrcMf4MVYT5mLj5EYJpdcYXB1jnxAGghTvo+IQXLyUVkHtR9u2tqbG4fqLa4rx1LLsqCt2sgj/FEDzAooWGtPN4eUhv0ieo8E+Z0Oq3Zm18Uvb9TrYtUKyf2bJ7b70bpynd4BaMQppr9hGk1g8hQnHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438409; c=relaxed/simple;
	bh=Uib6XpZ05ywcy62yjhlx7RE9rA6p6CYDoTuOEAzWHYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SV+T0q50swmjMryoVk1eDwUrQlUb/EyXdxZO5m7hM84Mh/lvTkt/OR/H2laCzd57m7ZtjNJ/52Qfobhk47ybQ8Nsbx9nXpUhEmF/nF1jvPlFV/BHhWvjwnwFk8g342s5AZRoxO1Es5wpqpIPmnmCgh8yeJMepGTb7aI/YASKyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uY95dm5I; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pzR/wMuf1nnyhOUGoFlXNXtnpWcAtaCPW+hwUeyzxTc=; b=uY95dm5IbEO+lZ/23kUPcLn0me
	vj53OxQCxDOZLeTmmmXdHJNiicpSNuHU+LTtw18kblwwKJ0xPK74hPe6UBQCRRGxR59YjYNjzZtiZ
	lHM3fZm8hJO5B82TcpMRi8UWvlGCTcKHm8dxAydn8WeYDcvB11sNd9ZzJTD2ZH1LCcyo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVuwk-002wO9-6i; Thu, 09 Jan 2025 16:59:46 +0100
Date: Thu, 9 Jan 2025 16:59:46 +0100
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
Subject: Re: [RFC PATCH 02/10] net: ti: prueth: Adds ICSSM Ethernet driver
Message-ID: <5ba6bbf2-52e4-49d0-b6e2-134fb25ebe4c@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-3-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-3-basharath@couthit.com>

> +	emac->phy_node = of_parse_phandle(eth_node, "phy-handle", 0);
> +	if (!emac->phy_node) {
> +		dev_err(prueth->dev, "couldn't find phy-handle\n");
> +		ret = -ENODEV;
> +		goto free;
> +	}
> +
> +	ret = of_get_phy_mode(eth_node, &emac->phy_if);
> +	if (ret) {
> +		dev_err(prueth->dev, "could not get phy-mode property err %d\n",
> +			ret);
> +		goto free;
> +	}
> +
> +	/* connect PHY */
> +	emac->phydev = of_phy_connect(ndev, emac->phy_node,
> +				      &icssm_emac_adjust_link, 0, emac->phy_if);
> +	if (!emac->phydev) {
> +		dev_dbg(prueth->dev, "couldn't connect to phy %s\n",
> +			emac->phy_node->full_name);
> +		ret = -EPROBE_DEFER;
> +		goto free;
> +	}

of_phy_get_and_connect() will simplify this.

> +	/* remove unsupported modes */
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);

It only does 100Mbps?

> +	if (of_property_read_bool(eth_node, "ti,no-half-duplex")) {

Is this becasue 100baseT_Half is broken in some versions of the
hardware?

> +		phy_remove_link_mode(emac->phydev,
> +				     ETHTOOL_LINK_MODE_100baseT_Half_BIT);
> +	}
> +
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);

Is this really needed? I've not checked, but if you don't call
phy_support_sym_pause() or phy_support_asym_pause(), i would of
expected phylib to default to no pause?

> +static const struct of_device_id prueth_dt_match[];

Please avoid forward references. If you need the match table, define
it here.

	Andrew

