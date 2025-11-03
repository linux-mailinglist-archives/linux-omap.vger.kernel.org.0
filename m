Return-Path: <linux-omap+bounces-4822-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75682C2B6BC
	for <lists+linux-omap@lfdr.de>; Mon, 03 Nov 2025 12:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FE53BA83E
	for <lists+linux-omap@lfdr.de>; Mon,  3 Nov 2025 11:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C4E2FDC24;
	Mon,  3 Nov 2025 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="FxDwCxq/"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4C3054CE;
	Mon,  3 Nov 2025 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169408; cv=none; b=dE3HKoRDKDX210XAh0I+MkoYuIP5zL91NKBBqthcd8QfzVv/IquGDe2xXOksPxTiboekSVBwu+D6kF9QpK8q9BsFdtGaxyGFwqmYcCyhQCu2lbvlZA6ky16RlueZCHVK4YBIXDD6NR8y3SNs+VZMgqrM3pHKmQFO7DiPyGYjAQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169408; c=relaxed/simple;
	bh=hjqkskP7rEKOpC0HAWlWuk9UR+qmbWyNfX49a8doCqI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=k6sOHmnm56FI/KaHJ7AwvvZpCxU0T7i3D/N+3gMOclWXghx0CdfVt4hCWt4v65IzIKy5NGs/pxXLhmjryWHYHq/tOE2IGhcpQcIjblS+t8CqcsILa7fPmeeqzcNUSkqa6RwKuhOpBpZqeFbbKp4xPABzCF5Hdsa6p8JnoEHhwVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=FxDwCxq/; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pO1e3BxesOLdXFEMiUspsLON2Xgnazr0oTkpXmKAlXc=; b=FxDwCxq/M161NLrVbAViDNd8lQ
	2j9qnONIOgOVEimJgVCyJbB1vse1/oEIP5AWFuE8ZycmGTQw5B43b+PGAVsOJTcMZhO23oEaAQwhZ
	k07V3tshvT8pQyDdkaOK7DGSCC7BQSEKgS9XrV0qfsmK4kYhEHWUP7IjUZOsQgRPQ/GXIM7Byw5BI
	E8HbXLvPLRo/5kL7E8yF1TgK5rxEinLcwa9uyCQbo4NZSTyz6ALv4Y2jxvBTUpU1OCcN1UhKgFzF2
	QGfZ+czSAR4V2yBFWm1SQi/OhpdII0jhWNByO0kmu90W8OyifHI4y2PMLfwRoO27ULhPOBSi2b8Ip
	iqAADrxg==;
Received: from [122.175.9.182] (port=20643 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vFsQO-00000006Pzf-2Y0s;
	Mon, 03 Nov 2025 06:08:37 -0500
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 7A72F1784032;
	Mon,  3 Nov 2025 16:38:31 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 65CF21781F6A;
	Mon,  3 Nov 2025 16:38:31 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hg8Tri1-CFlx; Mon,  3 Nov 2025 16:38:31 +0530 (IST)
Received: from zimbra.couthit.local (zimbra [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 3EC801781698;
	Mon,  3 Nov 2025 16:38:31 +0530 (IST)
Date: Mon, 3 Nov 2025 16:38:31 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: tony <tony@atomide.com>, robh <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
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
Message-ID: <1460283559.152037.1762168111145.JavaMail.zimbra@couthit.local>
In-Reply-To: <1064878067.81811.1760534965853.JavaMail.zimbra@couthit.local>
References: <20251013125401.1435486-1-parvathi@couthit.com> <20251013125401.1435486-2-parvathi@couthit.com> <8cfc5ece-6c2e-48d9-a65c-3edbcc9edc39@lunn.ch> <1064878067.81811.1760534965853.JavaMail.zimbra@couthit.local>
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
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC141 (Mac)/8.8.15_GA_3968)
Thread-Topic: Adds device tree nodes for PRU Cores, IEP and eCAP modules of PRU-ICSS2 Instance.
Thread-Index: E3LIn1f4mOg6FaK5tJjNCk6cQUoE5cdujhE/
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

>>> +				interrupt-names = "rx", "emac_ptp_tx",
>>> +								"hsr_ptp_tx";
>> 
>> Something looks wrong with the indentation here. The same happens in
>> at least one other place.
>> 
> 
> we will correct the indentation of the interrupt-names property to properly
> align the continuation line as shown below.
> 
> interrupt-names = "rx", "emac_ptp_tx",
>                  "hsr_ptp_tx";
> 
> We will make sure to address this in all the applicable places and include
> this fix in the next version.
> 
> 
>>> +&pruss2_mdio {
>>> +	status = "okay";
>>> +	pruss2_eth0_phy: ethernet-phy@0 {
>>> +		reg = <0>;
>>> +		interrupt-parent = <&gpio3>;
>>> +		interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
>>> +	};
>>> +
>>> +	pruss2_eth1_phy: ethernet-phy@1 {
>>> +		reg = <1>;
>>> +		interrupt-parent = <&gpio3>;
>>> +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
>>> +	};
>> 
>> 
>> PHY interrupts are 99% level, not edge, because they represent an
>> interrupt controller in the PHY, and you need to clear all the
>> interrupts in the controller before it deasserts the interrupt pin.
>> 
>>    Andrew
> 
> 
> Sure, we will check and come back with more details on this.
> 
> 

We have reviewed and analysed the code, and confirmed that level
low can be used for the PHY interrupt, which seems to be a better
option than using the edge falling.

As shown below, the current interrupt configuration reflects a
level-triggered setup:

root@am57xx-evm:~# cat /proc/interrupts
           CPU0       CPU1    
163:          2          0 48057000.gpio  30 Level     4b2b2400.mdio:00
164:          2          0 48057000.gpio  31 Level     4b2b2400.mdio:01

We can see the IRQ has been changed to Level and the count is incremented
for every link event.

We will update the interrupt type to IRQ_TYPE_LEVEL_LOW as shown below and
share the next version.

+&pruss2_mdio {
+       status = "okay";
+       pruss2_eth0_phy: ethernet-phy@0 {
+               reg = <0>;
+               interrupt-parent = <&gpio3>;
+               interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+       };
+
+       pruss2_eth1_phy: ethernet-phy@1 {
+               reg = <1>;
+               interrupt-parent = <&gpio3>;
+               interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+       };
+};


Thanks and Regards,
Parvathi.

