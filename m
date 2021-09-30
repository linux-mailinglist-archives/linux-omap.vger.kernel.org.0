Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF1C41D489
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 09:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348577AbhI3HbZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 03:31:25 -0400
Received: from muru.com ([72.249.23.125]:39016 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348737AbhI3HbV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 03:31:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 08AFD8050;
        Thu, 30 Sep 2021 07:30:08 +0000 (UTC)
Date:   Thu, 30 Sep 2021 10:29:37 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] serial: 8250: Implement wakeup for TX and use it for
 8250_omap
Message-ID: <YVVnYfEOw/78ZyI8@atomide.com>
References: <20210930062906.58937-1-tony@atomide.com>
 <20210930062906.58937-3-tony@atomide.com>
 <CAHp75VeZ98Se+BBDdMeJmwu39CbXEL08RF4BR+uu5oJAycEb=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeZ98Se+BBDdMeJmwu39CbXEL08RF4BR+uu5oJAycEb=A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andy Shevchenko <andy.shevchenko@gmail.com> [210930 07:18]:
> On Thu, Sep 30, 2021 at 9:30 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > We can use the wakeup() and uart_start_pending_tx() calls to wake up an
> > idle serial port and send out the pending TX buffer on runtime PM resume.
> 
> > This allows us to remove the depedency to pm_runtime_irq_safe() for
> 
> dependency
> 
> > 8250_omap driver in the following patches.
> >
> > We manage the port runtime_suspended flag in the serial port driver as
> > only the driver knows when the hardware is runtime PM suspended. Note that
> > The current flag for rpm_tx_active cannot be used as it is TX specific
> > for 8250_port.
> >
> > We already have serial8250_start_tx() call serial8250_rpm_get_tx(), and
> > serial8250_stop_tx() call serial8250_rpm_put_tx() to take care of the
> > runtime PM usage count for TX. To have the serial port driver call
> > uart_start_pending_tx() on runtime resume, we must now use just
> > pm_runtime_get() for serial8250_start_tx() instead of the sync version.
> >
> > With these changes we must now also flip 8250_omap driver over to call
> > uart_start_pending_tx(). That's currently the only user of UART_CAP_RPM.
> 
> Do I understand the flow correctly:
>  1) if we suspended, we request resume
>  2) until resume is not fulfilled we return error code to user space
> to try again
> ?

Correct. I think the only thing we can currently do is return -EAGAIN
when the serial port registers are not accessible.

> In this case we have no register access to the powered off device and
> ACPI, for example, may have a chance to resume the device in a
> non-atomic way. Is this the correct interpretation?

Yes that's correct. That works as long as the serial port device driver
implements PM runtime resume function, and then at the end of it calls
uart_start_pending_tx().

Regards,

Tony
