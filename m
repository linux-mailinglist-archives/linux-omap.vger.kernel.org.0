Return-Path: <linux-omap+bounces-3556-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE13A7EF3B
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 22:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2BC43AB85E
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 20:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC35221DBC;
	Mon,  7 Apr 2025 20:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TP3EocCp"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6B621D5AF;
	Mon,  7 Apr 2025 20:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057167; cv=none; b=HKdMGoQxO7u89sjMeuyf+QU0R7tFfMPy2B7Vr1mgSErie4RB+DVMlLRHFnPXB1PamabmxNHmKrhoNpTVjZF07o4E703fAV1jdd2tUARaj53NusBJoa23FH9tYdXP4BuY4OtMY3kKlcv3at01z32mJMvEjtIScqm9Tgm/vVp304M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057167; c=relaxed/simple;
	bh=JL1TwO0QisIRY/UipZA0+4kEkZdV6rnM9mipx5ymyVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfhxalSnW7kn5UGqreRSc718osVN+E2kOSeWokMyQCTs+R0rfdE++JxiG9bNOvgWckpahsrG278GqeZXF9jI4jd8eoYhlYlWeZEGAimNqiG3OZQzQ+wSo/Zt+ToRcdeO0FCRxpqooermtxIaZE0MCRwDU1RYZp2qLDQAyWQaX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TP3EocCp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aCOIayB/uh3QINC7/k4aL3vcVRE0EtU21+z9kTHUZ3M=; b=TP3EocCpadaCAdFO71dftOQTan
	6RCmKPf1jrTeu7TFuXwMgOTnhEqRUeZ0kQ5L//pkrL1gkbRB/Jrgz+7Y3MOTPknmdM0MLaGsISOAw
	BIKAuO4sksZ7GPLbipuH73siTIFXd/0cZCL0hrluimBWN8vbK9ag1QVlQVuMJvyuZCbc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u1svf-008InE-Rq; Mon, 07 Apr 2025 22:18:47 +0200
Date: Mon, 7 Apr 2025 22:18:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, richardcochran@gmail.com, glaroque@baylibre.com,
	schnelle@linux.ibm.com, m-karicheri2@ti.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, basharath@couthit.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Message-ID: <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
References: <20250407102528.1048589-1-parvathi@couthit.com>
 <20250407113714.1050076-6-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407113714.1050076-6-parvathi@couthit.com>

> +#define PRUETH_MODULE_VERSION "0.2"

> +static void icssm_emac_get_drvinfo(struct net_device *ndev,
> +				   struct ethtool_drvinfo *info)
> +{
> +	strscpy(info->driver, PRUETH_MODULE_DESCRIPTION, sizeof(info->driver));
> +	strscpy(info->version, PRUETH_MODULE_VERSION, sizeof(info->version));

Driver version numbers are pointless, they never change, but the
kernel is changing all the time. Leave version blank, and the core
will fill in the kernel version, which is useful.

     Andrew

