Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC71C3C4E
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 18:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733211AbfJAQn5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 12:43:57 -0400
Received: from muru.com ([72.249.23.125]:35046 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733177AbfJAQn4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Oct 2019 12:43:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6BCCE811B;
        Tue,  1 Oct 2019 16:44:27 +0000 (UTC)
Date:   Tue, 1 Oct 2019 09:43:51 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
        vkoul@kernel.org, Bin Liu <b-liu@ti.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when
 connected to musb directly
Message-ID: <20191001164351.GJ5610@atomide.com>
References: <20190927151935.GD5610@atomide.com>
 <20190927155738.GF5610@atomide.com>
 <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
 <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com>
 <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe>
 <20191001080339.GF13531@localhost>
 <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [191001 09:20]:
> On Tue, Oct 1, 2019 at 10:03 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Sep 30, 2019 at 09:54:11PM +0200, Sebastian Reichel wrote:
> > > Hi,
> > >
> > > On Mon, Sep 30, 2019 at 08:23:30AM -0700, Tony Lindgren wrote:
> >
> > > > Actually playing with the cppi41 timeout might be more suitable here,
> > > > they use the same module clock from what I remember though. So
> > > > maybe increase the cppi41 autosuspend_timeout from 100 ms to 500 ms
> > > > or higher:
> > > >
> > > > # echo 500 > /sys/bus/platform/drivers/cppi41-dma-engine/47400000.dma-controller/power/autosuspend_delay_ms
> > > >
> > > > If changing the autosuspend_timeout_ms value does not help, then
> > > > try setting control to on there.
> > >
> > > I did not check the details, but from the cover-letter this might be
> > > woth looking into:
> > >
> > > https://lore.kernel.org/lkml/20190930161205.18803-1-johan@kernel.org/
> >
> > No, that one should be unrelated as it would only prevent later suspends after
> > a driver has been unbound (and rebound).
> 
> I've tried to increase the autosuspend_delay_ms and to set control to
> "on" but nothing changes. Below you can see the output of my testing
> script [1] (Py2 only). As one can see, the first cycle i.e. after the
> port is open for the first time, fails. But the subsequent cycle is
> successful. If you invoke the script again, everything repeats.
> 
> I've also made printk() in cppi41_run_queue() and it looks like this
> routine will be called from cppi41_dma_issue_pending() only in the
> beginning of the second test cycle.

So sounds like for you intially cppi41_dma_issue_pending() has
!cdd->is_suspended and just adds the request to the queue. And
then cppi41_run_queue() never gets called if this happens while
we have cppi41_runtime_resume() is still running?

Can you check that cppi41_dma_issue_pending() really gets
called for the first request and it adds the request to the
queue by adding a printk to cppi41_dma_issue_pending()?

> [1] http://ftp.visionsystems.de/temp/serialtest.py

For me this script somehow fails to configure the ports with:

$ python2 serialtest.py -c2 /dev/ttyUSB0 /dev/ttyUSB0
Openning one of the serial ports failed
Openning one of the serial ports failed

The permissions are set properly as I have minicom working..
So still no luck reproducing.

Regards,

Tony
