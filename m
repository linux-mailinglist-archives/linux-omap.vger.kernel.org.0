Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66CB4B431B
	for <lists+linux-omap@lfdr.de>; Mon, 14 Feb 2022 08:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240349AbiBNHuK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Feb 2022 02:50:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiBNHuK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Feb 2022 02:50:10 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 944215AEE3
        for <linux-omap@vger.kernel.org>; Sun, 13 Feb 2022 23:50:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 75F2380DE;
        Mon, 14 Feb 2022 07:49:25 +0000 (UTC)
Date:   Mon, 14 Feb 2022 09:50:00 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     qianfan <qianfanguijin@163.com>
Cc:     linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
Subject: Re: OMAP GPIO ready too later
Message-ID: <YgoJqP1xBsuqX2ui@atomide.com>
References: <63abe475-710f-9ff5-ef20-c78b2a3d5e5c@163.com>
 <YfubSOB+uq9jYf/N@atomide.com>
 <bb16001d-4a1b-f842-9445-7305e3496997@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb16001d-4a1b-f842-9445-7305e3496997@163.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* qianfan <qianfanguijin@163.com> [220212 02:18]:
> 
> 在 2022/2/3 17:07, Tony Lindgren 写道:
> > Hi,
> > 
> > * qianfan <qianfanguijin@163.com> [220119 08:36]:
> > > Hi everyone:
> > > 
> > > On my board there has a gpio watchdong connected on am3358. And I found that
> > > the omap gpio device ready too later so it takes about 5 seconds when the
> > > gpio-wdt is ready.
> > > 
> > > I had tested on some version of linux, check when the OMAP GPIO is ready.
> > > Next is the log:
> > > 
> > > v4.19 [    0.195191] OMAP GPIO hardware version 0.1
> > > 
> > > v5.4  [    1.168868] OMAP GPIO hardware version 0.1
> > > 
> > > v5.9  [    4.598052] OMAP GPIO hardware version 0.1
> > > 
> > > v5.15 [    1.253851] OMAP GPIO hardware version 0.1
> > > 
> > > I can't find which commit slowdown omap gpio driver. could you please give
> > > me some advice?
> > We've moved to probe pretty much everything at normal module_init time
> > instead of trying to probe everything early. Only clocks and system timers
> > need to be probed early for the omap variants.
> > 
> > One of the reasons for the device drivers probing later on during the boot
> > is caused by drivers/bus/ti-sysc.c. As ti-sysc is the parent device on the
> > interconnect, none of it's child devices probe before it. And there should
> > not be any need to probe ti-sysc early. The total boot-up time should be
> > about the same, just the probe order has changed. If there are issues with
> > the boot-up time in general, then that's a bug.
> > 
> > Maybe you want to configure the watchdog in the bootloader initially until
> > the Linux device drivers get probed?
> 
> Yes, the gpio watchdog is alived on bootloader, I want find a good way to
> feed it until linux driver ready.  gpio-wdt.c has an option
> CONFIG_GPIO_WATCHDOG_ARCH_INITCALL which will register gpio-wdt driver on
> arch_innitcall, but this feature doesn't work on am335x platform due to the
> gpio driver ready too later.

Well seems like the boottime of 1.25 seconds to having the gpio probed should
be way longer than your bootloader configured watchdog timeout :) What do you
have the bootloader set the watchdog timeout?

Regards,

Tony
