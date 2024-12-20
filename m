Return-Path: <linux-omap+bounces-2865-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82779F8E1A
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 09:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CB9E16B855
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 08:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D7A1A8410;
	Fri, 20 Dec 2024 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="htMgKyC5"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DE198845;
	Fri, 20 Dec 2024 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684054; cv=none; b=KxXUHpope0CUpUsPKilN6A91gTFJq+xKuAOrK+0Tmri58pZLAxuYMUGWazHTbmPyWpCHgToEI4SsTx8NPzgeBGXSTAjzLvaFeNxDoOa5HMxD/K/QzDWIygm+w5mWwMEirCypn8dcBwKxqE0FW3Hbsq0X4nWx5qWFwZDYbsfHgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684054; c=relaxed/simple;
	bh=GXjHFSfHXGkbazxF4UtzYwq7XneAfM1/GwSJhO2/4jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mx2NKrBOU1Yg1G1L8EJujGphKlmiuVmtjrgieADJL7pkrJQyuwZh3ab8m6E3+k2YYd9uLUx6IXRMtLcldDaJqVaEO2YWN3d5lWFR762cPQTmgszod7Vnl1VL5bljq+wlPJCgx9J6zh7XMXPL9fePuUEgfv+EUV8dFvBl2SeUYDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=htMgKyC5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j9U1VGdr2s8YAl9q2+JeX1Vkwfvzj9l8PtZs4y7rNZM=; b=htMgKyC59nsU4y0SItUayWEIez
	kuajlKd2QCLkxvaS1/lORP1G419ulxo9AN+JkUsCG0u295BqIIiDTHIyWB9Yky3waPC5/ciU/4wMK
	K6NihyTGVSu3HpTou+GWSPqtn0GckfA5Ej68IGuAZKcSygvpkrqB5fSLcE2SmqpHDG6g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOYYo-001vPI-2d; Fri, 20 Dec 2024 09:40:38 +0100
Date: Fri, 20 Dec 2024 09:40:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: kuba@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux@armlinux.org.uk, andrew+netdev@lunn.ch,
	pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
	horms@kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: add and use phy_disable_eee
Message-ID: <072064ab-50d2-4517-97df-73acd9262103@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <173466543676.2462446.11795736705448322037.git-patchwork-notify@kernel.org>
 <7128fc70-895d-4622-b12c-eab2475e3049@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7128fc70-895d-4622-b12c-eab2475e3049@gmail.com>

On Fri, Dec 20, 2024 at 09:26:54AM +0100, Heiner Kallweit wrote:
> On 20.12.2024 04:30, patchwork-bot+netdevbpf@kernel.org wrote:
> > Hello:
> > 
> > This series was applied to netdev/net-next.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
> > 
> > On Mon, 16 Dec 2024 22:29:58 +0100 you wrote:
> >> If a MAC driver doesn't support EEE, then the PHY shouldn't advertise it.
> >> Add phy_disable_eee() for this purpose, and use it in cpsw driver.
> >>
> >> Heiner Kallweit (3):
> >>   net: phy: add phy_disable_eee
> >>   net: ethernet: ti: cpsw: disable PHY EEE advertisement
> >>   ARM: dts: ti/omap: remove eee-broken properties
> >>
> >> [...]
> > 
> > Here is the summary with links:
> >   - [net-next,1/3] net: phy: add phy_disable_eee
> >     https://git.kernel.org/netdev/net-next/c/b55498ff14bd
> >   - [net-next,2/3] net: ethernet: ti: cpsw: disable PHY EEE advertisement
> >     https://git.kernel.org/netdev/net-next/c/c9f5a5dabbf5
> >   - [net-next,3/3] ARM: dts: ti/omap: remove eee-broken properties
> >     (no matching commit)
> > 
> Patch 3 is marked "not applicable" in patchwork and didn't make it to net-next.
> Any issue with this patch?

Maybe Jakub wants you to submit it to the TI DT Maintainer? Or get an
Acked-by: from said Maintainer.

	Andrew

