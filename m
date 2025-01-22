Return-Path: <linux-omap+bounces-3166-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B0A19499
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A276188188C
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 15:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBF921423E;
	Wed, 22 Jan 2025 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="gy/tA6co"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145132135A2;
	Wed, 22 Jan 2025 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737558246; cv=none; b=f0bQ2S9wEwny0D+sYeMIuFkfIJjmxpfa+UPxgaDPVyA4vIc7YkCDgQlqY8VPt6qtpcie94C0IoO+G7u0d5MltWCucbCXcUUKOd5YV58dS8N6HXXglDjP1fEj24A4p5a1lfmo4a1wXsIUo/sn2qO1vgoS2vtqUSEhMym94eGiS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737558246; c=relaxed/simple;
	bh=lafRim2UXTsL7oci+UrPf8SeZAYk/YcqKEO3XRL7Mtk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Eq7LuGFN9FZG0cBnUx2fg6PUv1XJYqB+NN1JsyAZGkpe01Ywcd8A1pQ7li+J5XVMzVyADybskPPfsrafi+TL36mr7A4VpVu7ltbQZ9YTYhR8gEZ/MuNOzYvFaR9gjcOgM7Fa5i+NW7tihYCHqbaOQdBqdRsNaIPZIocWQJSlUAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=gy/tA6co; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3OedIriFi6e1oDwr4wv6eCf3QrN2hopNUC6JI0CVKVk=; b=gy/tA6cou0RSqwazxYArdTYzKe
	tySSjtGIDjp9DKjHTFUrJYK1i1W3sB/8uMWCrRCC2aBsBfIr8EaO55oO0sld/fcGmBR8aNFEJtk1v
	1Y52VdwdMsPF5EXA/U9sbHUrFf8Q30eABMRcoQUrEyiaxVIAdaQi3xajr257byXkTHxYdmJkZI4Vz
	nIeRK7s/roDdQl5Z4oN9j+bG6eqn4WF19Tsw3sjZ3wQxeBIdnXI+tuN/q3Ip9I8eYaIqbqjajv/d0
	8Qi4MDtvgvdOy63t1NJayJQbq3Ytj7a34dP0EoVkGBNMUU5zsLZu4tYH7T1/ztAYIugotapV1LaSn
	ozUtfzew==;
Received: from [122.175.9.182] (port=63087 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tacGr-0006uR-2d;
	Wed, 22 Jan 2025 20:33:58 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 01BEB1781F6A;
	Wed, 22 Jan 2025 20:33:51 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D52E51783FED;
	Wed, 22 Jan 2025 20:33:50 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uXAQt3860tFi; Wed, 22 Jan 2025 20:33:50 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 903EA1781F6A;
	Wed, 22 Jan 2025 20:33:50 +0530 (IST)
Date: Wed, 22 Jan 2025 20:33:50 +0530 (IST)
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
Message-ID: <1724623586.384707.1737558230381.JavaMail.zimbra@couthit.local>
In-Reply-To: <ef90ecc9-7bb1-4f18-bd14-c5a82f07021b@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch> <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local> <ef90ecc9-7bb1-4f18-bd14-c5a82f07021b@lunn.ch>
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
Thread-Index: JtHjXV1FZw7lKrvlAfAnj8GsvFy7sg==
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

> On Wed, Jan 22, 2025 at 06:56:14PM +0530, Basharath Hussain Khaja wrote:
>> 
>> >> +          ti,no-half-duplex:
>> >> +            type: boolean
>> >> +            description:
>> >> +              Disable half duplex operation on ICSSM MII port.
>> > 
>> > I already asked this in the next patch, but why have this property? Is
>> > it because the hardware is broken? Or is this some sort of policy?
>> > Policy should not be in DT, DT describes the hardware, not the policy
>> > of how you use the hardware.
>> > 
>> 
>> This series of patches enables support for full-duplex only. Support for
>> half-duplex will be added in subsequent revisions. We will clean it up in
>> the next version.
> 
> So you don't need this property. All you need to do is remove the 1/2
> duplex link modes using phy_remove_link_mode() and user space will not
> get the option to enable them, not will auto-neg advertise them.

Sure. We will remove this property and make necessary changes at all places in the next version.  

Thanks & Best Regards,
Basharath

