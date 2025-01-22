Return-Path: <linux-omap+bounces-3162-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B0A192D2
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 14:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F41F16C45F
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 13:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289FE21325C;
	Wed, 22 Jan 2025 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="B8GfoPTf"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224201E4AB;
	Wed, 22 Jan 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553404; cv=none; b=b1hZW59BioLpKI/nSzYTVC1KG9yQ9aNFxZ0ATFlv3KJqs1mgwMgJihGLAYO/Ch0PwyLRBeYivC6RU9FdAOZnub3QYnJ91N3BKShH7WuloPLG22DwGVqlZCr7gT2QoY/UHdJRVAE2ajrpFevQypj1eGvNZkWGjqvB/2/2XTqzorY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553404; c=relaxed/simple;
	bh=VYNm3EvhdL0Eo3xnHsMFwg23UYv3DBxtjOavunSS+EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogpjkVDsPJUg9DMi+2drNm59+UNlPvViiV/rpM6zegIrjvpxfJsr/dmDxhdCcr5hmMKdpvbNrjh1xmP3SWXUZNH6MkouHPv//+SXmb6Ma+AFOLMhgVKg65ro9mS+otfAat5h9aWjH8LR3PjOzldUh+bh25n08E4AVJRezpOmYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=B8GfoPTf; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YJXkNjhw3Aw/eM4XePKe96UikbQjmvVIAHBl8Bw77+Q=; b=B8GfoPTfvztONar6kUdDGB6Dln
	7QBlQaOUSNpq42nxCfsTaoD3g3hgp47FjRCIS6AU2SKA/m/CrcaVKKcqG9b0JqCGmLYeX/U1X30qD
	94jcupitsrV3UmMeENlw+nIXGNaQvv4/Oi516Qi9D1zrSIK77B6nbt4uH5Gnu0mnmPR8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tab0X-006xSm-6T; Wed, 22 Jan 2025 14:43:01 +0100
Date: Wed, 22 Jan 2025 14:43:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>,
	andrew+netdev <andrew+netdev@lunn.ch>, davem <davem@davemloft.net>,
	edumazet <edumazet@google.com>, kuba <kuba@kernel.org>,
	pabeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	nm <nm@ti.com>, ssantosh <ssantosh@kernel.org>,
	tony <tony@atomide.com>, richardcochran <richardcochran@gmail.com>,
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
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <ef90ecc9-7bb1-4f18-bd14-c5a82f07021b@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
 <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch>
 <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local>

On Wed, Jan 22, 2025 at 06:56:14PM +0530, Basharath Hussain Khaja wrote:
> 
> >> +          ti,no-half-duplex:
> >> +            type: boolean
> >> +            description:
> >> +              Disable half duplex operation on ICSSM MII port.
> > 
> > I already asked this in the next patch, but why have this property? Is
> > it because the hardware is broken? Or is this some sort of policy?
> > Policy should not be in DT, DT describes the hardware, not the policy
> > of how you use the hardware.
> > 
> 
> This series of patches enables support for full-duplex only. Support for 
> half-duplex will be added in subsequent revisions. We will clean it up in
> the next version.

So you don't need this property. All you need to do is remove the 1/2
duplex link modes using phy_remove_link_mode() and user space will not
get the option to enable them, not will auto-neg advertise them.

	Andrew

