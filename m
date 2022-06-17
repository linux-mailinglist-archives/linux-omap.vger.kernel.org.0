Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E465154FB11
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jun 2022 18:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383296AbiFQQ36 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jun 2022 12:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383299AbiFQQ3y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jun 2022 12:29:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DB242A24
        for <linux-omap@vger.kernel.org>; Fri, 17 Jun 2022 09:29:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 707F4B82A33
        for <linux-omap@vger.kernel.org>; Fri, 17 Jun 2022 16:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D154DC3411B;
        Fri, 17 Jun 2022 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655483391;
        bh=8lIyfl6cLa0jSZ4rrQjgGG9QXNu4BOP9MO1nbLqDdLo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=hYtqErNIDh/G1tDlX/Gzd3hNB+flGgum09vIYQJuYIFxJjvLZRa/tscQu9LOaPW/6
         alWYxfOJ0rIouFHSzLzI+DmX7MblakbKEAiWwh8PDIIdnom1XEl0n4yJa8xtbPh4Se
         s3YbkjaxHtitZk9Qv17eolMl/qhubOExjXGYrHHYJjgTp1S2ljLtYDytN9cBbA2dkJ
         N9JphuDvQGzriMAS6F2s1VuijRkycdwwWsyicPIFZMjaISr4HNVfhOPvkAWf6iKymA
         ojjjTeb+fwH5KHOZYWJD2R4uPkUiyMYuxx0dWt7gv9MMHI+vOjMYRsnc02wcCJqCEp
         rzDhqaD8ewH1Q==
From:   Mark Brown <broonie@kernel.org>
To:     peter.ujfalusi@gmail.com, lgirdwood@gmail.com
Cc:     jarkko.nikula@bitmer.com, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, aaro.koskinen@iki.fi, tony@atomide.com
In-Reply-To: <20220616153521.29701-1-peter.ujfalusi@gmail.com>
References: <20220616153521.29701-1-peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: twl4030: Drop legacy, non DT boot support
Message-Id: <165548338955.901499.17638246583616685807.b4-ty@kernel.org>
Date:   Fri, 17 Jun 2022 17:29:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 16 Jun 2022 18:35:21 +0300, Peter Ujfalusi wrote:
> Legacy or non DT boot is no longer possible on systems where the
> tw4030/5030 is used.
> 
> Drop the support for handling legacy pdata and replace it with a local
> board_params struct to allow further cleanups on the mfd side.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: twl4030: Drop legacy, non DT boot support
      commit: 7adadfb06b9839fa7d9de0cde7ad57a3be3665f0

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
