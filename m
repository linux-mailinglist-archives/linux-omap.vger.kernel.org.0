Return-Path: <linux-omap+bounces-3170-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE2A195E9
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9575C1889EA1
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 15:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FAC214818;
	Wed, 22 Jan 2025 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="Z1JhKeuy"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8D214205;
	Wed, 22 Jan 2025 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737561491; cv=none; b=e9hBY/qE2u+tSHK/mUjZA8lZxB7XeWz6/jP+lO3sQZ7xOSRyY1DoCOqzWEXsG+jH3/+uLzDGwKFmy8y1g7GNwsJmB4yyTPf8Ynf1Nm0rFIc1lcwOf1YCze2oR1F3VqzFDDXT741ECh7lNf+A22CWkl0wZaz/o5gdanKbccQd1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737561491; c=relaxed/simple;
	bh=YUoRPk4WPZVbXfpmdnjnoePnaGH1CrQ768jGtUbFons=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=CTseCA2Z/1AYqhMw7LUBtj/MziRAkq5lEreg2flnUBYYJ2l76dBmrzS10TH7SSIEL7ff6rq/9WnvVZi5tRvhHUXuaLiOS7/8rh3k6MIPtbunzKuA7lWusMo0mHDXW8peYIlRU0OUncmSIEaNIGwlDJ13TgUIQ0UmKU69JHVLHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=Z1JhKeuy; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bnuFOlyRJRVamZb24JKzDuiyjdS5PGYnE9sLED1LlXU=; b=Z1JhKeuy0mvu2Q+FtxIAwol7RT
	P+oPlW5SX/67njXVvh0rFkwON0QTYYZqkyvfiLhglMlxs+extLgAcnx1T16A2Hm9aYoaLjtsz6OiT
	pProX8yeNSPEQXIuullTJj6QrCzBuvEgKpuc1b71t2BXWbGsXsRfalyZEv0NckRESHgdEzxU1cQpF
	IyLfPfuKGamHaTp9aRUz3L/mYU7yOxcABa+qlbjrZL2ErN1AycVvpyFQaWWZOIvk/1WCgsPmYBNEP
	QvR6dyLK2lq1vAsJS9g2pI6fTvR/Xdrnj0H0Dbmz/WreFEW6KH9gPmhBTQp+Yh0n41nELKv9LUv9v
	3X488dEQ==;
Received: from [122.175.9.182] (port=60338 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tad7D-0007lR-1h;
	Wed, 22 Jan 2025 21:28:03 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id BA1031784068;
	Wed, 22 Jan 2025 21:27:56 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 569521783FED;
	Wed, 22 Jan 2025 21:27:56 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PUtGIRL-p0Y2; Wed, 22 Jan 2025 21:27:52 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id F408D1781F6A;
	Wed, 22 Jan 2025 21:27:47 +0530 (IST)
Date: Wed, 22 Jan 2025 21:27:41 +0530 (IST)
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
Message-ID: <1841709010.384806.1737561461669.JavaMail.zimbra@couthit.local>
In-Reply-To: <2f02964f-d143-4340-8284-790b5aa2901e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-4-basharath@couthit.com> <2f02964f-d143-4340-8284-790b5aa2901e@lunn.ch>
Subject: Re: [RFC PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW
 configuration
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds PRUETH HW and SW configuration
Thread-Index: lVPYynRfah86sJk1Rb7/xZ62CgiYow==
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


>> +/* Below macro is for 1528 Byte Frame support, to Allow even with
>> + * Redundancy tag
>> + */
>> +#define PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC	(VLAN_ETH_FRAME_LEN + \
>> +							ETH_FCS_LEN + 6)
> 
> Is 6 for the redundancy tag? Is the redundancy tag defined somewhere?
> Could this 6 be replaced by a #define, which is maybe a sizeof()?
>

Yes. 6 is for redundancy tag. We will create a MACRO and use 
MACRO instead of hard coded value.
 
>> +	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
>> +		 (!eth0_node || !eth1_node) ? "single" : "dual");
>> +
> 
> Is that really true? Is it not in dual mode, but only one interface is
> in use? I also wounder at the value of spamming the log like this.
> 

This might be valid if in case user decides to use only one MAC port by 
changing dts configuration.

Thanks & Best Regards,
Basharath

