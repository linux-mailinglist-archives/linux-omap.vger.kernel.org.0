Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6511B7B577F
	for <lists+linux-omap@lfdr.de>; Mon,  2 Oct 2023 18:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237808AbjJBQER (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Oct 2023 12:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjJBQEQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Oct 2023 12:04:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC008E
        for <linux-omap@vger.kernel.org>; Mon,  2 Oct 2023 09:04:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F482C433C7;
        Mon,  2 Oct 2023 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696262654;
        bh=8qJEwNB1r3i7uX/wCuY3MI9oUQXs00pwUZfeUFu2Wa4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=c6E8Sl6bRHKCpnPuDEkjUP8m62ng1h5HdZ4K+RPH2y0QjeEsutJ8N7IvMi8u9zQxN
         dmor+nnzXLmhDarfGtMBWwnq0rPIoIdRL/53G9uuUbDAiZkLPLDiEAu420tJNVGVKj
         DLpVshz9xcSHK4lLlmAFPjeo8x9w76dZSza7DKxEPgvNS1597bbBczp4Vqz2ufI1E2
         eWaC4fruQAjd9AttbYGae3L9WhQWl4OJgZ43bxKZXfuID3zOvyOmJkhAs2zMTKWkU4
         WuoeqHl6XjCtT9fTwTKgM/1LuNqZMKH7PhhrpufTlHPaA390/I/0lxbyuy5h3zgnIk
         5/gHuPY8FSTIQ==
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alsa-devel@alsa-project.org
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
Subject: Re: [PATCH 0/5] GPIO descriptors for TI ASoC codecs
Message-Id: <169626265184.76713.15106250462877000294.b4-ty@kernel.org>
Date:   Mon, 02 Oct 2023 17:04:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 26 Sep 2023 15:25:28 +0200, Linus Walleij wrote:
> This cleans up and rewrites the GPIO usage in the TI
> ASoC components to use GPIO descriptors exclusively.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: ti: Convert N810 ASoC to GPIO descriptors
      commit: 22041ed154aaf89f31306014a305dde516c308ea
[2/5] ASoC: ti: Convert RX51 to use exclusively GPIO descriptors
      commit: 5b12dd84499a74be9d133e020e424025359a244f
[3/5] ASoC: ti: Convert TWL4030 to use GPIO descriptors
      commit: 1b8a62937e0b23c41956feec778ca7776a01df48
[4/5] ASoC: ti: Convert Pandora ASoC to GPIO descriptors
      commit: 319e6ac143b9e9048e527ab9dd2aabb8fdf3d60f
[5/5] ASoC: ti: osk5912: Drop unused include
      commit: 67ebde42034ec8d199ec7877efed4bd08eb0c5e0

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

