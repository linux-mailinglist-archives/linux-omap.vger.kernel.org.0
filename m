Return-Path: <linux-omap+bounces-4223-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB9B26A82
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 17:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B638C4E5D63
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 15:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17699226177;
	Thu, 14 Aug 2025 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/xVMZ2s"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DFC224B05;
	Thu, 14 Aug 2025 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184139; cv=none; b=dq8ClqGUcTKyJWdgZyabRnQVwSAxU3BEfzSM6/wpAAufnx4ytjGl8S9+SbIZlZmGmiIJBCOa38wSO+RtJl0fzd8DAf6RAcSkiWkaooE9IpEW+tWzDuqjERmzpqdVKVrBGQElFXm6GCxWFFhxTa92Zcz4NaUXXAhZweW0qzU+mXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184139; c=relaxed/simple;
	bh=RWn+m8kEOsMa9YCCZfdx0JTcPICHGpBb66M2H3aGtpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awBoA81aQi/7WUc0s83zPV1wHkG9WHCPzkgDqpUeH92yMlKW6cvWwRVnRC/Fug25lIBDZ53Hx8XpqlZnR6L9Df4WqKOE26zXVLZeGoU8sRQeGkMFFJ3WBhRZuWzcgf6U3/QJLPLQJaUT2RAj6Vtj5XSfsVUanKDEpzlVEc0lqOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/xVMZ2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8400FC4CEEF;
	Thu, 14 Aug 2025 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755184138;
	bh=RWn+m8kEOsMa9YCCZfdx0JTcPICHGpBb66M2H3aGtpQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k/xVMZ2suFLICLAxMNXGWvXPVkyJC6IF+wrQTKLv+6/1SfqNhHBrfnz1ymVObyuAT
	 fZ6+6BeTDltdUjTMLDXvqF5XzmVA4Cdq5+Nm8uP5s0KMwQtXM6HKaG1rIVKsCJQjPL
	 MU8rrWXkJ9iWllzFAsGz+Qlc5WLokUU+4eeWDbApvg4d7kNgrbOQaT8WllG0SaAFmj
	 FRC4Jwm2a8+xhge0VPzbfMwaXM2dqh9Spmtum3PlwJjjrVholDe9i4W401bK3s+rav
	 cKbDSprj4vVSFR2lAvcntBNsLvC7IAjdw2p0Hbi+rFMhJcUOwfJhqhP/XG1FtjQu+D
	 oXbdOgSA18vmg==
Date: Thu, 14 Aug 2025 08:08:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 8/9] net: ethernet: ti: am65-cpsw: add
 network flow classification support
Message-ID: <20250814080856.1222bcc7@kernel.org>
In-Reply-To: <32e6bb4b-711c-455e-bfa4-2c0b2011e1ec@kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
	<20250514-am65-cpsw-rx-class-v4-8-5202d8119241@kernel.org>
	<20250516182902.5a5bfd98@kernel.org>
	<d787ca03-a54e-46ae-828b-68fbd7b0b3a8@kernel.org>
	<20250813074803.06db304a@kernel.org>
	<32e6bb4b-711c-455e-bfa4-2c0b2011e1ec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Aug 2025 16:44:49 +0300 Roger Quadros wrote:
> >> Because driver doesn't have logic to decide the location and relies on ethtool to
> >> decide it if user doesn't supply it.  
> > 
> > The location supplied by the user may have semantic significance.
> > IOW locations may be interpreted as priorities.  
> 
> OK. Is there any convention on location vs priority for user or it is driver dependent?
> i.e. Does higher location mean higher priority?

/**
 * struct ethtool_rx_flow_spec - classification rule for RX flows
[...]
 * @location: Location of rule in the table.  Locations must be
 *	numbered such that a flow matching multiple rules will be
 *	classified according to the first (lowest numbered) rule.
 */

> > It's better to support LOC_ANY and add the 10 lines of code to
> > allocate the id in the driver..  
> 
> OK.
> 
> I did more tests and it seems that higher locations in the classifier override the lower locations.
> 
> With this new information, what is the best approach?
> 
> I can add support for LOC_ANY with logic to find first available free location.
> If driver supports LOC_ANY, does driver also need to support explicit
> location supplied by user? In this case I think user convention and
> driver convention of location vs priority must match.

If your device supports ordering then it's up to you.
LOC_ANY has slight performance advantage, because CLI doesn't have 
to dump all the rules to find an unused ID. But I'm mostly concerned
about the semantics, the performance thing may not matter, depending
on how many rules you can support in the first place.. up to you.

