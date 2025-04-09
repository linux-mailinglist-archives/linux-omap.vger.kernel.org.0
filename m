Return-Path: <linux-omap+bounces-3562-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E2A82374
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 13:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938B217B28E
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 11:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AC825D917;
	Wed,  9 Apr 2025 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="1k8b39Uu"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25828184F;
	Wed,  9 Apr 2025 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197827; cv=none; b=sDhkg6FJUQcVRvCUdj42IPi9DPKQ6C+TXdnFCyGior+0ouM/W7M4xZMSQe4dyKzhcKqn9swqYze1IdcyRRkVZM0nuBPvgcAWWcUAMciEL8+MlUeozh0NtmssytywNvwn2gWrn/pihEQd+YTkodp3MqL4KwosTgSRPR5jqNFI9jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197827; c=relaxed/simple;
	bh=RQESQKzfSXBY0laUS40IBmHKGOusKeyWPZVQaeperP0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=L+13nGWDBA3XzU88Psz3OEqTR5JNbbf0re2dTB/Im5bLRztK1uS9s2+TW22JpEM7VJ2tWOekaYanu0G8OXUCu26ltrguzhgYfsTX9jKbeP2NyKcU0m3hL6b06vzf5fIOxD1uba5LX5kPr/CXsAymEfzMR3CW+leSMqcs6Uzkrso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=1k8b39Uu; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mTLeaQccaur/2Px+QYaVo0y9f0E6hAnQJK93lpiHxns=; b=1k8b39Uu4ggHVDIC6jfEA+6ngj
	qH3oi32C7YyUHJO8IqMMk0mEq0xkiZPtDPdxfUPut2nIk+i3VUoELkitrKi2xsW5BmVDcnlVYT/XU
	XZVN3ynXzcHE217wmO/Sp/WKmHhQesWhmRUMVA7jFXoPM8lQ5emUSTbY29l91pauN+v06XsUHPw8n
	odqGWLt7DN0QlP5TZuQ2qQshbN2siGx+j4XCpPey/fCKfOJIlqpy4PqRqtPQP11aIcJJu2Zh7PnPB
	Akq9K1i/SpFOPtyIuJ/CITUdU00EMaZ2BEOoxvGUuqfHu7kKoOUDNORzN6xWk3tA27vliJ9/JUcdx
	8GUEWETQ==;
Received: from [122.175.9.182] (port=42231 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u2TWm-000000000KJ-46Fj;
	Wed, 09 Apr 2025 16:53:32 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id CDE0F178202B;
	Wed,  9 Apr 2025 16:53:23 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id AD606178245B;
	Wed,  9 Apr 2025 16:53:23 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ehMCXn9FYaRf; Wed,  9 Apr 2025 16:53:23 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 5FE54178202B;
	Wed,  9 Apr 2025 16:53:23 +0530 (IST)
Date: Wed, 9 Apr 2025 16:53:23 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Cc: parvathi <parvathi@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	pabeni <pabeni@redhat.com>, robh <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	nm <nm@ti.com>, ssantosh <ssantosh@kernel.org>, tony@atomide.com, 
	richardcochran <richardcochran@gmail.com>, glaroque@baylibre.com, 
	schnelle <schnelle@linux.ibm.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, rdunlap@infradead.org, 
	diogo ivo <diogo.ivo@siemens.com>, basharath <basharath@couthit.com>, 
	horms <horms@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, 
	m-malladi <m-malladi@ti.com>, 
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
Message-ID: <1391470178.1024554.1744197803224.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250407104424.01cc42f2@kernel.org>
References: <20250407102528.1048589-1-parvathi@couthit.com> <20250407104424.01cc42f2@kernel.org>
Subject: Re: [PATCH net-next v4 00/11] PRU-ICSSM Ethernet Driver
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: nAqz5d2VEyYJKR02Qq+Mau3zw+PRSA==
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

> On Mon,  7 Apr 2025 15:55:17 +0530 Parvathi Pudi wrote:
>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>> Megabit ICSS (ICSSM).
>> 
>> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
>> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
>> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
>> Linux kernel. The current set of patch series builds on top of these components
>> and introduces changes to support the Dual-EMAC using ICSSM on the TI AM57xx,
>> AM437x and AM335x devices.
>> 
>> AM335x, AM437x and AM57xx devices may have either one or two PRU-ICSS instances
>> with two 32-bit RISC PRU cores. Each PRU core has (a) dedicated Ethernet
>> interface
>> (MII, MDIO), timers, capture modules, and serial communication interfaces, and
>> (b) dedicated data and instruction RAM as well as shared RAM for inter PRU
>> communication within the PRU-ICSS.
> 
> This was posted prior to the "net-next is OPEN" announcement:
> https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/
> 
> In the interest of fairness towards those who correctly wait
> for the tree to be open I will ask you to repost this again,
> in a couple of days.
> 

Sure, we will resubmit the patches along with changes based on the feedback
received from Andrew Lunn and Keller, Jacob E shortly.

Thanks and Regards,
Parvathi.


