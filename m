Return-Path: <linux-omap+bounces-3169-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C5A19552
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0BF216A2DB
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 15:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A324E21423B;
	Wed, 22 Jan 2025 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="o4+FE6/m"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6462EED8;
	Wed, 22 Jan 2025 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560026; cv=none; b=ERWghemM3udAnqZhx/paOhE8ATGIkpp0hPwf9K0Ty7iXWE2K3uNKLIOgSqXUL5DU9TPUP3oWbloCiNSxDEFvRNai76cW1gauGSj4aClLeJRc2jrM6svjSUDWtHxV1szJ9lGRp/Lua27dTRkfItElkVtTEZojcbJKfs/nHWRyAOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560026; c=relaxed/simple;
	bh=cQLDiiAEoU77DSQMpPh/IDlK0jdGJdYEkSEtNLZljDM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tZTkK/HBzWraqXkvoGzoCvKCZZMUW4CK1ska3PFAy5UNuloWYdKzvp1jeUDEWX3qowhCtdQW1jKbDC74H3NpaHtbL/N7/DOqngafS0ZSFIvSajoXU5CrkIjESEsa2bsPRdWCv+XGTFuOu9K1Z43NVUb010esQaKC2lKEqHc07N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=o4+FE6/m; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tX83hHT4aZ7+gZo2IS7Yjnxf8cn0wc/eSWvE6GZiFho=; b=o4+FE6/m1K7CzW34Ld9Pe+upII
	14KCJI+i2yY2KIvO5Pt+a91b2lZif2kTIUYyFQ0iDusVsSEt8VYSd7ilkwlpkMCUdiN/zzMJczAOy
	tcT+ocR563+WvKhHujTi/C8HTBgVrDezKTCYHRA7TIFv0qi7c+Z5TnmBY9In7ROCv4I4Anp63lDv6
	vJehhQcY+U8VHT0qx3QsPZQ2S5wyg7447Ns/njpFiOg9CHTNQViEGiRiJ1WyBEVeih+zKnpf0ZnxY
	EncZ5eKP5FW4HrvJPnYBh5PB6eSpT/dL98V/A6dWIfbok8XS+pVknGPD4LLGWBxEoQ2U5zm8rBHtu
	El5fMB9g==;
Received: from [122.175.9.182] (port=42840 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tacjb-0007OL-17;
	Wed, 22 Jan 2025 21:03:39 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id E84911781F6A;
	Wed, 22 Jan 2025 21:03:28 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B66E01783FED;
	Wed, 22 Jan 2025 21:03:28 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BnQLNzz2-_tk; Wed, 22 Jan 2025 21:03:28 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 28DF11781F6A;
	Wed, 22 Jan 2025 21:03:28 +0530 (IST)
Date: Wed, 22 Jan 2025 21:03:26 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <984041835.384768.1737560006836.JavaMail.zimbra@couthit.local>
In-Reply-To: <5ba6bbf2-52e4-49d0-b6e2-134fb25ebe4c@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-3-basharath@couthit.com> <5ba6bbf2-52e4-49d0-b6e2-134fb25ebe4c@lunn.ch>
Subject: Re: [RFC PATCH 02/10] net: ti: prueth: Adds ICSSM Ethernet driver
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
Thread-Index: QkPWDvzL1WYog89bH3HrmHjQ8Nti1A==
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


>> +	emac->phy_node = of_parse_phandle(eth_node, "phy-handle", 0);
>> +	if (!emac->phy_node) {
>> +		dev_err(prueth->dev, "couldn't find phy-handle\n");
>> +		ret = -ENODEV;
>> +		goto free;
>> +	}
>> +
>> +	ret = of_get_phy_mode(eth_node, &emac->phy_if);
>> +	if (ret) {
>> +		dev_err(prueth->dev, "could not get phy-mode property err %d\n",
>> +			ret);
>> +		goto free;
>> +	}
>> +
>> +	/* connect PHY */
>> +	emac->phydev = of_phy_connect(ndev, emac->phy_node,
>> +				      &icssm_emac_adjust_link, 0, emac->phy_if);
>> +	if (!emac->phydev) {
>> +		dev_dbg(prueth->dev, "couldn't connect to phy %s\n",
>> +			emac->phy_node->full_name);
>> +		ret = -EPROBE_DEFER;
>> +		goto free;
>> +	}
> 
> of_phy_get_and_connect() will simplify this.
> 

Yes. This API does same functionality, we will replace three APIs with single 
API in the next version.

>> +	/* remove unsupported modes */
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
> 
> It only does 100Mbps?
> 

It is capable of both 100M/10M full/half-duplex modes. In this patch series we are 
adding support for 100M full duplex operation. Support for other modes will be added 
subsequently.

>> +	if (of_property_read_bool(eth_node, "ti,no-half-duplex")) {
> 
> Is this becasue 100baseT_Half is broken in some versions of the
> hardware?
> 

No.This property will be removed as we have added support only for 100M full duplex.
 
>> +		phy_remove_link_mode(emac->phydev,
>> +				     ETHTOOL_LINK_MODE_100baseT_Half_BIT);
>> +	}
>> +
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
>> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
> 
> Is this really needed? I've not checked, but if you don't call
> phy_support_sym_pause() or phy_support_asym_pause(), i would of
> expected phylib to default to no pause?
>
 
Though TI PHY default state is clear(ASM_DIR - 0 & PAUSE - 0 as Default
state in ANAR register), this bits are cleared again to handle if in case 
of change in PHY.

>> +static const struct of_device_id prueth_dt_match[];
> 
> Please avoid forward references. If you need the match table, define
> it here.
>
 
Sure. This got escaped while cleanup. We will address this in the next version.

Thanks & Best Regards,
Basharath


