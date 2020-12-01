Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BD82C9844
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgLAHii (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:38:38 -0500
Received: from muru.com ([72.249.23.125]:49634 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbgLAHii (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 02:38:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4362680A9;
        Tue,  1 Dec 2020 07:38:04 +0000 (UTC)
Date:   Tue, 1 Dec 2020 09:37:53 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Shah <dave@ds0.me>, Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: Understanding OMAP5 DPLL_ABE and CM_CLKSEL_WKUPAON
Message-ID: <20201201073753.GV26857@atomide.com>
References: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me>
 <20200727082833.GB2811@atomide.com>
 <ac19052a552660c86838709f071cffe0f3e65932.camel@ds0.me>
 <20200728084257.GF2811@atomide.com>
 <B66CD988-7339-44C2-B750-9FA2088D86FA@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B66CD988-7339-44C2-B750-9FA2088D86FA@goldelico.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [201123 20:11]:
> Hi David and Tony,
> 
> > Am 28.07.2020 um 10:42 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > * David Shah <dave@ds0.me> [200727 08:58]:
> >> On Mon, 2020-07-27 at 01:28 -0700, Tony Lindgren wrote:
> >>> If it only needs to be configured to 1 for reboot, sounds like it
> >>> should
> >>> be set in omap44xx_restart(). And we should also set it to 1 for
> >>> omap4
> >>> too.
> >> 
> >> omap44xx_restart doesn't seem like the right place to me, as the bug
> >> also affects hard resets (i.e. NRESWARM assertion) and it would be nice
> >> to have these working, too.
> > 
> > Ah right, the device reboots fine, but the rebooted kernel
> > won't initialize properly.
> > 
> >> Would a better solution be to set it early during startup (the first
> >> part of clock init), and then clear it when the DPLLs are set up and
> >> locked?
> > 
> > Yes sounds like then the place to configure this is in the
> > drivers/clk/ti/clk-54xx.c omap5xxx_dt_clk_init(). Maybe add
> > a comment to the patch description that a similar patch may
> > be also needed for omap4 on some devices.
> 
> It seems as if the conclusion was that the patch is at the right
> location omap5xxx_dt_clk_init(). Has it been merged somewhere?
> 
> It seems as if we still need it in our 5.10-rc series:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=commit;h=aa8eda144e8faa185e154710ca0eef12adb2d29d

I recall Dave needs to resend it to the clock maintainers as
listed with scripts/get_maintainer.pl -f option.

Regards,

Tony
