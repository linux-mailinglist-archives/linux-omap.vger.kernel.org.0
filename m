Return-Path: <linux-omap+bounces-3751-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F6ACB907
	for <lists+linux-omap@lfdr.de>; Mon,  2 Jun 2025 17:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDDDC1888BE0
	for <lists+linux-omap@lfdr.de>; Mon,  2 Jun 2025 15:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AB4221FB8;
	Mon,  2 Jun 2025 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGQJuCs1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DD1CBA18;
	Mon,  2 Jun 2025 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879440; cv=none; b=Qfaq3/UuJMgulouG2AvUEKcgcywLyKfmA4ZkqAgbMPwTHSQ9B0LYfCb8K2Wm+D5L3vjvkecvcdf6ZNLGuBT2Tvct6MAk7zZYZR/oqTnrfsygJuqDSRmNw8XIC5TGDNa61mRW3l/RJYr1TyOigJ8rPvacNG1DfidteImelnZjT6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879440; c=relaxed/simple;
	bh=dpNIIRfB6X+tuqJ+fGKlkwqZb7Bt5khpJO2+aEzdglw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FI+q2Om6jJrjAE4BNkJY+hQy+hqvUhpqT1/9XFzdLKqwtL401yKQsQ1zrwf+mqQtfAj0mSXXnOOoccd4KVB236Yr1uSEJcT4JrCEoHsWXTP7H59mzqezJfZYxxPSGhqMkIA/0hL1sz+sqNynkgaeb17YKsM30oKqhlSt0sGyDpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGQJuCs1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA1AC4CEEB;
	Mon,  2 Jun 2025 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748879440;
	bh=dpNIIRfB6X+tuqJ+fGKlkwqZb7Bt5khpJO2+aEzdglw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QGQJuCs16VY0EdzuFVkt4FySTiy1Bj2lJX4It/9FIWELldK6cXbRkjOr1+EMvA/2z
	 nNlzb9EKc2z7i05vME31Tm/pB2TXFY1YPFjpEITva7Us/4SaPBW1sI2o3rJH+LRfQK
	 e9gPbkXTednpzOnnmZKNXSnGzpg3+fNKFa7TyMMztJy6FQWCDfcdGjQz2XBimS3nvN
	 yXApjkN/Fu+VbMb3OsznieAeAwrlRKiFbZUKatNviKZDjxUsxvBeX3wh3GN/882exw
	 QH1Y2A2CPhKUWOS0GZs5pWtXF4BOIRrqiRIRBDAOBzuSsG1VTXekl0JMM99CorHYeg
	 6A93uOcXdIbYQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yuuki NAGAO <wf.yn386@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250531141341.81164-1-wf.yn386@gmail.com>
References: <20250531141341.81164-1-wf.yn386@gmail.com>
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix
 card init
Message-Id: <174887943805.88031.11177528647496649258.b4-ty@kernel.org>
Date: Mon, 02 Jun 2025 16:50:38 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sat, 31 May 2025 23:13:41 +0900, Yuuki NAGAO wrote:
> The removed dai_link->platform component cause a fail which
> is exposed at runtime. (ex: when a sound tool is used)
> This patch re-adds the dai_link->platform component to have
> a full card registered.
> 
> Before this patch:
> $ aplay -l
> **** List of PLAYBACK Hardware Devices ****
> card 1: HDMI [HDMI], device 0: HDMI snd-soc-dummy-dai-0 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix card init
      commit: bae071aa7bcd034054cec91666c80f812adeccd9

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


