Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D61310B9B
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 18:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfEAQw3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 12:52:29 -0400
Received: from muru.com ([72.249.23.125]:47784 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbfEAQw3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 May 2019 12:52:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A1185805C;
        Wed,  1 May 2019 16:52:44 +0000 (UTC)
Date:   Wed, 1 May 2019 09:52:24 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     "kernelci.org bot" <bot@kernelci.org>, Tejun Heo <tj@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, Thomas Gleixner <tglx@linutronix.de>,
        broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com,
        enric.balletbo@collabora.com, Ingo Molnar <mingo@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: next/master boot bisection: next-20190430 on beagle-xm
Message-ID: <20190501165224.GK8007@atomide.com>
References: <5cc8b55c.1c69fb81.c3759.1c27@mx.google.com>
 <20190501153711.pxmapo2k3n5ynqrc@linutronix.de>
 <20190501162944.GW8004@atomide.com>
 <20190501164444.iclxlzrxofqnj4bn@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501164444.iclxlzrxofqnj4bn@linutronix.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Andrzej Siewior <bigeasy@linutronix.de> [190501 16:45]:
> On 2019-05-01 09:29:44 [-0700], Tony Lindgren wrote:
> > Hi,
> > 
> > * Sebastian Andrzej Siewior <bigeasy@linutronix.de> [190501 15:37]:
> > > 
> > > On 2019-04-30 13:51:40 [-0700], kernelci.org bot wrote:
> > > > next/master boot bisection: next-20190430 on beagle-xm
> > > > 
> > > > Summary:
> > > >   Start:      f43b05fd4c17 Add linux-next specific files for 20190430
> > > >   Details:    https://kernelci.org/boot/id/5cc84d7359b514b7ab55847b
> > > >   Plain log:  https://storage.kernelci.org//next/master/next-20190430/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-7/lab-baylibre/boot-omap3-beagle-xm.txt
> > > >   HTML log:   https://storage.kernelci.org//next/master/next-20190430/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-7/lab-baylibre/boot-omap3-beagle-xm.html
> > > >   Result:     6d25be5782e4 sched/core, workqueues: Distangle worker accounting from rq lock
> > > > 
> > > > Checks:
> > > >   revert:     PASS
> > > >   verify:     PASS
> > > > 
> > > > Parameters:
> > > >   Tree:       next
> > > >   URL:        git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > >   Branch:     master
> > > >   Target:     beagle-xm
> > > >   CPU arch:   arm
> > > >   Lab:        lab-baylibre
> > > >   Compiler:   gcc-7
> > > >   Config:     multi_v7_defconfig+CONFIG_SMP=n
> > > >   Test suite: boot
> > > > 
> > > > Breaking commit found:
> > > > 
> > > > -------------------------------------------------------------------------------
> > > > commit 6d25be5782e482eb93e3de0c94d0a517879377d0
> > > > Author: Thomas Gleixner <tglx@linutronix.de>
> > > > Date:   Wed Mar 13 17:55:48 2019 +0100
> > > > 
> > > >     sched/core, workqueues: Distangle worker accounting from rq lock
> > > 
> > > According to the bootlog it just stopped its output. This commit is in
> > > next since a week or two so I don't understand why this pops up now.
> > 
> > Adding Kevin to Cc, he just confirmed on #armlinux irc that he is able to
> > reproduce this with CONFIG_SMP=n and root=/dev/ram0. I could not reproduce
> > this issue so far on omap3 with NFSroot at least.
> 
> So that problem remains even that the job for today passed?

So it seems, let's wait and see what Kevin comes up with.

> > > I just revived my BBB and I can boot that commit in question. Currently
> > > that as close as I get to a beagle-xm. 
> > > Looking at
> > > 	https://kernelci.org/boot/id/5cc9a64359b514a77f5584af/
> > > it seems that the very same board managed to boot linux-next for
> > > next-20190501.
> > > 
> > > Side note: I can't boot next-20190501 on my BBB, bisect points to commit
> > >   1a5cd7c23cc52 ("bus: ti-sysc: Enable all clocks directly during init to read revision")
> > > 
> > > any idea?
> > 
> > Oh interesting thanks for letting me know. Next boots fine for me here
> > with NFSroot on BBB.
> > 
> > Do you have some output on what happens so I can investigate?
> 
> Nope, the console remains dark.

OK. Can you please email me your .config and the kernel cmdline you're
using? I'll try to reproduce that one here.

Regards,

Tony
