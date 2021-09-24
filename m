Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FBD4176FB
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 16:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346817AbhIXOpo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 10:45:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:39440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231627AbhIXOpm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 10:45:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CE9060F39;
        Fri, 24 Sep 2021 14:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632494649;
        bh=HaXdsYXMR1rKuirPTHI25kms2F3oSSEEkJuWdfagNIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RkKPYwfVdsTPbMnQtRbBwAXJYAcGu19rLewUX3LIXYujJaTZWel0+Y0+mdqYMds3U
         LUxiyqos5L6e8nP8TQQneAq66mX5HNME9Wzx8KjFY+CL4EHmKclYcsfX8ZopPvH2v9
         wMTBwHxeBDweZ3r2W60DWJh9HMJiYYX9VefwWS7Qq1xGkWq0Z8D0Bw28aKqLp2LjPg
         pWvbjbLi2Gcw/wcKlwrCN/GAFCZdMwSpfV8frqG4S4vt3wsON5VY7evxUaBnsk+u4g
         +89QW71H4g4Dl5mkhvC+IV7TuYavnKbtRzCGtbG3Po5J9dYEW7inBQX9YwCzd2l35n
         WjJ2rqOarrxJA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mTmQu-0001RU-4e; Fri, 24 Sep 2021 16:44:12 +0200
Date:   Fri, 24 Sep 2021 16:44:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] serial: 8250: Implement prep_tx for power management
Message-ID: <YU3kPHg2qLr//HEF@hovoldconsulting.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-5-tony@atomide.com>
 <YUx399WBrMiZDhno@hovoldconsulting.com>
 <YUyXwJnmPhm1940B@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUyXwJnmPhm1940B@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 23, 2021 at 06:05:36PM +0300, Tony Lindgren wrote:
> * Johan Hovold <johan@kernel.org> [210923 12:50]:
> > On Tue, Sep 21, 2021 at 01:33:44PM +0300, Tony Lindgren wrote:
> > > +static int serial8250_prep_tx(struct uart_port *port)
> > > +{
> > > +	struct uart_8250_port *up = up_to_u8250p(port);
> > > +	struct device *dev = up->port.dev;
> > > +	int err;
> > > +
> > > +	if (!(up->capabilities & UART_CAP_RPM))
> > > +		return 0;
> > > +
> > > +	if (!pm_runtime_suspended(dev)) {
> > > +		pm_runtime_mark_last_busy(dev);
> > > +		return 0;
> > > +	}
> > > +
> > > +	err = pm_request_resume(dev);
> > > +	if (err < 0) {
> > > +		dev_warn(dev, "prep_tx wakeup failed: %d\n", err);
> > > +		return err;
> > > +	}
> > 
> > How is this supposed to work without a runtime PM usage-counter
> > increment? What's to prevent the port from suspending again while it's
> > transmitting?
> 
> Hmm yeah we should at pm_runtime_get() and pm_runtime_put() to write()
> unless serial8250_rpm_get() and serial8250_rpm_put() are doing it.

If you do the put after just buffering the data it doesn't really solve
anything.

> Or pair prep with finish and deal with the usage count there.

Problem is where to call it from. How do you tell the device is done
transmitting? And how should we deal with flow control? Etc.

Johan
