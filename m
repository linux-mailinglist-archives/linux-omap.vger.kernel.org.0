Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCC841C560
	for <lists+linux-omap@lfdr.de>; Wed, 29 Sep 2021 15:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344068AbhI2NTR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Sep 2021 09:19:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344061AbhI2NTQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Sep 2021 09:19:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 395E8611C8;
        Wed, 29 Sep 2021 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632921455;
        bh=/7ffRfO70FzWtNxTpBsYQ6/zH6FWWTHiDyUtdaVoxNM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VggxSjaXR3LQSOrES/Fvon5cf53q55be9Xwqlb67r6AmQoa/D+PywZcGiGnxyc8/M
         JMnbE/07Vc3r4f+wMc66bIVYFGWzk6jM58KMy204c38ODHx6fM5JKyDNy1B6VqOQbn
         /o/w9/CNRcGRYnNAHcWwPSYSTkh1Lm59FIJQBIu1xABqI09/zJhWs7mDMYdhvQU55E
         32pI3oXGw95sabLY2AJLE0Ztkuv1w/yqSqBcHVcxXy448+G3qbeT3QYu/hQfe3b9me
         KKi8xiBQqEUSXXRDa0/2LmOh88fp5WCogTZhThYk7vxaQDonvwtLopuK1IcfHo21fQ
         nvZ8xbFz0IuLg==
From:   Mark Brown <broonie@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: Constify static snd_soc_ops
Date:   Wed, 29 Sep 2021 14:16:44 +0100
Message-Id: <163292102842.46827.14999239239747146155.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210929093121.21253-1-rikard.falkeborn@gmail.com>
References: <20210929093121.21253-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 29 Sep 2021 11:31:21 +0200, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link struct
> which is a pointer to const struct snd_soc_ops. Make them const to allow
> the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: Constify static snd_soc_ops
      commit: 5100436c27aafdbc860de17447862304c5639b60

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
