Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D24E1BA43C
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 15:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgD0NJU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 09:09:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:46824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgD0NJU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Apr 2020 09:09:20 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4AB032072D;
        Mon, 27 Apr 2020 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587992959;
        bh=RMGtcuq9poVdZOs8i7AlANrnvmz1YVBx+61b4lQ+NlU=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=18PqGg0U4x8bsr3mYRoxNY2EOchx4rM0d4uMWf33pwI2Mrnf+PB6I93E023rf+xBc
         v4e5SaKR30XDPNYw7TYhvyfFG1Dl1E85Odlw5MQltqiknTLUb+eWR7Ynz/+JOR3jjj
         X4ga4Tn+VQ/uh8xTkbEoZHOCq1dIkyh1NO0sUBX4=
Date:   Mon, 27 Apr 2020 14:09:17 +0100
From:   Mark Brown <broonie@kernel.org>
To:     rafael.j.wysocki@intel.com, peter.ujfalusi@ti.com, perex@perex.cz,
        alsa-devel@alsa-project.org, tglx@linutronix.de, tiwai@suse.com,
        Jason Yan <yanaijie@huawei.com>, linux-omap@vger.kernel.org,
        jarkko.nikula@bitmer.com, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com
In-Reply-To: <20200426094238.23914-1-yanaijie@huawei.com>
References: <20200426094238.23914-1-yanaijie@huawei.com>
Subject: Re: [PATCH] ASoC: ti: remove comparison to bool in omap_mcbsp_dai_set_dai_fmt()
Message-Id: <158799293954.30174.6898589997938617808.b4-ty@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 26 Apr 2020 17:42:38 +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> sound/soc/ti/omap-mcbsp.c:1188:5-11: WARNING: Comparison to bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: ti: remove comparison to bool in omap_mcbsp_dai_set_dai_fmt()
      commit: 1597bfbfdb3c6e97ad0f63abedc2a26d6c1850c7

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
