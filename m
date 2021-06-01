Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9198239793E
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 19:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbhFARkl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 13:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234684AbhFARke (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Jun 2021 13:40:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8AE613D1;
        Tue,  1 Jun 2021 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622569132;
        bh=dAtxZOy1vRvHAbbRbK/qBv+43wjWQ0+17BwlinOpq4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V5K+MU+E8r8RLJtvkb2wbKyLDXWTxj5VGJ+xsGStLbL9GGI3dHtupY3M4JG4d5fVU
         2sFB/xkNe4jDFCUaRb+Z2mim35bODFuO8XI83N464YGgGWp9oHNfElMGowE4DES5CY
         PgfXWwRczf+1iyznnUz7FMb5eYcvj02lTmqMiYnBaawwkR3Eb3edGGCCNHF/5dnLtU
         YGmG05CK6TWgCjUU4GBrc8FkTgHFx0q8tFXQ4CC1aWYCaMsqgr9zCzllcv/d3s+sFc
         O3oFMhsOgw1dJ9Qds+U+Vuy0S8QG9uiQRd9LhKEW1Z+INiYLoXX4gJ7cu60NhllvfN
         bm/3xkVlpxvVA==
From:   Mark Brown <broonie@kernel.org>
To:     tiwai@suse.com, YueHaibing <yuehaibing@huawei.com>,
        lgirdwood@gmail.com, perex@perex.cz, jarkko.nikula@bitmer.com,
        peter.ujfalusi@gmail.com
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] ASoC: ti: omap-mcbsp: use DEVICE_ATTR_RW macro
Date:   Tue,  1 Jun 2021 18:38:09 +0100
Message-Id: <162256892743.19919.2315027944025849805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528063033.19904-1-yuehaibing@huawei.com>
References: <20210528063033.19904-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 28 May 2021 14:30:33 +0800, YueHaibing wrote:
> Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: omap-mcbsp: use DEVICE_ATTR_RW macro
      commit: b1b384de0a9be2d2913c8a308f381da0b9184e91

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
