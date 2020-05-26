Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FD51E275F
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 18:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388801AbgEZQp4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 12:45:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:60668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388799AbgEZQpz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 May 2020 12:45:55 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2771120787;
        Tue, 26 May 2020 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590511555;
        bh=XOChMk8gnrUoD6TmiuzV6PPv/YGwIxQm8tqk/nDusow=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=tcmQUE3ryk37EbisWbA+aKPXcV4hwxJtkoKRvBtFxt++O2PQuAsURLEhcbL4Bt0gI
         C0fgmYv4qEZZsxMjzGojjwnSQTFd0Y0oIlV122g2vfxKGh4cuS3rBz3N/Ww1pmL2HG
         Qw/EZd+JkCoMY6PEKJpj/kgfaVCV/j70gCAelFlY=
Date:   Tue, 26 May 2020 17:45:53 +0100
From:   Mark Brown <broonie@kernel.org>
To:     kjlu@umn.edu, Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        linux-omap@vger.kernel.org, alsa-devel@alsa-project.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20200525085848.4227-1-dinghao.liu@zju.edu.cn>
References: <20200525085848.4227-1-dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] [v2] ASoC: ti: Fix runtime PM imbalance in omap2_mcbsp_set_clks_src
Message-Id: <159051153752.36309.9642221556598180618.b4-ty@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 25 May 2020 16:58:48 +0800, Dinghao Liu wrote:
> When clk_set_parent() returns an error code, a pairing
> runtime PM usage counter increment is needed to keep the
> counter balanced.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: Fix runtime PM imbalance in omap2_mcbsp_set_clks_src
      commit: c553d290577093553098a56c954e516950c35c59

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
