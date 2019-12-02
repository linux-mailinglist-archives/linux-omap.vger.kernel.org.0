Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037CC10F244
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2019 22:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfLBVje (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Dec 2019 16:39:34 -0500
Received: from muru.com ([72.249.23.125]:43968 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfLBVjd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 2 Dec 2019 16:39:33 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3E5C880FC;
        Mon,  2 Dec 2019 21:40:10 +0000 (UTC)
Date:   Mon, 2 Dec 2019 13:39:29 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken
 omap2_set_init_voltage()
Message-ID: <20191202213929.GB35479@atomide.com>
References: <20190924233222.52757-1-tony@atomide.com>
 <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* H. Nikolaus Schaller <hns@goldelico.com> [191202 21:10]:
> > Am 25.09.2019 um 01:32 schrieb Tony Lindgren <tony@atomide.com>:
> > Guys, please check and ack if we can really do this to get rid of some
> > pointless dmesg -l3 errors without affecting the ongoing cpufreq and
> > voltage work.
> 
> unfortunately we did not yet test in combination with the 1GHz OPP
> patches for omap3630 (queued for v5.5-rc1) and it appears that this
> patch breaks the 1GHz OPP.
> 
> The symptom is that it works fine on a dm3730 with 800MHz rating
> but results in spurious kernel panics, stack corruption, virtual memory
> failures, OneNAND DMA timeouts etc. on a dm3730 with 1GHz speed grade.

Hmm yeah OK, I was a bit worried about this breaking something.

> We can also re-add the "turbo-mode" tags in the omap36xx.dtsi (or
> remove the 1GHz OPP) and can then boot with 800MHz max. clock. But
> enabling boost (echo 1 >/sys/devices/system/cpu/cpufreq/boost) makes
> the problem and its symptoms appear almost immediately.
> 
> After some scratching our heads we found that v5.3.7 is still good and
> v5.3.8 is bad. A bisect of our tree (which includes the 1GHz OPP) did
> point to this patch whichwas apparently already backported to v5.3.8 and
> v5.4.
> 
> So I assume that the code removed here enabled or initialized something
> we need for safe 1GHz transitions. Maybe the ABB-LDO. Or it looks up the
> vdd regulator and initializes it earlier than without this code. Maybe
> it also (pre-)initializes some clk which could now be left uninitialized
> too long?

It was just doing voltdm_lookup() and clk_get_rate() and then failed
dev_pm_opp_find_freq_ceil(), but I don't see what these might affect..

> Note that seeing the log message indicates that voltdm_scale() and
> dev_pm_opp_get_voltage() are not called, but all functions before could
> be with side-effects.

Yes that is strange. There's no clk_prepare() before we proceed to
call clk_get_rate() either, not sure if that matter here though.

> v5.5-rc1 will likely fail right from the beginning (only on 1GHz rated
> omap36xx) because it makes the combination of this patch and 1GHz OPP
> public (linux-next should already fail but it appears that nobody has
> tested).

OK

> Any ideas how to fix? Before I try to do a revert and then add goto exit;
> after each function call and see which ones are essential for 1GHz.

If you have things reproducable, care to try to narrow the issue down
a bit by trying see which parts of the old omap2_set_init_voltage()
fix the issue?

The issue should be there somewhere in the few lines of code before
dev_pm_opp_find_freq_ceil(), right?

It would be good to understand what's going on before reverting or
fixing things condering that a revert would add back code that has
it's own errors and fails to init :)

Another thing to check is if the dev instance is actually the right
one we had in omap2_set_init_voltage() vs the dts dev instance as
we use that with dev_pm_opp_find_freq_ceil().

Regards,

Tony
