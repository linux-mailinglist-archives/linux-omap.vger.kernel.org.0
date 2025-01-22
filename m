Return-Path: <linux-omap+bounces-3159-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53523A19247
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 14:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A2B07A1EF1
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 13:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61C5213235;
	Wed, 22 Jan 2025 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="KlvTx/SM"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294C818E25;
	Wed, 22 Jan 2025 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552099; cv=none; b=LENN3Kpb94jyu/dZnpvCCkTfO7rSZ80EjGN4WvdjQsoHZQQVEOoQv5WjxNo/tkOIjE9byltAJ9xNssiMgm66AZ1mMVEynlBhbbpjIDbH/VVJ3V6zmy9XVO7OtTNi72EwmlTYpHTnzy1jj1Eu+9SS6NN8S4BDQO20AxgGzFtFtAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552099; c=relaxed/simple;
	bh=GD7B1NbNTV0liRpF0arf6r6TG37SRudttBYD+fDokFU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=AuR7DRBOZcc6KV2MGkeMRxuS6f8UNnyGUrNZO1QUehJpA6NhWv2Fm/H7Xsf0EVXjcBuwiInF47i+vu98NAL41eQoWudaGtFCmeFpi90ELiUnIBzvf9x31axxOd8GymbrQ7r3IeskV+aPdzy4X3l4gKma12n4FJccv8aKUqZVGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=KlvTx/SM; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DcskuKqmEXV7K9kECUGgtRmCx7Ek1vR+0m10TiF37lo=; b=KlvTx/SMqGVqY950WN5VNxqsNe
	RoisaltVI63Pcvp/g+/sIy9PUux9Gux0lK5vl/cV3Uz9iL3trlz6eCcLx6zTfmRVnt0+EuZtowFsZ
	lHYXRlmhGAaG8LaJqfjGqqKqSnWStZdR3mlrDW5O6p6cmT7uzftRs+Ii6/gkS9TSD0fS4vCybypQT
	fQ5c2nkJkvKfSHUx4+joqgkQSdu7h/+guSUcQqDluVlwOjhhtn0fMMm/hFlg4zZ13SDhXuqbgRtuc
	riy9EmuHugLdyh0rEt3va15DvsCe4a3WveLboyxw9meoVAI+mxY+bLQ2xoCo+0hmtm1EXiBMAZInP
	7eWuvq8g==;
Received: from [122.175.9.182] (port=2973 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1taafi-0004x2-2I;
	Wed, 22 Jan 2025 18:51:31 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 2F9FD1781C74;
	Wed, 22 Jan 2025 18:51:20 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 0DBDE1783FED;
	Wed, 22 Jan 2025 18:51:20 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pu07YBsJQNXF; Wed, 22 Jan 2025 18:51:19 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id AE53C1781C74;
	Wed, 22 Jan 2025 18:51:19 +0530 (IST)
Date: Wed, 22 Jan 2025 18:51:19 +0530 (IST)
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
Message-ID: <630653923.382482.1737552079551.JavaMail.zimbra@couthit.local>
In-Reply-To: <4a8fb859-e173-42bf-8d9b-8d6423f45a9b@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <4a8fb859-e173-42bf-8d9b-8d6423f45a9b@lunn.ch>
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
Thread-Index: 2UyMxDDiC8+8fqlFZHcZxeWj7+ll0A==
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


> On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
>> From: Parvathi Pudi <parvathi@couthit.com>
>> 
>> Documentation update for the newly added "pruss2_eth" device tree
>> node and its dependencies along with compatibility for PRU-ICSS
>> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
>> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> 
> If i was to do a side by side diff with the ICSSG, how much would be
> the same? Does it make sense to refactor this into a yaml file for all
> the common properties, and then yaml files for all the specific
> properties?
> 
The main difference is ICSSM follows traditional memcpy approach and ICSSG
follows DMA based packet processing so there are lot of differences in 
transmitting or receiving a packet through PRU firmware. On top of that there
are considerable changes in the configuration of MMRs as well as other run time 
parameters. We tried to reuse as much as possible and where ever reuse was not 
possible we created separate instances.

Thanks & Best Regards,
Basharath

