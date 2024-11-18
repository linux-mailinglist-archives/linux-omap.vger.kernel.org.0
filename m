Return-Path: <linux-omap+bounces-2704-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0ED9D1060
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2024 13:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B212B236E3
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2024 12:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82EC190470;
	Mon, 18 Nov 2024 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYmCgRO1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D01990AE;
	Mon, 18 Nov 2024 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731931818; cv=none; b=YmXEKmrWOiIoThy8fkA4IfAkOK12bHuWVqr0mqWAWB8vgzaV1g9dArk9vtDw0lsde1fD/ZiWz6ZDfWK90RotpQ6zZwue0eupbbjRcx6O5t3KkOVrGkjD6lKrIzh48jhuUyDMichPNDtjUUG3y2f8DvKaEnpv2tCYM6xMvrJBTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731931818; c=relaxed/simple;
	bh=5GfeaRVAdwvLeKPNY2OBH0LLEXtP14oWureYeMtD9JI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OjPfU5Cda+wkxXAaapeAVUSbq2diJHbW4biDVGUP22x/ZT0EtJKmdiO+5eM5czt58mMQ0otr4bQLpOgQ0sS2HDkyba4puK7JThyBsojKWkBREZdg3d/tVD+dC4HVCsBW3AUa0B+axSWTBqRj97CFQphQ0hQ1zEUEiJH3scPcDFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYmCgRO1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88E3C4CECC;
	Mon, 18 Nov 2024 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731931817;
	bh=5GfeaRVAdwvLeKPNY2OBH0LLEXtP14oWureYeMtD9JI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SYmCgRO1ipdBeuJ2IpBO8Knk9he4zHVHUgADARYQnI6rhYKxGRu3RqEjVVIZ8n2vD
	 9giIr8zFp2poeNKwK9JaHc2lFfs/M2Ne2Y87LoXYoVhmPk536MtGWI4bWjxFLyDkW1
	 ziM1wszm8l6Aqh5EArkST12vxi8e+d2HXjC8OQeKGKPuRRzt6/Crvw75zewRJW022h
	 uYJU2cZYKepOCFt0F/hs9oC7ka3NiqzsVuigKmTN/03tQURDEHDoHaeeZFJCipeMeR
	 pn5pIqulJA4AOVypbB3KT3nFAZ0MeGqjaV1HMmgOBLroDmnMheU7GSYKn711rclZn+
	 dEh8ZZoCTd0Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342B63809A80;
	Mon, 18 Nov 2024 12:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173193182904.4015276.18003215536090772300.git-patchwork-notify@kernel.org>
Date: Mon, 18 Nov 2024 12:10:29 +0000
References: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
In-Reply-To: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: s-vadapalli@ti.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 gnault@redhat.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, p-varis@ti.com

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 14 Nov 2024 15:36:51 +0200 you wrote:
> Configure default DSCP to User Priority mapping registers as per:
>  https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
> and
>  https://datatracker.ietf.org/doc/html/rfc8622#section-11
> 
> Also update Priority to Thread maping to be compliant with
> IEEE802.1Q-2014. Priority Code Point (PCP) 2 is higher priority than
> PCP 0 (Best Effort). PCP 1 (Background) is lower priority than
> PCP 0 (Best Effort).
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] net: ethernet: ti: am65-cpsw: update pri_thread_map as per IEEE802.1Q-2014
    https://git.kernel.org/netdev/net-next/c/01a45daebb2e
  - [net-next,v4,2/2] net: ethernet: ti: am65-cpsw: enable DSCP to priority map for RX
    https://git.kernel.org/netdev/net-next/c/a208f417582f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



