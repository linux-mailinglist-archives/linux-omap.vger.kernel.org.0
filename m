Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0990122B77C
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 22:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgGWUU1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 16:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgGWUU1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jul 2020 16:20:27 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73B5A20B1F;
        Thu, 23 Jul 2020 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595535627;
        bh=WLDe8p+A/CpQf5/6gq8TVOgNo0NwPqUHogMr+bFuRAw=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Hf0XD6+LeWC+wP6ISweQEjefDPwEoG0pmVg1WZ5pQscc75fWWmHrmL53k7Hod/Wvs
         SgSWCTbWHINmRuH7QXaOeghUz/+2zm5S9/yu8s6YNXlZ452dCjxEetWpwmA11LR/2a
         lrhoNY+QjgS1cFscMjJspwQeD+GHPPq/fuXtPPRE=
Date:   Thu, 23 Jul 2020 21:20:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org, perex@perex.cz,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        jarkko.nikula@bitmer.com, tiwai@suse.com,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        lgirdwood@gmail.com, peter.ujfalusi@ti.com
In-Reply-To: <20200718112403.13709-1-grandmaster@al2klimov.de>
References: <20200718112403.13709-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] ASoC: omap: Replace HTTP links with HTTPS ones
Message-Id: <159553557415.41908.1856023334882832244.b4-ty@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 18 Jul 2020 13:24:03 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: omap: Replace HTTP links with HTTPS ones
      commit: 3323a148fd79a6c6c8809bb793708bcfa626081d

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
