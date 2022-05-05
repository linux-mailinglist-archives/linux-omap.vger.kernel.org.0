Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685AB51B72F
	for <lists+linux-omap@lfdr.de>; Thu,  5 May 2022 06:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242747AbiEEEhO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 May 2022 00:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238391AbiEEEhN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 May 2022 00:37:13 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 066FE47387
        for <linux-omap@vger.kernel.org>; Wed,  4 May 2022 21:33:33 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9107680B0;
        Thu,  5 May 2022 04:30:12 +0000 (UTC)
Date:   Thu, 5 May 2022 07:33:31 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <YnNTm35rqxSVqnt4@atomide.com>
References: <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
 <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
 <Yg4CZb1Jy2M8wwn/@atomide.com>
 <77a24941-4c46-8d78-391a-d3d1018f311a@smile.fr>
 <Yg5GdIp5Glp9p/G5@atomide.com>
 <2d192056-4977-9e2e-f661-23e05e2a6584@smile.fr>
 <YnD+brrvs36aL71B@atomide.com>
 <fc11fc68-d1f3-8e47-c5ff-c8ba10e8a7b3@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc11fc68-d1f3-8e47-c5ff-c8ba10e8a7b3@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220504 12:38]:
> Hello,
> 
> Le 03/05/2022 à 12:05, Tony Lindgren a écrit :
> > Hi,
> > 
> > * Romain Naour <romain.naour@smile.fr> [220402 10:13]:
> >> Le 17/02/2022 à 13:58, Tony Lindgren a écrit :
> >>> Yes but note that 8250_omap autosuspend does not do anything unless the
> >>> timeouts are manually enabled by the userspace. They are initialized to -1
> >>> during probe.
> >>
> >> Actually it's not initialized to -1 on my board, it's initialized to 0. See
> >> commit [1].
> > 
> > Oh you're right. The default should be initialized to 2000ms though, not 0.
> 
> How do you know it should use 2000ms by default?

Oh I recalled we had such default value.. Seems I was wrong. Sorry for the
wrong information.

> >> I'm starting to think that is an issue when the 8250_omap driver is used with
> >> another driver like the gnss serial driver (using a serdev driver).
> > 
> > Oh yes you are right. We do this conditionally now.
> > 
> >> Since the commit [1] there is no autosuspend delay at all, I would suggest to
> >> add a default autosuspend delay value. I tested with 200ms based on another example.
> >>
> >> diff --git a/drivers/tty/serial/8250/8250_omap.c
> >> b/drivers/tty/serial/8250/8250_omap.c
> >> index ec7304d57f5f..8ba830bd493a 100644
> >> --- a/drivers/tty/serial/8250/8250_omap.c
> >> +++ b/drivers/tty/serial/8250/8250_omap.c
> >> @@ -108,6 +108,9 @@
> >>  /* RX FIFO occupancy indicator */
> >>  #define UART_OMAP_RX_LVL               0x19
> >>
> >> +/* Runtime PM autosuspend timeout: 0ms may trigger wakeup issues */
> >> +#define UART_AUTOSUSPEND_TIMEOUT               200
> >> +
> >>  struct omap8250_priv {
> >>         int line;
> >>         u8 habit;
> >> @@ -1409,6 +1412,8 @@ static int omap8250_probe(struct platform_device *pdev)
> >>          */
> >>         if (!of_get_available_child_count(pdev->dev.of_node))
> >>                 pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> >> +       else
> >> +               pm_runtime_set_autosuspend_delay(&pdev->dev,
> >> UART_AUTOSUSPEND_TIMEOUT);
> >>
> >>         pm_runtime_irq_safe(&pdev->dev);
> > 
> > Hmm the value should be set to the default 2000ms already. If it's not, then we
> > need to find out what is setting it to 0.
> 
> I don't see where pm_runtime_set_autosuspend_delay() would be called to set the
> autosuspend delay to 0.
> 
> 2000ms seems to be related to USB_AUTOSUSPEND_DELAY and only relevant for the
> usb stack.

OK maybe that's where I got the idea.

> Here nothing seems calling pm_runtime_set_autosuspend_delay(), so the
> autosuspend delay is still using 0 as default value. I'm not sure that the
> serdev driver really handle the autosuspend delay.

OK. Is your serdev driver not configuring the autosuspend value either?

> Other driver like the omap-sham set the autosuspend delay default value just
> after pm_runtime_use_autosuspend(&pdev->dev):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/crypto/omap-sham.c?h=linux-5.10.y#n2126
> 
> > 
> > For adjusting the timeout, you may want to check the child serdev driver
> > runtime PM autosuspend timeout, adjusting that seems a better place to
> > prevent the 8250 idle. Not sure how we should handle the 8250 specific
> > timeout though based on the serdev driver requirements.
> 
> For now, I'm not sure I need to adjust the timeout.

Well what is the child serdev driver setting the autosuspend timeout to?

That should prevent the parent 8250 device from suspending. If the serdev
driver is not using autosuspend, that should prevent the parent 8250 device
from suspending also until the serdev driver decides to runtime suspend.

I guess I'm not following why the 8250 autosuspend triggers with a serdev
unless your serdev driver runtime suspends.. Or is there maybe some issue
where runtime suspending 8250 still causes register access after that
somehow?

Regards,

Tony


> >> [1]
> >> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=627a545c6bb0c7de09208e6546f5111290477261
> 
