Return-Path: <linux-omap+bounces-2855-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE29F7309
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 03:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC4847A369A
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 02:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA248614E;
	Thu, 19 Dec 2024 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLqq7svw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D66208A7;
	Thu, 19 Dec 2024 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734577151; cv=none; b=dBvfGnaEBm9DkHKnGqtQ9IJa84batGYLFcZJs/qXY49NQ5LVH/YxMjwhAn5N/utTE3SOwf4aVONmuBZf67V2SwZVN9uaTTFz31vTZkaFvHUOpT3fmhjgr7q1Kjz2HPAu8XQu6aIvf0icBVKHVgLNLEKnVu9XDPteRh3hoWg4QJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734577151; c=relaxed/simple;
	bh=2PMAakuyv2klU+SQq1ErxOBcrHuGhxSHemaa87wfvXM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=akebiHBIUPr5ujdtb0pwnrO+X9oQkYbzoiqJvT7hH2zKQo1thG2LDf2pLxV1JNNbmltoOI8WNkFgziTVaYh+7peGvsusC45N1YSBDFb9H1QVaj5edkkTd4Hse/NZj6093Z7QznQtj8VkQ3JpgNM88Dm5s10Nj66dyHo9LOqVZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLqq7svw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8213BC4CECD;
	Thu, 19 Dec 2024 02:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734577151;
	bh=2PMAakuyv2klU+SQq1ErxOBcrHuGhxSHemaa87wfvXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MLqq7svwbWjy/uor32XkCtL/h3nYBdUGP6FCEC+LZ/X62JCTtycfZwWuClnDqesW1
	 +NRzxR33ppGdnKYDaBl73igzHCRPhxY3Tm2LL092oq4wKp0kDKeUlkW4DDVzQjVHpu
	 KVd6YK5yu5ILWIVwk/aPC2fX+XaCbs1JzdJuoEqWOoL01+90HoikQPyPyTDmEhAO7Q
	 0MqvMCcAS/S9P5YP+yDxEy8buzhJgAWw3EOmwSae68Ee6AMf+Khpo0eJq5hUvYc/hV
	 egPHa7LJ6jv0U3dyOWQy0yw97jbaB8VnUDICV+xbPYUtfgJwkH6dR2BRNi6lIMzvbw
	 EEoml+iUcuydw==
Date: Wed, 18 Dec 2024 18:59:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell King -
 ARM Linux <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 linux-omap@vger.kernel.org, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 1/3] net: phy: add phy_disable_eee
Message-ID: <20241218185909.363b9dfc@kernel.org>
In-Reply-To: <35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
	<fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>
	<35e1ded5-e33f-4ea4-ab16-c460da402822@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Dec 2024 11:43:11 +0100 Andrew Lunn wrote:
> > @@ -2071,6 +2071,7 @@ void phy_advertise_eee_all(struct phy_device *phydev);
> >  void phy_support_sym_pause(struct phy_device *phydev);
> >  void phy_support_asym_pause(struct phy_device *phydev);
> >  void phy_support_eee(struct phy_device *phydev);
> > +void phy_disable_eee(struct phy_device *phydev);  
> 
> So we have three states:
> 
> MAC tells PHYLIB it does support EEE
> MAC tells PHYLIB it does not support EEE
> MAC says nothing.
> 
> Do we really want this?

Hi Andrew, do you feel convinced? I think I messed up merging some EEE
patches recently, an explicit Ack would boost my confidence..

