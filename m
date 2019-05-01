Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F57810E77
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 23:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfEAVRy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 17:17:54 -0400
Received: from muru.com ([72.249.23.125]:47870 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbfEAVRy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 May 2019 17:17:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 118D9805C;
        Wed,  1 May 2019 21:18:09 +0000 (UTC)
Date:   Wed, 1 May 2019 14:17:49 -0700
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
Message-ID: <20190501211749.GN8007@atomide.com>
References: <5cc8b55c.1c69fb81.c3759.1c27@mx.google.com>
 <20190501153711.pxmapo2k3n5ynqrc@linutronix.de>
 <20190501162944.GW8004@atomide.com>
 <20190501164444.iclxlzrxofqnj4bn@linutronix.de>
 <20190501165224.GK8007@atomide.com>
 <20190501170125.xjlwdyqtp5oxx2mb@linutronix.de>
 <20190501174431.GL8007@atomide.com>
 <20190501190303.pz2yxs3hnc2qpamu@linutronix.de>
 <20190501202149.GM8007@atomide.com>
 <20190501211344.v5n7bmb2p5kksa47@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501211344.v5n7bmb2p5kksa47@linutronix.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Andrzej Siewior <bigeasy@linutronix.de> [190501 21:14]:
> On 2019-05-01 13:21:49 [-0700], Tony Lindgren wrote:
> > Hi,
> Hi,
> 
> > OK I found two issues. It seems that d_can also needs osc clock
> > on am335x. And there's no revision register for d_can.. We're now
> > reading the CTL register unnecessarily.
> > 
> > Below is what I hope fixes the boot issue for you, care to boot
> > test?
> 
> yup, that boots.

OK good to hear and thanks a lot for testing it. I'll post two
patches shortly.

Regards,

Tony
