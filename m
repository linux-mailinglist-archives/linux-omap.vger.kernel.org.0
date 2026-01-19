Return-Path: <linux-omap+bounces-5561-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDDCD3ABE8
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 15:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86B130C072B
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3FA38170A;
	Mon, 19 Jan 2026 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DF99WfJj"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC53815E5;
	Mon, 19 Jan 2026 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832577; cv=none; b=OaBTCJZZ9reM5jAM/yBzDQ6PufPhZsR++IWJ5qsUi7eidS+/IRYz2unBxm+mJbCZr94LxeYgwe2sy1MsMTrScdA5lU2wyZC2Np+59Q5ldnLNPa2zoo1AvCExefAqWrO3fHbls+1heAO5uId84KTMxKghPsGQT6cTbD0Hr2cLTPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832577; c=relaxed/simple;
	bh=MyIAeS1uUeVDWCzjzrQV+J8OKiXUEyIqbdIfDImm2fE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bgvmYkQmUcafP5+HWCWX10j8p8AHCmoSEhYHYN9DlES7nQFc5z8fB68ofIEH1RXGEWftcerprfO7M61rWx0n94QTtpGnjqZY0hNpYrK1JWg41kfgKGqCKu281r4RzjtSGSA+dzJzWHFRHfG3LxZyMCV+C8Z7e5cqmza6EcHWxcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DF99WfJj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB06C19423;
	Mon, 19 Jan 2026 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832577;
	bh=MyIAeS1uUeVDWCzjzrQV+J8OKiXUEyIqbdIfDImm2fE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DF99WfJj41PZ08oCZq8i0jeVELg/RsaO4TZPGbe5D8iPUvsn9ebpL0nJEd2z6YQg8
	 rFSAy+/U+VoLCs+i/FDxM2tLpez0kbU5xPHOa+OyyL4uiO1VFzDQxLDx3Pk9pY9zba
	 9SzS2ic90AB90wFYlue3e4Z/GfZ3sZjajRRPRof7T/pkuGaykgzneNf6c+1hoOh7qT
	 iHUFcZJZ0xnvBhgf/iVa1uQAkqVGMRCi3zaW4hEMH26g/PmrxuNK9TwlDbIBsCI2ry
	 U8i+Z78Yg91tvp3uGBAfXMiYjwREIbMYIfYCvkVlR9PQemLzEKdjdur/52UQxzzfxS
	 qkGNXSDvoYlxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78A383A55FAF;
	Mon, 19 Jan 2026 14:19:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw_ale: Remove obsolete
 macros
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176883236709.1426077.4771810536434158261.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:19:27 +0000
References: <20260114144425.3973272-1-stefan.wiehler@nokia.com>
In-Reply-To: <20260114144425.3973272-1-stefan.wiehler@nokia.com>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, s-vadapalli@ti.com, rogerq@kernel.org,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Jan 2026 15:44:25 +0100 you wrote:
> - ALE_VERSION_MAJOR/MINOR are no longer used following the transition to
>   regmaps in commit bbfc7e2b9ebe ("net: ethernet: ti: cpsw_ale: use
>   regfields for ALE registers")
> - ALE_VERSION_IR3 is unused since entry mask bits are no longer
>   hardcoded with commit b5d31f294027 ("net: ethernet: ti: ale: optimize
>   ale entry mask bits configuartion")
> - ALE_VERSION_IR4 has never been used since its introduction in commit
>   ca47130a744b ("net: netcp: ale: update to support unknown vlan
>   controls for NU switch")
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: ti: cpsw_ale: Remove obsolete macros
    https://git.kernel.org/netdev/net-next/c/799759e610d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



