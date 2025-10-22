Return-Path: <linux-omap+bounces-4736-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40144BF9AB4
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 04:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA201881D1D
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 02:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAF51E5213;
	Wed, 22 Oct 2025 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="B2jdotmx"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE757846F;
	Wed, 22 Oct 2025 02:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761098474; cv=none; b=ZxX0dAUhAmMD1wxqcLx4dKACDvJIoCtBbR3IZLPCn3c0ED8o0s0kbANmMfb86oHh/ph1ZNXZJJse9ptZQ6Dwb8MV5qccbpPZ7CEittlsTIuMpgNYjxkB6AXAJHNDMBq31HlTeDexubDTb+8hgc2wyAII7LOGzVyp/fCWUzrTj84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761098474; c=relaxed/simple;
	bh=DSwtTN2XXSW7N1cHymSHCM6sSDHXD9Ex9wHauZncz10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idHtb4U09+/QjdF36BIPjAMpchqvTyvX9IM2thzWgZ4Yo0AHCuFf2Xec+dGXJMVzWag5HKqePp6nmEo9jIpKrJJjqCld6YOys35UgL6JHkMf+FT9WZA5qUIdA4HQU1cnTMdIcfJmbEXfVsNO4Xut7Ul/cBZR+DKvE4FZsWA3onE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=B2jdotmx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=v+ZfD9fF/UgDZ1OrbezXxvZHnxhAXNZ3sZ94dluEoBw=; b=B2jdotmxtbCfwFLP1pOyhPTHbA
	j0Pmymrvd/jGFe54iMstNIvQ/mn0sAe2YrxfbtCmBJl3lDICkphQnVBrVUq+BNCLliHWUELPYHeT+
	BJqtlddRKYIkV4LJpeCROz77udQjYARW94fWdoSsS3eocl/HEJ2BGN2NGQhuG15Y6aSU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vBO9r-00BhU6-7v; Wed, 22 Oct 2025 04:00:59 +0200
Date: Wed, 22 Oct 2025 04:00:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/4] net: phy: add iterator phy_for_each
Message-ID: <42e2d7f6-e3bb-41e8-bf55-46cdb11c713e@lunn.ch>
References: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
 <7d33ee44-8558-40d9-b258-2942b2caf95f@gmail.com>
 <20251021182451.33de59e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021182451.33de59e8@kernel.org>

On Tue, Oct 21, 2025 at 06:24:51PM -0700, Jakub Kicinski wrote:
> On Fri, 17 Oct 2025 22:41:12 +0200 Heiner Kallweit wrote:
> > +#define phy_for_each(_bus, _phydev)			\
> > +	for (_phydev = phy_find_first(_bus); _phydev;	\
> > +	     _phydev = phy_find_next(_bus, _phydev))
> 
> Wouldn't this better be called mii_for_each_phy() or
> mii_bus_for_each_phy() ?
> 
> To an outsider and with PHY typologies it may not be
> sufficiently obvious that this helper is used to iterate
> a all addresses on a MII bus.

The naming scheme suggest it either needs to start with phy_ or
mdiobus_.

mdiobus_for_each_phy() might be the best name, if you want to indicate
it iterates an mdio bus. It should also be noted that it will ignore
devices on the bus which are not PHYs. So we need phy in the name
somewhere.

	Andrew

