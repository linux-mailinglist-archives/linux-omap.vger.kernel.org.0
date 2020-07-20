Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C43226225
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 16:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbgGTOaa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 10:30:30 -0400
Received: from muru.com ([72.249.23.125]:37538 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgGTOaa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Jul 2020 10:30:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2115E81BA;
        Mon, 20 Jul 2020 14:30:28 +0000 (UTC)
Date:   Mon, 20 Jul 2020 07:30:33 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Carlos Hernandez <ceh@ti.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
Message-ID: <20200720143033.GD10993@atomide.com>
References: <20200713162601.6829-1-tony@atomide.com>
 <1ac1ac81-1335-8ba2-590c-8f57c2df1910@linaro.org>
 <f96cb9d8-c940-672a-b1d2-a26570d6f775@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f96cb9d8-c940-672a-b1d2-a26570d6f775@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carlos Hernandez <ceh@ti.com> [200717 21:35]:
> On 7/17/20 6:29 AM, Daniel Lezcano wrote:
> > On 13/07/2020 18:26, Tony Lindgren wrote:
> > > Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
> > > Reported-by: Carlos Hernandez <ceh@ti.com>
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > Carlos, were you able to test this patch ?
> 
> Tested the patch on top of 5.8-rc5.
> 
> cbdb2617290d (HEAD) clocksource/drivers/timer-ti-dm: Fix suspend and resume
> for am3 and am4
> 11ba468877bb (tag: v5.8-rc5) Linux 5.8-rc5
> 
> It works on am335x-evm but fails on am437x-evm

Thanks for testing.

> am4:
> 
> CCCCCCCC** 1196 printk messages dropped **

The above does not look normal..

> 44000000.ocp:L3 Custom Error: MASTER DSS TARGET GPMC (Read)
> ** 34 printk messages dropped **

..but the above points to the GPMC module failing to suspend.
This seems to be some other GPMC specific issue not related
to the system timers.

FYI, I have not seen the error above with am437x-sk-evm. But
then again, the sk-evm is probably not using GPMC.

Regards,

Tony
