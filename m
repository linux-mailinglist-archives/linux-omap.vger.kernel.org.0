Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF762DC381
	for <lists+linux-omap@lfdr.de>; Wed, 16 Dec 2020 16:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgLPPyB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Dec 2020 10:54:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:46132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726616AbgLPPyB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Dec 2020 10:54:01 -0500
From:   Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     robh+dt@kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        lgirdwood@gmail.com, jarkko.nikula@bitmer.com
Cc:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, tiwai@suse.com,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        jsarha@ti.com
In-Reply-To: <20201215130512.8753-1-peter.ujfalusi@ti.com>
References: <20201215130512.8753-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH 0/2] ASoC: ti: Maintainer mail address change
Message-Id: <160813397774.31838.10952894427041068328.b4-ty@kernel.org>
Date:   Wed, 16 Dec 2020 15:52:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 15 Dec 2020 15:05:10 +0200, Peter Ujfalusi wrote:
> My TI address is going to bounce after Friday (18.12.2020), switch my email
> address to my private one for now.
> 
> Regards,
> Peter

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] MAINTAINERS: Update email address for TI ASoC and twl4030 codec drivers
      commit: fe6ce6c394fb1ef1d8a6384c5180e70893157f22
[2/2] ASoC: dt-bindings: ti, j721e: Update maintainer and author information
      commit: 61fc03b6512b18f27a25002426d595f5a36645ed

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
