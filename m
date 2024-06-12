Return-Path: <linux-omap+bounces-1524-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 590689059D7
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2024 19:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F368B1F237F4
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2024 17:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103FB1822CA;
	Wed, 12 Jun 2024 17:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idsETjRo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F413209;
	Wed, 12 Jun 2024 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213142; cv=none; b=rQoSMCbXPFL7J3rp59mlM7Iv4UOZGOfBh53N1PWEorRwYcNIqZIex6my7FLz54UgeQwbDIiPSgjUybsqCIZIdbh8qTO9ENgHrdrpUQzEAoRbba0dgW8OYwJEQnBsRmCwJ9KaHBb8VX9KPlM82LGFKApo+7/i/XvZIit9E7ww79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213142; c=relaxed/simple;
	bh=OK6qbZ0vnNzVV/sfoCYgFy2+diPsXnMq6GJhiiEBkqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fKD9x3QuHrjZqjZmnEku14enRo2k1ZyBo8410g9aE20viOZlFSlC7aovtM4pnlfSQhPbhp2jh2X2FtV40HevArIimezQw+2pe9lHSa20TPEYFYPYGR/CgfwzpvYWG+hHk25/bQq4OqHr+wJ+cb2erZxin1XVGyFmku8v0PX7I/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idsETjRo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D82C116B1;
	Wed, 12 Jun 2024 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718213142;
	bh=OK6qbZ0vnNzVV/sfoCYgFy2+diPsXnMq6GJhiiEBkqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=idsETjRovWK/GS7qYp0LF/BUjTYnBRhnBQk+GH8O/gBjiAFb0r1Prz7f93za8/Rfb
	 8QRtIEyn0oUx6Rk8rOgwP3sYY6Cm7gfkJMihZmBX55RtTsc6sohzX8xO835Wim14lY
	 RNIaTiC+Z7iKE3OVCrnrz9t3gjR6ifFds8vNH3R9Ruqalo/nk/MQeDRabSXDDlHiMa
	 GVe1NA9vLejS+TXVm+yTxBPI+7K6cj2aJg4DPrUHsK6mSqLXzOnpuj/EUTPiyGj8XQ
	 QzCXCaMJoQYiHc6N/K9VVJb6GD8s4Ft0bfqCwiW5AbzupPvGp3DlrprM5tguPe5nmh
	 xMDgd9cRlCNPQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Cc: upstream@lists.phytec.de
In-Reply-To: <20240610125847.773394-1-primoz.fiser@norik.com>
References: <20240610125847.773394-1-primoz.fiser@norik.com>
Subject: Re: [PATCH v2] ASoC: ti: omap-hdmi: Fix too long driver name
Message-Id: <171821313984.235346.8948491995982488309.b4-ty@kernel.org>
Date: Wed, 12 Jun 2024 18:25:39 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370

On Mon, 10 Jun 2024 14:58:47 +0200, Primoz Fiser wrote:
> Set driver name to "HDMI". This simplifies the code and gets rid of
> the following error messages:
> 
>   ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: omap-hdmi: Fix too long driver name
      commit: 524d3f126362b6033e92cbe107ae2158d7fbff94

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


