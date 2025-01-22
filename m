Return-Path: <linux-omap+bounces-3160-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB15A1925C
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 14:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39514167883
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 13:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0633A2135A5;
	Wed, 22 Jan 2025 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="SaQvURVw"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A818E25;
	Wed, 22 Jan 2025 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552390; cv=none; b=Tgu17//UItCCaiEXl4NCqQpAtfVKpJylrJJvWUv55O4XALv9Xey2/uGqwXNnyBz3gLVu0ZLgiZzq5YuDdEg/04egygV4V3hLahQrQ0Q6SdS05j9R1mGcNrYAIZgXoCN9aj8hSEhD0NBj6ikwaOapKz7BckqZq68PTjH7GEd+U6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552390; c=relaxed/simple;
	bh=78HHq9EovL4XcsXoje3XFkp7ZlEDtwBMREc3iKu49vU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=NWzSgl2PvtS8UrSBRu8Scj085zlo4xFXSLmKVRHXoQLbftvuBfg0mR1nxbLvFgeNqtuC6bu7T6Dp8gTHW3/p8RUP7bpNpXmMrIlLuElTYvCqLf3iDAyI8vX+XxegY9MDSFfGeu7Nokf2P5vXRprGZVrf87FZsYixGbPiAFd4bOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=SaQvURVw; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5sSXsNbKlOVO1rVxHF9g5oZKI9cP2dp7dJVKqJoqmKw=; b=SaQvURVweuvJgwVC5odAl8eXZ7
	8+4StJGNUPY/AGK819SWCPqNyffcWe6+co9PAT8B9A6wNZsnQvTbzkL2dJHRHrpcYW6ZjoHFDj6vp
	peP3k/buB+jYd7kFWV3+qvUEvzEXT5TQNzMnYj2gVB2/HxkLO2PqVHq9yeLQdYqt8gF8irCU4V+Cq
	5nSI9c+JIR5R7F7DlsqIJG7acv51sazF91TjyPUKOU+EgaLaEjQnwXkuzzVWGzZpTOv4pt110OBGg
	axEzaoEj4L9BlA+NGfoR/b9FrPtYIRFOH1UC9tC5hOC7VQzYMwHsRPfcaC5IksUGjU0qNre+X6bK6
	Zui+nLUQ==;
Received: from [122.175.9.182] (port=52596 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1taakR-00053S-1X;
	Wed, 22 Jan 2025 18:56:23 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 2C0F81781C74;
	Wed, 22 Jan 2025 18:56:15 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0C1951783FED;
	Wed, 22 Jan 2025 18:56:15 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id imthwkGCwxge; Wed, 22 Jan 2025 18:56:14 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id B924E1781C74;
	Wed, 22 Jan 2025 18:56:14 +0530 (IST)
Date: Wed, 22 Jan 2025 18:56:14 +0530 (IST)
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
Message-ID: <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local>
In-Reply-To: <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree
 binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds device tree binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: 7/757csu1vp/TbaDoZJV2PkPCfrayg==
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


>> +          ti,no-half-duplex:
>> +            type: boolean
>> +            description:
>> +              Disable half duplex operation on ICSSM MII port.
> 
> I already asked this in the next patch, but why have this property? Is
> it because the hardware is broken? Or is this some sort of policy?
> Policy should not be in DT, DT describes the hardware, not the policy
> of how you use the hardware.
> 

This series of patches enables support for full-duplex only. Support for 
half-duplex will be added in subsequent revisions. We will clean it up in
the next version.

Thanks & Best Regards,
Basharath

