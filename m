Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC7441774F
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 17:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346995AbhIXPRq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 11:17:46 -0400
Received: from muru.com ([72.249.23.125]:36942 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346962AbhIXPRq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 11:17:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C9FB380EE;
        Fri, 24 Sep 2021 15:16:40 +0000 (UTC)
Date:   Fri, 24 Sep 2021 18:16:10 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] serial: 8250: Implement prep_tx for power management
Message-ID: <YU3ruj32L/iaZS1h@atomide.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-5-tony@atomide.com>
 <YUx399WBrMiZDhno@hovoldconsulting.com>
 <YUyXwJnmPhm1940B@atomide.com>
 <YU3kPHg2qLr//HEF@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YU3kPHg2qLr//HEF@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Johan Hovold <johan@kernel.org> [210924 14:44]:
> On Thu, Sep 23, 2021 at 06:05:36PM +0300, Tony Lindgren wrote:
> > * Johan Hovold <johan@kernel.org> [210923 12:50]:
> > > On Tue, Sep 21, 2021 at 01:33:44PM +0300, Tony Lindgren wrote:
> > > > +static int serial8250_prep_tx(struct uart_port *port)
> > > > +{
> > > > +	struct uart_8250_port *up = up_to_u8250p(port);
> > > > +	struct device *dev = up->port.dev;
> > > > +	int err;
> > > > +
> > > > +	if (!(up->capabilities & UART_CAP_RPM))
> > > > +		return 0;
> > > > +
> > > > +	if (!pm_runtime_suspended(dev)) {
> > > > +		pm_runtime_mark_last_busy(dev);
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	err = pm_request_resume(dev);
> > > > +	if (err < 0) {
> > > > +		dev_warn(dev, "prep_tx wakeup failed: %d\n", err);
> > > > +		return err;
> > > > +	}
> > > 
> > > How is this supposed to work without a runtime PM usage-counter
> > > increment? What's to prevent the port from suspending again while it's
> > > transmitting?
> > 
> > Hmm yeah we should at pm_runtime_get() and pm_runtime_put() to write()
> > unless serial8250_rpm_get() and serial8250_rpm_put() are doing it.
> 
> If you do the put after just buffering the data it doesn't really solve
> anything.

Right, sounds like we currently rely on the autosuspend_timeout
there.

> > Or pair prep with finish and deal with the usage count there.
> 
> Problem is where to call it from. How do you tell the device is done
> transmitting? And how should we deal with flow control? Etc.

Maybe if the device driver needs to call uart_start() also from runtime
PM idle function and if no data allow suspend. Then if there is
more data, uart_write() calls uart_start() again, device wakes up
and so on.

Regards,

Tony
