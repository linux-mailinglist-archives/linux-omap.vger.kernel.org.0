Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091E3702CE2
	for <lists+linux-omap@lfdr.de>; Mon, 15 May 2023 14:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241411AbjEOMk4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 May 2023 08:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbjEOMj3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 May 2023 08:39:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197331985
        for <linux-omap@vger.kernel.org>; Mon, 15 May 2023 05:36:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB4E161840
        for <linux-omap@vger.kernel.org>; Mon, 15 May 2023 12:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41602C433A0;
        Mon, 15 May 2023 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684154213;
        bh=rL3y0GxGBQ8zgYIxj2zjRqdV8oWOcLiu0Pettbs6hZs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kmqjFlv/VnyT6nohIr4H6tcC73iRv7AOkYCkYIUJQjdnF4JN/xLe3hR1urGbG+oST
         bdxfxbbyDH2Oak7Rp+tprfp9gMQGOC9EUUvfxA2Wld2jxCaxFggEZ8RxF9+AD5NhKB
         /rfD6EeVckGoKjfA2kSpEPXMFBhDwuXYb1H7E/yQe9EyoQO2p5B3VQrvTA8ZvAhTGo
         S2YwWsBTtljk1/GNuthziPVghAiiPPxDKREHwBB53TzRMbnc/eFbymd4JakQW/2ysp
         EUJJptrtE5Ytts3CYWftLndRYpU3SIUgkWEGgy+Vc8/84TtSrIqBcoHR3XYrFWWflx
         JNeabSbFeLcAg==
Date:   Mon, 15 May 2023 13:36:47 +0100
From:   Lee Jones <lee@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        andy.shevchenko@gmail.com, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v3] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
Message-ID: <20230515123647.GD10825@google.com>
References: <20230430093505.561265-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230430093505.561265-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 30 Apr 2023, Linus Walleij wrote:

> Aaro reports problems on the OSK1 board after we altered
> the dynamic base for GPIO allocations.
> 
> It appears this happens because the OMAP driver now
> allocates GPIO numbers dynamically, so all that is
> references by number is a bit up in the air.
> 
> Let's bite the bullet and try to just move the gpio_chip
> in the tps65010 MFD driver over to using dynamic allocations.
> Alter everything in the OSK1 board file to use a GPIO
> descriptor table and lookups.
> 
> Utilize the NULL device to define some board-specific
> GPIO lookups and use these to immediately look up the
> same GPIOs, convert to IRQ numbers and pass as resources
> to the devices. This is ugly but should work.
> 
> The .setup() callback for tps65010 was used for some GPIO
> hogging, but since the OSK1 is the only user in the entire
> kernel we can alter the signatures to something that
> is helpful and make a clean transition.
> 
> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: andy.shevchenko@gmail.com
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Lee Jones <lee@kernel.org>
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Add proper gpiod table terminators.
> - Use DEFINE_RES_IRQ()
> - Forward-declare struct gpio_chip instead of including a header.
> ChangeLog v1->v2:
> - Fix the CF card GPIO lookup
> - Use the right Fixes: tag
> ---
>  arch/arm/mach-omap1/board-osk.c | 137 ++++++++++++++++++++++----------

>  drivers/mfd/tps65010.c          |  14 ++--

Reviewed-by: Lee Jones <lee@kernel.org>

What's the merge plan for this?

>  include/linux/mfd/tps65010.h    |  11 +--
>  3 files changed, 102 insertions(+), 60 deletions(-)

-- 
Lee Jones [李琼斯]
