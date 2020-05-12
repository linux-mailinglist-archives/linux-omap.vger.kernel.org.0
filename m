Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68001CFB39
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 18:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgELQpR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 12:45:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgELQpR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 12:45:17 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62A0C20714;
        Tue, 12 May 2020 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589301916;
        bh=PoU1PDlU8EtoqlFaKH81yByCt0mWPcBR7YxQuQ0TaeM=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=NSaEkz8h2XIJ8DYvcW+GtWUn+dfGp8KHikaeRgwfWw+GuNqwXRCGo6uvX1n1qdaqj
         aYvwlYOaCdchKoByZK89nXSFA9Wi7EWCZlE5VFn2ZNoopKxEtc22z07QIf+mzobT+t
         x8doeUp+oESQWVCEq76ZJzNwrZT0rFcvBzelPO+s=
Date:   Tue, 12 May 2020 17:45:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        lgirdwood@gmail.com, linux-omap@vger.kernel.org, perex@perex.cz,
        tiwai@suse.com, jarkko.nikula@bitmer.com, peter.ujfalusi@ti.com
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <20200512134325.252073-1-christophe.jaillet@wanadoo.fr>
References: <20200512134325.252073-1-christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: ti: omap-mcbsp: Fix an error handling path in 'asoc_mcbsp_probe()'
Message-Id: <158930188456.55827.1765769472470838223.b4-ty@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 12 May 2020 15:43:25 +0200, Christophe JAILLET wrote:
> If an error occurs after the call to 'omap_mcbsp_init()', the reference to
> 'mcbsp->fclk' must be decremented, as already done in the remove function.
> 
> This can be achieved easily by using the devm_ variant of 'clk_get()'
> when the reference is taken in 'omap_mcbsp_init()'
> 
> This fixes the leak in the probe and has the side effect to simplify both
> the error handling path of 'omap_mcbsp_init()' and the remove function.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: ti: omap-mcbsp: Fix an error handling path in 'asoc_mcbsp_probe()'
      commit: 03990fd58d2b7c8f7d53e514ba9b8749fac260f9

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
