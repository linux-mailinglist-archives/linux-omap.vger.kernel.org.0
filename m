Return-Path: <linux-omap+bounces-2411-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E999CA25
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 14:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96C871F23633
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 12:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAA01A4E9F;
	Mon, 14 Oct 2024 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cc8oNisw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4101A4AB3;
	Mon, 14 Oct 2024 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728909024; cv=none; b=cVzPqbZ0rRLcttWxozpxvPALmDaFptaEjcPqgYmSOssB47NAOhUe48cFYMGEF+c5ZIRs7Bcztfx20JVgDB1bnQOFGjxgM3ev7Rekth4XL4IrDeUpGGyDWjwSKcQSfmtXtDqK3h/uaYoaqWzFSc6ofNJ99wsO5H6gL9ioNfTsaiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728909024; c=relaxed/simple;
	bh=XVK9EjCdeEAv4B/wdJyWPtMZjV/x5MQsY7gUvvin5dU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OEfjGcPXhf1hlLofS+tA/gjifnXuJL7CK2Ii8Vu6bu2c5FpaaViFcJ8IuYkblzU1/wXyDfFh7sdQTk4DrD+FQRQjmbBo5a/BisEe5VwAm8WYCUd+xnyp9RmKxb01adV56r9trK/VISBjSdl7WhDYeWPorwpPcs97hyaKVmz4qzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cc8oNisw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E56C4CEC3;
	Mon, 14 Oct 2024 12:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728909024;
	bh=XVK9EjCdeEAv4B/wdJyWPtMZjV/x5MQsY7gUvvin5dU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cc8oNisw3v0g4p9hXkd/PebHJc8em1Ay7gUAztHCIcaSLKYcZGeuxAa85xc8Lesh2
	 YZAu+IiiwkmJha+280HQYX1OjvSeTxCYtJnxqsLD3BwYiNQ7JHQVUb3va3xHvwsPYk
	 6Kr+k8zsYuRh6baZVOFmSs65IiuaFt/E3JX6KRH6YggGultzGAJtKpycu1pZuF8arZ
	 +TxvbfVZ3PJopZ2mLbPoEcGYYUdAux8ETpus6v6ZkGVuPJ0zagBWPVbmV2uiW3ifbz
	 G+k3Ia3/9pW/RmP7kKKxuvGiyHmaONsP8A5D7eAmxwXtkxXWlO7yIAVkVJU86d7voX
	 flCAHVNoh6ZGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 715D43822E4C;
	Mon, 14 Oct 2024 12:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: ethernet: ti: Address some warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172890902927.497553.15127625651293052823.git-patchwork-notify@kernel.org>
Date: Mon, 14 Oct 2024 12:30:29 +0000
References: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
In-Reply-To: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, s-vadapalli@ti.com, rogerq@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 kalesh-anakkur.purayil@broadcom.com, netdev@vger.kernel.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 10 Oct 2024 12:04:09 +0100 you wrote:
> Hi,
> 
> This patchset addresses some warnings flagged by Sparse, and clang-18 in
> TI Ethernet drivers.
> 
> Although these changes do not alter the functionality of the code, by
> addressing them real problems introduced in future which are flagged by
> tooling will stand out more readily.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: ethernet: ti: am65-cpsw: Use __be64 type for id_temp
    https://git.kernel.org/netdev/net-next/c/5c16e118b796
  - [net-next,v2,2/3] net: ethernet: ti: am65-cpsw: Use tstats instead of open coded version
    https://git.kernel.org/netdev/net-next/c/4a7b2ba94a59
  - [net-next,v2,3/3] net: ethernet: ti: cpsw_ale: Remove unused accessor functions
    https://git.kernel.org/netdev/net-next/c/2c9eacbb56de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



