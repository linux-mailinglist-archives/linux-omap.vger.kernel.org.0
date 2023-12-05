Return-Path: <linux-omap+bounces-119-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFD8044E7
	for <lists+linux-omap@lfdr.de>; Tue,  5 Dec 2023 03:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC347B20B77
	for <lists+linux-omap@lfdr.de>; Tue,  5 Dec 2023 02:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00CB6AD7;
	Tue,  5 Dec 2023 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFBb47Jn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE5F9441;
	Tue,  5 Dec 2023 02:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDBFDC433CA;
	Tue,  5 Dec 2023 02:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701743430;
	bh=qBYsl6aQ0xQMITE2+m9eIkoeSdh8tA2Vgeem4Qdn+R4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mFBb47JnuNElMtudHzZw9C7J9KrVDHLBiGbrtwPgPWrbvgrA6AwevhgHyV0+oIfqc
	 vIaFizmHIyVEqZIhJ+bV0+gha1BpomkegBMj3U2ICms/ctxwauqfqkbRHz26/QKbuy
	 UunXlDrW2KQmRglEZ6KslXWF5LBIZQjcWbv3xyZqJh4lcVIT33tzWSeEehrAKLKIfy
	 2g2IEUEZKe0wmMZjrxBViObpE7u+80QHWIN+2H1C2l5iSdRrkwz7sjlUHaZKowEzKr
	 Jb8YIKXL7W0TQ3FMwPH54+dBmVYoiRTTxiLPpR+r3+kc3I1Ov+sMVoMgpPfqDXZThT
	 8O4bTh3eIUvew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D035FDD4EEF;
	Tue,  5 Dec 2023 02:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: ethernet: ti: davinci_mdio: Update K3 SoCs
 list for errata i2329
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170174342984.25370.2136959719621862059.git-patchwork-notify@kernel.org>
Date: Tue, 05 Dec 2023 02:30:29 +0000
References: <20231201132033.29576-1-r-gunasekaran@ti.com>
In-Reply-To: <20231201132033.29576-1-r-gunasekaran@ti.com>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: s-vadapalli@ti.com, rogerq@kernel.org, nm@ti.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch,
 f.fainelli@gmail.com, horms@kernel.org, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 1 Dec 2023 18:50:33 +0530 you wrote:
> The errata i2329 affects all the currently available silicon revisions of
> AM62x, AM64x, AM65x, J7200, J721E and J721S2. So remove the revision
> string from the SoC list.
> 
> The silicon revisions affected by the errata i2329 can be found under
> the MDIO module in the "Advisories by Modules" section of each
> SoC errata document listed below
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ethernet: ti: davinci_mdio: Update K3 SoCs list for errata i2329
    https://git.kernel.org/netdev/net-next/c/be5fc78a0084

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



