Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9505E231DB5
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jul 2020 13:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgG2LzQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jul 2020 07:55:16 -0400
Received: from muru.com ([72.249.23.125]:38480 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2LzQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Jul 2020 07:55:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 12063805C;
        Wed, 29 Jul 2020 11:55:13 +0000 (UTC)
Date:   Wed, 29 Jul 2020 04:55:25 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: BUG: omap5: v5.8-rc7 boot fails
Message-ID: <20200729115525.GG2811@atomide.com>
References: <3FEECC44-3156-4786-8DF9-149F8CA9B41D@goldelico.com>
 <20200728082348.GD2811@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728082348.GD2811@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200728 08:23]:
> * H. Nikolaus Schaller <hns@goldelico.com> [200727 20:51]:
> > Hi Tony,
> > after trying v5.8-rc7 the Pyra boot hangs after ca. 3 seconds
> > (a little random what the last log line is).
> > 
> > I could bisect it to:
> > 
> > 6cfcd5563b4fadbf49ba8fa481978e5e86d30322 is the first bad commit
> > commit 6cfcd5563b4fadbf49ba8fa481978e5e86d30322
> > Author: Tony Lindgren <tony@atomide.com>
> > Date:   Mon Jul 13 09:26:01 2020 -0700
> > 
> >     clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4
> > 
> > And a git revert makes it boot again.
> > 
> > I haven't had time to do more tests (e.g. with omap3/4 or on omap5uevm).
> 
> Oops sorry about that, I'll take a look.

This fixes booting for me, but I still need to check if we also
need to enable before the reset. And then this needs to be tested
on all the related SoCs again.

Regards,

Tony

8< ------------------
diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -409,8 +409,8 @@ static int __init dmtimer_systimer_setup(struct device_node *np,
 	t->wakeup = regbase + _OMAP_TIMER_WAKEUP_EN_OFFSET;
 	t->ifctrl = regbase + _OMAP_TIMER_IF_CTRL_OFFSET;
 
-	dmtimer_systimer_enable(t);
 	dmtimer_systimer_reset(t);
+	dmtimer_systimer_enable(t);
 	pr_debug("dmtimer rev %08x sysc %08x\n", readl_relaxed(t->base),
 		 readl_relaxed(t->base + t->sysc));
 
