Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AEF4176EB
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 16:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346775AbhIXOjH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 10:39:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:38060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346731AbhIXOjH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 10:39:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E40660F9C;
        Fri, 24 Sep 2021 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632494254;
        bh=BK3v+VyNJVPw8v2HTHk9VkzAkGeHSOjxEF6PdFPg4/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mNnuhKLE1smaILowt3dkpobiGHmOMHiNuhHKko1SGVbJaNUflMK9ORhkRTs7AfYsP
         ysKoEoeeUSgsSHgOre+kfomjyb3+c5/BtWie8oLdgwyYMii6JZn7r2g3AZ+XSj3nly
         jrC7SIxTXdnYozdluz/AkaLO5V4g3wKnqhBm8wTJNP6SJ9yXpyKLB5PXmXvNMwLvEP
         23u0kJT2Pd5qeULtU31rAsS9shI8qBPCC9ZHLqKdtDOuPJ5Qz799tlf/Ja9SAz2E/4
         ys/dy+V2cufXUmoi9lu+kQ4Rltd9np4+X6Sy6sGsdBcJ+qPOx/nXOI7EhDhY1izzsZ
         QjlxREaYvIJyw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mTmKW-0001Ow-4y; Fri, 24 Sep 2021 16:37:36 +0200
Date:   Fri, 24 Sep 2021 16:37:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] serial: core: Add new prep_tx for power management
Message-ID: <YU3isENYUb+aE4qi@hovoldconsulting.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-4-tony@atomide.com>
 <YUx3AkT4Du/PT+V5@hovoldconsulting.com>
 <YUyXA5UStMHGQDZZ@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUyXA5UStMHGQDZZ@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 23, 2021 at 06:02:27PM +0300, Tony Lindgren wrote:
> * Johan Hovold <johan@kernel.org> [210923 12:46]:
> > On Tue, Sep 21, 2021 at 01:33:43PM +0300, Tony Lindgren wrote:
> > > If the serial driver implements PM runtime with autosuspend, the port may
> > > be powered off for TX. To wake up the port, let's add new prep_tx() call
> > > for serial drivers to implement as needed. We call it from serial
> > > write_room() and write() functions. If the serial port is not enabled,
> > > we just return 0.
> > 
> > This isn't right. If there's room in the driver buffer, there's no
> > reason to not accept those characters.
> 
> Maybe. We might get away with returning zero bytes written in write().
> But to me it seems better to stop things early when write is known
> to not succeed.

But you shouldn't return zero from write() either. If there's room in
the write buffer we accept the data.
 
> > It's the drivers responsibility to resume writing when write() is
> > called and that me need to be done in a runtime resume callback in case
> > the device is suspended.
> 
> I think we currently need to return zero bytes written from write()
> when the serial port is not usable.
> 
> I don't think we can return a fake number of bytes written from write().

It's not a fake number. It's similar to if you have a port that is
stalled due to flow control. We buffer the data and continue writing
when the other end is ready to accept more.

> And even if we could return a fake number of bytes written, we could
> run into issues doing the real write to the serial port.
>
> > No need to be patching line disciplines for this.
> 
> Do you see issues with handling the errors in line disciplines?

It's just conceptually wrong to push retrying up the stack, possible all
the way to user space in case of non-blocking opens, just because the
device isn't already runtime active.

Johan
