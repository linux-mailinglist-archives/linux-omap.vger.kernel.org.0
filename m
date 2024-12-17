Return-Path: <linux-omap+bounces-2851-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728FD9F599C
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 23:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D8027A3FFA
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 22:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78A61DFD91;
	Tue, 17 Dec 2024 22:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="B36yzb8r"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D21EEB2;
	Tue, 17 Dec 2024 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734474861; cv=none; b=Tj7Sz8zIxfxCxSkvkJwgcRj8ZLw/HtMe7qdnyBs2KZh/1FHvJFzP032PlWXK/HEUyOXhMnIaiM51txUFD/lGtqu9JkCTjnA+QobM2E0rMdT94PCbTDPL6O+bfhDWb7DAsRPGJUL3UVDs+kWLf2T/skl46UE4pWtyLbFaI7uFbuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734474861; c=relaxed/simple;
	bh=RAFs9ax2hBuy1Yw29FsVtVrKFDoOZNKch8c06jRQ+v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7SnKo/LNOjHY6ylhf8RKhbt5bGobEQKUzKr3o0UL2jcpjyNdibTQq7ZWAhL6NYvEj343KyIRA/vfMT93EAYVsZIHtFJjl1ljNj+698/S3pc69bFO1ndWDS2iolHE1zn7wMdAWKKACp32qfVVk3AuEwBxSJS8dv6fqinPeFfnj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=B36yzb8r; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZOzz5gjHLZymxcIe9J7kawYOLjtZqL9yh9BoTBYCkdo=; b=B36yzb8r/Xy7k4jHLlYGzqU8h8
	DTzLbAuE3xWlwxna6V9MC1K2wV4ACxjfTbKRWkfl1ZrCkeSBo2O5FhwHk1xUix+pG69Xuomf/jH5C
	zNlVBQMtSDhxNCXhNpUlgPfgm/5neuBeM6blyZp1aMRgtQuV+ydrt1ixHCj7g9B0T9no=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tNg8l-0015S5-2y; Tue, 17 Dec 2024 23:34:07 +0100
Date: Tue, 17 Dec 2024 23:34:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	linux-omap@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 1/3] net: phy: add phy_disable_eee
Message-ID: <35cd4b23-06fe-4ac8-99f2-5eb59ff275a4@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>
 <35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
 <7f8d2b63-390d-4f7e-9ede-d28c7793538c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f8d2b63-390d-4f7e-9ede-d28c7793538c@gmail.com>

On Tue, Dec 17, 2024 at 09:50:12PM +0100, Heiner Kallweit wrote:
> On 17.12.2024 11:43, Andrew Lunn wrote:
> >> @@ -2071,6 +2071,7 @@ void phy_advertise_eee_all(struct phy_device *phydev);
> >>  void phy_support_sym_pause(struct phy_device *phydev);
> >>  void phy_support_asym_pause(struct phy_device *phydev);
> >>  void phy_support_eee(struct phy_device *phydev);
> >> +void phy_disable_eee(struct phy_device *phydev);
> > 
> > So we have three states:
> > 
> > MAC tells PHYLIB it does support EEE
> > MAC tells PHYLIB it does not support EEE
> > MAC says nothing.
> > 
> > Do we really want this?
> > 
> > For phylink, i think we have a nice new clean design and can say, if
> > the MAC does not indicate it supports EEE, we turn it off in the
> > PHY. For phylib, we have more of a mess, and there could be MACs
> > actually doing EEE by default using default setting but with no user
> > space control. Do we want to keep this, or should we say any MAC which
> > does not call phy_support_eee() before phy_start() would have EEE
> > disabled in the PHY?
> > 
> The case "MAC says nothing" isn't desirable. However, if we did what
> you mention, we'd silently change the behavior of several drivers,
> resulting in disabled EEE and higher power consumption.
> I briefly grepped the kernel source for phy_start() and found about
> 70 drivers. Some of them have the phylib EEE call, and in some cases
> like cpsw the MAC doesn't support EEE. But what remains is IMO too
> many drivers where we'd change the behavior.

So for phylib, we keep with the three states. But phylink? Can we
disable EEE when the MAC says nothing?

	Andrew

