Return-Path: <linux-omap+bounces-4686-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A9BDEB2C
	for <lists+linux-omap@lfdr.de>; Wed, 15 Oct 2025 15:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57F974FFA42
	for <lists+linux-omap@lfdr.de>; Wed, 15 Oct 2025 13:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E363277AF;
	Wed, 15 Oct 2025 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="HtqcSAey"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CF13C8EA;
	Wed, 15 Oct 2025 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534011; cv=none; b=oNK9xAX7lFHXq76Dc5WszNKKrybMR2i+CYWP0sXcIIeB/zNLTJfqfmqosyS2IGrSvJ6P7jF9THQEJ5fuB9r3M4qBAWMln2EIXVFar+X0bu2FUKbesJYi+PVdXcpMntQtvM2P+N9TSMGRQkwigBil5anXxLTLI+cQOYQui+MgAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534011; c=relaxed/simple;
	bh=/HTyDAF1e6eJk2ErVtVowTYwP6ibHxtUi90C3ENQr1U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Vg6VWyLRCTTx+EddeWIOWPTc6dh+T4Vgda/ofGcSOFV+9Oz5JEU4ALBoAHQQA6q09YMqq3dzJ1tkcEOqqjc9tqB7Y2yQ0D7Py/MOWowzHfBOdQcZzOkvGFJJKgATAQ+KV8QkT+sGhn/DSYjXOFYoWym8MQsqHIWw/U4K3VU7TdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=HtqcSAey; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nD/qaTtow8Q89DPjb/8t60PsJmnPZQHdlhIu+PVjjgQ=; b=HtqcSAey/6ko8FKLtXQ3X8DMjK
	pVAQXPvAQxnDwt8F3cRRP8KpKspxlYRn/DU76auJmwMCyAaIOAwzUCyGu+rGZ/pQ/fAzeQQ7DjYOA
	Eysd1CAClSmC7lWKcA1wxJwNOweSs4uh0mg/1okrFFAm9306mg/zBhb3ZWTRxRN7aon1p5qM8eVba
	C253+B1/nrV1hSBBS5H+3fjyDqEOTHLQ2tyFzWAkqoVEi6skcl3if802pgyRrXzwvYWkJJIwq/R9E
	4TyHRCr0HtIfieY0FNRBJ7CBIqzG4XlbI0hEZKODZcrx8phCzUWIXdKr0v6QVUKpGqZM1qyukJjJW
	b1/X/J7g==;
Received: from [122.175.9.182] (port=15860 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v91Jg-00000006H3p-1bAk;
	Wed, 15 Oct 2025 09:13:20 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 781BC1781F3C;
	Wed, 15 Oct 2025 18:43:16 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 603C417820AC;
	Wed, 15 Oct 2025 18:43:16 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cAZHz3sRBBnu; Wed, 15 Oct 2025 18:43:16 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 339211781F3C;
	Wed, 15 Oct 2025 18:43:16 +0530 (IST)
Date: Wed, 15 Oct 2025 18:43:16 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Md Danish Anwar <a0501179@ti.com>
Cc: parvathi <parvathi@couthit.com>, tony <tony@atomide.com>, 
	robh <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, 
	richardcochran <richardcochran@gmail.com>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, danishanwar <danishanwar@ti.com>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, m-karicheri2 <m-karicheri2@ti.com>
Message-ID: <1337524174.81738.1760533996123.JavaMail.zimbra@couthit.local>
In-Reply-To: <463668d1-a6a7-4606-af05-25384eb97caa@ti.com>
References: <20251013125401.1435486-1-parvathi@couthit.com> <20251013125401.1435486-2-parvathi@couthit.com> <463668d1-a6a7-4606-af05-25384eb97caa@ti.com>
Subject: Re: [PATCH 1/2] arm: dts: ti: Adds device tree nodes for PRU Cores,
 IEP and eCAP modules of PRU-ICSS2 Instance.
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: Adds device tree nodes for PRU Cores, IEP and eCAP modules of PRU-ICSS2 Instance.
Thread-Index: 6wT71ZEhJaxNH4mGwD2FOGh3nzOuFg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,


> On 10/13/2025 6:22 PM, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> The TI Sitara AM57xx series of devices consists of 2 PRU-ICSS instances
>> (PRU-ICSS1 and PRU-ICSS2). This patch adds the device tree nodes for the
>> PRU-ICSS2 instance to support DUAL-MAC mode of operation.
>> 
>> Each PRU-ICSS instance consists of two PRU cores along with various
>> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
>> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
>> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
>> 
>> am57-pruss.dtsi - Adds IEP and eCAP peripheral as child nodes of
>> the PRUSS subsystem node.
>> 
>> am57xx-idk-common.dtsi - Adds PRU-ICSS2 instance node along with
>> PRU eth port information and corresponding port configuration. It includes
>> interrupt mapping for packet reception, HW timestamp collection, and
>> PRU Ethernet ports in MII mode.
>> 
>> am571x-idk.dts, am572x-idk.dts and am574x-idk.dts - GPIO configuration
>> along with delay configuration for individual PRU Ethernet port.
>> 
>> Reviewed-by: Mohan Reddy Putluru <pmohan@couthit.com>
> 
> Please don't carry internal review tags in upstream patches.
> 

Sure, we will remove the tag in the next version.


Thanks and Regards,
Parvathi.


