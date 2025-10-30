Return-Path: <linux-omap+bounces-4812-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B73EDC1E195
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 03:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6003A4E5627
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 02:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ADA2FB618;
	Thu, 30 Oct 2025 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQOgDPuR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DFD286D7D;
	Thu, 30 Oct 2025 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761790234; cv=none; b=pVcYwHommUHTiRpT8VAVkIW1FTStD+PQV5kroH0R6OFMJVg54aYazfJ/x1PCYtvfvjmoMGhvaOilJ195rlh55v9Jt6ZgjcKCNii948jj1YgrkOSJNF+vTItk+XRe780P3m3RSWq/oYlIgb8Xcdh7SP6FBntFmOf0h5x523MJkyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761790234; c=relaxed/simple;
	bh=qYrpYpN6+1EHjkbZwU9+wYqpCq+V6IjQpvO7dJMl1JU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Z8WrCIKI1/Q/l0yZPB/upE4IZ2fwVDulS+fTSUac9ujXw3SzHG077cCnRgBHW3EmsGx/O1bGKTda6WpxdB8OmrorJZSAxdQF3yX5hQnFTESQ4wDH/CLCNdtEQWgB13gJXqHri925S5notB9xh5bfEaVtNv9Mj+ucYPVxVFNwDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQOgDPuR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433DEC4CEF7;
	Thu, 30 Oct 2025 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761790234;
	bh=qYrpYpN6+1EHjkbZwU9+wYqpCq+V6IjQpvO7dJMl1JU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NQOgDPuRkaHdL7Nj6GetaxC2vpgxqU34qHLhL+fbZXZ2z5QonDKq2SlwT+VxjKVUV
	 r9PKPqUPu6KK6qK4/usOSFXDJ3BJEENNTRbTMzY9aOABqPMkkljk76DrY22lhwAouh
	 NHOC7ABvvWISGy3nU0KG39EBCIYmXwvF1x5ntVw4KlAcnZNxYdcAscoFds6wnq+uKt
	 SoDGhttFSm3/1v86XhShuC0xnFWuLNsQDn/7ogUWTvmQyLvMi75Oq5RUWt/NZl/XAl
	 Aeee9yf7LA8gGPkv/jNWVchP/kK9y6k7vB/RiSMER3KIMN02aPCuSS9vtt37/+9+9k
	 iQghuWLYZm3Mw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DCB3A55ED9;
	Thu, 30 Oct 2025 02:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 net-next 0/4] net: phy: add iterator
 mdiobus_for_each_phy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176179021125.3284947.14137231536759252044.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 02:10:11 +0000
References: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
In-Reply-To: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: wei.fang@nxp.com, shenwei.wang@nxp.com, xiaoning.wang@nxp.com,
 s-vadapalli@ti.com, rogerq@kernel.org, andrew@lunn.ch, andrew+netdev@lunn.ch,
 linux@armlinux.org.uk, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, netdev@vger.kernel.org,
 linux-omap@vger.kernel.org, imx@lists.linux.dev

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 25 Oct 2025 20:48:20 +0200 you wrote:
> Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
> as a prerequisite.
> 
> v2:
> - rename iterator to mdiobus_for_each_phy
> v3:
> - add missing return value description for phy_find_next
> 
> [...]

Here is the summary with links:
  - [v3,net-next,1/4] net: phy: add iterator mdiobus_for_each_phy
    https://git.kernel.org/netdev/net-next/c/26888de97b2f
  - [v3,net-next,2/4] net: fec: use new iterator mdiobus_for_each_phy
    https://git.kernel.org/netdev/net-next/c/0514010d553a
  - [v3,net-next,3/4] net: davinci_mdio: use new iterator mdiobus_for_each_phy
    https://git.kernel.org/netdev/net-next/c/4575875065de
  - [v3,net-next,4/4] net: phy: use new iterator mdiobus_for_each_phy in mdiobus_prevent_c45_scan
    https://git.kernel.org/netdev/net-next/c/d4780abb8cce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



