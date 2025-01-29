Return-Path: <linux-omap+bounces-3237-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E924A2177B
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2025 06:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F402C166E1A
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jan 2025 05:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAB7192D68;
	Wed, 29 Jan 2025 05:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="GmbAZpSQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825F149C4A;
	Wed, 29 Jan 2025 05:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738129405; cv=none; b=VW9rNQnZ6HOvKXAB+WhiKbCOFJ4CGAyq0byiZEUO+feMv1zZCGmjZ/Z3H47ILwDmWtIjW6bP0Iao7Q+PfRJcyvOH8OtHbtSdG2CATF1ZXlVgGWqbzH+zOL6528u6748bhI5OoxvdMFfDh5KDvp4SIBQOLABXNj3G7UWdi37TeD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738129405; c=relaxed/simple;
	bh=a/Ivj8cr/2/1ZR539Vx9LPaREmucV7PslKiU0ESzDYU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YwhQd6xYUzu6lfUaSAAhwosWuP2eBJHfQ19NIr4skjIEp0h8z5O5HxgxAQa4KGmvxyZF/0zJhm26zb8BeelmifPzhmbnUFu2WKUGQrmH9U2bXi7WXWTixr6nKwq7s2dPWgk6nTxOjR/MDoANFc1mEPoEQubaazHo3X3AG6+jnXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=GmbAZpSQ; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lF+CIRph9PZhptroJNKOInSrSEFt7RGWkV6dkzmXep4=; b=GmbAZpSQX64uePyjfW07O1zI5M
	7Qzfr7XG4LtpoVq+jGix0ruD+/TKAs7WQq3e/Axw/1CjfH5Y+TUXx0i7HFvk9tPdQ2a4D6vrhCVXH
	+ugD+HxFoOHgIRsdzFWfFIjK18A3kd7qZdPj2vN2mWh8C/q/RoEbQaFltNf7j6TZ7XgqxyD+QZxsb
	/mTIINNW/OoXdec2pk6mAuP+gxXjF1kcMDI78jwc4Ux5I9ZztuxeMfkCdDBVpmQxCYrMVTt57EH+7
	QBBZSsrqfvc8jqpaXljgzC5jMHlxniYUzHHn3a0ln+z86vg1wP3CjwUjM7BC8tLfKZn7bxlLx1vY9
	6MB/9abg==;
Received: from [122.175.9.182] (port=58282 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1td0r7-0007xu-0t;
	Wed, 29 Jan 2025 11:13:17 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 3535D17823F4;
	Wed, 29 Jan 2025 11:13:10 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 154061782431;
	Wed, 29 Jan 2025 11:13:10 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id m6r8Cg2k0lcC; Wed, 29 Jan 2025 11:13:09 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id BFFD317823F4;
	Wed, 29 Jan 2025 11:13:09 +0530 (IST)
Date: Wed, 29 Jan 2025 11:13:09 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Joe Damato <jdamato@fastly.com>
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
Message-ID: <1124259986.450336.1738129389588.JavaMail.zimbra@couthit.local>
In-Reply-To: <Z5QgNu9AOzRre91J@LQ3V64L9R2>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124134056.1459060-5-basharath@couthit.com> <Z5QgNu9AOzRre91J@LQ3V64L9R2>
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
Thread-Index: Id3fz+1DPwxTNAkjE+YT/LkbLXOzTA==
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

> On Fri, Jan 24, 2025 at 07:10:50PM +0530, Basharath Hussain Khaja wrote:
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
> 
> Looks like this patch was duplicated and posted twice ?

When I posted the patch first time I received a bounce back error.
So I was not sure if the patch got posted successfully or not so 
I have to re-sent. Sorry for the confusion.


Thanks & Best Regards,
Basharath.

