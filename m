Return-Path: <linux-omap+bounces-3058-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C067A07CC8
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 17:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C203188BEEF
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 16:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D46B21E088;
	Thu,  9 Jan 2025 16:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="tr/v0lRn"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985539AEB;
	Thu,  9 Jan 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438589; cv=none; b=feNU9SYcM7KppH9imk4Lb1cFnBsemEA2qBVuEFWRZWFrMmL5CAY/RffSRlOuop5T86xvh74iPk9Spyddx1dIfYYL+G2rxILUEccsAFXVJ7y8VlUnVOocl5kCOP39MiEyd664xCtK9nc8oM3ZA1mXATVLG9AyjtSHq1nbUpIeuFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438589; c=relaxed/simple;
	bh=WTG2peeOI7n3WBwKLXT/zRr4OviIoCYbtBgGIqhl6l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0HVDAFhdSE5E2wkcMhbd5TkyeBIjI7hhcxPEGP90K4NAMtfxy1D9ZSrHmHFRSxhWNws2IqVXb1gzIcvMFDzPVhi/H7PaNd/Q9GXKtc6XPjp0pjS0BreUYz2uK3xamKqtXi+e3iHihus0FZbbtcpHG4t9W1YgSHX86+NR0Zpbss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=tr/v0lRn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6QZA/dEpZHfPL8zII3z7jZ3rXZOBU2nqF4/JSK9phR0=; b=tr/v0lRnaWVK4k2LzTbgwXG5mD
	sPhRggilSwCGvIgEtd922ZzitNqgUQhOWlXekmVxn48AX4kPmFJSFLsLiSMLb4oLVqwP08eemOawU
	IqO6vTGTLxRxUipFB064IWqfYK3vkOpV09LA+AvHdGTX9NDxnCbv8R/SgU6SH80bkwrk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVuzh-002wSD-Hk; Thu, 09 Jan 2025 17:02:49 +0100
Date: Thu, 9 Jan 2025 17:02:49 +0100
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
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-2-basharath@couthit.com>

> +          ti,no-half-duplex:
> +            type: boolean
> +            description:
> +              Disable half duplex operation on ICSSM MII port.

I already asked this in the next patch, but why have this property? Is
it because the hardware is broken? Or is this some sort of policy?
Policy should not be in DT, DT describes the hardware, not the policy
of how you use the hardware.

	Andrew

