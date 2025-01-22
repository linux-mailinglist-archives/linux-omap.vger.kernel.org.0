Return-Path: <linux-omap+bounces-3158-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D144AA19230
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 14:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188B3164E56
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3060212FBF;
	Wed, 22 Jan 2025 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="020ODiv6"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA618E25;
	Wed, 22 Jan 2025 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737551857; cv=none; b=FobT7zcm1BzOliTv91FnbXUZshEITTKeM6hMJZ6RbexKHXJJnest0ifzF9bCwedU3Me3k0HwgIAmmVEzTD3pqxjdxrHs3GPQArrAh9ggDwGVqv4JnokJJSwBL398zUgaaHeVDqk8Bq9Ayy/YrojkxL8c5L4rvncZFjF7DO7aF4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737551857; c=relaxed/simple;
	bh=JrOlnJHY8waOSXoOKwereWaAiPqVw6fyu1ZDgT7dG4M=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=NNwS8ElzDH9pI1E3wPC5F/4kqpYRqAC5vDYOyXEZ6qkVccp354s1Dk9CVk4Ghz/pvq2fpRu4vCxgaoVjweNa+2mkmTjvmkzJdT6Py1tHSdfoqQ9nxyzhFvfHZzeStElvsnnygLEyU+jul/50kVDjDVPKCbujlzcTkHTIbCu9VF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=020ODiv6; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=x+h5UKHT1Q5bzoTA6GUz4qAnjvALfXCiYgl3lpRkiHg=; b=020ODiv6NZmR5jKyjatCV+aT9l
	XwsyQq5QeSfFww0eq7iCKH5STKe4k8I2vM+NYwAw0ImtWWjY1PT2+Y4pcziVDc/53Uc0gfq8KpZkn
	MG1rcmgVHiNO5KQQ4U7UUakx9f/qJYid7PNIafIqK7kI/ZRrivCKnIJaW3ztvFeByhQE3w+MEbhhU
	izl2DQVVLghyx/3TBcjEDCOVTWSNV5fmUzAtEMiwVGXUBUep8gg8HnoBu10UeegIM6OQTqFNVTuF9
	pLcF3lgayjtI7oFul62InLuEoqzUo1qJ6dz93VPg1p1yZM9xFOl432DZVDAwtMNuZLqnZ/JEkwztr
	SFTc3riQ==;
Received: from [122.175.9.182] (port=10149 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1taabe-0004sa-0I;
	Wed, 22 Jan 2025 18:47:18 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 443A31781C74;
	Wed, 22 Jan 2025 18:47:03 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 1AEA01783FED;
	Wed, 22 Jan 2025 18:47:03 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id U5j_t1xDCAcK; Wed, 22 Jan 2025 18:47:02 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 9C91B1781C74;
	Wed, 22 Jan 2025 18:47:02 +0530 (IST)
Date: Wed, 22 Jan 2025 18:47:02 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: basharath <basharath@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	tony@atomide.com, richardcochran@gmail.com, 
	parvathi <parvathi@couthit.com>, schnelle@linux.ibm.com, 
	rdunlap@infradead.org, diogo ivo <diogo.ivo@siemens.com>, 
	m-karicheri2@ti.com, horms@kernel.org, 
	jacob e keller <jacob.e.keller@intel.com>, m-malladi@ti.com, 
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>, afd@ti.com, 
	s-anna@ti.com, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap@vger.kernel.org, pratheesh <pratheesh@ti.com>, 
	prajith <prajith@ti.com>, vigneshr <vigneshr@ti.com>, 
	praneeth <praneeth@ti.com>, srk <srk@ti.com>, rogerq@ti.com, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <835897001.382468.1737551822290.JavaMail.zimbra@couthit.local>
In-Reply-To: <2e82fb20-c6f9-4cc3-a700-fce049295f58@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <2e82fb20-c6f9-4cc3-a700-fce049295f58@lunn.ch>
Subject: Re: [RFC PATCH 00/10] PRU-ICSSM Ethernet Driver
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
Thread-Index: /F7uLdjpxFr3AOTU/2VXYpfIDw8vRA==
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

> On Thu, Jan 09, 2025 at 04:25:50PM +0530, Basharath Hussain Khaja wrote:
>> Hi,
>> 
>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>> Megabit ICSS (ICSSM).
>> 
>> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
>> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
>> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
>> Linux kernel. The current RFC patch series builds on top of these components
>> and introduces changes to support the Dual-EMAC mode on ICSSM, especially on
>> the TI AM57xx devices.
> 
> I guess this version also has the horrible architecture of multiple
> firmware's you need to swap between at runtime?

This series has support for a single protocol. Yes, swapping of firmwares will be required upon adding support for other protocols similar to ICSSG. 

Thanks & Best Regards,
Basharath


