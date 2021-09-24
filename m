Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DBB417741
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 17:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346968AbhIXPKy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 11:10:54 -0400
Received: from muru.com ([72.249.23.125]:36928 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346962AbhIXPKy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 11:10:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 967E880EE;
        Fri, 24 Sep 2021 15:09:48 +0000 (UTC)
Date:   Fri, 24 Sep 2021 18:09:18 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] serial: core: Add new prep_tx for power management
Message-ID: <YU3qHiMNHVz/JX/y@atomide.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-4-tony@atomide.com>
 <YUx3AkT4Du/PT+V5@hovoldconsulting.com>
 <YUyXA5UStMHGQDZZ@atomide.com>
 <YU3isENYUb+aE4qi@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YU3isENYUb+aE4qi@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Johan Hovold <johan@kernel.org> [210924 14:38]:
> On Thu, Sep 23, 2021 at 06:02:27PM +0300, Tony Lindgren wrote:
> > * Johan Hovold <johan@kernel.org> [210923 12:46]:
> > > On Tue, Sep 21, 2021 at 01:33:43PM +0300, Tony Lindgren wrote:
> > > > If the serial driver implements PM runtime with autosuspend, the port may
> > > > be powered off for TX. To wake up the port, let's add new prep_tx() call
> > > > for serial drivers to implement as needed. We call it from serial
> > > > write_room() and write() functions. If the serial port is not enabled,
> > > > we just return 0.
> > > 
> > > This isn't right. If there's room in the driver buffer, there's no
> > > reason to not accept those characters.
> > 
> > Maybe. We might get away with returning zero bytes written in write().
> > But to me it seems better to stop things early when write is known
> > to not succeed.
> 
> But you shouldn't return zero from write() either. If there's room in
> the write buffer we accept the data.

And then waking up the serial port takes several tens of ms and the
buffer is full and we still need to deal with it :) But yeah I see
your point for the write buffer.

> > > It's the drivers responsibility to resume writing when write() is
> > > called and that me need to be done in a runtime resume callback in case
> > > the device is suspended.
> > 
> > I think we currently need to return zero bytes written from write()
> > when the serial port is not usable.
> > 
> > I don't think we can return a fake number of bytes written from write().
> 
> It's not a fake number. It's similar to if you have a port that is
> stalled due to flow control. We buffer the data and continue writing
> when the other end is ready to accept more.

OK. So based on what you suggested earlier I'll take a look at moving
the wake-up to __uart_start(), then have the device driver runtime PM
resume call uart_start() again. Looks like uart_start() is a void
function anyways.. If you have some better ideas there, please let me
know.

> > > No need to be patching line disciplines for this.
> > 
> > Do you see issues with handling the errors in line disciplines?
> 
> It's just conceptually wrong to push retrying up the stack, possible all
> the way to user space in case of non-blocking opens, just because the
> device isn't already runtime active.

Yes, I don't see a way around that currently. Maybe if we start making
use of uart_tx_stopped() or something similar that could be simplified.
And we'll be still hit these line discipline error handling cases
anyways depending on how long the serial port wake up takes.

Regards,

Tony
