Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1635B284ECD
	for <lists+linux-omap@lfdr.de>; Tue,  6 Oct 2020 17:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJFPWH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Oct 2020 11:22:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725906AbgJFPWH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Oct 2020 11:22:07 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C293206F7;
        Tue,  6 Oct 2020 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601997726;
        bh=4GwMgvhMYP09QQTaVchdH/g0FL+01bYYP1Scb0uwz8U=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=qWE/qvUHB0NBFS4fuG2iUtDr3AKkcW1w/jKEYh0/k4Ve5yJkIDM3dXsRkOFAmWw/k
         FKy4+HJm7Q/mVJYw+Rsb+1XaxV9wQqstMWlrlGSwNdsI9g0H1VY/df+oz+hw2dEpqU
         gxIF/rlPSM2Drs558a+VNmoX7oswwZkLrXBq67P4=
Date:   Tue, 06 Oct 2020 16:21:03 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20201004102535.325547-1-alex.dewar90@gmail.com>
References: <20201004102535.325547-1-alex.dewar90@gmail.com>
Subject: Re: [PATCH] ASoC: omap-mcbsp: Fix use of uninitialised pointer
Message-Id: <160199764658.51353.3516318370024872903.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 4 Oct 2020 11:25:36 +0100, Alex Dewar wrote:
> Commit 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP
> and Sidetone function split"), in rearranging various files, also replaced
> calls to platform_get_resource_by_name() + devm_ioremap_resource() with a
> single call to devm_platform_ioremap_resource_byname(). However, the
> struct resource is needed as we access its members so at present a null
> pointer is dereferenced. Fix by doing things the old way.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: omap-mcbsp: Fix use of uninitialised pointer
      commit: cd7dea5e17a561e621e78e5863f5634cb6f9f097

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
