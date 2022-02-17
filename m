Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4774B9A99
	for <lists+linux-omap@lfdr.de>; Thu, 17 Feb 2022 09:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237107AbiBQIIY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Feb 2022 03:08:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236512AbiBQIIX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Feb 2022 03:08:23 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C72B327DF38
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 00:08:07 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CEC8B80E4;
        Thu, 17 Feb 2022 08:07:23 +0000 (UTC)
Date:   Thu, 17 Feb 2022 10:08:05 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <Yg4CZb1Jy2M8wwn/@atomide.com>
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com>
 <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
 <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220216 15:51]:
> Le 16/02/2022 à 12:46, Tony Lindgren a écrit :
> > Not really but if you can please test again with the ti-sysc patch,
> > 8250_omap patch and with your serdev uart dma disabled with
> > delete-property?
> 
> I had a crash but on close path:
> 
> [<c06af3b0>] (omap8250_set_mctrl) from [<c069fd38>] (uart_update_mctrl+0x3c/0x48)
> [<c069fd38>] (uart_update_mctrl) from [<c06a2ac8>] (uart_dtr_rts+0x54/0x9c)
> [<c06a2ac8>] (uart_dtr_rts) from [<c068b0d0>] (tty_port_shutdown+0x78/0x9c)
> [<c068b0d0>] (tty_port_shutdown) from [<c068b8ec>] (tty_port_close+0x3c/0x74)
> [<c068b8ec>] (tty_port_close) from [<c06b3b4c>] (ttyport_close+0x40/0x58)
> [<c06b3b4c>] (ttyport_close) from [<c092aca4>] (gnss_serial_close+0x14/0x24)
> [<c092aca4>] (gnss_serial_close) from [<c092a4a0>] (gnss_release+0x44/0x64)
> [<c092a4a0>] (gnss_release) from [<c036b7f4>] (__fput+0x78/0x23c)
> [<c036b7f4>] (__fput) from [<c0246308>] (task_work_run+0x90/0xbc)
> [<c0246308>] (task_work_run) from [<c0209c0c>] (do_work_pending+0x558/0x560)
> [<c0209c0c>] (do_work_pending) from [<c02000cc>] (slow_work_pending+0xc/0x20)
> 
> My test is starting gpsmon /dev/gnss0 several time.

OK sounds like a good test.

We can have two kind of issues, either runtime PM is not enabled, or
runtime PM is enabled but the uart registers have not been yet inialized.

On probe, omap8250_set_mctrl() can get called with runtime PM enabled, but
without omap8250_restore_regs() having been called yet. It seems we rely
on a bootloader initialized uart register state here currently.

We don't have omap8250_restore_regs() called on probe until at
omap_8250_set_termios(). But before we alread have this:

uart_add_one_port()
  uart_configure_port()
    omap8250_set_mctrl()

So that explains at least some issues. I'll take a look at what's the best
way to fix this.

I'm not quite sure why enabling dma on dra7 causes the clk disable errors,
maybe it's related to priv->delayed_restore set in some cases. Or some
different uart register init for dma.

For your issue with close, I wonder if it's related to autoidling the uarts?
The test script I posted does that for all the uarts, probably best not
to do that until the other issues are sorted out :) If so, maybe the issue
on close is that the uart has already autoidled.

Regards,

Tony
