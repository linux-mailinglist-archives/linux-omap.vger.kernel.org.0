Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821A2435AF4
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 08:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhJUGfQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 02:35:16 -0400
Received: from muru.com ([72.249.23.125]:46880 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231443AbhJUGfP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 21 Oct 2021 02:35:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3197480C1;
        Thu, 21 Oct 2021 06:33:30 +0000 (UTC)
Date:   Thu, 21 Oct 2021 09:32:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] serial: core: Add wakeup() and start_pending_tx()
 for power management
Message-ID: <YXEJlyuGmhwNSGyb@atomide.com>
References: <20211015112626.35359-1-tony@atomide.com>
 <20211015112626.35359-2-tony@atomide.com>
 <YW0dkD3jYCsHYs6p@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW0dkD3jYCsHYs6p@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Johan Hovold <johan@kernel.org> [211018 07:09]:
> On Fri, Oct 15, 2021 at 02:26:23PM +0300, Tony Lindgren wrote:
> > @@ -1067,6 +1116,11 @@ uart_tiocmset(struct tty_struct *tty, unsigned int set, unsigned int clear)
> >  	if (!uport)
> >  		goto out;
> >  
> > +	if (uart_port_wakeup(uport) < 0) {
> > +		ret = -EAGAIN;
> > +		goto out;
> > +	}
> 
> ...this isn't right. You should just resume the device synchronously
> here and not return some random error to user space, which it is
> unlikely to even handle.

OK I'll check what we can already wake synchronously :)

> Now this may require moving more of the runtime PM into serial core,
> where it should have been added in the first place, due to a lot of the
> serial callbacks being called with the port spin lock held.

Yup.. So the good news is that Andy already has the generic serial layer
runtime PM changes in his WIP tree. I'll take a look if we can already
add some of that without bringing in all the other dependencies.

> The current implementation is just broken. Take uart_dtr_rts(), for
> example, nothing makes sure that the device is active before accessing
> the modem control registers there. You're currently just relying on
> luck and pm_runtime_irq_safe() (which you are now trying to remove).

Yeah agreed, it's broken. It is usable for at least two limited cases
though, which are a serial port console with PM, and bluetooth with PM.

The serial port console typically only has RX and TX lines connected, and
the bluetooth typically uses out-of-band GPIO pins for wakeups.

To enable the serial port PM in general, we need to make sure it is
enabled only for applications where it can be used. So it needs to be
enabled from the user space as we do for the serial console, or enabled
from the consumer device driver for things like bluetooth.

Sure the TX should work in all other cases too..

> > +
> > +	if (uart_port_wakeup(uport) < 0)
> > +		goto out;
> > +
> >  	uart_port_dtr_rts(uport, raise);
> > +out:
> >  	uart_port_deref(uport);
> >  }
> 
> Heh, here you do try to do something about dtr_rts(), but you can't just
> ignore the request and wish for the best in case the device is
> suspended. :) There needs to be a synchronous resume here too.

Well for the current use cases the port should be already awake at
this point :) But yeah, for the TX path we should be able to handle
all the cases.

Regards,

Tony
