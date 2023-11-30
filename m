Return-Path: <linux-omap+bounces-75-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89C7FEEAC
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 13:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 468C2282198
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 12:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5745345C1F;
	Thu, 30 Nov 2023 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRc7X2mi"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E84503D;
	Thu, 30 Nov 2023 12:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B7A9C433CB;
	Thu, 30 Nov 2023 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701346225;
	bh=1kZu0OaOgqszldbJN4LuIZlOfCuN/8er0T8tdUIft9M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iRc7X2mip91qIPYJpATu+KCLgx2idnGbSeLxs7Q8dfBQk1wv/36ueSem0x7dVos8M
	 sFEFONBPFIKJw9KTh+4jALCFfPIHK+onui0VxDrdjjyXN2OEXUix2xDIPpgUOA9jhg
	 LKrNQd5zgmiFiHCrMW2Fg9+ZHcxGjawKAi/tT52rKZ4f/4CVttoKhjWfEtduTSAFU3
	 jzBcgC5r/XRL1hVxe04BB6OkRy4a5Yv5kdmKS/NgEOe6cuQ6AIUDh++TQXcrxKCyTE
	 cclNlZxILV7iLbd1mDVlNFbuokdv9N8xvvwRVC9xHra/CxHbbacmo/RlFa9J43BG3Y
	 U4Y17ty/qheOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 514A6E00090;
	Thu, 30 Nov 2023 12:10:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] net: ethernet: Convert to platform remove
 callback returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170134622532.26213.12094812518949511980.git-patchwork-notify@kernel.org>
Date: Thu, 30 Nov 2023 12:10:25 +0000
References: <20231128173823.867512-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231128173823.867512-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rogerq@kernel.org, s-vadapalli@ti.com,
 dan.carpenter@linaro.org, netdev@vger.kernel.org, kernel@pengutronix.de,
 r-gunasekaran@ti.com, jesse.brandeburg@intel.com, robh@kernel.org,
 linyunsheng@huawei.com, alardam@gmail.com, linux-omap@vger.kernel.org,
 memxor@gmail.com, sdf@google.com, horms@kernel.org,
 quic_jjohnson@quicinc.com, wei.fang@nxp.com, nnac123@linux.ibm.com,
 ansuelsmth@gmail.com

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 28 Nov 2023 18:38:24 +0100 you wrote:
> Hello,
> 
> in (implicit) v1 of this series
> (https://lore.kernel.org/netdev/20231117091655.872426-1-u.kleine-koenig@pengutronix.de)
> I tried to address the resource leaks in the three cpsw drivers. However
> this is hard to get right without being able to test the changes. So
> here comes a series that just converts all drivers below
> drivers/net/ethernet to use .remove_new() and adds a comment about the
> potential leaks for someone else to fix the problem.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: ethernet: ti: am65-cpsw: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/7234dc5ccba6
  - [net-next,v2,2/4] net: ethernet: ti: cpsw: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/7ac3f867a358
  - [net-next,v2,3/4] net: ethernet: ti: cpsw-new: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a76772e2fd83
  - [net-next,v2,4/4] net: ethernet: ezchip: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/7ec1bb2ce64b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



