Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D01439C5FC
	for <lists+linux-omap@lfdr.de>; Sat,  5 Jun 2021 07:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhFEFPZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Jun 2021 01:15:25 -0400
Received: from muru.com ([72.249.23.125]:36546 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhFEFPY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 5 Jun 2021 01:15:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 01DA98167;
        Sat,  5 Jun 2021 05:13:44 +0000 (UTC)
Date:   Sat, 5 Jun 2021 08:13:34 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Regression with 6cfcd5563b4f on BeagleBoard Rev C2
Message-ID: <YLsH/l7G/LcHGcje@atomide.com>
References: <68f28473-a196-b106-b4ae-e9162b7002e6@bitmer.com>
 <YLcXicwDxue0a52/@atomide.com>
 <5037cd3e-9c4f-0028-ceef-8315d297f2bc@bitmer.com>
 <YLnJowBaoJPyZWOk@atomide.com>
 <3d73f5b4-dfb3-682e-e1dc-cf5feba69121@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d73f5b4-dfb3-682e-e1dc-cf5feba69121@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jarkko Nikula <jarkko.nikula@bitmer.com> [210604 15:41]:
> On 4.6.2021 9.35, Tony Lindgren wrote:
> > Hi,
> > 
> > * Jarkko Nikula <jarkko.nikula@bitmer.com> [210602 18:21]:
> >> Hi
> >>
> >> On 6/2/21 8:30 AM, Tony Lindgren wrote:
> >>> Sounds like the beagleboard timer errata handling is either picking
> >>> a wrong clockevent timer, or later on ti-sysc misdetects the active
> >>> timer for clockevent and idles it.
> >>>
> >>> What does dmesg say in the beginning for clockevent and clocksource
> >>> timers?
> >>>
> >> I attached logs from commit 6cfcd5563b4f and commit 30c66fc30ee7 before
> >> it. Perhaps this is relevant difference between them?
> >>
> >> +ti-sysc: probe of 49032000.target-module failed with error -16
> >> +ti-sysc: probe of 48304000.target-module failed with error -16
> > 
> > Yeah so it seems. We now attempt to ignore the system timer instances
> > while it seems we need also block idling at least for timer12 that is
> > used for the beagle timer.
> > 
> > Can you test the following patch and see if it helps?
> > 
> It works! I tested on top of both regressing commit and the most recent one:
> 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend and resume
> for am3 and am4")
> and
> f88cd3fb9df2 ("Merge tag 'vfio-v5.13-rc5' of
> git://github.com/awilliam/linux-vfio")
> 
> You may add:
> Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

OK good to hear, I'll send out a fix with a proper description.

Regards,

Tony
