Return-Path: <linux-omap+bounces-3254-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 342D3A2496C
	for <lists+linux-omap@lfdr.de>; Sat,  1 Feb 2025 14:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACEFE1886588
	for <lists+linux-omap@lfdr.de>; Sat,  1 Feb 2025 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC381B86E9;
	Sat,  1 Feb 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="ez3DHy4K"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948811E884;
	Sat,  1 Feb 2025 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738417049; cv=none; b=r+UHuhjxU5XmXaIECQeIvr+9qGRebp5BJ8skvL2CutYdbDuazg+e7eIiNUs3FCcIaEIGFlO69nV+5zQDCVtHB/waz57+P4NJ48WlIynu4d6lLvQRdcNOraBhAPwCsiBYoTAMQSSAp2i2PQYIXdxOm6zsQTLoavR83UJNjIXA2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738417049; c=relaxed/simple;
	bh=+ms2TInxv6RfeEj6kJAPYmRbOXY4R2k6+wUFE/LWYKk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=J4bWcdIk/aY0XgW5r+slAXNrQZGrPe8AbibgpfnYRovLuJ/Ex8yLJQ5ioMRgHoiZt1wyAnwH3G7DOHrFEWytRhcyTT3NV3g39qqR+h99a+9WIQMZa9pQUmJdIyh3pQWBtvgEu52i1w560gmUBb05P0st+ivBfiwQpCiIneaUCPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=ez3DHy4K; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ignVEcjhumkNWLSzWdrUkiSSRf394BaswWlvkQv+aUo=; b=ez3DHy4KvAJgkV+spv6PnEQj+K
	It4gQV8SxJehtWK+a30RStICulPGttI43KrRK448pYZDZ0cay1MwVVUuq7khFC9XGMOVjwMZn87P0
	jlRT3PEOH1Y9EH2eEaTE74mAg7iMmocBn0Gqxc+mxyOkNA43B0uaFuT9WhxfuEkNDz7JUQ099wkfG
	Fa0pPPtDYCb32OWn58HSrhK/F2eYqYpN8/j7uvgNIWk1KFCop24G2f2ZQuNgX4cwq6DfzyHVp/673
	KP8LFfJd74Vn41Sg2QYoYn4wkc++OQQv60vliyDCoUWmwY237/+veog2/6YS2v3VLiSDjDSnCHbrF
	+sgDYoLw==;
Received: from [122.175.9.182] (port=53335 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1teDgX-000449-16;
	Sat, 01 Feb 2025 19:07:21 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 8BBA31781C56;
	Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 6680D1782035;
	Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vcwGzKvUinVz; Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 244AA1781C56;
	Sat,  1 Feb 2025 19:07:14 +0530 (IST)
Date: Sat, 1 Feb 2025 19:07:14 +0530 (IST)
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
Message-ID: <1490509701.481776.1738417034035.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250130164515.GC13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124123707.1457639-5-basharath@couthit.com> <20250130164515.GC13457@kernel.org>
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
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
Thread-Index: epeD2E8g/Zc/D2XENrr3GLP0/2oqEg==
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


> On Fri, Jan 24, 2025 at 06:07:01PM +0530, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Changes corresponding to link configuration such as speed and duplexity.
>> IRQ and handler initializations are performed for packet reception.Firmware
>> receives the packet from the wire and stores it into OCMC queue. Next, it
>> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
>> service the IRQ and packet will be processed by pushing the newly allocated
>> SKB to upper layers.
>> 
>> When the user application want to transmit a packet, it will invoke
>> sys_send() which will inturn invoke the PRUETH driver, then it will write
>> the packet into OCMC queues. PRU firmware will pick up the packet and
>> transmit it on to the wire.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> ---
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 599 ++++++++++++++++++-
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.h |  46 ++
>>  2 files changed, 640 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> 
> ...
> 
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
> 
> I think the return type of this function should be netdev_tx_t
> rather than int to match the signature of ndo_start_xmit
> in struct net_device_ops.
> 
> Flagged by W=1 build with clang-19
> (-Wincompatible-function-pointer-types-strict).
> 

We will change the return type in the next version.

> ...
> 
>>  static const struct net_device_ops emac_netdev_ops = {
>>  	.ndo_open = icssm_emac_ndo_open,
>>  	.ndo_stop = icssm_emac_ndo_stop,
>> +	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
>>  };
>>  
>>  /* get emac_port corresponding to eth_node name */
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> 
> ...
> 
>> @@ -76,6 +82,32 @@ struct prueth_queue_info {
>>  	u16 buffer_desc_end;
>>  } __packed;
>>  
>> +/**
>> + * struct prueth_packet_info - Info about a packet in buffer
>> + * @start_offset: start offset of the frame in the buffer for HSR/PRP
>> + * @shadow: this packet is stored in the collision queue
>> + * @port: port packet is on
>> + * @length: length of packet
>> + * @broadcast: this packet is a broadcast packet
>> + * @error: this packet has an error
>> + * @sv_frame: indicate if the frame is a SV frame for HSR/PRP
>> + * @lookup_success: src mac found in FDB
>> + * @flood: packet is to be flooded
>> + * @timstamp: Specifies if timestamp is appended to the packet
> 
> nit: @timestamp
> 

We will address this in the next version.

>> + */
>> +struct prueth_packet_info {
>> +	bool start_offset;
>> +	bool shadow;
>> +	unsigned int port;
>> +	unsigned int length;
>> +	bool broadcast;
>> +	bool error;
>> +	bool sv_frame;
>> +	bool lookup_success;
>> +	bool flood;
>> +	bool timestamp;
>> +};
> 
> ...

Thanks & Best Regards,
Basharath

