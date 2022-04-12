Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7AD44FEA70
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 01:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiDLXcJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 19:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiDLXb7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 19:31:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B60615758C
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 15:26:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 415E3B82070
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 22:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3900C385A6;
        Tue, 12 Apr 2022 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649802391;
        bh=VqRfAFLFoRfWJldgRiRIY25GFSd4Ta7g9o7aklHvEBM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=e6yfAnhCdjKjb/cHk+E0lN3HbyLHNcsjIAGOjYMbTo7g4oYwefbjU630vbH2zoBDe
         8C2mBwIZvn1hosXmPoNHVUmKSXUVfDIwiedR/u3Rr5hNMBrkzj0U9GW8n4/xenWHoB
         83aqUpYaxPhVFZsNlDavPnD2Jc4MQzCs108d6FStpHaQDc/cDzN8ThF4mpOrYhu9hf
         nL2IMmXU/s36quFXT84Lsh2IyPLsvTTnjL+Ut1jOtMGzY1ZgtXSQGqC+P/ZabH7rUv
         yn9B+WZiOGUoSjJabjb6Y4YsthVHVKSg4wCs7JPo5Ej00Oay7RVXZ+RSeWO35+usPh
         2Y1aSej9TR+SA==
From:   Mark Brown <broonie@kernel.org>
To:     jmkrzyszt@gmail.com
Cc:     linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com,
        lgirdwood@gmail.com, alsa-devel@alsa-project.org
In-Reply-To: <20220407191202.46206-1-jmkrzyszt@gmail.com>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com> <20220407191202.46206-1-jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2] ASoC: ti: osk5912: Make it CCF clk API compatible
Message-Id: <164980238972.480306.7278363796389340760.b4-ty@kernel.org>
Date:   Tue, 12 Apr 2022 23:26:29 +0100
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

On Thu, 7 Apr 2022 21:12:02 +0200, Janusz Krzysztofik wrote:
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
