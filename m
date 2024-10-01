Return-Path: <linux-omap+bounces-2284-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C47598B877
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 11:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2233A1F22806
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 09:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8BC19DFB3;
	Tue,  1 Oct 2024 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2Gqp68j"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD42B9B0;
	Tue,  1 Oct 2024 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727775632; cv=none; b=orKKwjuSocZL0dLamPEzA1ryIbgARzUmaNxrqQl5ZEqTA44G/qo0SCOowHfG0kMjAeNDpx+R6i+0giJ0fAG9exrhIRYRWNBesRDS99NeEYkVHPkk5GHtRBmgjPupOWULuzPmAemRKdHuD4ko0jFQYbIwrCduiHYenlgyT2eam4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727775632; c=relaxed/simple;
	bh=jgyMA4s/s5JHMr1g7kf7/WqSZNouVSAcRlz2tRjSSnw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=P/qpaW3vNsiiMYdBch/VclG+3kiw6S5vhleL9DYgnKT3R7bs3OAL9ffj2/qRzdPDICuC//tsXUsmq/EjXyBnfde7/9XpLbi3aiq+rM10VjUX1CJ6Z9FKZ8GdlaSA81+SYnan8KTubRO3HGwyLE73TyvrA18SeHeZ/A2HpCT8fvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2Gqp68j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ED5C4CECD;
	Tue,  1 Oct 2024 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727775630;
	bh=jgyMA4s/s5JHMr1g7kf7/WqSZNouVSAcRlz2tRjSSnw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u2Gqp68jH3qmKEWrrC4yGAnigNDUsfOyw14TtXqsvlZw0fVTcNvHIlAgQxzzSCOX9
	 n2/3iqykRduymq6+wa2izgxMGJUF5ibWE8OMjfAr5siPWkag4hy2cffmLQ7co6Pvd5
	 97XynNi4gO7R0GjquxlCF8rN3Ods5rejIoHSOWbURF9sPaRbv2UyFEnmUZn5qBETUA
	 qPrXB58IjghB3DoyvubvfdS/YakyhCkfG3T5Ssz9y6bys6Z0elX3uW8+v55hH3/sVP
	 mP2h+vkZ9frd//JFwuo40zJY8f0qo6xkQoQXRl6DUihg2B1Nle4rlt5Ln/dFlM18Iu
	 LJoB8eEgruowg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDC4380DBF7;
	Tue,  1 Oct 2024 09:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: ti: cpsw_ale: Fix warning on some
 platforms
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172777563334.284947.8766460738707150807.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 09:40:33 +0000
References: <20240924-am65-cpsw-multi-rx-fix-v1-1-0ca3fa9a1398@kernel.org>
In-Reply-To: <20240924-am65-cpsw-multi-rx-fix-v1-1-0ca3fa9a1398@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: s-vadapalli@ti.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, geert@linux-m68k.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 24 Sep 2024 15:28:48 +0300 you wrote:
> The number of register fields cannot be assumed to be ALE_FIELDS_MAX
> as some platforms can have lesser fields.
> 
> Solve this by embedding the actual number of fields available
> in platform data and use that instead of ALE_FIELDS_MAX.
> 
> Gets rid of the below warning on BeagleBone Black
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: ti: cpsw_ale: Fix warning on some platforms
    https://git.kernel.org/netdev/net/c/e9d591b16c0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



