Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE3E39C5F6
	for <lists+linux-omap@lfdr.de>; Sat,  5 Jun 2021 07:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhFEFNR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Jun 2021 01:13:17 -0400
Received: from muru.com ([72.249.23.125]:36538 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhFEFNR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 5 Jun 2021 01:13:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DF4388167;
        Sat,  5 Jun 2021 05:11:36 +0000 (UTC)
Date:   Sat, 5 Jun 2021 08:11:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Florian Boor <florian.boor@kernelconcepts.de>
Cc:     linux-omap@vger.kernel.org
Subject: Re: OMAP4460 cpufreq crashes
Message-ID: <YLsHfpbm8plSez2z@atomide.com>
References: <38229f0a-85e8-680f-f561-5fc59ac84c6b@kernelconcepts.de>
 <YJTUWaPWSmvwaZMb@atomide.com>
 <22081c83-0f7f-cef2-6075-79346abf6e9e@kernelconcepts.de>
 <fe821e16-7232-2324-0b4e-1a4013f30e38@kernelconcepts.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe821e16-7232-2324-0b4e-1a4013f30e38@kernelconcepts.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Florian Boor <florian.boor@kernelconcepts.de> [210604 13:31]:
> Hi,
> 
> Am 10.05.21 um 13:13 schrieb Florian Boor:
> > Am 07.05.21 um 07:47 schrieb Tony Lindgren:
> >> Hmm OK, sounds like the voltages might be wrong.
> > 
> > sounds like my guess wasn't that wrong.
> 
> I did some more research and for me it more and more looks like we are missing
> the voltage transitions on frequency change completely.
> 
> I added some debug output in omap_vp_forceupdate_scale() and
> omap_vc_bypass_scale() and enabled debug output that shows the CPU clock
> requency changes. Patch and log are attached.
> 
> The interesting stuff starts in line 123 where the first frequency change happens.
> 
> Maybe I'm missing something and looking in the wrong place, but if voltage
> really never gets adapted on some devices then in the best case the device only
> wastes power...

Yup.. Sounds like the Variscite board boots at some lower opp than
what is configured for the kernel in dts. So the immediate fix would
be to either limit the max speed, or ensure voltdm_scale() gets
called on init.

> I wonder if this affects all OMAP4460 or the Variscite one only.

This affects all omap4/5 at least as we're missing the cpufreq-dt to
voltage domain support like you pointed out. See the last effort to add
kernel support for voltage domains at [0] below for more details.

I think the way to proceed here would be initially add a regulator
usable as cpu-supply for cpufreq-dt that gets the voltdm_scale() as
a platform_data pointer and parses the device tree provides opps
for supported voltages. Then eventually the legacy platform code
for voltage domains can be moved to device drivers.

Regards,

Tony

[0] https://lore.kernel.org/lkml/1392755543-28335-1-git-send-email-nm@ti.com/
