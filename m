Return-Path: <linux-omap+bounces-2833-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48E9F4921
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 11:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 038E916EB38
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 10:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2CD1E47BD;
	Tue, 17 Dec 2024 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gu1NQmi4"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3361E3DDB;
	Tue, 17 Dec 2024 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432204; cv=none; b=hSKJBihQfN4Y0K/Vanq57dyh1VAcwUXKdLj5N2sSeiCjryUHNGqXPjULV3h6qy36xuPyFOebZ7L8PeEFUC0ry+nG7OhNW9ff+pcVYDIM4Uh/4dnAfKdv00P2rKVL9kxqhHVPEyNCG3zOzyj8iOVj1Z7mP1SBELtOmHkUCb2/mbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432204; c=relaxed/simple;
	bh=RRpOx/UykeEWUFXL6nNAQ2Daurb4m2agbV9+L23KXMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDuhgsv/blJCzNTJOIO3bEgZtqZXx4Bi8KQCSrl+UD8dYH2zBcDAE6xmYpF0xdlHixPgBtQXuTeMuuNgochxLhoMArkWwZo+otN7X56s+uVtNrBGSi0fct8lT4ZI2B7QLxHgzk7QcxG5b1ohvskji5HXB/TIuKTC/Cwh1YcJGFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gu1NQmi4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5LHeG02SBNzlot+F+PM75eJbRUwQOFiIKhN/VJ12yBE=; b=gu1NQmi4+xbMV1dF8UV+lYPK47
	gnoZaxCSa07sWfqhrYjyagFVjccYrdYfbDE5yhv+hdFMsNV5kn5E6SESL9bjDPMUxP9yJYOsFlAt3
	MKrgW98hsSiG8kIJkEul+dN2/hgjw7Dr0Ey9N3Ej9B+GJh2BgBknt7k7vBVX00NBDhq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tNV2l-000vCm-1j; Tue, 17 Dec 2024 11:43:11 +0100
Date: Tue, 17 Dec 2024 11:43:11 +0100
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
Message-ID: <35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>

> @@ -2071,6 +2071,7 @@ void phy_advertise_eee_all(struct phy_device *phydev);
>  void phy_support_sym_pause(struct phy_device *phydev);
>  void phy_support_asym_pause(struct phy_device *phydev);
>  void phy_support_eee(struct phy_device *phydev);
> +void phy_disable_eee(struct phy_device *phydev);

So we have three states:

MAC tells PHYLIB it does support EEE
MAC tells PHYLIB it does not support EEE
MAC says nothing.

Do we really want this?

For phylink, i think we have a nice new clean design and can say, if
the MAC does not indicate it supports EEE, we turn it off in the
PHY. For phylib, we have more of a mess, and there could be MACs
actually doing EEE by default using default setting but with no user
space control. Do we want to keep this, or should we say any MAC which
does not call phy_support_eee() before phy_start() would have EEE
disabled in the PHY?

	Andrew

