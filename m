Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF01D3C5B09
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jul 2021 13:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbhGLKvR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jul 2021 06:51:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234841AbhGLKvB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Jul 2021 06:51:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3FBE61158;
        Mon, 12 Jul 2021 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626086893;
        bh=uFKZUcxNXvFFw4G5DZqnPtxsEn6x4z8FXcNoG6LIHjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LiU9m96l3e6mu9zH2H1BrDEqjFsnJfFkN0ZfLDwf3zlevCkmp986ILHlNA1Sd9q+i
         tM/8n8CBVic66xhQpbcnDesBdeTQnslz0t2x2bTsYbtRE+aKgZJj5v8v55TLz5rUY9
         MbMRJQe0wl5J/27uqgioi3eEwG/m0Ck0njA6WjOFv4HTivEq412u/m948vxzN7MoY1
         NyhY96u2zqnc4Lf6/iUExeGVlUxC9tKOsxA9DWaR3hu8nvcc6bZwWQDocoPwUE2zvi
         kpeHQxNa+8ieINcWeYeIyTWBW/KSymqinFQLtypZPc+YE1D6cSio/ifr5uJV+dgKYX
         j14htIzy+aBGA==
From:   Mark Brown <broonie@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>, tony@atomide.com
Cc:     Mark Brown <broonie@kernel.org>, hns@goldelico.com,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        lgirdwood@gmail.com
Subject: Re: (subset) [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4 support
Date:   Mon, 12 Jul 2021 11:46:10 +0100
Message-Id: <162608623153.3192.5424493872584215268.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 5 Jul 2021 22:42:44 +0300, Peter Ujfalusi wrote:
> Changes since v1:
> - Do not calculat that we allow one serializer in DIT mode, just set the
>   max_active_serializers to 1.
>   Reported-by: kernel test robot <lkp@intel.com>
> 
> it has been on my todo list for several years to support McASP on OMAP4 devices.
> For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
> davinci-mcasp driver) to support what was needed on that specific phone + it's
> dock for S/PDIF (48KHz, 16bit, stereo).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: ti: davinci-mcasp: Fix DIT mode support
      commit: bbdd3f4dbe81e19b9123bc54e23ed54517615524
[2/5] ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
      commit: 5dcd276e1525e0c7ae7aa1f0426b6343ebf994e0
[3/5] ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
      commit: 0238bcf80e972f2ce25d767e54f89a9e49773f6e

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
