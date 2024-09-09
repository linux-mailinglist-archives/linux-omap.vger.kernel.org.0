Return-Path: <linux-omap+bounces-2160-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1C972419
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 23:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A47BB2258F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 21:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACCC18C02D;
	Mon,  9 Sep 2024 21:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U83w8q4v"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630FE189F3E;
	Mon,  9 Sep 2024 21:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725915712; cv=none; b=Yl/qCcrSEHNlv2obRcXOUwZ+WnMZOUPshzBbiMtGeXGx1gtg7IqVIzGVaRse1ZMz79EW+OfzNOPy3tV6QO5BGbPS7Wi2rpDT3bDxzd2ohnwTgUg4fHWKg98kMs/BcFhNRsE4LjVDs7Pb6r8lLyxOmgCkQh8LC4+BHUUxvXpK288=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725915712; c=relaxed/simple;
	bh=fk1O36vP6EYATpW7zFnE0wBAJf09Xs8FlL14jwq2K04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s8v4TYUuS23W+4wR/aG+231F4/z8cLpBUBxEFWE+AU1mJx43pFP+NK0USRGtYF3qEUC0+I+RfeGZWjK3YUUHSlboWUzy+Ebw2+FxZMwYABt0YFBoVjwx+0fEFXwQA8aanlgQiCUIO5XGY4UUPl4iHRHYZOVS5KCAltHtAaCiYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U83w8q4v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DBDC4CEC5;
	Mon,  9 Sep 2024 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915712;
	bh=fk1O36vP6EYATpW7zFnE0wBAJf09Xs8FlL14jwq2K04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U83w8q4vmWuUNWWa8wp6WXXICFHNrWHnRAOLoFaJwf+YGIhqaA4++V14XBYpETLmz
	 Rrd3E+kOLKplgGDfpABUQym08RyIiH3l4jAbmyk5bBAK0s0gOBxgw2KpqYkk67k29Q
	 bB2annXHCrM4S5XPhPdfW+/6Ff0w15aInu8EqGFqDTaWc6XH5oDKdHJJFazQNbDIc4
	 p3AukalcGRDrdrFRfFF1YtRIBR9v1CMyNI+juVxM1lxCtHvdKIJ/p3GvzmaDqMOg0z
	 e01KB1mHz9lEzQnWY0Dh6JJLHfYFid95AQrKjY5TyB7IUFJ0wwiByyCgketuPB89UX
	 ftt0aAFvxLWog==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, sound-open-firmware@alsa-project.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
References: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: Switch back to struct platform_driver::remove()
Message-Id: <172591570834.136248.17412626468486255591.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:01:48 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 09 Sep 2024 17:12:30 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all drivers below sound/soc to use .remove(), with the eventual
> goal to drop struct platform_driver::remove_new(). As .remove() and
> .remove_new() have the same prototypes, conversion is done by just
> changing the structure member name in the driver initializer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Switch back to struct platform_driver::remove()
      commit: 130af75b5c05eef4ecd8593371f3e924bcd41241

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


