Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D83872FC2E
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jun 2023 13:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjFNLQN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Jun 2023 07:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbjFNLP5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Jun 2023 07:15:57 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A277B1BE9
        for <linux-omap@vger.kernel.org>; Wed, 14 Jun 2023 04:15:56 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 933328027;
        Wed, 14 Jun 2023 11:15:55 +0000 (UTC)
Date:   Wed, 14 Jun 2023 14:15:54 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     soc@kernel.org, linux-omap@vger.kernel.org,
        Peter Vasil <petervasil@gmail.com>
Subject: Re: [PATCH] ARM: omap2: Fix copy/paste bug
Message-ID: <20230614111554.GJ14287@atomide.com>
References: <20230614093032.403982-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614093032.403982-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [230614 12:30]:
> I mistyped one of the SD/MMC GPIO lines on the Nokia n810 which
> was supposed to be "vio" as "vsd".
> 
> Fix it up.
> 
> Reported-by: Peter Vasil <petervasil@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC maintainers: please apply this directly where the rest of the
> OMAP clean-ups are.

Reviewed-by: Tony Lindgren <tony@atomide.com>

>  arch/arm/mach-omap2/board-n8x0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
> index 564bf80a2621..8e3b5068d4ab 100644
> --- a/arch/arm/mach-omap2/board-n8x0.c
> +++ b/arch/arm/mach-omap2/board-n8x0.c
> @@ -158,7 +158,7 @@ static struct gpiod_lookup_table nokia810_mmc_gpio_table = {
>  				"vsd", 1, GPIO_ACTIVE_HIGH),
>  		/* Slot index 1, VIO power, GPIO 9 */
>  		GPIO_LOOKUP_IDX("gpio-0-15", 9,
> -				"vsd", 1, GPIO_ACTIVE_HIGH),
> +				"vio", 1, GPIO_ACTIVE_HIGH),
>  		{ }
>  	},
>  };
> -- 
> 2.34.1
> 
