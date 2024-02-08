Return-Path: <linux-omap+bounces-535-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798B784DF72
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 12:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8A21C29288
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 11:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6CA6F07B;
	Thu,  8 Feb 2024 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSUdiyV6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808B6D1B1;
	Thu,  8 Feb 2024 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707390630; cv=none; b=B6m+IUji5yJmEgo+tHpNRxij3LJVgOatA8pq8lMMfum3XUJe96vHGH1xgHE8TUynV4yvPReftKBmQFv7py++8laFKQmKSqo1JPlo1xTl+MlUSht3LLNSEehgRnSXCXaDba99WaLf59cp9/tYBcaOlXdjmX271JSqat0Gq/T3yAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707390630; c=relaxed/simple;
	bh=GLdEbc2UAtbAbTDq73Jc2aWiLnCE774GGgGxlB8M+Gs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U/gMEi7m5KYTspXPJvRMxsjyXHG2PRWOeCFnTDSI/C236lP5VnryHT9cls/9uhRdE7LPgaCCH3aQEls9CpYiwQupT+BwME1BMfSEb6aFah0gOqxFBjJIFC/lvsPQRmKmy6+whDtucG0ZbI80A9724B73a3vf7ucrU3Ghxj9zWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSUdiyV6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF830C43394;
	Thu,  8 Feb 2024 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707390629;
	bh=GLdEbc2UAtbAbTDq73Jc2aWiLnCE774GGgGxlB8M+Gs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MSUdiyV6rycYGLgJEHJW82We/FWtEETejSRb+OI8WXJYAxakZBONAfsIg9bOiOlHW
	 FXEnGjDAKy89mQoAhGaA1dJN5W8FcS8o3U52hbXypuZvffwKE7tphjYpkVQHv9OnJ9
	 wjxrMYe2ENkXumOT/maSEv/RVk1U7Xjxvy8cJDy8pV1RKit07su/mUZDOPcXG30cEL
	 iFHczGtE5JYmLA8jiFwcj3fNp14Bglj6x9CrzvoCG17Ih1tQamWqhjCLIzb/0R9kJv
	 FcvNRAuMKgtUFSyuSp6j/OXb+rtNIztEFFSHbUqurYoaWJVjkAu+etO0VjYrMrURq/
	 7He0JHoPHQ0fg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA9F9E2F2F0;
	Thu,  8 Feb 2024 11:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V3 0/2] CPSW: enable mac_managed_pm to fix mdio
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170739062969.21022.14406524530432111122.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 11:10:29 +0000
References: <20240206005928.15703-1-sinthu.raja@ti.com>
In-Reply-To: <20240206005928.15703-1-sinthu.raja@ti.com>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc: dkirjanov@suse.de, s-vadapalli@ti.com, r-gunasekaran@ti.com,
 rogerq@kernel.org, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 sinthu.raja@ti.com

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  6 Feb 2024 06:29:26 +0530 you wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Hi All,
> This patch fix the resume/suspend issue on CPSW interface.
> 
> Reference from the foloowing patchwork:
> https://lore.kernel.org/netdev/20221014144729.1159257-2-shenwei.wang@nxp.com/T/
> 
> [...]

Here is the summary with links:
  - [V3,1/2] net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
    https://git.kernel.org/netdev/net/c/9def04e759ca
  - [V3,2/2] net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio
    https://git.kernel.org/netdev/net/c/bc4ce46b1e3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



