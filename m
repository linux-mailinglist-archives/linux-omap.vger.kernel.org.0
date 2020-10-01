Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A62280A76
	for <lists+linux-omap@lfdr.de>; Fri,  2 Oct 2020 00:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733266AbgJAWsA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 18:48:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:54912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgJAWsA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Oct 2020 18:48:00 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CD5A206C1;
        Thu,  1 Oct 2020 22:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601592479;
        bh=9jrsP/ntHMX4HDgA8D3YyD6k+QKNByf+7i7VdCbRWJQ=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=wJKwaj87e9TmjoCmplAYw+iHjAJxYMEExOcgUjImDjLbOe3dUIf2oipejQ+8e88x1
         Hca/xHCUIb5R7OSbMDlmG1tXZLCbA/AP/Ff1e/AMBIlohtUjl/SJevsuJrzoSV7CNw
         8SD54x2nB/DFHDikJh0Ts/nRMqV/gq2aXj5g/x50=
Date:   Thu, 01 Oct 2020 23:47:00 +0100
From:   Mark Brown <broonie@kernel.org>
To:     peter.ujfalusi@ti.com, lgirdwood@gmail.com,
        jarkko.nikula@bitmer.com, perex@perex.cz,
        Qilong Zhang <zhangqilong3@huawei.com>, tiwai@suse.com
Cc:     linux-omap@vger.kernel.org
In-Reply-To: <20200922015123.117489-1-zhangqilong3@huawei.com>
References: <20200922015123.117489-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next v2] ASoC: ti: omap-mcbsp: use
 devm_platform_ioremap_resource_byname
Message-Id: <160159237545.44588.7163579138372565449.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 22 Sep 2020 09:51:23 +0800, Qilong Zhang wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: omap-mcbsp: use devm_platform_ioremap_resource_byname
      commit: 31e1fc4f11e2ede512221eba9e7291ab19ec66da

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
