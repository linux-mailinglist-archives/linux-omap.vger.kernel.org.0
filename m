Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2C042ED53
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 11:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbhJOJPw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 05:15:52 -0400
Received: from muru.com ([72.249.23.125]:44812 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231273AbhJOJPw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 05:15:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6F00980F1;
        Fri, 15 Oct 2021 09:14:17 +0000 (UTC)
Date:   Fri, 15 Oct 2021 12:13:43 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] serial: core: Add wakeup() and start_pending_tx()
 for power management
Message-ID: <YWlGR/xVJjX8q2j5@atomide.com>
References: <20210930062906.58937-1-tony@atomide.com>
 <20210930062906.58937-2-tony@atomide.com>
 <YWbSJCEkqQ0KzQ5E@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWbSJCEkqQ0KzQ5E@kroah.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Greg Kroah-Hartman <gregkh@linuxfoundation.org> [211013 12:34]:
> On Thu, Sep 30, 2021 at 09:29:03AM +0300, Tony Lindgren wrote:
> > --- a/drivers/tty/serial/serial_core.c
> > +++ b/drivers/tty/serial/serial_core.c
> > @@ -91,6 +91,23 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
> >  	return state->uart_port;
> >  }
> >  
> > +/*
> > + * This routine can be used before register access to wake up a serial
> > + * port that has been runtime PM suspended by the serial port driver.
> > + * Note that the runtime_suspended flag is managed by the serial port
> > + * device driver runtime PM.
> > + */
> > +static int uart_port_wakeup(struct uart_port *port)
> > +{
> > +	if (!atomic_read(&port->runtime_suspended))
> > +		return 0;
> 
> And if the value changes right after you read this?
> 
> Why not use a real lock here?  Don't use an atomic if you don't need it.

Yeah good point, we should just use port->lock.

Regards,

Tony
