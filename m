Return-Path: <linux-omap+bounces-3087-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D2A0A063
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jan 2025 03:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D23C16B7BC
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jan 2025 02:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4207814EC60;
	Sat, 11 Jan 2025 02:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfGENNhN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781C14BF8F;
	Sat, 11 Jan 2025 02:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736563213; cv=none; b=JKnqdjnAQKN8RULHi06SdtBlOaIdq4F3JgvFa+yJq7hvCUUZJrSmbHMVecmeGucDqcTKLiKgcKqh0eGm2bcTVfuOvw+K5wdMBk3RW7FpGDz23y/Wtd5aJORVZJ9KQrSFsH1aQRPDlDWDmtoEo4v0Ba1a1TXg7emufQi1yI4VipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736563213; c=relaxed/simple;
	bh=3CTgIQ8+pZSAOg9ObEnaMyUM9WMZvAEJ6NZBOpJ75ig=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lZYYsjTRVKYOTjFboy4MhcXoAOKcumixJ9MltKr0+yKSgiGjse79OpEox84NGv4QstvFr53FJYgQNl4DCbfCgHeRJwz2pYz64H9TCou9WePxLiBA+t5U1+ydug5X/d7jMs++JBUs3S6lHBHNRcG98RkTC74FCE7+x22i9vRhrsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfGENNhN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBEFC4CED6;
	Sat, 11 Jan 2025 02:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736563213;
	bh=3CTgIQ8+pZSAOg9ObEnaMyUM9WMZvAEJ6NZBOpJ75ig=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UfGENNhNSwUQ05aMFXYMjT7DciykcXPCJcCm3CObqOtPE76UDExwaz3ZL98EdxYFj
	 vG5XVi2TbSDR2uWPchne92wzkeL3IIYbaqSEZ6valX/d97wlJQIxWbp/48Zy/Bjv0E
	 AlWaPpWu8WPHEuK9x/g92MHkQNRVf3W5kut1HclPnLLqjT4ZOsVYeTOYu8cweb6goD
	 Vn9Xft6SJ5iOhWxX+fi5MkDqjBYfl0+AXTx4V/Y07yHnhJQR+s6r9wxCAxj6DiL4Ak
	 NCHS7SeyF6/MbhxdIFXPtgkkK6uHeWXsxuBUJVhpQrOmEC5MqschG8vUsoxtP7M5/r
	 +jlQvXVZmjVJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CCE380AA57;
	Sat, 11 Jan 2025 02:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw: fix the comment regarding
 VLAN-aware ALE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173656323523.2272951.3034238935680058562.git-patchwork-notify@kernel.org>
Date: Sat, 11 Jan 2025 02:40:35 +0000
References: <20250109214219.123767-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20250109214219.123767-1-alexander.sverdlin@siemens.com>
To: A. Sverdlin <alexander.sverdlin@siemens.com>
Cc: ilias.apalodimas@linaro.org, grygorii.strashko@ti.com,
 mugunthanvnm@ti.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 s-vadapalli@ti.com, rogerq@kernel.org, c-vankar@ti.com, sinthu.raja@ti.com,
 linux-omap@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  9 Jan 2025 22:42:13 +0100 you wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> In all 3 cases (cpsw, cpsw-new, am65-cpsw) ALE is being configured in
> VLAN-aware mode, while the comment states the opposite. Seems to be a typo
> copy-pasted from one driver to another. Fix the commend which has been
> puzzling some people (including me) for at least a decade.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: ti: cpsw: fix the comment regarding VLAN-aware ALE
    https://git.kernel.org/netdev/net-next/c/460b52835e60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



