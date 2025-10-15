Return-Path: <linux-omap+bounces-4687-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A42BDEC33
	for <lists+linux-omap@lfdr.de>; Wed, 15 Oct 2025 15:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A839E19C3FD1
	for <lists+linux-omap@lfdr.de>; Wed, 15 Oct 2025 13:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1DD200BAE;
	Wed, 15 Oct 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="AoLPHUbg"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F6B1F2361;
	Wed, 15 Oct 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534975; cv=none; b=XKVVtLRmdQuNgYeJMUWrAVe+xeFIJfeOcASscAd3V5j7j2lyUQB4FznE3JyVFMdL5knpunhRpczdD8dKnGn/A2a8RRFHwBFQzQyJPu9tDtRKjOaCPOTAQHjFr6XHGT++x6M2/4JXSOv5JuopafS1SegFEQFInLrUmdURcM8aPck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534975; c=relaxed/simple;
	bh=2hmMvyH8KAC2yhT2Ax5Nx8K1FAV9uq1Qg41rzGl0+Sg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=dSGqucfgzpH+kHQMep12DH2k3FvR8MnPfe9oqV9M08qyCaCS6qVdcaSaP/Y45eQ/GLsPfAhcDeT71EXrBI2fgE0Ds+z+t2VOMFJ3CvKSVJdV9flZTvPuhattmPa3bNgyWAkaCLzAaSBJktTbckCplfO6Mf7K1W5gkKPd/bqX6xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=AoLPHUbg; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=s2K7GHGVKyAUUpmTe3FDfYNRYK/z1701QaUyzv3V8Bk=; b=AoLPHUbgLksgoj0K49hCkx+uRb
	qARH+UxQl33YfSHLev1gfxrnblxG7tOE+50CzE5Vt+ceUCU+GGPIIu88Q7OPjmaifo8/m2mkdvyb+
	Ap5R0k1VrOZiblWEM8ZyqOtw8mbU4bL/hfYHwEHjirrQQn1h4p6r5EYAzQ93WrYy+eZqoZ/l9TJFt
	nFDBoZNcqE6ETJphRGP40R7dtZqpZQ3KV/ayLxhxFmmJNvOYuF7FRbaDagJOSjFkZbygu+YKs428U
	at6+zbWmwH7K64Fu48WMla9D0+XzIcAiTMkcGcnZsTXdTI0JhzYGy6Kp3MKPpwJP/5EtXNsG9whdM
	BnYuZ0gw==;
Received: from [122.175.9.182] (port=34500 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v91ZK-00000006HKz-2vEc;
	Wed, 15 Oct 2025 09:29:30 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 92F2F17823F4;
	Wed, 15 Oct 2025 18:59:26 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 7C0F617820AC;
	Wed, 15 Oct 2025 18:59:26 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DEQ94I0dxhEn; Wed, 15 Oct 2025 18:59:26 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id EF5711781F3C;
	Wed, 15 Oct 2025 18:59:25 +0530 (IST)
Date: Wed, 15 Oct 2025 18:59:25 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <1064878067.81811.1760534965853.JavaMail.zimbra@couthit.local>
In-Reply-To: <8cfc5ece-6c2e-48d9-a65c-3edbcc9edc39@lunn.ch>
References: <20251013125401.1435486-1-parvathi@couthit.com> <20251013125401.1435486-2-parvathi@couthit.com> <8cfc5ece-6c2e-48d9-a65c-3edbcc9edc39@lunn.ch>
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
Thread-Index: E3LIn1f4mOg6FaK5tJjNCk6cQUoE5Q==
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

>> +				interrupt-names = "rx", "emac_ptp_tx",
>> +								"hsr_ptp_tx";
> 
> Something looks wrong with the indentation here. The same happens in
> at least one other place.
> 

we will correct the indentation of the interrupt-names property to properly
align the continuation line as shown below.

interrupt-names = "rx", "emac_ptp_tx",
                  "hsr_ptp_tx";

We will make sure to address this in all the applicable places and include
this fix in the next version.


>> +&pruss2_mdio {
>> +	status = "okay";
>> +	pruss2_eth0_phy: ethernet-phy@0 {
>> +		reg = <0>;
>> +		interrupt-parent = <&gpio3>;
>> +		interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
>> +	};
>> +
>> +	pruss2_eth1_phy: ethernet-phy@1 {
>> +		reg = <1>;
>> +		interrupt-parent = <&gpio3>;
>> +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
>> +	};
> 
> 
> PHY interrupts are 99% level, not edge, because they represent an
> interrupt controller in the PHY, and you need to clear all the
> interrupts in the controller before it deasserts the interrupt pin.
> 
>    Andrew


Sure, we will check and come back with more details on this.


Thanks and Regards,
Parvathi.

