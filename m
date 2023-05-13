Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608E77015E6
	for <lists+linux-omap@lfdr.de>; Sat, 13 May 2023 11:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238467AbjEMJvS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 May 2023 05:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238374AbjEMJvN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 13 May 2023 05:51:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2BF420F;
        Sat, 13 May 2023 02:51:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9947611D3;
        Sat, 13 May 2023 09:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7B5C433D2;
        Sat, 13 May 2023 09:51:08 +0000 (UTC)
Date:   Sat, 13 May 2023 18:44:58 +0900
From:   Greg KH <greg@kroah.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ARM/musb: omap2: Remove global GPIO numbers from TUSB6010
Message-ID: <2023051349-situation-docile-58c6@gregkh>
References: <20230430193824.577867-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430193824.577867-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Apr 30, 2023 at 09:38:24PM +0200, Linus Walleij wrote:
> The TUSB6010 (MUSB) device is picking up some GPIO lines
> hardcoded by number and passing on to the TUSB6010 device
> when registering it.
> 
> Instead of nasty workarounds, provide a GPIO descriptor
> table and then make the TUSB6010 MUSB glue driver pick up
> the GPIO lines directly, convert it to an IRQ and pass down
> to the MUSB driver. OMAP2 is the only system using the
> TUSB6010.
> 
> Stash the GPIO descriptors in the glue layer and use
> then to power up and down the TUSB6010 on-demand, instead
> of using boardfile callbacks.
> 
> Since the OMAP2 boards are the only boards using the
> .set_power() and .board_set_power() callbacks, we can
> just delete them as the power is now handled directly
> in the TUSB6010 glue code.
> 
> Cc: Bin Liu <b-liu@ti.com>
> Cc: linux-usb@vger.kernel.org
> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mach-omap2/board-n8x0.c   | 71 ++++++++----------------------
>  arch/arm/mach-omap2/usb-tusb6010.c | 20 ++-------
>  arch/arm/mach-omap2/usb-tusb6010.h | 12 +++++
>  drivers/usb/musb/musb_core.c       |  1 -
>  drivers/usb/musb/musb_core.h       |  2 -
>  drivers/usb/musb/tusb6010.c        | 53 ++++++++++++++++------
>  include/linux/usb/musb.h           | 13 ------
>  7 files changed, 73 insertions(+), 99 deletions(-)
>  create mode 100644 arch/arm/mach-omap2/usb-tusb6010.h

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
