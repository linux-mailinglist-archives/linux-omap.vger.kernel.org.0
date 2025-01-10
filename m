Return-Path: <linux-omap+bounces-3067-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE5A0852B
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 03:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 846243A802E
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 02:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4CC1A4F1F;
	Fri, 10 Jan 2025 02:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsUyi2hC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FF18027;
	Fri, 10 Jan 2025 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736475011; cv=none; b=kkXRJYIHtVLB4LDUjABAWCVsA+cKvA95jGkowoUJqksD4Q2Qxd2cSdiP5skgTqnqhzaWEMKVDxgLFBmUyW1QtNNvZBS9R15suqomhNyG3i89OK8NQkP4wU1izqgOy3OPHn4EHkWGD7Df/5Kr9/DpSgVCVOmesoTJT5fpOU8AnOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736475011; c=relaxed/simple;
	bh=FfxQ7rULUpCts0paHtG64aKcRHbsBBRN9hhIv7SNWkk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=spECQ2ZaSjvxS21Tlyv15qr669CLwkePzFSLDuT/Yt74TPCp3tHYFPGIOMfCxXITA5YTjdWeRVW/5QcmRe20bVSkzLPU0zx28MTl7e5sZ7Dke4AlERxc1NWnm5AkqVMO73WFr2Wx+E+orPKJf2OCh9VOXxIXaU5IuvEWtrkk36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsUyi2hC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6599BC4CED2;
	Fri, 10 Jan 2025 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736475010;
	bh=FfxQ7rULUpCts0paHtG64aKcRHbsBBRN9hhIv7SNWkk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YsUyi2hC/0C2jsPedgbgG96ApmJ1JhSLs/zfjQuwipjqNSt8sHrc4NdiUshezCVip
	 7KIJBz1juOTiIk+Yg/S16NAsse1NU0z/Ieh34vR7voZC7SsdfP08Eq8wtMWT4FX+3F
	 RX7sV4XNspObWvVnyZ0u6KzJsZQutOWjscuVzRdyHNKtjNjfzGGs9eirzxurjhjwp5
	 Dh3Efh9vcbQykI9PpaBKS/Y1plmNIOAB8xPfUQJU0FLLZ4FUvxprSIcEYosu5RNcP3
	 dUZJKB0SwbTIYz38hT8OjdVbXYYysdp/dlghGOn9o9Atv4iVGOaQTloUHOopjSvbNU
	 7c9ZeHSzrT+4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D14380A97F;
	Fri, 10 Jan 2025 02:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net] net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173647503227.1577336.13458023393736372807.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jan 2025 02:10:32 +0000
References: <20250108172433.311694-1-s-doredla@ti.com>
In-Reply-To: <20250108172433.311694-1-s-doredla@ti.com>
To: Sudheer Kumar Doredla <s-doredla@ti.com>
Cc: s-vadapalli@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, gnault@redhat.com, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, t-patil@ti.com,
 j-keerthy@ti.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 8 Jan 2025 22:54:33 +0530 you wrote:
> CPSW ALE has 75-bit ALE entries stored across three 32-bit words.
> The cpsw_ale_get_field() and cpsw_ale_set_field() functions support
> ALE field entries spanning up to two words at the most.
> 
> The cpsw_ale_get_field() and cpsw_ale_set_field() functions work as
> expected when ALE field spanned across word1 and word2, but fails when
> ALE field spanned across word2 and word3.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
    https://git.kernel.org/netdev/net/c/03d120f27d05

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



