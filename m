Return-Path: <linux-omap+bounces-3059-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0EA07D04
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 17:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B408160F58
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 16:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28642206AE;
	Thu,  9 Jan 2025 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3enGU/Uz"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B721A453;
	Thu,  9 Jan 2025 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439062; cv=none; b=TSXXA4Dn/01DlE1z1In+awMV/C/Rj9ef88MVtmtXKLEB1NXG9n6Gf5CgUMFwJPvlAKPtv+Gb8I2QmswQfvcbTp58ZXATAFCw7NeRirivw7Okk4mu4xNt5A3sM2y1jP1eD+0Cd/EhNAfbI1XJiIBeuuFPuP2vllkrsBszlkTdOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439062; c=relaxed/simple;
	bh=L9hLpenY62TwChFRiiUYsGC+VeI+Y0A4VGPsVVjoD6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiWvhIPqSspIhMpIAkilqiVlC/ZFyWotnvX6ZmYjvVPsQGCbjWkjDhH19giWpbz2phNGtmymJ4mOfGvd2clv1y67lJGAgwuAypvOcsQ86qOY9NkiJaGQEhA3Ut+JdmerwcHNfoSRZeRWfws6bo2GrvQftruQ7cShPKGnoBCzMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3enGU/Uz; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m+VSPD28TfRDmVd100m2sowp0pegmPTa+/H6mPRZWuE=; b=3enGU/Uzg1m3dnVEok1h2JgQ9T
	2tR84bYfIEmU/WUPcqhmHmlKFx21W9c/gzlnY1JfOsScjOHUSWQnD48GGS6rR3feveeqG6rFhx3yH
	9GH4R340aOQAqTxsUwBPEZFLsBobt2NGNPQ2++dZTR5Othiais6yplXT/nWsTEI0lxOw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVv7N-002wi2-Tl; Thu, 09 Jan 2025 17:10:45 +0100
Date: Thu, 9 Jan 2025 17:10:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW
 configuration
Message-ID: <2f02964f-d143-4340-8284-790b5aa2901e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-4-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-4-basharath@couthit.com>

> +/* Below macro is for 1528 Byte Frame support, to Allow even with
> + * Redundancy tag
> + */
> +#define PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC	(VLAN_ETH_FRAME_LEN + \
> +							ETH_FCS_LEN + 6)

Is 6 for the redundancy tag? Is the redundancy tag defined somewhere?
Could this 6 be replaced by a #define, which is maybe a sizeof()?

> +	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
> +		 (!eth0_node || !eth1_node) ? "single" : "dual");
> +

Is that really true? Is it not in dual mode, but only one interface is
in use? I also wounder at the value of spamming the log like this.

	Andrew

