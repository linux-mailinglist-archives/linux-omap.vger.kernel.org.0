Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A474FEB03
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 01:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiDLXgW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 19:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbiDLXcG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 19:32:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392221557F2
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 15:26:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D527EB82052
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 22:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FD1C385A1;
        Tue, 12 Apr 2022 22:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649802389;
        bh=MBNtZA6rXGXC12n4TUDLgxmGOvEAdEkXm7T+0dFTi00=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=oZ/hfLIh0qXWOlbk/WYctNIyOey7eD/79V1sZ5ZcT/+vngPoL1ZENQWoe8BZz0inm
         iMUtjggXRDv8Gv0DHcT8uqZ3KbKnQDf9VT1qvADZ9Tjgip2z1LOCNW2ndPHl8WcOTM
         qNnXwmvyVmAmgntZU5JJn6u4v1o/KdyOyMJooMJLJUwy9JtwEl3XLL4H2Fn8S4VB2E
         TzO74IzSJEDXnZdcNYuydCWy4L3DnYWg7BqaHLHD1y65Q0FKCSXLUf5+MpRxABbmqq
         FXQJloMRUPIv3SQFiebN5WnSnrfL/UPVaK4k+/+LJOk/kGGZy0zqAr6r8ZsgZ24oCO
         ob5I0ADaZJwPg==
From:   Mark Brown <broonie@kernel.org>
To:     jmkrzyszt@gmail.com
Cc:     linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com,
        lgirdwood@gmail.com, alsa-devel@alsa-project.org
In-Reply-To: <20220402120106.131118-1-jmkrzyszt@gmail.com>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
Message-Id: <164980238824.480306.8135927048445454022.b4-ty@kernel.org>
Date:   Tue, 12 Apr 2022 23:26:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 2 Apr 2022 14:01:06 +0200, Janusz Krzysztofik wrote:
> The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP1 custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
> 
> Update the driver to be compatible with CCF implementation of clock API.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: osk5912: Make it CCF clk API compatible
      commit: 90b76a3cb9bf208286851560cfc70830c91c1d3f

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
