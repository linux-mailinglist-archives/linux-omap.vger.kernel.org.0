Return-Path: <linux-omap+bounces-4268-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38862B2CC71
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 20:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D201BC33A3
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 18:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51A4322C82;
	Tue, 19 Aug 2025 18:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZD+TihB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728AF31E119;
	Tue, 19 Aug 2025 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629538; cv=none; b=pAiEf4Fzuq8RchM+Jo+mt6BHQLNp48ck7PuGy0AvUqC2ejUkCcISu+gQL3SpcQ5/p/Uc3I9ip2RsPQ4WJ94+l9kfmULP837SqzA7S3Ju4bQBVHLnRSgkIWyJBK1b03DocF1qc+wmjfeUWSxP3Z+YFjUDt37VcECNzfd44BB1xiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629538; c=relaxed/simple;
	bh=Wkkw568iXoDJ0kw7A3ebaYw+w6YTHaGKsVwIET6hZh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=npxyD3dU499kyCPnE2lQL67mKUU/RxpV8R9xBKxEFiQ89/BvkzNkyp65CCvXEZ/UWIMk49MBdT5oaYZH6dH7TlALkUhLoEOcoLZL8WrfaR+OPFrgYZfh/aSN/rwuuSOCBrT8GH2DmqtpNZ1oiZaNASkdZ9678q5ZgEx2kacOMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZD+TihB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A20C4CEF4;
	Tue, 19 Aug 2025 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755629537;
	bh=Wkkw568iXoDJ0kw7A3ebaYw+w6YTHaGKsVwIET6hZh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MZD+TihBFKBHZojf+8U75eK+gvYUBDbcrGGGh4FJ5Y+CLSCBS7IG+Lrf40p0UeCeu
	 e5Pi+wAy5Cg5uN0wbc4PDzJHg2a9urWwjFKFSJwOm2pOZNQi5yELEvtUQ3NcSt3n8+
	 GDh3fR8nGRptmcOU3CfIaWp0mpA6hI0Ggv14wKw+p67bcPdomUPFXaOyKIY4GyXiD6
	 mYxVL0M/amD+dGy6lmA+o199wdf8h7uZzbjxqtPcG9+C8SM/xw49pJL/3eua01n5le
	 loPommBtJ+r7acsAx3oF8ST75wq+cuC9bnWS4Mv4yR10yIWml27OVqF3T9ChG75yYz
	 Oyg2vubv6Tn5Q==
From: Mark Brown <broonie@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aKRGmVdbvT1HBvm8@stanley.mountain>
References: <aKRGmVdbvT1HBvm8@stanley.mountain>
Subject: Re: [PATCH] regulator: tps65219: regulator: tps65219: Fix error
 codes in probe()
Message-Id: <175562953472.246782.13325233916103955955.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 19:52:14 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 19 Aug 2025 12:40:41 +0300, Dan Carpenter wrote:
> There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
> instead of "error".  The "rdev" pointer is valid at this point.
> 
> Also there is no need to print the error code in the error message
> because dev_err_probe() already prints that.  So clean up the error
> message a bit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: tps65219: regulator: tps65219: Fix error codes in probe()
      commit: 11cd7a5c21db020b8001aedcae27bd3fa9e1e901

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


