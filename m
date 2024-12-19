Return-Path: <linux-omap+bounces-2861-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CDE9F7771
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 09:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E41FC1893D21
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 08:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA380217728;
	Thu, 19 Dec 2024 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jxC2TY8D"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23871F2C4C;
	Thu, 19 Dec 2024 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597334; cv=none; b=ZIm6KtW2JA9Al+x3QmtDnXQX0XcYNOXyhoMPV+oKs+Pndk6MtnfSmfdhWUywwVEoK5YsD5dLqR8TLzb8+rIQFn3SZyb+PUCNKBa4+lc+sBLinnjvZvTlAf/6NFQYFJJNC0a4JVaX6DoICv27tKvrQGw70vTzTIjQ2UGr/xAJU9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597334; c=relaxed/simple;
	bh=mT5gX3ZCfgoyE9ltuXoCQiR+OZrok5NcCLFB/IyE2sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtF5rGYTgtsvDCzXG1k0CiVKVt2i725oFEs30IbKTa5EE3bN6zbVey262qsYkx6ek06tPhnHYxh/VFd86JkjepQKLuYt1kYd98+j1Y4hc2TCsClVJVZkT++Wq3Y98q4Ob6VtASCHZ4ZL96QeQitZHYd+GYKNNhaIlaDtIEZoOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jxC2TY8D; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mSNtBJb29XTUV5tZoYALm0GglugNCwIOEeaMSPuOX0w=; b=jxC2TY8D62Zlqmxh+TYuKmgw+e
	eF2/igwjHkzZh3f2/DQx3g7hDlVwaGGRy6bbk5YNqMomQKXcfNZamtga5PoYSqCFZS+yH72r6si3x
	0wv/eCUBKSXSkLW+N5OdyvSMc0aLjDGKYdESRTKx1MGobjJ5F9mbOOoS2pDex9QwlknA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOC0B-001Y3F-Ca; Thu, 19 Dec 2024 09:35:23 +0100
Date: Thu, 19 Dec 2024 09:35:23 +0100
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
Subject: Re: [PATCH net-next 3/3] ARM: dts: ti/omap: remove eee-broken
 properties
Message-ID: <87fdbebf-1728-465f-ba24-adb0fa70b16d@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
 <4a3f337e-cb76-46cc-bacb-c2ed8160619c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a3f337e-cb76-46cc-bacb-c2ed8160619c@gmail.com>

On Mon, Dec 16, 2024 at 10:33:21PM +0100, Heiner Kallweit wrote:
> Now that the cpsw(-new) MAC driver disables PHY EEE advertisement,
> we can remove the eee-broken-xxx workaround.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

