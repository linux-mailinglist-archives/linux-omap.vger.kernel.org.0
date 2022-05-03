Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91FB518208
	for <lists+linux-omap@lfdr.de>; Tue,  3 May 2022 12:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiECKJ1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 May 2022 06:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbiECKJK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 May 2022 06:09:10 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0656E205F8
        for <linux-omap@vger.kernel.org>; Tue,  3 May 2022 03:05:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EEAAC8162;
        Tue,  3 May 2022 10:02:19 +0000 (UTC)
Date:   Tue, 3 May 2022 13:05:34 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <YnD+brrvs36aL71B@atomide.com>
References: <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com>
 <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
 <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
 <Yg4CZb1Jy2M8wwn/@atomide.com>
 <77a24941-4c46-8d78-391a-d3d1018f311a@smile.fr>
 <Yg5GdIp5Glp9p/G5@atomide.com>
 <2d192056-4977-9e2e-f661-23e05e2a6584@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d192056-4977-9e2e-f661-23e05e2a6584@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Romain Naour <romain.naour@smile.fr> [220402 10:13]:
> Le 17/02/2022 à 13:58, Tony Lindgren a écrit :
> > Yes but note that 8250_omap autosuspend does not do anything unless the
> > timeouts are manually enabled by the userspace. They are initialized to -1
> > during probe.
> 
> Actually it's not initialized to -1 on my board, it's initialized to 0. See
> commit [1].

Oh you're right. The default should be initialized to 2000ms though, not 0.

> I'm starting to think that is an issue when the 8250_omap driver is used with
> another driver like the gnss serial driver (using a serdev driver).

Oh yes you are right. We do this conditionally now.

> Since the commit [1] there is no autosuspend delay at all, I would suggest to
> add a default autosuspend delay value. I tested with 200ms based on another example.
> 
> diff --git a/drivers/tty/serial/8250/8250_omap.c
> b/drivers/tty/serial/8250/8250_omap.c
> index ec7304d57f5f..8ba830bd493a 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -108,6 +108,9 @@
>  /* RX FIFO occupancy indicator */
>  #define UART_OMAP_RX_LVL               0x19
> 
> +/* Runtime PM autosuspend timeout: 0ms may trigger wakeup issues */
> +#define UART_AUTOSUSPEND_TIMEOUT               200
> +
>  struct omap8250_priv {
>         int line;
>         u8 habit;
> @@ -1409,6 +1412,8 @@ static int omap8250_probe(struct platform_device *pdev)
>          */
>         if (!of_get_available_child_count(pdev->dev.of_node))
>                 pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> +       else
> +               pm_runtime_set_autosuspend_delay(&pdev->dev,
> UART_AUTOSUSPEND_TIMEOUT);
> 
>         pm_runtime_irq_safe(&pdev->dev);

Hmm the value should be set to the default 2000ms already. If it's not, then we
need to find out what is setting it to 0.

For adjusting the timeout, you may want to check the child serdev driver
runtime PM autosuspend timeout, adjusting that seems a better place to
prevent the 8250 idle. Not sure how we should handle the 8250 specific
timeout though based on the serdev driver requirements.

Regards,

Tony


> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=627a545c6bb0c7de09208e6546f5111290477261
