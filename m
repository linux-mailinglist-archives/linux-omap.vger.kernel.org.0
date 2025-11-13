Return-Path: <linux-omap+bounces-4912-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FBC56031
	for <lists+linux-omap@lfdr.de>; Thu, 13 Nov 2025 08:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD173BA8D1
	for <lists+linux-omap@lfdr.de>; Thu, 13 Nov 2025 07:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF133218BA;
	Thu, 13 Nov 2025 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="TUPqQrEg"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E531A579;
	Thu, 13 Nov 2025 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763017764; cv=none; b=lgPB4I/G6PoLiznIInhoy4EKDu73ITDdpw072RR5LibwTJe2TjiHcn37M1ERcUxjIPQ0vV+w7G+/bmiK1vsLKrLFvYgUs3maLvHbj4gb2P34lXLXZTasiwp9G3M2L/bYI68EDRqdIg0WCMJ9hbW5fBuhvrGmDETBv9X99GHMky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763017764; c=relaxed/simple;
	bh=40REHCCklSt6AflWpmU6hsAu2lQyenxuwXU32WpLZ9k=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Net+v/yI4Y8TGs3USu7Nk1mjeOntRKF4WAeHW/SSTHNl3rLsH3FSNoMlKCyq5P/wASe3/Ev4Zg3/paXPfZwuTjyMB89q/Nj/ST0+L3eHKR8en/7omCjW0IlZZRQrqGg859gyTNVMfipRohlSw2/TDxpWbZdNiDnVxO1HQ87nHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=TUPqQrEg; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=a/zUORiLYgVJvvIFDouSZHVvh8fh4Yl0V3NhiL1OspU=; b=TUPqQrEgLdDmODb5AuADy6DhB7
	hw+HPx/o5kfORwW/2R41iZBKOhMSLy8HFaf4tDSIvDFBm5y6fFR5ZTVsftWRnhyGEruSXLsSaxWR2
	UUOnF2kMYvX9fbjazjhUa5NwiPATab2SQWXl4Ff87gkzotuLm92aFk3mTQ1ZEglKV4VJqDGKGSJFU
	R1GtAve/PluNCIvACBIrAnfJ9OifdChRj3/80vEoEF/X42OXv+5G8k/Y0mXr7I/9JR/AMi7/KYl1o
	63aVH3cLWINS0VswbGNk+mtZAQKnh6Ggy1ZmF9CWeR25pEHk4G1ppqZlVkWvDEyRrdML5hIWgPjXL
	iq/VOShQ==;
Received: from [122.175.9.182] (port=34661 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vJRSJ-0000000G9Ls-3fpH;
	Thu, 13 Nov 2025 02:09:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 376581A64E3C;
	Thu, 13 Nov 2025 12:39:08 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ckcJaN1Y1_X8; Thu, 13 Nov 2025 12:39:06 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id C8E841A64E3B;
	Thu, 13 Nov 2025 12:39:06 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 8GR88C0sm3ek; Thu, 13 Nov 2025 12:39:06 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 9B2661A64E3C;
	Thu, 13 Nov 2025 12:39:06 +0530 (IST)
Date: Thu, 13 Nov 2025 12:39:06 +0530 (IST)
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
Message-ID: <1253388251.49228.1763017746545.JavaMail.zimbra@couthit.local>
In-Reply-To: <444398864.187812.1762422794296.JavaMail.zimbra@couthit.local>
References: <20251103124820.1679167-1-parvathi@couthit.com> <20251103124820.1679167-3-parvathi@couthit.com> <89858ed0-58fd-4056-b8af-065c92885a10@ti.com> <444398864.187812.1762422794296.JavaMail.zimbra@couthit.local>
Subject: Re: [PATCH v2 2/2] arm: dts: ti: Adds support for AM335x and AM437x
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: Adds support for AM335x and AM437x
Thread-Index: 5iKEgrqd+6T7XN5cqv4nZpstY2kVHv8fMrJ2
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

> Hi,
> 
>> On 11/3/25 6:47 AM, Parvathi Pudi wrote:
>>> From: Roger Quadros <rogerq@ti.com>
>>> 
>>> PRU-ICSS instance consists of two PRU cores along with various
>>> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
>>> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
>>> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
>>> 
>>> The TI Sitara AM335x ICE-V2 consists of single PRU-ICSS instance,
>>> This patch adds the new device tree source file in-order to use
>>> PRU-ICSS instance, along with makefile changes to add the new DTS
>>> file for PRUSS.
>>> 
>>> The TI Sitara AM437x series of devices consists of 2 PRU-ICSS instances
>>> (PRU-ICSS0 and PRU-ICSS1). This patch adds the device tree nodes for the
>>> PRU-ICSS1 instance to support DUAL-MAC mode of operation. Support for
>>> Ethernet over PRU is available only for ICSS1 instance.
>>> 
>>> am33xx-l4.dtsi, am4372.dtsi - Adds IEP and eCAP peripheral as child nodes
>>> of the PRUSS subsystem node.
>>> 
>>> am335x-icev2-prueth.dts, am437x-idk-evm.dts - Adds PRU-ICSS
>>> instance node along with PRU eth port information and corresponding
>>> port configuration. It includes interrupt mapping for packet reception,
>>> HW timestamp collection, and PRU Ethernet ports in MII mode,
>>> 
>>> GPIO configuration, boot strapping along with delay configuration for
>>> individual PRU Ethernet port and other required nodes.
>>> 
>>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>>> ---
>>>   arch/arm/boot/dts/ti/omap/Makefile            |   1 +
>>>   .../boot/dts/ti/omap/am335x-icev2-prueth.dts  | 533 ++++++++++++++++++
>>>   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
>>>   arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
>>>   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++-
>>>   5 files changed, 692 insertions(+), 1 deletion(-)
>>>   create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dts
>>> 
>>> diff --git a/arch/arm/boot/dts/ti/omap/Makefile
>>> b/arch/arm/boot/dts/ti/omap/Makefile
>>> index 1aef60eef671..d06dd31d0bb6 100644
>>> --- a/arch/arm/boot/dts/ti/omap/Makefile
>>> +++ b/arch/arm/boot/dts/ti/omap/Makefile
>>> @@ -100,6 +100,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>>>   	am335x-evmsk.dtb \
>>>   	am335x-guardian.dtb \
>>>   	am335x-icev2.dtb \
>>> +	am335x-icev2-prueth.dtb \
>> 
>> This new DTB looks to be almost identical to the regular am335x-icev2.dtb, to
>> add an optional node to an existing board use DT overlay, do not clone the
>> whole board DT just to add a node. Maybe that is how we hacked around this
>> in our evil vendor tree back in 2018 but do not take our old hacks and push
>> them upstream as-is.
>> 
>> Andrew
>> 
> 
> Understood. We will review this redundancy and revert back with an update.
> 

We have created a device tree overlay file (am335x-icev2-prueth-overlay.dtso)
that will disable CPSW nodes defined in "am335x-icev2.dts" and enables the PRUETH
nodes at boot time depending on pin configuration. We will update the Makefile to
merge it with the base DTS to generate a device tree binary.

We will post the revised version v3 shortly.

Thanks and Regards,
Parvathi.

