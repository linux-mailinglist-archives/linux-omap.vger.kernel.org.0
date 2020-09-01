Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1865C259172
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 16:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbgIAOvU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Sep 2020 10:51:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728755AbgIAOvS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Sep 2020 10:51:18 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82B6D2078B;
        Tue,  1 Sep 2020 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598971878;
        bh=yqmMFIpZEbRaW5ShU6QJoTFWzap3EWFgiYQp3JYn0pc=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Xt1B/YItZAkINRQXe+/atByGgbv97z7vWjumtGawq9UZa0QIS/H71DObD7qXix9V8
         5rkoPihkw7M0HNHHXI2ZrUQzo2t2txOMA7XvEAvGjuuz5KoB/7zhiQufBC6lwAIjT4
         7M2bDv5SCl2sFTQheqc9xyAIG+V1vz633wC2edLU=
Date:   Tue, 01 Sep 2020 15:50:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200829221104.20870-1-rikard.falkeborn@gmail.com>
References: <20200829221104.20870-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 0/8] regulator/tps*: Constify static regulator ops
Message-Id: <159897183313.47900.16357469471615056811.b4-ty@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 30 Aug 2020 00:10:56 +0200, Rikard Falkeborn wrote:
> Constify static instances of struct regulator_ops to allow the compiler
> to put them in read-only memory. Patches are independent. Compile-tested
> only.
> 
> Rikard Falkeborn (8):
>   regulator: tps51632: Constify tps51632_dcdc_ops
>   regulator: tps6105x: Constify tps6105x_regulator_ops
>   regulator: tps62360: Constify tps62360_dcdc_ops
>   regulator: tps65086: Constify static regulator_ops
>   regulator: tps65090: constify static regulator_ops
>   regulator: tps6586x: Constify static regulator_ops
>   regulator: tps65912: Constify static regulator_ops
>   regulator: tps65910: Constify static regulator_ops
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/8] regulator: tps51632: Constify tps51632_dcdc_ops
      commit: dcb97c10f967c2cfea4c6316f026bc4a4a165f1e
[2/8] regulator: tps6105x: Constify tps6105x_regulator_ops
      commit: 55c81934e7040c1e0c26b72ee752203ccf190b51
[3/8] regulator: tps62360: Constify tps62360_dcdc_ops
      commit: 01167e88e9372f9748e94a7322b0d43ccb980d9f
[4/8] regulator: tps65086: Constify static regulator_ops
      commit: 2e6d9db83ac7c65b986d3037620dc735dee7383f
[5/8] regulator: tps65090: constify static regulator_ops
      commit: 7d844ac3b5a8a97ae4a05d9f545346a4fca77cea
[6/8] regulator: tps6586x: Constify static regulator_ops
      commit: 25c8044502ca9fb684fe7a0612985069e27e01eb
[7/8] regulator: tps65912: Constify static regulator_ops
      commit: e92b8ef87a8a4a95056d6b5852bd4b5288f34540
[8/8] regulator: tps65910: Constify static regulator_ops
      commit: 385d41d7edbc37d6b30197672b744021ce3baccf

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
