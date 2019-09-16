Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB5CCB3FF4
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 20:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389616AbfIPSEX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 14:04:23 -0400
Received: from muru.com ([72.249.23.125]:33438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726872AbfIPSEX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Sep 2019 14:04:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A2F3880EA;
        Mon, 16 Sep 2019 18:04:52 +0000 (UTC)
Date:   Mon, 16 Sep 2019 11:04:18 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 6/6] ARM: dts: Configure rstctrl reset for SGX
Message-ID: <20190916180418.GH52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <20190814131408.57162-7-tony@atomide.com>
 <92652315-A763-485F-A4FA-CB868016E045@goldelico.com>
 <20190916151730.GZ52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916151730.GZ52127@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tony Lindgren <tony@atomide.com> [190916 15:18]:
> * H. Nikolaus Schaller <hns@goldelico.com> [190913 09:50]:
> > Hi Tony,
> > 
> > > Am 14.08.2019 um 15:14 schrieb Tony Lindgren <tony@atomide.com>:
> > > 
> > > The following can be tested via sysfs with the following to ensure the SGX
> > > module gets enabled and disabled properly:
> > > 
> > > # echo on > /sys/bus/platform/devices/5600fe00.target-module/power/control
> > > # rwmem 0x5600fe00		# revision register
> > > 0x5600fe00 = 0x40000000
> > > # echo auto > /sys/bus/platform/devices/5600fe00.target-module/power/control
> > > # rwmem 0x5000fe00
> > > Bus error
> > > 
> > > Note that this patch depends on the PRM rstctrl driver that has
> > > been recently posted.
> > 
> > Do you have a list of these patches or a git for pulling the complete set
> > of changes? Does it depend on mainline or linux-next?
> 
> You need the drivers/bus/ti-sysc.c changes from Linux next,
> and the most recent clkctrl and rstctrl patches posted by
> Tero.
> 
> > I tried to find the correct patches but it does not seem to work for
> > me on beaglebone.
> 
> OK can you please check the dependencies again and let me know
> if you still have issues?

To make things easier to test, I pushed out a test branch with
all the pending dependencies :)

It's basically v5.3 + ti-sysc changes in Linux next, and
the following patches posted by Tero:

[PATCHv5 00/10] soc: ti: add OMAP PRM driver (for reset)
[PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
[PATCH 00/10] ARM: dts: omap changes for IOMMU / reset support

And then finally the $subject patch applied on top, and the
tests above still work for me.

The test branch is test-pending-ti-sysc-clkctrl-rstctrl-v5.3
at [0] and [1] below.

Can you please test and see if that works for you?

Regards,

Tony

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git test-pending-ti-sysc-clkctrl-rstctrl-v5.3
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=test-pending-ti-sysc-clkctrl-rstctrl-v5.3



