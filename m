Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269E641619F
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 17:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241833AbhIWPEB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 11:04:01 -0400
Received: from muru.com ([72.249.23.125]:36512 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241798AbhIWPEB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Sep 2021 11:04:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1CA4580C0;
        Thu, 23 Sep 2021 15:02:57 +0000 (UTC)
Date:   Thu, 23 Sep 2021 18:02:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] serial: core: Add new prep_tx for power management
Message-ID: <YUyXA5UStMHGQDZZ@atomide.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-4-tony@atomide.com>
 <YUx3AkT4Du/PT+V5@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUx3AkT4Du/PT+V5@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Johan Hovold <johan@kernel.org> [210923 12:46]:
> On Tue, Sep 21, 2021 at 01:33:43PM +0300, Tony Lindgren wrote:
> > If the serial driver implements PM runtime with autosuspend, the port may
> > be powered off for TX. To wake up the port, let's add new prep_tx() call
> > for serial drivers to implement as needed. We call it from serial
> > write_room() and write() functions. If the serial port is not enabled,
> > we just return 0.
> 
> This isn't right. If there's room in the driver buffer, there's no
> reason to not accept those characters.

Maybe. We might get away with returning zero bytes written in write().
But to me it seems better to stop things early when write is known
to not succeed.

> It's the drivers responsibility to resume writing when write() is
> called and that me need to be done in a runtime resume callback in case
> the device is suspended.

I think we currently need to return zero bytes written from write()
when the serial port is not usable.

I don't think we can return a fake number of bytes written from write().

And even if we could return a fake number of bytes written, we could
run into issues doing the real write to the serial port.

> No need to be patching line disciplines for this.

Do you see issues with handling the errors in line disciplines?

Regards,

Tony
