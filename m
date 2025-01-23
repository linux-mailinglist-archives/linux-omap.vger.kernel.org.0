Return-Path: <linux-omap+bounces-3189-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3FA19ED8
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 08:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D6916866E
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 07:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E06920B7E6;
	Thu, 23 Jan 2025 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="SgsLdvtu"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C3201023;
	Thu, 23 Jan 2025 07:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617047; cv=none; b=mVlYhfOVwkNe3gwB31X2urY7BNhE02d5UVGZFgNwkVf4TRZmus4D64RO2vLsNImUCJw5q62YpYFYxER8GRpQI5wlV+cvAuNop74C5HvI8+L4CX7K6EtIJn6weD26fCPj0QnhKbpavcyPruJNTbQhVXqbv5zEoc6Dz9Hm83lE9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617047; c=relaxed/simple;
	bh=xCPuFq9WgMU0Gb88D39hwJO9vnvo/r4SjtAfVQU0hXI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Ve+BhIWroCCm0aiQk3tseis5/ofXVLsV46htkZHRuRU5+8nDjgExX7GrCag9GumRC/YejRKW9cqIneIqqtWutloo7N7XClB74+4L3cN3Dxi+Wkvs8TUDcf0wmXg3+g3oox+flK07y/GbSt1YDkrhKh6FGX6sHrktfywS3HhpH7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=SgsLdvtu; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6m+k/1Y4Uh33GKZZUwcFzs8654vi6kkMP4rcv75Y0jk=; b=SgsLdvtu8BwBVCEyiJ85RcoLua
	NZhur8SM+haQkGsciU1J4WN1sJ+WNSbnBO83FK77bJ7RZDm9YDlIM+9nYulAX0vlNpdSyID1jr40f
	MHQZfH4gb/dyr94F0UgFytpvlduyUZD92ZWhC8BcQgRvXXjYDOc9P00CTKRfwgSv38HFzmEqXWsBl
	xRMw/CbArUhCNMUGF0dQ+hTMlazeV7bfs0PZgM7Gi3KGU2WN1SDRI7J2uTPytLGKEftRgllgoA3Jd
	b7fzLOFdY5hhYoyuzEc0XXJDHBK2XBRbcEznUWG9KVQDKE84Ts20xamB9hyTGosVHRs2qKO52iXmJ
	QMK+BRHQ==;
Received: from [122.175.9.182] (port=30001 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tarZG-0008Ks-1z;
	Thu, 23 Jan 2025 12:53:59 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 4D6711781A7D;
	Thu, 23 Jan 2025 12:53:51 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 280411782495;
	Thu, 23 Jan 2025 12:53:51 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id G6FJ-AEfZLuV; Thu, 23 Jan 2025 12:53:51 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id D07AB1781A7D;
	Thu, 23 Jan 2025 12:53:50 +0530 (IST)
Date: Thu, 23 Jan 2025 12:53:50 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: richardcochran <richardcochran@gmail.com>
Cc: basharath <basharath@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, nm <nm@ti.com>, 
	ssantosh <ssantosh@kernel.org>, tony <tony@atomide.com>, 
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
Message-ID: <717976963.391348.1737617030636.JavaMail.zimbra@couthit.local>
In-Reply-To: <Z4KdxQMBXmkF37KI@hoboy.vegasvil.org>
References: <20250109105600.41297-1-basharath@couthit.com> <20250110055906.65086-7-basharath@couthit.com> <Z4KdxQMBXmkF37KI@hoboy.vegasvil.org>
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Thread-Index: GveTHKWfgkR3edDiJqhjAdYwerPYPg==
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

> On Fri, Jan 10, 2025 at 11:29:02AM +0530, Basharath Hussain Khaja wrote:
> 
>> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device *ndev,
>>  	regs->version = PRUETH_REG_DUMP_GET_VER(prueth);
>>  }
>>  
>> +static int icssm_emac_get_ts_info(struct net_device *ndev,
>> +				  struct kernel_ethtool_ts_info *info)
>> +{
>> +	struct prueth_emac *emac = netdev_priv(ndev);
>> +
>> +	if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
>> +		return ethtool_op_get_ts_info(ndev, info);
>> +
>> +	info->so_timestamping =
>> +		SOF_TIMESTAMPING_TX_HARDWARE |
>> +		SOF_TIMESTAMPING_TX_SOFTWARE |
> 
> The driver advertises software Transmit time stamping, but where is
> the call to skb_tx_timestamp() ?
> 
> I didn't see it in Patch #4.
> 

Yes. This module always uses IEP HW time stamping for better precision. 
We will clean this in the next version.

>> +		SOF_TIMESTAMPING_RX_HARDWARE |
>> +		SOF_TIMESTAMPING_RX_SOFTWARE |
>> +		SOF_TIMESTAMPING_SOFTWARE |
>> +		SOF_TIMESTAMPING_RAW_HARDWARE;
>> +
>> +	info->phc_index = icss_iep_get_ptp_clock_idx(emac->prueth->iep);
>> +	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
>> +	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
>> +				BIT(HWTSTAMP_FILTER_PTP_V2_EVENT);
>> +
>> +	return 0;
>> +}
> 
>> @@ -442,6 +482,173 @@ static void icssm_emac_adjust_link(struct net_device
>> *ndev)
>>  	spin_unlock_irqrestore(&emac->lock, flags);
>>  }
>>  
>> +static u8 icssm_prueth_ptp_ts_event_type(struct sk_buff *skb, u8 *ptp_msgtype)
>> +{
>> +	unsigned int ptp_class = ptp_classify_raw(skb);
>> +	struct ptp_header *hdr;
>> +	u8 msgtype, event_type;
>> +
>> +	if (ptp_class == PTP_CLASS_NONE)
>> +		return PRUETH_PTP_TS_EVENTS;
>> +
>> +	hdr = ptp_parse_header(skb, ptp_class);
>> +	if (!hdr)
>> +		return PRUETH_PTP_TS_EVENTS;
>> +
>> +	msgtype = ptp_get_msgtype(hdr, ptp_class);
>> +	/* Treat E2E Delay Req/Resp messages sane as P2P peer delay req/resp
> 
> s/sane/in the same way/
> 

This was a typo, We will address this in the next version. Firmware running in PRU 
treats E2E Delay Req/Resp messages same as P2P peer delay req/resp.

>> +	 * in driver here since firmware stores timestamps in the same memory
>> +	 * location for either (since they cannot operate simultaneously
>> +	 * anyway)
>> +	 */
>> +	switch (msgtype) {
>> +	case PTP_MSGTYPE_SYNC:
>> +		event_type = PRUETH_PTP_SYNC;
>> +		break;
>> +	case PTP_MSGTYPE_DELAY_REQ:
>> +	case PTP_MSGTYPE_PDELAY_REQ:
>> +		event_type = PRUETH_PTP_DLY_REQ;
>> +		break;
>> +	/* TODO: Check why PTP_MSGTYPE_DELAY_RESP needs timestamp
>> +	 * and need for it.
>> +	 */
>> +	case 0x9:
> 
> Delay response messages are PTP "general" messages and not event
> messages, and as such they do not require time stamps.
> 
currently firmware sends back timestamp even for E2E Delay_response message 
though this is a general message. To service that txts request we added this
here. We will revisit again and clean this in the subsequent versions.

Thanks & Best Regards,
Basharath

