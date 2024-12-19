Return-Path: <linux-omap+bounces-2859-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3539F775D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 09:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1C6B167C51
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 08:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC16922146A;
	Thu, 19 Dec 2024 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XBJMxU0u"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3515E5BB;
	Thu, 19 Dec 2024 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597252; cv=none; b=FQvdEUiyJ4TcMjsWDNhZl2eo8W27hK1lQll+RZATBiISOzhOhqkUU96/b3hIn4XcopxxoXhIClKqb6NMohoF4t/pcEDPurhmd02+gwZjb6DGTHmTBOhJUY5GXYANb9naWT1bNP+ti5bKEd8DLrUSwcMZ/vbb93MfMJzyCe+C6jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597252; c=relaxed/simple;
	bh=ZDNPTus+pl0pyyVdBneRJIycZqkl5M4AmC4zHYoInrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO7SdhpH8aC5zuFOKwf+1PE2op2B9y1BIycHIdM/5XmZ2EYGPbhv4V0xUtjZNgylNXq2sipnE/vNv5MnfkS5Zt0jjEJkpbSTNZV4Ax4bgQKnN7bctQcTFP+mKNILkpUre5HB7PjL6szIcImUis8PLnETz0V4xROzDDVoZ0gONhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=XBJMxU0u; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Q9Vo7EMgyx3gITUSk3Rz41lLOoXpLKhtDG+rDzbzpi8=; b=XBJMxU0uF7+eYTjPPt201hkgq4
	sgiSRCCTJ/Ry26Hdxk2uPJVACMT0B7RWk3vahniFyLZeg2Qy8F+aN9fe+2px8Nr1P+rnNFG3heVY2
	AMOU1xhWVyY2P9nURy+H8oQa348iGN6yZDRIIi6AehBkQhV7qXvTZw3OLleKpaZbYJY0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOByq-001Y0i-No; Thu, 19 Dec 2024 09:34:00 +0100
Date: Thu, 19 Dec 2024 09:34:00 +0100
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
Message-ID: <2397ac08-8cb7-4158-bc0c-48fc4a2e0c2c@lunn.ch>
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

On Mon, Dec 16, 2024 at 10:31:18PM +0100, Heiner Kallweit wrote:
> If a MAC driver doesn't support EEE, then the PHY shouldn't advertise it.
> Add phy_disable_eee() for this purpose.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

