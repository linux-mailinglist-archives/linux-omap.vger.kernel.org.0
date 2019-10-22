Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B501E06E0
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 16:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbfJVO4y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 10:56:54 -0400
Received: from muru.com ([72.249.23.125]:38852 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbfJVO4y (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 10:56:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 34B6E80FA;
        Tue, 22 Oct 2019 14:57:27 +0000 (UTC)
Date:   Tue, 22 Oct 2019 07:56:49 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when
 connected to musb directly
Message-ID: <20191022145649.GI5610@atomide.com>
References: <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe>
 <20191001080339.GF13531@localhost>
 <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
 <20191001164351.GJ5610@atomide.com>
 <20191001220321.GK5610@atomide.com>
 <CAGm1_kv12P1hb7PXSQUo3EXXrCUCQV0ptoQpxewGYHJgROL=cQ@mail.gmail.com>
 <20191002165219.GL5610@atomide.com>
 <CAGm1_kt4W+2uN_6WduUtR+NwKCmQMZwNRHQQ7kVJt0PqmoobaA@mail.gmail.com>
 <CAGm1_kvK+Xkd0Yx8AUvTPMejLTm7jr5+2dzrwNLkG2ivuUC6bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kvK+Xkd0Yx8AUvTPMejLTm7jr5+2dzrwNLkG2ivuUC6bw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [191021 01:40]:
> Hi Tony,
> 
> On Thu, Oct 3, 2019 at 10:39 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > Hi Tony,
> >
> > On Wed, Oct 2, 2019 at 6:52 PM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Yegor Yefremov <yegorslists@googlemail.com> [191002 06:57]:
> > > > On Wed, Oct 2, 2019 at 12:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > The other way to fix this would be to just wake up cpp41 in
> > > > > cppi41_dma_prep_slave_sg() and return NULL so that we can
> > > > > have musb_ep_program() continue with PIO while cppi41 is
> > > > > asleep.
> > > > >
> > > > > Anyways, care to try it out and see if it fixes your issue?
> > > >
> > > > The fix is working but on the first invocation, I get this output
> > > > (minicom provokes the same output):
> > >
> > > > # serialtest.py -c 2 /dev/ttyUSB0 /dev/ttyUSB0
> > > ...
> > > > [  210.940612] [<c065fc94>] (__rpm_callback) from [<c065fd60>]
> > > > (rpm_callback+0x20/0x80)
> > > > [  210.948402] [<c065fd60>] (rpm_callback) from [<c065f7cc>]
> > > > (rpm_resume+0x468/0x7a0)
> > > > [  210.956018] [<c065f7cc>] (rpm_resume) from [<c065fb50>]
> > > > (__pm_runtime_resume+0x4c/0x64)
> > > > [  210.964086] [<c065fb50>] (__pm_runtime_resume) from [<bf020940>]
> > > > (cppi41_dma_prep_slave_sg+0x20/0xfc [cppi41])
> > >
> > > OK so that won't work, thanks for testing. Here's the alternative
> > > patch to try along the lines described above that just wakes up
> > > cppi41 and returns NULL so musb_ep_program() can continue with PIO
> > > until cppi41 is awake.
> >
> > I'm out of the office for some weeks and don't have access to my hw.
> > I'll make the test as soon as I'm back.
> 
> I've tested your patch with both systems (with and without a hub) and
> everything is working as expected.

OK good to hear, I just sent it out with a proper description as:

[PATCH] dmaengine: cppi41: Fix issue with musb and ftdi uart

Regards,

Tony
