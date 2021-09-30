Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C620E41D47E
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 09:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348599AbhI3H1w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 03:27:52 -0400
Received: from muru.com ([72.249.23.125]:38994 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348693AbhI3H1w (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 03:27:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9BD358050;
        Thu, 30 Sep 2021 07:26:38 +0000 (UTC)
Date:   Thu, 30 Sep 2021 10:26:07 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] serial: core: Add wakeup() and start_pending_tx()
 for power management
Message-ID: <YVVmj9kJg9Mb5OR+@atomide.com>
References: <20210930062906.58937-1-tony@atomide.com>
 <20210930062906.58937-2-tony@atomide.com>
 <CAHp75Ve4RTSdbQYA_u8vs=U75KsNdrm9EqFASAGf4rFKSqVWvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve4RTSdbQYA_u8vs=U75KsNdrm9EqFASAGf4rFKSqVWvQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andy Shevchenko <andy.shevchenko@gmail.com> [210930 07:11]:
> On Thu, Sep 30, 2021 at 9:30 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > If the serial driver implements PM runtime with autosuspend, the port may
> > be powered down on TX. To wake up the port, let's add new wakeup() call
> > for serial drivers to implement as needed. We can call wakeup() from
> > __uart_start() and flow control related functions before attempting to
> > write to the serial port registers.
> >
> > Let's keep track of the serial port with a new runtime_suspended flag
> > that the device driver runtime PM suspend and resume can manage with
> > atomic_set(). This is because only the device driver knows what the
> > device runtime PM state as in Documentation/power/runtime_pm.rst
> > under "9. Autosuspend, or automatically-delayed suspend" for locking.
> >
> > To allow the serial port drivers to send out pending tx on runtime PM
> > resume, let's add start_pending_tx() as suggested by Johan Hovold
> > <johan@kernel.org>.
> 
> ...
> 
> > +  wakeup(port)
> > +       Wake up port if it has been runtime PM suspended.
> > +
> > +       Locking: port->lock taken.
> > +
> > +       Interrupts: locally disabled.
> 
> > +       This call must not sleep
> 
> If it's suspended via ACPI methods, it can't be resumed here, right?

It should work for that too assuming the runtime PM resume function is
implemented.

> Only what we can do is to schedule a resume, but it means we may not
> access registers immediately after and we have to be sure that the
> device is resumed.

Yeah the only thing we do in the 8250_port wakeup() is schedule a
resume if needed. Then the 8250 port device driver can call
start_pending_tx() at the end of it's runtime PM resume function.

> Dead end?

I don't think so :) In serial_core we bail out on uart_port_wakeup()
errors before register access. But maybe I missed some more moles to
whack there :)

Regards,

Tony
