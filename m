Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A35E1EBD2D
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jun 2020 15:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgFBNhF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jun 2020 09:37:05 -0400
Received: from muru.com ([72.249.23.125]:56698 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbgFBNhE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 2 Jun 2020 09:37:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 97A0D80C5;
        Tue,  2 Jun 2020 13:37:53 +0000 (UTC)
Date:   Tue, 2 Jun 2020 06:36:59 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] serial: 8250_port: Fix imprecise external abort for
 mctrl if inactive
Message-ID: <20200602133659.GD37466@atomide.com>
References: <20200602001813.30459-1-tony@atomide.com>
 <20200602080811.GI19480@localhost>
 <CAHp75Vfi5nDgwT10J_EKYn90vGuiL1hyfre+t_w_OFREFY-Tqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfi5nDgwT10J_EKYn90vGuiL1hyfre+t_w_OFREFY-Tqg@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andy Shevchenko <andy.shevchenko@gmail.com> [200602 08:33]:
> On Tue, Jun 2, 2020 at 11:09 AM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, Jun 01, 2020 at 05:18:13PM -0700, Tony Lindgren wrote:
> 
> ...
> 
> > There's shouldn't be anything fundamental preventing you from adding the
> > missing resume calls to the mctrl paths even if it may require reworking
> > (and fixing) the whole RPM implementation (which would be a good thing
> > of course).
> 
> Yes, for serial core I have long standing patch series to implement
> RPM (more or less?) properly.

Yeah let's try after the merge window.

Not sure what else to do with the fix though. We currently have
8250_port.c not really aware of the hardare state for PM runtime at
least for the hang-up path.

> However, OMAP is a beast which prevents us to go due to a big hack
> called pm_runtime_irq_safe().
> Tony is aware of this and I think the above is somehow related to removal of it.

Now that we can detach and reattach the kernel serial console,
there should not be any need for pm_runtime_irq_safe() anymore :)

And the UART wake-up from deeper idle states can only happen with
help of external hardware like GPIO controller or pinctrl controller.

And for the always-on wake-up interrupt controllers we have the
Linux generic wakeirqs to wake-up serial device on events.

So I think the way to procedd with pm_runtime_irq_safe() removal
for serial drivers is to block serial PM runtime unless we have a
wakeirq configured for omaps in devicetree. In the worst case the
regression is that PM runtime for serial won't work unless properly
configured.

And the UART wakeup latency will be a bit longer compared to
pm_runtime_irq_safe() naturally.

> But I completely agree that the goal is to get better runtime PM
> implementation over all.

Yes agreed.

Regards,

Tony
