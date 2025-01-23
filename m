Return-Path: <linux-omap+bounces-3188-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9CDA19EA8
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 08:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7CDB164593
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 07:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB6520B212;
	Thu, 23 Jan 2025 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="ex+U+1wJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA31C1F0C;
	Thu, 23 Jan 2025 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737615771; cv=none; b=HeFJL/6bSmc0RFyTqFM/F7OKbgUj7G4LKobr5q2CCQ6c7yo0PkXFq3b7iNd3d2KgMIW6sVQA5pE/RWlZCzPPaMgI7QlfdPgbLCTMHZ1cqxT8HcTlV7UOkGUcIeTIOUHtgQFia8iBtA7e3nauSo7oK1lSRHCjEXXSt43kgffpuns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737615771; c=relaxed/simple;
	bh=d/rF3oBuFk8AvzTIo7WgOEPnwOzuvSM8/oiwsLO7IHU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=aKKefqKn6z1LvqLjq72dKYjHK7ZDsVNy1ZWWE+4Lfu5KH3+1aiVmLPq6Nc5bf81hDWUbyifSv0bpGrk+l0hg1nytWBmWbHpKvSDdbMGg4NIekbDuXmPQBQL9ddp1u+LevK4rTiEMtybqSveBMuww7jAuqJW0w9uQjP/YnaixW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=ex+U+1wJ; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6EWFkR8ZwsVB5EtOpQVLpbQnF99d1xPnEL8Z+nC+xqU=; b=ex+U+1wJtT2OCD1ASNGwka9QYY
	xypVpmUOShTnyedBAXKZOdNmwKEwkEacLFN7f/TAQ+0OBzV+if8OLP6Mrp9awA7pwB3O1hyqYa+Ab
	R7G9AGl8sjBGIKYVSRPim0M7DRpMmcEN99aZoYyzy4wdYibA5TYfjwhL8AaqgtcVeUGIthGMcUahK
	QtxztYiyCRAi/iMSapMZxoznwdah+M917B9Z3uxv1vIlXaDsqtwTQfiFyXBAnaj2pmeqDVRigdrlm
	dLfB4nG9A/K0Xkdpf6RVVd18J5DGXl9Q108c69M7VJvAIcRYbNtWAw3smTBQWquNhl0qZNtoiUgOH
	G+tsRBxw==;
Received: from [122.175.9.182] (port=19706 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tarEf-0007uX-2D;
	Thu, 23 Jan 2025 12:32:42 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id D476F1781A7D;
	Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B12FA1782495;
	Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8r6jauI9kHCU; Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 464731781A7D;
	Thu, 23 Jan 2025 12:32:29 +0530 (IST)
Date: Thu, 23 Jan 2025 12:32:29 +0530 (IST)
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
Message-ID: <951581664.391198.1737615749019.JavaMail.zimbra@couthit.local>
In-Reply-To: <fce8d698-2ae2-460c-a288-3d70d61dbf9e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-5-basharath@couthit.com> <fce8d698-2ae2-460c-a288-3d70d61dbf9e@lunn.ch>
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and
 TX support.
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
Thread-Index: BN38BmJZ1YvXDCRq7dlK/kmFcsDoFg==
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

>> +/* update phy/port status information for firmware */
>> +static void icssm_emac_update_phystatus(struct prueth_emac *emac)
>> +{
>> +	struct prueth *prueth = emac->prueth;
>> +	u32 phy_speed, port_status = 0;
>> +	enum prueth_mem region;
>> +	u32 delay;
>> +
>> +	region = emac->dram;
>> +	phy_speed = emac->speed;
>> +	icssm_prueth_write_reg(prueth, region, PHY_SPEED_OFFSET, phy_speed);
>> +
>> +	if (phy_speed == SPEED_10)
>> +		delay = TX_CLK_DELAY_10M;
> 
> How can speed to 10? You removed those link modes?
> 

We will clean it up in the next version.

>> +/**
>> + * icssm_emac_ndo_start_xmit - EMAC Transmit function
>> + * @skb: SKB pointer
>> + * @ndev: EMAC network adapter
>> + *
>> + * Called by the system to transmit a packet  - we queue the packet in
>> + * EMAC hardware transmit queue
>> + *
>> + * Return: success(NETDEV_TX_OK) or error code (typically out of desc's)
>> + */
>> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
>> +				     struct net_device *ndev)
>> +{
>> +	struct prueth_emac *emac = netdev_priv(ndev);
>> +	int ret = 0;
>> +	u16 qid;
>> +
>> +	if (unlikely(!emac->link)) {
>> +		if (netif_msg_tx_err(emac) && net_ratelimit())
>> +			netdev_err(ndev, "No link to transmit");
>> +		goto fail_tx;
>> +	}
> 
> Do many other MAC drivers have this test?
> 

This was an experimental safety check to avoid pushing anymore packets 
into PRU buffers when link down occurred but upper layers are not notified
yet. We will remove this check in the next version.

>> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> @@ -17,6 +17,11 @@
>>  
>>  /* PRUSS local memory map */
>>  #define ICSS_LOCAL_SHARED_RAM	0x00010000
>> +#define EMAC_MAX_PKTLEN		(ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN)
>> +/* Below macro is for 1528 Byte Frame support, to Allow even with
>> + * Redundancy tag
>> + */
>> +#define EMAC_MAX_FRM_SUPPORT (ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN + 6)
> 
> This looks familiar....
> 

We will use the MACRO instead of hard-coded value.

Thanks & Best Regards,
Basharath

