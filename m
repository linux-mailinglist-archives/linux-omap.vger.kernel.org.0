Return-Path: <linux-omap+bounces-2457-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF29A4788
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 22:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83B51C233CA
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 20:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63888200B88;
	Fri, 18 Oct 2024 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVYrMDQz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CC3383;
	Fri, 18 Oct 2024 20:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281685; cv=none; b=XdDB5bxl2xtzetPWRJIN7hQq92Q4igboZf3QQvaLQ6aAYl9B8nsdTgoghZSPxThLbAskq1UBeJafdo8eAaW7zv7tKlr8eWxgS3ICiJzkPyhJLZyPBZ2O9JCXF6ZZZHSMSNrgAoUpHb3sCZoeo1KRu54ov5xEBvT1xiTrkCahH5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281685; c=relaxed/simple;
	bh=QWhvm43q9x9Ypgb8zjF1c/AGKh9cPO/2PMOjR56h6Ls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OVK/Nvs2XW41oiKBGB3RaXpMN4ANJWIyCslCLwPFGqOzwXEqtzqEHVsS5/aNxcSAWTyPXcx1d+sjcXfR/wT3xeLsAa9qSc42ZmE6wmRMSWD5RkOCWGpHSG6N+xET5o0iY+xZY0swCY05JZb9g/bFN2XSrcGK69ElCdjTNpa+/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVYrMDQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6810BC4CEC3;
	Fri, 18 Oct 2024 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729281684;
	bh=QWhvm43q9x9Ypgb8zjF1c/AGKh9cPO/2PMOjR56h6Ls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mVYrMDQz7GFGpXSoqROtkQhYHA7pJL2KL4K1oy6GTCQxr3oi8u8Qgw/oB8TwNs7fv
	 6QND6ZmhJalDRlJqh5Qr7GGXeCN0C4cVsiXzA8KmV9wnUepGTxZq8oxOvWshUQjYbK
	 2Qa6F3IYM10sCy2b9NDpRetUYpOYrOBT+uPsqI3OixJBtRswa3rmS6hcegj+nfgn7S
	 HS8L+4YxTirlbp+ybB4gN400lK9gLsfOXhTa2utJM01GmmWr2KplMS9blg3MU+Nh5Q
	 o/g4Rz0fBTlbEIPX4oceBsmFdpfupeAjJWWobTD3DOZwdlYyFl0yVWtrInwzBPTAzp
	 RUEdPWJh1bZjw==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@gmail.com, Liu Jing <liujing@cmss.chinamobile.com>
Cc: jarkko.nikula@bitmer.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
References: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
Subject: Re: [PATCH] Use card->dev in replace of the &pdev->dev argument in
 the dev_err function
Message-Id: <172928168210.188041.8550134088626737627.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 21:01:22 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 15 Oct 2024 15:49:38 +0800, Liu Jing wrote:
> Because card->dev = &pdev->dev is already defined in the rx51_soc_probe function,
> and then &pdev->dev is still used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Use card->dev in replace of the &pdev->dev argument in the dev_err function
      commit: 4d003b81f46737620c7f9194d305617dfdfce8fb

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


