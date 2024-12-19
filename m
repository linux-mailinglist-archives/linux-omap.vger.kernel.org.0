Return-Path: <linux-omap+bounces-2860-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F29F7764
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 09:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08EDE1893A55
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 08:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8D221770B;
	Thu, 19 Dec 2024 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="I4uiIuB7"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7738F9C;
	Thu, 19 Dec 2024 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597307; cv=none; b=ANMIZZVuYIb9TKsZTJRfH2SOwekreqDfDjAXGTZrTW9SpoEeGKxW1ad6CNmY8VfBveiO6vpcYZFGO2CxkQ5JonU2dUI5pZFOosUErrItkzuTvlY+n9Xk4B+N8znQTQLgTkcMHaufS5K5GlvE4rgIqIo8ex3LJse7wcRZMbT2T9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597307; c=relaxed/simple;
	bh=IlULEW6CU1yyixZ3R+dQ+GB/FPBKJ83g8wU5BMmhDWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqPTKqDFTiQYpL/xHBeCes0MVz2QryjVr6vC7b8g7yxBSZqu19wY5Y5G2KkHKWxPnQO6jkOcMbar7r+JRostXpg5D197UOKOFxHSaCXgGW4rCpEJud5YLVaEOaH0r1qzObs3DTxrXTkfNo4AlcxTvfM91eQOVhYKkG0EZCFjFrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=I4uiIuB7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/BYLrICp9x+JYyEpqanBXgVDeHhnlhnaH+bHyihcbew=; b=I4uiIuB7vc0YXL7NZrUwKeYzDI
	6e3U4/cLWrFA/MxaKF3Cruz5uwQ4jwvejDpEyOPt6uL+KgzG6lhW6upDgOdBlpJC4Gt4PQpM3BdCa
	aQG6W3c8FzzsvMyRSIsf5eMPlBnJSiPTDbEScVe0sZ/pwNOGg8/scOoOhlyMQSAaNH+E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOBzm-001Y2J-3s; Thu, 19 Dec 2024 09:34:58 +0100
Date: Thu, 19 Dec 2024 09:34:58 +0100
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
Subject: Re: [PATCH net-next 2/3] net: ethernet: ti: cpsw: disable PHY EEE
 advertisement
Message-ID: <270e31cf-7d91-45c1-bc3d-c5d171545fd3@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <d08a798e-8565-422c-b2ed-121794db077f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d08a798e-8565-422c-b2ed-121794db077f@gmail.com>

On Mon, Dec 16, 2024 at 10:32:25PM +0100, Heiner Kallweit wrote:
> It seems the cpsw MAC doesn't support EEE. See e.g. the commit message of
> ce2899428ec0 ("ARM: dts: am335x-baltos: disable EEE for Atheros 8035 PHY").
> There are cases where this causes issues if the PHY's on both sides have
> negotiated EEE. As a workaround EEE modes of the PHY are marked broken
> in DT, effectively disabling EEE advertisement.
> Improve this by using new function phy_disable_eee() in the MAC driver.
> This properly disables EEE advertisement, and allows to remove the
> eee-broken-xxx properties from DT. As EEE is disabled anyway, we can
> remove also the set_eee ethtool op.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

