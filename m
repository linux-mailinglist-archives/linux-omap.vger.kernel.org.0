Return-Path: <linux-omap+bounces-4867-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21881C39F2A
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 10:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84361A40E23
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CFE3101A6;
	Thu,  6 Nov 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="ntt1owRe"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB6D308F32;
	Thu,  6 Nov 2025 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422809; cv=none; b=owxxGtCbHZWtFt9rWhmqWeXCpS/v1+q2kx+UiC8Dp/11G0IbnvnN3zQPfzipSUPpGkVfmYEqFNFjyFQ/XZaDDGDy6k5//2lhpiNavcusz5CjZAfVwxJS7Wx0XgP27u3CXhnrz3gyQG69XCmzIGhxfXHr1MO1EmEaLOnELljsnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422809; c=relaxed/simple;
	bh=YWZ/f/Xm1TThWex2nsBM4B/s0uZIWCj3VSnqdGUIuPE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=KPzvV7XB76TNfAhp2S1TnssylU3xbFqA6wLBasTXQzqKENrNVns5JU0Odp/+i9V/+SqF3+EpyOfsMl/PRbKJvj2bVQrDsBMgtuRLGFzO0TnnaWM+dmN98Epjij7KW0/RxHJgO/bsm8CGj40eaVdJ4qUXIQUlDnhN4ZncPZ7x1Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=ntt1owRe; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YoDsD4YThrjSbuELnltLiWQ+YOjpC6WcOh7YxtTv6HI=; b=ntt1owReZ0Id+/bbRkYL2hQKN/
	GCkLpH3eoYe4hZkvVPXLouQ3qdp9fSNo3I6ARHXMZSmSJjAq2YAyhnfg3cYXeu+gfwhtA/V27C8Sl
	hW70eO3R1KzDM+tbs1vFZuTS2r4AT+GhG/O9FF9WmQqOxmiAZgFxrOoPb5DvRgtUiU9mS6wwym0Gb
	bsxOCiEy03/u4aw+c+AsU7736S4iJYXCg4/ahfBAczBCZomFDQABwCmM49ujyyMTc9psEYSNF391H
	E0xeCYOFHWKwRbpkwXdIYwyLF+1P9Nz0v2wnShMY3HWassnIJQBCB5rnc/iKmPFKutB4Pxma4Wu9K
	dW73DJSA==;
Received: from [122.175.9.182] (port=23110 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vGwgA-00000009M01-3hpK;
	Thu, 06 Nov 2025 04:53:19 -0500
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 021821781F3C;
	Thu,  6 Nov 2025 15:23:15 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id DB99B1784032;
	Thu,  6 Nov 2025 15:23:14 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q6H1Vmypm5ww; Thu,  6 Nov 2025 15:23:14 +0530 (IST)
Received: from zimbra.couthit.local (zimbra [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 8EDF01781F3C;
	Thu,  6 Nov 2025 15:23:14 +0530 (IST)
Date: Thu, 6 Nov 2025 15:23:14 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: afd <afd@ti.com>
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	tony <tony@atomide.com>, robh <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	richardcochran <richardcochran@gmail.com>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	danishanwar <danishanwar@ti.com>, pratheesh <pratheesh@ti.com>, 
	j-rameshbabu <j-rameshbabu@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, parvathi <parvathi@couthit.com>
Message-ID: <444398864.187812.1762422794296.JavaMail.zimbra@couthit.local>
In-Reply-To: <89858ed0-58fd-4056-b8af-065c92885a10@ti.com>
References: <20251103124820.1679167-1-parvathi@couthit.com> <20251103124820.1679167-3-parvathi@couthit.com> <89858ed0-58fd-4056-b8af-065c92885a10@ti.com>
Subject: Re: [PATCH v2 2/2] arm: dts: ti: Adds support for AM335x and AM437x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: Adds support for AM335x and AM437x
Thread-Index: 5iKEgrqd+6T7XN5cqv4nZpstY2kVHg==
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

> On 11/3/25 6:47 AM, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> PRU-ICSS instance consists of two PRU cores along with various
>> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
>> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
>> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
>> 
>> The TI Sitara AM335x ICE-V2 consists of single PRU-ICSS instance,
>> This patch adds the new device tree source file in-order to use
>> PRU-ICSS instance, along with makefile changes to add the new DTS
>> file for PRUSS.
>> 
>> The TI Sitara AM437x series of devices consists of 2 PRU-ICSS instances
>> (PRU-ICSS0 and PRU-ICSS1). This patch adds the device tree nodes for the
>> PRU-ICSS1 instance to support DUAL-MAC mode of operation. Support for
>> Ethernet over PRU is available only for ICSS1 instance.
>> 
>> am33xx-l4.dtsi, am4372.dtsi - Adds IEP and eCAP peripheral as child nodes
>> of the PRUSS subsystem node.
>> 
>> am335x-icev2-prueth.dts, am437x-idk-evm.dts - Adds PRU-ICSS
>> instance node along with PRU eth port information and corresponding
>> port configuration. It includes interrupt mapping for packet reception,
>> HW timestamp collection, and PRU Ethernet ports in MII mode,
>> 
>> GPIO configuration, boot strapping along with delay configuration for
>> individual PRU Ethernet port and other required nodes.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> ---
>>   arch/arm/boot/dts/ti/omap/Makefile            |   1 +
>>   .../boot/dts/ti/omap/am335x-icev2-prueth.dts  | 533 ++++++++++++++++++
>>   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
>>   arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
>>   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++-
>>   5 files changed, 692 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dts
>> 
>> diff --git a/arch/arm/boot/dts/ti/omap/Makefile
>> b/arch/arm/boot/dts/ti/omap/Makefile
>> index 1aef60eef671..d06dd31d0bb6 100644
>> --- a/arch/arm/boot/dts/ti/omap/Makefile
>> +++ b/arch/arm/boot/dts/ti/omap/Makefile
>> @@ -100,6 +100,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>>   	am335x-evmsk.dtb \
>>   	am335x-guardian.dtb \
>>   	am335x-icev2.dtb \
>> +	am335x-icev2-prueth.dtb \
> 
> This new DTB looks to be almost identical to the regular am335x-icev2.dtb, to
> add an optional node to an existing board use DT overlay, do not clone the
> whole board DT just to add a node. Maybe that is how we hacked around this
> in our evil vendor tree back in 2018 but do not take our old hacks and push
> them upstream as-is.
> 
> Andrew
> 

Understood. We will review this redundancy and revert back with an update.


Thanks and Regards,
Parvathi.

