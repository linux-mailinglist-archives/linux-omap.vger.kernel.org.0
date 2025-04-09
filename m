Return-Path: <linux-omap+bounces-3564-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB7A823A1
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 13:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEF1B3B04FD
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 11:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C9B25DCE4;
	Wed,  9 Apr 2025 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="t1frAIOv"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C62C190;
	Wed,  9 Apr 2025 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198425; cv=none; b=saZxi1vxkKODyNVwXUqxu9gRrRq4sIWIMJTbh4miWs4gC0u+QMSwbq6eULh9Rne1NQmHNwfSFdC9xz2Ov+u6lEabaBmW5z9hU7gbba5+xmd4djO9LqcruWAf1YI+2Hgja2aekSbYoZnBB6TOsJefdqrdoPnLbM6QIm1hb0DUBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198425; c=relaxed/simple;
	bh=87KYMpQkh72ZcDC2kM01aENUZegjbSBq2CAQth4tsjA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FghJlvrhVb4Eps1S2TA/7VHcm+nyFWSCzkbgzaU49MhuePm5K5KBIPyF10rW8Y0TZaNV2gcScOWVm2wi4iQJ0CB3ObqSzuGvX9fubmNr1NIE2AuaiQwQPIxglrk1ceFVqICJGdcwJqUjC75EFAW5E5NrBTTxYueVecxwMTc3GBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=t1frAIOv; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NzZsOt1cKau/PD5x2aFRuLHCT/wldjQtNk8/+LhsvTM=; b=t1frAIOvKlfnlN54/NH0r4j3kL
	g8rpv0hG0SRt5/c0mJaRG+tBKhaYt612ygqrqbtYYoiDrUNTXEWY5rIje+9htCHxxiRNDe25nnSQ4
	qlm5ePCmNRdlbSG3fVw8tw1ehkz1DgyHz4MVPm4iIXlEBv/lPLdZp+jSGu8Ubcn6juGg9+kaiAhgp
	NqnRP4sFTb0XHtbEgjBQnAybyjWsci50AQRBMlBTwcoojCxJCzowdSlCqBGVrHDEQeWaaxtoWlMJB
	PJ8fzkKJh2ifTTHYJmu/MP80nbRLd9wyZv0aAGcVpSYrpNqfaOdEDDAMMU/n1LmXlqlDZDszyz3xV
	JuORocfQ==;
Received: from [122.175.9.182] (port=62615 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u2TgY-000000000Uh-4B1D;
	Wed, 09 Apr 2025 17:03:38 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id AD0DC1782035;
	Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 8ADBD178245B;
	Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PiRs0122yNG1; Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 2FC4B1782035;
	Wed,  9 Apr 2025 17:03:31 +0530 (IST)
Date: Wed, 9 Apr 2025 17:03:30 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: jacob e keller <jacob.e.keller@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, parvathi <parvathi@couthit.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	andrew+netdev <andrew+netdev@lunn.ch>, davem <davem@davemloft.net>, 
	edumazet <edumazet@google.com>, kuba <kuba@kernel.org>, 
	pabeni <pabeni@redhat.com>, robh <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	nm <nm@ti.com>, ssantosh <ssantosh@kernel.org>, tony@atomide.com, 
	richardcochran <richardcochran@gmail.com>, glaroque@baylibre.com, 
	schnelle <schnelle@linux.ibm.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, rdunlap@infradead.org, 
	diogo ivo <diogo.ivo@siemens.com>, basharath <basharath@couthit.com>, 
	horms <horms@kernel.org>, m-malladi <m-malladi@ti.com>, 
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>, 
	afd <afd@ti.com>, s-anna <s-anna@ti.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap@vger.kernel.org, pratheesh <pratheesh@ti.com>, 
	Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <190529030.1024806.1744198410980.JavaMail.zimbra@couthit.local>
In-Reply-To: <CO1PR11MB5089CB4D35150C286EE81387D6AA2@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20250407102528.1048589-1-parvathi@couthit.com> <20250407113714.1050076-6-parvathi@couthit.com> <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch> <CO1PR11MB5089CB4D35150C286EE81387D6AA2@CO1PR11MB5089.namprd11.prod.outlook.com>
Subject: Re: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ethtool support for ICSSM PRUETH Driver
Thread-Index: AQHbp7GUMpxoQbaZ60qmLD3ok6PwS7OYpSWAgAAYWhDYFQ2Lzg==
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

Hi,

>> > +#define PRUETH_MODULE_VERSION "0.2"
>> 
>> > +static void icssm_emac_get_drvinfo(struct net_device *ndev,
>> > +				   struct ethtool_drvinfo *info)
>> > +{
>> > +	strscpy(info->driver, PRUETH_MODULE_DESCRIPTION, sizeof(info-
>> >driver));
>> > +	strscpy(info->version, PRUETH_MODULE_VERSION, sizeof(info->version));
>> 
>> Driver version numbers are pointless, they never change, but the
>> kernel is changing all the time. Leave version blank, and the core
>> will fill in the kernel version, which is useful.
>> 
>>      Andrew
> 
> It is also a long standing policy that in-tree drivers should not have versions
> separate from the kernel version.
> 

Ok. We will leave the version field blank as suggested by Andrew and cleanup version
will be resubmitted shortly.


Thanks and Regards,
Parvathi.


