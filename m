Return-Path: <linux-omap+bounces-2862-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BA9F779B
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 09:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B90517A29F1
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 08:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5F8220693;
	Thu, 19 Dec 2024 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Sp4qhRMq"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAAF41C79;
	Thu, 19 Dec 2024 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597699; cv=none; b=VqKabhHN5l6yRjeoHDlqm7AcSaVAODYCcvKSrahevqqx3G4qBNnxSu78P4Htag7hOeVYjbXZWO5+SRU2NKahaSGmiyp82qhaUb0MStb5uiLUOVCk1BMxw68okYTp5dWj1tisd32gPG2iehEqaCCKsQV4UZGK8sIvTnCZEzkbB0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597699; c=relaxed/simple;
	bh=KWDyOrPAFsKV9dZ5quFMmBUcsaO27+ykmLW+uwIDmF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwI+/zzKhprRMNY3zhZ2IR99Pvgiq5dFdK6kLW7v2VDw3Kb0HC76EYHDf9lQuteGvoqB3ox2AhkcbkgkuCn8GwY98Nw0CSgf7y8UXZA6GCf4NhtRCJx4JK/g/v0AgCYKdZuh2wHEDAKk0NiH2iB+6DAXKEio6yEEHmXKt4RO5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Sp4qhRMq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VWPs/KfSgefN7SQS6Aze4qvntsWTayNIDf7ZbgyfcGs=; b=Sp4qhRMq4nqGgCL+tAUQ0Z1YX0
	FxcCl/Y1pHn8xkrZFywajQE08aza8ubDZ8ZlIu/KKJ6jmxzjrSfvMoDRm32GaEfIaKRbeHgEOfoAg
	2GCSQyOSQ6JFxNFUa0AgCQ4XLkxh9qYqfw1gw/WtSTUAsjocPU3F5dh9eq5547g4lOyw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOC61-001Y9W-Pg; Thu, 19 Dec 2024 09:41:25 +0100
Date: Thu, 19 Dec 2024 09:41:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	linux-omap@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 1/3] net: phy: add phy_disable_eee
Message-ID: <6b7af899-2b20-493b-abfb-00e8310f7874@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>
 <35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
 <20241218185909.363b9dfc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218185909.363b9dfc@kernel.org>

On Wed, Dec 18, 2024 at 06:59:09PM -0800, Jakub Kicinski wrote:
> On Tue, 17 Dec 2024 11:43:11 +0100 Andrew Lunn wrote:
> > > @@ -2071,6 +2071,7 @@ void phy_advertise_eee_all(struct phy_device *phydev);
> > >  void phy_support_sym_pause(struct phy_device *phydev);
> > >  void phy_support_asym_pause(struct phy_device *phydev);
> > >  void phy_support_eee(struct phy_device *phydev);
> > > +void phy_disable_eee(struct phy_device *phydev);  
> > 
> > So we have three states:
> > 
> > MAC tells PHYLIB it does support EEE
> > MAC tells PHYLIB it does not support EEE
> > MAC says nothing.
> > 
> > Do we really want this?
> 
> Hi Andrew, do you feel convinced? I think I messed up merging some EEE
> patches recently, an explicit Ack would boost my confidence..

For phylib, yes, we have to live with this unknown state. so these
patches are O.K.

For phylink, i would like Russells opinion. It would be better if we
could avoid having the third state. Maybe we need a couple of cycles
where if the MAC says nothing, but the PHY negotiates EEE, we issue a
warning? We might then get an idea of how many systems are in this
unknown category, and can encourage MAC driver Maintainers to add the
missing EEE support.

Russell?

	Andrew

