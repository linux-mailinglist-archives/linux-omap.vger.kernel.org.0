Return-Path: <linux-omap+bounces-3723-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B9AB7BBD
	for <lists+linux-omap@lfdr.de>; Thu, 15 May 2025 04:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4002D8C3CDC
	for <lists+linux-omap@lfdr.de>; Thu, 15 May 2025 02:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E79228E580;
	Thu, 15 May 2025 02:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sm3FWyXI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52B286D5A;
	Thu, 15 May 2025 02:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747277400; cv=none; b=V1D7DCoL/reSKEY3Nazm3VURhZ7q+LfRDu6XpjWSm0USUCpXEJTqpZlkY+EVJDvk1P6IdTcR2e6fU1XJF5M9oegJG9hMYBY8wayIXU5t8h17RhZ89VdT1Szmmou5OZ0GKAn5E9p17QiPEMUHNJi/mU/kcGHlEHyJKjCxneS5FmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747277400; c=relaxed/simple;
	bh=C3MVzZ0jJOmH+trVeZZpz6flDf2bB3KzR/hbvOSRzH8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mZ3JCOZJzyZhQczkO1tTrwljBXvgiU++4GER2w7vBVQifn8PtNBU/SM0WvgqBXuBtGkLV8xPoR2VlW2Y98QQCSpttiPtoQH+J+fojRJFt6bTZfLiSC06TvFmaPut5y/lN8PCPZi3VlF7mWVszp+6fmed/yCLZgSfCa15FxE6HIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sm3FWyXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE49C4CEE3;
	Thu, 15 May 2025 02:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747277399;
	bh=C3MVzZ0jJOmH+trVeZZpz6flDf2bB3KzR/hbvOSRzH8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sm3FWyXI2URv1hDb2WPxnVccl1IK8m+ScDuSOfAVMrPsQGgKUAJ7LDGSmrwdQM5Rl
	 wJxpqp0S6cPdWnUJWiszOhdANvOdlMkaki5ZZLRwZ7jcPd1+tZurh+P/9MalRBi2yT
	 r3Yoguj2F0NmYdXjP++QrO8WNrTNXyJjEIfSeLkLjB3d4J83DRd7p4KeUxh2HENrLn
	 oM95Njg31aphyCYtOKGehTakw3if0+g26notOW587cUlNCMML+EG4bQuPqwKufwBkx
	 iJX9tP/PWxZ/x3heM7CCnSm6pW6puZWnALrtxdZUjCPVE5Y6H8sT/ywClbGGZUEVis
	 BAwIAWA4RqD4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF15380AA66;
	Thu, 15 May 2025 02:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 1/2] net: cpsw: convert to ndo_hwtstamp_get() and
 ndo_hwtstamp_set()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174727743626.2588817.4499781279428820169.git-patchwork-notify@kernel.org>
Date: Thu, 15 May 2025 02:50:36 +0000
References: <20250512114422.4176010-1-vladimir.oltean@nxp.com>
In-Reply-To: <20250512114422.4176010-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, kory.maincent@bootlin.com, andrew@lunn.ch,
 s-vadapalli@ti.com, rogerq@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linux@armlinux.org.uk, vadim.fedorenko@linux.dev,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 May 2025 14:44:21 +0300 you wrote:
> New timestamping API was introduced in commit 66f7223039c0 ("net: add
> NDOs for configuring hardware timestamping") from kernel v6.6. It is
> time to convert the two cpsw drivers to the new API, so that the
> ndo_eth_ioctl() path can be removed completely.
> 
> The cpsw_hwtstamp_get() and cpsw_hwtstamp_set() methods (and their shim
> definitions, for the case where CONFIG_TI_CPTS is not enabled) must have
> their prototypes adjusted.
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/2] net: cpsw: convert to ndo_hwtstamp_get() and ndo_hwtstamp_set()
    https://git.kernel.org/netdev/net-next/c/36d9b5425809
  - [v2,net-next,2/2] net: cpsw: isolate cpsw_ndo_ioctl() to just the old driver
    https://git.kernel.org/netdev/net-next/c/4cde0e4224ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



