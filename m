Return-Path: <linux-omap+bounces-3196-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85417A1A449
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 13:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7329167D3C
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 12:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234A420F064;
	Thu, 23 Jan 2025 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="atGtDdFA"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE331C1F0C;
	Thu, 23 Jan 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737635431; cv=none; b=G91CW+uZDsWhD3uJYINf7n6WXoec3HJ8/5HuyBmXiMd1Jj5x4oBRZQvYCO3MKEohIK/QzrjbiiK9m6CHaNZXZPVRNsaOtLFa5P3nDt1pW5TE0L9VVeMi+UHOHT3g847D9Bzer4OPf/WrG71jIOR9BlLB442bAJ7vTZ/vHPeGbak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737635431; c=relaxed/simple;
	bh=1rGZAYv2pSYn8yxsvmPAt9l//t1iayRE4F3Et4UrMgI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fRPwwCSg36DL1b1u+Jp0FUd1+5g2XjFPNuHcl/oVwJr1p8f/hFWDn+2N80Iy855HPOpYdjUMxewl9rW5+jeYMh15/nbLXzOy12aJeOX27pnRqf7sGv+bIbj1pGBmUdt2Cxjsh7p8xCHRewPZ7u++VqfQ09s2i0+z3UYSnqNusoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=atGtDdFA; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=39CuZZZdjSJEJPQMh+OB3G3RFMPggoTrQcp5t75nl8Y=; b=atGtDdFA/e4szMovQBwMFwgXZn
	co6f+Ko4J890WcGUnR27tQkv47WQotAMgVeGUpdhIHs0P2Ay6ftyu4fzFvUfxjY4gJXetCJDuQPVF
	TtvHLm8RmrsIztBJvjDPjdUo1rAYIKT0D+YzQ7UWKKjTGTUbxUSoHnI6m7EreB+hqZdtGl3u7i3jK
	jdFp5M9z4gv7koNlNHcYAhghg/IUdc18Qj+WBrSOsb4jrB8OUSqc7QEeMiOVafkvItxkP9cg1eYCO
	j17SlYjKKx1cM+3yFH74+WkQuyZmN8tWggp4l2iWs5idkuwdGvVJWIMAnAnxKfD8R3OFlpkkcyyER
	g0jaFJug==;
Received: from [122.175.9.182] (port=45111 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tawLl-0005TL-35;
	Thu, 23 Jan 2025 18:00:22 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 5FE1A1781C63;
	Thu, 23 Jan 2025 18:00:13 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 395D61782495;
	Thu, 23 Jan 2025 18:00:13 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2df9ieE3WTUM; Thu, 23 Jan 2025 18:00:13 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id D9E111781C63;
	Thu, 23 Jan 2025 18:00:12 +0530 (IST)
Date: Thu, 23 Jan 2025 18:00:12 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Message-ID: <1333946741.395386.1737635412707.JavaMail.zimbra@couthit.local>
In-Reply-To: <6ac6161b-373a-47ce-801d-9e4ff1ef258c@wanadoo.fr>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-5-basharath@couthit.com> <6ac6161b-373a-47ce-801d-9e4ff1ef258c@wanadoo.fr>
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and
 TX support.
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: wMpv7fMC/ugczbeFyu6r0nphcnNI/g==
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


> Le 09/01/2025 =C3=A0 11:55, Basharath Hussain Khaja a =C3=A9crit=C2=A0:
>> From: Roger Quadros <rogerq@ti.com>
>>=20
>> Changes corresponding to link configuration such as speed and duplexity.
>> IRQ and handler initializations are performed for packet reception.Firmw=
are
>> receives the packet from the wire and stores it into OCMC queue. Next, i=
t
>> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
>> service the IRQ and packet will be processed by pushing the newly alloca=
ted
>> SKB to upper layers.
>>=20
>> When the user application want to transmit a packet, it will invoke
>> sys_send() which will inturn invoke the PRUETH driver, then it will writ=
e
>> the packet into OCMC queues. PRU firmware will pick up the packet and
>> transmit it on to the wire.
>=20
> Hi,
> a few nitpicks.
>=20
> ...
>=20
>> +static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
>> +=09=09=09=09   struct sk_buff *skb,
>> +=09=09=09=09   enum prueth_queue_id queue_id)
>> +{
>> +=09struct prueth_queue_desc __iomem *queue_desc;
>> +=09const struct prueth_queue_info *txqueue;
>> +=09u16 bd_rd_ptr, bd_wr_ptr, update_wr_ptr;
>> +=09struct net_device *ndev =3D emac->ndev;
>> +=09unsigned int buffer_desc_count;
>> +=09int free_blocks, update_block;
>> +=09bool buffer_wrapped =3D false;
>> +=09int write_block, read_block;
>> +=09void *src_addr, *dst_addr;
>> +=09int pkt_block_size;
>> +=09void __iomem *dram;
>> +=09int txport, pktlen;
>> +=09u32 wr_buf_desc;
>> +=09void *ocmc_ram;
>> +
>> +=09dram =3D emac->prueth->mem[emac->dram].va;
>> +=09if (eth_skb_pad(skb)) {
>> +=09=09if (netif_msg_tx_err(emac) && net_ratelimit())
>> +=09=09=09netdev_err(ndev, "packet pad failed");
>=20
> Missing trailing \n.
>=20
>> +=09=09return -ENOMEM;
>> +=09}
>> +
>> +=09/* which port to tx: MII0 or MII1 */
>> +=09txport =3D emac->tx_port_queue;
>=20
> ...
>=20
>> +static int icssm_emac_request_irqs(struct prueth_emac *emac)
>> +{
>> +=09struct net_device *ndev =3D emac->ndev;
>> +=09int ret =3D 0;
>=20
> No need to init.
>=20
>> +
>> +=09ret =3D request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_threa=
d,
>> +=09=09=09=09   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> +=09=09=09=09   ndev->name, ndev);
>> +=09if (ret) {
>> +=09=09netdev_err(ndev, "unable to request RX IRQ\n");
>> +=09=09return ret;
>> +=09}
>=20
> ...
>=20
>> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
>> +=09=09=09=09     struct net_device *ndev)
>> +{
>> +=09struct prueth_emac *emac =3D netdev_priv(ndev);
>> +=09int ret =3D 0;
>> +=09u16 qid;
>> +
>> +=09if (unlikely(!emac->link)) {
>> +=09=09if (netif_msg_tx_err(emac) && net_ratelimit())
>> +=09=09=09netdev_err(ndev, "No link to transmit");
>=20
> \n
>=20
>> +=09=09goto fail_tx;
>> +=09}
>> +
>> +=09qid =3D icssm_prueth_get_tx_queue_id(emac->prueth, skb);...

We will handle all comments in the next version.

Thanks & Best Regards,
Basharath

