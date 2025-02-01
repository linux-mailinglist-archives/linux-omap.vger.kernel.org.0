Return-Path: <linux-omap+bounces-3252-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8BA24960
	for <lists+linux-omap@lfdr.de>; Sat,  1 Feb 2025 14:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D71B3165D87
	for <lists+linux-omap@lfdr.de>; Sat,  1 Feb 2025 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113B31B422D;
	Sat,  1 Feb 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="SkVy7t4i"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFA91ADC86;
	Sat,  1 Feb 2025 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738416374; cv=none; b=h86Evzp++7cFWBe/28uL4L64EPvEUbqeur0uSrr4IFutaIOvSO2BBXkxLsRNtZyvBf4vU3k36j4V6r6vtBfv2IEKYIZnRTUIjd5f3qTAcUX0Hs2v3CgaHzwhc+9waTpITTDHduBnp1RAUni3uuLB/7HSdN366r/kbFIvq8WzWeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738416374; c=relaxed/simple;
	bh=b3O/qSbqNNQ28t3nk7RjAgzIrSwggCwl7A5uBoO1iaY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=aczAN1ekFkISO4QvCCNspVX1A1EzzKOiJwxJiqOpOfXHZwAaaFtAGghCC6ZPiqTz+fr9BYC7ESTT24olreEGZiqzio7UoVqn5BzoNSPw6u7/kwVvNc+wCcGpydJ0Vi6Upb9PJNeDV+VMTGCV24AfSmMBynsvfzNIlKEwhuTqjwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=SkVy7t4i; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=T7G3hSUc9bTIrJebJihtbB+qLlY0pl3Vs5vlzJrMpIE=; b=SkVy7t4imij8wKcsbqYb3ZTVaV
	9cxy5eHu5FDYeZm1TR4XgWapoNjlIwZ8sSAw7vJ93fj2H7bdk5LkyXojq2Eimi1eBq6low1x4aaFS
	y5s+YY+WOsRnssN7ApakP0rDbalVYdWBerukgeqb1ILe10CCQ7iM2+TmZxvm7zLQtx8Imcqc+OgtZ
	JNmVTNedPgt90+eaQ6GR3C8PTxqRtKYbKI5DLb+8P+Y6e88SasGx0bSsI+TtO7TsUZw3wCv8NWN8C
	edt2B+WFOZ01jf6wP/Ew9fBNOEC10DDambnM5cSS4TAfmjmuC64aTA1yC+1+l+avJFz3LGs9baf9v
	k2RBrTZw==;
Received: from [122.175.9.182] (port=63123 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1teDVW-0003sY-2y;
	Sat, 01 Feb 2025 18:55:59 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 71F301781C56;
	Sat,  1 Feb 2025 18:55:47 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 4A67A1782035;
	Sat,  1 Feb 2025 18:55:47 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bv297qfT9IZd; Sat,  1 Feb 2025 18:55:47 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 02E011781C56;
	Sat,  1 Feb 2025 18:55:47 +0530 (IST)
Date: Sat, 1 Feb 2025 18:55:46 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: horms <horms@kernel.org>
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
	m-karicheri2 <m-karicheri2@ti.com>, 
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
Message-ID: <269561652.481649.1738416346650.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250130114145.GM113107@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124122353.1457174-3-basharath@couthit.com> <20250130114145.GM113107@kernel.org>
Subject: Re: [RFC v2 PATCH 02/10] net: ti: prueth: Adds ICSSM Ethernet
 driver
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ICSSM Ethernet driver
Thread-Index: iTYs9GBoUdW9vbTht5x/pdwNyAgDdQ==
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


> On Fri, Jan 24, 2025 at 05:53:45PM +0530, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Updates Kernel configuration to enable PRUETH driver and its dependencies
>> along with makefile changes to add the new PRUETH driver.
>> 
>> Changes includes init and deinit of ICSSM PRU Ethernet driver including
>> net dev registration and firmware loading for DUAL-MAC mode running on
>> PRU-ICSS2 instance.
>> 
>> Changes also includes link handling, PRU booting, default firmware loading
>> and PRU stopping using existing remoteproc driver APIs.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> 
> ...
> 
>> +static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
>> +				   struct net_device *ndev)
>> +{
>> +	const struct prueth_firmware *pru_firmwares;
>> +	struct prueth *prueth = emac->prueth;
>> +	const char *fw_name;
>> +	int ret;
>> +
>> +	pru_firmwares = &prueth->fw_data->fw_pru[emac->port_id - 1];
>> +	fw_name = pru_firmwares->fw_name[prueth->eth_type];
>> +	if (!fw_name) {
>> +		netdev_err(ndev, "eth_type %d not supported\n",
>> +			   prueth->eth_type);
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = rproc_set_firmware(emac->pru, fw_name);
>> +	if (ret) {
>> +		netdev_err(ndev, "failed to set PRU0 firmware %s: %d\n",
>> +			   fw_name, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = rproc_boot(emac->pru);
>> +	if (ret) {
>> +		netdev_err(ndev, "failed to boot PRU0: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * icssm_emac_ndo_open - EMAC device open
>> + * @ndev: network adapter device
>> + *
>> + * Called when system wants to start the interface.
>> + *
>> + * Return: 0 for a successful open, or appropriate error code
>> + */
>> +static int icssm_emac_ndo_open(struct net_device *ndev)
>> +{
>> +	struct prueth_emac *emac = netdev_priv(ndev);
>> +	int ret;
>> +
>> +	ret = icssm_emac_set_boot_pru(emac, ndev);
>> +	if (ret)
>> +		netdev_err(ndev, "failed to boot PRU: %d\n", ret);
> 
> Hi Roger, Basharath, all,
> 
> icssm_emac_set_boot_pru() already logs errors, including the one above.
> So this log seems unnecessary to me.
> 
> Also, should an error be returned here?  If so, it looks like
> icssm_emac_set_boot_pru() should release resources allocated by
> rproc_set_firmware() if rproc_boot() fails.
> 

Agreed. We will remove the extra print and make sure allocated resources
are released appropriately in the next version.

>> +
>> +	/* start PHY */
>> +	phy_start(emac->phydev);
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +static int icssm_prueth_netdev_init(struct prueth *prueth,
>> +				    struct device_node *eth_node)
>> +{
>> +	struct prueth_emac *emac;
>> +	struct net_device *ndev;
>> +	enum prueth_port port;
>> +	enum prueth_mac mac;
>> +	int ret;
>> +
>> +	port = icssm_prueth_node_port(eth_node);
>> +	if (port == PRUETH_PORT_INVALID)
>> +		return -EINVAL;
>> +
>> +	mac = icssm_prueth_node_mac(eth_node);
>> +	if (mac == PRUETH_MAC_INVALID)
>> +		return -EINVAL;
>> +
>> +	ndev = devm_alloc_etherdev(prueth->dev, sizeof(*emac));
>> +	if (!ndev)
>> +		return -ENOMEM;
>> +
>> +	SET_NETDEV_DEV(ndev, prueth->dev);
>> +	emac = netdev_priv(ndev);
>> +	prueth->emac[mac] = emac;
>> +	emac->prueth = prueth;
>> +	emac->ndev = ndev;
>> +	emac->port_id = port;
>> +
>> +	/* by default eth_type is EMAC */
>> +	switch (port) {
>> +	case PRUETH_PORT_MII0:
>> +		emac->pru = prueth->pru0;
>> +		break;
>> +	case PRUETH_PORT_MII1:
>> +		emac->pru = prueth->pru1;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	/* get mac address from DT and set private and netdev addr */
>> +	ret = of_get_ethdev_address(eth_node, ndev);
>> +	if (!is_valid_ether_addr(ndev->dev_addr)) {
>> +		eth_hw_addr_random(ndev);
>> +		dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
>> +			 port, ndev->dev_addr);
>> +	}
>> +	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
>> +
>> +	/* connect PHY */
>> +	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
>> +					      icssm_emac_adjust_link);
>> +	if (!emac->phydev) {
>> +		dev_dbg(prueth->dev, "PHY connection failed\n");
>> +		ret = -EPROBE_DEFER;
> 
> Perhaps I misunderstand things, but if this occurs then
> presumably icssm_prueth_netdev_init() will be called again.
> And for each time this occirs another ndev will be allocated
> by devm_alloc_etherdev(), each of which will only be freed
> once the device is eventually torn-down.
> 
> I wonder if it would be better to free ndev here.
> Which I think would imply using a non-mdev allocation for symmetry.
> 
> Similarly for resources allocated in the caller icssm_prueth_probe().
> 

Agreed, we will address this error case and free the resources appropriately.

>> +		goto free;
>> +	}
>> +
>> +	/* remove unsupported modes */
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
>> +
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
>> +
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
>> +
>> +	ndev->netdev_ops = &emac_netdev_ops;
>> +
>> +	return 0;
>> +free:
> 
> nit: This doesn't free anything.
> 

Sure. We will address in the next version.

>> +	prueth->emac[mac] = NULL;
>> +
>> +	return ret;
>> +}
> 
> ...

Thanks & Best Regards,
Basharath

