Return-Path: <linux-omap+bounces-3239-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A859A22CA6
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 12:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58AE93A4BCB
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 11:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF5E1DE8BA;
	Thu, 30 Jan 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVeS/PJ5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D77C1AB507;
	Thu, 30 Jan 2025 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237315; cv=none; b=Gpzytzci/wMSqd4HOHulElY1vDo8ZGXJNjRHUDmftDsSJBKeV2f2QmY5OdD7eha7QYQcF8jsBCnFoUj+BrCFlTbVu5yHmJEmZz2FS5EuXa55mmSQ0UTuk83s+JxvJbra3724XBMF7jmv6II1XoS57jKDJ8zKAyNk7kYld255T48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237315; c=relaxed/simple;
	bh=zGGDx72jO5SaCwxhGo8Hf3CSZMZACAKlKE/UujYgRPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwhP4ScffAz0sJ/AHehAASKZwKuoh4dHBE6lHx2FISAqzX3iq6Z+2pJ3XQ4geBIvwH9TjHjlV7vOtPG2+adPJgrf+mhCcfvGuASqrwmb5RP8s/kEny/Hl+9vfUM3D1f6O7wisaJ+UezaDuPR600J+EGeIVX/fmQ5AIcZpZZkzuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVeS/PJ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA076C4CED2;
	Thu, 30 Jan 2025 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738237314;
	bh=zGGDx72jO5SaCwxhGo8Hf3CSZMZACAKlKE/UujYgRPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVeS/PJ55W7IvF7P3tKbosmE6FOorkc/HwVcjgBKE4RcehzsLYuFEEyhFjAjOfEk+
	 oUKNhRM7zYp5izAXKmJUjv75tJFPy1TY9pDc1Vys0MhJpf/j3lMvEytBz5+/fpjqiB
	 kMPTGT/slnYOqvCvAciwcdpFNK/phdbPXTQYX61PrAQBqREcwO96j67r0P56dB9HcH
	 qWdGIY9lpZDpPY+ZRhIu1N2GaeGEKA2G89E4dQUovpHs+54lzsLNL5m1sXqLm8Eg88
	 1BxQngOUNnhBo+iAXFBUnJ8DC6hmPbUcWLLTiPsUnKYl/NoPF2hFnOB8TmSLQOzxdW
	 ONG2Y1kM3Thgw==
Date: Thu, 30 Jan 2025 11:41:45 +0000
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
Subject: Re: [RFC v2 PATCH 02/10] net: ti: prueth: Adds ICSSM Ethernet driver
Message-ID: <20250130114145.GM113107@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-3-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124122353.1457174-3-basharath@couthit.com>

On Fri, Jan 24, 2025 at 05:53:45PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates Kernel configuration to enable PRUETH driver and its dependencies
> along with makefile changes to add the new PRUETH driver.
> 
> Changes includes init and deinit of ICSSM PRU Ethernet driver including
> net dev registration and firmware loading for DUAL-MAC mode running on
> PRU-ICSS2 instance.
> 
> Changes also includes link handling, PRU booting, default firmware loading
> and PRU stopping using existing remoteproc driver APIs.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

...

> +static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
> +				   struct net_device *ndev)
> +{
> +	const struct prueth_firmware *pru_firmwares;
> +	struct prueth *prueth = emac->prueth;
> +	const char *fw_name;
> +	int ret;
> +
> +	pru_firmwares = &prueth->fw_data->fw_pru[emac->port_id - 1];
> +	fw_name = pru_firmwares->fw_name[prueth->eth_type];
> +	if (!fw_name) {
> +		netdev_err(ndev, "eth_type %d not supported\n",
> +			   prueth->eth_type);
> +		return -ENODEV;
> +	}
> +
> +	ret = rproc_set_firmware(emac->pru, fw_name);
> +	if (ret) {
> +		netdev_err(ndev, "failed to set PRU0 firmware %s: %d\n",
> +			   fw_name, ret);
> +		return ret;
> +	}
> +
> +	ret = rproc_boot(emac->pru);
> +	if (ret) {
> +		netdev_err(ndev, "failed to boot PRU0: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * icssm_emac_ndo_open - EMAC device open
> + * @ndev: network adapter device
> + *
> + * Called when system wants to start the interface.
> + *
> + * Return: 0 for a successful open, or appropriate error code
> + */
> +static int icssm_emac_ndo_open(struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	int ret;
> +
> +	ret = icssm_emac_set_boot_pru(emac, ndev);
> +	if (ret)
> +		netdev_err(ndev, "failed to boot PRU: %d\n", ret);

Hi Roger, Basharath, all,

icssm_emac_set_boot_pru() already logs errors, including the one above.
So this log seems unnecessary to me.

Also, should an error be returned here?  If so, it looks like
icssm_emac_set_boot_pru() should release resources allocated by
rproc_set_firmware() if rproc_boot() fails.

> +
> +	/* start PHY */
> +	phy_start(emac->phydev);
> +
> +	return 0;
> +}

...

> +static int icssm_prueth_netdev_init(struct prueth *prueth,
> +				    struct device_node *eth_node)
> +{
> +	struct prueth_emac *emac;
> +	struct net_device *ndev;
> +	enum prueth_port port;
> +	enum prueth_mac mac;
> +	int ret;
> +
> +	port = icssm_prueth_node_port(eth_node);
> +	if (port == PRUETH_PORT_INVALID)
> +		return -EINVAL;
> +
> +	mac = icssm_prueth_node_mac(eth_node);
> +	if (mac == PRUETH_MAC_INVALID)
> +		return -EINVAL;
> +
> +	ndev = devm_alloc_etherdev(prueth->dev, sizeof(*emac));
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	SET_NETDEV_DEV(ndev, prueth->dev);
> +	emac = netdev_priv(ndev);
> +	prueth->emac[mac] = emac;
> +	emac->prueth = prueth;
> +	emac->ndev = ndev;
> +	emac->port_id = port;
> +
> +	/* by default eth_type is EMAC */
> +	switch (port) {
> +	case PRUETH_PORT_MII0:
> +		emac->pru = prueth->pru0;
> +		break;
> +	case PRUETH_PORT_MII1:
> +		emac->pru = prueth->pru1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	/* get mac address from DT and set private and netdev addr */
> +	ret = of_get_ethdev_address(eth_node, ndev);
> +	if (!is_valid_ether_addr(ndev->dev_addr)) {
> +		eth_hw_addr_random(ndev);
> +		dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
> +			 port, ndev->dev_addr);
> +	}
> +	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
> +
> +	/* connect PHY */
> +	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
> +					      icssm_emac_adjust_link);
> +	if (!emac->phydev) {
> +		dev_dbg(prueth->dev, "PHY connection failed\n");
> +		ret = -EPROBE_DEFER;

Perhaps I misunderstand things, but if this occurs then
presumably icssm_prueth_netdev_init() will be called again.
And for each time this occirs another ndev will be allocated
by devm_alloc_etherdev(), each of which will only be freed
once the device is eventually torn-down.

I wonder if it would be better to free ndev here.
Which I think would imply using a non-mdev allocation for symmetry.

Similarly for resources allocated in the caller icssm_prueth_probe().

> +		goto free;
> +	}
> +
> +	/* remove unsupported modes */
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
> +
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
> +
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
> +
> +	ndev->netdev_ops = &emac_netdev_ops;
> +
> +	return 0;
> +free:

nit: This doesn't free anything.

> +	prueth->emac[mac] = NULL;
> +
> +	return ret;
> +}

...

