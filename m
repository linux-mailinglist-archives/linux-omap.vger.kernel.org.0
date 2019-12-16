Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89BCD120913
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 15:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfLPO6z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 09:58:55 -0500
Received: from muru.com ([72.249.23.125]:48456 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728008AbfLPO6z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Dec 2019 09:58:55 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7D591810D;
        Mon, 16 Dec 2019 14:59:33 +0000 (UTC)
Date:   Mon, 16 Dec 2019 06:58:51 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Message-ID: <20191216145851.GN35479@atomide.com>
References: <20191215173817.47918-1-tony@atomide.com>
 <20191215230331.645b9064@aktux>
 <20191216030948.GL35479@atomide.com>
 <20191216031637.GM35479@atomide.com>
 <20191216130536.5935a587@kemnade.info>
 <CAHCN7xJ-ndGxz0DYSwnuDi+4Hu349RTCzHjsspx2evMvLDtDqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJ-ndGxz0DYSwnuDi+4Hu349RTCzHjsspx2evMvLDtDqA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191216 13:58]:
> On Mon, Dec 16, 2019 at 7:48 AM Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > On Sun, 15 Dec 2019 19:16:37 -0800
> > Tony Lindgren <tony@atomide.com> wrote:
> >
> > > * Tony Lindgren <tony@atomide.com> [191216 03:10]:
> > > > Hi,
> > > >
> > > > * Andreas Kemnade <andreas@kemnade.info> [191215 22:04]:
> > > > > On Sun, 15 Dec 2019 09:38:17 -0800
> > > > > If I remember correctly this thing is critical to get the hwmod out of
> > > > > reset but I need to examine that again:
> > > >
> > > > Thanks for testing, yes that's what I thought might cause it
> > > > too, but nope :)
> > > >
> > > > We currently disable interrupts for some reason after
> > > > the first read. That won't play with runtime PM autosuspend
> > > > at all as we never enable them again until the device has
> > > > idled. Can you try the following additional patch on top?
> > >
> > > And we should probably do the following too to make sure
> > > the mode is initialized before we call runtime PM.
> > >
> > CM_FCLKEN1/IDLEST1_CORE seem to behave, reading also works
> >
> > With these two additional patches this deserves a
> > Tested-By: Andreas Kemnade <andreas@kemnade.info> # gta04
> 
> Tony,
> 
> Any way you can do a V2 patch with the other stuff added?  Pulling the
> patches from gmail doesn't work.  I think G-mail does something weird
> because they don't apply cleanly, so I have to download the patches
> from patchwork.  I should be able to test it today.

OK sent out v2 with the two change folded in. The ti,mode = "1w"
still needs to be tested if anybody has a sensor to test with.
I verified the battery ds2502 gets properly detected on droid4 battery,
in "1w" mode, but so far no luck actually reading the nvmem with the
newish w1_ds250x driver.

Regards,

Tony
