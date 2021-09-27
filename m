Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D364195E8
	for <lists+linux-omap@lfdr.de>; Mon, 27 Sep 2021 16:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbhI0OH2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Sep 2021 10:07:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:52178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234461AbhI0OH1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Sep 2021 10:07:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 457AD60F46;
        Mon, 27 Sep 2021 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632751549;
        bh=6VROViTQrHqhxIEB6/H5ChtA2FaNKxLZXhP74mU/Srk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zs7AHqdCHiOKiAq0eNsgaiimlkEPCatu+nACNpXC3yTOp8BJYfDeYp6DThh5oRmUX
         8ayUntOGkOtmubwGLS79GH3JdZz0FD5+YMIwuUJqN58Nu2zeKSRoZtpsnMhK7NIZo8
         Yy0gqjkVUC84QQnC46OVh2+L7H2j7a1EltC/hdwIhHP+F4FgrLXTOSJp06MITtZVR4
         OqVuIyfSIMlxSfSUPofKTQ82EB/2Dxfou6HDpph4EwPxD9p72xjCOfBS/7vyKWvLpm
         id1tzNao8SFJzNu2uNrra3RLxADwHR1Izyv7wE9NFrc3iWA9nBjMkCAYFe9ZvP2TMz
         x5KMD90mWrvyw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mUrGN-0001wu-UU; Mon, 27 Sep 2021 16:05:48 +0200
Date:   Mon, 27 Sep 2021 16:05:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] serial: core: Add new prep_tx for power management
Message-ID: <YVHPu7KGYDWOCav9@hovoldconsulting.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-4-tony@atomide.com>
 <YUx3AkT4Du/PT+V5@hovoldconsulting.com>
 <YUyXA5UStMHGQDZZ@atomide.com>
 <YU3isENYUb+aE4qi@hovoldconsulting.com>
 <YU3qHiMNHVz/JX/y@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YU3qHiMNHVz/JX/y@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 24, 2021 at 06:09:18PM +0300, Tony Lindgren wrote:
> * Johan Hovold <johan@kernel.org> [210924 14:38]:
> > On Thu, Sep 23, 2021 at 06:02:27PM +0300, Tony Lindgren wrote:

> > > > No need to be patching line disciplines for this.
> > > 
> > > Do you see issues with handling the errors in line disciplines?
> > 
> > It's just conceptually wrong to push retrying up the stack, possible all
> > the way to user space in case of non-blocking opens, just because the
> > device isn't already runtime active.
> 
> Yes, I don't see a way around that currently. Maybe if we start making
> use of uart_tx_stopped() or something similar that could be simplified.
> And we'll be still hit these line discipline error handling cases
> anyways depending on how long the serial port wake up takes.

I didn't really look at the ldisc change so not saying it isn't needed
for other reasons such as a full write buffer. But then I'd expect it to
be presented as a bug fix (perhaps it was).

Johan
